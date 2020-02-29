import 'package:flutter/material.dart';

class Board extends StatefulWidget {
  final bool isLefty;
  final String musicKey;
  final String chord;
  final String scale;

  Board({this.musicKey, this.chord, this.scale, this.isLefty});

  @override
  _BoardState createState() => _BoardState();
}

class _BoardState extends State<Board> {
  List<String> _notesOrg = ['A', 'A#', 'B', 'C', 'C#', 'D', 'D#', 'E', 'F', 'F#', 'G', 'G#'];
  List<String> _notes = [];
  List<String> _stringNotes = ['E', 'A', 'D', 'G', 'B', 'E'];

  List<String> sixthString = [];
  List<String> fifthString = [];
  List<String> fourthString = [];
  List<String> thirdString = [];
  List<String> secondString = [];
  List<String> firstString = [];

  List<String> getNoteForString(String stringKey) {
    int currentIndex = _notes.indexOf(stringKey);
    List<String> notes = [];
    for (int i = 0; i < 25; i++) {
      notes.add(_notes[currentIndex]);
      if (currentIndex == _notes.length - 1) {
        currentIndex = 0;
      } else {
        currentIndex++;
      }
    }
    return notes.reversed.toList();
  }

  @override
  void didUpdateWidget(Board oldWidget) {
    setup();
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    setup();
    super.initState();
  }

  void setup() {
    _notes = widget.isLefty ? _notesOrg : _notesOrg.reversed.toList();

    sixthString = getNoteForString('E');
    fifthString = getNoteForString('A');
    fourthString = getNoteForString('D');
    thirdString = getNoteForString('G');
    secondString = getNoteForString('D');
    firstString = getNoteForString('E');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return _getColumn(index);
        },
        itemCount: 25,
      ),
    );
  }

  Widget _getColumn(int fret) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        _getNoteSquare((widget.isLefty ? (24 - fret) : fret).toString()),
        _getNoteSquare(sixthString[fret]),
        _getNoteSquare(fifthString[fret]),
        _getNoteSquare(fourthString[fret]),
        _getNoteSquare(thirdString[fret]),
        _getNoteSquare(secondString[fret]),
        _getNoteSquare(firstString[fret]),
      ],
    );
  }

  Widget _getNoteSquare(String note) {
    return Container(
      height: 40,
      width: 40,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 2),
      ),
      child: Text(note),
    );
  }
}
