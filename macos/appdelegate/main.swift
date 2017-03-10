#!/usr/bin/swift

import Cocoa

class AppDelegate: NSObject, NSApplicationDelegate {
  var mainWindow: NSWindow?

  func applicationDidFinishLaunching(_ notification: Notification) {
    let mask = NSWindowStyleMask.titled.union(.resizable).union(.closable).union(.miniaturizable)
    let win = NSWindow(contentRect: NSMakeRect(100, 100, 600, 200), styleMask: mask, backing: NSBackingStoreType.buffered, defer: true)
    win.title = "Demo"
    win.makeKeyAndOrderFront(nil)
    //        window.orderFrontRegardless()
    self.mainWindow = win

    NSApp.activate(ignoringOtherApps:true)
  }

  func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
    return true
  }
}

// application
let app = NSApplication.shared()
app.setActivationPolicy(.regular)

// app delegate
let delegate = AppDelegate()
app.delegate = delegate

// runloop
app.run()
