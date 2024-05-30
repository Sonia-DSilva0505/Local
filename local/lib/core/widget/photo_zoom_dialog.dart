// import 'package:flutter/material.dart';
// import 'package:photo_view/photo_view.dart';
// import 'package:photo_view/photo_view_gallery.dart';

// class ZoomableImageDialog extends StatelessWidget {
//   final List<String> imageUrls;
//   final int initialIndex;

//   const ZoomableImageDialog(
//       {super.key, required this.imageUrls, required this.initialIndex});

//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//       insetPadding: EdgeInsets.zero,
//       child: Stack(
//         children: [
//           SizedBox(
//             width: double.infinity,
//             height: double.infinity,
//             child: PhotoViewGallery.builder(
//               scrollPhysics: const BouncingScrollPhysics(),
//               builder: (BuildContext context, int index) {
//                 return PhotoViewGalleryPageOptions(
//                   imageProvider: NetworkImage(Api.buildImagePath(
//                       imageUrls[index],
//                       imageType: ImageType.product
//                       )
//                       ),
//                   minScale: PhotoViewComputedScale.contained,
//                   maxScale: PhotoViewComputedScale.covered * 2,
//                 );
//               },
//               itemCount: imageUrls.length,
//               backgroundDecoration: const BoxDecoration(
//                 color: Colors.black,
//               ),
//               pageController: PageController(initialPage: initialIndex),
//             ),
//           ),
//           Positioned(
//             top: 10.0,
//             right: 10.0,
//             child: IconButton(
//               icon: const Icon(Icons.close, color: Colors.white),
//               onPressed: () {
//                 Navigator.of(context).pop(); 
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// void showZoomableImageDialog(
//     BuildContext context, List<String> imageUrls, int initialIndex) {
//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return ZoomableImageDialog(
//           imageUrls: imageUrls, initialIndex: initialIndex);
//     },
//   );
// }
