import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:word_time/services/world_time.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setupWordTime() async {
    WorldTime instanceofWT = WorldTime(
        location: 'Ho Chi Minh', flag: 'germany.png', url: 'Asia/Ho_Chi_Minh');
    await instanceofWT.getData();
    // Tạo một đường đi cho dữ liệu sao khi load xong dữ liệu từ hàm getDATA đc gọi dòng trên gửi data sang màn HOME
    // in case login navigation sang home
    // loading  -> Home
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instanceofWT.location,
      'flag': instanceofWT.flag,
      'time': instanceofWT.time,
      'isDaytime': instanceofWT.isDaytime,
    });
  }

  @override
  // ham nap duy nhat sau ham khoi tao
  void initState() {
    super.initState();
    setupWordTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: SpinKitFadingCircle(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}
