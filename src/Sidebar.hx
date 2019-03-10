package;

import react.ReactMacro.jsx;

class Sidebar extends react.ReactComponent
{
    override function render()
    {
        return jsx('<div style={{
            bottom: "0px",
            display: "block",
            position: "fixed",
            backgroundColor: "rgb(46, 51, 54)",
            left: "0px",
            overflowY: "auto",
            top: "0px",
            width: "230px"
            }}>
            ${props.children}
            </div>');
    }
}