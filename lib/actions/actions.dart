import '/auth/firebase_auth/auth_util.dart';
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
        kTransitionInfoKey: const TransitionInfo(
          hasTransition: true,
          transitionType: PageTransitionType.fade,
          duration: Duration(milliseconds: 0),
        ),
      },
    );
  }
}

Future lang(BuildContext context) async {
  FFAppState().lang = FFLocalizations.of(context).languageCode;
  FFAppState().update(() {});
}
