import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class MyHomePage extends StatefulWidget {
  static const routeName = '/home';
  const MyHomePage({super.key,});

 // final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //define class members
  late final BannerAd bannerAd;
  final String adUnitId = "ca-app-pub-4953766457305867/9693512176";
  //final String adUnitId = "ca-app-pub-3940256099942544/6300978111";

  @override
  void initState() {
    super.initState();
    //initialize banner ad
    bannerAd = BannerAd(
        size: AdSize.banner,
        adUnitId: adUnitId,
        listener: bannerAdListener,
        request: const AdRequest());
    // load ad here
    bannerAd.load();
  }
  @override
  Widget build(BuildContext context) {

    // add widget
    final AdWidget adWidget = AdWidget(ad: bannerAd );
    final Container adContainer = Container(
      alignment: Alignment.center,
      width: bannerAd.size.width.toDouble(),
      height: bannerAd.size.height.toDouble(),
      child: adWidget,
    );

    return Scaffold(
      // appBar: AppBar(
      //   title: Text(widget.title),
      // ),
      body: Center(
        child: adContainer,
      ),
    );
  }

  // ad listener
  final BannerAdListener bannerAdListener = BannerAdListener(
    onAdLoaded: (Ad ad) => print('Ad loaded'),
    onAdFailedToLoad: (Ad ad, LoadAdError error) {
      // dispose the ad to free some resources
      ad.dispose();
      print('Ad failed to load: $error');
    },
    onAdOpened: (Ad ad) => print('Ad opened'),
    onAdClosed: (Ad ad) => print('Ad closed'),
    onAdImpression: (Ad ad) => print('Ad Impression'),
  );

}
