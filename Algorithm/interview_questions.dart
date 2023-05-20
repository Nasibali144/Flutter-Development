void main() {
  List<String> list = [
    "Abdunazarov Mirjalol",
    "Abduqodirov Abdulloh",
    "Artur Sadulloyev",
    "Asqarov Shahobiddin",
    "Botirov Biloliddin",
    "Fotima Rustamova",
    "Iqboljon Abdugʻaffarov",
    "Jamoliddinov Salohiddin",
    "Musaxon Jo'raqo'ziyev",
    "Najmiddin Abdiyev",
    "Nasirdinov Abdurahimjon",
    "Qudratov Ismoil",
    "Raximov Hasan",
    "Rustamqulov Qurbonpo'lat",
    "Sadriddinov Mustafo",
    "Sharipov Oxunjon",
    "Sultonbek Abdurazzoqov",
    "Suxrob G'aybullayev",
    "Tursunboyev Sunnat",
    "Xolmirzayev Bexruz",
    "Yusupov Ilhom",
  ];
  
  
  List<int> question1 = [for(int i = 1; i <= 100; i++) i];
  List<int> question2 = [for(int i = 101; i <= 200; i++) i];
  List<int> question3 = [for(int i = 201; i <= 300; i++) i];
  List<int> question4 = [for(int i = 301; i <= 390; i++) i];
  
  question1.shuffle();
  question2.shuffle();
  question3.shuffle();
  question4.shuffle();
  
  Map<String, List<int>> students = {};
  
  for(int i = 0; i < list.length; i++) {
    students.addAll({list[i]: [question1[i], question2[i], question3[i], question4[i]]});
  }
  
  students.forEach((student, questions) {
    print("$student : $questions");
  });
}
