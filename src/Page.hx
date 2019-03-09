package;

class Page extends coconut.ui.View
{
    @:attribute var children:coconut.ui.Children;

    function render() '<div style={{
        backgroundColor: "rgb(243, 247, 249)",
        display: "block",
        marginLeft: "230px",
        minHeight: "100%",
        paddingBottom: "1rem",
        position: "relative",
        zIndex: "10"
        }}>
        ${...children}
    </div>';
}