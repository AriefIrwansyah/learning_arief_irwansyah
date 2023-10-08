import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning/src/presentation/blocs/auth/auth_bloc.dart';
import 'package:learning/src/presentation/screen/auth/registration_form_page.dart';

class LoginBodyWidget extends StatelessWidget {
  const LoginBodyWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const SizedBox(height: 24),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                // Image.network(
                //   'https://lp2m.uma.ac.id/wp-content/uploads/2021/04/modulelearning.png',
                //   width: 270,
                //   height: 200,
                //   fit: BoxFit.cover,
                //   errorBuilder: (context, error, stackTrace) {
                //     return Image.asset(
                //       'assets/images/error_image.jpg',
                //       width: 270,
                //       height: 200,
                //     );
                //   },
                // ),
                Image.asset(
                  'assets/images/analysis_Isometric.png',
                  width: 400,
                ),
                const SizedBox(height: 36),
                const Text(
                  'Selamat Datang',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'Selamat Datang di Aplikasi Widya Edu\nAplikasi Latihan dan Konsultasi Soal',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(
                        255, 255, 255, 255), // background color
                    foregroundColor: Colors.black, // text color
                    shadowColor: Colors.black,
                  ),
                  // onPressed: () => Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => HomeNavigationScreen(),
                  //     )),
                  onPressed: () async {
                    context.read<AuthBloc>().add(SignInWithGoogleEvent());
                  },
                  label: const Text('Login With Google'),
                  icon: Image.asset(
                    'assets/images/icons8-google-48.png',
                  ),
                ),
                const SizedBox(height: 12),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(
                        255, 61, 59, 59), // background color
                    foregroundColor: Colors.white, // text color
                    shadowColor: Colors.black,
                  ),
                  onPressed: () => Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => const RegistrationFormScreen(),
                      )),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        'assets/images/apple-logo.png',
                      ),
                      const SizedBox(width: 12),
                      const Text('Login With Apple'),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
              ],
            )
          ],
        ),
      ),
    );
  }
}
