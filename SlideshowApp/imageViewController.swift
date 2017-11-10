//
//  imageViewController.swift
//  SlideshowApp
//
//  Created by kota on 2017/11/09.
//  Copyright © 2017年 koichiro.kurokawa. All rights reserved.
//

import UIKit

extension UIImage{
    
    // Resizeするクラスメソッド.
    func ResizeÜIImage(width : CGFloat, height : CGFloat)-> UIImage!{
        
        // 指定された画像の大きさのコンテキストを用意.
        UIGraphicsBeginImageContext(CGSize(width: width, height: height))
        
        // コンテキストに自身に設定された画像を描画する.
        self.draw(in: CGRect(x: 0, y: 0, width: width, height: height))
        
        // コンテキストからUIImageを作る.
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        
        // コンテキストを閉じる.
        UIGraphicsEndImageContext()
        
        return newImage
    }
    
}

class imageViewController: UIViewController {

    
    let button = UIButton()
    
    @IBOutlet weak var kakudaiimageview: UIImageView!
    var image1: UIImage?
    override func viewDidLoad() {
        super.viewDidLoad()
        
                // Do any additional setup after loading the view.
        kakudaiimageview.image = image1
        
        
        // 背景を黒色に設定.
        self.view.backgroundColor = UIColor.black
        
        // リサイズ対象のUIImageを用意.
        let myImage = image1
        
        // リサイズ後のUIImageを用意.
        let resize = myImage?.ResizeÜIImage(width: 1000, height: 2000)
        
        // UIImageViewにリサイズ後のUIImageを設定.
        let myImageView = UIImageView(image: resize)
        
        myImageView.layer.position = CGPoint(x: self.view.frame.midX, y: self.view.frame.midY)
        
        self.view.addSubview(myImageView)
        
        
        button.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        // ボタンの設置座標とサイズを設定する.
        
        
        button.backgroundColor = UIColor.cyan
        // buttonのbackgroundcolorを指定
        
        
        button.setTitle("戻る", for: .normal)
        // 通常時のbuttonの文字を指定
        
        button.addTarget(self, action: #selector(changeColor(sender: )), for: .touchUpInside)
        // buttonにイベントを追加
        
        view.addSubview(button)
        // 実際にviewに表示する
        
    }
    
    @objc func changeColor(sender: Any) { // buttonの色を変化させるメソッド
        button.backgroundColor = UIColor.darkGray
       self.dismiss(animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
