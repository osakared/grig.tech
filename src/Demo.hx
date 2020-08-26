import react.ReactComponent;
import react.ReactMacro.jsx;

import grig.midi.MidiMessage;

class Demo extends ReactComponent
{
    var synth = new MonoFMSynth(44100);

    public function new()
    {
        super();
    }

    override public function render():ReactElement
    {
        return jsx('<>
                        <$Midi midiCallback=$midiCallback />
                        <$Audio audioCallback=$audioCallback />
                        <$NoteButton midiCallback=$midiCallback />
                        <$Slider action=${synth.setRatio} label="OSC2 Ratio" min={0.25} max={24} step={0.25} val={12} />
                        <$Slider action=${synth.setModulationDepth} label="OSC2->OSC1 Modulation Depth" min={0} max={400} step={0.1} val={200} />
                    </>');
    }

    private function audioCallback(input:grig.audio.AudioBuffer, output:grig.audio.AudioBuffer, sampleRate:Float, audioStreamInfo:grig.audio.AudioStreamInfo):Void
    {
        synth.render(output);
    }

    private function midiCallback(midiMessage:MidiMessage, delta:Float):Void
    {
        synth.parseMidi(midiMessage);
    }
}