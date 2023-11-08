class Information {
  int? hitsToday;
  int? hitsUsed;
  int? hitsLimit;
  int? credits;
  int? server;
  int? offsetRows;
  int? totalRows;
  double? queryTime;
  int? s;
  int? cache;

  Information(
      {this.hitsToday,
        this.hitsUsed,
        this.hitsLimit,
        this.credits,
        this.server,
        this.offsetRows,
        this.totalRows,
        this.queryTime,
        this.s,
        this.cache});

  Information.fromJson(Map<String, dynamic> json) {
    hitsToday = json['hitsToday'];
    hitsUsed = json['hitsUsed'];
    hitsLimit = json['hitsLimit'];
    credits = json['credits'];
    server = json['server'];
    offsetRows = json['offsetRows'];
    totalRows = json['totalRows'];
    queryTime = json['queryTime'];
    s = json['s'];
    cache = json['cache'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['hitsToday'] = hitsToday;
    data['hitsUsed'] = hitsUsed;
    data['hitsLimit'] = hitsLimit;
    data['credits'] = credits;
    data['server'] = server;
    data['offsetRows'] = offsetRows;
    data['totalRows'] = totalRows;
    data['queryTime'] = queryTime;
    data['s'] = s;
    data['cache'] = cache;
    return data;
  }
}
