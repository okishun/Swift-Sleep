//
//  ViewController.swift
//  Swift Sleep
//
//  Created by 沖 隼佑 on 2015/05/15.
//  Copyright (c) 2015年 沖 隼佑. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {
    //CMmotionManagerのインスタンス生成
    lazy var motionManager = CMMotionManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if motionManager.accelerometerAvailable{
            
            //センサーの更新間隔の指定
            motionManager.gyroUpdateInterval = 0.01
            //ハンドラを設定し、加速度の取得開始
            let queue = NSOperationQueue()
            motionManager.startAccelerometerUpdatesToQueue(queue, withHandler:
                {(data: CMAccelerometerData!, error: NSError!) in
                    
                    //画面に表示
                    println("X = \(data.acceleration.x)")
                    println("Y = \(data.acceleration.y)")
                    println("Z = \(data.acceleration.z)")
                    
                }
            )
            //(不必要になったら)センサーの停止
            if (motionManager.gyroActive) {
                motionManager.stopAccelerometerUpdates()
            }
        }
    }
}


