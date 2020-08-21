import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ProvinceReportTile extends StatelessWidget {
  final String title;
  final int newPositive;
  const ProvinceReportTile({
    Key key,
    @required this.title,
    @required this.newPositive,
  })  : assert(title != null),
        assert(newPositive != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: Text('${tr('daily_variation')}: $newPositive'),
    );
  }
}
