import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        minimum: EdgeInsets.symmetric(horizontal: 25),
        child: Align(
          alignment: Alignment(0, -0.5),

          child: TextField(
            autofocus: false,
            style: TextStyle(fontSize: 20, color: Colors.black),
            cursorColor: Colors.green,
            textAlign: TextAlign.start,
            textAlignVertical: TextAlignVertical.center,
            textDirection: TextDirection.ltr,
            decoration: InputDecoration(
              /// icon: textFieldda chap yon tomoniga asosan icon joylashtirish uchun xizmat qiladi, agar bizga kerakli ikon bo'lmasa o'rniga boshqa widget ishlatishimiz mumkin.
              // icon: const Text("Search", style: TextStyle(color: Colors.green, fontSize: 20),),
              // iconColor: Colors.green,

              /// label - bu text fieldda text yozadigan maydonning chap yon tomonida turadi qachonki unfocus holatida, agar fokus qaratilsa u widget yoki text turgan joyidan yuqoriga siljiydi va biroz kichraygan ko'rinish oladi
              labelText: "Label",
              // label: Container(height: 40, width: 40, color: Colors.red,),
              // floatingLabelAlignment: FloatingLabelAlignment.center,
              // floatingLabelBehavior: FloatingLabelBehavior.auto,

              /// helper, hint, error, prefix, suffix
              /// TextFieldni egallab turgan joyida text yozadigan maydondan tashqari qismini olish tashlash imonini beruvchi field hisoblanadi
              // isCollapsed: true

              /// isDense - text field da vertikal yo'nalishdagi bo'sh joyni kamroq ishlatishni anglatadi
              isDense: false,

              /// contentPadding - text yozdigan maydonni berilgan o'lchamdagi joy bilan o'rab oladi.
              // contentPadding: EdgeInsets.all(20),

              /// bu yozilgan matnni sanash uchun alohida widget yoki text ajratadi va o'zimiz alohida belgilar sonini aniqlab text yoki widgetga berishimiz kerak
              // counterText: "Counter",
              // counterStyle: TextStyle(fontSize: 30),

              /// filled bu text field egallab turgan maydonni rang bilan to'ldirish uchun ishlatiladi.
              filled: true,
              // fillColor: Colors.yellowAccent,
              // focusColor: Colors.orangeAccent,
              // hoverColor: Colors.brown,

              /// constraints - TextField egallab turgan maydonni belgilaydi
              // constraints: BoxConstraints(
              //   // minWidth: 90,
              //   minHeight: 200
              // ),

              /// borders - bu textfield egallab turgan maydon chegarasinini alohida hoshiya bilan yani border bilan o'raydi va har bir holat uchun alohida border yozish kerak: focus, enabled, error, disabled va h.k
              // border: UnderlineInputBorder(
              //   borderSide: BorderSide.none,
              //   borderRadius: BorderRadius.circular(10),
              // )
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.yellow, width: 3),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.green, width: 3),
                gapPadding: 0,
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 3),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.purple, width: 3),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black, width: 3),
              ),
              errorText: null,
              enabled: true

            ),
          ),
        ),
      ),
    );
  }

  /// buildCounter uchun yozilgan widget qaytaruvchi funksiya:
  Widget counter(
    BuildContext context, {
    required int currentLength,
    required int? maxLength,
    required bool isFocused,
  }) {
    return Text(
      '$currentLength of $maxLength characters',
      semanticsLabel: 'character count',
    );
  }
}
