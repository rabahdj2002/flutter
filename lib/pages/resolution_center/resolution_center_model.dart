import '/componants/chat_comp/chat_comp_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'resolution_center_widget.dart' show ResolutionCenterWidget;
import 'package:flutter/material.dart';

class ResolutionCenterModel extends FlutterFlowModel<ResolutionCenterWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for ChatComp component.
  late ChatCompModel chatCompModel;

  @override
  void initState(BuildContext context) {
    chatCompModel = createModel(context, () => ChatCompModel());
  }

  @override
  void dispose() {
    chatCompModel.dispose();
  }
}
