package;

import coconut.Ui.hxx;
import haxe.io.Path;
import sys.io.File;
import sys.FileSystem;

class Render
{
    static private var routes:Map<String, String> = [
        'index.html' => 'Index'
    ];

    static function main()
    {
        var distDir = FileSystem.absolutePath('dist');
        if (FileSystem.exists(distDir)) {
            for (file in FileSystem.readDirectory(distDir)) {
                var fileName = Path.join([distDir, file]);
                FileSystem.deleteFile(fileName);
            }
        }
        else FileSystem.createDirectory(distDir);
        for (route in routes.keys()) {
            var fileName = Path.join([distDir, route]);
            File.saveContent(fileName, react.DOMServer.renderToStaticMarkup(hxx('<Index />')));
        }
    }
}
