// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive/hive.dart';

part 'button_model.g.dart';

@HiveType(typeId: 0)
class ButtonModel extends HiveObject {
  @HiveField(0)
  int index;

  @HiveField(1)
  String name;

  @HiveField(2)
  String messageButtonPressedAddress;

  @HiveField(3)
  String messageButtonPressedAddressRaw;

  @HiveField(4)
  List<Object> messageButtonPressedArgs;

  @HiveField(5)
  String messageButtonReleasedAddress;

  @HiveField(6)
  String messageButtonReleasedAddressRaw;

  @HiveField(7)
  List<Object> messageButtonReleasedArgs;

  @HiveField(8)
  bool triggerWhenButtonReleased;

  ButtonModel({
    required this.index,
    required this.name,
    required this.messageButtonPressedAddress,
    required this.messageButtonPressedAddressRaw,
    required this.messageButtonPressedArgs,
    required this.messageButtonReleasedAddress,
    required this.messageButtonReleasedAddressRaw,
    required this.messageButtonReleasedArgs,
    required this.triggerWhenButtonReleased,
  });
}
