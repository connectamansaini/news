import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/src/auth/bloc/auth_bloc.dart';
import 'package:news/src/auth/views/login_view.dart';
import 'package:news/src/core/domain/enums.dart';
import 'package:news/src/core/presentation/theme.dart';
import 'package:news/src/home/views/detail_view.dart';
import 'package:news/src/home/views/widgets/logout_alert_dialog.dart';
import 'package:news/src/news/bloc/news_bloc.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    context.read<NewsBloc>().add(NewsRequested());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.authStatus == AuthStatus.unauthenticated) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute<void>(builder: (context) => const LoginView()),
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
          actions: [
            IconButton(
              onPressed: () {
                showAlertDialog(context);
              },
              icon: const Icon(Icons.logout),
            )
          ],
        ),
        body: BlocBuilder<NewsBloc, NewsState>(
          builder: (context, state) {
            return ListView.builder(
              itemCount: state.news.articles.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 4,
                  margin:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                          builder: (context) => DetailView(
                            article: state.news.articles[index],
                          ),
                        ),
                      );
                    },
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 12,
                    ),
                    // leading: Image.network(
                    //   state.news.articles[index].urlToImage,
                    //   fit: BoxFit.fill,
                    // ),

                    title: Text(
                      state.news.articles[index].title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).titleSmallPrimary,
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                        'By ${state.news.articles[index].source.name}',
                      ),
                    ),
                    trailing:
                        displayImage(state.news.articles[index].urlToImage),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
