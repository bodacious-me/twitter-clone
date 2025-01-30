import 'package:twitterapp/features/post/domain/entites/post.dart';

abstract class PostEvents {}

class CreatePost extends PostEvents{
  Post post;
  CreatePost(this.post);
}

class DeletePost extends PostEvents{}

class EditPost extends PostEvents{}

class GetAllPosts extends PostEvents{}



