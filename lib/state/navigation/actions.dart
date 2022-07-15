import 'package:boilerplate/state/navigation/state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NavigationActions {
  final BuildContext context;
  late NavigationState nav;

  NavigationActions({
    required this.context,
  }) {
    nav = Provider.of<NavigationState>(context, listen: false);
  }

  selectBottomBarRoute(int index) {
    nav.selectedIndex = index;

    nav.update();
  }
}
