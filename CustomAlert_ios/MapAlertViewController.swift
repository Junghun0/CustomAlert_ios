//
//  MapAlertViewController.swift
//  CustomAlert_ios
//
//  Created by 박정훈 on 09/03/2019.
//  Copyright © 2019 swift. All rights reserved.
//

import Foundation
import UIKit
import MapKit

class MapAlertViewController: UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //버튼생성
        let alertBtn = UIButton(type: .system)
        
        //버튼 속성 설정
        alertBtn.frame = CGRect(x: 0, y: 150, width: 100, height: 30)
        alertBtn.center.x = self.view.frame.width / 2
        alertBtn.setTitle("Map Alert", for: .normal)
        alertBtn.addTarget(self, action: #selector(mapAlert(_:)), for: .touchUpInside)
        
        self.view.addSubview(alertBtn)
        
        //이미지알림창 버튼
        let imageBtn = UIButton(type: .system)
        
        imageBtn.frame = CGRect(x: 0, y: 300, width: 100, height: 30)
        imageBtn.center.x = self.view.frame.width / 2
        imageBtn.setTitle("Image Alert", for: .normal)
        imageBtn.addTarget(self, action: #selector(imageAlert(_:)), for: .touchUpInside)
        
        self.view.addSubview(imageBtn)
    }
    
    @objc func imageAlert(_ sender: Any){
        let alert = UIAlertController(title: nil, message: "이번 글의 평점은 다음과 같습니다.", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        
        let contentVC = ImageViewController()
        alert.setValue(contentVC, forKey: "contentViewController")
        
        self.present(alert, animated: false)
    }
    
    @objc func mapAlert(_ sender: Any){
        //경고창 객체를 생성하고, ok 및 cancel 버튼을 추가한다.
        let alert = UIAlertController(title: nil, message: "여기가 맞습니까?", preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        
        alert.addAction(cancelAction)
        alert.addAction(okAction)
        
        //컨텐츠 뷰 영역에 들어갈 뷰 컨트롤러를 생성하고, 알림창에 등록한다.
        let contentVC = MapKitViewController()
        
        //뷰 컨트롤러를 알림창의 컨텐츠 뷰 컨트롤러 속성에 등록한다.
        alert.setValue(contentVC, forKey: "contentViewController")
        
        self.present(alert, animated: false)
    }
    
}
