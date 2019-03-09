package;

class SidebarTitle extends coconut.ui.View
{
    @:attribute var children:coconut.ui.Children;

    function render() '<h1 style={{
        color: "white",
        fontSize: "20px",
        padding: "1rem",
        textAlign: "center"
        }}>
      ${...children}
    </h1>';
}