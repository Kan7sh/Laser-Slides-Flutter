import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:laser_slides/Boxes/boxes.dart';
import 'package:laser_slides/model/button_model.dart';
import 'package:laser_slides/model/network_model.dart';
import 'package:laser_slides/repository/network_state.dart';
import 'package:laser_slides/repository/send_osc.dart';
import 'package:laser_slides/screens/edit_button.dart';
import 'package:laser_slides/screens/edit_network.dart';
import 'package:laser_slides/screens/help_screen.dart';
import 'package:laser_slides/theme/light_theme.dart';
import 'package:laser_slides/theme/theme_notifier.dart';
import 'package:provider/provider.dart';

class QuickOSCScreen extends StatefulWidget {
  const QuickOSCScreen({super.key});

  @override
  State<QuickOSCScreen> createState() => _QuickOSCScreenState();
}

class _QuickOSCScreenState extends State<QuickOSCScreen> {
  bool positive = true;
  bool isEditMode = false;
  late var themeBox;
  //final NetworkNotifier notifier = NetworkNotifier();
  final NetworkNotifier _networkNotifier = NetworkNotifier();

  initHive() async {
    themeBox = await Hive.openBox('theme');
  }

  @override
  void initState() {
    super.initState();
    initHive();
    _networkNotifier.wifiStatusStream.listen((isWifiConnected) {
      if (!isWifiConnected) {
        // Show popup or perform actions when WiFi is not connected
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text(
              'WiFi Not Connected',
              style: TextStyle(fontFamily: "poppinsM"),
            ),
            content: const Text(
              'Please check your WiFi connection.',
              style: TextStyle(fontFamily: "poppinsM"),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text(
                  'OK',
                  style: TextStyle(
                    fontFamily: "poppinsM",
                    color: Color.fromARGB(221, 252, 69, 69),
                  ),
                ),
              ),
            ],
          ),
        );
      }
    });
  }

  @override
  void dispose() {
    _networkNotifier.dispose();
    super.dispose();
  }

  final List<List<Color>> buttonColors = [
    [const Color(0xFF2C3E50), const Color(0xFFFD746C)],
    [const Color(0xFfe96443), const Color(0xFF904e95)],
    [const Color(0xFf0B486B), const Color(0xFFF56217)],
    [const Color(0xFf2196f3), const Color(0xFFf44336)],
    [const Color(0xFfFF5F6D), const Color(0xFFFFC371)],
    [const Color(0xFf1D4350), const Color(0xFFA43931)],
    [const Color(0xFf4B79A1), const Color(0xFF283E51)],
    [const Color(0xFf4DA0B0), const Color(0xFFD39D38)],
    [const Color(0xFf114357), const Color(0xFFF29492)],
    [const Color(0xFf403A3E), const Color(0xFFBE5869)],
    [const Color(0xFf8E0E00), const Color(0xFF1F1C18)],
    [const Color(0xFf2c3e50), const Color(0xFF3498db)],
    [const Color(0xFfCCCCB2), const Color(0xFF757519)],
    [const Color(0xFf304352), const Color(0xFFd7d2cc)],
    [const Color(0xFfBA8B02), const Color(0xFF181818)],
  ];

  final options = const LiveOptions(
    delay: Duration(milliseconds: 100),
    showItemInterval: Duration(milliseconds: 200),
    showItemDuration: Duration(milliseconds: 250),
    visibleFraction: 0.1,
    reAnimateOnVisibility: false,
  );

  @override
  Widget build(BuildContext context) {
    bool isDarkTheme =
        Provider.of<ThemeProvider>(context).themeData == lightTheme;
    String lightImage = 'assets/images/white_logo.png';
    String darkImage = 'assets/images/black_logo.png';

    String imagePath = isDarkTheme ? darkImage : lightImage;
    positive = isDarkTheme;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
          toolbarHeight: 70,
          elevation: 0,
          leadingWidth: 300,
          leading: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: [
                Image.asset(
                  "assets/images/help.png",
                  height: 25,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () async {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const HelpScreen()));
                  },
                  child: Text(
                    'Help',
                    style: TextStyle(
                        fontFamily: "poppinsM",
                        fontSize: 18,
                        color: Theme.of(context).colorScheme.primary),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: [
                  AnimatedToggleSwitch<bool>.dual(
                    current: positive,
                    first: false,
                    second: true,
                    spacing: 50.0,
                    style: ToggleStyle(
                      borderColor: Colors.transparent,
                      boxShadow: [
                        BoxShadow(
                          color: Theme.of(context).colorScheme.secondary,
                          spreadRadius: 0,
                          blurRadius: 2,
                        ),
                      ],
                    ),
                    borderWidth: 5.0,
                    height: 55,
                    onChanged: (b) {
                      setState(() {
                        positive = b;
                        Provider.of<ThemeProvider>(context, listen: false)
                            .toggleTheme();
                        if (Provider.of<ThemeProvider>(context, listen: false)
                                .themeData ==
                            lightTheme) {
                          themeBox.put('currentTheme', 'light');
                        } else {
                          themeBox.put('currentTheme', 'dark');
                        }
                      });
                    },
                    styleBuilder: (b) => ToggleStyle(
                        indicatorColor: b
                            ? const Color.fromARGB(255, 21, 163, 234)
                            : const Color.fromARGB(255, 16, 37, 109)),
                    iconBuilder: (value) => value
                        ? const Icon(Icons.sunny)
                        : const Icon(Icons.cloud),
                    textBuilder: (value) => value
                        ? Center(
                            child: Text(
                            'Light',
                            style: TextStyle(
                              fontFamily: "poppinsM",
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ))
                        : Center(
                            child: Text('Dark',
                                style: TextStyle(
                                  fontFamily: "poppinsM",
                                  color: Theme.of(context).colorScheme.primary,
                                ))),
                  ),
                  const SizedBox(
                    width: 25,
                  ),
                  StreamBuilder<String>(
                      stream: _networkNotifier.ipAddressStream,
                      initialData: '',
                      builder: (context, snapshot) {
                        return GestureDetector(
                          onTap: () {
                            if (snapshot.hasData) {
                              editNetwork(snapshot.data!, context);
                            } else {
                              editNetwork('', context);
                            }
                          },
                          child: Row(
                            children: [
                              Image.asset(
                                "assets/images/network.png",
                                height: 22,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Text(
                                'Network',
                                style: TextStyle(
                                    fontFamily: "poppinsM",
                                    fontSize: 18,
                                    color:
                                        Theme.of(context).colorScheme.primary),
                              )
                            ],
                          ),
                        );
                      }),
                ],
              ),
            ),
          ],
          shadowColor: Colors.black,
          surfaceTintColor: Theme.of(context).colorScheme.background,
          backgroundColor: Theme.of(context).colorScheme.background,
          centerTitle: true,
          title: Image.asset(
            imagePath,
            height: 50,
          )),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          isEditMode = !isEditMode;
          setState(() {});
        },
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(30.0), // Adjust the radius as needed
        ),
        foregroundColor: const Color.fromARGB(221, 252, 69, 69),
        label: const Padding(
          padding: EdgeInsets.all(10.0),
          child: Icon(
            Icons.edit,
            size: 30,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color.fromARGB(221, 252, 69, 69),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Divider(
              color: Colors.grey,
              thickness: 0.5,
            ),
            ValueListenableBuilder<Box<ButtonModel>>(
                valueListenable: Boxes.getButtonsData().listenable(),
                builder: (context, box, _) {
                  var data = box.values.toList().cast<ButtonModel>();
                  return LiveGrid.options(
                    physics: const ScrollPhysics(),
                    shrinkWrap: true,
                    options: options,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                    ),
                    itemCount: box.length,
                    itemBuilder: (BuildContext context, int index,
                        Animation<double> an) {
                      List<Color> color = isEditMode
                          ? [
                              Theme.of(context).colorScheme.secondary,
                              Theme.of(context).colorScheme.secondary
                            ]
                          : buttonColors[index % buttonColors.length];
                      return FadeTransition(
                        opacity: Tween<double>(
                          begin: 0,
                          end: 1,
                        ).animate(an),
                        child: SlideTransition(
                          position: Tween<Offset>(
                            begin: const Offset(0, -0.1),
                            end: Offset.zero,
                          ).animate(an),
                          child: Padding(
                            padding: const EdgeInsets.all(30.0),
                            child: Listener(
                              onPointerDown: (_) {
                                if (isEditMode) {
                                  showOTPDialog(data[index], context);
                                } else {
                                  var networkData = Boxes.getNetworkData();
                                  var ndata = networkData.values
                                      .toList()
                                      .cast<NetworkModel>();
                                  sendMessage(
                                      ndata[0].outgoingIPAddress!,
                                      int.parse(ndata[0].outgoingPort!),
                                      ndata[0].startPath! +
                                          data[index]
                                              .messageButtonPressedAddress,
                                      data[index].messageButtonPressedArgs);
                                }
                              },
                              onPointerUp: (_) {
                                if (data[index].triggerWhenButtonReleased) {
                                  var networkData = Boxes.getNetworkData();
                                  var ndata = networkData.values
                                      .toList()
                                      .cast<NetworkModel>();
                                  sendMessage(
                                      ndata[0].outgoingIPAddress!,
                                      int.parse(ndata[0].outgoingPort!),
                                      ndata[0].startPath! +
                                          data[index]
                                              .messageButtonReleasedAddress,
                                      data[index].messageButtonReleasedArgs);
                                }
                              },
                              child: Container(
                                width: double.infinity,
                                height: 65,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(19.0),
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: color,
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    data[index].name,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontFamily: "poppinsSB",
                                        fontSize: 18),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }),
            const Padding(
              padding: EdgeInsets.only(bottom: 50.0),
            ),
          ],
        ),
      ),
    );
  }
}
