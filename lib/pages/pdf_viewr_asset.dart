import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfViewAssets extends StatefulWidget {
  const PdfViewAssets({super.key});

  @override
  State<PdfViewAssets> createState() => _PdfViewAssetsState();
}

class _PdfViewAssetsState extends State<PdfViewAssets> {
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();

  late PdfViewerController _pdfViewerController;

  @override
  void initState() {
    _pdfViewerController = PdfViewerController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PDF Asset'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.bookmark,
            ),
            onPressed: () {
              _pdfViewerKey.currentState?.openBookmarkView();
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.keyboard_arrow_up,
            ),
            onPressed: () {
              _pdfViewerController.previousPage();
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.keyboard_arrow_down,
            ),
            onPressed: () {
              _pdfViewerController.nextPage();
            },
          )
        ],
      ),
      body: SfPdfViewer.asset("assets/sql.pdf",
          controller: _pdfViewerController, key: _pdfViewerKey),
    );
  }
}
