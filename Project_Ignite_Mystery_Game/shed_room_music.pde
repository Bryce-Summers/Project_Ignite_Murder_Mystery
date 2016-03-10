import themidibus.*;
import javax.swing.Timer;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;
/**
 *@author James Wang
 *
 **/
class MusicPlayer {
  Timer timer;

  int counter=0;

  public MusicPlayer() {
    timer=new Timer(1000/12, new Musicker());
  }

  void play() {
    timer.start();
  }

  void stop() {
    timer.stop();
  }


  int channel=0;
  int input=0;
  int output=1;
  MidiBus myBus=new MidiBus(this, input, output);

  //                                i    x    ii   iii  x    iv   x    v    vi   x    x    vii
  double[][] markov=new double[][]{{.10, .00, .05, .00, .00, .35, .00, .35, .10, .00, .00, .05}, //i
    {.00, .00, .00, .00, .00, .00, .00, .00, .00, .00, .00, .00}, //x
    {.05, .00, .05, .00, .00, .25, .00, .40, .10, .00, .00, .15}, //ii
    {.00, .00, .00, .00, .00, .00, .00, .00, .00, .00, .00, .00}, //iii
    {.00, .00, .00, .00, .00, .00, .00, .00, .00, .00, .00, .00}, //x
    {.05, .00, .05, .00, .00, .25, .00, .40, .10, .00, .00, .15}, //iv
    {.00, .00, .00, .00, .00, .00, .00, .00, .00, .00, .00, .00}, //x
    {.40, .00, .00, .00, .00, .00, .00, .15, .40, .00, .00, .05}, //v
    {.10, .00, .05, .00, .00, .35, .00, .35, .10, .00, .00, .05}, //vi
    {.00, .00, .00, .00, .00, .00, .00, .00, .00, .00, .00, .00}, //x
    {.00, .00, .00, .00, .00, .00, .00, .00, .00, .00, .00, .00}, //x
    {.40, .00, .00, .00, .00, .00, .00, .15, .40, .00, .00, .05}};//vii

  //constants
  //chord
  int chordVolume=50;
  int[] thirdIntervals=new int[]   {3, 0, 3, 0, 0, 3, 0, 3, 4, 0, 0, 4};
  int[] fifthIntervals=new int[]   {7, 0, 6, 0, 0, 7, 0, 7, 7, 0, 0, 7};

  //beat
  int beatTotal=1000;
  int chordLength=1000;

  //melody
  int nextMelodyNoteCount=0;
  int currentMelodyLength;
  int baseNote=60;
  int melodyVolume=60;

  //song length
  int tonicTotal=800;

  //vars
  //chord
  int currentNote=baseNote;
  int[] currentChord;

  //beat
  int[] possibleMelodyLengths=new int[]{12, 6, 4, 3, 2};

  //song length
  int tonicCount=0;

  void playNextNote() {
    updateTonic();

    if (counter==0) {
      currentChord=makeChord(currentNote);
      playChord(currentChord);
      setMelodyLength();
    }
    if (counter==nextMelodyNoteCount) {
      playMelody(currentChord);
      nextMelodyNoteCount=(nextMelodyNoteCount+currentMelodyLength)%12;
    }

    currentNote=chooseTonic();
  }

  ///////////////////////////////////
  //helper methods for playNextNote//
  ///////////////////////////////////
  int[] makeChord(int tonic) {
    int third=getThird(tonic);
    int fifth=getFifth(tonic);
    int octave=getOctave(tonic);
    return new int[]{tonic, third, fifth, octave};
  }

  int chooseTonic() {
    double random=Math.random();
    double total=0;
    for (int i=0; i<markov[currentNote-baseNote].length; i++) {
      total+=markov[currentNote-baseNote][i];
      if (random<total) {
        currentNote=i+baseNote;
        return currentNote;
      }
    }

    throw new RuntimeException("Markov matrix sum is less than 1");
  }

  int getThird(int tonic) {
    int index=tonic-baseNote;
    int interval=thirdIntervals[index];
    return tonic+interval;
  }

  int getFifth(int tonic) {
    int index=tonic-baseNote;
    int interval=fifthIntervals[index];
    return tonic+interval;
  }

  int getOctave(int tonic) {
    return tonic+12;
  }

  void playChord(int[] chord) {
    int base=chord[0];
    int third=chord[1];
    int fifth=chord[2];
    int octave=chord[3];
    Note note1=new Note(channel, base, chordVolume, chordLength);
    Note note2=new Note(channel, third, chordVolume, chordLength);
    Note note3=new Note(channel, fifth, chordVolume, chordLength);
    Note note4=new Note(channel, octave, chordVolume, chordLength);

    myBus.sendNoteOn(note1);
    myBus.sendNoteOn(note2);
    myBus.sendNoteOn(note3);
    myBus.sendNoteOn(note4);
  }

  void setMelodyLength() { 
    int melodyLengthIndex=(int)(Math.random()*possibleMelodyLengths.length);
    currentMelodyLength=possibleMelodyLengths[melodyLengthIndex];
  }

  void playMelody(int[] melodyNotes) {
    int melody;
    if (Math.random()<.85) {
      int melodyNoteIndex=(int)(Math.random()*melodyNotes.length);
      melody=melodyNotes[melodyNoteIndex]+12;
    } else {
      melody=baseNote+(int)(Math.random()*12)+12;
    }
    Note melodyNote=new Note(channel, melody, melodyVolume, currentMelodyLength);
    myBus.sendNoteOn(melodyNote);
  }

  void updateTonic() {
    if (currentNote==baseNote) {
      tonicCount++;
    }
    if (tonicCount>=tonicTotal) {
      noLoop();
    }
  }

  class Musicker implements ActionListener {
    public void actionPerformed(ActionEvent e) {
      playNextNote();
      counter=(counter+1)%12;
    }
  }
}