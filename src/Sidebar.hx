package;

class Sidebar extends coconut.ui.View
{
    @:attribute var children:coconut.ui.Children;

    function render() '<div style={{
        bottom: "0px",
        display: "block",
        position: "fixed",
        backgroundColor: "rgb(46, 51, 54)",
        left: "0px",
        overflowY: "auto",
        top: "0px",
        width: "230px"
        }}>
      ${...children}
    </div>';
}