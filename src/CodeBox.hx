package;

import react.ReactMacro.jsx;

class CodeBox extends react.ReactComponent
{
    override function render()
    {
        return jsx('<div style={{
            backgroundColor: "rgb(46, 51, 54)",
            bottom: "0px",
            display: "block",
            fontSize: "14px",
            position: "absolute",
            right: "0px",
            top: "0px",
            width: "50%"
            }}>
            ${props.children}
            </div>');
    }
}