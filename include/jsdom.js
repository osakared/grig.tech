const JSDOM = require('jsdom').JSDOM;
const jsdom = new JSDOM('<!doctype html><html><body></body></html>');
const { window } = jsdom;
const { document } = window;
const navigator = { userAgent: 'node.js' };
global.document = document;
global.window = window;
global.navigator = navigator;