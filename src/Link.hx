package;

class Link extends coconut.ui.View
{
    @:attribute var href:String;
    @:attribute var title:String;

    function render() '<li style={{
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
        }} href="${href}">
        ${title}
        </a>
    </li>';
}