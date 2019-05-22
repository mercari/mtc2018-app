import 'package:flutter_web_ui/ui.dart' as ui;

import 'package:mtc2018_app/main.dart' as app;

main() async {
  await ui.webOnlyInitializePlatform();
  app.main();
}