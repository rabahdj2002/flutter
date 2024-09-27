import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'overdue_tasks_widget.dart' show OverdueTasksWidget;
import 'package:flutter/material.dart';

class OverdueTasksModel extends FlutterFlowModel<OverdueTasksWidget> {
  ///  State fields for stateful widgets in this page.

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
    adminTabBarController?.dispose();
  }
}
