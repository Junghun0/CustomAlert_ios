# CustomAlert_ios

#### contentViewController 를 이용한 알림 커스텀

```swift
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //기본 알림창 버튼
        let defaultAlertbtn = UIButton(type: .system)
        defaultAlertbtn.frame = CGRect(x: 0 , y: 100, width: 100, height: 30)
        defaultAlertbtn.center.x = self.view.frame.width/2
        defaultAlertbtn.setTitle("커스텀 알림", for: .normal)
        defaultAlertbtn.addTarget(self, action: #selector(defaultAlert(_:)), for: .touchUpInside)
        
        self.view.addSubview(defaultAlertbtn)
    }
    
    @objc func defaultAlert(_ sender: Any){
        //알림창을 정의
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .alert)
        
        //버튼을 정의
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        //알림창에 버튼 추가
        alert.addAction(cancelAction)
        alert.addAction(okAction)
        
        //알림창에 들어갈 뷰 컨트롤러
        let v = UIViewController()
        v.view.backgroundColor = UIColor.gray
        //알림창에 뷰 컨트롤러를 등록
        alert.setValue(v, forKey: "contentViewController")
        
        //알림창 화면에 표시
        self.present(alert, animated: false)
    }
  
```

<div>
    <img width="250" height="450" src="https://user-images.githubusercontent.com/30828236/54066767-49e91980-4279-11e9-9d87-984fce2eee96.png">
</div>

- - -

#### MapKit 활용한 Alert 띄우기

```swift
    @objc func mapAlert(_ sender: Any){
        //경고창 객체를 생성하고, ok 및 cancel 버튼을 추가한다.
        let alert = UIAlertController(title: nil, message: "여기가 맞습니까?", preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        
        alert.addAction(cancelAction)
        alert.addAction(okAction)
        
        
        //컨텐츠 뷰 영역에 들어갈 뷰 컨트롤러를 생성하고, 알림창에 등록한다.
        let contentVC = UIViewController()
        
        //뷰 컨트롤러에 맵킷 뷰를 추가한다.
        let mapKitView = MKMapView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        contentVC.view = mapKitView
        contentVC.preferredContentSize.height = 200
        
        //맵킷 설정
        //1.위치 정보를 설정한다. 위/경도를 사용한다.
        let pos = CLLocationCoordinate2D(latitude: 37.514322, longitude: 126.894623)
        
        //2.지도에서 보여줄 넓이.축척/ 숫자가 작을수록 좁은 범위를 확대시켜서 보여준다.
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
        
        //뷰 컨트롤러를 알림창의 컨텐츠 뷰 컨트롤러 속성에 등록한다.
        alert.setValue(contentVC, forKey: "contentViewController")
        
        self.present(alert, animated: false)
    }
```

<div>
    <img width = "250" height="450" src="https://user-images.githubusercontent.com/30828236/54067027-920a3b00-427d-11e9-88f3-658d80333834.png">
</div>


* 코드 분리 (MapKitViewController.swift)

```swift
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
```
* MapAlertViewController 수정


~~let contentVC = UIViewController()~~

```swift
let contentVC = MapKitViewController()
```

- - -

