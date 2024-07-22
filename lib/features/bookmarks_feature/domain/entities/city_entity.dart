import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';

@entity
class City extends Equatable{

  @PrimaryKey(autoGenerate : true)
  int? id;

  String? name;

  City({required this.name});

  @override
  // TODO: implement props
  List<Object?> get props => [];

}