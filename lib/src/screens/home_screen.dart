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
  String pdfUrl = '';
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: const StadiumBorder(),
                minimumSize: const Size(200, 50),
              ),
              onPressed: ()async {
                FilePickerResult ? result = await FilePicker.platform.pickFiles(
                  type: FileType.custom,
                  allowedExtensions: ['pdf'],
                );
                if(result != null){
                  Navigator.of(context).push(MaterialPageRoute(builder: (contaxt)=> PDFViewScreen(type: "fromStorage", filepath: result.files.single.path!, url: "no")));
                }
              },
              child: const Text("From Storage")
            ),
            const SizedBox(height: 20,),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 25),
              child: TextFormField(
                keyboardType: TextInputType.text,
                onFieldSubmitted: (value) async{
                  pdfUrl = value;
                  Navigator.of(context).push(MaterialPageRoute(builder: (contaxt)=> PDFViewScreen(type: "fromLink", filepath: "", url: pdfUrl)));
                },
                decoration: const InputDecoration(
                  hintText: "Paste your PDF Link Here",
                  border: OutlineInputBorder(),
                ),
                onChanged: (value){
                  pdfUrl = value;
                },
              )
            ),
            const SizedBox(height: 20,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: const StadiumBorder(),
                minimumSize: const Size(200, 50),
              ),
              onPressed: ()async {
                Navigator.of(context).push(MaterialPageRoute(builder: (contaxt)=> PDFViewScreen(type: "fromLink", filepath: "", url: pdfUrl)));
              },
              child: const Text("from Link"),
              
            ),
          ],
        ),
      )
    );
  }
}
