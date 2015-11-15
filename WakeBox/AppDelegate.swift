//
//  AppDelegate.swift
//  WakeBox
//
//  Created by Jack Fischer on 11/14/15.
//  Copyright © 2015 trump6. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    @IBOutlet weak var window: NSWindow!
    
    @IBOutlet var sliderOut: NSSlider!
    @IBOutlet var datePicker: NSDatePicker!
    @IBOutlet var dateClock: NSDatePicker!
    
    
    func applicationDidFinishLaunching(aNotification: NSNotification) {
        // Insert code here to initialize your application
    }
    
    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }
    
    @IBAction func pickerChange(sender: NSDatePicker) {
        dateClock.dateValue = sender.dateValue
    }
    
    @IBAction func clockChange(sender: NSDatePicker) {
        datePicker.dateValue = sender.dateValue
    }
    
    @IBAction func slider(sender: NSSlider) {
        //var x: Double
        var x: Float
        x = sender.floatValue / 100
        print(x)
        setBrightnessLevel(x)
        
        
    }
    
    func setBrightnessLevel(level: Float) {
        var iterator: io_iterator_t = 0
        if IOServiceGetMatchingServices(kIOMasterPortDefault, IOServiceMatching("IODisplayConnect"), &iterator) == kIOReturnSuccess {
            var service: io_object_t = 1
            while service != 0 {
                service = IOIteratorNext(iterator)
                IODisplaySetFloatParameter(service, 0, kIODisplayBrightnessKey, level)
                IOObjectRelease(service)
            }
        }
    }
    
    
}

