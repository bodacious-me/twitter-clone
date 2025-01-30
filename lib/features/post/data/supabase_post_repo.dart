import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:twitterapp/features/post/domain/entites/post.dart';
import 'package:twitterapp/features/post/domain/repositories/post_repo.dart';

class SupabasePostRepo implements PostRepo {
  final _supabase = Supabase.instance.client;
  @override
  Future<void> deletePost(String id, String userId) {
    // TODO: implement deletePost
    throw UnimplementedError();
  }

  @override
  Future<Post> editPost(String id, String userId) {
    // TODO: implement editPost
    throw UnimplementedError();
  }

  @override
  Future<List<Post>> getAllPosts() async {
    try {
      final data = await _supabase.from('posts').select();
      List<Post> posts = data
          .map((postMap) => Post(
            header: postMap['postHeader'],
            views: postMap['views'],
              Likes: postMap['Likes'],  
              id: postMap['id'],
              userEmail: postMap['userEmail'],
              postImageUrl: postMap['MediaUrl'],
              content: postMap['Content'],
              timestamp: postMap['created_at']))
          .toList();
      return posts;
    } catch (e) {
      throw Exception(
          'an Error while fetching all posts in supabase_post_repo: ${e}');
    }
  }

  @override
  Future<Post> getPost() {
    // TODO: implement getPost
    throw UnimplementedError();
  }

  @override
  Future<void> createPost(Post post) async {
    try {
      await _supabase.from('posts').insert({
        'postHeader': post.header,
        'userEmail': post.userEmail,
        'MediaUrl': post.postImageUrl,
        'Content': post.content
      });
    } catch (e) {
      throw Exception(
          'An Error Occured in supabase_post_repo: ${e.toString()}');
    }
  }
}
