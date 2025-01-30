import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twitterapp/features/auth/domain/repository/auth_repo.dart';
import 'package:twitterapp/features/post/domain/repositories/post_repo.dart';
import 'package:twitterapp/features/post/presentation/bloc/post_events.dart';
import 'package:twitterapp/features/post/presentation/bloc/post_states.dart';

class PostBloc extends Bloc<PostEvents, PostStates> {
  final PostRepo postRepo;
  final AuthRepo authRepo;
  PostBloc({required this.postRepo, required this.authRepo})
      : super(PostInitial()) {
    on<CreatePost>((event, emit) async {
      try {
        emit(LoadingPost());
        await postRepo.createPost(event.post);
        emit(CreatedPost());
        emit(PostInitial());
      } catch (e) {
        emit(Error(e.toString()));
      }
    });

    on<GetAllPosts>((event, emit) async{
      emit(LoadingPost());
      try {
        final posts = await postRepo.getAllPosts();
        emit(PostsLoaded(posts));
      } catch (e) {
        emit(Error(e.toString()));
      }
    });
  }
}
