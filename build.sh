NODE_ENV=production npx webpack --progress --hide-modules --config=node_modules/laravel-mix/setup/webpack.config.js && npx @11ty/eleventy --config=.eleventy.config.js
npx lix install gitlab:haxe-grig/grig.midi
npx lix install gitlab:haxe-grig/grig.pitch
npx lix install gitlab:haxe-grig/grig.synth
npx lix install gitlab:haxe-grig/grig.audio
npx lix install gitlab:haxe-grig/haxe-musicpd
npx lix download
npx haxe doc.hxml
rm -rf dist/api
npx lix run dox -i bin -o dist/api
# npx lix download
# npx haxe web.hxml