import '/backend/backend.dart';
import '/components/task_component_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'user_data_model.dart';
export 'user_data_model.dart';

class UserDataWidget extends StatefulWidget {
  const UserDataWidget({
    super.key,
    required this.userParam,
  });

  final UsersRecord? userParam;

  @override
  State<UserDataWidget> createState() => _UserDataWidgetState();
}

class _UserDataWidgetState extends State<UserDataWidget>
    with TickerProviderStateMixin {
  late UserDataModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UserDataModel());

    animationsMap.addAll({
      'containerOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0.0, 90.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'containerOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0.0, 60.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'textOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 100.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 100.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 100.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0.0, 170.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'listViewOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 150.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 150.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 150.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0.0, 170.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'textOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 200.0.ms,
            duration: 600.0.ms,
            begin: const Offset(60.0, 0.0),
            end: const Offset(0.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 200.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'iconButtonOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 200.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<NotesRecord>>(
      stream: queryNotesRecord(
        queryBuilder: (notesRecord) => notesRecord
            .where(
              'deadline',
              isLessThan: getCurrentTimestamp,
            )
            .where(
              'completed',
              isEqualTo: false,
            )
            .orderBy('deadline'),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: SpinKitRipple(
                  color: FlutterFlowTheme.of(context).primary,
                  size: 50.0,
                ),
              ),
            ),
          );
        }
        List<NotesRecord> userDataNotesRecordList = snapshot.data!;

        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
              automaticallyImplyLeading: false,
              title: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    FFLocalizations.of(context).getText(
                      'j76q0f0a' /* Analytics */,
                    ),
                    style: FlutterFlowTheme.of(context).headlineMedium.override(
                          fontFamily: 'Inter Tight',
                          letterSpacing: 0.0,
                        ),
                  ).animateOnPageLoad(
                      animationsMap['textOnPageLoadAnimation2']!),
                ].divide(const SizedBox(height: 4.0)),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 12.0, 8.0),
                  child: FlutterFlowIconButton(
                    borderColor: FlutterFlowTheme.of(context).alternate,
                    borderRadius: 12.0,
                    borderWidth: 1.0,
                    buttonSize: 40.0,
                    fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                    icon: Icon(
                      Icons.close_rounded,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 24.0,
                    ),
                    onPressed: () async {
                      context.safePop();
                    },
                  ).animateOnPageLoad(
                      animationsMap['iconButtonOnPageLoadAnimation']!),
                ),
              ],
              centerTitle: false,
              elevation: 0.0,
            ),
            body: SafeArea(
              top: true,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          16.0, 12.0, 16.0, 12.0),
                      child: GridView(
                        padding: EdgeInsets.zero,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10.0,
                          mainAxisSpacing: 10.0,
                          childAspectRatio: 1.0,
                        ),
                        primary: false,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        children: [
                          Container(
                            width: MediaQuery.sizeOf(context).width * 0.4,
                            height: 160.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).accent3,
                              borderRadius: BorderRadius.circular(24.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.pending_actions,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 32.0,
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 12.0, 0.0, 12.0),
                                    child: StreamBuilder<List<NotesRecord>>(
                                      stream: queryNotesRecord(
                                        queryBuilder: (notesRecord) =>
                                            notesRecord
                                                .where(
                                                  'completed',
                                                  isEqualTo: false,
                                                )
                                                .where(
                                                  'assignedTo',
                                                  isEqualTo: widget
                                                      .userParam?.reference,
                                                ),
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50.0,
                                              height: 50.0,
                                              child: SpinKitRipple(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                size: 50.0,
                                              ),
                                            ),
                                          );
                                        }
                                        List<NotesRecord> textNotesRecordList =
                                            snapshot.data!;

                                        return Text(
                                          textNotesRecordList.length.toString(),
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .displaySmall
                                              .override(
                                                fontFamily: 'Inter Tight',
                                                letterSpacing: 0.0,
                                              ),
                                        );
                                      },
                                    ),
                                  ),
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'kvchff1a' /* PENDING */,
                                    ),
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ).animateOnPageLoad(
                              animationsMap['containerOnPageLoadAnimation1']!),
                          Container(
                            width: MediaQuery.sizeOf(context).width * 0.4,
                            height: 160.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).accent2,
                              borderRadius: BorderRadius.circular(24.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.payments,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 44.0,
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 12.0, 0.0, 12.0),
                                    child: StreamBuilder<List<NotesRecord>>(
                                      stream: queryNotesRecord(
                                        queryBuilder: (notesRecord) =>
                                            notesRecord
                                                .where(
                                                  'completed',
                                                  isEqualTo: true,
                                                )
                                                .where(
                                                  'assignedTo',
                                                  isEqualTo: widget
                                                      .userParam?.reference,
                                                ),
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50.0,
                                              height: 50.0,
                                              child: SpinKitRipple(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                size: 50.0,
                                              ),
                                            ),
                                          );
                                        }
                                        List<NotesRecord> textNotesRecordList =
                                            snapshot.data!;

                                        return Text(
                                          textNotesRecordList.length.toString(),
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .displaySmall
                                              .override(
                                                fontFamily: 'Inter Tight',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                letterSpacing: 0.0,
                                              ),
                                        );
                                      },
                                    ),
                                  ),
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'xkhli1cm' /* Completed */,
                                    ),
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Inter Tight',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ).animateOnPageLoad(
                              animationsMap['containerOnPageLoadAnimation2']!),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 12.0),
                      child: Text(
                        FFLocalizations.of(context).getText(
                          'ab5iewmx' /* Filter Tasks */,
                        ),
                        textAlign: TextAlign.start,
                        style: FlutterFlowTheme.of(context).labelLarge.override(
                              fontFamily: 'Inter',
                              fontSize: 18.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                            ),
                      ).animateOnPageLoad(
                          animationsMap['textOnPageLoadAnimation1']!),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 8.0, 0.0, 8.0),
                            child: FlutterFlowChoiceChips(
                              options: [
                                ChipData(FFLocalizations.of(context).getText(
                                  'j7eqcqe1' /* All */,
                                )),
                                ChipData(FFLocalizations.of(context).getText(
                                  'sz1ckuuu' /* Completed */,
                                )),
                                ChipData(FFLocalizations.of(context).getText(
                                  'vsgd488o' /* Pending */,
                                )),
                                ChipData(FFLocalizations.of(context).getText(
                                  '0bqa0u1h' /* Overdue */,
                                ))
                              ],
                              onChanged: (val) async {
                                safeSetState(() =>
                                    _model.choiceChipsValue = val?.firstOrNull);
                                if (_model.choiceChipsValue == 'All') {
                                  _model.allTasks = await queryNotesRecordOnce(
                                    queryBuilder: (notesRecord) => notesRecord
                                        .where(
                                          'assignedTo',
                                          isEqualTo:
                                              widget.userParam?.reference,
                                        )
                                        .orderBy('deadline'),
                                  );
                                  FFAppState().Update = false;
                                  safeSetState(() {});
                                } else {
                                  if (_model.choiceChipsValue == 'Completed') {
                                    _model.completedTasks =
                                        await queryNotesRecordOnce(
                                      queryBuilder: (notesRecord) => notesRecord
                                          .where(
                                            'completed',
                                            isEqualTo: true,
                                          )
                                          .where(
                                            'assignedTo',
                                            isEqualTo:
                                                widget.userParam?.reference,
                                          )
                                          .orderBy('deadline'),
                                    );
                                    FFAppState().Update = false;
                                    safeSetState(() {});
                                  } else {
                                    if (_model.choiceChipsValue == 'Pending') {
                                      _model.pendingTasks =
                                          await queryNotesRecordOnce(
                                        queryBuilder: (notesRecord) =>
                                            notesRecord
                                                .where(
                                                  'deadline',
                                                  isGreaterThan:
                                                      getCurrentTimestamp,
                                                )
                                                .where(
                                                  'assignedTo',
                                                  isEqualTo: widget
                                                      .userParam?.reference,
                                                )
                                                .orderBy('deadline'),
                                      );
                                      FFAppState().Update = false;
                                      safeSetState(() {});
                                    } else {
                                      if (_model.choiceChipsValue ==
                                          'Overdue') {
                                        _model.overdueTasks =
                                            await queryNotesRecordOnce(
                                          queryBuilder: (notesRecord) =>
                                              notesRecord
                                                  .where(
                                                    'deadline',
                                                    isLessThan:
                                                        getCurrentTimestamp,
                                                  )
                                                  .where(
                                                    'assignedTo',
                                                    isEqualTo: widget
                                                        .userParam?.reference,
                                                  )
                                                  .orderBy('deadline'),
                                        );
                                        FFAppState().Update = false;
                                        safeSetState(() {});
                                      } else {
                                        FFAppState().Update = false;
                                        safeSetState(() {});
                                      }
                                    }
                                  }
                                }

                                safeSetState(() {});
                              },
                              selectedChipStyle: ChipStyle(
                                backgroundColor: const Color(0xFF6F61EF),
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Plus Jakarta Sans',
                                      color: Colors.white,
                                      fontSize: 14.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                                iconColor: Colors.white,
                                iconSize: 18.0,
                                elevation: 2.0,
                                borderColor: const Color(0x4D9489F5),
                                borderWidth: 1.0,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              unselectedChipStyle: ChipStyle(
                                backgroundColor: const Color(0xFFE5E7EB),
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Plus Jakarta Sans',
                                      color: const Color(0xFF606A85),
                                      fontSize: 14.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                                iconColor: const Color(0xFF606A85),
                                iconSize: 18.0,
                                elevation: 0.0,
                                borderColor: const Color(0xFFF1F4F8),
                                borderWidth: 1.0,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              chipSpacing: 8.0,
                              rowSpacing: 12.0,
                              multiselect: false,
                              initialized: _model.choiceChipsValue != null,
                              alignment: WrapAlignment.start,
                              controller: _model.choiceChipsValueController ??=
                                  FormFieldController<List<String>>(
                                [
                                  FFLocalizations.of(context).getText(
                                    'hmrakl44' /* All */,
                                  )
                                ],
                              ),
                              wrapped: true,
                            ),
                          ),
                        ]
                            .addToStart(const SizedBox(width: 16.0))
                            .addToEnd(const SizedBox(width: 16.0)),
                      ),
                    ),
                    Flexible(
                      child: Builder(
                        builder: (context) {
                          final tasks = () {
                                if (_model.allTasks != null &&
                                    (_model.allTasks)!.isNotEmpty) {
                                  return _model.allTasks;
                                } else if (_model.completedTasks != null &&
                                    (_model.completedTasks)!.isNotEmpty) {
                                  return _model.completedTasks;
                                } else if (_model.pendingTasks != null &&
                                    (_model.pendingTasks)!.isNotEmpty) {
                                  return _model.pendingTasks;
                                } else {
                                  return _model.overdueTasks;
                                }
                              }()
                                  ?.map((e) => e)
                                  .toList()
                                  .toList() ??
                              [];

                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            primary: false,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: tasks.length,
                            itemBuilder: (context, tasksIndex) {
                              final tasksItem = tasks[tasksIndex];
                              return Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.pushNamed(
                                      'noteDetails',
                                      queryParameters: {
                                        'note': serializeParam(
                                          tasksItem,
                                          ParamType.Document,
                                        ),
                                      }.withoutNulls,
                                      extra: <String, dynamic>{
                                        'note': tasksItem,
                                        kTransitionInfoKey: const TransitionInfo(
                                          hasTransition: true,
                                          transitionType:
                                              PageTransitionType.fade,
                                          duration: Duration(milliseconds: 0),
                                        ),
                                      },
                                    );
                                  },
                                  child: TaskComponentWidget(
                                    key: Key(
                                        'Key7ok_${tasksIndex}_of_${tasks.length}'),
                                    note: tasksItem,
                                  ),
                                ),
                              );
                            },
                          ).animateOnPageLoad(
                              animationsMap['listViewOnPageLoadAnimation']!);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
