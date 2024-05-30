import 'package:url_launcher/url_launcher.dart';

import '../utility/toast_message.dart';

class UrlLauncherService {
  static Future<void> launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(
      uri,
      mode: LaunchMode.platformDefault,
    )) {}
  }

  static Future<void> makePhoneCall(String phoneNumber) async {
    canLaunchUrl(Uri(scheme: 'tel', path: '123')).then((bool result) async {
      if (result) {
        final Uri uri = Uri(
          scheme: 'tel',
          path: phoneNumber,
        );
        await launchUrl(uri);
      } else {}
    });
  }

  static Future<void> sendEmail(String emailId) async {
    Uri mail = Uri.parse("mailto:$emailId");
    if (await canLaunchUrl(mail)) {
      try {
        await launchUrl(mail);
      } catch (e) {
        AppAlert.showToast(message: e.toString());
      }
    } else {}
  }

  static Future<void> shareImagesViaEmail(String toEmail, String subject, String body,
      List<String> imagePaths) async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: toEmail,
      queryParameters: {
        'subject': subject,
        'body': body,
        'attachment': imagePaths.join(','),
      },
    );

    if (await canLaunchUrl(emailLaunchUri)) {
      await launchUrl(emailLaunchUri);
    } else {
      throw 'Could not launch email client.';
    }
  }
}
