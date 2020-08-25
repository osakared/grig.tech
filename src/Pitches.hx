import grig.pitch.Note;
import react.ReactComponent;
import react.ReactMacro.jsx;

typedef PitchesProps = {
    var pitches:Array<Int>;
}

class Pitches extends ReactComponentOfProps<PitchesProps>
{ 
    override public function render():ReactElement
    {
        return jsx('<div style={{backgroundColor: "#2A303C", width: "100%;", margin: "5px 5px 5px 5px"}}> : ${renderPitches()}</div>');
    }

    private function renderPitches()
    {
        return [for (pitch in this.props.pitches) {
            var note = Note.fromMidiNote(pitch);
            jsx('<span style={{color: "#499", paddingRight: "10px", width: "60px"}}>${note.key.toString()}${note.octave}</span>');
        }];
    }
}