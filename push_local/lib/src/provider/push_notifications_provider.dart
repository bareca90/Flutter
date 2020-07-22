import 'package:firebase_messaging/firebase_messaging.dart';


class PushNotificationProviders {
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  initNotificaciones(){
    _firebaseMessaging.requestNotificationPermissions();

    _firebaseMessaging.getToken().then((token){
      print('======= FCM TOKEN ======');
      print(token);
      //APA91bFUgtFazrXMxkfolpEykDNCBv-2i5zxyn29q77ZhdJXu5Nr2LqChDeqXbWI189N71kzcdKJtRyN_NewGFKiB1sYNeGLdwnAT4kWujF7CYzW0JeyNapqFhby4OdvHrM5Oi-ebzvf
    });
    _firebaseMessaging.configure(
      onMessage: (info) async{
        print('======== ON Message======');
        print(info);
      },
      onLaunch: (info) async {
        print('======== ON Launch======');
        print(info);
      },
      onResume: (info) async {
        print('======== ON Resume ======');
        print(info);
      }
    );
  }

}