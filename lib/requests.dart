import 'package:flutter/material.dart';
import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'container.dart';
import 'ship.dart';
import 'custom.dart';


class RequestsPage extends StatefulWidget {
  const RequestsPage({Key? key}) : super(key: key);

  @override
  _RequestsPageState createState() => _RequestsPageState();
}

class _RequestsPageState extends State<RequestsPage> {
  final List<Widget> _pages = [
    const ContainerPage(),
    const ShipPage(),
    const CustomPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _pages.length,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
          bottom: TabBar(
            indicatorSize: TabBarIndicatorSize.label,
            isScrollable: true,
            indicator: BubbleTabIndicator(
              indicatorColor: Theme.of(context).indicatorColor,
              indicatorHeight: 30,
            ),
            tabs: const [
              Tab(
                text: 'Контейнер',
              ),
              Tab(
                text: 'Выделенное судно',
              ),
              Tab(
                text: 'Своя заявка',
              ),
            ],
          ),
        ),
        body: TabBarView(children: _pages),
      ),
    );
  }
}
