import 'package:flutter/material.dart';

class ReportGridTile extends StatelessWidget {
  final String title;
  final dynamic value;

  const ReportGridTile(this.title, this.value);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            Expanded(
              child: Center(
                child: Text(value?.toString()),
              ),
            )
          ],
        ),
      ),
    );
  }
}
