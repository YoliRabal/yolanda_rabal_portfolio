import 'package:web/web.dart' as web;

class DownloadHelper {
  const DownloadHelper._();

  static void downloadCv() {
    final anchor = web.HTMLAnchorElement()
      ..href = 'documents/yolanda_rabal_cv.pdf'
      ..download = 'Yolanda_Rabal_CV.pdf'
      ..target = '_blank';

    web.document.body?.append(anchor);
    anchor.click();
    anchor.remove();
  }
}