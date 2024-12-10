// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:pdf/pdf.dart';
// import 'package:pdf/widgets.dart' as pw;
// import 'package:pdf/widgets.dart';
// import 'package:printing/printing.dart';
//
// import '../../feature/feature.dart';
// import '../core.dart';
//
// class PdfGenerator {
//   const PdfGenerator._();
//
//   static Future<void> generatePdf(List<GeoLocationModel> data) async {
//     const int maxEntriesPerPage = 100;
//     final font = await PdfGoogleFonts.openSansRegular();
//
//     final pdf = pw.Document();
//
//     final totalPages = (data.length / maxEntriesPerPage).ceil();
//
//     try {
//       for (int pageIndex = 0; pageIndex < totalPages; pageIndex++) {
//         final start = pageIndex * maxEntriesPerPage;
//         final end = start + maxEntriesPerPage;
//         final chunk =
//             data.sublist(start, end > data.length ? data.length : end);
//
//         pdf.addPage(
//           pw.MultiPage(
//             theme: pw.ThemeData.withFont(base: font),
//             build: (pw.Context context) {
//               return [
//                 pw.Column(
//                   crossAxisAlignment: pw.CrossAxisAlignment.start,
//                   children: [
//                     pw.Text('User Location Report',
//                         style: const pw.TextStyle(fontSize: 24)),
//                     pw.SizedBox(height: 20),
//                     ...chunk.map((item) {
//                       return pw.Column(
//                         crossAxisAlignment: pw.CrossAxisAlignment.start,
//                         children: [
//                           pw.Row(children: [
//                             pw.Text('User ID:'),
//                             pw.SizedBox(width: 6),
//                             pw.Text('${item.userId}',
//                                 style: pw.TextStyle(
//                                     fontWeight: pw.FontWeight.bold)),
//                           ]),
//                           pw.Row(children: [
//                             pw.Text('Latitude:'),
//                             pw.SizedBox(width: 6),
//                             pw.Text('${item.latitude}',
//                                 style: pw.TextStyle(
//                                     fontWeight: pw.FontWeight.bold)),
//                           ]),
//                           pw.Row(children: [
//                             pw.Text('Longitude:'),
//                             pw.SizedBox(width: 6),
//                             pw.Text('${item.longitude}',
//                                 style: pw.TextStyle(
//                                     fontWeight: pw.FontWeight.bold)),
//                           ]),
//                           pw.Row(children: [
//                             pw.Text('Address:'),
//                             pw.SizedBox(width: 6),
//                             pw.Text('${item.geoAddress}',
//                                 style: pw.TextStyle(
//                                     fontWeight: pw.FontWeight.bold)),
//                           ]),
//                           pw.SizedBox(height: 10),
//                           pw.Divider(),
//                         ],
//                       );
//                     }).toList(),
//                   ],
//                 ),
//               ];
//             },
//           ),
//         );
//       }
//
//       await Printing.layoutPdf(
//         onLayout: (PdfPageFormat format) async => pdf.save(),
//       );
//
//       _showSuccessNotification();
//     } on TooManyPagesException {
//       Log.e(
//           "PDF document has too many pages. Please reduce the data or split it.");
//     } catch (e) {
//       Log.e("An error occurred while generating the PDF: $e");
//     }
//   }
//
//   static Future<void> _showSuccessNotification() async {
//     final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//         FlutterLocalNotificationsPlugin();
//
//     const AndroidInitializationSettings initializationSettingsAndroid =
//         AndroidInitializationSettings('@mipmap/ic_launcher');
//
//     const InitializationSettings initializationSettings =
//         InitializationSettings(
//       android: initializationSettingsAndroid,
//     );
//
//     await flutterLocalNotificationsPlugin.initialize(initializationSettings);
//
//     const AndroidNotificationDetails androidPlatformChannelSpecifics =
//         AndroidNotificationDetails(
//       'pdf_download_channel',
//       'Location Report Download',
//       channelDescription: 'Notification for successful PDF download',
//       importance: Importance.max,
//       priority: Priority.high,
//     );
//
//     const NotificationDetails platformChannelSpecifics =
//         NotificationDetails(android: androidPlatformChannelSpecifics);
//
//     await flutterLocalNotificationsPlugin.show(
//       0, // Notification ID
//       'Location Report Download',
//       'Your Location Report has been downloaded successfully.',
//       platformChannelSpecifics,
//       payload: 'pdf_download_success',
//     );
//   }
// }
