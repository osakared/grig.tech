import grig.audio.AudioCallback;
import grig.audio.AudioInterface;
import react.ReactComponent;
import react.ReactMacro.jsx;

typedef AudioState = {
    var status:String;
    // var pitches:Array<Int>;
    // var ?selectedPort:String;
}

typedef AudioProps = {
    var audioCallback:AudioCallback;
}

class Audio extends ReactComponentOf<AudioProps, AudioState>
{
    var audio:AudioInterface = null;

    public function new(props)
    {
        super(props, state);
        state = { status: 'Not connected' };
    }

    override public function render():ReactElement
    {
        return jsx('<>
                        <$Button label="Connect to audio" action=$connectToAudio />
                        <span style={{paddingRight: "5px", paddingLeft: "5px"}}>${this.state.status}</span>
                    </>');
    }

    private function audioCallback(input:grig.audio.AudioBuffer, output:grig.audio.AudioBuffer, sampleRate:Float, audioStreamInfo:grig.audio.AudioStreamInfo)
    {
        this.props.audioCallback(input, output, sampleRate, audioStreamInfo);
    }

    private function connectToAudio():Void
    {
        var audioInterface_ = new AudioInterface();
        var ports = audioInterface_.getPorts();
        var options:grig.audio.AudioInterfaceOptions = {};
        for (port in ports) {
            if (port.isDefaultOutput) {
                options.outputNumChannels = port.maxOutputChannels;
                options.outputPort = port.portID;
                options.sampleRate = port.defaultSampleRate;
                options.inputNumChannels = 0;
                options.outputLatency = port.defaultLowOutputLatency;
                break;
            }
        }
        audioInterface_.setCallback(audioCallback);
        audioInterface_.openPort(options).handle(function(audioOutcome) {
            switch audioOutcome {
                case Success(_):
                    setState({status: 'Connected to audio'});
                    audio = audioInterface_;
                case Failure(error):
                    setState({status: error.toString()});
            }
        });
    }
}