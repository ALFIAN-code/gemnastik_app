import 'package:flutter/material.dart';
import 'package:gemnastik_app/view/homepage.dart';

class BaseWelcomepage extends StatelessWidget {
  const BaseWelcomepage({
    super.key,
    required this.imgPath,
    required this.title,
    required this.content,
    this.onButtonPressed,
    this.buttonText = 'Mulai',
  });

  final String imgPath;
  final String title;
  final String content;
  final String buttonText;
  final void Function()? onButtonPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 90),
              Image.asset(imgPath, width: 260, height: 260),
              SizedBox(height: 30),
              Text(
                content,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 21),
              ),
              SizedBox(height: 70),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: onButtonPressed,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff00677C),
                  ),
                  child: Text(
                    buttonText,
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Welcome1 extends StatelessWidget {
  const Welcome1({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseWelcomepage(

      imgPath: 'asset/welcome-icon.png',
      title: """Selamat datang di 
Nama App!""",
buttonText: 'lanjutkan',
      content: 'Wujudkan kesetaraan komunkasi setiap saat',
      onButtonPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Welcome2()),
        );
      },
    );
  }
}

class Welcome2 extends StatelessWidget {
  const Welcome2({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseWelcomepage(
      imgPath: 'asset/ws-1-removebg-preview 2.png',
      title: """Sampaikan Pesanmu!""",
      buttonText: 'lanjutkan',
      content: 'Ubah isyarat dan ekspresimu menjadi suara ',
      onButtonPressed:
          () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Welcome3()),
          ),
    );
  }
}

class Welcome3 extends StatelessWidget {
  const Welcome3({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseWelcomepage(
      imgPath: 'asset/ws-2-removebg-preview 2.png',
      title: """Lihat Semua Ucapan dengan Mudah!""",
      content: 'Ubah percakapan menjadi teks yang mudah kamu pahami',
      buttonText: 'lanjutkan',
      onButtonPressed:
          () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Welcome4()),
          ),
    );
  }
}

class Welcome4 extends StatelessWidget {
  const Welcome4({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseWelcomepage(
      imgPath: 'asset/ws-3-removebg-preview 2.png',
      title: """Siap untuk Mengobrol?""",
      content: 'Ubah percakapan menjadi teks yang mudah kamu pahami',
      buttonText: 'Mulai',
      onButtonPressed:
          () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Homepage()),
          ),
    );
  }
}
