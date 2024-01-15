// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive/hive.dart';

part 'network_model.g.dart';

@HiveType(typeId: 1)
class NetworkModel extends HiveObject {
  @HiveField(0)
  String? outgoingIPAddress;

  @HiveField(1)
  String? outgoingPort;

  @HiveField(2)
  String? startPath;

  @HiveField(3)
  bool? listenMessage;

  @HiveField(4)
  String? incomingIPAddress;

  @HiveField(5)
  String? incomingPort;
  NetworkModel({
    required this.outgoingIPAddress,
    required this.outgoingPort,
    required this.startPath,
    required this.listenMessage,
    required this.incomingIPAddress,
    required this.incomingPort,
  });
}
