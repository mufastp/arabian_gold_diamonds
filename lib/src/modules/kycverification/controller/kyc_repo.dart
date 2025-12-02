
import 'dart:convert';
import 'package:arabian_gold_diamonds/app/utils/dio/dio_client.dart';
import 'package:arabian_gold_diamonds/app/utils/network/api_urls.dart';

class KycRepository {
  final DioClient _dio = DioClient();

  /// ------------------------------
  /// 🚀 SUBMIT KYC DETAILS
  /// ------------------------------
  Future<bool> submitKyc({
    required String fullName,
    required String dateOf,
    required String mobileNo,
    required String docNum,
    required String docType,
    required String country,
    required String frontSideImageUrl,
    required String backSideImageUrl,
    required String selfiImageUrl,
    required String signImageUrl,

    /// Optional Nominee
    String? nomineeFullName,
    String? nomineeMobileNo,
    String? nomineeRelationship,
    String? nomineeDocType,
    String? nomineeFrontImageUrl,
    String? nomineeBackImageUrl,
  }) async {
    try {
      /// --------------------------
      /// NOMINEE OPTIONAL OBJECT
      /// --------------------------
      List<dynamic> nomineeList = [];

      if (nomineeFullName != null &&
          nomineeMobileNo != null &&
          nomineeRelationship != null &&
          nomineeDocType != null &&
          nomineeFrontImageUrl != null &&
          nomineeBackImageUrl != null) {
        nomineeList.add({
          "fullName": nomineeFullName,
          "mobileNo": nomineeMobileNo,
          "relationship": nomineeRelationship,
          "docType": nomineeDocType,
          "frontSideImageUrl": nomineeFrontImageUrl,
          "backSideImageUrl": nomineeBackImageUrl,
        });
      }

      /// --------------------------
      /// FINAL REQUEST PAYLOAD
      /// --------------------------
      final Map<String, dynamic> body = {
        "fullName": fullName,
        "dateOf": dateOf,
        "mobileNo": mobileNo,
        "docNum": docNum,
        "docType": docType,
        "country": country,
        "frontSideImageUrl": frontSideImageUrl,
        "backSideImageUrl": backSideImageUrl,
        "nomineee": nomineeList,
        "selfiImageUrl": selfiImageUrl,
        "signImageUrl": signImageUrl
      };

      final response = await _dio.post(
        ApiUrls.postkyc,
        body: body,
      );

      print("KYC Submit Response: ${response.data}");

      return true;
    } catch (e) {
      print("KYC Submit Error: $e");
      return false;
    }
  }
}
