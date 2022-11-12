NODE_ENV=production npx webpack --progress --hide-modules --config=node_modules/laravel-mix/setup/webpack.config.js
npx @11ty/eleventy --config=.eleventy.config.js
npx lix download
npx haxe doc.hxml
rm -rf dist/api
npx haxe web.hxml
npx lix run dox --title "Grig" -D website "https://grig.tech" -theme ./dox_theme -i bin -o dist/api
# npx lix download
