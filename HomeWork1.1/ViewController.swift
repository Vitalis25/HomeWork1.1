//
//  ViewController.swift
//  HomeWork1.1
//
//  Created by Vitally Ochnev on 05.12.2021.
//

import AVFoundation
import UIKit

class ViewController: UIViewController {
    
    override var prefersStatusBarHidden: Bool {
        return true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func changeLayout(_ sender: UIButton) {
        
        sender.tag += 1
        if sender.tag > 7 { sender.tag = 0
        }
        
        switch sender.tag {
        case 1:
            view.backgroundColor = .red
        case 2:
            view.backgroundColor = .orange
        case 3:
            view.backgroundColor = .yellow
        case 4:
            view.backgroundColor = .green
        case 5:
            view.backgroundColor = .cyan
        case 6:
            view.backgroundColor = .blue
        case 7:
            view.backgroundColor = .purple
        default:
            view.backgroundColor = .black
    
        }
        updateView()
    }
}

fileprivate func updateView () {
    let device = AVCaptureDevice.default(for: AVMediaType.video)
    if ((device?.hasTorch) != nil) {
        do {
            try device?.lockForConfiguration()
            device?.torchMode = device?.torchMode == AVCaptureDevice.TorchMode.on ? .off : .on
            device?.unlockForConfiguration()
        } catch {print(error)}
    }
}
