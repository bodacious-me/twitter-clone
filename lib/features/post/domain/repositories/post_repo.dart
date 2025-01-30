import 'package:twitterapp/features/post/domain/entites/post.dart';

abstract class PostRepo {
  Future<List<Post>> getAllPosts();
  Future<Post> getPost();
  Future<Post> editPost(String id, String userId);
  Future<void> deletePost(String id, String userId);
  Future<void> createPost(Post post);
}
