import 'package:api_and_bloc_flutter/Models/Model.dart';
import 'package:equatable/equatable.dart';

abstract class PostState extends Equatable {
  const PostState();

  @override
  List<Object> get props => [];
}

class PostInitial extends PostState {}

class PostLodeing extends PostState {}


class PostSuccess extends PostState {

  List<Model> posts;

  PostSuccess({this.posts});

}

class PostFailure extends PostState {
  String masseg;

  PostFailure(this.masseg);
}

