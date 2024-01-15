import 'package:flutter/material.dart';
import 'package:laser_slides/model/button_model.dart';
import 'package:laser_slides/utlis/utils.dart';

Future<void> showOTPDialog(ButtonModel button, BuildContext mainContext) async {
  final labelController = TextEditingController();
  final buttonPressedController = TextEditingController();
  final buttonReleasedController = TextEditingController();
  bool triggerWhenReleased = false;

  labelController.text = button.name;
  buttonPressedController.text = button.messageButtonPressedAddressRaw;
  buttonReleasedController.text = button.messageButtonReleasedAddressRaw;
  triggerWhenReleased = button.triggerWhenButtonReleased;

  saveButtonData() {
    button.name = labelController.text.trim();
    button.triggerWhenButtonReleased = triggerWhenReleased;
    button.messageButtonPressedAddressRaw = buttonPressedController.text;
    button.messageButtonReleasedAddressRaw = buttonReleasedController.text;
    List<String> msgButtonPressedParts =
        buttonPressedController.text.split(" ");

    button.messageButtonPressedAddress = msgButtonPressedParts[0];
    if (msgButtonPressedParts.length > 1) {
      button.messageButtonPressedArgs = [];
      for (int i = 1; i < msgButtonPressedParts.length; i++) {
        button.messageButtonPressedArgs
            .add(Utils.simpleParse(msgButtonPressedParts[i]));
      }
    } else {
      button.messageButtonPressedArgs = [];
    }

    List<String> msgButtonReleasedParts =
        buttonReleasedController.text.split(" ");

    button.messageButtonReleasedAddress = msgButtonReleasedParts[0];
    if (msgButtonReleasedParts.length > 1) {
      button.messageButtonReleasedArgs = [];
      for (int i = 1; i < msgButtonReleasedParts.length; i++) {
        button.messageButtonReleasedArgs
            .add(Utils.simpleParse(msgButtonReleasedParts[i]));
      }
    } else {
      button.messageButtonReleasedArgs = [];
    }
    button.save();
  }

  return showDialog(
    context: mainContext,
    builder: (BuildContext ncontext) {
      return StatefulBuilder(builder: (context, setState) {
        return AlertDialog(
          backgroundColor: Theme.of(context).colorScheme.background,
          surfaceTintColor: Theme.of(context).colorScheme.background,
          title: const Text(
            'Edit Button',
            style: TextStyle(fontFamily: "poppinsSB", fontSize: 18),
          ),
          content: SingleChildScrollView(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Label",
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
                  controller: labelController,
                  decoration: InputDecoration(
                    hintText: "Button label",
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
                  "Button Pressed",
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
                  controller: buttonPressedController,
                  decoration: InputDecoration(
                    hintText: "Button pressed",
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
                  "Button Released",
                  style: TextStyle(
                    fontFamily: "poppinsM",
                    fontSize: 15,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                Row(
                  children: [
                    Checkbox(
                        activeColor: const Color.fromARGB(221, 252, 69, 69),
                        value: triggerWhenReleased,
                        onChanged: (bool? val) {
                          triggerWhenReleased = val!;
                          setState(() => {});
                        }),
                    Text(
                      "Trigger when button release",
                      style: TextStyle(
                        fontFamily: "poppinsM",
                        fontSize: 13,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                TextField(
                  onChanged: (val) {},
                  maxLength: 4,
                  controller: buttonReleasedController,
                  enabled: triggerWhenReleased,
                  decoration: InputDecoration(
                    hintText: "Button/1",
                    counterText: "",
                    hintStyle:
                        const TextStyle(fontFamily: "poppinsM", fontSize: 12),
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
                  height: 11.5,
                ),
                ElevatedButton(
                  onPressed: () async {
                    saveButtonData();
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
