import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'state_update.dart';
import 'requests.dart';
import 'my_requests.dart';
import 'profile.dart';
import 'messages.dart';
import 'settings.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _index = 0;
  final List<Widget> _pages = [
    const RequestsPage(),
    const MyRequestsPage(),
    const ProfilePage(),
    const MessagesPage(),
    const SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );
    if (context.watch<ChangeNavigation>().getSwitch) {
      _index = context.watch<ChangeNavigation>().getIndex;
    }

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
      ),
      body: _pages[_index],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _index,
        onDestinationSelected: (int index) => setState(() {
          _index = index;
        }),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.assignment_turned_in_outlined),
            selectedIcon: Icon(Icons.assignment_turned_in),
            label: 'Заявка',
          ),
          NavigationDestination(
            icon: Icon(Icons.library_add_check_outlined),
            selectedIcon: Icon(Icons.library_add_check),
            label: 'Мои заявки',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outlined),
            selectedIcon: Icon(Icons.person),
            label: 'Профиль',
          ),
          NavigationDestination(
            icon: Icon(Icons.message_outlined),
            selectedIcon: Icon(Icons.message),
            label: 'Сообщения',
          ),
          NavigationDestination(
            icon: Icon(Icons.settings_outlined),
            selectedIcon: Icon(Icons.settings),
            label: 'Настройки',
          ),
        ],
      ),
    );
  }
}
