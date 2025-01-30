import 'package:twitterapp/features/post/domain/entites/post.dart';

abstract class PostStates {}

class LoadingPost extends PostStates {}

class Error extends PostStates {
  final String errorMessage;
  Error(this.errorMessage);
}

class CreatedPost extends PostStates {
}

class PostsLoaded extends PostStates{
  List<Post> posts;
  PostsLoaded(this.posts);
}

class PostInitial extends PostStates{}