//
//  ViewController.swift
//  dynamicColor
//
//  Created by Tsutomu Nagai on 2020/05/28.
//  Copyright © 2020 Tsutomu Nagai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // アプリがフォアグランドに復帰したときに関数を実行するための通知を設定する
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(
            self,
            selector: #selector(self.setButtonTitle),
            name: UIApplication.didBecomeActiveNotification,
            object: nil
        )
    }
    
    // アプリがフォアグランドに復帰したときに実行する関数
    @objc private func setButtonTitle(){
        
        if UITraitCollection.isDarkMode{
            button.setTitle("DarkModeです！", for: .normal)
        }else{
            button.setTitle("LightModeです！", for: .normal)
        }
        
    }
    
    
    @IBAction func buttonDidTap(_ sender: Any) {
        
        // ボタンをタップでViewのバックグラウンドカラーを変更する
        view.backgroundColor = UIColor.viewBackground

    }
}

