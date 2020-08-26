import react.ReactComponent;
import react.ReactMacro.jsx;

typedef SliderProps = {
    var action:(value:Float)->Void;
    var label:String;
    var min:Float;
    var max:Float;
    var val:Float;
    var ?step:Float;
}

typedef SliderState = {
    var val:Float;
}

class Slider extends ReactComponentOf<SliderProps, SliderState>
{
    public static final defaultProps = {
		step: 1
    }

    public function new()
    {
        super(props, state);
        this.state = { val: 0 };
    }

    override public function componentWillMount():Void
    {
        this.setState({ val: this.props.val });
    }
    
    override public function render():ReactElement
    {
        return jsx('<div>
                        <label>${this.props.label}</label>
                        <input type="range" min=${this.props.min} max=${this.props.max} step=${this.props.step} val=${this.props.val} onChange=$changeSlider />
                        ${this.state.val}
                    </div>');
    }

    private function changeSlider(event:js.html.Event):Void
    {
        var selector:js.html.InputElement = cast event.target;
        var val = Std.parseFloat(selector.value);
        this.props.action(val);
        this.setState({val: val});
    }
}