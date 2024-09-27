import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/instant_timer.dart';
import 'all_tasks_widget.dart' show AllTasksWidget;
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

class AllTasksModel extends FlutterFlowModel<AllTasksWidget> {
  ///  State fields for stateful widgets in this page.

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
    instantTimer?.cancel();
    adminTabBarController?.dispose();
  }
}
