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
    return  Scaffold(
      body: SafeArea(
        minimum: EdgeInsets.symmetric(horizontal: 25),
        child: Center(
          /// TextField - bu text yozish uchun ko'rsatilgan joyda maydon hosil qiladigan widget
          child: TextField(
            autofocus: true,
            // maxLines: null,
            // minLines: 9,
            style: TextStyle(
              fontSize: 32,
              color: Colors.black
            ),
            /// keyboardType - bu Platformani default keyboard dagi belgilarni yozilayotgan textni turiga moslashtiriadi
            keyboardType: TextInputType.multiline,

            /// textInputAction - bu klaviaturadagi enter tugmachasini o'rnida turadigan har xil turli knopkalarni ifodalaydi
            textInputAction: TextInputAction.newline,

            /// textCapitalization - bu asosan text fieldda kiritadigan matn turiga moslab belgilarni katta va kichik harflarda avtomatik boshqaruvni yoqadi
            textCapitalization: TextCapitalization.words,
            // textAlign: TextAlign.center,

            /// textAlignVertical - bu kursorni holtini vertikal egallagan joyga nisbatan joylashtiradi
            textAlignVertical: TextAlignVertical.bottom,
            textDirection: TextDirection.ltr,
            // readOnly: true,

            /// obscure - bu yozilayotgan matnni berilgan belgi oraqli yashirish imkoni beradi.
            // obscureText: true,
            // obscuringCharacter: "*",
            autocorrect: true,

            /// bir nechta "-" ni birlashtirib ketadi
            smartDashesType: SmartDashesType.enabled,

            /// Qo'shtirnoqlarni ochilish va yopilish imkoniyatini farqlashini boshqaradi
            smartQuotesType: SmartQuotesType.enabled,
            /// yozyotgan textga yaqin so'zlarni maslahat beradi
            enableSuggestions: true,

            /// expands - TextField ota widget uchun ajratgan joygacha to'liq joyni egallash imkonini beradi
            // expands: true,
            /// maxLength - yozilayotgan matni uzunligini belgilaydi va shu uzunlikdan ortiqcha belgi yoza olmaydi
            maxLength: 6,
            // maxLengthEnforcement: MaxLengthEnforcement.truncateAfterCompositionEnds,

            /// onChanged - biz textfeild orqali qandaydir harakatni amalga oshirganimizda textField orqali kiritilgan matnni olib beruvchi funksiya hisoblanadi
            onChanged: (inputText) {
              debugPrint(inputText);
            },

            /// onEditingComplete - klaviaturada enterni o'rnida kelgan keybord bosililganda ishga tushadi
            // onEditingComplete: () {
            //   debugPrint("Worked: onEditingComplete");
            // },

            /// onSubmitted - klaviaturada enterni o'rnida kelgan keybord bosililganda ishga tushadi va TextFieldni ichida yozilgan matnni ham olib beradi.
            // onSubmitted: (text) {
            //   debugPrint("Worked: onSubmitted: $text");
            // },
            // onAppPrivateCommand: (text, command) {
            //   debugPrint("Text: $text");
            //   debugPrint("Command: $command \n");
            // },

            inputFormatters: [
              FilteringTextInputFormatter(RegExp(r'[a-zA-Z]'), allow: true,),
              LengthLimitingTextInputFormatter(4),
            ],
            enabled: true,
          ),
        ),
      ),
    );
  }
}
