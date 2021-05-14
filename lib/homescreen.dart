import 'package:flutter/material.dart';
import 'package:unity_ads_plugin/unity_ads.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
 @override
  void initState() {
    super.initState();

    UnityAds.init(
      gameId: "4125684",
      testMode: true,
    );
  }

  void loadVideoAd() async {
    UnityAds.isReady(placementId: "Video_Android").then((value) {
      if(value == true) {
        UnityAds.showVideoAd(
            placementId: "Video_Android",
            listener: (state, args) {
              if(state == UnityAdState.complete) {
                print("VIDEO IS COMPLETED");
              } else if(state == UnityAdState.skipped) {
                print("VIDEO IS SKIPPED");
              }
            }
        );
      } else {
        print("AD IS NOT READY");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                loadVideoAd();
              },
              child: Container(
                color: Colors.blue,
                height: 40,
                width: 200,
                child: Center(
                  child: Text("SHOW VIDEO AD"),
                ),
              ),
            ),
            UnityBannerAd(
              placementId: "Banner_Android",
            ),
          ],
        ),
      ),
    );
  }
}
