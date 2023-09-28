//
//  ViewController.swift
//  panGestureRecognizerTest
//
//  Created by Min Hu on 2023/9/28.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var carImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    // 拖曳動作
    @IBAction func panGesture(_ sender: UIPanGestureRecognizer) {
        // 宣告常數 translation 以獲取手勢的位移
        let translation = sender.translation(in: view)
        // 如果正在拖動
        if sender.state == .changed{
            // 將 X 軸與 Y 軸的位移加在車子中心位置上，成為新的變數
            var newX = carImageView.center.x + translation.x
            var newY = carImageView.center.y + translation.y
            

            // 定義限制範圍
            let minX: CGFloat = 306.0
            let minY: CGFloat = 80.0
            let maxY: CGFloat = 270.0
            // 限制 X 座標在只能在最小值位置的右邊
            newX = max(newX, minX)
            // 限制 Y 座標只能在最大值與最小值中間
            newY = max(newY, minY)
            newY = min(newY, maxY)
            // 將車子的中心定位在新位置
            carImageView.center = CGPoint(x: newX, y: newY)
            // 重置手勢的位移，下一次拖動從新的地方開始
            sender.setTranslation(.zero, in: view)
        }
    }
    
}

