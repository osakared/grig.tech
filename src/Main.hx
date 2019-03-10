package;

import react.ReactMacro.jsx;

class Main extends react.ReactComponent
{
    override function render()
    {
        return jsx('<div style={{
            display: "block",
            position: "relative",
            zIndex: "30"
            }}>
            ${props.children}
            </div>');
    }
}