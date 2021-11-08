// import 'dart:io';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:pdf_viewer/src/services/api_service.dart';
import 'pdf_view_screen.dart';
import 'package:path_provider/path_provider.dart';
import 'package:cool_alert/cool_alert.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String url = "http://africau.edu/images/default/sample.pdf";
  bool isloading = false;
  String pdfUrl = '';
  String pdfPath = '';
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
                  bool _validURL = Uri.parse("http://africau.edu/images/default/sample.pdf").isAbsolute;
                  if(_validURL){
                    final dirList = await getExternalStoragePath();
                    final path = dirList![0].path;
                    final file = File("$path/filename.pdf");
                    bool data = await ApiService().downloadAndSaveInStorage(pdfUrl,file.path);
                    if(data){
                      pdfPath = file.path;
                      Navigator.of(context).push(MaterialPageRoute(builder: (contaxt)=> PDFViewScreen(type: "fromStorage", filepath: pdfPath, url: pdfUrl)));
                      return;
                    }else{
                      CoolAlert.show(
                         context: context,
                         type: CoolAlertType.success,
                         text: "Your transaction was successful!",
                      );
                    }
                  }
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
                bool _validURL = Uri.parse("http://africau.edu/images/default/sample.pdf").isAbsolute;
                if(_validURL){
                  final dirList = await getExternalStoragePath();
                  final path = dirList![0].path;
                  final file = File("$path/filename.pdf");
                  bool data = await ApiService().downloadAndSaveInStorage(pdfUrl,file.path);
                  if(data){
                    pdfPath = file.path;
                    Navigator.of(context).push(MaterialPageRoute(builder: (contaxt)=> PDFViewScreen(type: "fromStorage", filepath: pdfPath, url: pdfUrl)));
                    return;
                  }else{
                    CoolAlert.show(
                       context: context,
                       type: CoolAlertType.success,
                       text: "Your transaction was successful!",
                    );
                  }
                }
              },
              child: const Text("from Link"),
            ),
          ],
        ),
      )
    );
  }
}
Future <List<Directory>?> getExternalStoragePath() async{
  return getExternalStorageDirectories(type: StorageDirectory.documents);
}
