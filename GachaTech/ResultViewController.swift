//
//  ResultViewController.swift
//  GachaTech
//
//  Created by 鈴木ましろ on 2022/05/11.
//

import UIKit

class ResultViewController: UIViewController {
    
    //背景画像
    @IBOutlet var haikeiImageView: UIImageView!
    //モンスターの画像
    @IBOutlet var monsterImageView: UIImageView!
    //モンスターの名前
    @IBOutlet var nameLabel: UILabel!
    
    //背景画像を保存しておく場所
    var haikeiArray: [UIImage]!
    //モンスター画像を保存しておく場所
    var monsterArray: [UIImage]!
    //モンスターの名前を配列に入れる
    var monsterNameArray = ["ねこ", "さかな", "ざりがに", "てんし", "かめん", "どらごん", "まほうつかい", "れあどらごん", "かみ", "れお"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //0~9の間でランダムに数字を発生させる
        let number = Int.random(in: 0..<10)
        //画像を10個を配列に入れる
        monsterArray = [UIImage(named: "monster001.png")!,
                        UIImage(named: "monster002.png")!,
                        UIImage(named: "monster003.png")!,
                        UIImage(named: "monster004.png")!,
                        UIImage(named: "monster005.png")!,
                        UIImage(named: "monster006.png")!,
                        UIImage(named: "monster007.png")!,
                        UIImage(named: "monster008.png")!,
                        UIImage(named: "monster009.png")!,
                        UIImage(named: "monster010.png")!]
        //ランダムに出た数字の配列を取り出す
        monsterImageView.image = monsterArray[number]
        nameLabel.text = monsterNameArray[number]
        
        //画像3個を配列に入れる
        haikeiArray = [UIImage(named: "bg_blue@2x.png")!,
                       UIImage(named: "bg_gold@2x.png")!,
                       UIImage(named: "bg_red@2x.png")!]
        if number == 9{
            haikeiImageView.image = haikeiArray[2]
        } else if number == 7 {
            haikeiImageView.image = haikeiArray[1]
        } else {
            haikeiImageView.image = haikeiArray[0]
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        //animationの中でもtransformを設定
        let animation = CABasicAnimation(keyPath: "transform")
        //アニメーション開始の場所(数値)
        animation.fromValue = NSNumber(value: 0)
        //アニメーション終了の場所(数値)
        animation.toValue = NSNumber(value: 2 * Double.pi)
        //Z軸を中心にアニメーション
        animation.valueFunction = CAValueFunction(name: CAValueFunctionName.rotateZ)
        //アニメーションの速度
        animation.duration = 5
        //アニメーションを何回繰り返すか
        //今回は制限なしで設定(無限にアニメーションを繰り返す
        animation.repeatCount = Float.infinity
        //背景をアニメーションさせる
        haikeiImageView.layer.add(animation, forKey: nil)
    }
    
    //戻るボタン
    @IBAction func modoru() {
        self.dismiss(animated: true, completion: nil)
    }

}
