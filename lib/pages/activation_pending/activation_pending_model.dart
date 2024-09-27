import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import 'activation_pending_widget.dart' show ActivationPendingWidget;
import 'package:flutter/material.dart';

class ActivationPendingModel extends FlutterFlowModel<ActivationPendingWidget> {
  ///  State fields for stateful widgets in this page.

  InstantTimer? CheckActivation;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    CheckActivation?.cancel();
  }
}
