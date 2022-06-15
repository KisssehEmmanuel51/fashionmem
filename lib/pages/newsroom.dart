//
//
//
//
//
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class NewsRoom extends StatefulWidget {
//   const NewsRoom({Key? key}) : super(key: key);
//
//   @override
//   State<NewsRoom> createState() => _NewsRoomState();
// }
//
// class StatefulWidget {
// }
//
// class _NewsRoomState extends State<NewsRoom> {
//   FirebaseStorage storage = FirebaseStorage.instance;
//
//   Future<List<Map<String, dynamic>>> _loadImages() async {
//     List<Map<String, dynamic>> files = [];
//
//     final ListResult result = await storage.ref().list();
//     final List<Reference> allFiles = result.items;
//
//     await Future.forEach<Reference>(allFiles, (file) async {
//       final String fileUrl = await file.getDownloadURL();
//       final FullMetadata fileMeta = await file.getMetadata();
//       files.add({
//         "url": fileUrl,
//
//       });
//     });
//
//     return files;
//   }
//   Future<void> _delete(String ref) async {
//     await storage.ref(ref).delete();
//     // Rebuild the UI
//     setState(() {});
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: FutureBuilder(
//         future: _loadImages(),
//         builder: (context,
//             AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
//           if (snapshot.connectionState == ConnectionState.done) {
//             return ListView.builder(
//               itemCount: snapshot.data?.length ?? 0,
//               itemBuilder: (context, index) {
//                 final Map<String, dynamic> image =
//                 snapshot.data![index];
//
//                 return Card(
//                   child:  Column(
//                     children: [
//                       Image.network(image['url'],),
//                       Text(image['uploaded_by']),
//                     ],
//                   ),
//                   // margin: const EdgeInsets.symmetric(vertical: 10),
//                   // child: ListTile(
//                   //   dense: false,
//                   //   leading: Image.network(image['url'],),
//                   //   title: Text(image['uploaded_by']),
//                   //   subtitle: Text(image['description']),
//                   //   trailing: Column(
//                   //     children: [
//                   //       Text(index.toString()),
//                   //       Expanded(
//                   //         child: IconButton(
//                   //           onPressed: () => _delete(image['path']),
//                   //           icon: const Icon(
//                   //             Icons.delete,
//                   //             color: Colors.red,
//                   //           ),
//                   //         ),
//                   //       ),
//                   //     ],
//                   //   ),
//                   // ),
//                 );
//               },
//             );
//           }
//
//           return const Center(
//             child: CircularProgressIndicator(),
//           );
//         },
//       ),
//     );
//   }
// }
//
//
//
//
