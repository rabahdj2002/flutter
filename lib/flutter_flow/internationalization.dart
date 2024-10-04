import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'ar'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? arText = '',
  }) =>
      [enText, arText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // settings
  {
    '01hazdu0': {
      'en': 'Settings',
      'ar': 'إعدادات',
    },
    'aki2ytgr': {
      'en': 'Light Mode',
      'ar': 'وضع الضوء',
    },
    't84uup5w': {
      'en': 'Dark Mode',
      'ar': 'الوضع المظلم',
    },
    'q2t2mk2s': {
      'en': 'Dashboard',
      'ar': 'لوحة التحكم',
    },
    '1q6n5cl0': {
      'en': 'Our App\'s Aim',
      'ar': 'هدف تطبيقنا',
    },
    'k8fstk2e': {
      'en': 'Analytics',
      'ar': 'التحليلات',
    },
    '2lq5equ5': {
      'en': 'Manage Users',
      'ar': 'إدارة المستخدمين',
    },
    '7qnl5est': {
      'en': 'Modify Password',
      'ar': 'تعديل كلمة المرور',
    },
    '7ownio93': {
      'en': 'Log Out',
      'ar': 'تسجيل الخروج',
    },
    'o7tpb2u1': {
      'en': 'v1.0.0 Stable',
      'ar': 'الإصدار التجريبي v0.0.0',
    },
    'oi229fpr': {
      'en': 'Made By: Eng. Bandar Majeed',
      'ar': 'إعداد: المهندس بندر مجيد',
    },
    'hhoc1lh1': {
      'en': '__',
      'ar': '__',
    },
  },
  // noteDetails
  {
    '3araxpci': {
      'en': 'Task Details',
      'ar': 'تفاصيل المهمة',
    },
    'yq43sytv': {
      'en': 'Description :',
      'ar': 'وصف :',
    },
    '7sl5lvaz': {
      'en': 'Resolution Center',
      'ar': 'مركز الحلول',
    },
  },
  // createTask
  {
    '0ippe9l0': {
      'en': 'Select Images',
      'ar': 'حدد الصور',
    },
    'jf5hg2ns': {
      'en': 'Short Title',
      'ar': 'عنوان مختصر',
    },
    '6q91nelq': {
      'en': '',
      'ar': '',
    },
    'szwrr7dq': {
      'en': 'Description',
      'ar': 'وصف',
    },
    '35nm0qs1': {
      'en': 'Add Geolocation to task',
      'ar': 'إضافة تحديد الموقع الجغرافي إلى المهمة',
    },
    'pormt7vu': {
      'en': 'Choose Location',
      'ar': 'اختر الموقع',
    },
    'wwifcoy8': {
      'en': 'Assign user to task',
      'ar': 'تعيين المستخدم للمهمة',
    },
    'dsd50bn2': {
      'en': 'Option 1',
      'ar': 'الخيار 1',
    },
    '5w7ro39t': {
      'en': 'Option 2',
      'ar': 'الخيار الثاني',
    },
    '8ci0ak5o': {
      'en': 'Option 3',
      'ar': 'الخيار 3',
    },
    'zst01fed': {
      'en': 'Select User...',
      'ar': 'حدد المستخدم...',
    },
    'dz2oxedz': {
      'en': 'Search...',
      'ar': 'يبحث...',
    },
    '6ou940jw': {
      'en': 'Due Date',
      'ar': 'تاريخ الاستحقاق',
    },
    'e45slitv': {
      'en': 'Add Task',
      'ar': 'إضافة مهمة',
    },
    'pxswaj3c': {
      'en': 'Create Task',
      'ar': 'إنشاء مهمة',
    },
    '42yao47w': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // selectLocation
  {
    'zlxa5dt6': {
      'en': 'Select Location',
      'ar': 'حدد الموقع',
    },
    '5sjt6fj4': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // createAccount
  {
    'rpb7k7ar': {
      'en': 'Sign in to your existing account',
      'ar': 'تسجيل الدخول إلى حسابك الحالي',
    },
    '9e72plgg': {
      'en':
          'Make sure you enter your correct account login credentials to access our app.',
      'ar':
          'تأكد من إدخال بيانات تسجيل الدخول الصحيحة لحسابك للوصول إلى تطبيقنا.',
    },
    'zukae0hj': {
      'en': 'Display Name',
      'ar': 'اسم العرض',
    },
    '0dd0j912': {
      'en': 'Email Address',
      'ar': 'عنوان البريد الإلكتروني',
    },
    'gn2nc7dd': {
      'en': 'Password',
      'ar': 'كلمة المرور',
    },
    'zcx1cgsy': {
      'en': 'Confirm Password',
      'ar': 'تأكيد كلمة المرور',
    },
    'zedvskoc': {
      'en': 'Create Account',
      'ar': 'إنشاء حساب',
    },
    '8zvm1bcj': {
      'en': 'Or Sign In',
      'ar': 'أو قم بتسجيل الدخول',
    },
    'rfa3ksqg': {
      'en': 'Made By: Eng. Bandar Majeed',
      'ar': 'إعداد: المهندس بندر مجيد',
    },
    'uik04050': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // loginUser
  {
    'mlwgh36g': {
      'en': 'Sign in to your existing account',
      'ar': 'تسجيل الدخول إلى حسابك الحالي',
    },
    '9krykz7k': {
      'en':
          'Make sure you enter your correct account login credentials to access our app.',
      'ar':
          'تأكد من إدخال بيانات تسجيل الدخول الصحيحة لحسابك للوصول إلى تطبيقنا.',
    },
    'seroeyxv': {
      'en': 'Email Address',
      'ar': 'عنوان البريد الإلكتروني',
    },
    '4o1oycwy': {
      'en': 'Password',
      'ar': 'كلمة المرور',
    },
    'x3mka6z9': {
      'en': 'Sign in',
      'ar': 'تسجيل الدخول',
    },
    'm6vredl5': {
      'en': 'Or Create Account',
      'ar': 'أو قم بإنشاء حساب',
    },
    'pfzf16hs': {
      'en': 'Made By: Eng. Bandar Majeed',
      'ar': 'إعداد: المهندس بندر مجيد',
    },
    'b4826taw': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // userList
  {
    'jfisy6r1': {
      'en': 'Below are a list of members of your team.',
      'ar': 'فيما يلي قائمة بأعضاء فريقك.',
    },
    'iatrpqqq': {
      'en': 'Search all users...',
      'ar': 'البحث عن جميع المستخدمين...',
    },
    'or15tm4e': {
      'en': 'User',
      'ar': 'مستخدم',
    },
    'qn74scg7': {
      'en': 'Status',
      'ar': 'حالة',
    },
    'g5frxzlo': {
      'en': '5 mins ago',
      'ar': 'منذ 5 دقائق',
    },
    'vivobpf1': {
      'en': 'Head of Design',
      'ar': 'رئيس التصميم',
    },
    'o7i37hha': {
      'en': 'Add User',
      'ar': 'إضافة مستخدم',
    },
    'rmgtt90m': {
      'en': 'Manage Users',
      'ar': 'إدارة المستخدمين',
    },
    '86yr0aef': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // PendingTasks
  {
    '60z7oney': {
      'en': 'Assigned Tasks',
      'ar': 'المهام المعينة',
    },
    'eao20qxq': {
      'en': 'PENDING',
      'ar': 'قيد الانتظار',
    },
    'kxfahiut': {
      'en': 'Completed',
      'ar': 'مكتمل',
    },
    'aq0tglbf': {
      'en': 'All',
      'ar': 'الجميع',
    },
    'f6fxu0k7': {
      'en': 'Completed',
      'ar': 'مكتمل',
    },
    '1gzkzavf': {
      'en': 'Pending',
      'ar': 'قيد الانتظار',
    },
    't7uilumj': {
      'en': 'Overdue',
      'ar': 'متأخر',
    },
    'd50lsnum': {
      'en': 'Pending',
      'ar': 'قيد الانتظار',
    },
    '3tf41jfx': {
      'en': 'All',
      'ar': 'الجميع',
    },
    '98w6m4lt': {
      'en': 'Made By: Eng. Bandar Majeed',
      'ar': 'إعداد: المهندس بندر مجيد',
    },
    'c9utge04': {
      'en': 'Created Tasks',
      'ar': 'المهام التي تم إنشاؤها',
    },
    'irntatbw': {
      'en': 'PENDING',
      'ar': 'قيد الانتظار',
    },
    'fhwfdst3': {
      'en': 'Completed',
      'ar': 'مكتمل',
    },
    'i1ao3txh': {
      'en': 'All',
      'ar': 'الجميع',
    },
    '0tc5y57q': {
      'en': 'Completed',
      'ar': 'مكتمل',
    },
    'ijj1furg': {
      'en': 'Pending',
      'ar': 'قيد الانتظار',
    },
    'n04k813g': {
      'en': 'Overdue',
      'ar': 'متأخر',
    },
    'ib48ujf0': {
      'en': 'Pending',
      'ar': 'قيد الانتظار',
    },
    'rmc4ivw4': {
      'en': 'All',
      'ar': 'الجميع',
    },
    'tk0zpp49': {
      'en': 'Made By: Eng. Bandar Majeed',
      'ar': 'إعداد: المهندس بندر مجيد',
    },
    '4swi8hwm': {
      'en': 'Add Task',
      'ar': 'إضافة مهمة',
    },
    'zrp4mmvb': {
      'en': 'Dashboard',
      'ar': 'لوحة القيادة',
    },
    'loojjtrj': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // OverdueTasks
  {
    'em0tcqlr': {
      'en': 'Assigned Tasks',
      'ar': 'المهام المعينة',
    },
    'zk4pzk0r': {
      'en': 'PENDING',
      'ar': 'قيد الانتظار',
    },
    'xyf121mg': {
      'en': 'Completed',
      'ar': 'مكتمل',
    },
    'ue8z711b': {
      'en': 'All',
      'ar': 'الجميع',
    },
    'eehgc0cj': {
      'en': 'Completed',
      'ar': 'مكتمل',
    },
    'pr0qac05': {
      'en': 'Pending',
      'ar': 'قيد الانتظار',
    },
    'wpw3yc0h': {
      'en': 'Overdue',
      'ar': 'متأخر',
    },
    'efo82mrb': {
      'en': 'Overdue',
      'ar': 'متأخر',
    },
    'hsxrhjqp': {
      'en': 'All',
      'ar': 'الجميع',
    },
    'dos4oupd': {
      'en': 'Made By: Eng. Bandar Majeed',
      'ar': 'إعداد: المهندس بندر مجيد',
    },
    '8wjxc4y8': {
      'en': 'Created Tasks',
      'ar': 'المهام التي تم إنشاؤها',
    },
    'yx3o8zxf': {
      'en': 'PENDING',
      'ar': 'قيد الانتظار',
    },
    'po36zdd3': {
      'en': 'Completed',
      'ar': 'مكتمل',
    },
    '2idj8psz': {
      'en': 'All',
      'ar': 'الجميع',
    },
    'yoywby6a': {
      'en': 'Completed',
      'ar': 'مكتمل',
    },
    'h3ee7k9l': {
      'en': 'Pending',
      'ar': 'قيد الانتظار',
    },
    'czdu4ttz': {
      'en': 'Overdue',
      'ar': 'متأخر',
    },
    'oaptb20l': {
      'en': 'Overdue',
      'ar': 'متأخر',
    },
    '85zpnb9x': {
      'en': 'All',
      'ar': 'الجميع',
    },
    'hc1h50l9': {
      'en': 'Made By: Eng. Bandar Majeed',
      'ar': 'إعداد: المهندس بندر مجيد',
    },
    'k8xnpz4k': {
      'en': 'Add Task',
      'ar': 'إضافة مهمة',
    },
    'ma583td6': {
      'en': 'Dashboard',
      'ar': 'لوحة القيادة',
    },
    'v0p4dakr': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // CompletedTasks
  {
    '7jnl3nki': {
      'en': 'Assigned Tasks',
      'ar': 'المهام المعينة',
    },
    'q9irabd0': {
      'en': 'PENDING',
      'ar': 'قيد الانتظار',
    },
    'wdjcaznh': {
      'en': 'Completed',
      'ar': 'مكتمل',
    },
    'wgynwepj': {
      'en': 'All',
      'ar': 'الجميع',
    },
    '6sg9lv7i': {
      'en': 'Completed',
      'ar': 'مكتمل',
    },
    'oxnx6ri2': {
      'en': 'Pending',
      'ar': 'قيد الانتظار',
    },
    'dgukkn6v': {
      'en': 'Overdue',
      'ar': 'متأخر',
    },
    'qf5cwjsf': {
      'en': 'Completed',
      'ar': 'مكتمل',
    },
    'fpp3jotf': {
      'en': 'All',
      'ar': 'الجميع',
    },
    '5o8eraqz': {
      'en': 'Made By: Eng. Bandar Majeed',
      'ar': 'إعداد: المهندس بندر مجيد',
    },
    'ymdjfzb1': {
      'en': 'Created Tasks',
      'ar': 'المهام التي تم إنشاؤها',
    },
    'pnsentdx': {
      'en': 'PENDING',
      'ar': 'قيد الانتظار',
    },
    '1g8ia13w': {
      'en': 'Completed',
      'ar': 'مكتمل',
    },
    'fovza0a2': {
      'en': 'All',
      'ar': 'الجميع',
    },
    'ambf36me': {
      'en': 'Completed',
      'ar': 'مكتمل',
    },
    '0oinqcrw': {
      'en': 'Pending',
      'ar': 'قيد الانتظار',
    },
    '8499c0dk': {
      'en': 'Overdue',
      'ar': 'متأخر',
    },
    'gaw7nwga': {
      'en': 'Completed',
      'ar': 'مكتمل',
    },
    '4p9kw74h': {
      'en': 'All',
      'ar': 'الجميع',
    },
    'qtcn96v8': {
      'en': 'Made By: Eng. Bandar Majeed',
      'ar': 'إعداد: المهندس بندر مجيد',
    },
    'hz9usk3a': {
      'en': 'Add Task',
      'ar': 'إضافة مهمة',
    },
    'o34sb5n1': {
      'en': 'Dashboard',
      'ar': 'لوحة القيادة',
    },
    'sayvpzwl': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // AllTasks
  {
    'sxvhyt4l': {
      'en': 'Assigned Tasks',
      'ar': 'المهام المعينة',
    },
    'tmrvoxnp': {
      'en': 'PENDING',
      'ar': 'قيد الانتظار',
    },
    'titqeput': {
      'en': 'Completed',
      'ar': 'مكتمل',
    },
    'fl9qwwhz': {
      'en': 'All',
      'ar': 'الجميع',
    },
    'zpqhjr47': {
      'en': 'Completed',
      'ar': 'مكتمل',
    },
    'ug0mgu4z': {
      'en': 'Pending',
      'ar': 'قيد الانتظار',
    },
    'jmd8k44p': {
      'en': 'Overdue',
      'ar': 'متأخر',
    },
    'p0yyunya': {
      'en': 'All',
      'ar': 'الجميع',
    },
    'kbdgnb7j': {
      'en': 'All',
      'ar': 'الجميع',
    },
    'geatw677': {
      'en': 'Made By: Eng. Bandar Majeed',
      'ar': 'إعداد: المهندس بندر مجيد',
    },
    'vtkdpxvk': {
      'en': 'Created Tasks',
      'ar': 'المهام التي تم إنشاؤها',
    },
    'nerljooi': {
      'en': 'PENDING',
      'ar': 'قيد الانتظار',
    },
    'mew8ivgy': {
      'en': 'Completed',
      'ar': 'مكتمل',
    },
    '5w2u7jsm': {
      'en': 'All',
      'ar': 'الجميع',
    },
    '2ji6rri8': {
      'en': 'Completed',
      'ar': 'مكتمل',
    },
    '065fa09q': {
      'en': 'Pending',
      'ar': 'قيد الانتظار',
    },
    'p4cdbnlx': {
      'en': 'Overdue',
      'ar': 'متأخر',
    },
    'e6dg0hdn': {
      'en': 'All',
      'ar': 'الجميع',
    },
    'lo4yfdkf': {
      'en': 'All',
      'ar': 'الجميع',
    },
    'zlb58c6x': {
      'en': 'Made By: Eng. Bandar Majeed',
      'ar': 'إعداد: المهندس بندر مجيد',
    },
    'dsq2jczw': {
      'en': 'Add Task',
      'ar': 'إضافة مهمة',
    },
    'xostacni': {
      'en': 'Dashboard',
      'ar': 'لوحة القيادة',
    },
    '9wrjs1qa': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // AdminAllTasks
  {
    'kzwly23o': {
      'en': 'PENDING',
      'ar': 'قيد الانتظار',
    },
    'c7at5byw': {
      'en': 'COMPLETED',
      'ar': 'مكتمل',
    },
    'p67k8o4d': {
      'en': 'TOTAL USERS',
      'ar': 'إجمالي المستخدمين',
    },
    '2dt3ngfu': {
      'en': 'TOTAL TASKS',
      'ar': 'مجموع المهام',
    },
    '0aye3vc9': {
      'en': 'Below are a list of all the available tasks.',
      'ar': 'تجد أدناه قائمة بجميع المهام المتاحة.',
    },
    'rjvf1jef': {
      'en': 'Search all tasks...',
      'ar': 'البحث في جميع المهام...',
    },
    'y2n2kbeu': {
      'en': 'All Tasks',
      'ar': 'جميع المهام',
    },
    'so4nvxgm': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // ActivationPending
  {
    'xp7vkyk5': {
      'en': 'Account Pending Activation',
      'ar': 'الحساب في انتظار التنشيط',
    },
    'wlcbdeso': {
      'en': 'You will be notified when your account is activated by the admin.',
      'ar': 'سيتم إعلامك عندما يتم تفعيل حسابك من قبل المسؤول.',
    },
    'atbgkxxl': {
      'en': 'Sign Out',
      'ar': 'تسجيل الخروج',
    },
    '1wv98019': {
      'en': 'Made By: Eng. Bandar Majeed',
      'ar': 'إعداد: المهندس بندر مجيد',
    },
    '0r7qdgpb': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // AimPage
  {
    'x4mbhgzt': {
      'en': 'Our Aim',
      'ar': 'هدفنا',
    },
    'n0z090j6': {
      'en': 'Modify Details',
      'ar': 'تعديل التفاصيل',
    },
  },
  // AimModify
  {
    '9z36cbs4': {
      'en': 'App Details',
      'ar': 'تفاصيل التطبيق',
    },
    'moz7zg5g': {
      'en': 'App Name',
      'ar': 'اسم التطبيق',
    },
    'mw1jzait': {
      'en': 'Description',
      'ar': 'وصف',
    },
    '789vtrmg': {
      'en': 'Why Choose Us',
      'ar': 'لماذا تختارنا؟',
    },
    'yr27wjjd': {
      'en': 'Why Choose Us',
      'ar': 'لماذا تختارنا؟',
    },
    '86rcqi1l': {
      'en': 'Add New Reason',
      'ar': 'أضف سببًا جديدًا',
    },
    'h29h4iu9': {
      'en': 'Save Changes',
      'ar': 'حفظ التغييرات',
    },
  },
  // ResolutionCenter
  {
    'qou463nr': {
      'en': 'Discution Center',
      'ar': '',
    },
    'h74blmff': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // emptyList
  {
    'i44b1lgz': {
      'en': 'No Activity',
      'ar': 'لا يوجد نشاط',
    },
    '4vxq5lua': {
      'en': 'It seems that you don\'t have any recent tasks.',
      'ar': 'يبدو أنه ليس لديك أي مهام حديثة.',
    },
  },
  // EmailChangePopup
  {
    'ph69ewjj': {
      'en': 'New Email Address',
      'ar': 'عنوان بريد إلكتروني جديد',
    },
    'ith0i56s': {
      'en': 'Change Email',
      'ar': 'تغيير البريد الإلكتروني',
    },
  },
  // ChatComp
  {
    'omjm5lmy': {
      'en': 'Start typing here...',
      'ar': 'ابدأ الكتابة هنا...',
    },
    'hibut0cn': {
      'en': 'You must enter a message...',
      'ar': 'يجب عليك إدخال الرسالة...',
    },
    'wndlujve': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'الرجاء اختيار خيار من القائمة المنسدلة',
    },
  },
  // Miscellaneous
  {
    'neb84l7v': {
      'en':
          'We need access to your camera to allow you to take photos and videos directly within the app. This is used to attach images or documents to your notes and tasks.',
      'ar':
          'نحن بحاجة إلى الوصول إلى الكاميرا الخاصة بك للسماح لك بالتقاط الصور ومقاطع الفيديو مباشرة داخل التطبيق. يتم استخدام هذا لإرفاق الصور أو المستندات بملاحظاتك ومهامك.',
    },
    'sxxmtw0j': {
      'en':
          'We need permission to access your photo library so you can select and upload existing photos and videos from your device. This helps you attach relevant media to your notes and tasks.',
      'ar':
          'نحن بحاجة إلى إذن للوصول إلى مكتبة الصور الخاصة بك حتى تتمكن من تحديد الصور ومقاطع الفيديو الموجودة وتحميلها من جهازك. يساعدك هذا في إرفاق الوسائط ذات الصلة بملاحظاتك ومهامك.',
    },
    '206fnn4o': {
      'en':
          'We need your location to provide personalized services. Your data will remain secure.',
      'ar': 'نحن بحاجة إلى موقعك لتقديم خدمات مخصصة لك. ستظل بياناتك آمنة.',
    },
    '6rstqz72': {
      'en': '',
      'ar': '',
    },
    'h3sewytk': {
      'en':
          'Location permission is required to tag your notes or tasks with your current geolocation. This helps in associating the notes with specific locations, where necessary.',
      'ar':
          'يلزم الحصول على إذن تحديد الموقع الجغرافي لوضع علامة على ملاحظاتك أو مهامك باستخدام موقعك الجغرافي الحالي. يساعد هذا في ربط الملاحظات بمواقع محددة، عند الضرورة.',
    },
    '7ixyemrv': {
      'en': '',
      'ar': '',
    },
    's9mujqv1': {
      'en': '',
      'ar': '',
    },
    'gkx7axpa': {
      'en': '',
      'ar': '',
    },
    '7uq8a29y': {
      'en': '',
      'ar': '',
    },
    'nu1mq6on': {
      'en': '',
      'ar': '',
    },
    'ooupxc6f': {
      'en': '',
      'ar': '',
    },
    'qvolbget': {
      'en': '',
      'ar': '',
    },
    '16mor4s3': {
      'en': '',
      'ar': '',
    },
    'k89xupic': {
      'en': '',
      'ar': '',
    },
    '77oyhq33': {
      'en': '',
      'ar': '',
    },
    'eke011ij': {
      'en': '',
      'ar': '',
    },
    'maxza4iv': {
      'en': '',
      'ar': '',
    },
    'ic6am71b': {
      'en': '',
      'ar': '',
    },
    'hf93r8hh': {
      'en': '',
      'ar': '',
    },
    '3rpvr7vc': {
      'en': '',
      'ar': '',
    },
    '8ie1hdln': {
      'en': '',
      'ar': '',
    },
    'mzps47p1': {
      'en': '',
      'ar': '',
    },
    'gh6924ax': {
      'en': '',
      'ar': '',
    },
    '4artaf70': {
      'en': '',
      'ar': '',
    },
    'p3fhyzry': {
      'en': '',
      'ar': '',
    },
    'v2ho755v': {
      'en': '',
      'ar': '',
    },
    '61v94cnj': {
      'en': '',
      'ar': '',
    },
    'v0pq3tv9': {
      'en': '',
      'ar': '',
    },
    'rs85g9t8': {
      'en': '',
      'ar': '',
    },
    '7d3hk965': {
      'en': '',
      'ar': '',
    },
  },
].reduce((a, b) => a..addAll(b));
