import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_admob/flutter_native_admob.dart';
import 'package:flutter_native_admob/native_admob_controller.dart';

class AdvertService {
  static final AdvertService instance = AdvertService._internal();
  final String interstitialID = "<INTERSTITIAL-AD-ID>";
  final String nativeID = "<NATIVE-AD-ID>";
  factory AdvertService() => instance;
  AdvertService._internal();
  MobileAdTargetingInfo mobileAdTargetingInfo = MobileAdTargetingInfo();
  NativeAdmobController controller = NativeAdmobController();
  showIntersitial() {
    InterstitialAd interstitialAd = InterstitialAd(
      adUnitId: interstitialID,
      targetingInfo: mobileAdTargetingInfo,
    );

    interstitialAd
      ..load()
      ..show();
  }

  Widget showNativeAd(double height, double width) {
    return SizedBox(
      width: width,
      height: height,
      child: NativeAdmob(
        adUnitID: nativeID,
        controller: controller,
        error: Text("Reklam istemcisi şuan yanıt vermiyor"),
        loading: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
