// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class categoryModelAdapter extends TypeAdapter<categoryModel> {
  @override
  final int typeId = 1;

  @override
  categoryModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return categoryModel(
      id: fields[0] as String,
      name: fields[1] as String,
      type: fields[3] as categoryType,
      isDeleted: fields[2] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, categoryModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.isDeleted)
      ..writeByte(3)
      ..write(obj.type);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is categoryModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class categoryTypeAdapter extends TypeAdapter<categoryType> {
  @override
  final int typeId = 2;

  @override
  categoryType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return categoryType.income;
      case 1:
        return categoryType.expense;
      default:
        return categoryType.income;
    }
  }

  @override
  void write(BinaryWriter writer, categoryType obj) {
    switch (obj) {
      case categoryType.income:
        writer.writeByte(0);
        break;
      case categoryType.expense:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is categoryTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
