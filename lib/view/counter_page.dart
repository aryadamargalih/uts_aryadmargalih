import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/counter_controller.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final counterController = Provider.of<CounterController>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text("Counter Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              counterController.counter.toString(),
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  heroTag: "fab_add",
                  onPressed: counterController.incrementremove,
                  tooltip: 'Increment',
                  child: const Icon(Icons.remove),
                ),
                SizedBox(width: 10),
                FloatingActionButton(
                  heroTag: "fab_remove",
                  onPressed: counterController.incrementadd,
                  tooltip: 'Increment',
                  child: const Icon(Icons.add),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
