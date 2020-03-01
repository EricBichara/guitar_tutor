import 'package:flutter/material.dart';
import 'package:guitar_tutor/core/chords.dart';
import 'package:guitar_tutor/core/scales.dart';

class Board extends StatefulWidget {
  final bool isLefty;
  final String musicKey;
  final String chord;
  final String scale;
  final bool showChord;

  Board({this.musicKey, this.chord, this.scale, this.isLefty, this.showChord});

  @override
  _BoardState createState() => _BoardState();
}

class _BoardState extends State<Board> {
  List<String> _notesOrg = ['A', 'A#', 'B', 'C', 'C#', 'D', 'D#', 'E', 'F', 'F#', 'G', 'G#'];
  List<String> _notes = [];
  List<String> _stringNotes = ['E', 'B', 'G', 'D', 'A', 'E'];

  List<int> highlightedFrets = [0, 3, 5, 7, 9, 12, 15, 17, 19, 21, 24];
  List<String> highlightedNotes = [];
  List<List<String>> stringsNotes = [];

  List<String> getNotesForString(String stringKey, List<String> noteList) {
    int currentIndex = noteList.indexOf(stringKey);
    List<String> notes = [];
    for (int i = 0; i < 25; i++) {
      notes.add(noteList[currentIndex]);
      if (currentIndex == noteList.length - 1) {
        currentIndex = 0;
      } else {
        currentIndex++;
      }
    }
    return notes;
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
    stringsNotes.clear();
    _stringNotes.forEach((String note) {
      stringsNotes.add(getNotesForString(note, _notes).reversed.toList());
    });

    highlightedNotes.clear();
    List<String> notesForKey = getNotesForString(widget.musicKey, _notesOrg);

    if (widget.showChord) {
      Chords.chords[widget.chord].forEach((int index) {
        highlightedNotes.add(notesForKey[index - 1]);
      });
    } else {
      Scales.scales[widget.scale].forEach((int index) {
        highlightedNotes.add(notesForKey[index - 1]);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280,
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
    List<String> columnNotes = [];

    stringsNotes.forEach((List<String> string) {
      columnNotes.add(string[fret]);
    });

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        //_getFretSquare((widget.isLefty ? (24 - fret) : fret)),
        ...columnNotes.map((String note) => _getNoteSquare(note)).toList(),
        _getFretSquare((widget.isLefty ? (24 - fret) : fret)),
      ],
    );
  }

  Widget _getNoteSquare(String note) {
    bool highlight = highlightedNotes.indexOf(note) != -1;

    return Container(
      height: 40,
      width: 40,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: highlight ? note == widget.musicKey ? Colors.red : Colors.orange : Colors.white,
        border: Border.all(color: Colors.black, width: 1),
      ),
      child: Text(
        note,
        style: TextStyle(color: highlight ? Colors.white : Colors.black),
      ),
    );
  }

  Widget _getFretSquare(int fret) {
    bool highlight = highlightedFrets.indexOf(fret) != -1;

    return Container(
      height: 40,
      width: 40,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: highlight ? Colors.black : Colors.blue,
        border: Border.all(color: Colors.black, width: 1),
      ),
      child: Text(
        fret.toString(),
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
