
import 'package:flutter/material.dart';

class PDFViewScreen extends StatefulWidget {
  final String text;
  const PDFViewScreen({ Key? key ,required this.text}) : super(key: key);
  @override
  _PDFViewScreenState createState() => _PDFViewScreenState();
}

class _PDFViewScreenState extends State<PDFViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(widget.text)
    );
  }
}