import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class LoginAuth extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Future<bool> login(String email, String password) async {
    try {
      DocumentSnapshot doc = await firestore.collection('users').doc('users').get();

        if (doc['email']== email && doc['password'] == password) {
            return true;
        } else {
          return false;
        }

    } catch (e) {
      print(e);
    }
    return false;
  }
}
