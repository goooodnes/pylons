import 'dart:async';
import 'dart:isolate';
import 'dart:ui';

import 'package:detectable_text_field/detector/sample_regular_expressions.dart';
import 'package:detectable_text_field/widgets/detectable_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:pylons_wallet/main_prod.dart';
import 'package:pylons_wallet/model/nft.dart';
import 'package:pylons_wallet/pages/detailed_asset_view/owner_view_view_model.dart';
import 'package:pylons_wallet/pages/detailed_asset_view/widgets/for_sale_bottom_sheet.dart';
import 'package:pylons_wallet/pages/detailed_asset_view/widgets/nft_3d_asset.dart';
import 'package:pylons_wallet/pages/detailed_asset_view/widgets/nft_image_asset.dart';
import 'package:pylons_wallet/pages/detailed_asset_view/widgets/nft_not_for_sale_dialog.dart';
import 'package:pylons_wallet/pages/detailed_asset_view/widgets/owner_audio_widget.dart';
import 'package:pylons_wallet/pages/detailed_asset_view/widgets/owner_video_player_screen.dart';
import 'package:pylons_wallet/pages/detailed_asset_view/widgets/owner_video_progress_widget.dart';
import 'package:pylons_wallet/pages/detailed_asset_view/widgets/pdf_viewer.dart';
import 'package:pylons_wallet/pages/detailed_asset_view/widgets/tab_fields.dart';
import 'package:pylons_wallet/pages/detailed_asset_view/widgets/toggle_button.dart';
import 'package:pylons_wallet/pages/gestures_for_detail_screen.dart';
import 'package:pylons_wallet/pages/home/currency_screen/model/ibc_coins.dart';
import 'package:pylons_wallet/pages/settings/screens/submit_feedback.dart';
import 'package:pylons_wallet/utils/clipper_utils.dart';
import 'package:pylons_wallet/utils/constants.dart';
import 'package:pylons_wallet/utils/enums.dart' as enums;
import 'package:pylons_wallet/utils/enums.dart';
import 'package:pylons_wallet/utils/image_util.dart';
import 'package:pylons_wallet/utils/read_more.dart';
import 'package:pylons_wallet/utils/svg_util.dart';

import '../../generated/locale_keys.g.dart';

class OwnerView extends StatefulWidget {
  final NFT nft;

  const OwnerView({required this.nft, Key? key}) : super(key: key);

  @override
  State<OwnerView> createState() => _OwnerViewState();
}

class _OwnerViewState extends State<OwnerView> {
  OwnerViewViewModel ownerViewViewModel = GetIt.I.get();

  @override
  void initState() {
    super.initState();

    ownerViewViewModel.nft = widget.nft;

    ownerViewViewModel.logEvent();
    scheduleMicrotask(() {
      ownerViewViewModel.initializeData();
    });
    FlutterDownloader.registerCallback(downloadCallback, step: 1);
  }

  @pragma('vm:entry-point')
  static void downloadCallback(String id, DownloadTaskStatus status, int progress) {
    final SendPort? send = IsolateNameServer.lookupPortByName('downloader_send_port');
    send?.send([id, status, progress]);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        ownerViewViewModel.destroyPlayers();
        return true;
      },
      child: ChangeNotifierProvider.value(
        value: ownerViewViewModel,
        builder: (_, __) => Scaffold(
          backgroundColor: AppColors.kBlack,
          body: const OwnerViewContent(),
        ),
      ),
    );
  }
}

class OwnerViewContent extends StatefulWidget {
  const OwnerViewContent({Key? key}) : super(key: key);

  @override
  State<OwnerViewContent> createState() => _OwnerViewContentState();
}

class _OwnerViewContentState extends State<OwnerViewContent> {
  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<OwnerViewViewModel>();
    return GesturesForDetailsScreen(
      key: const ValueKey(kOwnerViewKeyValue),
      screen: DetailScreen.ownerScreen,
      viewModel: viewModel,
      nft: viewModel.nft,
      child: Stack(
        children: [
          getTypeWidget(),
          if (isUserNotViewingFullNft(viewModel))
            Padding(
              padding: EdgeInsets.only(left: 8, right: 8, bottom: 8, top: MediaQuery.of(context).viewPadding.top),
              child: SizedBox(
                height: 100.h,
                width: double.infinity,
                child: ListTile(
                  leading: GestureDetector(
                    onTap: () async {
                      viewModel.destroyPlayers();
                      Navigator.pop(context);
                    },
                    child: SvgPicture.asset(
                      SVGUtil.OWNER_BACK_ICON,
                      height: 25.h,
                    ),
                  ),
                  trailing: GestureDetector(
                    onTap: () {
                      final SubmitFeedback submitFeedbackDialog = SubmitFeedback(context: context);
                      submitFeedbackDialog.show();
                    },
                    child: SvgPicture.asset(
                      SVGUtil.OWNER_REPORT,
                      height: 25.h,
                    ),
                  ),
                ),
              ),
            ),
          if (isUserNotViewingFullNft(viewModel))
            const Align(
              key: ValueKey(kOwnerViewDrawerKeyValue),
              alignment: Alignment.bottomCenter,
              child: OwnerBottomDrawer(),
            )
        ],
      ),
    );
  }

  Widget getAudioWidget({required String thumbnailUrl}) {
    final viewModel = context.read<OwnerViewViewModel>();
    return thumbnailUrl.isEmpty
        ? Image.asset(
            ImageUtil.AUDIO_BACKGROUND,
            fit: BoxFit.contain,
            height: MediaQuery.of(context).size.height,
          )
        : NftImageWidget(
            url: viewModel.nft.thumbnailUrl,
            opacity: viewModel.isViewingFullNft ? 0.0 : 0.4,
          );
  }

  Widget getTypeWidget() {
    final viewModel = context.read<OwnerViewViewModel>();
    switch (viewModel.nft.assetType) {
      case AssetType.Audio:
        return getAudioWidget(thumbnailUrl: viewModel.nft.thumbnailUrl);
      case AssetType.Image:
        return NftImageWidget(url: viewModel.nft.url, opacity: viewModel.isViewingFullNft ? 0.0 : 0.4);
      case AssetType.Video:
        return OwnerVideoPlayerScreen(nft: viewModel.nft);
      case AssetType.Pdf:
        return PdfViewer(
          fileUrl: viewModel.nft.url,
        );
      case AssetType.ThreeD:
        return Container(
          color: Colors.grey.shade200,
          height: double.infinity,
          child: Nft3dWidget(
            url: viewModel.nft.url,
            cameraControls: true,
            backgroundColor: AppColors.kBlack,
            showLoader: true,
          ),
        );

      default:
        return NftImageWidget(
          url: viewModel.nft.url,
          opacity: viewModel.isViewingFullNft ? 0.0 : 0.4,
        );
    }
  }

  bool isUserNotViewingFullNft(OwnerViewViewModel viewModel) => !viewModel.isViewingFullNft;
}

class OwnerBottomDrawer extends StatefulWidget {
  const OwnerBottomDrawer({Key? key}) : super(key: key);

  @override
  State<OwnerBottomDrawer> createState() => _OwnerBottomDrawerState();
}

class _OwnerBottomDrawerState extends State<OwnerBottomDrawer> {
  bool liked = false;

  Widget getProgressWidget() {
    final viewModel = context.read<OwnerViewViewModel>();
    switch (viewModel.nft.assetType) {
      case AssetType.Audio:
        return OwnerAudioWidget(url: viewModel.nft.url);
      case AssetType.Image:
        break;
      case AssetType.Video:
        return OwnerVideoProgressWidget(url: viewModel.nft.url);

      default:
        return const SizedBox.shrink();
    }
    return const SizedBox.shrink();
  }

  Widget getLikingLoader() {
    return SizedBox(
      height: 20.h,
      width: 20.h,
      child: CircularProgressIndicator(
        strokeWidth: 2,
        valueColor: AlwaysStoppedAnimation<Color>(AppColors.kWhite),
      ),
    );
  }

  Widget getLikeIcon({required bool likedByMe}) {
    return Image.asset(
      'assets/images/icons/${likedByMe ? 'like_full' : 'like'}.png',
      height: 20.h,
      color: likedByMe ? AppColors.kDarkRed : Colors.white,
    );
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<OwnerViewViewModel>();

    return AnimatedContainer(
      duration: const Duration(milliseconds: 100),
      decoration: const BoxDecoration(color: Colors.transparent),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (viewModel.collapsed) ...[
            Padding(
              padding: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 16.w, top: 8.w),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _title(
                          nft: viewModel.nft,
                          owner: viewModel.nft.type == NftType.TYPE_RECIPE ? viewModel.nft.creator : viewModel.nft.owner,
                        ),
                        SizedBox(
                          height: 18.h,
                        ),
                        Row(
                          children: [
                            getSaleToggle(viewModel: viewModel, context: context),
                            getPriceWidget(viewModel: viewModel),
                          ],
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        getProgressWidget(),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      SvgPicture.asset(
                        SVGUtil.OWNER_VIEWS,
                        width: 20.w,
                        height: 15.w,
                      ),
                      SizedBox(
                        width: 4.5.w,
                      ),
                      Text(
                        viewModel.viewsCount.toString(),
                        style: TextStyle(color: Colors.white, fontSize: 11.sp, fontFamily: kUniversalFontFamily, fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: 5.w,
                      ),
                      buildLikeColumn(viewModel: viewModel),
                      SizedBox(
                        height: 18.w,
                      ),
                      GestureDetector(
                        key: const Key(kShareNftButtonCollapsedKey),
                        onTap: () async {
                          final Size size = MediaQuery.of(context).size;
                          context.read<OwnerViewViewModel>().shareNFTLink(size: size);
                        },
                        child: Container(
                          padding: EdgeInsets.only(bottom: 12.h),
                          child: SvgPicture.asset(
                            SVGUtil.OWNER_SHARE,
                            height: 15.h,
                            width: 15.w,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 8.w,
                      ),
                      GestureDetector(
                        onTap: () async {
                          viewModel.onDownloadButtonPressed();
                        },
                        child: Container(
                          padding: EdgeInsets.only(bottom: 12.h),
                          child: SvgPicture.asset(
                            SVGUtil.DOWNLOAD_NFT_ICON,
                            height: 15.h,
                            width: 15.w,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                      IconButton(
                        key: const Key(kKeyboardUpButtonKeyValue),
                        icon: Icon(
                          Icons.keyboard_arrow_up,
                          size: 28.h,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          viewModel.toChangeCollapse();
                        },
                      )
                    ],
                  ),
                ],
              ),
            )
          ] else ...[
            Stack(
              key: const ValueKey(kOwnerViewBottomSheetKeyValue),
              children: [
                ClipPath(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      color: Colors.black54,
                      padding: const EdgeInsets.all(32.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _title(
                            nft: viewModel.nft,
                            owner: viewModel.nft.type == NftType.TYPE_RECIPE ? LocaleKeys.you.tr() : viewModel.nft.creator,
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          if (viewModel.nft.assetType == AssetType.Audio) ...[
                            Container(
                              width: 250.w,
                              color: AppColors.kWhite.withOpacity(0.2),
                              child: OwnerAudioWidget(url: viewModel.nft.url),
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                          ],
                          if (viewModel.nft.assetType == AssetType.Video) ...[
                            Container(
                              width: 250.w,
                              color: AppColors.kWhite.withOpacity(0.2),
                              child: OwnerVideoProgressWidget(url: viewModel.nft.url),
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                          ],
                          if (viewModel.nft.hashtags.isNotEmpty)
                            Wrap(
                              spacing: 10.w,
                              children: List.generate(
                                viewModel.hashtagList.length,
                                (index) => SizedBox(
                                  child: DetectableText(
                                    text: "#${viewModel.hashtagList[index]}",
                                    detectionRegExp: detectionRegExp()!,
                                    detectedStyle: TextStyle(
                                      fontSize: 12.sp,
                                      color: AppColors.kCopyColor,
                                    ),
                                    basicStyle: TextStyle(
                                      fontSize: 20.sp,
                                    ),
                                    onTap: (tappedText) {},
                                  ),
                                ),
                              ),
                            ),
                          SizedBox(
                            height: 10.h,
                          ),
                          ReadMoreText(
                            viewModel.nft.description,
                            trimExpandedText: LocaleKeys.collapse.tr(),
                            trimCollapsedText: LocaleKeys.read_more.tr(),
                            moreStyle: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500, color: AppColors.kCopyColor),
                            lessStyle: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500, color: AppColors.kCopyColor),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 85,
                                  child: Column(
                                    children: [
                                      TabField(
                                        name: LocaleKeys.ownership.tr(),
                                        icon: 'trophy',
                                        nft: viewModel.nft,
                                        owner: viewModel.owner,
                                        nftOwnershipHistoryList: const [],
                                        isExpanded: viewModel.isOwnershipExpanded,
                                        onChangeTab: viewModel.onChangeTab,
                                      ),
                                      SizedBox(height: 10.h),
                                      TabField(
                                        name: LocaleKeys.nft_detail.tr(),
                                        icon: 'detail',
                                        nft: viewModel.nft,
                                        owner: viewModel.owner,
                                        nftOwnershipHistoryList: const [],
                                        isExpanded: viewModel.isDetailsExpanded,
                                        onChangeTab: viewModel.onChangeTab,
                                      ),
                                      SizedBox(height: 10.h),
                                      if (viewModel.nft.type != NftType.TYPE_RECIPE)
                                        TabField(
                                          name: LocaleKeys.history.tr(),
                                          icon: 'history',
                                          nft: viewModel.nft,
                                          owner: viewModel.nft.owner,
                                          nftOwnershipHistoryList: viewModel.nftOwnershipHistoryList,
                                          isExpanded: viewModel.isHistoryExpanded,
                                          onChangeTab: viewModel.onChangeTab,
                                        ),
                                      SizedBox(height: 50.h),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 15,
                                  child: Column(
                                    children: [
                                      SvgPicture.asset(
                                        SVGUtil.OWNER_VIEWS,
                                        width: 15.w,
                                        height: 15.h,
                                      ),
                                      SizedBox(
                                        height: 4.5.h,
                                      ),
                                      Text(
                                        viewModel.viewsCount.toString(),
                                        style: TextStyle(color: Colors.white, fontSize: 11.sp, fontFamily: kUniversalFontFamily, fontWeight: FontWeight.w700),
                                      ),
                                      SizedBox(
                                        height: 18.h,
                                      ),
                                      GestureDetector(
                                        onTap: () async {
                                          await viewModel.updateLikeStatus(recipeId: viewModel.nft.recipeID, cookBookID: viewModel.nft.cookbookID);
                                        },
                                        child: viewModel.isLiking ? getLikingLoader() : getLikeIcon(likedByMe: viewModel.likedByMe),
                                      ),
                                      SizedBox(
                                        height: 5.h,
                                      ),
                                      Text(
                                        viewModel.likesCount.toString(),
                                        style: TextStyle(color: Colors.white, fontSize: 10.sp),
                                      ),
                                      SizedBox(
                                        height: 20.h,
                                      ),
                                      GestureDetector(
                                        onTap: () async {
                                          final Size size = MediaQuery.of(context).size;
                                          context.read<OwnerViewViewModel>().shareNFTLink(size: size);
                                        },
                                        child: SvgPicture.asset(
                                          SVGUtil.OWNER_SHARE,
                                          height: 15.h,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              getSaleToggle(viewModel: viewModel, context: context),
                              getPriceWidget(viewModel: viewModel),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: ClipPath(
                    clipper: RightTriangleClipper(orientation: enums.Orientation.Orientation_SW),
                    child: Container(
                      color: AppColors.kDarkRed,
                      height: 50.h,
                      width: 50.w,
                      child: IconButton(
                        alignment: Alignment.topRight,
                        padding: EdgeInsets.only(
                          bottom: 8.h,
                          left: 8.w,
                        ),
                        icon: const Icon(Icons.keyboard_arrow_down_outlined),
                        onPressed: () {
                          viewModel.toChangeCollapse();
                        },
                        iconSize: 32.h,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ]
        ],
      ),
    );
  }

  Column buildLikeColumn({required OwnerViewViewModel viewModel}) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 16.h),
          child: GestureDetector(
            onTap: () async {
              await viewModel.updateLikeStatus(recipeId: viewModel.nft.recipeID, cookBookID: viewModel.nft.cookbookID);
            },
            child: viewModel.isLiking ? getLikingLoader() : getLikeIcon(likedByMe: viewModel.likedByMe),
          ),
        ),
        SizedBox(
          height: 2.8.h,
        ),
        Text(
          viewModel.likesCount.toString(),
          style: TextStyle(color: Colors.white, fontSize: 11.sp, fontFamily: kUniversalFontFamily, fontWeight: FontWeight.w700),
        ),
      ],
    );
  }

  Widget _title({required NFT nft, required String owner}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Flexible(
              child: Text(
                nft.name,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 20.sp,
                  fontFamily: kUniversalFontFamily,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            if (nft.type == NftType.TYPE_RECIPE)
              Padding(
                padding: EdgeInsets.only(
                  bottom: 2.h,
                ),
                child: Text(
                  ' (${nft.amountMinted} of ${nft.quantity})',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 12.sp),
                ),
              ),
          ],
        ),
        SizedBox(
          height: 3.h,
        ),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: LocaleKeys.created_by.tr(),
                style: TextStyle(color: Colors.white, fontSize: 13.sp),
              ),
              TextSpan(text: owner, style: TextStyle(color: AppColors.kCopyColor, fontSize: 13.sp)),
              WidgetSpan(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: SvgPicture.asset(
                    SVGUtil.OWNER_VERIFIED_ICON,
                    height: 12.h,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget getSaleToggle({required OwnerViewViewModel viewModel, required BuildContext context}) {
    return GestureDetector(
      key: const Key(kSaleStatusToggleButtonKey),
      onTap: () {
        if (viewModel.nft.isEnabled) {
          viewModel.onChangeStatusNotForSale();
          final dialog = NFTNotForSaleDialog(
            buildContext: context,
            ownerViewViewModel: viewModel,
          );
          dialog.show();
        } else {
          viewModel.onChangeStatusNotForSale();
          ForSaleBottomSheet(
            ownerViewViewModel: viewModel,
            context: context,
          ).show();
        }
      },
      child: SizedBox(
        height: isTablet?40.h:30.h,
        width: 100.w,
        child: Stack(
          children: [
            SvgPicture.asset(getNFTToggleIcon(viewModel: viewModel),height:isTablet? 40.h:30.h,),
            if (viewModel.isNFTToggleIntermediateState)
              const SizedBox(
                key: Key(kIntermediateToggleButtonKey),
              )
            else if (viewModel.nft.isEnabled)
              Row(
                key: const Key(kForSaleToggleWidgetKey),
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 3.w),
                      child: Text(
                        LocaleKeys.for_sale.tr(),
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 8.sp, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top:isTablet?5.h:0,right: isTablet?24.w:16.w),
                    child: SizedBox(
                      height: 30.h,
                      width: 30.w,
                      child: SvgPicture.asset(
                        SVGUtil.GREEN_BOTTOM_LEFT_CURVED_CONTAINER,
                        alignment: Alignment.centerRight,
                      ),
                    ),
                  ),
                ],
              )
            else
              Row(
                key: const Key(kNotForSaleToggleWidgetKey),
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: isTablet?4.w:5.w,top:isTablet?5.h:0),
                    child: SizedBox(
                      height: 30.h,
                      width: 30.w,
                      child: SvgPicture.asset(
                        SVGUtil.RED_BOTTOM_RIGHT_CURVED_CONTAINER,
                        alignment: Alignment.centerLeft,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 3.w),
                      child: Text(
                        LocaleKeys.not_for_sale.tr(),
                        textAlign: TextAlign.start,
                        style: TextStyle(color: Colors.white, fontSize: 7.sp, fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ],
              )
          ],
        ),
      ),
    );
  }

  Widget getPriceWidget({required OwnerViewViewModel viewModel}) {
    return viewModel.nft.isEnabled && !viewModel.isNFTToggleIntermediateState && viewModel.nft.price.isNotEmpty && double.parse(viewModel.nft.price) > 0
        ? ClipPath(
            clipper: ToggleClipper(),
            child: Container(
              width: 100.w,
              height: 30.h,
              alignment: Alignment.center,
              decoration: BoxDecoration(color: AppColors.kGreyColor),
              padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  RichText(
                    text: TextSpan(
                      text: "\$${viewModel.nft.ibcCoins.getCoinWithProperDenomination(viewModel.nft.price)}",
                      style: TextStyle(color: AppColors.kWhite, fontSize: 10.sp, fontFamily: kUniversalFontFamily, fontWeight: FontWeight.w700),
                      children: [
                        TextSpan(
                          text: " ${LocaleKeys.ea.tr()}.",
                          style: TextStyle(color: AppColors.kWhite, fontSize: 10.sp, fontFamily: kUniversalFontFamily, fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                  ),
                  Text(
                    "${viewModel.nft.quantity - viewModel.nft.amountMinted} ${LocaleKeys.available.tr()}",
                    style: TextStyle(color: AppColors.kGreyLight, fontSize: 9.sp, fontWeight: FontWeight.normal, fontFamily: kUniversalFontFamily),
                  ),
                ],
              ),
            ),
          )
        : const SizedBox();
  }

  String getNFTToggleIcon({required OwnerViewViewModel viewModel}) {
    if (viewModel.isNFTToggleIntermediateState) {
      return SVGUtil.NFT_TOGGLE_INTERMEDIATE_STATE;
    } else if (viewModel.nft.isEnabled) {
      return SVGUtil.FOR_SALE_BORDER;
    } else {
      return SVGUtil.NOT_FOR_SALE_BORDER;
    }
  }
}
