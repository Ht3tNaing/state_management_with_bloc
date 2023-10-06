import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc_pattern/bloc/api_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => ApiBloc(),
        child: const Home(),
      ),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final provider = BlocProvider.of<ApiBloc>(context);
    return Scaffold(
        appBar: AppBar(title: const Text('Bloc Pattern')),
        body: Center(
          child: BlocBuilder<ApiBloc, ApiState>(builder: (context, state) {
            if (state is ApiLoading) {
              return const CircularProgressIndicator();
            }
            if (state is ApiSuccess) {
              return Text(state.success);
            }
            return ElevatedButton(
                onPressed: () {
                  provider.add(GetDataEvent());
                },
                child: const Text('Get data'));
          }),
        ));
  }
}
