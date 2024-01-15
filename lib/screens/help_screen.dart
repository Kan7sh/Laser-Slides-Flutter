import 'package:flutter/material.dart';
import 'package:laser_slides/theme/light_theme.dart';
import 'package:laser_slides/theme/theme_notifier.dart';
import 'package:provider/provider.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({super.key});

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  @override
  Widget build(BuildContext context) {
    bool isDarkTheme =
        Provider.of<ThemeProvider>(context).themeData == lightTheme;
    String lightImage = 'assets/images/white_logo.png';
    String darkImage = 'assets/images/black_logo.png';

    String imagePath = isDarkTheme ? darkImage : lightImage;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
          toolbarHeight: 70,
          elevation: 0,
          surfaceTintColor: Theme.of(context).colorScheme.background,
          backgroundColor: Theme.of(context).colorScheme.background,
          centerTitle: true,
          title: Image.asset(
            imagePath,
            height: 50,
          )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Divider(
              color: Colors.grey,
              thickness: 0.5,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      Image.asset(
                        imagePath,
                        height: 200,
                      ),
                      Image.asset(
                        "assets/images/logo1.png",
                        height: 200,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "ABOUT",
                    style: TextStyle(
                        color: Color.fromARGB(221, 252, 69, 69),
                        fontFamily: "poppinsSB",
                        fontSize: 18),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    "LaserSlides is a very simple, dirty and quick OSC (Open Sound Control) application which lets you modify OSC messages on your phone/tablet, ready to be shown for your laser presentations.This Android application controls the BEYOND laser software by Pangolin. (or any other OSC controlled software or hardware)(C) Pangolin Laser Systems, Inc. (Pangolin.com)",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontFamily: "poppinsM",
                        fontSize: 14),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    "OSC is a protocol for networking sound synthesizers, computers and other media devices usually for show control or musical performance.",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontFamily: "poppinsM",
                        fontSize: 14),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const Text(
                    "HELP",
                    style: TextStyle(
                        color: Color.fromARGB(221, 252, 69, 69),
                        fontFamily: "poppinsSB",
                        fontSize: 18),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    "On the BEYOND application, we must go to OSC settings and look for the ip shown. Once we know the ip, we must go to the “network” button on the LaserSlides app and put the ip that we have seen at BEYOND.",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontFamily: "poppinsM",
                        fontSize: 14),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    'Now that we are connected, if we press the “edit mode” button on the bottom right, we will be able to edit all buttons to suit our needs. Once we have pressed the “edit mode” button, (we know if we are in edit mode if the background is black/gray), we can press all buttons displayed on the screen.',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontFamily: "poppinsM",
                        fontSize: 14),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    'Let’s edit the “button 1”.On the label, we have to put the name we want to see at the button.On the button pressed field, we are going to put the BEYOND PATH where the image we want to display is stored.First and foremost, we must know how BEYOND PATH works, the first cell is the 0 0, and the first row goes from 0 0, to 0 9. The second row 0 10, to 0 19 and so on.Once we know this, the command we have to use is:',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontFamily: "poppinsM",
                        fontSize: 14),
                  ),
                  Text(
                    'beyond/general/startcue 0 0 (for the first cell)',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontFamily: "poppinsM",
                        fontSize: 14),
                  ),
                  Text(
                    'There are other default commands as blackout:',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontFamily: "poppinsM",
                        fontSize: 14),
                  ),
                  Text(
                    'beyond/master/blackout',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontFamily: "poppinsM",
                        fontSize: 14),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    'All the OSC commands references can be found at \nhttps://wiki.pangolin.com/beyond:osc_commands',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontFamily: "poppinsM",
                        fontSize: 14),
                  ),
                  Text(
                    'Finally we save the modifications and if we do not want to keep editing, we press again the “edit mode”.',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontFamily: "poppinsM",
                        fontSize: 14),
                  ),
                  const Text(
                    "LaserSlides is based on app made by Albert Merino and Artur Cullerés  https://github.com/Kan7sh/Laser-Slides-Flutter",
                    style: TextStyle(
                        color: Color.fromARGB(221, 252, 69, 69),
                        fontFamily: "poppinsM",
                        fontSize: 14),
                  ),
                  const Text(
                    "Made By Kanish Chhabra",
                    style: TextStyle(
                        color: Color.fromARGB(221, 251, 194, 60),
                        fontFamily: "poppinsM",
                        fontSize: 14),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
