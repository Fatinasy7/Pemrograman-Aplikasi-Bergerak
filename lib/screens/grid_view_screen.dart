import 'package:flutter/material.dart';

class GridViewScreen extends StatelessWidget {
  const GridViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF4A7C59),
        title: const Text('Beranda'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: GridView.count(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 2,
        crossAxisSpacing: 12.0,
        mainAxisSpacing: 12.0,
        padding: const EdgeInsets.all(16.0),
        mainAxisExtent: 180,
        children: [
          _GridButton(
            icon: Icons.beach_access,
            label: 'Pantai',
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            onTap: () => Navigator.push(context, MaterialPageRoute(
              builder: (_) => const MenuPage(menuTitle: 'Pantai', icon: Icons.beach_access),
            )),
          ),
          _GridButton(
            icon: Icons.terrain,
            label: 'Gunung',
            backgroundColor: Colors.pink,
            foregroundColor: Colors.black,
            onTap: () => Navigator.push(context, MaterialPageRoute(
              builder: (_) => const MenuPage(menuTitle: 'Gunung', icon: Icons.terrain),
            )),
          ),
          _GridButton(
            icon: Icons.museum,
            label: 'Budaya',
            backgroundColor: Colors.green,
            foregroundColor: Colors.black,
            onTap: () => Navigator.push(context, MaterialPageRoute(
              builder: (_) => const MenuPage(menuTitle: 'Budaya', icon: Icons.museum),
            )),
          ),
          _GridButton(
            icon: Icons.restaurant,
            label: 'Kuliner',
            backgroundColor: Colors.yellow,
            foregroundColor: Colors.white,
            onTap: () => Navigator.push(context, MaterialPageRoute(
              builder: (_) => const MenuPage(menuTitle: 'Kuliner', icon: Icons.restaurant),
            )),
          ),
          _GridButton(
            icon: Icons.grass,
            label: 'Alam',
            backgroundColor: Colors.brown,
            foregroundColor: Colors.white,
            onTap: () => Navigator.push(context, MaterialPageRoute(
              builder: (_) => const MenuPage(menuTitle: 'Alam', icon: Icons.grass),
            )),
          ),
          _GridButton(
            icon: Icons.star,
            label: 'Konser',
            backgroundColor: Colors.grey,
            foregroundColor: Colors.white,
            onTap: () => Navigator.push(context, MaterialPageRoute(
              builder: (_) => const MenuPage(menuTitle: 'Konser', icon: Icons.star),
            )),
          ),
        ],
      ),
    );
  }
}

class _GridButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color backgroundColor;
  final Color foregroundColor;
  final VoidCallback onTap;

  const _GridButton({
    required this.icon,
    required this.label,
    required this.backgroundColor,
    required this.foregroundColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onTap,
      icon: Icon(icon),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      ),
    );
  }
}

class MenuPage extends StatelessWidget {
  final String menuTitle;
  final IconData icon;

  const MenuPage({super.key, required this.menuTitle, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF4A7C59),
        title: Text(menuTitle),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Center(
        child: ElevatedButton.icon(
          onPressed: () => Navigator.pop(context),
          icon: Icon(icon),
          label: const Text('Kembali'),
        ),
      ),
    );
  }
}