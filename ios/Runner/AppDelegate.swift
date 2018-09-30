import UIKit
import Flutter
import Firebase

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?
  ) -> Bool {
    let firebasePlistName: String
    #if DEBUG
    firebasePlistName = "GoogleService-Info-debug"
    #else
    firebasePlistName = "GoogleService-Info-release"
    #endif
    if let path = Bundle.main.path(forResource: firebasePlistName, ofType: "plist"),
        let firebaseOptions = FirebaseOptions(contentsOfFile: path) {
        FirebaseApp.configure(options: firebaseOptions)
    }

    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
