import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AppInfoRecord extends FirestoreRecord {
  AppInfoRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "Name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "AppDescription" field.
  String? _appDescription;
  String get appDescription => _appDescription ?? '';
  bool hasAppDescription() => _appDescription != null;

  // "WhyUs" field.
  List<String>? _whyUs;
  List<String> get whyUs => _whyUs ?? const [];
  bool hasWhyUs() => _whyUs != null;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  bool hasId() => _id != null;

  // "WhyUsBool" field.
  bool? _whyUsBool;
  bool get whyUsBool => _whyUsBool ?? false;
  bool hasWhyUsBool() => _whyUsBool != null;

  void _initializeFields() {
    _name = snapshotData['Name'] as String?;
    _appDescription = snapshotData['AppDescription'] as String?;
    _whyUs = getDataList(snapshotData['WhyUs']);
    _id = castToType<int>(snapshotData['id']);
    _whyUsBool = snapshotData['WhyUsBool'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('AppInfo');

  static Stream<AppInfoRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AppInfoRecord.fromSnapshot(s));

  static Future<AppInfoRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AppInfoRecord.fromSnapshot(s));

  static AppInfoRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AppInfoRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AppInfoRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AppInfoRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AppInfoRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AppInfoRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAppInfoRecordData({
  String? name,
  String? appDescription,
  int? id,
  bool? whyUsBool,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Name': name,
      'AppDescription': appDescription,
      'id': id,
      'WhyUsBool': whyUsBool,
    }.withoutNulls,
  );

  return firestoreData;
}

class AppInfoRecordDocumentEquality implements Equality<AppInfoRecord> {
  const AppInfoRecordDocumentEquality();

  @override
  bool equals(AppInfoRecord? e1, AppInfoRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        e1?.appDescription == e2?.appDescription &&
        listEquality.equals(e1?.whyUs, e2?.whyUs) &&
        e1?.id == e2?.id &&
        e1?.whyUsBool == e2?.whyUsBool;
  }

  @override
  int hash(AppInfoRecord? e) => const ListEquality()
      .hash([e?.name, e?.appDescription, e?.whyUs, e?.id, e?.whyUsBool]);

  @override
  bool isValidKey(Object? o) => o is AppInfoRecord;
}
