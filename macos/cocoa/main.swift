#!/usr/bin/swift

import Cocoa

let app = NSApplication.shared()

// do work here

// block provides a clean exit
DispatchQueue.main.async {
  print("bye")
  NSApplication.shared().terminate(nil)
}

app.run()
