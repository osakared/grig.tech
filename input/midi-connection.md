---
layout: default
meta_title: Midi Connection
meta_description: Connecting to midi devices in grig
body_class: home
title: Midi Connection
---

Connecting to midi devices in grig

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