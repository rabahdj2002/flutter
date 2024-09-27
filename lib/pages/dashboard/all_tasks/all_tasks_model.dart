import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/components/empty_list_widget.dart';
import '/components/task_component_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/instant_timer.dart';
import '/walkthroughs/all_tasks.dart';
import 'dart:math';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/permissions_util.dart';
import 'all_tasks_widget.dart' show AllTasksWidget;
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart'
    show TutorialCoachMark;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AllTasksModel extends FlutterFlowModel<AllTasksWidget> {
  ///  State fields for stateful widgets in this page.

  TutorialCoachMark? allTasksController;
  InstantTimer? instantTimer;
  // Stores action output result for [Firestore Query - Query a collection] action in AllTasks widget.
  UsersRecord? adminUser;
  // Stores action output result for [Firestore Query - Query a collection] action in AllTasks widget.
  NotesRecord? dealyedNotif;
  // Stores action output result for [Firestore Query - Query a collection] action in AllTasks widget.
  UsersRecord? assignedUser;
  // State field(s) for AdminTabBar widget.
  TabController? adminTabBarController;
  int get adminTabBarCurrentIndex =>
      adminTabBarController != null ? adminTabBarController!.index : 0;

  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController1;
  String? get choiceChipsValue1 =>
      choiceChipsValueController1?.value?.firstOrNull;
  set choiceChipsValue1(String? val) =>
      choiceChipsValueController1?.value = val != null ? [val] : [];
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController2;
  String? get choiceChipsValue2 =>
      choiceChipsValueController2?.value?.firstOrNull;
  set choiceChipsValue2(String? val) =>
      choiceChipsValueController2?.value = val != null ? [val] : [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    allTasksController?.finish();
    instantTimer?.cancel();
    adminTabBarController?.dispose();
  }
}
