import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

Future accountStatus(BuildContext context) async {
  if (!valueOrDefault<bool>(currentUserDocument?.status, false)) {
    if (Navigator.of(context).canPop()) {
      context.pop();
    }
    context.pushNamed(
      'ActivationPending',
      extra: <String, dynamic>{
        kTransitionInfoKey: TransitionInfo(
          hasTransition: true,
          transitionType: PageTransitionType.fade,
          duration: Duration(milliseconds: 0),
        ),
      },
    );
  }
}
