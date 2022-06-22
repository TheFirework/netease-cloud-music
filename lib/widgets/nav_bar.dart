import 'package:flutter/material.dart';

/// 顶部导航栏
class NavBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  final Widget? child;
  final Widget? leading;
  final Widget? rightButton;
  final VoidCallback onPressed;
  final Color navigationBarBackgroundColor;

  const NavBar({
    Key? key,
    this.child,
    this.rightButton,
    this.height = 44,
    this.navigationBarBackgroundColor = Colors.white,
    required this.onPressed,
    this.leading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: navigationBarBackgroundColor,
      child: SafeArea(
        top: false,
        child: Container(
          height: height,
          child: Row(
            children: [
              SizedBox(
                width: 48.0,
                child: IconButton(
                  icon: leading ?? Container(),
                  onPressed: onPressed,
                ),
              ),
              Expanded(
                child: Container(
                  child: child,
                ),
              ),
              SizedBox(
                width: 48.0,
                child: rightButton,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
