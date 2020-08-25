import react.ReactComponent;
import react.ReactMacro.jsx;

typedef SelectorProps = {
    var action:(js.html.Event)->Void;
    var ?visible:Bool;
    var options:Array<String>;
}

class Selector extends ReactComponentOfProps<SelectorProps>
{
    public static final defaultProps = {
		visible: true
    }
    
    override public function render():ReactElement
    {
        if (this.props.visible) return jsx('<select onChange=${this.props.action}>${renderOptions()}</select>');
        return jsx('<span></span>');
    }

    private function renderOptions()
    {
        return [for (option in this.props.options)
            jsx('<option>$option</option>')
        ];
    }
}