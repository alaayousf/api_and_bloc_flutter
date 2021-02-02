import 'package:api_and_bloc_flutter/blocs/poset_State.dart';
import 'package:api_and_bloc_flutter/blocs/post_Event.dart';
import 'package:api_and_bloc_flutter/reposetory/Post_rep.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Poset_Bloc extends Bloc<PostEvent, PostState> {
  Post_rep repo;
  Poset_Bloc(PostState initialState, this.repo) : super(initialState);
 
  @override
  Stream<PostState> mapEventToState(PostEvent event) async* {
    if (event is PostFetched) {
      yield PostLodeing();
      try {
        var data = await repo.fetchPosts();
        if (data != null) {
          yield PostSuccess(posts: data);
        } else {
          yield PostLodeing();
        }
      } catch (e) {
        yield PostFailure('No Enternet Connection $e');
      }
    }
  }
}
