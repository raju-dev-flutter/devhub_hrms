import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../config/config.dart';
import '../../../core/core.dart';
import '../dashboard.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                _DashboardCardWidget(
                  title: "Total Employee",
                  value: '500',
                  percentage: '4',
                  date: DateFormat('MMM d, y').format(DateTime.now()),
                ),
                Dimensions.kHorizontalSpaceSmall,
                _DashboardCardWidget(
                  title: "Total Project",
                  value: '60',
                  percentage: '6',
                  date: DateFormat('MMM d, y').format(DateTime.now()),
                ),
                Dimensions.kHorizontalSpaceSmall,
                // _DashboardCardWidget(
                //   title: "Total Task",
                //   value: '100',
                //   percentage: '4',
                //   date: DateFormat('MMM d, y').format(DateTime.now()),
                // ),
                // Dimensions.kHorizontalSpaceSmall,
                // _DashboardCardWidget(
                //   title: "Total Database",
                //   value: '150',
                //   percentage: '4',
                //   date: DateFormat('MMM d, y').format(DateTime.now()),
                // ),
              ],
            ),
          ),
          const _DashboardEmployeeGridWidget(),
          // Dimensions.kVerticalSpaceSmall,
          // const _DashboardTaskGridWidget(),
        ],
      ),
    );
  }
}

class _DashboardCardWidget extends StatelessWidget {
  final String title;
  final String value;
  final String percentage;
  final String date;
  const _DashboardCardWidget(
      {required this.title,
      required this.value,
      required this.percentage,
      required this.date});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180.w,
      decoration: BoxDecoration(
        color: appColor.white,
        borderRadius: Dimensions.kBorderRadiusAllSmaller,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: Dimensions.kPaddingAllSmall,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 32.w,
                      height: 32.h,
                      padding: Dimensions.kPaddingAllSmaller,
                      decoration: BoxDecoration(
                        color: appColor.brand800.withOpacity(.1),
                        borderRadius: Dimensions.kBorderRadiusAllLarger,
                      ),
                      child: SvgPicture.asset(
                        AppSvg.people,
                        colorFilter: ColorFilter.mode(
                            appColor.brand800, BlendMode.srcIn),
                      ),
                    ),
                    Dimensions.kHorizontalSpaceSmaller,
                    Text(
                      title,
                      style: context.textTheme.labelMedium?.copyWith(
                          color: appColor.gray600, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                Dimensions.kVerticalSpaceSmaller,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      value,
                      style: context.textTheme.headlineLarge
                          ?.copyWith(color: appColor.gray800),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
                      decoration: BoxDecoration(
                        color: appColor.success600.withOpacity(.1),
                        borderRadius: Dimensions.kBorderRadiusAllMedium,
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.arrow_drop_up,
                              size: 20, color: appColor.success600),
                          Text(
                            "$percentage %",
                            style: context.textTheme.labelMedium
                                ?.copyWith(color: appColor.success600),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Divider(height: 2, color: appColor.gray200),
          Container(
            padding: Dimensions.kPaddingAllSmaller,
            child: Row(
              children: [
                Text(
                  "Update: $date",
                  style: context.textTheme.labelSmall
                      ?.copyWith(color: appColor.gray500),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _DashboardTaskGridWidget extends StatelessWidget {
  const _DashboardTaskGridWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final bool needSmallAnnotation = MediaQuery.of(context).size.height < 530;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Container(
        padding: Dimensions.kPaddingAllMedium,
        decoration: BoxDecoration(
          color: appColor.white,
          borderRadius: Dimensions.kBorderRadiusAllSmaller,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Task Reports",
              style: context.textTheme.labelLarge?.copyWith(
                  color: appColor.gray800, fontWeight: FontWeight.bold),
            ),
            // Dimensions.kVerticalSpaceSmall,
            SfCartesianChart(
                plotAreaBorderWidth: 0,
                primaryXAxis: CategoryAxis(
                  labelStyle: context.textTheme.labelSmall,
                  majorGridLines: const MajorGridLines(width: 0),
                  edgeLabelPlacement: EdgeLabelPlacement.shift,
                  labelRotation: -60,
                ),
                primaryYAxis: NumericAxis(
                  isVisible: false,
                  labelFormat: '{value}%',
                  minimum: 0,
                  maximum: 100,
                  labelStyle: context.textTheme.labelSmall,
                  axisLine: const AxisLine(width: 0),
                  majorTickLines: const MajorTickLines(width: 0),
                ),
                series: _getWatermarkAnnotationSeries(context),
                annotations: <CartesianChartAnnotation>[
                  CartesianChartAnnotation(
                      widget: SizedBox(
                          height: 100,
                          width: 100,
                          child: SfCircularChart(
                            series: <PieSeries<ChartDataModel, String>>[
                              PieSeries<ChartDataModel, String>(
                                radius: '90%',
                                dataSource: <ChartDataModel>[
                                  ChartDataModel(
                                    x: 'Created',
                                    y: 90,
                                    xValue: '90%',
                                    pointColor: appColor.blue600,
                                  ),
                                  ChartDataModel(
                                    x: 'Initiated',
                                    y: 60,
                                    xValue: '60%',
                                    pointColor: appColor.indigo600,
                                  ),
                                  ChartDataModel(
                                    x: 'Pending',
                                    y: 51,
                                    xValue: '51%',
                                    pointColor: appColor.orange600,
                                  ),
                                  ChartDataModel(
                                    x: 'In Progress',
                                    y: 50,
                                    xValue: '50%',
                                    pointColor: appColor.purple600,
                                  ),
                                  ChartDataModel(
                                    x: 'L1 Testing',
                                    y: 50,
                                    xValue: '50%',
                                    pointColor: appColor.fuchsia600,
                                  ),
                                  ChartDataModel(
                                    x: 'L2 Testing',
                                    y: 50,
                                    xValue: '50%',
                                    pointColor: appColor.orangeDark600,
                                  ),
                                  ChartDataModel(
                                    x: 'Completed',
                                    y: 50,
                                    xValue: '50%',
                                    pointColor: appColor.success600,
                                  ),
                                ],
                                dataLabelMapper: (ChartDataModel data, _) =>
                                    data.xValue as String,
                                xValueMapper: (ChartDataModel data, _) =>
                                    data.x as String,
                                yValueMapper: (ChartDataModel data, _) =>
                                    data.y,
                                dataLabelSettings: DataLabelSettings(
                                  isVisible: true,
                                  labelIntersectAction:
                                      LabelIntersectAction.none,
                                  alignment: ChartAlignment.center,
                                  textStyle: context.textTheme.labelSmall
                                      ?.copyWith(
                                          fontSize: 6, color: Colors.white),
                                ),
                                pointColorMapper: (ChartDataModel data, _) =>
                                    data.pointColor,
                              )
                            ],
                          )),
                      coordinateUnit: CoordinateUnit.point,
                      x: 'L2 Testing',
                      y: 80)
                ]),
          ],
        ),
      ),
    );
  }

  /// Returns the list of series which need to
  /// render on the chart with annotation.
  List<ColumnSeries<ChartDataModel, String>> _getWatermarkAnnotationSeries(
      BuildContext context) {
    return <ColumnSeries<ChartDataModel, String>>[
      ColumnSeries<ChartDataModel, String>(
        dataSource: <ChartDataModel>[
          ChartDataModel(
            x: 'Created',
            y: 90,
            xValue: '90%',
            pointColor: appColor.blue600,
          ),
          ChartDataModel(
            x: 'Initiated',
            y: 60,
            xValue: '60%',
            pointColor: appColor.indigo600,
          ),
          ChartDataModel(
            x: 'Pending',
            y: 51,
            xValue: '51%',
            pointColor: appColor.orange600,
          ),
          ChartDataModel(
            x: 'In Progress',
            y: 50,
            xValue: '50%',
            pointColor: appColor.purple600,
          ),
          ChartDataModel(
            x: 'L1 Testing',
            y: 50,
            xValue: '50%',
            pointColor: appColor.fuchsia600,
          ),
          ChartDataModel(
            x: 'L2 Testing',
            y: 50,
            xValue: '50%',
            pointColor: appColor.orangeDark600,
          ),
          ChartDataModel(
            x: 'Completed',
            y: 50,
            xValue: '50%',
            pointColor: appColor.success600,
          ),
        ],
        xValueMapper: (ChartDataModel sales, _) => sales.x as String,
        yValueMapper: (ChartDataModel sales, _) => sales.y,
        pointColorMapper: (ChartDataModel sales, _) => sales.pointColor,
        width: .6,
        dataLabelSettings: DataLabelSettings(
          isVisible: true,
          textStyle:
              context.textTheme.labelSmall?.copyWith(color: appColor.white),
          labelAlignment: ChartDataLabelAlignment.top,
        ),
      ),
    ];
  }
}

class _DashboardEmployeeGridWidget extends StatefulWidget {
  const _DashboardEmployeeGridWidget({super.key});

  @override
  State<_DashboardEmployeeGridWidget> createState() =>
      _DashboardEmployeeGridWidgetState();
}

class _DashboardEmployeeGridWidgetState
    extends State<_DashboardEmployeeGridWidget> {
  List<ChartDataModel>? chartData;
  String? _title;
  String? firstSeriesName, secondSeriesName;
  late TooltipBehavior tooltip;

  @override
  void initState() {
    tooltip = TooltipBehavior(enable: true);
    super.initState();
    _getDataSource();
  }

  // goodlether, venkatsource
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Container(
        padding: Dimensions.kPaddingAllMedium,
        decoration: BoxDecoration(
          color: appColor.white,
          borderRadius: Dimensions.kBorderRadiusAllSmaller,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Employee Attendance",
              style: context.textTheme.labelLarge?.copyWith(
                  color: appColor.gray800, fontWeight: FontWeight.bold),
            ),
            Dimensions.kVerticalSpaceSmall,
            Container(
              decoration: BoxDecoration(
                borderRadius: Dimensions.kBorderRadiusAllSmaller,
                border: Border.all(width: 1, color: appColor.gray300),
              ),
              child: IntrinsicHeight(
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        padding: Dimensions.kPaddingAllSmall,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(6.w),
                            bottomLeft: Radius.circular(6.w),
                          ),
                          // border: Border.all(width: 1, color: appColor.gray300),
                        ),
                        child: Text(
                          "Today",
                          style: context.textTheme.labelMedium?.copyWith(
                              color: appColor.gray500,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    VerticalDivider(
                        width: 0, color: appColor.gray300, thickness: 1),
                    Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        padding: Dimensions.kPaddingAllSmall,
                        color: appColor.gray100,
                        child: Text(
                          "This Week",
                          style: context.textTheme.labelMedium?.copyWith(
                              color: appColor.gray500,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    VerticalDivider(
                        width: 0, color: appColor.gray300, thickness: 1),
                    Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        padding: Dimensions.kPaddingAllSmall,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(6.w),
                            bottomLeft: Radius.circular(6.w),
                          ),
                          // border: Border.all(width: 1, color: appColor.gray300),
                        ),
                        child: Text(
                          "This Month",
                          style: context.textTheme.labelMedium?.copyWith(
                              color: appColor.gray500,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Dimensions.kVerticalSpaceSmall,
            SfCartesianChart(
              plotAreaBorderWidth: 0,
              // title: ChartTitle(text: _title!),
              legend: const Legend(isVisible: true),
              primaryXAxis: CategoryAxis(
                labelIntersectAction: AxisLabelIntersectAction.multipleRows,
                majorGridLines: const MajorGridLines(width: 1),
                labelStyle: context.textTheme.labelSmall,
              ),
              primaryYAxis: NumericAxis(
                axisLine: const AxisLine(width: 0),
                isVisible: true,
                maximum: 100,
                edgeLabelPlacement: EdgeLabelPlacement.shift,
                majorGridLines: const MajorGridLines(width: 1),
                majorTickLines: const MajorTickLines(size: 0),
                labelStyle: context.textTheme.labelSmall,
              ),
              series: _getColumnSeries(),
              tooltipBehavior: tooltip,
            )
          ],
        ),
      ),
    );
  }

  List<ColumnSeries<ChartDataModel, String>> _getColumnSeries() {
    return <ColumnSeries<ChartDataModel, String>>[
      ColumnSeries<ChartDataModel, String>(
        dataSource: chartData,
        xValueMapper: (ChartDataModel sales, _) => sales.x as String,
        yValueMapper: (ChartDataModel sales, _) => sales.y,
        name: firstSeriesName,
        dataLabelSettings: DataLabelSettings(
          isVisible: false,
          textStyle: context.textTheme.labelSmall
              ?.copyWith(fontSize: 8.sp, color: appColor.white),
          labelAlignment: ChartDataLabelAlignment.top,
        ),
      ),
      ColumnSeries<ChartDataModel, String>(
        dataSource: chartData,
        xValueMapper: (ChartDataModel sales, _) => sales.x as String,
        yValueMapper: (ChartDataModel sales, _) => sales.yValue,
        name: secondSeriesName,
        dataLabelSettings: DataLabelSettings(
          isVisible: true,
          textStyle: context.textTheme.labelSmall
              ?.copyWith(fontSize: 8.sp, color: appColor.white),
          labelAlignment: ChartDataLabelAlignment.top,
        ),
      )
    ];
  }

  void _getDataSource() {
    chartData = <ChartDataModel>[
      ChartDataModel(x: 'Mon', y: 50, yValue: 15),
      ChartDataModel(x: 'Tue', y: 30, yValue: 18),
      ChartDataModel(x: 'Wed', y: 50, yValue: 12),
      ChartDataModel(x: 'Thu', y: 60, yValue: 15),
      ChartDataModel(x: 'Fri', y: 20, yValue: 12),
      ChartDataModel(x: 'Sat', y: 40, yValue: 21),
    ];
    _title = 'Employee Attendance';
    firstSeriesName = 'Absent';
    secondSeriesName = 'Present';
  }
}
