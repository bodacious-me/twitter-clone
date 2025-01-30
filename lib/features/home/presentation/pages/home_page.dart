import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twitterapp/features/auth/data/supabase_auth_repo.dart';
import 'package:twitterapp/features/auth/domain/entites/user.dart';
import 'package:twitterapp/features/auth/domain/repository/auth_repo.dart';
import 'package:twitterapp/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:twitterapp/features/auth/presentation/bloc/auth_events.dart';
import 'package:twitterapp/features/home/presentation/components/box_containers.dart';
import 'package:twitterapp/features/home/presentation/components/create_post_field.dart';
import 'package:twitterapp/features/home/presentation/components/home_button.dart';
import 'package:twitterapp/features/home/presentation/components/post_button.dart';
import 'package:twitterapp/features/home/presentation/components/posts_column.dart';
import 'package:twitterapp/features/home/presentation/components/profile_box.dart';
import 'package:twitterapp/features/home/presentation/components/search_field.dart';
import 'package:twitterapp/features/post/domain/entites/post.dart';
import 'package:twitterapp/features/post/presentation/bloc/post_bloc.dart';
import 'package:twitterapp/features/post/presentation/bloc/post_events.dart';
import 'package:twitterapp/features/post/presentation/bloc/post_states.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  final AppUser? user; // Make sure to use final for immutability

  HomePage({
    super.key,
    required this.user,
  });
  int selectedButtonIndexLeft = 0;
  int selectedButtonIndexRight = 0;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool showPostPopUp = false;
  final TextEditingController controller = TextEditingController();


  Widget createPostPopUp() {
    return Container(
      width: 400,
      height: 600,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color(0xFF262D34),
      ),
    );
  }

  void createPost() async {
    print('called the createPostmethod ');
    try {
      context.read<PostBloc>().add(CreatePost(Post(
          views: 0,
          header: 'Headers',
          Likes: 0,
          postImageUrl: 'a',
          userEmail: widget.user!.email,
          id: 0,
          content: controller.text,
          timestamp: DateTime.now().toString())));
    } catch (e) {
      throw Exception("ERRRRRORRRRR");
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PostBloc, PostStates>(builder: (context, state) {
      print('state in the POSTBLOC: ${state}');
      if (state is LoadingPost) {
        return Center(child: CircularProgressIndicator());
      } else if (state is CreatedPost) {
        print('Created Post Successfully');
      } else if (state is PostInitial) {
        context.read<PostBloc>().add(GetAllPosts());
      } else if (state is PostsLoaded) {
        final allPosts = state.posts;
        return buildHomePage(allPosts);
      }
      return buildHomePage([]);
    }, listener: (context, state) {
      if (state is CreatedPost) {
        print('Posted Succcessfully');
      } else if (state is Error) {
        print('ERRORR: ${state.errorMessage}');
      }
      // else if (state is PostInitial) {
      //   context.read<PostBloc>().add(GetAllPosts());
      // }
    });
  }

  Widget buildHomePage(List<Post> allPosts) {
    return Scaffold(
      appBar: AppBar(
        elevation: 6,
        toolbarHeight: 70,
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xFF262D34),
        title: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text('Thinkpads',
                    style: TextStyle(
                        color: Color(0xFFFF571A),
                        fontSize: 20,
                        fontWeight: FontWeight.w900)),
              ),
              const Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: HomeButton(),
                  ),
                  SearchField(),
                ],
              ),
              Row(
                children: [
                  ProfileBox(
                      imageUrl: widget.user!.profileImageUrl,
                      username: widget.user!.username),
                ],
              ),
            ],
          ),
        ),
      ),
      body: Container(
        color: Color(0xFF1E252B),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          width: 300,
                          height: 300,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color(0xFF262D34),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                child: BoxContainers(
                                    boldText: 'Newest and Recent',
                                    text: 'find the latest update',
                                    IconUrl:
                                        'https://img.icons8.com/color/48/new--v1.png',
                                    selected:
                                        widget.selectedButtonIndexLeft == 0
                                            ? true
                                            : false),
                                onTap: () {
                                  print('Clicked');
                                  setState(() {
                                    widget.selectedButtonIndexLeft = 0;
                                  });
                                },
                              ),
                              GestureDetector(
                                child: BoxContainers(
                                    boldText: 'Popular of the day',
                                    text: 'Shots featured today',
                                    IconUrl:
                                        'https://img.icons8.com/external-anggara-flat-anggara-putra/32/external-trending-ui-basic-anggara-flat-anggara-putra-2.png',
                                    selected:
                                        widget.selectedButtonIndexLeft == 1
                                            ? true
                                            : false),
                                onTap: () {
                                  print('Clicked');
                                  setState(() {
                                    widget.selectedButtonIndexLeft = 1;
                                  });
                                },
                              ),
                              GestureDetector(
                                child: BoxContainers(
                                    boldText: 'Following',
                                    text: 'Explore from your favorites',
                                    IconUrl:
                                        'https://cdn-icons-png.freepik.com/256/10264/10264564.png?semt=ais_hybrid',
                                    selected:
                                        widget.selectedButtonIndexLeft == 2
                                            ? true
                                            : false),
                                onTap: () {
                                  print('Clicked');
                                  setState(() {
                                    widget.selectedButtonIndexLeft = 2;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          width: 300,
                          height: 800,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color(0xFF262D34),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          width: 300,
                          height: 400,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color(0xFF262D34),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  createPostField(
                    onTap: () {
                      createPost();
                    },
                    controller: controller,
                    showPopUp: showPostPopUp,
                  ),
                  if(showPostPopUp)
                  createPostPopUp(),
                  PostsColumn(
                    posts: allPosts,
                  ),

                ],
              ),
            ),
            Container(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          width: 300,
                          height: 300,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color(0xFF262D34),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'For sale ->',
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 17),
                                ),
                                GestureDetector(
                                  child: BoxContainers(
                                      boldText: 'LENOVO THINKPAD P53',
                                      text: 'US \$249.99',
                                      IconUrl:
                                          'https://img.icons8.com/officel/80/technology-items.png',
                                      selected:
                                          widget.selectedButtonIndexRight == 0
                                              ? true
                                              : false),
                                  onTap: () async {
                                    Uri link = Uri.parse(
                                        "https://www.ebay.com/itm/226052371811?mkcid=16&mkevt=1&mkrid=711-127632-2357-0&ssspo=leKbbnApRWi&sssrc=2047675&ssuid=&widget_ver=artemis&media=COPY");
                                    if (await canLaunchUrl(link)) {
                                      await launchUrl(link);
                                    } else {
                                      throw 'Could not launch link';
                                    }
                                    setState(() {
                                      widget.selectedButtonIndexRight = 0;
                                    });
                                  },
                                ),
                                GestureDetector(
                                  child: BoxContainers(
                                      boldText: 'Lenovo ThinkPad T480',
                                      text: 'US \$269.99',
                                      IconUrl:
                                          'https://img.icons8.com/officel/80/technology-items.png',
                                      selected:
                                          widget.selectedButtonIndexRight == 1
                                              ? true
                                              : false),
                                  onTap: () async {
                                    Uri link = Uri.parse(
                                        "https://www.ebay.com/itm/196967933430?mkcid=16&mkevt=1&mkrid=711-127632-2357-0&ssspo=ixMNcT_dTnG&sssrc=2047675&ssuid=&widget_ver=artemis&media=COPY");
                                    if (await canLaunchUrl(link)) {
                                      await launchUrl(link);
                                    } else {
                                      throw 'Could not launch link';
                                    }
                                    setState(() {
                                      widget.selectedButtonIndexRight = 1;
                                    });
                                  },
                                ),
                                GestureDetector(
                                  child: BoxContainers(
                                      boldText: 'Lenovo ThinkPad T14',
                                      text: 'US \$274.99',
                                      IconUrl:
                                          'https://img.icons8.com/officel/80/technology-items.png',
                                      selected:
                                          widget.selectedButtonIndexRight == 2
                                              ? true
                                              : false),
                                  onTap: () async {
                                    Uri link = Uri.parse(
                                        "https://www.ebay.com/itm/196967669451?itmmeta=01JJGYX09JGHXQ8PQDV7NJ0EM5&hash=item2ddc301ecb:g:87UAAOSwMilnk-Iu&itmprp=enc%3AAQAJAAAA4CodCO1vSDjg2xNOt8By6oByRId6bt0o4JP00yYD44ocpCiojyDIBT%2BnvUv%2B0pnDbbDn1mbdlQ2zIdF1cboda627aLfFYWUkjcCU%2FTnl40B5ZIKbJB1MvoRIhysNYtjdSciI2YENVxF1VPNEFAlnQCkvYfuSEq1RpaFYHFenCYH3%2FJkf%2BsMKJ9nSl%2Bo82szypgEB0HSD0HPuycHf4PsqnZoqnN8x%2FNQJo16Vw%2BXFHmV8nLxxL9Afa3s6qd4LaC856cwFd5LuVT1JycpubM8cxF%2Bm%2B1idr3Qz0DH9O1tYUaxN%7Ctkp%3ABFBM9IT0npRl");
                                    if (await canLaunchUrl(link)) {
                                      await launchUrl(link);
                                    } else {
                                      throw 'Could not launch link';
                                    }
                                    setState(() {
                                      widget.selectedButtonIndexRight = 2;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          width: 300,
                          height: 800,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color(0xFF262D34),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
