package;

import react.ReactMacro.jsx;

class SectionBlock extends react.ReactComponent
{
    override function render()
    {
        return jsx('<div style={{
            display: "block",
            boxSizing: "border-box",
            padding: "0px 28px",
            width: "50%"
            }}>
            ${props.children}
            </div>');
    }
}