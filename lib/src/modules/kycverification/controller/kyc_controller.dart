import 'dart:io';

import 'package:arabian_gold_diamonds/app/routes/app_pages.dart';
import 'package:arabian_gold_diamonds/src/modules/kycverification/controller/kyc_repo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class KycController extends GetxController {
  // ----------------------------
  // FORM KEYS
  // ----------------------------
  final formStep1Key = GlobalKey<FormState>();
  final formStepNomineeKey = GlobalKey<FormState>();

  // ----------------------------
  // TEXTFIELDS
  // ----------------------------
  final nameCtrl = TextEditingController();
  final dobCtrl = TextEditingController();
  final phoneCtrl = TextEditingController();
  final nationalityCtrl = TextEditingController(text: "United Arab Emirates");
  final EmiratesIDCtrl = TextEditingController(text: "Emirates ID");
  final docNumCtrl = TextEditingController();

  // Nominee fields
  final nomineeNameCtrl = TextEditingController();
  final nomineePhoneCtrl = TextEditingController();
  final nomineeRelationshipCtrl = TextEditingController(
    text: "Mother",
  ); // static

  // ----------------------------
  // IMAGE VARIABLES
  // ----------------------------
  Rx<File?> frontImage = Rx<File?>(null);
  Rx<File?> backImage = Rx<File?>(null);
  Rx<File?> selfieImage = Rx<File?>(null);
  Rx<File?> signatureImage = Rx<File?>(null);

  Rx<File?> nomineeFrontImage = Rx<File?>(null);
  Rx<File?> nomineeBackImage = Rx<File?>(null);

  // ----------------------------
  // FLAGS
  // ----------------------------
  RxBool isnominee = false.obs;
  RxBool isAgreed = false.obs;
  RxBool isLoading = false.obs;

  // ----------------------------
  // IMAGE PICKER
  // ----------------------------
  final ImagePicker picker = ImagePicker();
  final KycRepository repo = KycRepository();

  // ----------------------------
  // PICK IMAGE FUNCTIONS
  // ----------------------------
  Future pickSelfie() async {
    final XFile? image = await picker.pickImage(
      source: ImageSource.camera,
      preferredCameraDevice: CameraDevice.front,
    );

    if (image != null) selfieImage.value = File(image.path);
  }

  Future pickFrontImage() async {
    final XFile? image = await picker.pickImage(source: ImageSource.camera);
    if (image != null) frontImage.value = File(image.path);
  }

  Future pickBackImage() async {
    final XFile? image = await picker.pickImage(source: ImageSource.camera);
    if (image != null) backImage.value = File(image.path);
  }

  Future pickNomineeFront() async {
    final XFile? image = await picker.pickImage(source: ImageSource.camera);
    if (image != null) nomineeFrontImage.value = File(image.path);
  }

  Future pickNomineeBack() async {
    final XFile? image = await picker.pickImage(source: ImageSource.camera);
    if (image != null) nomineeBackImage.value = File(image.path);
  }

  Future pickSignature() async {
    final XFile? img = await picker.pickImage(source: ImageSource.camera);
    if (img != null) signatureImage.value = File(img.path);
  }

  // ----------------------------
  // VALIDATION CHECKERS
  // ----------------------------

  bool validateNominee() {
    if (!isnominee.value) return true;

    if (!formStepNomineeKey.currentState!.validate()) return false;

    if (nomineeFrontImage.value == null || nomineeBackImage.value == null) {
      Get.snackbar("Error", "Upload nominee ID images");
      return false;
    }

    return true;
  }

  bool validateStep2() {
    if (selfieImage.value == null) {
      Get.snackbar("Error", "Please upload selfie");
      return false;
    }
    return true;
  }

  bool validateStep3() {
    if (!isAgreed.value) {
      Get.snackbar("Error", "You must accept terms");
      return false;
    }
    if (signatureImage.value == null) {
      Get.snackbar("Error", "Signature is required");
      return false;
    }
    return true;
  }

  // ----------------------------
  // SUBMIT KYC (Final API Call)
  // ----------------------------
  Future submitKyc() async {
    isLoading.value = true;

    try {
      final bool success = await repo.submitKyc(
        fullName: nameCtrl.text,
        dateOf: dobCtrl.text,
        mobileNo: phoneCtrl.text,
        docNum: docNumCtrl.text,
        docType: EmiratesIDCtrl.text,
        country: nationalityCtrl.text,
        frontSideImageUrl: frontImage.value!.path,
        backSideImageUrl: backImage.value!.path,
        selfiImageUrl: selfieImage.value!.path,
        signImageUrl: signatureImage.value!.path,

        /// nominee data optional
        nomineeFullName: isnominee.value ? nomineeNameCtrl.text : null,
        nomineeMobileNo: isnominee.value ? nomineePhoneCtrl.text : null,
        nomineeRelationship: isnominee.value
            ? nomineeRelationshipCtrl.text
            : null,
        nomineeDocType: isnominee.value ? "Emirates ID" : null,
        nomineeFrontImageUrl: isnominee.value
            ? nomineeFrontImage.value!.path
            : null,
        nomineeBackImageUrl: isnominee.value
            ? nomineeBackImage.value!.path
            : null,
      );

      if (success) {
        Get.snackbar("Success", "KYC submitted successfully!");
        Get.offAllNamed(Routes.homescreen);
      } else {
        Get.snackbar("Error", "Something went wrong");
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  void clearSignature() {
    signatureImage.value = null;
  }

  void clearSelfie() {
    selfieImage.value = null;
  }
}
