import 'package:flutter/material.dart';
import 'package:unittoni_tasks/Home/presentation/manager/home_cubit.dart';
import 'package:unittoni_tasks/core/di/injection_container.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/news_row.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di<HomeCubit>(),
      child: const _Page(),
    );
  }
}

class _Page extends StatefulWidget {
  const _Page();

  @override
  State<_Page> createState() => _PageState();
}

class _PageState extends State<_Page> {
  final _controller1 = TextEditingController();
  final _controller2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'News App',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        elevation: 4,
      ),
      body: BlocListener<HomeCubit, HomeState>(
        listener: (context, state) {
          if (state is HomeError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  state.message,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: <Widget>[
              const SizedBox(height: 20),
              TextField(
                controller: _controller1,
                decoration: const InputDecoration(
                  hintText: 'Search news for list 1...',
                ),
                onEditingComplete: () {
                  if (_controller1.text.isNotEmpty) {
                    context
                        .read<HomeCubit>()
                        .searchFirstList(_controller1.text);
                  }
                },
                onChanged: (value) {
                  Future.delayed(const Duration(seconds: 1), () {
                    if (_controller1.text.isNotEmpty) {
                      context
                          .read<HomeCubit>()
                          .searchFirstList(_controller1.text);
                    }
                  });
                },
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _controller2,
                decoration: const InputDecoration(
                  hintText: 'Search news for list 2...',
                ),
                onEditingComplete: () {
                  if (_controller2.text.isNotEmpty) {
                    context
                        .read<HomeCubit>()
                        .searchSecondList(_controller2.text);
                  }
                },
                onChanged: (value) {
                  Future.delayed(const Duration(seconds: 1), () {
                    if (_controller2.text.isNotEmpty) {
                      context
                          .read<HomeCubit>()
                          .searchSecondList(_controller1.text);
                    }
                  });
                },
              ),
              const SizedBox(height: 24),
              Expanded(
                child: ListView(children: [
                  BlocBuilder<HomeCubit, HomeState>(
                    buildWhen: (previous, current) {
                      return current is FirstListLoading ||
                          current is FirstListLoaded;
                    },
                    builder: (context, state) {
                      if (state is FirstListLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (state is FirstListLoaded) {
                        return ListView.builder(
                          itemCount: state.newsArticles.length,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return NewsRow(
                              title: state.newsArticles[index].arTitle,
                              subtitle:
                                  state.newsArticles[index].arDescription,
                              author: state.newsArticles[index].arAuthor,
                            );
                          },
                        );
                      }
                      return const Text(
                          'Search for news for list 1 to display here');
                    },
                  ),
                  BlocBuilder<HomeCubit, HomeState>(
                    buildWhen: (previous, current) {
                      return current is SecondListLoading ||
                          current is SecondListLoaded;
                    },
                    builder: (context, state) {
                      if (state is SecondListLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }

                      if (state is SecondListLoaded) {
                        return ListView.builder(
                          itemCount: 3,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return NewsRow(
                              title: state.newsArticles[index].arTitle,
                              subtitle:
                                  state.newsArticles[index].arDescription,
                              author: state.newsArticles[index].arAuthor,
                            );
                          },
                        );
                      }
                      return const Text(
                          'Search for news for list 2 to display here');
                    },
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
