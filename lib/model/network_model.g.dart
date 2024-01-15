// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NetworkModelAdapter extends TypeAdapter<NetworkModel> {
  @override
  final int typeId = 1;

  @override
  NetworkModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NetworkModel(
      outgoingIPAddress: fields[0] as String?,
      outgoingPort: fields[1] as String?,
      startPath: fields[2] as String?,
      listenMessage: fields[3] as bool?,
      incomingIPAddress: fields[4] as String?,
      incomingPort: fields[5] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, NetworkModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.outgoingIPAddress)
      ..writeByte(1)
      ..write(obj.outgoingPort)
      ..writeByte(2)
      ..write(obj.startPath)
      ..writeByte(3)
      ..write(obj.listenMessage)
      ..writeByte(4)
      ..write(obj.incomingIPAddress)
      ..writeByte(5)
      ..write(obj.incomingPort);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NetworkModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
