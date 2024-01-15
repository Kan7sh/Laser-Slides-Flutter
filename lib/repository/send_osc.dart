import 'dart:io';

import 'package:osc/osc.dart';
import 'package:udp/udp.dart';

sendMessage(String recieverIPAddress, int recieverPortNumber, String oscAddress,
    List<Object> arguments) async {
  var sender = await UDP.bind(Endpoint.any());

  var receiverIP = InternetAddress(recieverIPAddress);
  var receiverPort = Port(recieverPortNumber);
  var receiverEndpoint = Endpoint.multicast(receiverIP, port: receiverPort);

  var message = OSCMessage(oscAddress, arguments: arguments);

  var bytesToSend = message.toBytes();

  await sender.send(bytesToSend, receiverEndpoint);

  sender.close();
}
