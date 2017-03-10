#!/usr/bin/swift

import WebKit

class WindowDelegate: NSObject, NSWindowDelegate {
  func windowWillClose(_ notification: Notification) {
    NSApplication.shared().terminate(0)
  }
}

class AppDelegate: NSObject, NSApplicationDelegate {
  var mainWindow: NSWindow

  init(window: NSWindow) {
    mainWindow = window
  }

  func applicationDidFinishLaunching(_ notification: Notification) {
    mainWindow.setContentSize(NSSize(width:800, height:600))
    mainWindow.styleMask = NSWindowStyleMask.titled.union(.closable).union(.miniaturizable).union(.resizable)
    mainWindow.center()
    mainWindow.title = "Browser"
    mainWindow.makeKeyAndOrderFront(nil)

    let webView = WebView(frame: mainWindow.contentView!.frame)
    mainWindow.contentView!.addSubview(webView)
    webView.autoresizingMask = NSAutoresizingMaskOptions.viewWidthSizable.union(.viewHeightSizable)
    webView.mainFrame.load(URLRequest(url: URL(string: "https://www.google.com")!))

    NSApp.activate(ignoringOtherApps:true)
  }
}

// application
let app = NSApplication.shared()
app.setActivationPolicy(.regular)

// window
let win = NSWindow()

// window delegate
let windowDelegate = WindowDelegate()
win.delegate = windowDelegate

// app delegate
let delegate = AppDelegate(window:win)
app.delegate = delegate

// runloop
app.run()
