import 'package:corona_italy/features/infection_report/presentation/widgets/national_report_widget.dart';
import 'package:corona_italy/features/infection_report/presentation/widgets/regions_report_list.dart';
import 'package:flutter/material.dart';

class HomePanel extends StatelessWidget {
  final ScrollController scrollController;

  const HomePanel({Key key, this.scrollController}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NationalReportWidget(),
        Expanded(
          child: RegionsReportList(
            scrollController: scrollController,
          ),
        ),
      ],
    );
  }
}
