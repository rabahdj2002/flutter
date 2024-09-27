import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/task_component_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:math';
import 'user_data_widget.dart' show UserDataWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class UserDataModel extends FlutterFlowModel<UserDataWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // Stores action output result for [Firestore Query - Query a collection] action in ChoiceChips widget.
  List<NotesRecord>? allTasks;
  // Stores action output result for [Firestore Query - Query a collection] action in ChoiceChips widget.
  List<NotesRecord>? completedTasks;
  // Stores action output result for [Firestore Query - Query a collection] action in ChoiceChips widget.
  List<NotesRecord>? pendingTasks;
  // Stores action output result for [Firestore Query - Query a collection] action in ChoiceChips widget.
  List<NotesRecord>? overdueTasks;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
