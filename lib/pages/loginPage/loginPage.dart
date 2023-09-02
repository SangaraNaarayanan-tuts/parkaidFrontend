import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:parkaid/services/googleLogin.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: ((context, snapshot) {

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(
              body: Center(
                  child: CircularProgressIndicator(
                color: Colors.black,
              )),
            );
          } else if (snapshot.hasError) {
            // error
            return Scaffold(
              body: Center(
                  child: Container(
                      child: const Text("unexpected Error Occurred"))),
            );
          } else if (snapshot.hasData) {
            Future.microtask(() {
              Navigator.of(context).pushNamed('/dashboard', arguments: {"userDetails": snapshot.data});
            });

            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            // signup
            return Scaffold(
              body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('lib/images/mainLogo.png'),
                  Container(
                    margin: const EdgeInsetsDirectional.symmetric(
                        horizontal: 75, vertical: 0),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 15),
                          backgroundColor: Colors.black,
                        ),
                        onPressed: () async {
                          await googleLogin().gmailLogin();
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.face,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Flexible(
                                child: Text(
                              "Login with Google",
                              style: TextStyle(color: Colors.white),
                            ))
                          ],
                        )),
                  )
                ],
              ),
            );
          }
        }));
  }
}
