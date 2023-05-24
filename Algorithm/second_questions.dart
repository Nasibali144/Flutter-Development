void main() {
  List<String> list = [
    "Asror Yodgorov",
    "Diyorbek Shokirov",
    "Doniyor Ashiraliyev",
    "Jamshid Husenov",
    "Mansurbek Usmanov",
    "Muhammadazim Odiljonov",
    "Muhammadyusuf Abduraimov",
    "Muhriddin Hudoyorov",
    "Nursulton Suleymanov",
    "Saidjon Saidov",
    "Saidmalik Sultonov",
    "Sarvar Abdumajidov",
  ];

  List<int> question1 = [for (int i = 1; i <= 150; i++) i];
  List<int> question2 = [for (int i = 151; i <= 285; i++) i];
  List<int> question3 = [for (int i = 286; i <= 385; i++) i];
  List<int> question4 = [for (int i = 386; i <= 485; i++) i];

  question1.shuffle();
  question2.shuffle();
  question3.shuffle();
  question4.shuffle();

  Map<String, List<int>> students = {};

  for (int i = 0; i < list.length; i++) {
    students.addAll({
      list[i]: [
        question1[i],
        question2[i],
        question3[i],
        question4[i],
        question1[i + list.length],
        question2[i + list.length],
        question3[i + list.length],
        question4[i + list.length],
      ]
    });
  }

  students.forEach((student, questions) {
    print("$student : $questions");
  });
}
