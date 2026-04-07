import 'package:ausweisapp2_sdk/model/message.dart';

enum AccessRight {
  address,
  birthName,
  familyName,
  givenNames,
  placeOfBirth,
  dateOfBirth,
  doctoralDegree,
  artisticName,
  pseudonym,
  validUntil,
  nationality,
  issuingCountry,
  documentType,
  residencePermitI,
  residencePermitII,
  communityID,
  addressVerification,
  ageVerification,
  writeAddress,
  writeCommunityID,
  writeResidencePermitI,
  writeResidencePermitII,
  canAllowed,
  pinManagement,
}

/// refer to: https://www.ausweisapp.bund.de/sdk/messages.html#access-rights
class AccessRights extends Message {
  AccessRights(
    MessageType msg,
    Map<String, dynamic> json,
    this.error,
    this.aux,
    this.chat,
    this.transactionInfo,
    this.canAllowed,
  ) : super(msg, json);

  factory AccessRights.fromJson(Map<String, dynamic> json) {
    return AccessRights(
      MessageType.ACCESS_RIGHTS,
      json,
      json['error'] as String?,
      json['aux'] == null ? null : Aux.fromJson(json['aux']),
      Chat.fromJson(json['chat']),
      json['transactionInfo'] as String?,
      json['canAllowed'] as bool?,
    );
  }

  final String? error;
  final Aux? aux;
  final Chat chat;
  final String? transactionInfo;
  final bool? canAllowed;
}

class Aux {
  Aux(this.ageVerificationDate, this.requiredAge, this.validityDate, this.communityId);

  factory Aux.fromJson(Map<String, dynamic> json) {
    return Aux(
      json['ageVerificationDate'] as String?,
      json['requiredAge'] as String?,
      json['validityDate'] as String?,
      json['communityId'] as String?,
    );
  }

  final String? ageVerificationDate;
  final String? requiredAge;
  final String? validityDate;
  final String? communityId;
}

class Chat {
  Chat(this.effective, this.optional, this.required);

  factory Chat.fromJson(Map<String, dynamic> json) {
    final Map<String, AccessRight> accessRightMap = {
      'Address': AccessRight.address,
      'BirthName': AccessRight.birthName,
      'FamilyName': AccessRight.familyName,
      'GivenNames': AccessRight.givenNames,
      'PlaceOfBirth': AccessRight.placeOfBirth,
      'DateOfBirth': AccessRight.dateOfBirth,
      'DoctoralDegree': AccessRight.doctoralDegree,
      'ArtisticName': AccessRight.artisticName,
      'Pseudonym': AccessRight.pseudonym,
      'ValidUntil': AccessRight.validUntil,
      'Nationality': AccessRight.nationality,
      'IssuingCountry': AccessRight.issuingCountry,
      'DocumentType': AccessRight.documentType,
      'ResidencePermitI': AccessRight.residencePermitI,
      'ResidencePermitII': AccessRight.residencePermitII,
      'CommunityID': AccessRight.communityID,
      'AddressVerification': AccessRight.addressVerification,
      'AgeVerification': AccessRight.ageVerification,
      'WriteAddress': AccessRight.writeAddress,
      'WriteCommunityID': AccessRight.writeCommunityID,
      'WriteResidencePermitI': AccessRight.writeResidencePermitI,
      'WriteResidencePermitII': AccessRight.writeResidencePermitII,
      'CanAllowed': AccessRight.canAllowed,
      'PinManagement': AccessRight.pinManagement,
    };

    return Chat(
      (json['effective'] as List).map((effective) => accessRightMap[effective as String]).toList(),
      (json['optional'] as List).map((optional) => accessRightMap[optional as String]).toList(),
      (json['required'] as List).map((required) => accessRightMap[required as String]).toList(),
    );
  }

  final List<AccessRight?> effective;
  final List<AccessRight?> optional;
  final List<AccessRight?> required;
}
