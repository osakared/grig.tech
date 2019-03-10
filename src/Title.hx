package;

import react.ReactMacro.jsx;

class Title extends react.ReactComponent
{
    @:attribute var id:String;
    @:attribute var title:String;

    // marginTop and borderTopWidth /should/ be firstChild only... otherwise marginTop: "2em", borderTopWidth: "1px",
    override function render()
    {
        return jsx('<h1 style={{
            backgroundColor: "white",
            borderBottom: "1px solid rgb(204, 204, 204)",
            borderTop: "1px solid silver",
            boxSizing: "border-box",
            clear: "both",
            display: "block",
            fontSize: "25px",
            lineHeight: "normal",
            padding: "0.5em 28px",
            marginBottom: "21px",
            marginRight: "50%",
            width: "50%",
            marginTop: "0px",
            borderTopWidth: "0px"
            }} id={id}>
            ${title}
            </h1>');
    }
}