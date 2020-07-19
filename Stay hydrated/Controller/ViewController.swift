//
//  ViewController.swift
//  Stay hydrated
//
//  Created by Tatsuki Ikeda on 2020/07/17.
//  Copyright © 2020 tatsuki.ikeda. All rights reserved.
//

import UIKit
import Charts
import SwiftyJSON
import Alamofire
import Foundation

class ViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource,UITextFieldDelegate {


    @IBOutlet weak var targetTextField: UITextField!
    @IBOutlet weak var waterIntakeButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var settingGoalButton: UIButton!
    @IBOutlet weak var fixButton: UIButton!
    @IBOutlet weak var CityPickerView: UIPickerView!
    @IBOutlet weak var intakeSelectPickerView: UIPickerView!
    @IBOutlet weak var barChartView: BarChartView!
    @IBOutlet weak var totalIntakeLabel: UILabel!
    @IBOutlet weak var goalTargeLabel: UILabel!
    @IBOutlet weak var maximumTemperatureLabel: UILabel!
    @IBOutlet weak var weatherLabel: UILabel!
    
    var graphHdata: [Int] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    
    let dataList:[(text: String, ryou: Int)] = [("手動入力", 0),("コップ半分 100ml", 100),("湯飲み1杯 120ml", 120),("コーヒーコップ1杯 150ml", 150),("コップ1杯 200ml", 200),("ペットボトル半分 250ml", 250),("ペットボトル１本 500ml", 500)]
    
    var inake = 0
    var tesut = 0
    var urlData = ""
    var cityData:[String] = ["011000","稚内"]
    var cityList = CityList()
    var date = ""
    var weather = ""
    var high = ""
    

    override func viewDidLoad() {
        super.viewDidLoad()

        getWeathrData(row: 0)
        print(high)
        
        
        configureObserver()
        CityPickerView.delegate = self
        CityPickerView.dataSource = self
        intakeSelectPickerView.delegate = self
        self.targetTextField.delegate = self
        
        
        waterIntakeButton.layer.cornerRadius = 30.0
        fixButton.layer.cornerRadius = 30.0
        settingGoalButton.layer.cornerRadius = 30.0
        startButton.layer.cornerRadius = 30.0
        
        
        print(high)
        
        
        
        
       Chart()
        // Do any additional setup after loading the view.
    }
    // Notificationを設定
    func configureObserver() {
          
      let notification = NotificationCenter.default

      notification.addObserver(
        self,
        selector: #selector(self.keyboardWillShow(notification:)),
        name: UIResponder.keyboardWillShowNotification,
        object: nil
      )
          
      notification.addObserver(
        self,
        selector: #selector(self.keyboardWillHide(notification:)),
        name: UIResponder.keyboardWillHideNotification,
        object: nil
      )
    }
    // Notificationを削除
    func removeObserver() {
      NotificationCenter.default.removeObserver(self)
    }
    
    
    // キーボードが現れたときにviewをずらす
    @objc func keyboardWillShow(notification: Notification?) {
      let rect = (notification?.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue
      let duration: TimeInterval? = notification?.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double
      UIView.animate(withDuration: duration!) {
        self.view.transform = CGAffineTransform(translationX: 0, y: -(rect?.size.height)!)
      }
    }
    // キーボードが消えたときにviewを戻す
    @objc func keyboardWillHide(notification: Notification?) {
      let duration: TimeInterval? = notification?.userInfo?[UIResponder.keyboardAnimationCurveUserInfoKey] as? Double
      UIView.animate(withDuration: duration!) {
        self.view.transform = CGAffineTransform.identity
      }
    }
    
    //returnが押されたときに呼ばれる.
       func textFieldShouldReturn(_ textField: UITextField) -> Bool {
           textField.resignFirstResponder()
           return true
       }
    
    
    
    //グラフ処理
    func Chart() {
        let entries = graphHdata.enumerated().map { BarChartDataEntry(x: Double(Int($0.offset)), y: Double($0.element)) }
        let dataSet = BarChartDataSet(entries: entries)
        dataSet.drawValuesEnabled = false
        let data = BarChartData(dataSet: dataSet)
        barChartView.data = data
    }
    

    //表示する行の数
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    //表示する配列の数
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 1{
            return cityList.list.count
        }else if pickerView.tag == 2{
            return dataList.count
        }else{
            return cityData.count
        }
//        return dataList.count
    }
    
    
    //データを返すメソッド
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == 1 {
            return cityList.list[row].name
        } else if pickerView.tag == 2 {
            return dataList[row].text
        }else{
            return cityList.list[row].name
        }
        
    }
    //データ選択時の呼び出しメソッド
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 1 {
            urlData = cityList.list[row].code
        }else if pickerView.tag == 2 {
            inake = dataList[row].ryou
        }
    }
    
    @IBAction func decisionButton(_ sender: Any) {
        getWeathrData(row: 0)
    }
    
    
    @IBAction func waterIntakeAction(_ sender: Any) {
        //現在時間取得
        let date = Date()
        let calendar = Calendar.current
        let Hour = calendar.component(.hour, from: date)
        print("\(Hour)")
        
        graphHdata[Hour] = graphHdata[Hour] + inake
            
        print(graphHdata)
        let result: Int = graphHdata.reduce(0) { $0 + $1}
       
        totalIntakeLabel.text = ("\(result) ml")
        Chart()
    }
    //グラフにデータを入力処理
    @IBAction func returnAction(_ sender: UIButton) {
        let date = Date()
        let calendar = Calendar.current
        let Hour = calendar.component(.hour, from: date)
        print("\(Hour)")
        if graphHdata[Hour] > inake {
            graphHdata[Hour] = graphHdata[Hour] - inake
                   print(graphHdata)
                   let result: Int = graphHdata.reduce(0) { $0 + $1}
                  
            totalIntakeLabel.text = ("\(result) ml")
        }
        Chart()
    }
    //目標合計水分量を設定
    @IBAction func goalTargeButton(_ sender: Any) {
        goalTargeLabel.text = "\(targetTextField.text!) ml"
    }
   
 override func didReceiveMemoryWarning() {
     super.didReceiveMemoryWarning()
 }
    
   override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
       
       self.view.endEditing(true)
   }
    
    //Weather Hacksから天気情報を取得
    private func getWeathrData(row: Int) {
        
        var url = "http://weather.livedoor.com/forecast/webservice/json/v1?city=\(urlData)"
        AF.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default).responseJSON {(response) in
        
        switch response.result {
            
            case .success:
                
            //jsonを取得
            let json:JSON = JSON(response.data as Any)
            
            //取得したjsonから、必要なデータを取り出す。
            let date = json["forecasts"][row]["date"].string
            let weather = json["forecasts"][row]["telop"].string
            let high = json["forecasts"][row]["temperature"]["max"]["celsius"].string
            
            
            if date != nil {
                self.date = String(date!.suffix(5))  //2025-04-10 -> 04-10
            } else {
                self.date = "No Data"
            }
            
            if weather != nil {
                self.weather = weather!
            } else {
                self.weather = "No Data"
            }

            if high != nil {
                self.high = "\(high!)°"
            } else {
                self.high = "No Data"
            }
            
            self.setWeatherData(row: 0)
            
        case .failure(let error):
        
        print(error)
            }
        }
    }
    //ラベルに反映
    private func setWeatherData(row: Int) {
            weatherLabel.text = weather
            maximumTemperatureLabel.text =  high
       
    }
        
    
    
    
}
