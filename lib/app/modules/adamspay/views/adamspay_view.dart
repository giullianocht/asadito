import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../controllers/adamspay_controller.dart';

class AdamspayView extends GetView<AdamspayController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: WebView(
          initialUrl: controller.linkDePago,
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}