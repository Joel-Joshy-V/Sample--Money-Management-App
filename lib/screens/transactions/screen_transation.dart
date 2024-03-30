import 'package:flutter/material.dart';

class ScreenTranstations extends StatelessWidget {
  const ScreenTranstations({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(10),
      itemBuilder: (ctx, index) {
        return const Card(
          elevation: 0,
          child: ListTile(
            leading: CircleAvatar(
              radius: 50,
              child: Text(
                '15\nDec',
                textAlign: TextAlign.center,
              ),
            ),
            title: Text('Rs 10000000'),
            subtitle: Text('Travel'),
          ),
        );
      },
      separatorBuilder: (ctx, index) {
        return const SizedBox(
          height: 15,
        );
      },
      itemCount: 15,
    );
  }
}
