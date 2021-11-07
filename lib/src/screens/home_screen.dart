import 'dart:io';
import 'package:flutter/material.dart';
import 'package:pdf_viewer/src/screens/pdf_view_screen.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
// import 'package:file_picker/file_picker.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String url = "http://africau.edu/images/default/sample.pdf";
  bool isFileGet = false;
  String pathPDF = '';
  // final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();
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
      body: Container(
        child: isFileGet ? Center(
          child: SfPdfViewer.file(File(pathPDF))
        ): ElevatedButton(
          onPressed: () async {
            Navigator.of(context).push(MaterialPageRoute(builder: (contaxt)=>const PDFViewScreen(text: "todo")));
            // FilePickerResult ? result = await FilePicker.platform.pickFiles(
            //   // type: FileType.custom,
            //   allowedExtensions: ['pdf'],
            // );
            // setState(() {
            //   if (result != null){
            //     isFileGet = true;
            //     pathPDF = result.files.single.path!;
            //   }
            // });
          }, 
          child: const Text('Select File')) 
      )
    );
  }
}
