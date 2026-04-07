import 'package:ausweisapp2_sdk/model/message.dart';

/// refer to: https://www.ausweisapp.bund.de/sdk/messages.html#certificate
class Certificate extends Message {
  Certificate(
    MessageType msg,
    Map<String, dynamic> json,
    this.description,
    this.validity,
  ) : super(msg, json);

  factory Certificate.fromJson(Map<String, dynamic> json) {
    return Certificate(
      MessageType.CERTIFICATE,
      json,
      Description.fromJson(json['description']),
      Validity.fromJson(json['validity']),
    );
  }

  final Description description;
  final Validity validity;
}

class Description {
  Description(
    this.issuerName,
    this.issuerUrl,
    this.subjectName,
    this.subjectUrl,
    this.termsOfUsage,
    this.purpose,
  );

  factory Description.fromJson(Map<String, dynamic> json) {
    return Description(
      json['issuerName'] as String,
      json['issuerUrl'] as String,
      json['subjectName'] as String,
      json['subjectUrl'] as String,
      json['termsOfUsage'] as String,
      json['purpose'] as String,
    );
  }

  final String issuerName;
  final String issuerUrl;
  final String subjectName;
  final String subjectUrl;
  final String termsOfUsage;
  final String purpose;
}

class Validity {
  Validity(this.effectiveDate, this.expirationDate);

  factory Validity.fromJson(Map<String, dynamic> json) {
    return Validity(
      json['effectiveDate'] as String,
      json['expirationDate'] as String,
    );
  }

  final String effectiveDate;
  final String expirationDate;
}
