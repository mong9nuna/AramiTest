import 'package:arami/common/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

class LibraryDetailActivityLogWebviewScreen extends StatefulWidget {
  const LibraryDetailActivityLogWebviewScreen({Key? key}) : super(key: key);

  @override
  State<LibraryDetailActivityLogWebviewScreen> createState() =>
      _LibraryDetailActivityLogWebviewScreenState();
}

class _LibraryDetailActivityLogWebviewScreenState
    extends State<LibraryDetailActivityLogWebviewScreen> {
  WebViewController? _webViewController;

  @override
  void initState() {
    if (_webViewController == null) {
      setState(() {
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.landscapeLeft,
          DeviceOrientation.landscapeRight,
        ]);
        SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
      });
    }
    _webViewController = WebViewController()
      ..loadRequest(
          Uri.parse('https://www.arambooks.com/upload/test/test.html'))
      ..setJavaScriptMode(JavaScriptMode.unrestricted);
    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: WebViewWidget(
              controller: _webViewController!,
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
              _webViewController!.removeJavaScriptChannel(javaScriptChannelName);
            },
            child: Icon(
              Icons.backspace_rounded,
              color: BLACK,
            ),
          ),
        ],
      ),
    );
  }
}
