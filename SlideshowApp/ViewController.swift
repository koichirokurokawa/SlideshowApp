//
//  ViewController.swift
//  SlideshowApp
//
//  Created by kota on 2017/10/22.
//  Copyright © 2017年 koichiro.kurokawa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
        
        @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func returntTop(segue: UIStoryboardSegue){
        
    }
    
    @IBAction func onTapImage(_ sender: Any) {
        
        // セグエを使用して画面を遷移
        performSegue(withIdentifier: "result", sender: nil)
        
        //timerを破棄する.
        timer?.invalidate()
    }
    @IBOutlet weak var susumu: UIButton!
    @IBOutlet weak var modoru: UIButton!
    /// 一定の間隔で処理を行うためのタイマー
    var timer: Timer?
    
        
    @IBAction func playstop(_ sender: Any) {
        
        
        //timerが動いてるなら.
        if timer?.isValid == true {
            
            //timerを破棄する.
            timer?.invalidate()
            
             modoru.isEnabled = true
            
            susumu.isEnabled = true
            
        }
        else{
            
            //timerを生成する.
            timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(onTimer), userInfo: nil, repeats: true)
            
            
            // 無効化
            modoru.isEnabled = false
            susumu.isEnabled = false
        
        }
    }
    
    
    
    @IBAction func pre(_ sender: Any) {
    
            
            // 表示している画像の番号を1減らす
            dispImageNo -= 1
            
            // 表示している画像の番号を元に画像を表示する
            displayImage()
        }
        
    @IBAction func next(_ sender: Any) {
    
            
            // 表示している画像の番号を1増やす
            dispImageNo += 1
            
            // 表示している画像の番号を元に画像を表示する
            displayImage()
        }
        
        /// 表示している画像の番号
        var dispImageNo = 0
        
        /// 表示している画像の番号を元に画像を表示する
    /// 表示している画像の番号を元に画像を表示する
    func displayImage() {
        
        // 画像の名前の配列
        let imageNameArray = [
            "kekka1.jpg",
            "kekka2.jpg",
            "sentaku.jpg",
            ]
        
        // 画像の番号が正常な範囲を指しているかチェック
        
        // 範囲より下を指している場合、最後の画像を表示
        if dispImageNo < 0 {
            dispImageNo = 2
        }
        
        // 範囲より上を指している場合、最初の画像を表示
        if dispImageNo > 2 {
            dispImageNo = 0
        }
        
        // 表示している画像の番号から名前を取り出し
        let name = imageNameArray[dispImageNo]
        
        // 画像を読み込み
        let image = UIImage(named: name)
        
        // Image Viewに読み込んだ画像をセット
        imageView.image = image
    }        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            let image = UIImage(named: "kekka1.jpg")
            imageView.image = image
            
            
            //タイマーを設定
                timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(onTimer), userInfo: nil, repeats: true)
            
            // 無効化
            modoru.isEnabled = false
            susumu.isEnabled = false
            
           
        }
    
    
    
    
    /// NSTimerによって、一定の間隔で呼び出される関数
    func onTimer(timer: Timer) {
        
        // 関数が呼ばれていることを確認
        print("onTimer")
        
        // 表示している画像の番号を1増やす
        dispImageNo += 1
        
        // 表示している画像の番号を元に画像を表示する
        displayImage()
    }
    
    // タイマーを止めたり動かしたりするメソッド
    
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let imageViewController = segue.destination as! imageViewController
        imageViewController.image1 = imageView.image    }
    
    
    
    
}
