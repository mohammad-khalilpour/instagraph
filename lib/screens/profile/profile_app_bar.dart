import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagraph/extentions/page_route_extentions.dart';
import 'package:instagraph/state/auth/providers/auth_provider.dart';
import '../../state/auth/providers/user_name_provider.dart';

AppBar profileAppBar(BuildContext context) {
  return AppBar(
    title: Consumer(
      builder: (context, ref, child) {
        final username = ref.watch(usernameProvider);
        return Text(username ?? '');
      },
    ),
    actions: [
      Consumer(
        builder: (context, ref, child) {
          return IconButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return ListView(
                    children: [
                      TextButton.icon(
                        onPressed: () {
                          ref.read(authStateProvider.notifier).logOut();
                          context.popRoute();
                        },
                        icon: const Icon(Icons.logout),
                        label: const Text('Log out'),
                      ),
                    ],
                  );
                },
              );
            },
            icon: const Icon(Icons.menu),
          );
        },
      ),
    ],
    shape: const Border(
      bottom: BorderSide(
        color: Colors.white,
        width: 0.2,
      ),
    ),
  );
}
