---
layout: default
meta_title: Using With Heaps or OpenFL
meta_description: Connecting to audio devices in grig
body_class: home
title: Using With Heaps or OpenFL
---

Using grig's audio callback in heaps or openfl

When linking to both `grig.audio` and `heaps` haxelibs, `grig.audio` uses heaps' `NativeAudioChannel` for `AudioInterface`. That can be disabled by defining `DISABLE_HEAPS_AUDIO_INTERFACE` (using `-D DISABLE_HEAPS_AUDIO_INTERFACE`) if you wish to use grig's other abstractions instead. You can also define your own if you disable any other predefined audio interface. See [AudioInterface.hx](https://gitlab.com/haxe-grig/grig.audio/-/blob/main/src/grig/audio/AudioInterface.hx). This might be useful if you want to use heaps or openfl for visual component, but bypass its audio system.

It may be confusing that heaps is a dependency whether you're using heaps or openfl. This is simply because grig.audio detects if heaps is available and by default uses it's NativeAudioChannel interface. When linking to both heaps and openfl, heaps' NativeAudioChannel actually abstracts over openfl's audio system. Don't worry. Due to dead code elimination, only the relevant code will end up in the final output so it's not akin to, say, linking an additional redundant graphic framework's dll in a c++ application.

Simply connect as you usually would with an audio callback, but the options have no effect if you're using heaps' or openfl's audio system:

```haxe
var audioInterface_ = new AudioInterface();
var options:grig.audio.AudioInterfaceOptions = { outputNumChannels: 2 };
audioInterface_.setCallback(audioCallback);
audioInterface_.openPort(options).handle(function(audioOutcome) {
    switch audioOutcome {
        case Success(_):
            trace('Success');
            audioInterface = audioInterface_;
        case Failure(error):
            trace(error);
    }
});
```

With `audioInterface` being an audio callback:

```haxe
private function audioCallback(input:grig.audio.AudioBuffer, output:grig.audio.AudioBuffer, sampleRate:Float, audioStreamInfo:grig.audio.AudioStreamInfo)
{
    // Write audio to output here
}
```
