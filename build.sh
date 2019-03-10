npx lix install gitlab:haxe-grig/grig.audio
npx lix install gitlab:haxe-grig/grig.midi
npx lix install gitlab:haxe-grig/grig.pitch
npx lix install gitlab:haxe-grig/grig.synth
npx lix download
npx haxe doc.hxml
rm -rf dist/api
lix run dox -i bin -o dist/api