#!/usr/bin/swift

import Cocoa

public class StatusApp {
    public func display() {
        let statusbar = NSStatusBar.system()
        
        let statusItem = statusbar.statusItem(withLength:NSVariableStatusItemLength)
        statusItem.title = "Demo"
        statusItem.toolTip = "Demo app"
        
        let menu = NSMenu()
        
        let quitMenuItem = NSMenuItem()
        quitMenuItem.title = "Quit"
        quitMenuItem.target = self
        quitMenuItem.action = #selector(quit(_:))

        menu.addItem(quitMenuItem)

        statusItem.menu = menu
    }
    
    @objc public func quit(_ sender:Any?) {
        NSApp.terminate(self)
    }
}

let app = NSApplication.shared()
app.setActivationPolicy(.prohibited)

let status = StatusApp()
status.display()

app.run()
