import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagraph/constants/constants.dart';
import 'package:instagraph/screens/profile/user_posts_view.dart';
import 'package:instagraph/widgets/custom_button.dart';

class ProfileScreenBody extends ConsumerStatefulWidget {
  const ProfileScreenBody({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreenBody> {
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {},
                child: const CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage(
                      '/Users/kian/dev/projects/flutterProjects/instagraph/assets/blank-profile-picture-973460__340.webp'),
                ),
              ),
              Column(
                children: const [
                  Text('0'),
                  Text('posts'),
                ],
              ),
              Column(
                children: const [
                  Text('0'),
                  Text('following'),
                ],
              ),
              Column(
                children: const [
                  Text('0'),
                  Text('followers'),
                ],
              ),
            ],
          ),
          hGap8,
          const Text('mohammad khalilpour'),
          const Text('''CE studunt at aut
its nice to be important but its important to be nice
          '''),
          hGap8,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 150,
                child: CustomButton(
                  onPress: () {},
                  text: 'Edit profile',
                ),
              ),
              wGap20,
              SizedBox(
                width: 150,
                child: CustomButton(
                  onPress: () {},
                  text: 'Share profile',
                ),
              ),
            ],
          ),
          hGap12,
          Container(
            height: 0.2,
            color: Colors.white,
          ),
          const Expanded(
            child: UserPostsView()
          ),
        ],
      ),
    );
  }
}
