import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'user_data_widget.dart' show UserDataWidget;
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

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
