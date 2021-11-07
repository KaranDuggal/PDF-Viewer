// import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'pdf_view_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String url = "http://africau.edu/images/default/sampe.pdf";
  bool isFileGet = false;
  String pathPDF = '';
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PDF Viewer App'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: ()async {
              FilePickerResult ? result = await FilePicker.platform.pickFiles(
                type: FileType.custom,
                allowedExtensions: ['pdf'],
              );
              if(result != null){
                pathPDF = result.files.single.path!;
                Navigator.of(context).push(MaterialPageRoute(builder: (contaxt)=> PDFViewScreen(type: "fromStorage", filepath: pathPDF, url: "no")));
              }
            },
            child: const Text("From Storage")
          ),
          ElevatedButton(
            onPressed: ()async {
              Navigator.of(context).push(MaterialPageRoute(builder: (contaxt)=> PDFViewScreen(type: "fromLink", filepath: pathPDF, url: "http://africau.edu/images/default/sample.pdf")));
            },
            child: const Text("from link")
          )
        ],
      )
      // body: Container(
      //   child: isFileGet ? Center(
      //     child: SfPdfViewer.network(url)
      //   ): ElevatedButton(
      //     onPressed: () async {
      //       // Navigator.of(context).push(MaterialPageRoute(builder: (contaxt)=>const PDFViewScreen(text: "todo")));
      //       // FilePickerResult ? result = await FilePicker.platform.pickFiles(
      //       //   // type: FileType.custom,
      //       //   allowedExtensions: ['pdf'],
      //       // );
      //       setState(() {
      //           isFileGet = true;
      //         // if (result != null){
      //         //   pathPDF = result.files.single.path!;
      //         // }
      //       });
      //     }, 
      //     child: const Text('Select File')) 
      // )
    );
  }
}
