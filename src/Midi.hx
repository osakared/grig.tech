import grig.midi.MidiIn;
import grig.midi.MidiMessage;
import react.ReactComponent;
import react.ReactMacro.jsx;

typedef MidiState = {
    var status:String;
    var ports:Array<String>;
    var pitches:Array<Int>;
    var ?selectedPort:String;
}

typedef MidiProps = {
    var midiCallback:(MidiMessage, Float)->Void;
}

class Midi extends ReactComponentOf<MidiProps, MidiState>
{
    var midiIn:MidiIn = null;

    public function new(props)
    {
        super(props);

        midiIn = new MidiIn(grig.midi.Api.Unspecified);
        midiIn.setCallback(onMidi);
        state = { status: 'Not connected', ports: [], pitches: [] };
    }

    override public function render():ReactElement
    {
        return jsx('<>
                        <>
                            <$Button label="Query webmidi ports" action=$getPorts />
                            <span style={{paddingRight: "5px", paddingLeft: "5px"}}>${this.state.status}</span>
                            <$Selector options=${this.state.ports} action=$changePort visible=${isProbablyConnected()} />
                            <span style={{paddingLeft: "5px"}}><$Button label="Connect" visible=${isProbablyConnected()} action=$connectToPort /></span>
                        </>
                        <$Pitches pitches=${this.state.pitches} />
                    </>');
    }

    private function isProbablyConnected():Bool
    {
        return this.state.ports.length > 0;
    }

    private function changePort(event:js.html.Event):Void
    {
        var selector:js.html.SelectElement = cast event.target;
        setState({status: '', ports: this.state.ports, selectedPort: selector.value, pitches: this.state.pitches});
    }

    private function connectToPort():Void
    {
        var portNumber:Int = this.state.ports.indexOf(this.state.selectedPort);
        if (portNumber < 0) {
            setState({status: 'Invalid port', ports: [], pitches: []});
            return;
        }
        midiIn.openPort(portNumber, 'grig.midi').handle(function(midiOutcome) {
            switch midiOutcome {
                case Success(_):
                    setState({status: 'Connected', ports: this.state.ports, pitches: []});
                case Failure(error):
                    setState({status: error.toString(), ports: [], pitches: []});
            }
        });
    }

    private function onMidi(midiMessage:MidiMessage, delta:Float)
    {
        if (midiMessage.messageType == NoteOn) {
            var pitches = this.state.pitches.copy();
            pitches.push(midiMessage.byte2);
            setState({status: this.state.status, ports: this.state.ports, selectedPort: this.state.selectedPort, pitches: pitches});
        }
        else if (midiMessage.messageType == NoteOff) {
            var pitches = this.state.pitches.copy();
            pitches.remove(midiMessage.byte2);
            setState({status: this.state.status, ports: this.state.ports, selectedPort: this.state.selectedPort, pitches: pitches});
        }
        this.props.midiCallback(midiMessage, delta);
    };

    private function getPorts():Void
    {
        this.midiIn.getPorts().handle(function(outcome) {
            switch outcome {
                case Success(ports):
                    setState({status: this.state.status, ports: ports, selectedPort: ports[0], pitches: [] });
                case Failure(error):
                    setState({status: error.toString(), ports: [], pitches: []});
            }
        });
    }
}