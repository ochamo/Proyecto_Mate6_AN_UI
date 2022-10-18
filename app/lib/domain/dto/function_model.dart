import 'package:equatable/equatable.dart';

class FunctionModel extends Equatable {
  final String ft;
  final int start;
  final int end;

  const FunctionModel(
      {required this.ft, required this.start, required this.end});

  @override
  List<Object?> get props => [ft, start, end];
}
