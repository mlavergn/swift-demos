#!/usr/bin/swift

import Foundation

// do work here

// block provides a clean exit
DispatchQueue.main.async {
  print("bye")
  exit(0)
}

RunLoop.current.run()
