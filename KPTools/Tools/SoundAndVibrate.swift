//
//  SoundAndVibrate.swift
//  STest
//
//  Created by kemp on 2020/6/23.
//  Copyright © 2020 kunpo. All rights reserved.
//  播放声音、震动

import Foundation
import AudioToolbox

@objc public class SoundAndVibrate: NSObject {
    
    public static let share = SoundAndVibrate()
    
    @objc public static func shareInstance() -> SoundAndVibrate {
        return self.share
    }
    
    
    private lazy var normal: SystemSoundID = {
        return creatSoundId(name: "beep", type: "wav")
    }()

    private lazy var doubleNormal: SystemSoundID = {
        return creatSoundId(name: "doubleBeep", type: "mp3")
    }()
    
    private lazy var shenfa: SystemSoundID = {
       return creatSoundId(name: "慎发", type: "wav")
    }()
    
    private lazy var tingfa: SystemSoundID = {
       return creatSoundId(name: "停发", type: "wav")
    }()
        
    private lazy var tuijian: SystemSoundID = {
        return creatSoundId(name: "退件", type: "wav")
    }()

    private lazy var error: SystemSoundID = {
        return creatSoundId(name: "alert", type: "wav")
    }()

    private lazy var gongfuChoujian: SystemSoundID = {
        return creatSoundId(name: "工服抽检", type: "wav")
    }()
    
    private func creatSoundId(name: String, type: String) -> SystemSoundID {
        guard let soundURL = Bundle.main.url(forResource: name, withExtension: type) as CFURL? else {
            return SystemSoundID(1073)
        }
        var sound:SystemSoundID = 0
        AudioServicesCreateSystemSoundID(soundURL, &sound)
        return sound
    }
    
    @objc public func normal(_ vibrate: Bool = false, completion: (() -> Void)? = nil) {
        AudioServicesPlaySystemSoundWithCompletion(normal, completion)
        if vibrate == true {
            AudioServicesPlayAlertSound(kSystemSoundID_Vibrate)
        }
    }
    
    @objc public func doubleNormal(_ vibrate: Bool = false, completion: (() -> Void)? = nil) {
        AudioServicesPlaySystemSoundWithCompletion(doubleNormal, completion)
        if vibrate == true {
            AudioServicesPlayAlertSound(kSystemSoundID_Vibrate)
        }
    }
    
    @objc public func shenfa(_ vibrate: Bool = false, completion: (() -> Void)? = nil) {
        AudioServicesPlaySystemSoundWithCompletion(shenfa, completion)
        if vibrate == true {
            AudioServicesPlayAlertSound(kSystemSoundID_Vibrate)
        }
    }
    
    @objc public func tingfa(_ vibrate: Bool = false, completion: (() -> Void)? = nil) {
        AudioServicesPlaySystemSoundWithCompletion(tingfa, completion)
        if vibrate == true {
            AudioServicesPlayAlertSound(kSystemSoundID_Vibrate)
        }
    }
    
    @objc public func tuijian(_ vibrate: Bool = false, completion: (() -> Void)? = nil) {
        AudioServicesPlaySystemSoundWithCompletion(tuijian, completion)
        if vibrate == true {
            AudioServicesPlayAlertSound(kSystemSoundID_Vibrate)
        }
    }
    
    @objc public func error(_ vibrate: Bool = false, completion: (() -> Void)? = nil) {
        AudioServicesPlaySystemSoundWithCompletion(error, completion)
        if vibrate == true {
            AudioServicesPlayAlertSound(kSystemSoundID_Vibrate)
        }
    }
    
    @objc public func gongfuChoujian(_ vibrate: Bool = false, completion: (() -> Void)? = nil) {
        AudioServicesPlaySystemSoundWithCompletion(error, completion)
        if vibrate == true {
            AudioServicesPlayAlertSound(kSystemSoundID_Vibrate)
        }
    }
    
    @objc public func play(sound name: String, type: String, vibrate: Bool = false, completion: (() -> Void)? = nil) {
        let sound = creatSoundId(name: name, type: type)
        AudioServicesPlaySystemSoundWithCompletion(sound, completion)
        if vibrate == true {
            AudioServicesPlayAlertSound(kSystemSoundID_Vibrate)
        }
    }
    
}
