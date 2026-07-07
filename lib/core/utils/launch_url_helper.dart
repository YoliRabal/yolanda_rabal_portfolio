import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart';

class LaunchUrlHelper {
  const LaunchUrlHelper._();

  static Future<void> open(String url) async {
    if (url.trim().isEmpty) return;

    final Uri uri = Uri.parse(url);

    try {
      await launchUrl(
        uri,
        mode: kIsWeb
            ? LaunchMode.platformDefault
            : LaunchMode.externalApplication,
      );
    } catch (_) {
      return;
    }
  }
}