// To parse this JSON data, do
//
//     final estadoDeuda = estadoDeudaFromJson(jsonString);

import 'dart:convert';

class EstadoDeuda {
  EstadoDeuda({
    required this.meta,
    required this.debt,
  });

  EstadoDeudaMeta meta;
  Debt debt;

  factory EstadoDeuda.fromRawJson(String str) =>
      EstadoDeuda.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory EstadoDeuda.fromJson(Map<String, dynamic> json) => EstadoDeuda(
        meta: EstadoDeudaMeta.fromJson(json["meta"]),
        debt: Debt.fromJson(json["debt"]),
      );

  Map<String, dynamic> toJson() => {
        "meta": meta.toJson(),
        "debt": debt.toJson(),
      };
}

class Debt {
  Debt({
    required this.docId,
    required this.label,
    required this.slug,
    required this.payUrl,
    required this.amount,
    required this.exchangeMode,
    required this.target,
    required this.description,
    required this.validPeriod,
    required this.payStatus,
    required this.statusHash,
    required this.attr,
    required this.notifyUrl,
    required this.uiTheme,
    required this.objId,
    required this.objStatus,
    required this.created,
    required this.updated,
    required this.refs,
    required this.meta,
  });

  String docId;
  String label;
  String slug;
  String payUrl;
  Amount amount;
  dynamic exchangeMode;
  Target target;
  Description description;
  ValidPeriod validPeriod;
  Status payStatus;
  String statusHash;
  dynamic attr;
  dynamic notifyUrl;
  dynamic uiTheme;
  String objId;
  Status objStatus;
  DateTime created;
  DateTime updated;
  Refs refs;
  DebtMeta meta;

  factory Debt.fromRawJson(String str) => Debt.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Debt.fromJson(Map<String, dynamic> json) => Debt(
        docId: json["docId"],
        label: json["label"],
        slug: json["slug"],
        payUrl: json["payUrl"],
        amount: Amount.fromJson(json["amount"]),
        exchangeMode: json["exchangeMode"],
        target: Target.fromJson(json["target"]),
        description: Description.fromJson(json["description"]),
        validPeriod: ValidPeriod.fromJson(json["validPeriod"]),
        payStatus: Status.fromJson(json["payStatus"]),
        statusHash: json["statusHash"],
        attr: json["attr"],
        notifyUrl: json["notifyUrl"],
        uiTheme: json["uiTheme"],
        objId: json["objId"],
        objStatus: Status.fromJson(json["objStatus"]),
        created: DateTime.parse(json["created"]),
        updated: DateTime.parse(json["updated"]),
        refs: Refs.fromJson(json["refs"]),
        meta: DebtMeta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "docId": docId,
        "label": label,
        "slug": slug,
        "payUrl": payUrl,
        "amount": amount.toJson(),
        "exchangeMode": exchangeMode,
        "target": target.toJson(),
        "description": description.toJson(),
        "validPeriod": validPeriod.toJson(),
        "payStatus": payStatus.toJson(),
        "statusHash": statusHash,
        "attr": attr,
        "notifyUrl": notifyUrl,
        "uiTheme": uiTheme,
        "objId": objId,
        "objStatus": objStatus.toJson(),
        "created": created.toIso8601String(),
        "updated": updated.toIso8601String(),
        "refs": refs.toJson(),
        "meta": meta.toJson(),
      };
}

class Amount {
  Amount({
    required this.currency,
    required this.value,
    required this.paid,
  });

  String currency;
  String value;
  String paid;

  factory Amount.fromRawJson(String str) => Amount.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Amount.fromJson(Map<String, dynamic> json) => Amount(
        currency: json["currency"],
        value: json["value"],
        paid: json["paid"],
      );

  Map<String, dynamic> toJson() => {
        "currency": currency,
        "value": value,
        "paid": paid,
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

class DebtMeta {
  DebtMeta({
    required this.merchantObjId,
    required this.appObjId,
    required this.firstTxObjId,
    required this.lastTxObjId,
  });

  String merchantObjId;
  String appObjId;
  String firstTxObjId;
  String lastTxObjId;

  factory DebtMeta.fromRawJson(String str) =>
      DebtMeta.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DebtMeta.fromJson(Map<String, dynamic> json) => DebtMeta(
        merchantObjId: json["merchantObjId"],
        appObjId: json["appObjId"],
        firstTxObjId: json["firstTxObjId"],
        lastTxObjId: json["lastTxObjId"],
      );

  Map<String, dynamic> toJson() => {
        "merchantObjId": merchantObjId,
        "appObjId": appObjId,
        "firstTxObjId": firstTxObjId,
        "lastTxObjId": lastTxObjId,
      };
}

class Status {
  Status({
    required this.status,
    required this.code,
    required this.time,
    required this.text,
  });

  String status;
  dynamic code;
  DateTime time;
  dynamic text;

  factory Status.fromRawJson(String str) => Status.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Status.fromJson(Map<String, dynamic> json) => Status(
        status: json["status"],
        code: json["code"],
        time: DateTime.parse(json["time"]),
        text: json["text"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "code": code,
        "time": time.toIso8601String(),
        "text": text,
      };
}

class Refs {
  Refs({
    required this.txList,
    required this.attachments,
  });

  List<dynamic> txList;
  List<dynamic> attachments;

  factory Refs.fromRawJson(String str) => Refs.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Refs.fromJson(Map<String, dynamic> json) => Refs(
        txList: List<dynamic>.from(json["txList"].map((x) => x)),
        attachments: List<dynamic>.from(json["attachments"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "txList": List<dynamic>.from(txList.map((x) => x)),
        "attachments": List<dynamic>.from(attachments.map((x) => x)),
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
        start: DateTime.parse(json["start"]),
        end: DateTime.parse(json["end"]),
      );

  Map<String, dynamic> toJson() => {
        "start": start.toIso8601String(),
        "end": end.toIso8601String(),
      };
}

class EstadoDeudaMeta {
  EstadoDeudaMeta({
    required this.status,
    required this.site,
    required this.now,
    required this.op,
  });

  String status;
  String site;
  DateTime now;
  String op;

  factory EstadoDeudaMeta.fromRawJson(String str) =>
      EstadoDeudaMeta.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory EstadoDeudaMeta.fromJson(Map<String, dynamic> json) =>
      EstadoDeudaMeta(
        status: json["status"],
        site: json["site"],
        now: DateTime.parse(json["now"]),
        op: json["op"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "site": site,
        "now": now.toIso8601String(),
        "op": op,
      };
}
