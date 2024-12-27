part of 'utils.dart';

class PdfHelper {
  static Future<List<int>> createPDF() async {
    // 1. Buat objek PDF Document
    final PdfDocument document = PdfDocument();

    // 2. Tambahkan halaman
    final PdfPage page = document.pages.add();

    // 3. Tambahkan teks ke halaman
    final PdfFont font = PdfStandardFont(PdfFontFamily.helvetica, 12);
    page.graphics.drawString(
      'Halo Dunia!',
      font,
      bounds: const Rect.fromLTWH(0, 0, 500, 30),
    );

    // 4. Simpan dokumen ke array byte
    List<int> bytes = await document.save();

    // 5. Tutup dokumen
    document.dispose();

    return bytes;
  }

  static Future<void> readPDF(String filePath) async {
    final File file = File(filePath);
    final List<int> bytes = await file.readAsBytes();

    // Memuat dokumen PDF
    final PdfDocument document = PdfDocument(inputBytes: bytes);

    // Ambil teks dari halaman pertama
    final PdfTextExtractor extractor = PdfTextExtractor(document);
    final String text =
        extractor.extractText(startPageIndex: 0, endPageIndex: 0);

    print('Isi Halaman Pertama: $text');

    // Tutup dokumen
    document.dispose();
  }

  static Future<void> addImageToPDF() async {
    // Muat gambar dari aset
    final ByteData data = await rootBundle.load('assets/sample.png');
    final Uint8List imageBytes = data.buffer.asUint8List();

    // Buat dokumen PDF
    final PdfDocument document = PdfDocument();
    final PdfPage page = document.pages.add();

    // Tambahkan gambar ke PDF
    final PdfBitmap image = PdfBitmap(imageBytes);
    page.graphics.drawImage(image, const Rect.fromLTWH(0, 0, 200, 100));

    // Simpan PDF
    final List<int> bytes = document.save() as List<int>;
    document.dispose();

    final String path = (await getApplicationDocumentsDirectory()).path;
    final File file = File('$path/image_example.pdf');
    await file.writeAsBytes(bytes, flush: true);

    print('PDF dengan gambar berhasil dibuat di: $path/image_example.pdf');
  }
}
