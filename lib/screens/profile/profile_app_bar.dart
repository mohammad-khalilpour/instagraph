import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagraph/state/user/provider/username_provider.dart';

AppBar profileAppBar(BuildContext context) {
  return AppBar(
    title: Consumer(
      builder: (context, ref, child) {
        final username = ref.watch(usernameProvider);
        return Text(username.asData?.value ?? "");
      },
    ),
    actions: [
      IconButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return ListView(
                  children: [
                    TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.settings),
                      label: const Text('privacy and setting'),
                    ),
                  ],
                );
              },
            );
          },
          icon: const Icon(Icons.menu)),
    ],
    shape: const Border(
      bottom: BorderSide(
        color: Colors.white,
        width: 0.2,
      ),
    ),
  );
}
