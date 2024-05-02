import 'dart:convert';
import 'dart:typed_data';
import 'package:intl/intl.dart';

enum Formats {
  date,
  dayDate,
  time,
  dayDateTime,
  dateTime,
  month,
  string,
}

extension ExtDate on DateTime? {
  bool isBefore(DateTime? other) {
    if (this == null) {
      return false;
    } else {
      return this!.isBefore(other ?? DateTime.now());
    }
  }

  bool isAfter(DateTime? other) {
    if (this == null) {
      return false;
    } else {
      return this!.isAfter(other ?? DateTime.now());
    }
  }

  bool isAtSameMomentAs(DateTime? other) {
    if (this == null) {
      return false;
    } else {
      return this!.isAtSameMomentAs(other ?? DateTime.now());
    }
  }

  String toStrings({
    Formats format = Formats.date,
    String stringFormat = "",
    String? locale,
  }) {
    String locale0 = "";
    if (locale == null) {
      locale0 = "id-ID";
    } else {
      locale0 = locale;
    }

    if (this == null) {
      return "";
    } else {
      if (format == Formats.string) {
        if (stringFormat.isNotEmpty) {
          return DateFormat(stringFormat, locale0).format(this!);
        } else {
          return DateFormat.Hm(locale0).format(this!);
        }
      } else if (format == Formats.date) {
        return DateFormat.yMMMMd(locale0).format(this!);
      } else if (format == Formats.dayDate) {
        return DateFormat.E(locale0).add_yMd().format(this!);
      } else if (format == Formats.dayDateTime) {
        return DateFormat.E(locale0).add_yMd().add_Hm().format(this!);
      } else if (format == Formats.dateTime) {
        return DateFormat.yMMMMd(locale0).add_Hm().format(this!);
      } else if (format == Formats.time) {
        return DateFormat.Hm(locale0).format(this!);
      } else if (format == Formats.month) {
        return DateFormat.MMMM(locale0).format(this!);
      } else {
        return DateFormat.yMMMMd(locale0).format(this!);
      }
    }
  }
}

class Base64 {
  static bool isBase64(String value) {
    return RegExp(r'^data:image\/([a-zA-Z]*);base64,([a-zA-Z0-9\/\+=]*)$')
        .hasMatch(value);
  }

  static Uint8List encode(String value) {
    return base64Decode(value.split(",").last);
  }
}

extension Extint on num? {
  String get toStrings {
    if (this == null) {
      return "";
    }
    return this!.toString();
  }

  String get format {
    if (this == null) {
      return "";
    }
    NumberFormat f = NumberFormat("#,###.###");
    return f.format(this!);
  }

  double toPrecision({int n = 2}) {
    if (this == null) {
      return 0;
    }
    return double.tryParse(this!.toStringAsFixed(n)) ?? 0.0;
  }
}

extension ExtString on String? {
  bool get isValidEmail {
    if (this == null) {
      return false;
    }
    return RegExps.email.hasMatch(this!);
  }

  String get toBeginning {
    if (this == null) {
      return "";
    }
    return toBeginningOfSentenceCase(this) ?? "";
  }

  String get toLower {
    if (this == null) {
      return "";
    }
    return this!.toLowerCase();
  }

  String toStringWithLimit(int? limit) {
    if (this == null) {
      return "";
    }
    if (limit == null) {
      return this ?? "";
    }

    return this!.length <= limit ? this! : '${this!.substring(0, limit)}...';
  }

  String get toUpper {
    if (this == null) {
      return "";
    }
    return this!.toUpperCase();
  }

  String get toTitleCase {
    if (this == null) {
      return "";
    }
    if (this!.length <= 1) {
      return this!.toUpperCase();
    }
    final List<String> words = this!.split(' ');

    final capitalizedWords = words.map((word) {
      if (word.trim().isNotEmpty) {
        final String firstLetter = word.trim().substring(0, 1).toUpperCase();
        final String remainingLetters = word.trim().substring(1);

        return '$firstLetter$remainingLetters';
      }
      return '';
    });

    // Join/Merge all words back to one String
    return capitalizedWords.join(' ');
  }

  bool get isWhiteSpace => this!.trim().isEmpty;
  //  RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\><*~]).{8,}/pre>')
  bool get isValidPassword => this!.length >= 5;
  bool get isValidVerifition => this!.isNotEmpty;

  String get hidePhone {
    if (this == null) {
      return "";
    }
    List<String> result = this!.split("");
    String phone = "";
    int leftChar = 4;
    int t = result.length - leftChar;
    int n = 1;
    for (var e in result) {
      if (n > t) {
        phone += e;
      } else {
        phone += "*";
      }
      n++;
    }
    return phone;
  }

  bool get parseBool {
    if (this!.isNotEmpty && this!.toLowerCase() == "true") {
      return true;
    } else {
      return false;
    }
  }

  String get is0Phone {
    if (this == null) {
      return "";
    }
    String p = "";
    if (this!.isNotEmpty && this!.substring(0, 1) != "0") {
      p += "0$this";
    } else {
      p = this!;
    }
    return p;
  }

  bool get isValidPhone {
    if (this == null) {
      return false;
    }
    final phoneRegExp = RegExps.phone;
    return phoneRegExp.hasMatch(this!);
  }

  bool get isValidInt {
    if (this == null) {
      return false;
    }
    final phoneRegExp = RegExps.int;
    return phoneRegExp.hasMatch(this!);
  }

  bool get isValidDouble {
    if (this == null) {
      return false;
    }
    final phoneRegExp = RegExps.double;
    return phoneRegExp.hasMatch(this!);
  }

  String addLeadingZeroIfNeeded(int value) {
    if (value < 10) {
      return '0$value';
    }
    return value.toString();
  }
}

class RegExps {
  static RegExp int = RegExp(r'^(-)?\d+$');
  static RegExp double = RegExp(r'(^\d*\.?\d{0,10})');
  static RegExp email = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  static RegExp phone =
      RegExp(r"^[\+]?[(]?[0-9]{4}[)]?[-\s\.]?[0-9]{4}[-\s\.]?[0-9]{4,6}$");
}

// https://dev.to/0xba1/using-regular-expressionsregexp-in-dartflutter-3p1j
// https://ihateregex.io/expr/password/