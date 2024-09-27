import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyDFQRASzHU8F-Z_GLIgC7wF3YmK2PdjGCk",
            authDomain: "t-i-f-maintenance-zyxefr.firebaseapp.com",
            projectId: "t-i-f-maintenance-zyxefr",
            storageBucket: "t-i-f-maintenance-zyxefr.appspot.com",
            messagingSenderId: "460850023647",
            appId: "1:460850023647:web:49415cfe59a2b8d913ed6a"));
  } else {
    await Firebase.initializeApp();
  }
}
