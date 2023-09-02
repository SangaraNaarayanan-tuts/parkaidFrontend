import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:firebase_auth/firebase_auth.dart';
class gUserDetailsNotifier extends StateNotifier<User?> {
  gUserDetailsNotifier() : super(null);
  void initalizeUser(User userDetail) {
    state = userDetail;
  }
}

// Finally, we are using StateNotifierProvider to allow the UI to interact with
// our TodosNotifier class.
final gUserDetailsProvider = StateNotifierProvider<gUserDetailsNotifier, User?>((ref) {
  return gUserDetailsNotifier();
});
