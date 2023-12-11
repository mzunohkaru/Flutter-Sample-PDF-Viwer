import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfViewrNetwork extends StatefulWidget {
  const PdfViewrNetwork({super.key});

  @override
  State<PdfViewrNetwork> createState() => _PdfViewrNetworkState();
}

class _PdfViewrNetworkState extends State<PdfViewrNetwork> {
  late PdfViewerController _pdfViewerController;
  late PdfTextSearchResult _searchResult;

  @override
  void initState() {
    _pdfViewerController = PdfViewerController();
    _searchResult = PdfTextSearchResult();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PDF Network'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.search,
            ),
            onPressed: () {
              _searchResult = _pdfViewerController.searchText(
                'ADS',
              );

              _searchResult.addListener(() {
                if (_searchResult.hasResult) {
                  setState(() {});
                }
              });
            },
          ),
          Visibility(
            visible: _searchResult.hasResult,
            child: IconButton(
              icon: const Icon(
                Icons.clear,
              ),
              onPressed: () {
                setState(() {
                  _searchResult.clear();
                });
              },
            ),
          ),
          Visibility(
            visible: _searchResult.hasResult,
            child: IconButton(
              icon: const Icon(
                Icons.keyboard_arrow_up,
              ),
              onPressed: () {
                _searchResult.previousInstance();
              },
            ),
          ),
          Visibility(
            visible: _searchResult.hasResult,
            child: IconButton(
              icon: const Icon(
                Icons.keyboard_arrow_down,
              ),
              onPressed: () {
                _searchResult.nextInstance();
              },
            ),
          ),
        ],
      ),
      body: SfPdfViewer.network(
          "https://pages.awscloud.com/rs/112-TZM-766/images/AWS-Black-Belt_2023_AWS_ADS.pdf",
          controller: _pdfViewerController,
          currentSearchTextHighlightColor: Colors.yellow.withOpacity(0.6),
          otherSearchTextHighlightColor: Colors.yellow.withOpacity(0.3),
          pageLayoutMode: PdfPageLayoutMode.single),
    );
  }
}
