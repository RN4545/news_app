import 'package:equatable/equatable.dart';

abstract class NewsEvent extends Equatable {
  const NewsEvent();

  @override
  List<Object?> get props => throw UnimplementedError();
}

class FetchNews extends NewsEvent {}
