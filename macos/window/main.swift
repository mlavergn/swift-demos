#!/usr/bin/swift

import Cocoa

// application
let app = NSApplication.shared()
app.setActivationPolicy(.regular)

// menu
let menu = NSMenu()
let menuItem = NSMenuItem()
menu.addItem(menuItem)
app.mainMenu = menu

// menu items
let appMenu = NSMenu()
let quitMenuItem = NSMenuItem()
quitMenuItem.title = "Quit " + ProcessInfo.processInfo.processName
quitMenuItem.action = #selector(NSApp.terminate)
quitMenuItem.keyEquivalent = "q"
appMenu.addItem(quitMenuItem)

menuItem.submenu = appMenu

// window
let mask = NSWindowStyleMask.titled.union(.resizable).union(.closable).union(.miniaturizable)
let win = NSWindow(contentRect: NSMakeRect(100, 100, 600, 200), styleMask: mask, backing: NSBackingStoreType.buffered, defer: false)
win.title = "Demo"
win.makeKeyAndOrderFront(nil)

// wait for the event loop to activate
DispatchQueue.main.async {
    app.activate(ignoringOtherApps:true)
}

app.run()
