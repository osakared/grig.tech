package;

class Index extends coconut.ui.View
{
    function render() '<div style={{
        color: "#333",
        fontFamily: "-apple-system,BlinkMacSystemFont,Segoe UI,Roboto,Helvetica,Arial,sans-serif,Apple Color Emoji,Segoe UI Emoji,Segoe UI Symbol",
        fontSize: "14px",
        lineHeight: "22px",
        height: "100%",
        margin: "0",
        padding: "0",
        }}>
            <div style="outline:none;" tabIndex={-1}>
                <Sidebar>
                    <SidebarTitle>Haxe Grig</SidebarTitle>
                    <Links>
                        <Link href="#introduction" title="Introduction" />
                    </Links>
                </Sidebar>
                <Page>
                    <Main>
                        <Title id="introduction" title="Introduction" />
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
                                Grig is a set of small audio packages for haxe (and by extension, the langauges haxe targets) to process and create music and audio.
                                Grig is designed to have as few dependencies and interdependencies as possible, so that you can use as much or as little of the
                                functionality you need withing bringing in a heavy framework.
                            </p>
                            <p>See the <a href="https://haxe-grig.gitlab.io/grig/api/" target="_blank">api documentation</a>.</p>
                            <p>Hardware Capabilities:</p>
                            <img src="grig-logo.png" style="float:right;" />
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
                        </SectionBlock>
                    </Main>
                    <CodeBox></CodeBox>
                </Page>
            </div>
        </div>';
}