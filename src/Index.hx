package;

import react.ReactMacro.jsx;

class Index extends react.ReactComponent
{

    override function render()
    {
        var code = '
<span style="color: #fa6cbc;">trace</span>(<span style="color: #7ee1f8;">MidiIn</span>.<span style="color: #7ee1f8;">getApis</span>());
<span style="color: #fa6cbc;">var</span> <span style="color: #e6e7e1;">midiIn</span> <span style="color: #fa6cbc;">=</span> <span style="color: #fa6cbc;">new</span> <span style="color: #7ee1f8;">MidiIn</span>(<span style="color: #b588f8;">grig.midi.</span><span style="color: #7ee1f8;">Api</span><span style="color: #b588f8;">.</span><span style="color: #7ee1f8;">Unspecified</span>);
<span style="color: #e6e7e1;">midiIn</span>.<span style="color: #7ee1f8;">setCallback</span>(<span style="color: #fa6cbc;">function</span> (<span style="color: #f3a75e;">midiMessage</span><span style="color: #fa6cbc;">:</span><span style="color: #7ee1f8;">MidiMessage</span>, <span style="color: #f3a75e;">delta</span><span style="color: #fa6cbc;">:</span><span style="color: #b588f8;">Float</span>) {
    <span style="color: #fa6cbc;">trace</span>(<span style="color: #e6e7e1;">midiMessage</span>.<span style="color: #e6e7e1;">messageType</span>);
    <span style="color: #fa6cbc;">trace</span>(<span style="color: #e6e7e1;">delta</span>);
});
<span style="color: #e6e7e1;">midiIn</span>.<span style="color: #7ee1f8;">getPorts</span>().<span style="color: #7ee1f8;">handle</span>(<span style="color: #fa6cbc;">function</span>(<span style="color: #f3a75e;">outcome</span>) {
    <span style="color: #fa6cbc;">switch</span> <span style="color: #e6e7e1;">outcome</span> {
        <span style="color: #fa6cbc;">case</span> <span style="color: #7ee1f8;">Success</span>(<span style="color: #e6e7e1;">ports</span>):
            <span style="color: #fa6cbc;">trace</span>(<span style="color: #e6e7e1;">ports</span>);
            <span style="color: #e6e7e1;">midiIn</span>.<span style="color: #7ee1f8;">openPort</span>(<span style="color: #b588f8;">0</span>, <span style="color: #dde77a;"><span style="color: #dde77a;">\'</span>grig.midi<span style="color: #dde77a;">\'</span></span>).<span style="color: #7ee1f8;">handle</span>(<span style="color: #fa6cbc;">function</span>(<span style="color: #f3a75e;">midiOutcome</span>) {
                <span style="color: #fa6cbc;">switch</span> <span style="color: #e6e7e1;">midiOutcome</span> {
                    <span style="color: #fa6cbc;">case</span> <span style="color: #7ee1f8;">Success</span>(<span style="color: #e6e7e1;">_</span>):
                        <span style="color: #7ee1f8;">mainLoop</span>(<span style="color: #e6e7e1;">midiIn</span>);
                    <span style="color: #fa6cbc;">case</span> <span style="color: #7ee1f8;">Failure</span>(<span style="color: #e6e7e1;">error</span>):
                        <span style="color: #fa6cbc;">trace</span>(<span style="color: #e6e7e1;">error</span>);
                }
            });
        <span style="color: #fa6cbc;">case</span> <span style="color: #7ee1f8;">Failure</span>(<span style="color: #e6e7e1;">error</span>):
            <span style="color: #fa6cbc;">trace</span>(<span style="color: #e6e7e1;">error</span>);
    }
});';
        return jsx('<div style={{
        color: "#333",
        fontFamily: "-apple-system,BlinkMacSystemFont,Segoe UI,Roboto,Helvetica,Arial,sans-serif,Apple Color Emoji,Segoe UI Emoji,Segoe UI Symbol",
        fontSize: "14px",
        lineHeight: "22px",
        height: "100%",
        margin: "0",
        padding: "0",
        }}>
            <div style={{outline: "none"}} tabIndex={-1}>
                <Sidebar>
                    <SidebarTitle>Haxe Grig</SidebarTitle>
                    <Links>
                        <Link href="#introduction" title="Introduction" />
                        <Link href="#installation" title="Installation" />
                    </Links>
                </Sidebar>
                <Page>
                    <Main>
                        <Title id="introduction" title="Introduction" />
                        <CodeBlock code=${code} />
                        <SectionBlock>
                            <a href="https://gitter.im/haxe-grig/Lobby?utm_source=badge&amp;utm_medium=badge&amp;utm_campaign=pr-badge&amp;utm_content=badge" target="_blank">
                                <img src="https://badges.gitter.im/haxe-grig/Lobby.svg" data-origin="https://badges.gitter.im/haxe-grig/Lobby.svg" />
                            </a>
                            ${' '}
                            <img src="https://img.shields.io/badge/license-MIT-green.svg" />  
                            ${' '}
                            <a href="https://gitlab.com/haxe-grig">
                                <img src="https://img.shields.io/static/v1.svg?label=gitlab&message=clone&color=green" />
                            </a>
                            <p>
                                Grig is a set of small audio packages for <a href="https://haxe.org/">haxe</a> (and by extension, the langauges haxe targets)
                                to process and create music and audio.
                                Grig is designed to have as few dependencies and interdependencies as possible, so that you can use as much or as little of the
                                features you need withing bringing in a heavy framework. Haxe\'s dead code elimination also ensures that unused
                                functionality within a package isn\'t included in the final output.
                            </p>
                            <p>
                                For non-hardware code, grig is designed to work on all haxe targets. Audio and MIDI IO externs are also provided for a number of
                                different environments (see below). This means that it should be possible to run the same audio code on multiple different
                                environments, ranging from standalone compiled applications, to the browser, to plugins.
                            </p>
                            <p>See the <a href="api/" target="_blank">api documentation</a>.</p>
                            <img src="grig-logo.png" style={{float: "right"}} />
                            <p>Hardware Capabilities:</p>
                            <table>
                                <thead>
                                <tr>
                                <th>Environment</th>
                                <th>Midi IO</th>
                                <th>Audio IO</th>
                                </tr>
                                </thead>
                                <tbody><tr>
                                <td>c++</td>
                                <td>✅</td>
                                <td>✅</td>
                                </tr>
                                <tr>
                                <td>hashlink</td>
                                <td>(rtmidi)</td>
                                <td>(portaudio)</td>
                                </tr>
                                <tr>
                                <td>c++/vst</td>
                                <td></td>
                                <td></td>
                                </tr>
                                <tr>
                                <td>c++/au</td>
                                <td></td>
                                <td></td>
                                </tr>
                                <tr>
                                <td>c++/lv2</td>
                                <td></td>
                                <td></td>
                                </tr>
                                <tr>
                                <td>c++/fmod</td>
                                <td>N/A</td>
                                <td></td>
                                </tr>
                                <tr>
                                <td>js/html5</td>
                                <td>✅</td>
                                <td>✅</td>
                                </tr>
                                <tr>
                                <td>js/nodejs</td>
                                <td>✅</td>
                                <td></td>
                                </tr>
                                <tr>
                                <td>java</td>
                                <td></td>
                                <td></td>
                                </tr>
                                <tr>
                                <td>c#</td>
                                <td>(<a href="https://github.com/atsushieno/managed-midi" target="_blank">managed midi</a>)</td>
                                <td></td>
                                </tr>
                                <tr>
                                <td>c#/fmod</td>
                                <td>N/A</td>
                                <td></td>
                                </tr>
                                <tr>
                                <td>lua</td>
                                <td>(<a href="https://github.com/luaforge/luamidi" target="_blank">luamidi</a>)</td>
                                <td></td>
                                </tr>
                                <tr>
                                <td>python</td>
                                <td>✅</td>
                                <td>✅</td>
                                </tr>
                                <tr>
                                <td>heaps</td>
                                <td>N/A</td>
                                <td>✅</td>
                                </tr>
                                </tbody>
                            </table>
                            <h2>grig.midi</h2>
                            <ul>
                                <li><a href="https://lib.haxe.org/p/grig.midi">Package on haxelib</a></li>
                                <li><a href="https://gitlab.com/haxe-grig/grig.midi">Source on gitlab</a></li>
                            </ul>
                            <h2>grig.audio</h2>
                            <ul>
                                <li><a href="https://lib.haxe.org/p/grig.audio">Package on haxelib</a></li>
                                <li><a href="https://gitlab.com/haxe-grig/grig.audio">Source on gitlab</a></li>
                            </ul>
                        </SectionBlock>
                        <Title id="installation" title="Installation" />
                        <SectionBlock>
                            <p>
                                I recommend <a href="https://github.com/lix-pm/lix.client">lix</a> as a way to manage haxe versions and packages. However
                                grig packages can be installed using haxelib as well. Please note that due to the use of git submodules, installing directly
                                from the repo isn\'t supported for cpp standalone on grig.audio and grig.midi.
                                Instead, to use the latest version from git, clone the repo, then modify the appropriate files under haxe_modules to point to
                                that directory as detailed in the lix documentation.
                            </p>
                            <pre>lix install haxelib:grig.midi</pre>
                            <p>Copyright © 2019 Osaka Red LLC, redistributable per the terms of the CC Attribution 4.0 license.</p>
                        </SectionBlock>
                    </Main>
                    <CodeBox></CodeBox>
                </Page>
            </div>
        </div>');
    }
}