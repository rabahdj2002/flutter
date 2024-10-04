import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'aim_modify_widget.dart' show AimModifyWidget;
import 'package:flutter/material.dart';

class AimModifyModel extends FlutterFlowModel<AimModifyWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Create Document] action in AimModify widget.
  AppInfoRecord? appInforQuery;
  // State field(s) for AppName widget.
  FocusNode? appNameFocusNode;
  TextEditingController? appNameTextController;
  String? Function(BuildContext, String?)? appNameTextControllerValidator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for Switch widget.
  bool? switchValue;
  // State field(s) for intupwhy widget.
  FocusNode? intupwhyFocusNode;
  TextEditingController? intupwhyTextController;
  String? Function(BuildContext, String?)? intupwhyTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    appNameFocusNode?.dispose();
    appNameTextController?.dispose();

    textFieldFocusNode?.dispose();
    textController2?.dispose();

    intupwhyFocusNode?.dispose();
    intupwhyTextController?.dispose();
  }
}
