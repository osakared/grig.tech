package;

import react.ReactMacro.jsx;

class Links extends react.ReactComponent
{
    override function render()
    {
        return jsx('<ul style={{
            display: "block",
            listStyle: "outside none none",
            margin: "0px",
            padding: "0px"
            }}>
            ${props.children}
            </ul>');
    }
}