import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ReportPreviewListTile extends StatelessWidget {
  final String title;
  final int totalPositive;
  final int totalPositiveVariation;
  final void Function() onTap;

  const ReportPreviewListTile({
    Key key,
    @required this.title,
    @required this.totalPositive,
    @required this.totalPositiveVariation,
    this.onTap,
  })  : assert(title != null),
        assert(totalPositive != null),
        assert(totalPositiveVariation != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Text(title),
      subtitle: Wrap(
        alignment: WrapAlignment.spaceAround,
        children: [
          Text('${tr('total_positive')}: $totalPositive'),
          Text('${tr('daily_variation')}: $totalPositiveVariation'),
        ],
      ),
      trailing: Icon(
        Icons.keyboard_arrow_right,
        color: Theme.of(context).iconTheme.color,
      ),
    );
  }
}
