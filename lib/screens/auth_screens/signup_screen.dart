import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagraph/extentions/page_route_extentions.dart';
import 'package:instagraph/state/auth/providers/auth_provider.dart';
import '../../constants/constants.dart';
import '../../widgets/custom_text_field.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({super.key});

  @override
  ConsumerState<SignUpScreen> createState() => SignUpScreenState();
}

class SignUpScreenState extends ConsumerState<SignUpScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController fullNameController = TextEditingController();

  final TextEditingController userNameController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    fullNameController.dispose();
    userNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(builder: (context, constraints) {
          final containerWidth = constraints.maxWidth - 80 > 340
              ? 340.0
              : constraints.maxWidth - 80;
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(40),
              child: Center(
                child: Column(
                  children: [
                    Container(
                      width: containerWidth,
                      decoration: BoxDecoration(
                        border: Border.all(),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 200,
                              child: Image.asset(
                                  'assets/Screenshot 1402-01-11 at 13.24.39.png'),
                            ),
                            hGap20,
                            const Text(
                              'Sign up to see photos and videos from your friends.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                              ),
                            ),
                            hGap28,
                            TextButton.icon(
                              style: TextButton.styleFrom(
                                maximumSize: Size(containerWidth * 2 / 3, 1000),
                              ),
                              onPressed: () {},
                              icon: const Icon(Icons.facebook),
                              label: const Text(
                                'Log in with Facebook',
                              ),
                            ),
                            hGap20,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  color: Colors.black,
                                  width: 2 / 5 * (containerWidth) - 30,
                                  height: 1,
                                ),
                                wGap8,
                                const Text(
                                  'OR',
                                ),
                                wGap8,
                                Container(
                                  color: Colors.black,
                                  width: 2 / 5 * (containerWidth) - 30,
                                  height: 1,
                                ),
                              ],
                            ),
                            hGap20,
                            CustomTextField(
                              width: 2 / 3.4 * containerWidth,
                              controller: emailController,
                              isPassword: false,
                              hint: 'mobile number or email',
                              textInputType: TextInputType.none,
                            ),
                            hGap8,
                            CustomTextField(
                              width: 2 / 3.4 * containerWidth,
                              controller: fullNameController,
                              isPassword: false,
                              hint: 'full name',
                              textInputType: TextInputType.name,
                            ),
                            hGap8,
                            CustomTextField(
                              width: 2 / 3.4 * containerWidth,
                              controller: userNameController,
                              isPassword: false,
                              hint: 'Username',
                              textInputType: TextInputType.none,
                            ),
                            hGap8,
                            CustomTextField(
                              width: 2 / 3.4 * containerWidth,
                              controller: passwordController,
                              isPassword: true,
                              hint: "Password",
                              textInputType: TextInputType.none,
                            ),
                            hGap12,
                            const Text(
                              "People who use our service may have uploaded your contact information to Instagram. Learn More",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                            hGap12,
                            const Text(
                              "By signing up, you agree to our Terms . Learn how we collect, use and share your data in our Privacy Policy and how we use cookies and similar technology in our Cookies Policy .",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                            hGap16,
                            SizedBox(
                              width: 240,
                              child: ElevatedButton(
                                onPressed: () async {
                                  try {
                                    await ref
                                        .read(authStateProvider.notifier)
                                        .signUp(
                                          userNameController.text.trim(),
                                          emailController.text.trim(),
                                          passwordController.text.trim(),
                                          fullNameController.text,
                                        );
                                    // ignore: use_build_context_synchronously
                                    context.popRoute();
                                  } catch (_) {}
                                },
                                child: const Text('Sign Up'),
                              ),
                            ),
                            hGap16,
                            TextButton(
                              onPressed: () {},
                              child: const Text('Forgot password?'),
                            ),
                          ],
                        ),
                      ),
                    ),
                    hGap8,
                    Container(
                      width: containerWidth,
                      decoration: BoxDecoration(
                        border: Border.all(),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Have an account? "),
                          TextButton(
                            onPressed: () {
                              context.popRoute();
                            },
                            child: const Text('Log in'),
                          ),
                        ],
                      ),
                    ),
                    hGap16,
                    if (kIsWeb) const Text("Get the app."),
                    hGap16,
                    if (kIsWeb)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: containerWidth * 1 / 3,
                            child: RawMaterialButton(
                              onPressed: () {},
                              child:
                                  Image.asset('assets/google-play-badge.png'),
                            ),
                          ),
                          wGap8,
                          SizedBox(
                            width: containerWidth * 1 / 3,
                            child: RawMaterialButton(
                              onPressed: () {},
                              child: Image.asset(
                                  'assets/5a902db97f96951c82922874.png'),
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
