// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:shimmer/shimmer.dart';


// class CustomCachedNetworkImage extends StatelessWidget {
//   final String? imagePath;
//   final double? width;
//   final double? height;

//   const CustomCachedNetworkImage({
//     required this.imagePath,
//     this.height,
//     this.width,
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return CachedNetworkImage(
//       width: width,
//       height: height,
//       imageUrl: imagePath ?? '',
//       imageBuilder: (context, imageProvider) =>
//           _buildImageContainer(imageProvider),
//       placeholder: (context, url) => _buildPlaceholder(),
//       errorWidget: (context, url, error) => _errorWidget(),
//     );
//   }

//   Widget _buildImageContainer(ImageProvider imageProvider) {
//     return FadeInImage(
//       image: imageProvider,
//       width: width,
//       height: height,
//       fit: BoxFit.contain,
//       placeholder: _assetImage,
//     );
//   }

//   Widget _buildPlaceholder() {
//     return Shimmer.fromColors(
//       baseColor: Colors.grey[200]!,
//       highlightColor: Colors.grey[100]!,
//       child: Container(
//         width: width,
//         height: height,
//         color: Colors.white,
//       ),
//     );
//   }

//   Widget _errorWidget() {
//     return Container(
//       height: height,
//       width: width,
//       decoration: BoxDecoration(
//         image: DecorationImage(fit: BoxFit.cover, image: _assetImage),
//       ),
//     );
//   }

//   final _assetImage = const AssetImage('assets/placeholder_image.png');
// }
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:shimmer/shimmer.dart';

import '../constant/image_resources.dart';

class CustomCachedNetworkImage extends StatefulWidget {
  final String imagePath;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final bool isSlider;

  const CustomCachedNetworkImage({
    required this.imagePath,
    this.height,
    this.width,
    this.fit = BoxFit.cover,
    this.isSlider = false,
    super.key,
  });

  @override
  State<CustomCachedNetworkImage> createState() =>
      _CustomCachedNetworkImageState();
}

class _CustomCachedNetworkImageState extends State<CustomCachedNetworkImage> {
  final ValueNotifier<bool> _hasBeenLoadedNotifier = ValueNotifier(false);

  @override
  void dispose() {
    _hasBeenLoadedNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.isSlider ? _buildImage() : VisibilityDetector(
      key: Key('visibility-${widget.imagePath.hashCode}'),
      onVisibilityChanged: (VisibilityInfo info) {
        if (!_hasBeenLoadedNotifier.value && info.visibleFraction > 0) {
          _hasBeenLoadedNotifier.value = true;
        }
      },
      child: ValueListenableBuilder<bool>(
        valueListenable: _hasBeenLoadedNotifier,
        builder: (context, value, child) {
          return value ? _buildImage() : const SizedBox.shrink();
        },
      ),
    );
  }

 
  Widget _buildImage() {
    return CachedNetworkImage(
      width: widget.width,
      height: widget.height,
      imageUrl: widget.imagePath,
      fit: widget.fit,
      placeholder: (context, url) => _buildPlaceholder(),
      errorWidget: (context, url, error) => Container(
        height: widget.height,
        width: widget.width,
        decoration:  const BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                ImageResource.placeHolderNetwork,
              )),
        ),
      ),
    );
  }

  Widget _buildPlaceholder() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        width: widget.width,
        height: widget.height,
        color: Colors.grey[200],
      ),
    );
  }
}
