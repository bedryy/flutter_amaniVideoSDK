import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/services.dart';


import 'amanivideosdk_platform_interface.dart';

class MethodChannelAmaniVideoSDK extends AmaniVideoSDKPlatform {

  final methodChannel = const MethodChannel('amanivideosdk_method_channel');
  @override 
  Future<void> startVideo({
      required String serverUrl,
      required String token,
      required String name,
      required String surname,
      required String stunServer,
      required String turnServer,
      required String turnUser,
      required String turnPass,
    }) async {
      try {
        print("method channel tarafında plugine'e gidecek");
        await methodChannel.invokeMethod('startVideo', {
          'serverUrl': serverUrl,
          'token': token,
          'name': name,
          'surname': surname,
          'stunServer': stunServer,
          'turnServer': turnServer,
          'turnUser': turnUser,
          'turnPass': turnPass,
        });
      } catch (e) {
        rethrow;
      }
    }
}