import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import 'dart:async';
import 'dart:math';
import 'activation_pending_widget.dart' show ActivationPendingWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
