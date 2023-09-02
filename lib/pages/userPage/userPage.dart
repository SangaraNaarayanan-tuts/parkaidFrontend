import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:parkaid/pages/userPage/components/userCard.dart';
import 'package:parkaid/services/api.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  late Future<dynamic> getUserDetailsInstance;
  Future<bool> signOut() async {
    try {
      await GoogleSignIn().signOut();
      await FirebaseAuth.instance.signOut();
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  @override
  void initState() {
    super.initState();
    getUserDetailsInstance =
        BackendApi().getUserDetails({"userEmail": "sangartuts@gmail.com"});
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getUserDetailsInstance,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData && snapshot.data != null) {
            print(snapshot.data);
            return Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    child: const UserCard()),
                SizedBox(
                  height: 50,
                  width: 200,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.logout_outlined,
                            color: Theme.of(context).colorScheme.secondary),
                        Text(
                          " Sign Out",
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.secondary),
                        ),
                      ],
                    ),
                    onPressed: () async {
                      bool signOutSts = await signOut();
                      if (signOutSts) {
                        Navigator.of(context).pushNamed('/login');
                      }
                    },
                  ),
                )
              ],
            );
          } else {
            return Container(
              child: const Text("Unexpected Error Occured"),
            );
          }
        });
  }
}
