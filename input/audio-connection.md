---
layout: default
meta_title: Audio Connection
meta_description: Connecting to audio devices in grig
body_class: home
title: Audio Connection
---

Connecting to audio devices in grig

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