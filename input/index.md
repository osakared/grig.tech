---
layout: default
meta_title: Home
meta_description: Grig is a set of audio libs for Haxe
body_class: home
title: Grig
---

<img src="images/grig.png" style='float: right; width: 300px;' />

[![Grig Lobby on Gitter](https://badges.gitter.im/haxe-grig/Lobby.svg)](https://gitter.im/haxe-grig/Lobby?utm_source=badge&amp;utm_medium=badge&amp;utm_campaign=pr-badge&amp;utm_content=badge)
[![MIT License](https://img.shields.io/badge/license-MIT-green.svg)](license)
[![Clone on Gitlab](https://img.shields.io/static/v1.svg?label=gitlab&message=clone&color=green)](https://gitlab.com/haxe-grig)

# Introduction 🧚🏼‍♂️

Grig is a set of small audio packages for [haxe](https://haxe.org/) (and by extension, the langauges haxe targets) to process and create music and audio.
Grig is designed to have as few dependencies and interdependencies as possible, so that you can use as much or as little of the features you need withing bringing
in a heavy framework. Haxe's dead code elimination also ensures that unused functionality within a package isn't included in the final output.

For non-hardware code, grig is designed to work on all haxe targets. Audio and MIDI IO externs are also provided for a number of different environments (see below).
This means that it should be possible to run the same audio code on multiple different environments, ranging from standalone compiled applications, to the browser,
to plugins.

See the [api documentation](/api/) and also the [tutorials](/tutorials/).

## Hardware Capabilities

<table style="width: 400px">
    <thead>
    <tr>
    <th>Environment</th>
    <th>Midi IO 🎹</th>
    <th>Audio IO 🎧</th>
    </tr>
    </thead>
    <tbody><tr>
    <td>c++</td>
    <td>✅</td>
    <td>✅</td>
    </tr>
    <tr>
    <td>hashlink</td>
    <td>(rtmidi)</td>
    <td>(portaudio)</td>
    </tr>
    <tr>
    <td>c++/vst</td>
    <td></td>
    <td></td>
    </tr>
    <tr>
    <td>c++/au</td>
    <td></td>
    <td></td>
    </tr>
    <tr>
    <td>c++/lv2</td>
    <td></td>
    <td></td>
    </tr>
    <tr>
    <td>c++/fmod</td>
    <td>N/A</td>
    <td></td>
    </tr>
    <tr>
    <td>js/html5</td>
    <td>✅</td>
    <td>✅</td>
    </tr>
    <tr>
    <td>js/nodejs</td>
    <td>✅</td>
    <td></td>
    </tr>
    <tr>
    <td>java</td>
    <td></td>
    <td></td>
    </tr>
    <tr>
    <td>c#</td>
    <td>(<a href="https://github.com/atsushieno/managed-midi" target="_blank">managed midi</a>)</td>
    <td></td>
    </tr>
    <tr>
    <td>c#/fmod</td>
    <td>N/A</td>
    <td></td>
    </tr>
    <tr>
    <td>lua</td>
    <td>(<a href="https://github.com/luaforge/luamidi" target="_blank">luamidi</a>)</td>
    <td></td>
    </tr>
    <tr>
    <td>python</td>
    <td>✅</td>
    <td>✅</td>
    </tr>
    <tr>
    <td>heaps</td>
    <td>N/A</td>
    <td>✅</td>
    </tr>
    </tbody>
</table>

Get your [grig t-shirt](https://www.redbubble.com/i/t-shirt/Grig-Mascot-by-handfetisch/40620610.IZGJF)! Or [sponsor grig development](https://github.com/sponsors/thomasjwebb).