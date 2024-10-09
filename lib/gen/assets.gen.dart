/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/animal_protection.png
  AssetGenImage get animalProtection =>
      const AssetGenImage('assets/icons/animal_protection.png');

  /// File path: assets/icons/bush1.png
  AssetGenImage get bush1 => const AssetGenImage('assets/icons/bush1.png');

  /// File path: assets/icons/earth.png
  AssetGenImage get earth => const AssetGenImage('assets/icons/earth.png');

  /// File path: assets/icons/heart.png
  AssetGenImage get heart => const AssetGenImage('assets/icons/heart.png');

  /// File path: assets/icons/icon_launcher.jpg
  AssetGenImage get iconLauncher =>
      const AssetGenImage('assets/icons/icon_launcher.jpg');

  /// File path: assets/icons/logo.png
  AssetGenImage get logo => const AssetGenImage('assets/icons/logo.png');

  /// File path: assets/icons/subIconpng.png
  AssetGenImage get subIconpng =>
      const AssetGenImage('assets/icons/subIconpng.png');

  /// List of all assets
  List<AssetGenImage> get values =>
      [animalProtection, bush1, earth, heart, iconLauncher, logo, subIconpng];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/crop_data.png
  AssetGenImage get cropData =>
      const AssetGenImage('assets/images/crop_data.png');

  /// File path: assets/images/infomation.png
  AssetGenImage get infomation =>
      const AssetGenImage('assets/images/infomation.png');

  /// File path: assets/images/sumenh1.png
  AssetGenImage get sumenh1 => const AssetGenImage('assets/images/sumenh1.png');

  /// File path: assets/images/sumenh2.png
  AssetGenImage get sumenh2 => const AssetGenImage('assets/images/sumenh2.png');

  /// File path: assets/images/tamnhin1.png
  AssetGenImage get tamnhin1 =>
      const AssetGenImage('assets/images/tamnhin1.png');

  /// File path: assets/images/tamnhin2.png
  AssetGenImage get tamnhin2 =>
      const AssetGenImage('assets/images/tamnhin2.png');

  /// File path: assets/images/web-about-detail-bgr.png
  AssetGenImage get webAboutDetailBgr =>
      const AssetGenImage('assets/images/web-about-detail-bgr.png');

  /// File path: assets/images/webhome.png
  AssetGenImage get webhome => const AssetGenImage('assets/images/webhome.png');

  /// File path: assets/images/welcome.png
  AssetGenImage get welcome => const AssetGenImage('assets/images/welcome.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        cropData,
        infomation,
        sumenh1,
        sumenh2,
        tamnhin1,
        tamnhin2,
        webAboutDetailBgr,
        webhome,
        welcome
      ];
}

class $AssetsJsonGen {
  const $AssetsJsonGen();

  /// File path: assets/json/earth.json
  String get earth => 'assets/json/earth.json';

  /// File path: assets/json/hand_heart.json
  String get handHeart => 'assets/json/hand_heart.json';

  /// File path: assets/json/tree.json
  String get tree => 'assets/json/tree.json';

  /// File path: assets/json/tree1.json
  String get tree1 => 'assets/json/tree1.json';

  /// List of all assets
  List<String> get values => [earth, handHeart, tree, tree1];
}

class Assets {
  Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsJsonGen json = $AssetsJsonGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
