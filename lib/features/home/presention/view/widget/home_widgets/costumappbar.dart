import 'package:book/core/utils/assets.dart';
import 'package:book/core/utils/routesApp.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomappBar extends StatelessWidget {
  const CustomappBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          AssetsData.logo,
          height: 18,
        ),
        Spacer(),
        IconButton(
            onPressed: () {
              GoRouter.of(context).push(
                RoutesApp.kSearch,
              );
            },
            icon: Icon(Icons.search_sharp))
      ],
    );
  }
}
