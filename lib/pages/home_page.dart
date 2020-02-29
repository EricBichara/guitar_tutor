import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:guitar_tutor/widgets/board.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isLefty = false;
  List<DropdownMenuItem> scaleOptions = [];
  List<DropdownMenuItem> keyOptions = [];
  List<DropdownMenuItem> chordOptions = [];
  String selectedScale;
  String selectedKey;
  String selectedChord;

  @override
  void initState() {
    createScaleOptions();
    createKeyOptions();
    createChordOptions();
    super.initState();
  }

  void createScaleOptions() {
    scaleOptions = ['Ionian', 'Dorian', 'Phrygian', 'Lydian', 'MixoLydian', 'Aeolian', 'Locrian']
        .map((String scale) => DropdownMenuItem(
              child: Text(scale),
              value: scale,
            ))
        .toList();
    selectedScale = 'Ionian';
  }

  void createKeyOptions() {
    keyOptions = ['A', 'A#', 'B', 'C', 'C#', 'D', 'D#', 'E', 'F', 'F#', 'G', 'G#']
        .map((String key) => DropdownMenuItem(
              child: Text(key),
              value: key,
            ))
        .toList();
    selectedKey = 'E';
  }

  void createChordOptions() {
    chordOptions = ['Minor', 'Major', 'Minor7', 'Major7', 'Dominant']
        .map((String chord) => DropdownMenuItem(
              child: Text(chord),
              value: chord,
            ))
        .toList();
    selectedChord = 'Minor';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                DropdownButton(
                  items: keyOptions,
                  onChanged: (dynamic value) {
                    setState(() {
                      selectedKey = value;
                    });
                  },
                  value: selectedKey,
                ),
                SizedBox(
                  width: 20,
                ),
                DropdownButton(
                  items: scaleOptions,
                  onChanged: (dynamic value) {
                    setState(() {
                      selectedScale = value;
                    });
                  },
                  value: selectedScale,
                ),
                SizedBox(
                  width: 20,
                ),
                DropdownButton(
                  items: chordOptions,
                  onChanged: (dynamic value) {
                    setState(() {
                      selectedChord = value;
                    });
                  },
                  value: selectedChord,
                ),
                SizedBox(
                  width: 20,
                ),
                Text('Lefty?'),
                PlatformSwitch(
                  value: _isLefty,
                  onChanged: (bool value) {
                    setState(
                      () {
                        _isLefty = value;
                      },
                    );
                  },
                )
              ],
            ),
            Board(
              musicKey: selectedKey,
              chord: selectedChord,
              scale: selectedScale,
              isLefty: _isLefty,
            ),
          ],
        ),
      ),
    );
  }
}
