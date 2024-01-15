// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:laser_slides/Boxes/boxes.dart';
import 'package:laser_slides/model/button_model.dart';
import 'package:laser_slides/model/network_model.dart';
import 'package:laser_slides/screens/quick_osc_screen.dart';
import 'package:laser_slides/theme/dark_theme.dart';
import 'package:laser_slides/theme/light_theme.dart';
import 'package:laser_slides/theme/theme_notifier.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  var directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);

  Hive.registerAdapter(ButtonModelAdapter());
  Hive.registerAdapter(NetworkModelAdapter());
  await Hive.openBox<ButtonModel>('buttons');
  await Hive.openBox<NetworkModel>('network');

  var buttonData = Boxes.getButtonsData();
  var networkData = Boxes.getNetworkData();
  if (buttonData.length == 0) {
    await _setValuesForButton();
  }
  if (networkData.isEmpty) {
    _setNetworkData();
  }
  runApp(ChangeNotifierProvider(
    create: (context) => ThemeProvider(),
    child: const MyApp(),
  ));
}

_setNetworkData() async {
  final box = Boxes.getNetworkData();
  NetworkModel networkData = NetworkModel(
      incomingIPAddress: "",
      incomingPort: "8090",
      startPath: "/",
      listenMessage: true,
      outgoingIPAddress: "127.0.0.1",
      outgoingPort: "8000");

  box.add(networkData);
  networkData.save();
}

_setValuesForButton() async {
  final box = Boxes.getButtonsData();
  for (int i = 0; i < 15; i++) {
    ButtonModel button = ButtonModel(
      index: i,
      name: "btn${i + 1}",
      messageButtonPressedAddress: "btn${i + 1}/1",
      messageButtonPressedArgs: [],
      messageButtonReleasedAddress: "btn${i + 1}/1",
      messageButtonReleasedArgs: [],
      triggerWhenButtonReleased: false,
      messageButtonPressedAddressRaw: "btn${i + 1}/1",
      messageButtonReleasedAddressRaw: "btn${i + 1}/1",
    );

    box.add(button);
    button.save();
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  getCurrentTheme() async {
    var themeBox = await Hive.openBox('theme');
    var theme = themeBox.get('currentTheme');
    if (theme == null) {
      if (MediaQuery.of(context).platformBrightness == Brightness.light) {
        Provider.of<ThemeProvider>(context, listen: false).themeData =
            lightTheme;
        themeBox.put('currentTheme', 'light');
      } else {
        Provider.of<ThemeProvider>(context, listen: false).themeData =
            darkTheme;
        themeBox.put('currentTheme', 'dark');
      }
    } else if (theme == 'light') {
      Provider.of<ThemeProvider>(context, listen: false).themeData = lightTheme;
    } else if (theme == 'dark') {
      Provider.of<ThemeProvider>(context, listen: false).themeData = darkTheme;
    }
  }

  @override
  void initState() {
    super.initState();
    getCurrentTheme();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Laser Slides',
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeProvider>(context).themeData,
      home: const QuickOSCScreen(),
    );
  }
}
