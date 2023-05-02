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
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 25),
        child: Align(
          alignment: const Alignment(0, -0.5),

          /// TextField - bu text yozish uchun ko'rsatilgan joyda maydon hosil qiladigan widget
          child: TextField(
            autofocus: true,

            style: TextStyle(fontSize: 32, color: Colors.black),

            /// inputFormatters - bu kiritilgan textni formatlab berish uchun xizmat qiladi.
            // https://appvesto.medium.com/flutter-formatting-textfield-with-textinputformatter-c73ee2167514
            // inputFormatters: [
            //   FilteringTextInputFormatter(RegExp(r'[a-zA-Z]'), allow: true,),
            //   LengthLimitingTextInputFormatter(4),
            // ],

            /// enabled - textField ni hususiyatlarini yoqib o'chiruvchi, yani false bo'lsa barcha yozish va be;gilash imkoniyati o'chiriladi
            enabled: true,

            /// keyboardAppearance - bu faqat IOS tizimi uchun ishladi va light va dark mode dagi klaviaturani tasvirlaydi
            keyboardAppearance: Brightness.dark,

            /// enableInteractiveSelection - yozilgan matnini tanlash imkoniyatini yoqib o'chirish uchun ishlatiladi
            enableInteractiveSelection: true,

            /// selectionControls - matn tanlanganda yoki kursor orqali matn ustida mala bajaradigan buruqlar menyusini ko'rinishini tasvirlaydi: ios, material, descktop kabi stylelarda
            selectionControls: MaterialTextSelectionControls(),

            /// onTapOutside - text field dan tashqari maydonda on tap bo'lganda ishga tushadigan funksiya
            onTapOutside: (event) {
              debugPrint(event.toString());
            },

            /// buildCounter - widget qaytaruvchi funksiya bo'lib, textFieldni pastki o'ng burchagida kiritilgan belgilarni sanovchi widget qurib beradi
            buildCounter: counter,
            // maxLength: 7,
            /// autofillHints - device ichida saqalangan parol, email, ... va h.k larni olib text field ni to'ldirish uchun ishlatiladi
            // autofillHints: const [
            //   AutofillHints.url,
            // ],
            /// scribbleEnabled - IOS 14 va IPad da qamal bilan yozish imkoniyatini yoqish va o'chirish uchun ishlatiladi
            scribbleEnabled: true,

            /// enableIMEPersonalizedLearning - Android qurilmalarida klaviatura orqali yangi so'z yozganimizda taklif qilimgan so'zlarga qo'shish yoki qo'shmasligini amalga oshiradi.
            enableIMEPersonalizedLearning: true,
            
            /// spellCheckConfiguration - bu xato kiritilgan o'zlarni aniqlashtiruvchi field hisoblanadi.
            spellCheckConfiguration: SpellCheckConfiguration(
              spellCheckService: DefaultSpellCheckService(),
              misspelledTextStyle: const TextStyle(fontSize: 32, color: Colors.black, decorationColor: Colors.blueAccent, decoration: TextDecoration.underline)
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
