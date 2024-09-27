import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'task_component_model.dart';
export 'task_component_model.dart';

class TaskComponentWidget extends StatefulWidget {
  const TaskComponentWidget({
    super.key,
    required this.note,
  });

  final NotesRecord? note;

  @override
  State<TaskComponentWidget> createState() => _TaskComponentWidgetState();
}

class _TaskComponentWidgetState extends State<TaskComponentWidget> {
  late TaskComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TaskComponentModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).primaryBackground,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      () {
                        if (widget.note!.deadline!.secondsSinceEpoch <
                            getCurrentTimestamp.secondsSinceEpoch) {
                          return 'Deadline Overdue';
                        } else if (widget.note?.completed == false) {
                          return 'Pending Completion';
                        } else {
                          return 'Task Completed';
                        }
                      }(),
                      style: FlutterFlowTheme.of(context).labelSmall.override(
                            fontFamily: 'Readex Pro',
                            color: const Color(0xFF57636C),
                            fontSize: 12.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 7.0, 0.0, 0.0),
                      child: Text(
                        valueOrDefault<String>(
                          widget.note?.title,
                          'Task Title',
                        ).maybeHandleOverflow(
                          maxChars: 29,
                          replacement: '…',
                        ),
                        maxLines: 1,
                        style: FlutterFlowTheme.of(context).titleLarge.override(
                              fontFamily: 'Outfit',
                              color: FlutterFlowTheme.of(context).primaryText,
                              fontSize: 22.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                      child: Text(
                        valueOrDefault<String>(
                          widget.note?.description,
                          'This is the podcast description and we go over the proper content that is covered in this podcast.',
                        ).maybeHandleOverflow(
                          maxChars: 110,
                          replacement: '…',
                        ),
                        maxLines: 2,
                        style:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  fontFamily: 'Readex Pro',
                                  color: const Color(0xFF57636C),
                                  fontSize: 14.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 12.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.pending_actions,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 24.0,
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  8.0, 0.0, 0.0, 0.0),
                              child: Text(
                                valueOrDefault<String>(
                                  dateTimeFormat(
                                    "yMMMd",
                                    widget.note?.deadline,
                                    locale: FFLocalizations.of(context)
                                        .languageCode,
                                  ),
                                  'Sep 21, 2024',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color: const Color(0xFF57636C),
                                      fontSize: 14.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(1.0, 0.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: () {
                                  if ((widget.note!.deadline! <
                                          getCurrentTimestamp) &&
                                      !widget.note!.completed) {
                                    return FlutterFlowTheme.of(context).accent3;
                                  } else if (!widget.note!.completed) {
                                    return FlutterFlowTheme.of(context).accent1;
                                  } else {
                                    return FlutterFlowTheme.of(context).accent2;
                                  }
                                }(),
                                borderRadius: BorderRadius.circular(8.0),
                                border: Border.all(
                                  color: () {
                                    if ((widget.note!.deadline! <
                                            getCurrentTimestamp) &&
                                        !widget.note!.completed) {
                                      return FlutterFlowTheme.of(context)
                                          .accent3;
                                    } else if (!widget.note!.completed) {
                                      return FlutterFlowTheme.of(context)
                                          .accent1;
                                    } else {
                                      return FlutterFlowTheme.of(context)
                                          .accent2;
                                    }
                                  }(),
                                ),
                              ),
                              child: Align(
                                alignment: const AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      8.0, 4.0, 8.0, 4.0),
                                  child: Text(
                                    () {
                                      if ((widget.note!.deadline! <
                                              getCurrentTimestamp) &&
                                          !widget.note!.completed) {
                                        return 'Overdue';
                                      } else if (!widget.note!.completed) {
                                        return 'Pending';
                                      } else {
                                        return 'Completed';
                                      }
                                    }(),
                                    style: FlutterFlowTheme.of(context)
                                        .bodySmall
                                        .override(
                                          fontFamily: 'Inter',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
