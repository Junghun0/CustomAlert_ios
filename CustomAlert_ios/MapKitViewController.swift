//
//  MapKitViewController.swift
//  CustomAlert_ios
//
//  Created by 박정훈 on 09/03/2019.
//  Copyright © 2019 swift. All rights reserved.
//

import Foundation
import UIKit
import MapKit

class MapKitViewController : UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        // 뷰 컨트롤러에 맵킷 뷰를 추가한다.
        let mapKitView = MKMapView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        self.view = mapKitView
        self.preferredContentSize.height = 200
        
        //표시할 위치
        let pos = CLLocationCoordinate2D(latitude: 37, longitude: 126)
        
        let span = MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
        
        //3.지도 영역을 정의
        let region = MKCoordinateRegion(center: pos, span: span)
        
        //4.지도 뷰에 표시
        mapKitView.region = region
        mapKitView.regionThatFits(region)
        
        //5.위치를 핀으로 표시
        let point = MKPointAnnotation()
        point.coordinate = pos
        mapKitView.addAnnotation(point)
    }
}
