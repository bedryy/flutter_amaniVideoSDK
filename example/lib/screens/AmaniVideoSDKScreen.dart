import 'package:flutter/material.dart';
import 'package:flutter_amanivideosdk/flutter_amanivideosdk.dart';
import 'package:flutter_amanivideosdk/modules/amani_video.dart';
import 'package:flutter_amanivideosdk/flutter_amanivideosdk_method_channel.dart';
// import 'package:flutter_amanisdk/amani_sdk.dart';
// import 'package:flutter_amanisdk/common/models/api_version.dart';



class AmaniVideoSDKScreen extends StatefulWidget {
  const AmaniVideoSDKScreen({Key? key}) : super(key: key);

  @override
  State<AmaniVideoSDKScreen> createState() => _AmaniVideoSDKScreenState();
}

class _AmaniVideoSDKScreenState extends State<AmaniVideoSDKScreen> {

  final VideoSDK _videoSDKModule = AmaniVideoSDK().getAmaniVideo();

  Future<void> setupVideoBuilder() async {
    _videoSDKModule.startVideo("setServerURL", 
                               "token",
                               "Name", 
                               "Surname", 
                               "stunserver",
                               "turnserver", 
                               "st_user", 
                               "st_pass");

  }

  @override
  void initState() {
    super.initState();
    
  }

  Future<bool> onWillPop() async {
  
      return true;
  
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
          title: const Text('Amani Video Screen'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OutlinedButton(
                  onPressed: () {
                    setupVideoBuilder();
                  },
                  child: const Text("Start")),
            ],
          ),
        ),
      ),
    );
  }
}