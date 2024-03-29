import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.black,
      fixedColor: Colors.white,
      unselectedItemColor: Colors.white,
      key: const Key("bottomNavBar"),
      items: [
        // TODO(Any): Use this image as the shorts icon somehow.
        // Image(image: AssetImage('/assets/images/shorts_icon_1.png'),)
        _buildIconButton(icon: Icons.home, label: "Home"),
        _buildIconButton(icon: Icons.list, label: "Shorts"),
        _buildIconButton(icon: Icons.add_circle_outline_rounded, label: "", size: 40),
        _buildIconButton(icon: Icons.subscriptions_outlined, label: "Subs"),
        _buildIconButton(icon: Icons.person, label: "You"),
      ],
    );
  }
}

BottomNavigationBarItem _buildIconButton({
  required IconData icon,
  required String label,
  double? size,
}) {
  return BottomNavigationBarItem(
    backgroundColor: Colors.black,
    icon: Icon(icon, size: size ?? 25),
    label: label,
  );
}
