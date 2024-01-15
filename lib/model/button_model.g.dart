// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'button_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ButtonModelAdapter extends TypeAdapter<ButtonModel> {
  @override
  final int typeId = 0;

  @override
  ButtonModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ButtonModel(
      index: fields[0] as int,
      name: fields[1] as String,
      messageButtonPressedAddress: fields[2] as String,
      messageButtonPressedAddressRaw: fields[3] as String,
      messageButtonPressedArgs: (fields[4] as List).cast<Object>(),
      messageButtonReleasedAddress: fields[5] as String,
      messageButtonReleasedAddressRaw: fields[6] as String,
      messageButtonReleasedArgs: (fields[7] as List).cast<Object>(),
      triggerWhenButtonReleased: fields[8] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, ButtonModel obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.index)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.messageButtonPressedAddress)
      ..writeByte(3)
      ..write(obj.messageButtonPressedAddressRaw)
      ..writeByte(4)
      ..write(obj.messageButtonPressedArgs)
      ..writeByte(5)
      ..write(obj.messageButtonReleasedAddress)
      ..writeByte(6)
      ..write(obj.messageButtonReleasedAddressRaw)
      ..writeByte(7)
      ..write(obj.messageButtonReleasedArgs)
      ..writeByte(8)
      ..write(obj.triggerWhenButtonReleased);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ButtonModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
