class Chords {
  static const List<int> major = [1, 5, 8];
  static const List<int> minor = [1, 4, 8];
  static const List<int> major7 = [1, 5, 8, 12];
  static const List<int> minor7 = [1, 4, 8, 11];
  static const List<int> dominant = [1, 5, 8, 11];

  static const Map<String, List<int>> chords = {
    'Major': major,
    'Minor': minor,
    'Major 7': major7,
    'Minor 7': minor7,
    'Dominant': dominant,
  };
}
