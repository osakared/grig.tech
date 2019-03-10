package;

import react.ReactMacro.jsx;

class Page extends react.ReactComponent
{
    override function render()
    {
        return jsx('<div style={{
            backgroundColor: "rgb(243, 247, 249)",
            display: "block",
            marginLeft: "230px",
            minHeight: "100%",
            paddingBottom: "1rem",
            position: "relative",
            zIndex: "10"
            }}>
            ${props.children}
            </div>');
    }
}