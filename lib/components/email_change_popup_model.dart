import '/flutter_flow/flutter_flow_util.dart';
import 'email_change_popup_widget.dart' show EmailChangePopupWidget;
import 'package:flutter/material.dart';

class EmailChangePopupModel extends FlutterFlowModel<EmailChangePopupWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for AppName widget.
  FocusNode? appNameFocusNode;
  TextEditingController? appNameTextController;
  String? Function(BuildContext, String?)? appNameTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    appNameFocusNode?.dispose();
    appNameTextController?.dispose();
  }
}
