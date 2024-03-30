import 'package:flutter/material.dart';
import 'package:money_management_app/screens/category/screen_category.dart';
import 'package:money_management_app/screens/home/widgets/bottom_navigation.dart';
import 'package:money_management_app/screens/transactions/screen_transation.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  static ValueNotifier<int> selectedIndexNotifier = ValueNotifier(0);

  final _page = const [
    ScreenTranstations(),
    ScreenCategory(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 14, 83, 140),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 46, 89, 163),
        title: Text('Money Manager'),
        centerTitle: true,
      ),
      bottomNavigationBar: const MoneyManagerBottomNavigation(),
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: selectedIndexNotifier,
          builder: (BuildContext context, int updatedIndex, _) {
            return _page[updatedIndex];
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (selectedIndexNotifier.value == 0) {
            print('Add Transaction');
          } else {
            print('Add Category');
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
