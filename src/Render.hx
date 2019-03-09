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
        // if (FileSystem.exists(distDir)) {
        //     for (file in FileSystem.readDirectory(distDir)) {
        //         var fileName = Path.join([distDir, file]);
        //         FileSystem.deleteFile(fileName);
        //     }
        // }
        // else FileSystem.createDirectory(distDir);
        // for (route in routes.keys()) {
        //     var fileName = Path.join([distDir, route]);
        //     // var div = js.Browser.document.createDivElement();
        //     // coconut.ui.Renderer.mount(
        //     //     div,
        //     //     hxx('<Index />')
        //     // );
        //     // trace(div);
        //     File.saveContent(fileName, '<!DOCTYPE html><html lang="en"><body style="height: 100%;margin: 0;padding: 0;">' +
        //         react.DOMServer.renderToStaticMarkup(hxx('<Index />'))  + '</body></html>');
        // }

        File.saveContent(Path.join([distDir, 'index.html']),
                '<!DOCTYPE html><html lang="en"><body style="height: 100%;margin: 0;padding: 0;"><head><meta charSet="utf-8"/></head>' +
                react.DOMServer.renderToStaticMarkup(hxx('<Index />')) +
                '</body></html>');
    }
}
