import 'package:url_launcher/url_launcher.dart';

Future<void> launchExternalURL(String url) async {
  final uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri, mode: LaunchMode.inAppBrowserView);
  } else {
    throw 'Could not launch $url';
  }
}
