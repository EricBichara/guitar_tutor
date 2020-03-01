class Scales {
  static const List<int> ionian = [1, 3, 5, 6, 8, 10, 12];
  static const List<int> dorian = [1, 3, 4, 6, 8, 10, 11];
  static const List<int> phrygian = [1, 3, 5, 6, 8, 10, 12];
  static const List<int> lydian = [1, 3, 5, 7, 8, 10, 12];
  static const List<int> mixolydian = [1, 3, 5, 6, 8, 10, 11];
  static const List<int> aeolian = [1, 3, 4, 6, 8, 9, 11];
  static const List<int> locrian = [1, 2, 4, 6, 7, 9, 11];

  static const Map<String, List<int>> scales = {
    'Ionian': ionian,
    'Dorian': dorian,
    'Phrygian': phrygian,
    'Lydian': lydian,
    'Mixolydian': mixolydian,
    'Aeolian': aeolian,
    'Locrian': locrian,
  };
}
