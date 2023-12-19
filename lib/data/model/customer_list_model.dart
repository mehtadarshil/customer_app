// To parse this JSON data, do
//
//     final customerListModel = customerListModelFromJson(jsonString);

import 'dart:convert';

CustomerListModel customerListModelFromJson(String str) =>
    CustomerListModel.fromJson(json.decode(str));

String customerListModelToJson(CustomerListModel data) =>
    json.encode(data.toJson());

class CustomerListModel {
  final Data? data;
  final String? message;
  final num? status;

  CustomerListModel({
    this.data,
    this.message,
    this.status,
  });

  factory CustomerListModel.fromJson(Map<String, dynamic> json) =>
      CustomerListModel(
        data: json["Data"] == null ? null : Data.fromJson(json["Data"]),
        message: json["Message"],
        status: json["Status"],
      );

  Map<String, dynamic> toJson() => {
        "Data": data?.toJson(),
        "Message": message,
        "Status": status,
      };
}

class Data {
  final List<Detail>? details;
  final num? totalCount;

  Data({
    this.details,
    this.totalCount,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        details: json["details"] == null
            ? []
            : List<Detail>.from(
                json["details"]!.map((x) => Detail.fromJson(x))),
        totalCount: json["TotalCount"],
      );

  Map<String, dynamic> toJson() => {
        "details": details == null
            ? []
            : List<dynamic>.from(details!.map((x) => x.toJson())),
        "TotalCount": totalCount,
      };
}

class Detail {
  final num? rowNum;
  final num? customerId;
  final String? customerName;
  final String? customerType;
  final bool? blockCustomer;
  final String? address;
  final String? area;
  final String? pinCode;
  final num? cityCode;
  final String? cityName;
  final num? stateCode;
  final String? stateName;
  final num? gstStateCode;
  final dynamic address1;
  final dynamic area1;
  final dynamic pinCode1;
  final dynamic cityCode1;
  final String? cityName1;
  final dynamic stateCode1;
  final String? stateName1;
  final dynamic gstStateCode1;
  final String? gstno;
  final String? panno;
  final dynamic cinno;
  final String? contactNo1;
  final String? contactNo2;
  final String? emailAddress;
  final String? websiteAddress;
  final dynamic birthDate;
  final dynamic anniversaryDate;
  final dynamic orgTypeCode;
  final dynamic orgType;
  final dynamic parentId;
  final dynamic erpClosing;
  final String? parentName;
  final num? customerSourceId;
  final String? customerSourceName;
  final dynamic specialityId;
  final String? specialityName;
  final dynamic treatmentType;
  final dynamic generateInquiry;
  final String? countryCode;
  final String? countryName;
  final dynamic countryCode1;
  final String? countryName1;
  final num? opening;
  final num? debit;
  final num? credit;
  final num? closing;
  final num? priceListId;
  final String? createdBy;
  final DateTime? createdDate;
  final String? latitude;
  final String? longitude;

  Detail({
    this.rowNum,
    this.customerId,
    this.customerName,
    this.customerType,
    this.blockCustomer,
    this.address,
    this.area,
    this.pinCode,
    this.cityCode,
    this.cityName,
    this.stateCode,
    this.stateName,
    this.gstStateCode,
    this.address1,
    this.area1,
    this.pinCode1,
    this.cityCode1,
    this.cityName1,
    this.stateCode1,
    this.stateName1,
    this.gstStateCode1,
    this.gstno,
    this.panno,
    this.cinno,
    this.contactNo1,
    this.contactNo2,
    this.emailAddress,
    this.websiteAddress,
    this.birthDate,
    this.anniversaryDate,
    this.orgTypeCode,
    this.orgType,
    this.parentId,
    this.erpClosing,
    this.parentName,
    this.customerSourceId,
    this.customerSourceName,
    this.specialityId,
    this.specialityName,
    this.treatmentType,
    this.generateInquiry,
    this.countryCode,
    this.countryName,
    this.countryCode1,
    this.countryName1,
    this.opening,
    this.debit,
    this.credit,
    this.closing,
    this.priceListId,
    this.createdBy,
    this.createdDate,
    this.latitude,
    this.longitude,
  });

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
        rowNum: json["RowNum"],
        customerId: json["CustomerID"],
        customerName: json["CustomerName"],
        customerType: json["CustomerType"],
        blockCustomer: json["BlockCustomer"],
        address: json["Address"],
        area: json["Area"],
        pinCode: json["PinCode"],
        cityCode: json["CityCode"],
        cityName: json["CityName"],
        stateCode: json["StateCode"],
        stateName: json["StateName"],
        gstStateCode: json["GSTStateCode"],
        address1: json["Address1"],
        area1: json["Area1"],
        pinCode1: json["PinCode1"],
        cityCode1: json["CityCode1"],
        cityName1: json["CityName1"],
        stateCode1: json["StateCode1"],
        stateName1: json["StateName1"],
        gstStateCode1: json["GSTStateCode1"],
        gstno: json["GSTNO"],
        panno: json["PANNO"],
        cinno: json["CINNO"],
        contactNo1: json["ContactNo1"],
        contactNo2: json["ContactNo2"],
        emailAddress: json["EmailAddress"],
        websiteAddress: json["WebsiteAddress"],
        birthDate: json["BirthDate"],
        anniversaryDate: json["AnniversaryDate"],
        orgTypeCode: json["OrgTypeCode"],
        orgType: json["OrgType"],
        parentId: json["ParentID"],
        erpClosing: json["ErpClosing"],
        parentName: json["ParentName"],
        customerSourceId: json["CustomerSourceID"],
        customerSourceName: json["CustomerSourceName"],
        specialityId: json["SpecialityID"],
        specialityName: json["SpecialityName"],
        treatmentType: json["TreatmentType"],
        generateInquiry: json["GenerateInquiry"],
        countryCode: json["CountryCode"],
        countryName: json["CountryName"],
        countryCode1: json["CountryCode1"],
        countryName1: json["CountryName1"],
        opening: json["Opening"],
        debit: json["Debit"],
        credit: json["Credit"],
        closing: json["Closing"],
        priceListId: json["PriceListID"],
        createdBy: json["CreatedBy"],
        createdDate: json["CreatedDate"] == null
            ? null
            : DateTime.parse(json["CreatedDate"]),
        latitude: json["Latitude"],
        longitude: json["Longitude"],
      );

  Map<String, dynamic> toJson() => {
        "RowNum": rowNum,
        "CustomerID": customerId,
        "CustomerName": customerName,
        "CustomerType": customerType,
        "BlockCustomer": blockCustomer,
        "Address": address,
        "Area": area,
        "PinCode": pinCode,
        "CityCode": cityCode,
        "CityName": cityName,
        "StateCode": stateCode,
        "StateName": stateName,
        "GSTStateCode": gstStateCode,
        "Address1": address1,
        "Area1": area1,
        "PinCode1": pinCode1,
        "CityCode1": cityCode1,
        "CityName1": cityName1,
        "StateCode1": stateCode1,
        "StateName1": stateName1,
        "GSTStateCode1": gstStateCode1,
        "GSTNO": gstno,
        "PANNO": panno,
        "CINNO": cinno,
        "ContactNo1": contactNo1,
        "ContactNo2": contactNo2,
        "EmailAddress": emailAddress,
        "WebsiteAddress": websiteAddress,
        "BirthDate": birthDate,
        "AnniversaryDate": anniversaryDate,
        "OrgTypeCode": orgTypeCode,
        "OrgType": orgType,
        "ParentID": parentId,
        "ErpClosing": erpClosing,
        "ParentName": parentName,
        "CustomerSourceID": customerSourceId,
        "CustomerSourceName": customerSourceName,
        "SpecialityID": specialityId,
        "SpecialityName": specialityName,
        "TreatmentType": treatmentType,
        "GenerateInquiry": generateInquiry,
        "CountryCode": countryCode,
        "CountryName": countryName,
        "CountryCode1": countryCode1,
        "CountryName1": countryName1,
        "Opening": opening,
        "Debit": debit,
        "Credit": credit,
        "Closing": closing,
        "PriceListID": priceListId,
        "CreatedBy": createdBy,
        "CreatedDate": createdDate?.toIso8601String(),
        "Latitude": latitude,
        "Longitude": longitude,
      };
}
