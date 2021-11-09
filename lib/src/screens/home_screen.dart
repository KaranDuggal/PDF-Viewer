// import 'dart:io';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:pdf_viewer/src/screens/about_us_screen.dart';
import 'package:pdf_viewer/src/screens/by_link_screen.dart';
import 'package:pdf_viewer/src/screens/by_storage.dart';
import 'package:pdf_viewer/src/screens/list_screen.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  @override
  void initState() {
    super.initState();
  }

  List listOfScreens = [
    const PdfList(),
    const ByStorage(),
    const ByLink(),
    const AboutUs(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PDF Viewer App'),
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: currentIndex,
        onItemSelected: (index){
          setState(() {
            currentIndex = index;
          });
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            icon: const Icon(Icons.home),
            title: const Text("home"),
            activeColor: Colors.blue,

          ),
          BottomNavyBarItem(
            icon: const Icon(Icons.storage),
            title: const Text("From Storage"),
            activeColor: Colors.blue,
          ),
          BottomNavyBarItem(
            icon: const Icon(Icons.open_in_browser),
            title: const Text("By URL"),
            activeColor: Colors.blue,
          ),
          BottomNavyBarItem(
            icon: const Icon(Icons.person),
            title: const Text("About Us"),
            activeColor: Colors.blue,
          ),
        ],
      ),
      body: listOfScreens[currentIndex],
      // body: Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       ElevatedButton(
      //         style: ElevatedButton.styleFrom(
      //           shape: const StadiumBorder(),
      //           minimumSize: const Size(200, 50),
      //         ),
      //         onPressed: ()async {                
      //           FilePickerResult ? result = await FilePicker.platform.pickFiles(
      //             type: FileType.custom,
      //             allowedExtensions: ['pdf'],
      //           );
      //           if(result != null){
      //             Navigator.of(context).push(MaterialPageRoute(builder: (contaxt)=> PDFViewScreen(type: "fromStorage", filepath: result.files.single.path!, url: "no")));
      //           }
      //         },
      //         child: const Text("From Storage")
      //       ),
      //       const SizedBox(height: 20,),
      //       Container(
      //         margin: const EdgeInsets.symmetric(horizontal: 25),
      //         child: TextFormField(
      //           keyboardType: TextInputType.text,
      //           onFieldSubmitted: (value) async{
      //             pdfUrl = value;
      //             bool _validURL = Uri.parse("http://africau.edu/images/default/sample.pdf").isAbsolute;
      //             if(_validURL){
      //               final dirList = await getExternalStoragePath();
      //               final path = dirList![0].path;
      //               final file = File("$path/filename.pdf");
      //               bool data = await ApiService().downloadAndSaveInStorage(pdfUrl,file.path);
      //               if(data){
      //                 pdfPath = file.path;
      //                 Navigator.of(context).push(MaterialPageRoute(builder: (contaxt)=> PDFViewScreen(type: "fromStorage", filepath: pdfPath, url: pdfUrl)));
      //                 return;
      //               }else{
      //                 CoolAlert.show(
      //                    context: context,
      //                    type: CoolAlertType.error,
      //                    text: "Invalid URL",
      //                 );
      //               }
      //             }
      //           },
      //           decoration: const InputDecoration(
      //             hintText: "Paste your PDF Link Here",
      //             border: OutlineInputBorder(),
      //           ),
      //           onChanged: (value){
      //             pdfUrl = value;
      //           },
      //         )
      //       ),
      //       const SizedBox(height: 20,),
      //       ElevatedButton(
      //         style: ElevatedButton.styleFrom(
      //           shape: const StadiumBorder(),
      //           minimumSize: const Size(200, 50),
      //         ),
      //         onPressed: ()async {
      //           bool _validURL = Uri.parse("http://africau.edu/images/default/sample.pdf").isAbsolute;
      //           if(_validURL){
      //             final dirList = await getExternalStoragePath();
      //             final path = dirList![0].path;
      //             final file = File("$path/filename.pdf");
      //             bool data = await ApiService().downloadAndSaveInStorage(pdfUrl,file.path);
      //             if(data){
      //               pdfPath = file.path;
      //               Navigator.of(context).push(MaterialPageRoute(builder: (contaxt)=> PDFViewScreen(type: "fromStorage", filepath: pdfPath, url: pdfUrl)));
      //               return;
      //             }else{
      //               CoolAlert.show(
      //                  context: context,
      //                  type: CoolAlertType.error,
      //                  text: "Invalid URL",
      //               );
      //             }
      //           }
      //         },
      //         child: const Text("from Link"),
      //       ),
      //     ],
      //   ),
      // )
    );
  }
}
// Future <List<Directory>?> getExternalStoragePath() async{
//   return getExternalStorageDirectories(type: StorageDirectory.documents);
// }
