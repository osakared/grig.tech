package;

class SectionBlock extends coconut.ui.View
{
    @:attribute var children:coconut.ui.Children;

    function render() '<div style={{
        display: "block",
        boxSizing: "border-box",
        padding: "0px 28px",
        width: "50%"
        }}>
        ${...children}
    </div>';
}