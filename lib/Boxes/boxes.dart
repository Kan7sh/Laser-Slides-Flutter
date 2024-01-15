import 'package:hive/hive.dart';
import 'package:laser_slides/model/button_model.dart';
import 'package:laser_slides/model/network_model.dart';

class Boxes {
  static Box<ButtonModel> getButtonsData() => Hive.box<ButtonModel>("buttons");
  static Box<NetworkModel> getNetworkData() =>
      Hive.box<NetworkModel>("network");
}
