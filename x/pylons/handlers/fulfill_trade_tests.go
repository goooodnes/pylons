package handlers

import (
	"encoding/json"
	"testing"

	"github.com/Pylons-tech/pylons/x/pylons/config"
	"github.com/Pylons-tech/pylons/x/pylons/keep"
	"github.com/Pylons-tech/pylons/x/pylons/msgs"
	"github.com/Pylons-tech/pylons/x/pylons/types"

	sdk "github.com/cosmos/cosmos-sdk/types"
	"github.com/stretchr/testify/require"
)

// TestHandlerMsgFulfillTrade is fulfill trade test
func TestHandlerMsgFulfillTrade(t *testing.T) {
	tci := keep.SetupTestCoinInput()
	sender, sender2 := keep.SetupTestAccounts(t, tci, types.NewPylon(100000))

	_, err := tci.Bk.AddCoins(tci.Ctx, sender2, types.NewPylon(100000))
	require.True(t, err == nil)

	cbData := CreateCBResponse{}

	cookbookMsg := msgs.NewMsgCreateCookbook("cookbook-0001", "", "this has to meet character limits", "SketchyCo", "1.0.0", "example@example.com", 1, msgs.DefaultCostPerBlock, sender)
	cookbookResult, _ := HandlerMsgCreateCookbook(tci.Ctx, tci.PlnK, cookbookMsg)
	err = json.Unmarshal(cookbookResult.Data, &cbData)
	require.True(t, err == nil)
	require.True(t, len(cbData.CookbookID) > 0)

	item := keep.GenItem(cbData.CookbookID, sender, "Raichu")
	err = tci.PlnK.SetItem(tci.Ctx, *item)
	require.True(t, err == nil)

	item2 := keep.GenItem(cbData.CookbookID, sender2, "Pichu")
	err = tci.PlnK.SetItem(tci.Ctx, *item2)
	require.True(t, err == nil)

	cases := map[string]struct {
		sender                sdk.AccAddress
		inputCoinList         types.CoinInputList
		inputItemList         types.ItemInputList
		outputCoinList        sdk.Coins
		outputItemList        types.ItemList
		desiredError          string
		showError             bool
		pylonsLLCDistribution int64
	}{
		"trade pylon distribution test": {
			sender:                sender,
			inputCoinList:         types.GenCoinInputList(types.Pylon, 100),
			outputCoinList:        sdk.Coins{sdk.NewInt64Coin("chair", 10)},
			desiredError:          "",
			showError:             false,
			pylonsLLCDistribution: 10,
		},
	}
	for testName, tc := range cases {
		t.Run(testName, func(t *testing.T) {
			ctMsg := msgs.NewMsgCreateTrade(tc.inputCoinList, tc.inputItemList, tc.outputCoinList, tc.outputItemList, "", tc.sender)
			ctResult, err := HandlerMsgCreateTrade(tci.Ctx, tci.PlnK, ctMsg)
			require.True(t, err == nil)
			ctRespData := CreateTradeResponse{}
			err = json.Unmarshal(ctResult.Data, &ctRespData)
			require.True(t, err == nil)
			require.True(t, len(ctRespData.TradeID) > 0)
			ffMsg := msgs.NewMsgFulfillTrade(ctRespData.TradeID, tc.sender, []string{})
			ffResult, err := HandlerMsgFulfillTrade(tci.Ctx, tci.PlnK, ffMsg)
			if !tc.showError {
				require.True(t, err == nil)
				ffRespData := FulfillTradeResp{}
				err = json.Unmarshal(ffResult.Data, &ffRespData)
				require.True(t, err == nil)
				require.True(t, ffRespData.Status == "Success")
				require.True(t, ffRespData.Message == "successfully fulfilled the trade")
				pylonsLLCAddress, err := sdk.AccAddressFromBech32(config.Config.Validators.PylonsLLC)
				require.True(t, err == nil)
				pylonAvailOnLLC := tci.PlnK.CoinKeeper.HasCoins(tci.Ctx, pylonsLLCAddress, sdk.Coins{sdk.NewInt64Coin(types.Pylon, tc.pylonsLLCDistribution)})
				require.True(t, pylonAvailOnLLC)
			}
		})
	}
}
