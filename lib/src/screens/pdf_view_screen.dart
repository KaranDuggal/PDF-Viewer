
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
class PDFViewScreen extends StatefulWidget {
  final String type;
  final String filepath;
  final String url;
  const PDFViewScreen({ Key? key ,required this.type,required this.filepath,required this.url}) : super(key: key);
  @override
  _PDFViewScreenState createState() => _PDFViewScreenState();
}

class _PDFViewScreenState extends State<PDFViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: widget.type == "fromStorage" ? SfPdfViewer.file(File(widget.filepath)) : widget.type == "fromLink" ? SfPdfViewer.network(widget.url) : const Text("error")
      )
    );
  }
}