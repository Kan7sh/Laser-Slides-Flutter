class Utils {
  static dynamic simpleParse(String value) {
    try {
      return int.parse(value);
    } on FormatException {}

    try {
      return double.parse(value);
    } on FormatException {}

    return value;
  }

  static String convertToString(List<Object?>? args) {
    final res = StringBuffer();
    if (args == null || args.isEmpty) {
      return res.toString();
    }

    for (int i = 0; i < args.length; i += 1) {
      res.write(args[i].toString());
      res.write(" ");
    }

    return res.toString().trim();
  }
}
