---
layout: default
meta_title: Tutorial
meta_description: The basics of how to use haxe grig
body_class: home
title: Tutorial
---

- [Installation](#installation)
- [Midi Connection](#midi-connection)
- [Audio Connection](#audio-connection)
- [See Also](#see-also)

<a name="installation" ></a>

## Installation

The [grig project](https://gitlab.com/haxe-grig) is made up of the following repos:

- grig.audio ([gitlab](https://gitlab.com/haxe-grig/grig.audio)) ([github mirror](https://github.com/osakared/grig.audio)) ([haxelib](https://lib.haxe.org/p/grig.audio/))
- grig.midi ([gitlab](https://gitlab.com/haxe-grig/grig.midi)) ([github mirror](https://github.com/osakared/grig.midi)) ([haxelib](https://lib.haxe.org/p/grig.midi/))
- grig.synth ([gitlab](https://gitlab.com/haxe-grig/grig.synth)) ([github mirror](https://github.com/osakared/grig.synth))
- grig.pitch ([gitlab](https://gitlab.com/haxe-grig/grig.pitch)) ([github mirror](https://github.com/osakared/grig.pitch)) ([haxelib](https://lib.haxe.org/p/grig.pitch/))
- haxe-musicpd ([gitlab](https://gitlab.com/haxe-grig/haxe-musicpd)) ([github mirror](https://github.com/osakared/haxe-musicpd)) ([haxelib](https://lib.haxe.org/p/musicpd/))

If you use [lix](https://github.com/lix-pm/lix.client), you can install the latest from the main branch or from haxelib into your project:

```bash
lix install gitlab:haxe-grig/grig.audio
```

or for haxelib

```bash
lix install haxelib:grig.audio
```

Or using haxelib

```bash
haxelib install grig.audio
```

Please note that due to the use of git submodules, installing directly
from the repo isn't supported for cpp standalone on grig.audio and grig.midi.
Instead, to use the latest version from git, clone the repo, then modify the appropriate files under `haxe_modules` to point to
that directory as detailed in the lix documentation.

<a name="midi-connection" ></a>

## Midi Connection

Grig allows you to write code to communicate with audio and midi hardware once that works in multiple different environments. To accomodate all the different interfaces, the interface uses a construction that's compatible with asynchronous environments. It accomplishes this by returning [haxe tink promises](https://haxetink.github.io/tink_core/#/types/promise). The below code prints out the different apis that are available (e.g., mac os core, jack, etc.), sets a midi callback that prints out any midi messages coming in, then attempts to open the first available midi port. You'll see below in [audio connections](#audio-connection) that the interface there is very much the same. [See example project](https://gitlab.com/haxe-grig/grig.midi/-/tree/master/examples/MidiReader).

```haxe
trace(MidiIn.getApis());
var midiIn = new MidiIn(grig.midi.Api.Unspecified);
midiIn.setCallback(function (midiMessage:MidiMessage, delta:Float) {
    trace(midiMessage.messageType);
    trace(delta);
});
midiIn.getPorts().handle(function(outcome) {
    switch outcome {
        case Success(ports):
            trace(ports);
            midiIn.openPort(0, 'grig.midi').handle(function(midiOutcome) {
                switch midiOutcome {
                    case Success(_):
                        mainLoop(midiIn);
                    case Failure(error):
                        trace(error);
                }
            });
        case Failure(error):
            trace(error);
    }
});
```

<p>

<a name="audio-connection"></a>

## Audio Connection

[This sample project](https://gitlab.com/haxe-grig/grig.audio/-/tree/main/examples/Sine) shows a simple example of playing a sine wave mixed with the input from a mic, if available. Below is simpler code that sets an audio callback. The pitch of the sine wave will depend on the samplerate as it's not calculating a phase increment taking that into account.

```haxe
var phase:Float = 0.0;
trace(AudioInterface.getApis());
var audioInterface = new AudioInterface();
var ports = audioInterface.getPorts();
trace(ports);
var options:grig.audio.AudioInterfaceOptions = {};
if (ports.length > 0) {
    var port = ports[0];
    options.outputNumChannels = port.maxOutputChannels;
    options.outputPort = port.portID;
    options.sampleRate = port.defaultSampleRate;
    options.outputLatency = port.defaultLowOutputLatency;
    audioInterface.setCallback((input:grig.audio.AudioBuffer, output:grig.audio.AudioBuffer,
                                sampleRate:Float, audioStreamInfo:grig.audio.AudioStreamInfo) -> {
        var channel = output.channels[0];
        for (i in 0...channel.length) {
            phase += 0.01;
            channel[i] = Math.sin(phase);
        }
    });
    audioInterface.openPort(options).handle(function(audioOutcome) {
        switch audioOutcome {
            case Success(_):
                trace(audioInterface.isOpen);
            case Failure(error):
                trace(error);
        }
    });
}
```

<a name="see-also"></a>
## See Also

See Thomas' [talk about grig](https://www.youtube.com/watch?v=IQs2a2KHlpk) from the 2019 Haxe Summit:

<iframe width="560" height="315" src="https://www.youtube.com/embed/IQs2a2KHlpk" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

And the [slides](https://webbmaster.com/assets/grig_presentation.pdf) for it. See also [their blog post about haxe and audio](https://webbmaster.com/2019/05/advantages-disadvantages-haxe-audio).