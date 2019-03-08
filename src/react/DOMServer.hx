package react;

import js.html.Element;

@:jsRequire('react-dom/server')
extern class DOMServer
{
    public static function renderToString(div:Dynamic):String;
    public static function renderToStaticMarkup(div:Dynamic):String;
}