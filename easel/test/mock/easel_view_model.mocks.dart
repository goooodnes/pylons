// Mocks generated by Mockito 5.3.2 from annotations
// in easel_flutter/test/widget/save_as_draft_button_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i16;
import 'dart:io' as _i13;
import 'dart:ui' as _i18;

import 'package:easel_flutter/easel_provider.dart' as _i14;
import 'package:easel_flutter/models/denom.dart' as _i11;
import 'package:easel_flutter/models/nft.dart' as _i9;
import 'package:easel_flutter/models/nft_format.dart' as _i10;
import 'package:easel_flutter/models/upload_progress.dart' as _i17;
import 'package:easel_flutter/repository/repository.dart' as _i5;
import 'package:easel_flutter/services/third_party_services/audio_player_helper.dart'
    as _i3;
import 'package:easel_flutter/services/third_party_services/video_player_helper.dart'
    as _i2;
import 'package:easel_flutter/utils/enums.dart' as _i19;
import 'package:easel_flutter/utils/file_utils_helper.dart' as _i4;
import 'package:easel_flutter/widgets/audio_widget.dart' as _i15;
import 'package:flutter/material.dart' as _i7;
import 'package:media_info/media_info.dart' as _i6;
import 'package:mockito/mockito.dart' as _i1;
import 'package:pylons_sdk/low_level.dart' as _i12;
import 'package:video_player/video_player.dart' as _i8;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeVideoPlayerHelper_0 extends _i1.SmartFake
    implements _i2.VideoPlayerHelper {
  _FakeVideoPlayerHelper_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeAudioPlayerHelper_1 extends _i1.SmartFake
    implements _i3.AudioPlayerHelper {
  _FakeAudioPlayerHelper_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeFileUtilsHelper_2 extends _i1.SmartFake
    implements _i4.FileUtilsHelper {
  _FakeFileUtilsHelper_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeRepository_3 extends _i1.SmartFake implements _i5.Repository {
  _FakeRepository_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeMediaInfo_4 extends _i1.SmartFake implements _i6.MediaInfo {
  _FakeMediaInfo_4(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeTextEditingController_5 extends _i1.SmartFake
    implements _i7.TextEditingController {
  _FakeTextEditingController_5(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeVideoPlayerController_6 extends _i1.SmartFake
    implements _i8.VideoPlayerController {
  _FakeVideoPlayerController_6(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeValueNotifier_7<T> extends _i1.SmartFake
    implements _i7.ValueNotifier<T> {
  _FakeValueNotifier_7(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeNFT_8 extends _i1.SmartFake implements _i9.NFT {
  _FakeNFT_8(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeNftFormat_9 extends _i1.SmartFake implements _i10.NftFormat {
  _FakeNftFormat_9(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeDenom_10 extends _i1.SmartFake implements _i11.Denom {
  _FakeDenom_10(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeIntWeightRange_11 extends _i1.SmartFake
    implements _i12.IntWeightRange {
  _FakeIntWeightRange_11(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeSDKIPCResponse_12<T> extends _i1.SmartFake
    implements _i12.SDKIPCResponse<T> {
  _FakeSDKIPCResponse_12(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeFile_13 extends _i1.SmartFake implements _i13.File {
  _FakeFile_13(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [EaselProvider].
///
/// See the documentation for Mockito's code generation for more information.
class MockEaselProvider extends _i1.Mock implements _i14.EaselProvider {
  MockEaselProvider() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.VideoPlayerHelper get videoPlayerHelper => (super.noSuchMethod(
        Invocation.getter(#videoPlayerHelper),
        returnValue: _FakeVideoPlayerHelper_0(
          this,
          Invocation.getter(#videoPlayerHelper),
        ),
      ) as _i2.VideoPlayerHelper);
  @override
  _i3.AudioPlayerHelper get audioPlayerHelperForFile => (super.noSuchMethod(
        Invocation.getter(#audioPlayerHelperForFile),
        returnValue: _FakeAudioPlayerHelper_1(
          this,
          Invocation.getter(#audioPlayerHelperForFile),
        ),
      ) as _i3.AudioPlayerHelper);
  @override
  _i3.AudioPlayerHelper get audioPlayerHelperForUrl => (super.noSuchMethod(
        Invocation.getter(#audioPlayerHelperForUrl),
        returnValue: _FakeAudioPlayerHelper_1(
          this,
          Invocation.getter(#audioPlayerHelperForUrl),
        ),
      ) as _i3.AudioPlayerHelper);
  @override
  _i4.FileUtilsHelper get fileUtilsHelper => (super.noSuchMethod(
        Invocation.getter(#fileUtilsHelper),
        returnValue: _FakeFileUtilsHelper_2(
          this,
          Invocation.getter(#fileUtilsHelper),
        ),
      ) as _i4.FileUtilsHelper);
  @override
  _i5.Repository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeRepository_3(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i5.Repository);
  @override
  _i6.MediaInfo get mediaInfo => (super.noSuchMethod(
        Invocation.getter(#mediaInfo),
        returnValue: _FakeMediaInfo_4(
          this,
          Invocation.getter(#mediaInfo),
        ),
      ) as _i6.MediaInfo);
  @override
  bool get stripeAccountExists => (super.noSuchMethod(
        Invocation.getter(#stripeAccountExists),
        returnValue: false,
      ) as bool);
  @override
  set stripeAccountExists(bool? _stripeAccountExists) => super.noSuchMethod(
        Invocation.setter(
          #stripeAccountExists,
          _stripeAccountExists,
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i9.FreeDrop get isFreeDrop => (super.noSuchMethod(
        Invocation.getter(#isFreeDrop),
        returnValue: _i9.FreeDrop.yes,
      ) as _i9.FreeDrop);
  @override
  set isFreeDrop(_i9.FreeDrop? _isFreeDrop) => super.noSuchMethod(
        Invocation.setter(
          #isFreeDrop,
          _isFreeDrop,
        ),
        returnValueForMissingStub: null,
      );
  @override
  List<_i11.Denom> get supportedDenomList => (super.noSuchMethod(
        Invocation.getter(#supportedDenomList),
        returnValue: <_i11.Denom>[],
      ) as List<_i11.Denom>);
  @override
  set supportedDenomList(List<_i11.Denom>? _supportedDenomList) =>
      super.noSuchMethod(
        Invocation.setter(
          #supportedDenomList,
          _supportedDenomList,
        ),
        returnValueForMissingStub: null,
      );
  @override
  bool get willLoadFirstTime => (super.noSuchMethod(
        Invocation.getter(#willLoadFirstTime),
        returnValue: false,
      ) as bool);
  @override
  set willLoadFirstTime(bool? _willLoadFirstTime) => super.noSuchMethod(
        Invocation.setter(
          #willLoadFirstTime,
          _willLoadFirstTime,
        ),
        returnValueForMissingStub: null,
      );
  @override
  bool get collapsed => (super.noSuchMethod(
        Invocation.getter(#collapsed),
        returnValue: false,
      ) as bool);
  @override
  set collapsed(bool? _collapsed) => super.noSuchMethod(
        Invocation.setter(
          #collapsed,
          _collapsed,
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i7.TextEditingController get artistNameController => (super.noSuchMethod(
        Invocation.getter(#artistNameController),
        returnValue: _FakeTextEditingController_5(
          this,
          Invocation.getter(#artistNameController),
        ),
      ) as _i7.TextEditingController);
  @override
  set artistNameController(_i7.TextEditingController? _artistNameController) =>
      super.noSuchMethod(
        Invocation.setter(
          #artistNameController,
          _artistNameController,
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i7.TextEditingController get artNameController => (super.noSuchMethod(
        Invocation.getter(#artNameController),
        returnValue: _FakeTextEditingController_5(
          this,
          Invocation.getter(#artNameController),
        ),
      ) as _i7.TextEditingController);
  @override
  set artNameController(_i7.TextEditingController? _artNameController) =>
      super.noSuchMethod(
        Invocation.setter(
          #artNameController,
          _artNameController,
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i7.TextEditingController get descriptionController => (super.noSuchMethod(
        Invocation.getter(#descriptionController),
        returnValue: _FakeTextEditingController_5(
          this,
          Invocation.getter(#descriptionController),
        ),
      ) as _i7.TextEditingController);
  @override
  set descriptionController(
          _i7.TextEditingController? _descriptionController) =>
      super.noSuchMethod(
        Invocation.setter(
          #descriptionController,
          _descriptionController,
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i7.TextEditingController get noOfEditionController => (super.noSuchMethod(
        Invocation.getter(#noOfEditionController),
        returnValue: _FakeTextEditingController_5(
          this,
          Invocation.getter(#noOfEditionController),
        ),
      ) as _i7.TextEditingController);
  @override
  set noOfEditionController(
          _i7.TextEditingController? _noOfEditionController) =>
      super.noSuchMethod(
        Invocation.setter(
          #noOfEditionController,
          _noOfEditionController,
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i7.TextEditingController get priceController => (super.noSuchMethod(
        Invocation.getter(#priceController),
        returnValue: _FakeTextEditingController_5(
          this,
          Invocation.getter(#priceController),
        ),
      ) as _i7.TextEditingController);
  @override
  set priceController(_i7.TextEditingController? _priceController) =>
      super.noSuchMethod(
        Invocation.setter(
          #priceController,
          _priceController,
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i7.TextEditingController get royaltyController => (super.noSuchMethod(
        Invocation.getter(#royaltyController),
        returnValue: _FakeTextEditingController_5(
          this,
          Invocation.getter(#royaltyController),
        ),
      ) as _i7.TextEditingController);
  @override
  set royaltyController(_i7.TextEditingController? _royaltyController) =>
      super.noSuchMethod(
        Invocation.setter(
          #royaltyController,
          _royaltyController,
        ),
        returnValueForMissingStub: null,
      );
  @override
  List<String> get hashtagsList => (super.noSuchMethod(
        Invocation.getter(#hashtagsList),
        returnValue: <String>[],
      ) as List<String>);
  @override
  set hashtagsList(List<String>? _hashtagsList) => super.noSuchMethod(
        Invocation.setter(
          #hashtagsList,
          _hashtagsList,
        ),
        returnValueForMissingStub: null,
      );
  @override
  String get currentUsername => (super.noSuchMethod(
        Invocation.getter(#currentUsername),
        returnValue: '',
      ) as String);
  @override
  set currentUsername(String? _currentUsername) => super.noSuchMethod(
        Invocation.setter(
          #currentUsername,
          _currentUsername,
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i8.VideoPlayerController get videoPlayerController => (super.noSuchMethod(
        Invocation.getter(#videoPlayerController),
        returnValue: _FakeVideoPlayerController_6(
          this,
          Invocation.getter(#videoPlayerController),
        ),
      ) as _i8.VideoPlayerController);
  @override
  set videoPlayerController(
          _i8.VideoPlayerController? _videoPlayerController) =>
      super.noSuchMethod(
        Invocation.setter(
          #videoPlayerController,
          _videoPlayerController,
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i7.ValueNotifier<_i15.ProgressBarState> get audioProgressNotifier =>
      (super.noSuchMethod(
        Invocation.getter(#audioProgressNotifier),
        returnValue: _FakeValueNotifier_7<_i15.ProgressBarState>(
          this,
          Invocation.getter(#audioProgressNotifier),
        ),
      ) as _i7.ValueNotifier<_i15.ProgressBarState>);
  @override
  set audioProgressNotifier(
          _i7.ValueNotifier<_i15.ProgressBarState>? _audioProgressNotifier) =>
      super.noSuchMethod(
        Invocation.setter(
          #audioProgressNotifier,
          _audioProgressNotifier,
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i7.ValueNotifier<_i14.ButtonState> get buttonNotifier => (super.noSuchMethod(
        Invocation.getter(#buttonNotifier),
        returnValue: _FakeValueNotifier_7<_i14.ButtonState>(
          this,
          Invocation.getter(#buttonNotifier),
        ),
      ) as _i7.ValueNotifier<_i14.ButtonState>);
  @override
  set buttonNotifier(_i7.ValueNotifier<_i14.ButtonState>? _buttonNotifier) =>
      super.noSuchMethod(
        Invocation.setter(
          #buttonNotifier,
          _buttonNotifier,
        ),
        returnValueForMissingStub: null,
      );
  @override
  bool get isPylonsInstalled => (super.noSuchMethod(
        Invocation.getter(#isPylonsInstalled),
        returnValue: false,
      ) as bool);
  @override
  set isPylonsInstalled(bool? _isPylonsInstalled) => super.noSuchMethod(
        Invocation.setter(
          #isPylonsInstalled,
          _isPylonsInstalled,
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i9.NFT get nft => (super.noSuchMethod(
        Invocation.getter(#nft),
        returnValue: _FakeNFT_8(
          this,
          Invocation.getter(#nft),
        ),
      ) as _i9.NFT);
  @override
  set nft(_i9.NFT? _nft) => super.noSuchMethod(
        Invocation.setter(
          #nft,
          _nft,
        ),
        returnValueForMissingStub: null,
      );
  @override
  bool get isUrlLoaded => (super.noSuchMethod(
        Invocation.getter(#isUrlLoaded),
        returnValue: false,
      ) as bool);
  @override
  set isUrlLoaded(bool? _isUrlLoaded) => super.noSuchMethod(
        Invocation.setter(
          #isUrlLoaded,
          _isUrlLoaded,
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i9.NFT get publishedNFTClicked => (super.noSuchMethod(
        Invocation.getter(#publishedNFTClicked),
        returnValue: _FakeNFT_8(
          this,
          Invocation.getter(#publishedNFTClicked),
        ),
      ) as _i9.NFT);
  @override
  _i16.Stream<_i17.UploadProgress> get uploadProgressStream =>
      (super.noSuchMethod(
        Invocation.getter(#uploadProgressStream),
        returnValue: _i16.Stream<_i17.UploadProgress>.empty(),
      ) as _i16.Stream<_i17.UploadProgress>);
  @override
  String get publishedNFTDuration => (super.noSuchMethod(
        Invocation.getter(#publishedNFTDuration),
        returnValue: '',
      ) as String);
  @override
  _i10.NftFormat get nftFormat => (super.noSuchMethod(
        Invocation.getter(#nftFormat),
        returnValue: _FakeNftFormat_9(
          this,
          Invocation.getter(#nftFormat),
        ),
      ) as _i10.NftFormat);
  @override
  String get fileName => (super.noSuchMethod(
        Invocation.getter(#fileName),
        returnValue: '',
      ) as String);
  @override
  String get fileExtension => (super.noSuchMethod(
        Invocation.getter(#fileExtension),
        returnValue: '',
      ) as String);
  @override
  String get fileSize => (super.noSuchMethod(
        Invocation.getter(#fileSize),
        returnValue: '',
      ) as String);
  @override
  int get fileHeight => (super.noSuchMethod(
        Invocation.getter(#fileHeight),
        returnValue: 0,
      ) as int);
  @override
  int get fileDuration => (super.noSuchMethod(
        Invocation.getter(#fileDuration),
        returnValue: 0,
      ) as int);
  @override
  int get fileWidth => (super.noSuchMethod(
        Invocation.getter(#fileWidth),
        returnValue: 0,
      ) as int);
  @override
  _i11.Denom get selectedDenom => (super.noSuchMethod(
        Invocation.getter(#selectedDenom),
        returnValue: _FakeDenom_10(
          this,
          Invocation.getter(#selectedDenom),
        ),
      ) as _i11.Denom);
  @override
  String get recipeId => (super.noSuchMethod(
        Invocation.getter(#recipeId),
        returnValue: '',
      ) as String);
  @override
  bool get isInitializedForFile => (super.noSuchMethod(
        Invocation.getter(#isInitializedForFile),
        returnValue: false,
      ) as bool);
  @override
  bool get isInitializedForNetwork => (super.noSuchMethod(
        Invocation.getter(#isInitializedForNetwork),
        returnValue: false,
      ) as bool);
  @override
  set setIsInitialized(bool? value) => super.noSuchMethod(
        Invocation.setter(
          #setIsInitialized,
          value,
        ),
        returnValueForMissingStub: null,
      );
  @override
  set setIsInitializedUrl(bool? value) => super.noSuchMethod(
        Invocation.setter(
          #setIsInitializedUrl,
          value,
        ),
        returnValueForMissingStub: null,
      );
  @override
  bool get isVideoLoading => (super.noSuchMethod(
        Invocation.getter(#isVideoLoading),
        returnValue: false,
      ) as bool);
  @override
  set isVideoLoading(bool? value) => super.noSuchMethod(
        Invocation.setter(
          #isVideoLoading,
          value,
        ),
        returnValueForMissingStub: null,
      );
  @override
  String get videoLoadingError => (super.noSuchMethod(
        Invocation.getter(#videoLoadingError),
        returnValue: '',
      ) as String);
  @override
  set videoLoadingError(String? value) => super.noSuchMethod(
        Invocation.setter(
          #videoLoadingError,
          value,
        ),
        returnValueForMissingStub: null,
      );
  @override
  bool get hasListeners => (super.noSuchMethod(
        Invocation.getter(#hasListeners),
        returnValue: false,
      ) as bool);
  @override
  void setPublishedNFTClicked(_i9.NFT? nft) => super.noSuchMethod(
        Invocation.method(
          #setPublishedNFTClicked,
          [nft],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void setPublishedNFTDuration(String? duration) => super.noSuchMethod(
        Invocation.method(
          #setPublishedNFTDuration,
          [duration],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void setVideoThumbnail(_i13.File? file) => super.noSuchMethod(
        Invocation.method(
          #setVideoThumbnail,
          [file],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void setPdfThumbnail(_i13.File? file) => super.noSuchMethod(
        Invocation.method(
          #setPdfThumbnail,
          [file],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void initStore() => super.noSuchMethod(
        Invocation.method(
          #initStore,
          [],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void toChangeCollapse() => super.noSuchMethod(
        Invocation.method(
          #toChangeCollapse,
          [],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void initializeTextEditingControllerWithEmptyValues() => super.noSuchMethod(
        Invocation.method(
          #initializeTextEditingControllerWithEmptyValues,
          [],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void setTextFieldValuesDescription({
    String? artName,
    String? description,
    String? hashtags,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #setTextFieldValuesDescription,
          [],
          {
            #artName: artName,
            #description: description,
            #hashtags: hashtags,
          },
        ),
        returnValueForMissingStub: null,
      );
  @override
  void setTextFieldValuesPrice({
    String? royalties,
    String? price,
    String? edition,
    String? denom,
    _i9.FreeDrop? freeDrop,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #setTextFieldValuesPrice,
          [],
          {
            #royalties: royalties,
            #price: price,
            #edition: edition,
            #denom: denom,
            #freeDrop: freeDrop,
          },
        ),
        returnValueForMissingStub: null,
      );
  @override
  void updateIsFreeDropStatus(_i9.FreeDrop? val) => super.noSuchMethod(
        Invocation.method(
          #updateIsFreeDropStatus,
          [val],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void stopVideoIfPlaying() => super.noSuchMethod(
        Invocation.method(
          #stopVideoIfPlaying,
          [],
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i16.Future<void> setFormat(
    _i7.BuildContext? context,
    _i10.NftFormat? format,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #setFormat,
          [
            context,
            format,
          ],
        ),
        returnValue: _i16.Future<void>.value(),
        returnValueForMissingStub: _i16.Future<void>.value(),
      ) as _i16.Future<void>);
  @override
  _i16.Future<_i10.NftFormat?> resolveNftFormat(
    _i7.BuildContext? context,
    String? ext,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #resolveNftFormat,
          [
            context,
            ext,
          ],
        ),
        returnValue: _i16.Future<_i10.NftFormat?>.value(),
      ) as _i16.Future<_i10.NftFormat?>);
  @override
  _i16.Future<void> initializeVideoPlayerWithFile() => (super.noSuchMethod(
        Invocation.method(
          #initializeVideoPlayerWithFile,
          [],
        ),
        returnValue: _i16.Future<void>.value(),
        returnValueForMissingStub: _i16.Future<void>.value(),
      ) as _i16.Future<void>);
  @override
  void delayLoading() => super.noSuchMethod(
        Invocation.method(
          #delayLoading,
          [],
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i16.Future<void> initializeVideoPlayerWithUrl(
          {required String? publishedNftUrl}) =>
      (super.noSuchMethod(
        Invocation.method(
          #initializeVideoPlayerWithUrl,
          [],
          {#publishedNftUrl: publishedNftUrl},
        ),
        returnValue: _i16.Future<void>.value(),
        returnValueForMissingStub: _i16.Future<void>.value(),
      ) as _i16.Future<void>);
  @override
  void playVideo() => super.noSuchMethod(
        Invocation.method(
          #playVideo,
          [],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void pauseVideo() => super.noSuchMethod(
        Invocation.method(
          #pauseVideo,
          [],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void seekVideo(Duration? position) => super.noSuchMethod(
        Invocation.method(
          #seekVideo,
          [position],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void disposeVideoController() => super.noSuchMethod(
        Invocation.method(
          #disposeVideoController,
          [],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void setAudioThumbnail(_i13.File? file) => super.noSuchMethod(
        Invocation.method(
          #setAudioThumbnail,
          [file],
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i16.Future<dynamic> initializeAudioPlayer(
          {required String? publishedNFTUrl}) =>
      (super.noSuchMethod(
        Invocation.method(
          #initializeAudioPlayer,
          [],
          {#publishedNFTUrl: publishedNFTUrl},
        ),
        returnValue: _i16.Future<dynamic>.value(),
      ) as _i16.Future<dynamic>);
  @override
  void playAudio({required bool? forFile}) => super.noSuchMethod(
        Invocation.method(
          #playAudio,
          [],
          {#forFile: forFile},
        ),
        returnValueForMissingStub: null,
      );
  @override
  void pauseAudio({required bool? forFile}) => super.noSuchMethod(
        Invocation.method(
          #pauseAudio,
          [],
          {#forFile: forFile},
        ),
        returnValueForMissingStub: null,
      );
  @override
  void seekAudio(
    Duration? position, {
    required bool? forFile,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #seekAudio,
          [position],
          {#forFile: forFile},
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i16.Future<void> disposeAudioController() => (super.noSuchMethod(
        Invocation.method(
          #disposeAudioController,
          [],
        ),
        returnValue: _i16.Future<void>.value(),
        returnValueForMissingStub: _i16.Future<void>.value(),
      ) as _i16.Future<void>);
  @override
  void initializePlayers({required _i9.NFT? publishedNFT}) =>
      super.noSuchMethod(
        Invocation.method(
          #initializePlayers,
          [],
          {#publishedNFT: publishedNFT},
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i16.Future<void> populateUserName() => (super.noSuchMethod(
        Invocation.method(
          #populateUserName,
          [],
        ),
        returnValue: _i16.Future<void>.value(),
        returnValueForMissingStub: _i16.Future<void>.value(),
      ) as _i16.Future<void>);
  @override
  _i16.Future<void> setFile({
    required String? filePath,
    required String? fileName,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #setFile,
          [],
          {
            #filePath: filePath,
            #fileName: fileName,
          },
        ),
        returnValue: _i16.Future<void>.value(),
        returnValueForMissingStub: _i16.Future<void>.value(),
      ) as _i16.Future<void>);
  @override
  void setSelectedDenom(_i11.Denom? value) => super.noSuchMethod(
        Invocation.method(
          #setSelectedDenom,
          [value],
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i16.Future<bool> createCookbook() => (super.noSuchMethod(
        Invocation.method(
          #createCookbook,
          [],
        ),
        returnValue: _i16.Future<bool>.value(false),
      ) as _i16.Future<bool>);
  @override
  void saveArtistName(String? name) => super.noSuchMethod(
        Invocation.method(
          #saveArtistName,
          [name],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void toCheckSavedArtistName() => super.noSuchMethod(
        Invocation.method(
          #toCheckSavedArtistName,
          [],
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i16.Future<bool> isWalletInstalled() => (super.noSuchMethod(
        Invocation.method(
          #isWalletInstalled,
          [],
        ),
        returnValue: _i16.Future<bool>.value(false),
      ) as _i16.Future<bool>);
  @override
  _i16.Future<bool> verifyPylonsAndMint({required _i9.NFT? nft}) =>
      (super.noSuchMethod(
        Invocation.method(
          #verifyPylonsAndMint,
          [],
          {#nft: nft},
        ),
        returnValue: _i16.Future<bool>.value(false),
      ) as _i16.Future<bool>);
  @override
  bool showStripeDialog() => (super.noSuchMethod(
        Invocation.method(
          #showStripeDialog,
          [],
        ),
        returnValue: false,
      ) as bool);
  @override
  _i16.Future<bool> createRecipe({required _i9.NFT? nft}) =>
      (super.noSuchMethod(
        Invocation.method(
          #createRecipe,
          [],
          {#nft: nft},
        ),
        returnValue: _i16.Future<bool>.value(false),
      ) as _i16.Future<bool>);
  @override
  _i12.IntWeightRange buildIntWeightRange({
    required String? upperRange,
    required String? lowerRange,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #buildIntWeightRange,
          [],
          {
            #upperRange: upperRange,
            #lowerRange: lowerRange,
          },
        ),
        returnValue: _FakeIntWeightRange_11(
          this,
          Invocation.method(
            #buildIntWeightRange,
            [],
            {
              #upperRange: upperRange,
              #lowerRange: lowerRange,
            },
          ),
        ),
      ) as _i12.IntWeightRange);
  @override
  bool isDifferentUserName(String? savedUserName) => (super.noSuchMethod(
        Invocation.method(
          #isDifferentUserName,
          [savedUserName],
        ),
        returnValue: false,
      ) as bool);
  @override
  _i16.Future<void> shareNFT(_i18.Size? size) => (super.noSuchMethod(
        Invocation.method(
          #shareNFT,
          [size],
        ),
        returnValue: _i16.Future<void>.value(),
        returnValueForMissingStub: _i16.Future<void>.value(),
      ) as _i16.Future<void>);
  @override
  _i16.Future<void> onVideoThumbnailPicked() => (super.noSuchMethod(
        Invocation.method(
          #onVideoThumbnailPicked,
          [],
        ),
        returnValue: _i16.Future<void>.value(),
        returnValueForMissingStub: _i16.Future<void>.value(),
      ) as _i16.Future<void>);
  @override
  _i16.Future<void> onPdfThumbnailPicked() => (super.noSuchMethod(
        Invocation.method(
          #onPdfThumbnailPicked,
          [],
        ),
        returnValue: _i16.Future<void>.value(),
        returnValueForMissingStub: _i16.Future<void>.value(),
      ) as _i16.Future<void>);
  @override
  void populateCoinsIfPylonsNotExists() => super.noSuchMethod(
        Invocation.method(
          #populateCoinsIfPylonsNotExists,
          [],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void dispose() => super.noSuchMethod(
        Invocation.method(
          #dispose,
          [],
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i16.Future<_i12.SDKIPCResponse<_i12.Profile>> getProfile() =>
      (super.noSuchMethod(
        Invocation.method(
          #getProfile,
          [],
        ),
        returnValue: _i16.Future<_i12.SDKIPCResponse<_i12.Profile>>.value(
            _FakeSDKIPCResponse_12<_i12.Profile>(
          this,
          Invocation.method(
            #getProfile,
            [],
          ),
        )),
      ) as _i16.Future<_i12.SDKIPCResponse<_i12.Profile>>);
  @override
  _i16.Future<dynamic> initializeAudioPlayerForFile(
          {required _i13.File? file}) =>
      (super.noSuchMethod(
        Invocation.method(
          #initializeAudioPlayerForFile,
          [],
          {#file: file},
        ),
        returnValue: _i16.Future<dynamic>.value(),
      ) as _i16.Future<dynamic>);
  @override
  _i13.File getThumbnailType(_i10.NFTTypes? format) => (super.noSuchMethod(
        Invocation.method(
          #getThumbnailType,
          [format],
        ),
        returnValue: _FakeFile_13(
          this,
          Invocation.method(
            #getThumbnailType,
            [format],
          ),
        ),
      ) as _i13.File);
  @override
  bool isThumbnailPresent() => (super.noSuchMethod(
        Invocation.method(
          #isThumbnailPresent,
          [],
        ),
        returnValue: false,
      ) as bool);
  @override
  _i16.Future<bool> saveNftLocally(_i19.UploadStep? step) =>
      (super.noSuchMethod(
        Invocation.method(
          #saveNftLocally,
          [step],
        ),
        returnValue: _i16.Future<bool>.value(false),
      ) as _i16.Future<bool>);
  @override
  _i16.Future<bool> updateNftFromDescription(int? id) => (super.noSuchMethod(
        Invocation.method(
          #updateNftFromDescription,
          [id],
        ),
        returnValue: _i16.Future<bool>.value(false),
      ) as _i16.Future<bool>);
  @override
  _i16.Future<bool> updateNftFromPrice(int? id) => (super.noSuchMethod(
        Invocation.method(
          #updateNftFromPrice,
          [id],
        ),
        returnValue: _i16.Future<bool>.value(false),
      ) as _i16.Future<bool>);
  @override
  _i16.Future<void> deleteNft(int? id) => (super.noSuchMethod(
        Invocation.method(
          #deleteNft,
          [id],
        ),
        returnValue: _i16.Future<void>.value(),
        returnValueForMissingStub: _i16.Future<void>.value(),
      ) as _i16.Future<void>);
  @override
  void toHashtagList(String? hashtag) => super.noSuchMethod(
        Invocation.method(
          #toHashtagList,
          [hashtag],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void disposePlayers({required String? assetType}) => super.noSuchMethod(
        Invocation.method(
          #disposePlayers,
          [],
          {#assetType: assetType},
        ),
        returnValueForMissingStub: null,
      );
  @override
  void setLog({required String? screenName}) => super.noSuchMethod(
        Invocation.method(
          #setLog,
          [],
          {#screenName: screenName},
        ),
        returnValueForMissingStub: null,
      );
  @override
  void addListener(_i18.VoidCallback? listener) => super.noSuchMethod(
        Invocation.method(
          #addListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void removeListener(_i18.VoidCallback? listener) => super.noSuchMethod(
        Invocation.method(
          #removeListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void notifyListeners() => super.noSuchMethod(
        Invocation.method(
          #notifyListeners,
          [],
        ),
        returnValueForMissingStub: null,
      );
}