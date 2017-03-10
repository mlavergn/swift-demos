#!/usr/bin/swift

import Cocoa

class StatusApp : NSObject {
    func display() {
        let statusbar = NSStatusBar.system()
        
        let statusItem = statusbar.statusItem(withLength:NSVariableStatusItemLength)
        statusItem.title = "Demo"
        statusItem.toolTip = "Demo"
        
        let menu = NSMenu()
        
        let quitMenuItem = NSMenuItem()
        quitMenuItem.title = "Quit"
        quitMenuItem.action = #selector(NSApp.terminate)

        menu.addItem(quitMenuItem)

        statusItem.menu = menu
    }
    
    func quit(sender:NSMenuItem) {
        NSApplication.shared().terminate(self)
    }
}

let app = NSApplication.shared()
app.setActivationPolicy(.prohibited)

let status = StatusApp()
status.display()

app.run()
