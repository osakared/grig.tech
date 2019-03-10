package;

import react.ReactMacro.jsx;

class Link extends react.ReactComponent
{
    override function render()
    {
        return jsx('<li style={{
            color: "white",
            display: "list-item"
            }}>
            <a style={{
                lineHeight: "28px",
                padding: "0px 15px",
                display: "block",
                overflowX: "hidden",
                whiteSpace: "nowrap",
                textOverflow: "ellipsis",
                textDecoration: "none",
                color: "rgb(255, 255, 255)",
                transitionProperty: "background",
                transitionTimingFunction: "linear",
                transitionDuration: "130ms"
            }} href="${props.href}">
            ${props.title}
            </a>
            </li>');
    }
}