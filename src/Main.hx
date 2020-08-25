package;

import react.ReactDOM;
import react.ReactMacro.jsx;

class Main
{
    public static function main()
    {
        return ReactDOM.render(jsx('<$Demo/>'), js.Browser.document.getElementById('app'));
    }
}