import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'styles.dart';

import 'page/layout_page.dart';

class CupertinoStoreApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      initialRoute: '/',
      routes: {
        '/home': (ctx) => CupertinoStoreHomePage(),
        '/layout': (ctx) => LayoutPage()
      },
      home: CupertinoStoreHomePage(),
    );
  }
}

class CupertinoStoreHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text('Flutter Notes'),
      ),
      child: SafeArea(
        child: Container(
          color: Colors.lightGreenAccent[700],
          child: ListView(
            children: _getCell(context),
          ),
        ),
      ),
    );
  }
}

class CellObject {
  String title;
  String route;
  CellObject(this.title, this.route);
}

_getCell(ctx) {
  final titles = [
    CellObject('UI', '/ui'),
    CellObject('Layout', '/layout'),
    CellObject('Redux', '/redux'),
    CellObject('Debug', '/debug'),
    CellObject('Profile', '/profile'),
    CellObject('2046', '/2046'),
  ];
  List<Widget> list = [];
  for (var i = 0; i < titles.length; i++) {
    final cell = titles[i];
    list.add(GestureDetector(
      onTap: () {
        Navigator.of(ctx).pushNamed(cell.route);
      },
      child: Container(
        color: Colors.amber,
        child: Center(
          child: Text(cell.title),
        ),
        constraints: BoxConstraints(
            minWidth: 40, maxWidth: 80, minHeight: 40, maxHeight: 80),
        padding: EdgeInsets.fromLTRB(4, 4, 4, 4),
        margin: EdgeInsets.fromLTRB(4, 2, 4, 2),
      ),
    ));
  }
  return list;
}

// class CupertinoStoreHomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return CupertinoTabScaffold(
//       tabBar: CupertinoTabBar(
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(CupertinoIcons.arrow_up_right_diamond),
//             title: Text('Products'),
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(CupertinoIcons.search),
//             title: Text('Search'),
//           ),
//         ],
//       ),
//       tabBuilder: (context, index) {
//         switch (index) {
//           case 0:
//             return CupertinoTabView(builder: (context) {
//               return CupertinoPageScaffold(
//                 child: SearchTab(),
//               );
//             });
//           case 1:
//             return CupertinoTabView(builder: (context) {
//               return CupertinoPageScaffold(
//                 child: SearchTab(),
//               );
//             });
//         }
//       },
//     );
//   }
// }

// class SearchTab extends StatefulWidget {
//   @override
//   _SearchTabState createState() {
//     return _SearchTabState();
//   }
// }

// class _SearchTabState extends State<SearchTab> {
//   @override
//   Widget build(BuildContext context) {
//     return CustomScrollView(
//       slivers: const <Widget>[
//         CupertinoSliverNavigationBar(
//           largeTitle: Text('Search'),
//         ),
//       ],
//     );
//   }
// }
