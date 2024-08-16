import 'dart:io';

import 'package:url_launcher/url_launcher.dart';

class WhatsAppService {
  static Future<void> launchWhatsApp({
    String contact = "+90000000000",
    String message = "",
  }) async {
    String androidUrl = "whatsapp://send?phone=$contact&text=$message";
    String iosUrl = "https://wa.me/$contact?text=${Uri.parse(message)}";

    String webUrl =
        'https://api.whatsapp.com/send/?phone=$contact&text=$message';

    try {
      if (Platform.isIOS) {
        if (await canLaunchUrl(Uri.parse(iosUrl))) {
          await launchUrl(Uri.parse(iosUrl));
        }
      } else if (Platform.isAndroid) {
        if (await canLaunchUrl(Uri.parse(androidUrl))) {
          await launchUrl(Uri.parse(androidUrl));
        }
      }
    } catch (e) {
      await launchUrl(Uri.parse(webUrl), mode: LaunchMode.externalApplication);
    }
  }
}
