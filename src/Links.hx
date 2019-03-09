package;

class Links extends coconut.ui.View
{
    @:attribute var children:coconut.ui.Children;

    function render() '<ul style={{
        display: "block",
        listStyle: "outside none none",
        margin: "0px",
        padding: "0px"
        }}>
      ${...children}
    </ul>';
}