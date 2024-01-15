// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:laser_slides/Boxes/boxes.dart';
import 'package:laser_slides/model/network_model.dart';

Future<void> editNetwork(String ipaddress, BuildContext mainContext) async {
  final incomingIPController = TextEditingController();
  final incomingPortController = TextEditingController();
  final startPathController = TextEditingController();
  final outgoingIPController = TextEditingController();
  final outgoingPortController = TextEditingController();
  bool listenMessage = true;
  var networkData = Boxes.getNetworkData();
  var data = networkData.values.toList().cast<NetworkModel>();
  incomingIPController.text = ipaddress;
  incomingPortController.text = data[0].incomingPort!;
  startPathController.text = data[0].startPath!;
  outgoingPortController.text = data[0].outgoingPort!;
  outgoingIPController.text = data[0].outgoingIPAddress!;
  listenMessage = data[0].listenMessage!;
  saveNetworkData() {
    data[0].incomingPort = incomingPortController.text.trim();
    data[0].startPath = startPathController.text.trim();
    data[0].outgoingPort = outgoingPortController.text.trim();
    data[0].outgoingIPAddress = outgoingIPController.text.trim();
    data[0].listenMessage = listenMessage;
    data[0].save();
  }

  return showDialog(
    context: mainContext,
    builder: (BuildContext ncontext) {
      return StatefulBuilder(builder: (context, setState) {
        return AlertDialog(
          backgroundColor: Theme.of(context).colorScheme.background,
          surfaceTintColor: Theme.of(context).colorScheme.background,
          title: Text(
            'Network Setting',
            style: TextStyle(
              fontFamily: "poppinsSB",
              fontSize: 18,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          content: SingleChildScrollView(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Outgoing",
                  style: TextStyle(
                    fontFamily: "poppinsSB",
                    fontSize: 16,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                Text(
                  "IP Address",
                  style: TextStyle(
                    fontFamily: "poppinsM",
                    fontSize: 15,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                TextField(
                  onChanged: (val) {},
                  controller: outgoingIPController,
                  decoration: InputDecoration(
                    hintText: "IP Address",
                    counterText: "",
                    hintStyle:
                        const TextStyle(fontFamily: "poppinsM", fontSize: 15),
                    fillColor: Theme.of(context).colorScheme.tertiary,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                        borderRadius: BorderRadius.circular(20)),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                        borderRadius: BorderRadius.circular(20)),
                    disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                        borderRadius: BorderRadius.circular(20)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Port",
                  style: TextStyle(
                    fontFamily: "poppinsM",
                    fontSize: 15,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                TextField(
                  onChanged: (val) {},
                  controller: outgoingPortController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    hintText: "Port",
                    counterText: "",
                    hintStyle:
                        const TextStyle(fontFamily: "poppinsM", fontSize: 15),
                    fillColor: Theme.of(context).colorScheme.tertiary,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                        borderRadius: BorderRadius.circular(20)),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                        borderRadius: BorderRadius.circular(20)),
                    disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                        borderRadius: BorderRadius.circular(20)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Start Path",
                  style: TextStyle(
                    fontFamily: "poppinsM",
                    fontSize: 15,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                TextField(
                  onChanged: (val) {},
                  controller: startPathController,
                  decoration: InputDecoration(
                    hintText: "Start path",
                    counterText: "",
                    hintStyle:
                        const TextStyle(fontFamily: "poppinsM", fontSize: 15),
                    fillColor: Theme.of(context).colorScheme.tertiary,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                        borderRadius: BorderRadius.circular(20)),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                        borderRadius: BorderRadius.circular(20)),
                    disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                        borderRadius: BorderRadius.circular(20)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  "Incoming",
                  style: TextStyle(
                    fontFamily: "poppinsSB",
                    fontSize: 16,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                Row(
                  children: [
                    Checkbox(
                        activeColor: const Color.fromARGB(221, 252, 69, 69),
                        value: listenMessage,
                        onChanged: (bool? val) {
                          listenMessage = val!;
                          setState(() => {});
                        }),
                    Text(
                      "Listen for incoming messages",
                      style: TextStyle(
                        fontFamily: "poppinsM",
                        fontSize: 13,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  "IP Address",
                  style: TextStyle(
                    fontFamily: "poppinsM",
                    fontSize: 15,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                TextField(
                  onChanged: (val) {},
                  controller: incomingIPController,
                  enabled: false,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    hintText: "IP Address",
                    counterText: "",
                    hintStyle:
                        const TextStyle(fontFamily: "poppinsM", fontSize: 15),
                    fillColor: Theme.of(context).colorScheme.tertiary,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                        borderRadius: BorderRadius.circular(20)),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                        borderRadius: BorderRadius.circular(20)),
                    disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                        borderRadius: BorderRadius.circular(20)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Port",
                  style: TextStyle(
                    fontFamily: "poppinsM",
                    fontSize: 15,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                TextField(
                  onChanged: (val) {},
                  controller: incomingPortController,
                  decoration: InputDecoration(
                    hintText: "Port",
                    counterText: "",
                    hintStyle:
                        const TextStyle(fontFamily: "poppinsM", fontSize: 15),
                    fillColor: Theme.of(context).colorScheme.tertiary,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                        borderRadius: BorderRadius.circular(20)),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                        borderRadius: BorderRadius.circular(20)),
                    disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                        borderRadius: BorderRadius.circular(20)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    saveNetworkData();
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                      elevation: 5,
                      backgroundColor: const Color.fromARGB(221, 252, 69, 69),
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                  child: const Text(
                    "Save",
                    style: TextStyle(
                        fontFamily: "poppinsSB",
                        fontSize: 16,
                        color: Colors.white),
                  ),
                ),
              ],
            ),
          )),
        );
      });
    },
  );
}
