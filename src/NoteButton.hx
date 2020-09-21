import grig.midi.MidiMessage;
import haxe.io.Bytes;
import react.ReactComponent;
import react.ReactMacro.jsx;

typedef NoteButtonProps = {
    var midiCallback:(MidiMessage, Float)->Void;
}

typedef NoteButtonState = {
    var label:String;
    var playing:Bool;
}

class NoteButton extends ReactComponentOf<NoteButtonProps, NoteButtonState>
{
    public function new()
    {
        super(props, state);
        this.state = {label: 'Start Note', playing: false};
    }

    override public function render():ReactElement
    {
        return jsx('<$Button action=$startOrStop label=${this.state.label} />');
    }

    private function startOrStop():Void
    {
        if (!this.state.playing) {
            this.props.midiCallback(new MidiMessage(Bytes.ofHex('90287F')), 0.0);
            this.setState({label: 'Stop Note', playing: true});
        }
        else {
            this.props.midiCallback(new MidiMessage(Bytes.ofHex('802800')), 0.0);
            this.setState({label: 'Start Note', playing: false});
        }
    }
}