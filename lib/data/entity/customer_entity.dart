// To parse this JSON data, do
//
//     final customerEntity = customerEntityFromJson(jsonString);

import 'dart:convert';

CustomerEntity customerEntityFromJson(String str) =>
    CustomerEntity.fromJson(json.decode(str));

String customerEntityToJson(CustomerEntity data) => json.encode(data.toJson());

class CustomerEntity {
  final int? customerId;
  final String? customerName;
  final String? customerType;
  final String? address;
  final String? area;
  final int? cityCode;
  final int? stateCode;
  final int? pinCode;
  final String? contactNo1;
  final String? contactNo2;
  final String? emailAddress;
  final String? gstno;
  final String? panno;
  final String? loginUserId;
  final String? websiteAddress;
  final dynamic latitude;
  final dynamic longitude;
  final String? countryCode;
  final int? blockCustomer;
  final int? customerSourceId;
  final int? companyId;

  CustomerEntity({
    this.customerId,
    this.customerName,
    this.customerType,
    this.address,
    this.area,
    this.cityCode,
    this.stateCode,
    this.pinCode,
    this.contactNo1,
    this.contactNo2,
    this.emailAddress,
    this.gstno,
    this.panno,
    this.loginUserId,
    this.websiteAddress,
    this.latitude,
    this.longitude,
    this.countryCode,
    this.blockCustomer,
    this.customerSourceId,
    this.companyId,
  });

  factory CustomerEntity.fromJson(Map<String, dynamic> json) => CustomerEntity(
        customerId: json["CustomerId"],
        customerName: json["CustomerName"],
        customerType: json["CustomerType"],
        address: json["Address"],
        area: json["Area"],
        cityCode: json["CityCode"],
        stateCode: json["StateCode"],
        pinCode: json["PinCode"],
        contactNo1: json["ContactNo1"],
        contactNo2: json["ContactNo2"],
        emailAddress: json["EmailAddress"],
        gstno: json["GSTNO"],
        panno: json["PANNO"],
        loginUserId: json["LoginUserID"],
        websiteAddress: json["WebsiteAddress"],
        latitude: json["Latitude"],
        longitude: json["Longitude"],
        countryCode: json["CountryCode"],
        blockCustomer: json["BlockCustomer"],
        customerSourceId: json["CustomerSourceID"],
        companyId: json["CompanyId"],
      );

  Map<String, dynamic> toJson() => {
        "CustomerId": customerId,
        "CustomerName": customerName,
        "CustomerType": customerType,
        "Address": address,
        "Area": area,
        "CityCode": cityCode,
        "StateCode": stateCode,
        "PinCode": pinCode,
        "ContactNo1": contactNo1,
        "ContactNo2": contactNo2,
        "EmailAddress": emailAddress,
        "GSTNO": gstno,
        "PANNO": panno,
        "LoginUserID": loginUserId,
        "WebsiteAddress": websiteAddress,
        "Latitude": latitude,
        "Longitude": longitude,
        "CountryCode": countryCode,
        "BlockCustomer": blockCustomer,
        "CustomerSourceID": customerSourceId,
        "CompanyId": companyId,
      };
}
