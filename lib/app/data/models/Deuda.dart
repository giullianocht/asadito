// To parse this JSON data, do
//
//     final deuda = deudaFromJson(jsonString);

import 'dart:convert';

class Deuda {
  Deuda({
    required this.debt,
  });

  Debt debt;

  factory Deuda.fromRawJson(String str) => Deuda.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Deuda.fromJson(Map<String, dynamic> json) => Deuda(
        debt: Debt.fromJson(json["debt"]),
      );

  Map<String, dynamic> toJson() => {
        "debt": debt.toJson(),
      };
}

class Debt {
  Debt({
    required this.docId,
    required this.label,
    required this.amount,
    required this.target,
    required this.validPeriod,
    required this.description,
  });

  String docId;
  String label;
  Amount amount;
  Target target;
  ValidPeriod validPeriod;
  Description description;

  factory Debt.fromRawJson(String str) => Debt.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Debt.fromJson(Map<String, dynamic> json) => Debt(
        docId: json["docId"],
        label: json["label"],
        amount: Amount.fromJson(json["amount"]),
        target: Target.fromJson(json["target"]),
        validPeriod: ValidPeriod.fromJson(json["validPeriod"]),
        description: Description.fromJson(json["description"]),
      );

  Map<String, dynamic> toJson() => {
        "docId": docId,
        "label": label,
        "amount": amount.toJson(),
        "target": target.toJson(),
        "validPeriod": validPeriod.toJson(),
        "description": description.toJson(),
      };
}

class Amount {
  Amount({
    required this.currency,
    required this.value,
  });

  String currency;
  String value;

  factory Amount.fromRawJson(String str) => Amount.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Amount.fromJson(Map<String, dynamic> json) => Amount(
        currency: json["currency"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "currency": currency,
        "value": value,
      };
}

class Description {
  Description({
    required this.summary,
  });

  String summary;

  factory Description.fromRawJson(String str) =>
      Description.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Description.fromJson(Map<String, dynamic> json) => Description(
        summary: json["summary"],
      );

  Map<String, dynamic> toJson() => {
        "summary": summary,
      };
}

class Target {
  Target({
    required this.type,
    required this.number,
    required this.label,
  });

  String type;
  String number;
  String label;

  factory Target.fromRawJson(String str) => Target.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Target.fromJson(Map<String, dynamic> json) => Target(
        type: json["type"],
        number: json["number"],
        label: json["label"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "number": number,
        "label": label,
      };
}

class ValidPeriod {
  ValidPeriod({
    required this.start,
    required this.end,
  });

  DateTime start;
  DateTime end;

  factory ValidPeriod.fromRawJson(String str) =>
      ValidPeriod.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ValidPeriod.fromJson(Map<String, dynamic> json) => ValidPeriod(
        start: json["start"],
        end: json["end"],
      );

  Map<String, dynamic> toJson() => {
        "start": start.toIso8601String().substring(0, 19) + "+00:00",
        "end": end.toIso8601String().substring(0, 19) + "+00:00",
      };
}
