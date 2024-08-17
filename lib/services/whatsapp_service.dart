import 'package:url_launcher/url_launcher.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';

class WhatsAppService {
  static Future<void> launchWhatsApp({
    String contact = "+90000000000",
    String message = "السلام عليكم، أحتاج مساعدة",
  }) async {
    WhatsAppUnilink link = WhatsAppUnilink(
      phoneNumber: contact,
      text: message,
    );
    await launchUrl(link.asUri());
  }
}
