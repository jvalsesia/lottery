class Bets {
  const Bets();

  // ms: quantity = 6, max = 60=
  Future<List<int>> playMS() async {
    List<int> numbers = List<int>.generate(60, (i) => i + 1);
    List<int> selectedNumbers = [];
    selectedNumbers = (numbers..shuffle()).take(6).toList();
    selectedNumbers.sort();
    return selectedNumbers;
  }

  // mm5: quantity = 5, max = 70
  // mm1: quantity = 1, max = 25
  Future<List<int>> playMM() async {
    List<int> numbers5 = List<int>.generate(70, (i) => i + 1);
    List<int> selectedNumbers5 = [];
    selectedNumbers5 = (numbers5..shuffle()).take(5).toList();
    selectedNumbers5.sort();

    List<int> numbers1 = List<int>.generate(25, (i) => i + 1);
    List<int> selectedNumbers1 = [];
    selectedNumbers1 = (numbers1..shuffle()).take(1).toList();
    selectedNumbers1.sort();

    selectedNumbers5.add(selectedNumbers1[0]);
    return selectedNumbers5;
  }
}
