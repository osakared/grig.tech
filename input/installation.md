---
layout: default
meta_title: Installation
meta_description: How to install grig
body_class: home
title: Installation
---

Grig is designed to work with your existing haxe workflow.

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