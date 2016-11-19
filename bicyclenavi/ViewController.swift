//
//  ViewController.swift
//  bicyclenavi
//
//  Created by 田中潤 on 2016/11/18.
//  Copyright © 2016年 田中潤. All rights reserved.
import UIKit
import GoogleMaps


class ViewController: UIViewController,GMSMapViewDelegate,CLLocationManagerDelegate{
    // GMSMapView *_mapView;
    // CLLocationManager *_locationManager;
    override func viewDidLoad() {
        
        var locationManager: CLLocationManager
        
        super.viewDidLoad()
        let camera = GMSCameraPosition.camera(withLatitude: 35.68154,                                                      longitude: 139.752498, zoom: 13)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        mapView.isMyLocationEnabled = true
        self.view = mapView
        
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2DMake(35.68154,139.752498)
        marker.title = "The Imperial Palace"
        marker.snippet = "Tokyo"
        marker.map = mapView
        locationManager = CLLocationManager()
        
        // 位置情報サービスが利用できるかどうかをチェック
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            // 測位開始
            locationManager.startUpdatingLocation()
        } else {
            print("Location services not available.")
            
        }
    }
    
    



// 位置情報更新時
//    func locationManager(manager: CLLocationManager, didUpdateToLocation newLocation: CLLocation, fromLocation oldLocation: CLLocation) {
//        mapView.animateToLocation(newLocation.coordinate())
//        //緯度・経度を出力
//        print("didUpdateToLocation latitude=\(newLocation.coordinate.latitude), longitude=\(newLocation.coordinate.longitude)")
//    }

// 測位失敗時や、位置情報の利用をユーザーが「不許可」とした場合などに呼ばれる
func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
    print("didFailWithError")
}

override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
}

}

//class ViewController: UIViewController, CLLocationManagerDelegate {
//
//
//    var myLocationManager: CLLocationManager!
//
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // // 地図の表示
//
//        let camera = GMSCameraPosition.camera(withLatitude: -33.86,                                                      longitude: 151.20, zoom: 6)
//        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
//        mapView.isMyLocationEnabled = true
//        mapView.settings.myLocationButton = true
//        self.view = mapView
//
//
//
//        myLocationManager = CLLocationManager()
//        // 位置情報サービスが利用できるかどうかをチェック
//        if CLLocationManager.locationServicesEnabled() {
//            myLocationManager.delegate = self
//            // 測位開始
//            myLocationManager.startUpdatingLocation()
//        } else {
//            print("Location services not available.")
//
//        }
//    }

//    // 位置情報更新時
//    func locationManager(manager: CLLocationManager, didUpdateToLocation newLocation: CLLocation, fromLocation oldLocation: CLLocation) {
//        //緯度・経度を出力
//        print("didUpdateToLocation latitude=\(newLocation.coordinate().latitude), longitude=\(newLocation.coordinate().longitude)")
//    }
//
//    // 測位失敗時や、位置情報の利用をユーザーが「不許可」とした場合などに呼ばれる
//    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
//        print("didFailWithError")
//    }
//
//    func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//
//class ViewController: UIViewController, CLLocationManagerDelegate {
//
//
//
//    var myLocationManager: CLLocationManager!
//
//
//    @IBAction func longTapMapView(_ sender: UILongPressGestureRecognizer) {
//    }
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//           }
//


//        let camera = GMSCameraPosition.camera(withLatitude: 35.68154,                                                      longitude: 139.752498, zoom: 13)
//        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
//        mapView.isMyLocationEnabled = true
//        self.view = mapView
//
//        let marker = GMSMarker()
//        marker.position = CLLocationCoordinate2DMake(35.68154,139.752498)
//        marker.title = "The Imperial Palace"
//        marker.snippet = "Tokyo"
//        marker.map = mapView



//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
// Dispose of any resources that can be recreated.






//import UIKit
//import GoogleMaps
//import CoreLocation
//
//// CLLocationManagerDelegateを継承しなければならない
//class ViewController: UIViewController, CLLocationManagerDelegate {
//
//
//
//
//
//
//    @IBAction func longTapMapView(_ sender: UILongPressGestureRecognizer) {
//    }
//
//    // 現在地の位置情報の取得にはCLLocationManagerを使用
//    var lm: CLLocationManager!
//    // 取得した緯度を保持するインスタンス
//    var latitude: CLLocationDegrees!
//    // 取得した経度を保持するインスタンス
//    var longitude: CLLocationDegrees!
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // フィールドの初期化
//        lm = CLLocationManager()
//        longitude = CLLocationDegrees()
//        latitude = CLLocationDegrees()
//
//        // CLLocationManagerをDelegateに指定
//        lm.delegate = self
//
//        // 位置情報取得の許可を求めるメッセージの表示．必須．
//        lm.requestAlwaysAuthorization()
//        // 位置情報の精度を指定．任意，
//        // lm.desiredAccuracy = kCLLocationAccuracyBest
//        // 位置情報取得間隔を指定．指定した値（メートル）移動したら位置情報を更新する．任意．
//        // lm.distanceFilter = 1000
//
//        // GPSの使用を開始する
//        lm.startUpdatingLocation()
//    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//    }
//
//    /* 位置情報取得成功時に実行される関数 */
//    func locationManager(manager: CLLocationManager, didUpdateToLocation newLocation: CLLocation, fromLocation oldLocation: CLLocation){
//        // 取得した緯度がnewLocation.coordinate.longitudeに格納されている
//        latitude = newLocation.coordinate.latitude
//        // 取得した経度がnewLocation.coordinate.longitudeに格納されている
//        longitude = newLocation.coordinate.longitude
//        // 取得した緯度・経度をLogに表示
//        NSLog("latiitude: \(latitude) , longitude: \(longitude)")
//
//        // GPSの使用を停止する．停止しない限りGPSは実行され，指定間隔で更新され続ける．
//        // lm.stopUpdatingLocation()
//    }
//
//    /* 位置情報取得失敗時に実行される関数 */
//    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
//        // この例ではLogにErrorと表示するだけ．
//        NSLog("Error")
//    }
//
//}

//
//import UIKit
//
//class ViewController: UIViewController {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view, typically from a nib.
//    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//
//
//}
//
