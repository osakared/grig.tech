package;

import react.ReactMacro.jsx;

class SidebarTitle extends react.ReactComponent
{
    override function render()
    {
        return jsx('<h1 style={{
            color: "white",
            fontSize: "20px",
            padding: "1rem",
            textAlign: "center"
            }}>
            ${props.children}
            </h1>');
    }
}