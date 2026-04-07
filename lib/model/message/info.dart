import 'package:ausweisapp2_sdk/model/message.dart';

/// refer to: https://www.ausweisapp.bund.de/sdk/messages.html#info
class Info extends Message {
  Info(MessageType msg, Map<String, dynamic> json, this.versionInfo) : super(msg, json);

  factory Info.fromJson(Map<String, dynamic> json) {
    return Info(
      MessageType.API_LEVEL,
      json,
      VersionInfo.fromJson(json['versionInfo']),
    );
  }

  final VersionInfo versionInfo;
}

class VersionInfo {
  VersionInfo(
    this.name,
    this.implementationTitle,
    this.implementationVendor,
    this.implementationVersion,
    this.specificationTitle,
    this.specificationVendor,
    this.specificationVersion,
  );

  factory VersionInfo.fromJson(Map<String, dynamic> json) {
    return VersionInfo(
      json['Name'] as String,
      json['Implementation-Title'] as String,
      json['Implementation-Vendor'] as String,
      json['Implementation-Version'] as String,
      json['Specification-Title'] as String,
      json['Specification-Vendor'] as String,
      json['Specification-Version'] as String,
    );
  }

  final String name;
  final String implementationTitle;
  final String implementationVendor;
  final String implementationVersion;
  final String specificationTitle;
  final String specificationVendor;
  final String specificationVersion;
}
