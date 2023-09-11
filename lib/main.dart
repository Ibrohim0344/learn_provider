import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Provider",
      home: ExampleWidget(),
    );
  }
}

class Model extends ChangeNotifier {
  var one = 0;
  var two = 0;

  void inc1() {
    one++;
    notifyListeners();
  }

  void inc2() {
    two++;
    notifyListeners();
  }
}

class ExampleWidget extends StatelessWidget {
  const ExampleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Model(),
      child: const View(),
    );
  }
}

class View extends StatelessWidget {
  const View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.read<Model>();
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: model.inc1,
                child: const Text("one"),
              ),
              ElevatedButton(
                onPressed: model.inc2,
                child: const Text("two"),
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text("complex"),
              ),
              const _OneWidget(),
              const _TwoWidget(),
              const _ThreeWidget(),
              const _FourWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class _OneWidget extends StatelessWidget {
  const _OneWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final value = context.watch<Model>().one;
    return Text("$value");
  }
}

class _TwoWidget extends StatelessWidget {
  const _TwoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final value = Provider.of<Model>(context, listen: true).two;
    return Text("$value");
  }
}

class _ThreeWidget extends StatelessWidget {
  const _ThreeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final value = 0;
    return Text("$value");
  }
}

class _FourWidget extends StatelessWidget {
  const _FourWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final value = 0;
    return Text("$value");
  }
}
