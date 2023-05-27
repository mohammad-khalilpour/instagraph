import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagraph/constants/constants.dart';
import 'package:instagraph/screens/profile/user_posts_view.dart';
import 'package:instagraph/state/user/provider/user_provider.dart';
import 'package:instagraph/widgets/custom_button.dart';

class ProfileScreenBody extends ConsumerStatefulWidget {
  final String userId;
  const ProfileScreenBody({
    required this.userId,
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreenBody> {


  @override
  Widget build(BuildContext context) {
    final userAsync = ref.read(userProvider(widget.userId));
    final user = userAsync.when(
      data: (user) {
        return user;
      },
      error: (object, stacktrace) => null,
      loading: () => null,
    );
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
                children: [
                  Text(user?.posts.length.toString() ?? '0'),
                  const Text('posts'),
                ],
              ),
              Column(
                children: [
                  Text(user?.following.length.toString() ?? '0'),
                  const Text('following'),
                ],
              ),
              Column(
                children: [
                  Text(user?.followers.length.toString() ?? '0'),
                  const Text('following'),
                ],
              ),
            ],
          ),
          hGap8,
          Text(user?.fullName ?? ''),
          Text(user?.profileDescription ?? ''),
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
          Expanded(
              child: UserPostsView(
            username: widget.userId,
          )),
        ],
      ),
    );
  }
}
