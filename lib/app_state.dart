import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    secureStorage = const FlutterSecureStorage();
    await _safeInitAsync(() async {
      _UserLocation =
          latLngFromString(await secureStorage.getString('ff_UserLocation')) ??
              _UserLocation;
    });
    await _safeInitAsync(() async {
      _FirstUse = await secureStorage.getBool('ff_FirstUse') ?? _FirstUse;
    });
    await _safeInitAsync(() async {
      _AppName = await secureStorage.getString('ff_AppName') ?? _AppName;
    });
    await _safeInitAsync(() async {
      _UserEmail = await secureStorage.getString('ff_UserEmail') ?? _UserEmail;
    });
    await _safeInitAsync(() async {
      _UserPass = await secureStorage.getString('ff_UserPass') ?? _UserPass;
    });
    await _safeInitAsync(() async {
      _lang = await secureStorage.getString('ff_lang') ?? _lang;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  LatLng? _UserLocation = const LatLng(0, 0);
  LatLng? get UserLocation => _UserLocation;
  set UserLocation(LatLng? value) {
    _UserLocation = value;
    value != null
        ? secureStorage.setString('ff_UserLocation', value.serialize())
        : secureStorage.remove('ff_UserLocation');
  }

  void deleteUserLocation() {
    secureStorage.delete(key: 'ff_UserLocation');
  }

  bool _FirstUse = true;
  bool get FirstUse => _FirstUse;
  set FirstUse(bool value) {
    _FirstUse = value;
    secureStorage.setBool('ff_FirstUse', value);
  }

  void deleteFirstUse() {
    secureStorage.delete(key: 'ff_FirstUse');
  }

  String _AppName = 'TIF Maintenance';
  String get AppName => _AppName;
  set AppName(String value) {
    _AppName = value;
    secureStorage.setString('ff_AppName', value);
  }

  void deleteAppName() {
    secureStorage.delete(key: 'ff_AppName');
  }

  String _UserEmail = '';
  String get UserEmail => _UserEmail;
  set UserEmail(String value) {
    _UserEmail = value;
    secureStorage.setString('ff_UserEmail', value);
  }

  void deleteUserEmail() {
    secureStorage.delete(key: 'ff_UserEmail');
  }

  String _UserPass = '';
  String get UserPass => _UserPass;
  set UserPass(String value) {
    _UserPass = value;
    secureStorage.setString('ff_UserPass', value);
  }

  void deleteUserPass() {
    secureStorage.delete(key: 'ff_UserPass');
  }

  bool _Update = false;
  bool get Update => _Update;
  set Update(bool value) {
    _Update = value;
  }

  String _lang = 'en';
  String get lang => _lang;
  set lang(String value) {
    _lang = value;
    secureStorage.setString('ff_lang', value);
  }

  void deleteLang() {
    secureStorage.delete(key: 'ff_lang');
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return const CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: const ListToCsvConverter().convert([value]));
}
