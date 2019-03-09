//
//  ViewController.swift
//  CustomAlert_ios
//
//  Created by 박정훈 on 09/03/2019.
//  Copyright © 2019 swift. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //기본 알림창 버튼
        let defaultAlertbtn = UIButton(type: .system)
        defaultAlertbtn.frame = CGRect(x: 0, y: 100, width: 100, height: 30)
        defaultAlertbtn.center.x = self.view.frame.width/2
        defaultAlertbtn.setTitle("기본 알림창", for: .normal)
        defaultAlertbtn.addTarget(self, action: #selector(defaultAlert(_:)), for: .touchUpInside)
        
        self.view.addSubview(defaultAlertbtn)
    }
    
    @objc func defaultAlert(_ sender: Any){
        //알림창을 정의
        let alert = UIAlertController(title: "알림창", message: "기본메시지가 들어가는 곳", preferredStyle: .alert)
        
        //버튼을 정의
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        //알림창에 버튼 추가
        alert.addAction(cancelAction)
        alert.addAction(okAction)
        
        //알림창 화면에 표시
        self.present(alert, animated: false)
    }
    
    


}

