import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'admin_all_tasks_widget.dart' show AdminAllTasksWidget;
import 'package:flutter/material.dart';

class AdminAllTasksModel extends FlutterFlowModel<AdminAllTasksWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  List<NotesRecord> simpleSearchResults = [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
