import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NotesRecord extends FirestoreRecord {
  NotesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "createdBy" field.
  DocumentReference? _createdBy;
  DocumentReference? get createdBy => _createdBy;
  bool hasCreatedBy() => _createdBy != null;

  // "assignedTo" field.
  DocumentReference? _assignedTo;
  DocumentReference? get assignedTo => _assignedTo;
  bool hasAssignedTo() => _assignedTo != null;

  // "deadline" field.
  DateTime? _deadline;
  DateTime? get deadline => _deadline;
  bool hasDeadline() => _deadline != null;

  // "completed" field.
  bool? _completed;
  bool get completed => _completed ?? false;
  bool hasCompleted() => _completed != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "images" field.
  List<String>? _images;
  List<String> get images => _images ?? const [];
  bool hasImages() => _images != null;

  // "resolutionNote" field.
  String? _resolutionNote;
  String get resolutionNote => _resolutionNote ?? '';
  bool hasResolutionNote() => _resolutionNote != null;

  // "location" field.
  LatLng? _location;
  LatLng? get location => _location;
  bool hasLocation() => _location != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "OverdueNotified" field.
  bool? _overdueNotified;
  bool get overdueNotified => _overdueNotified ?? false;
  bool hasOverdueNotified() => _overdueNotified != null;

  // "ref" field.
  String? _ref;
  String get ref => _ref ?? '';
  bool hasRef() => _ref != null;

  // "video" field.
  String? _video;
  String get video => _video ?? '';
  bool hasVideo() => _video != null;

  // "proposed" field.
  bool? _proposed;
  bool get proposed => _proposed ?? false;
  bool hasProposed() => _proposed != null;

  // "chat" field.
  DocumentReference? _chat;
  DocumentReference? get chat => _chat;
  bool hasChat() => _chat != null;

  void _initializeFields() {
    _createdBy = snapshotData['createdBy'] as DocumentReference?;
    _assignedTo = snapshotData['assignedTo'] as DocumentReference?;
    _deadline = snapshotData['deadline'] as DateTime?;
    _completed = snapshotData['completed'] as bool?;
    _description = snapshotData['description'] as String?;
    _images = getDataList(snapshotData['images']);
    _resolutionNote = snapshotData['resolutionNote'] as String?;
    _location = snapshotData['location'] as LatLng?;
    _title = snapshotData['title'] as String?;
    _overdueNotified = snapshotData['OverdueNotified'] as bool?;
    _ref = snapshotData['ref'] as String?;
    _video = snapshotData['video'] as String?;
    _proposed = snapshotData['proposed'] as bool?;
    _chat = snapshotData['chat'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('notes');

  static Stream<NotesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NotesRecord.fromSnapshot(s));

  static Future<NotesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => NotesRecord.fromSnapshot(s));

  static NotesRecord fromSnapshot(DocumentSnapshot snapshot) => NotesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NotesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NotesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NotesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is NotesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createNotesRecordData({
  DocumentReference? createdBy,
  DocumentReference? assignedTo,
  DateTime? deadline,
  bool? completed,
  String? description,
  String? resolutionNote,
  LatLng? location,
  String? title,
  bool? overdueNotified,
  String? ref,
  String? video,
  bool? proposed,
  DocumentReference? chat,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'createdBy': createdBy,
      'assignedTo': assignedTo,
      'deadline': deadline,
      'completed': completed,
      'description': description,
      'resolutionNote': resolutionNote,
      'location': location,
      'title': title,
      'OverdueNotified': overdueNotified,
      'ref': ref,
      'video': video,
      'proposed': proposed,
      'chat': chat,
    }.withoutNulls,
  );

  return firestoreData;
}

class NotesRecordDocumentEquality implements Equality<NotesRecord> {
  const NotesRecordDocumentEquality();

  @override
  bool equals(NotesRecord? e1, NotesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.createdBy == e2?.createdBy &&
        e1?.assignedTo == e2?.assignedTo &&
        e1?.deadline == e2?.deadline &&
        e1?.completed == e2?.completed &&
        e1?.description == e2?.description &&
        listEquality.equals(e1?.images, e2?.images) &&
        e1?.resolutionNote == e2?.resolutionNote &&
        e1?.location == e2?.location &&
        e1?.title == e2?.title &&
        e1?.overdueNotified == e2?.overdueNotified &&
        e1?.ref == e2?.ref &&
        e1?.video == e2?.video &&
        e1?.proposed == e2?.proposed &&
        e1?.chat == e2?.chat;
  }

  @override
  int hash(NotesRecord? e) => const ListEquality().hash([
        e?.createdBy,
        e?.assignedTo,
        e?.deadline,
        e?.completed,
        e?.description,
        e?.images,
        e?.resolutionNote,
        e?.location,
        e?.title,
        e?.overdueNotified,
        e?.ref,
        e?.video,
        e?.proposed,
        e?.chat
      ]);

  @override
  bool isValidKey(Object? o) => o is NotesRecord;
}
