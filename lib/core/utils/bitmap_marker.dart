// import 'dart:ui' as ui;
//
// import 'package:flutter/services.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
//
// class BitmapMarker {
//   const BitmapMarker._();
//
//   static Future<Uint8List> loadIcon(String icon) async {
//     ByteData data = await rootBundle.load(icon);
//     return data.buffer.asUint8List();
//   }
//
//   static Future<BitmapDescriptor> resizeAndCreateMarker(
//       Uint8List bytes, int width, int height) async {
//     ui.Codec codec = await ui.instantiateImageCodec(bytes,
//         targetWidth: width, targetHeight: height);
//     ui.FrameInfo fi = await codec.getNextFrame();
//     final ByteData? byteData =
//         await fi.image.toByteData(format: ui.ImageByteFormat.png);
//     final Uint8List resizedBytes = byteData!.buffer.asUint8List();
//     return BitmapDescriptor.fromBytes(resizedBytes);
//   }
// }
