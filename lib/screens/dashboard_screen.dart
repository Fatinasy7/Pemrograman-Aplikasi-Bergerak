import 'package:flutter/material.dart';
import 'counter_screen.dart';
import 'widget_bertingkat_screen.dart';
import 'user_input_screen.dart';
import 'dynamic_list_screen.dart';
import 'navigasi_sederhana_screen.dart';
import 'grid_view_screen.dart';
import 'tentang_saya_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final Set<int> _visitedItems = {};

  final List<Map<String, dynamic>> _menuItems = [
    {
      'title': 'Counter',
      'icon': Icons.add_circle_outline,
    },
    {
      'title': 'Widget Bertingkat',
      'icon': Icons.layers_outlined,
    },
    {
      'title': 'User Input Example',
      'icon': Icons.edit_outlined,
    },
    {
      'title': 'Dynamic List Example',
      'icon': Icons.list_outlined,
    },
    {
      'title': 'Navigasi Sederhana',
      'icon': Icons.navigation_outlined,
    },
    {
      'title': 'Grid View',
      'icon': Icons.grid_view_outlined,
    },
    {
      'title': 'Tentang Saya',
      'icon': Icons.person_outline,
    },
  ];

  void _navigateTo(int index) {
    setState(() {
      _visitedItems.add(index);
    });

    Widget screen;
    switch (index) {
      case 0:
        screen = const CounterScreen();
        break;
      case 1:
        screen = const WidgetBertingkatScreen();
        break;
      case 2:
        screen = const UserInputScreen();
        break;
      case 3:
        screen = const DynamicListScreen();
        break;
      case 4:
        screen = const NavigasiSederhanaScreen();
        break;
      case 5:
        screen = const GridViewScreen();
        break;
      case 6:
        screen = const TentangSayaScreen();
        break;
      default:
        return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyPorto'),
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle_outlined, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const TentangSayaScreen()),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            // Welcome Banner
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFF4A7C59),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Selamat Datang di MyPorto',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Cek hasil karyaku disini ya!!',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            // Menu List
            Expanded(
              child: ListView.separated(
                itemCount: _menuItems.length,
                separatorBuilder: (_, __) => const SizedBox(height: 10),
                itemBuilder: (context, index) {
                  final isVisited = _visitedItems.contains(index);
                  return _MenuTile(
                    title: _menuItems[index]['title'] as String,
                    isVisited: isVisited,
                    onTap: () => _navigateTo(index),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color(0xFF4A7C59),
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}

class _MenuTile extends StatelessWidget {
  final String title;
  final bool isVisited;
  final VoidCallback onTap;

  const _MenuTile({
    required this.title,
    required this.isVisited,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        decoration: BoxDecoration(
          color: isVisited ? const Color(0xFFB5CEBC) : const Color(0xFFE8E4DC),
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: isVisited
                    ? const Color(0xFF2E5E3E)
                    : const Color(0xFF2D3436),
              ),
            ),
            Icon(
              Icons.chevron_right,
              color: isVisited
                  ? const Color(0xFF2E5E3E)
                  : const Color(0xFF636E72),
            ),
          ],
        ),
      ),
    );
  }
}
