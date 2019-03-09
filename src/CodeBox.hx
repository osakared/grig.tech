package;

class CodeBox extends coconut.ui.View
{
    @:attribute var children:coconut.ui.Children;

    function render() '<div style={{
        backgroundColor: "rgb(46, 51, 54)",
        bottom: "0px",
        display: "block",
        fontSize: "14px",
        position: "absolute",
        right: "0px",
        top: "0px",
        width: "50%"
        }}>
        ${...children}
    </div>';
}