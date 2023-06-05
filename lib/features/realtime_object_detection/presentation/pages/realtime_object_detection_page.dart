import 'package:flutter/material.dart';
import '../widgets/stats_row_widget.dart';
import '/core/util/themes.dart';

import '../../../../core/ml/realtime_object_detection_classifier/recognition.dart';
import '../../../../core/ml/realtime_object_detection_classifier/stats.dart';
import '../widgets/camera_view.dart';
import '../widgets/camera_view_singleton.dart';
import '../widgets/object_box_widget.dart';

// ignore: must_be_immutable
class RealTimeObjectDetectionPage extends StatefulWidget {
  const RealTimeObjectDetectionPage({Key? key});

  static const String routeName = 'RealTimeObjectDetectionHomePage';

  @override
  State<RealTimeObjectDetectionPage> createState() =>
      _RealTimeObjectDetectionPageState();

  static const BOTTOM_SHEET_RADIUS = Radius.circular(24.0);
  static const BORDER_RADIUS_BOTTOM_SHEET = BorderRadius.only(
    topLeft: BOTTOM_SHEET_RADIUS,
    topRight: BOTTOM_SHEET_RADIUS,
  );
}

class _RealTimeObjectDetectionPageState
    extends State<RealTimeObjectDetectionPage> {
  /// Results to draw bounding boxes
  List<Recognition>? results;

  /// Realtime stats
  Stats? stats;

  /// Scaffold Key
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: Stack(
        children: [
          CameraView(resultsCallback, statsCallback),
                  boundingBoxes(results),
          Align(
            alignment: Alignment.bottomCenter,
            
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFFE8F0FE),
                    Color(0xFFDDE8FD),
                  ],
                ),
                borderRadius:
                    RealTimeObjectDetectionPage.BORDER_RADIUS_BOTTOM_SHEET,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                 
                  Icon(Icons.keyboard_arrow_up, size: 48, color: Colors.blue),
                   
                  

          
                
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  /// Returns Stack of bounding boxes
  Widget boundingBoxes(List<Recognition>? results) {
    if (results == null) {
      return Container();
    }
    return Stack(
      children: results.map((e) => BoxWidget(result: e)).toList(),
    );
  }

  /// Callback to get inference results from [CameraView]
  void resultsCallback(List<Recognition> results) {
    setState(() {
      this.results = results;
    });
  }

  /// Callback to get inference stats from [CameraView]
  void statsCallback(Stats stats) {
    setState(() {
      this.stats = stats;
    });
  }
}
