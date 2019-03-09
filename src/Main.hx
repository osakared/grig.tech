package;

class Main extends coconut.ui.View
{
    @:attribute var children:coconut.ui.Children;

    function render() '<div style={{
        display: "block",
        position: "relative",
        zIndex: "30"
        }}>
      ${...children}
    </div>';
}