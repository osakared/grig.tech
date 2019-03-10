package;

import react.ReactMacro.jsx;

class CodeBlock extends react.ReactComponent
{
    override function render()
    {
        return jsx('<div style={{
            color: "rgb(255, 255, 255)",
            display: "block",
            float: "right",
            margin: "0px",
            overflow: "auto",
            padding: "2em 28px",
            width: "50%",
            backgroundColor: "rgb(30, 33, 35)",
            boxSizing: "border-box",
            clear: "right"
            }}>
                <pre style={{
                    padding: "1em",
                    margin: ".5em 0",
                    overflow: "auto",
                    borderRadius: ".3em",
                    color: "#f8f8f2",
                    textShadow: "0 1px rgba(0,0,0,.3)",
                    fontFamily: "Consolas,Monaco,Andale Mono,Ubuntu Mono,monospace",
                    textAlign: "left",
                    whiteSpace: "pre",
                    wordSpacing: "normal",
                    wordBreak: "normal",
                    wordWrap: "normal",
                    lineHeight: "1.5",
                    hyphens: "none",
                    backgroundColor: "rgb(30, 33, 35) !important",
                    boxSizing: "border-box",
                    display: "block"
                }} dangerouslySetInnerHTML={{__html: ${props.code}}}>
                </pre>
            </div>');
    }
}