import react.ReactComponent;
import react.ReactMacro.jsx;

typedef ButtonProps = {
    var action:()->Void;
    var label:String;
    var ?visible:Bool;
}

class Button extends ReactComponentOfProps<ButtonProps>
{
    public static final defaultProps = {
		visible: true
    }
    
    override public function render():ReactElement
    {
        if (this.props.visible) return jsx('<button onClick=${this.props.action}>${this.props.label}</button>');
        return jsx('<span></span>');
    }
}