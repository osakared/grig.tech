import react.ReactComponent;
import react.ReactMacro.jsx;

class Demo extends ReactComponent
{
    override public function render():ReactElement
    {
        return jsx('<$Midi/>');
    }
}