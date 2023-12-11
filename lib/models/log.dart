class Log {
  String date;
  String result;

  Log({
    required this.date,
    required this.result,
  });

  factory Log.fromJson(Map<String, dynamic> json) {
    return Log(date: json["date"], result: json["result"]);
  }
}
