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
      child: _Page(),
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
        title: const Text('News App',
        style: TextStyle(
          color: Colors.black,
          fontSize: 24,
          fontWeight: FontWeight.bold,

        ),
        ),
        centerTitle: true,
        elevation: 4,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal:16.0),
        child: Column(
          children: <Widget>[
            const SizedBox(height: 20),
            TextField(
              controller: _controller1,
              decoration: const InputDecoration(
                hintText: 'Search news for list 1...',
              ),
              onChanged: (value) {},
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _controller2,
              decoration: const InputDecoration(
                hintText: 'Search news for list 2...',
              ),
              onChanged: (value) {
                setState(() {});
              },
            ),
            const SizedBox(height: 24),
            Expanded(
              child: ListView(children: [
                ListView.builder(
                  itemCount: 3,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return NewsRow(
                      title: "Item $index",
                      subtitle: "Subtitle $index",
                    );
                  },
                ),
                ListView.builder(
                  itemCount: 3,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return NewsRow(
                      title: "Item $index",
                      subtitle: "Subtitle $index",
                    );
                  },
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}


