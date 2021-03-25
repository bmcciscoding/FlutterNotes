import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dart:ui' as ui;

final screenWidth = ui.window.physicalSize.width;
final screeHeight = ui.window.physicalSize.height;

const String text = '''
在真正开始比较之前，先看一下他们背后是什么样的组织在支撑和运营着他们。
CSS 背后是 W3C，这是业界认可的标准化组织，而且被各大浏览器实现，浏览器厂商也在积极的推到标准的发展。CSS 是个开放的技术，它背后的大佬是 W3C、Chrome、Safai、Firefox 等等一系列盈利或者非盈利组织，大家互惠互利共同发展。
''';

class LayoutPage extends StatelessWidget {
  const LayoutPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text('Layout'),
      ),
      child: SafeArea(
        child: Container(
            color: CupertinoColors.systemRed,
            width: screenWidth,
            height: screeHeight,
            child: Row(
              children: [
                Container(
                  width: 100,
                  height: 100,
                  color: CupertinoColors.systemYellow,
                  margin: EdgeInsets.all(10),
                ),
                Container(
                  width: 100,
                  height: 100,
                  color: CupertinoColors.systemYellow,
                  margin: EdgeInsets.all(10),
                ),
                Container(
                  width: 100,
                  height: 100,
                  color: CupertinoColors.systemYellow,
                  margin: EdgeInsets.all(10),
                )
              ],
            )),
      ),
    );
  }
}
