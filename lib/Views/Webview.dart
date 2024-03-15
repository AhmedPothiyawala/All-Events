import 'package:all_events/Custome_Functions/Colors/constants.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import '../Custome_Functions/System_Orientation_and_SystemUIOverlayStyle/System_Orientation_and_SystemUIOverlayStyle_all_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class WebviewScreen extends StatefulWidget {
  final heading, url;
  const WebviewScreen(this.heading, this.url);
  @override
  State<StatefulWidget> createState() {
    return WebviewScreen_State();
  }
}

class WebviewScreen_State extends State<WebviewScreen> {
  WebViewController controller;
  double progress = 0;

  @override
  void initState() {
    System_Orientation_and_SystemUIOverlayStyle_all_screen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    System_Orientation_and_SystemUIOverlayStyle_all_screen();
    return Scaffold(
        appBar: AppBar(
          backgroundColor: EventColors.kPrimary_amount_color,
          centerTitle: true,
          leadingWidth: 50,
          iconTheme:
              IconThemeData(color: EventColors.kPrimaryLightColor, size: 25),
          titleSpacing: 0.00,
          title: Text(
            '${widget.heading}',
            style: TextStyle(
                color: EventColors.kPrimaryLightColor,
                fontWeight: FontWeight.bold),
          ),
          elevation: 0.00,
          actions: [
            IconButton(
                icon: Icon(Icons.refresh), onPressed: () => controller.reload())
          ],
        ),
        body: Column(
          children: [
            LinearProgressIndicator(
              value: progress,
              color: EventColors.kPrimaryLightColor,
              backgroundColor: EventColors.kPrimaryColor,
            ),
            Expanded(
              child: WebView(
                  zoomEnabled: false,
                  javascriptMode: JavascriptMode.unrestricted,
                  initialUrl: widget.url,
                  navigationDelegate: (NavigationRequest request) {
                    if (request.url.contains("mailto:")) {
                      _launchURL(request.url);
                      return NavigationDecision.prevent;
                    } else if (request.url.contains("tel:")) {
                      _call(request.url);
                      return NavigationDecision.prevent;
                    } else if (request.url.contains('https://wa.me/') ||
                        request.url.contains('https://web.whatsapp.com/')) {
                      _launchURL(request.url);
                      return NavigationDecision.prevent;
                    }
                    return NavigationDecision.navigate;
                  },
                  onWebViewCreated: (controller) {
                    this.controller = controller;
                  },
                  onProgress: (progress) => setState(() {
                        this.progress = progress / 100;
                      })),
            )
          ],
        ));
  }

  _call(number) async {
    await FlutterPhoneDirectCaller.callNumber(number);
  }

  _launchURL(url) async {
    await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
  }
}
