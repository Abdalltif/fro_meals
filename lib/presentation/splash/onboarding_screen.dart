// import 'package:flutter/material.dart';
// import 'package:introduction_screen/introduction_screen.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
//
// class OnBoardingPage extends StatelessWidget {
//   const OnBoardingPage({Key key}) : super(key: key);
//
//   void _onIntroEnd(context) {
//     Navigator.of(context).pop();
//     Navigator.of(context).push(
//       MaterialPageRoute(builder: (_) => HomeScreen()),
//     );
//   }
//
//   Widget _buildImage(String assetName) {
//     return Align(
//       child: Image.asset('images/$assetName.png', width: 130.0),
//       alignment: Alignment.bottomCenter,
//     );
//   }
//
//   _setOpenedPrefs() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     prefs.setBool('is_opened_before', true);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     _setOpenedPrefs();
//
//     const bodyStyle = TextStyle(fontSize: 18.0, color: Colors.white);
//
//     const pageDecoration = const PageDecoration(
//       titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold, color: Colors.white),
//       bodyTextStyle: bodyStyle,
//       descriptionPadding: EdgeInsets.fromLTRB(16.0, 4.0, 16.0, 16.0),
//       pageColor: Color(0xff233f67),
//       imagePadding: EdgeInsets.all(8),
//     );
//
//     return Container(
//       child: Stack(
//         children: <Widget>[
//           IntroductionScreen(
//             pages: [
//               PageViewModel(
//                 title: "خدمات استفسار",
//                 body:
//                 "مجانية على جداول الاطباء في جميع عيادات بنغازي",
//                 image: _buildImage('search'),
//                 decoration: pageDecoration,
//               ),
//               PageViewModel(
//                 title: "احجز موعدك",
//                 body: "بكل سهولة من خلال تطبيق سبيتار ",
//                 image: _buildImage('booking'),
//                 decoration: pageDecoration,
//               ),
//               PageViewModel(
//                 title: "كن على اطلاع",
//                 body: "دائم بحالة الحجز الخاصة بك ",
//                 image: _buildImage('notification'),
//                 decoration: pageDecoration,
//               ),
//               PageViewModel(
//                 title: "وفر الكاش",
//                 body: "و ادفع من خلال المحفظة الالكترونية ",
//                 image: _buildImage('wallet'),
//                 decoration: pageDecoration,
//               ),
//             ],
//             onDone: () => _onIntroEnd(context),
//             //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
//             showSkipButton: true,
//             skipFlex: 0,
//             nextFlex: 0,
//             skip: const Text('تخطى', style: TextStyle(color: Colors.white),),
//             next: const Icon(Icons.arrow_forward),
//             done: const Text('تم', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
//             dotsDecorator: const DotsDecorator(
//               size: Size(10.0, 10.0),
//               color: Color(0xFFBDBDBD),
//               activeSize: Size(22.0, 10.0),
//               activeShape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.all(Radius.circular(25.0)),
//               ),
//             ),
//           ),
// //          Image(
// //            width: MediaQuery.of(context).size.width,
// //            image: AssetImage('images/logo.png'),
// //          ),
//         ],
//       ),
//     );
//   }
// }