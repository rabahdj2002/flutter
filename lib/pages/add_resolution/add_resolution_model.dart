import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'add_resolution_widget.dart' show AddResolutionWidget;
import 'package:flutter/material.dart';

class AddResolutionModel extends FlutterFlowModel<AddResolutionWidget> {
  ///  Local state fields for this page.

  double? latitude;

  double? longitude;

  ///  State fields for stateful widgets in this page.

  // State field(s) for description widget.
  FocusNode? descriptionFocusNode;
  TextEditingController? descriptionTextController;
  String? Function(BuildContext, String?)? descriptionTextControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  UsersRecord? assinedUser;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    descriptionFocusNode?.dispose();
    descriptionTextController?.dispose();
  }
}
