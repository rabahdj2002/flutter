import '/flutter_flow/flutter_flow_util.dart';
import 'note_details_widget.dart' show NoteDetailsWidget;
import 'package:flutter/material.dart' hide CarouselController;


import 'package:carousel_slider/carousel_slider.dart'


class NoteDetailsModel extends FlutterFlowModel<NoteDetailsWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Carousel widget.
  CarouselSliderController? carouselController;
  int carouselCurrentIndex = 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
