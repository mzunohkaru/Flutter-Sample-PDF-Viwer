import 'package:flutter/material.dart';
import 'package:pdf_sample/pages/pdf_viewr_asset.dart';
import 'package:pdf_sample/pages/pdf_viewr_network.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return const PdfViewAssets();
                    },
                  ),
                );
              },
              icon: const Icon(Icons.folder),
              label: const Text('PDF assets/'),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return const PdfViewrNetwork();
                    },
                  ),
                );
              },
              icon: const Icon(Icons.network_cell),
              label: const Text('PDF network'),
            ),
          ],
        ),
      ),
    );
  }
}
