//
//  ViewController.swift
//  响应者链条测试
//
//  Created by 星 Fan on 2018/2/22.
//  Copyright © 2018年 星 Fan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var red: redView = redView()
    var blue: blueView = blueView()
    let screenWidth = UIScreen.main.bounds.size.width
    let screenHeight = UIScreen.main.bounds.size.height
    lazy var onebut: UIButton = {
        let button = UIButton.init(frame: CGRect.init(x: 10, y: screenHeight-180, width: screenWidth, height: 40))
        button.titleLabel?.numberOfLines = 0
        button.setTitle("red加到view上，blue加到red上", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.tag = 0
        return button
    }()
    lazy var twobut: UIButton = {
        let button = UIButton.init(frame: CGRect.init(x: 10, y: screenHeight-135, width: screenWidth, height: 40))
        button.titleLabel?.numberOfLines = 0
        button.setTitle("red、blue都加到view上", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.tag = 1
        return button
    }()
    lazy var thirdbut: UIButton = {
        let button = UIButton.init(frame: CGRect.init(x: 10, y: screenHeight-90, width: screenWidth, height: 40))
        button.titleLabel?.numberOfLines = 0
        button.setTitle("red、blue都加到view上，red不接受事件传递", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.tag = 2
        return button
    }()
    lazy var fourbut: UIButton = {
        let button = UIButton.init(frame: CGRect.init(x: 10, y: screenHeight-45, width: screenWidth, height: 40))
        button.titleLabel?.numberOfLines = 0
        button.setTitle("red都加到view上，、blue加到red上，red不接受事件传递", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.tag = 3
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(onebut)
        self.view.addSubview(twobut)
        self.view.addSubview(thirdbut)
        self.view.addSubview(fourbut)
        onebut.addTarget(self, action: #selector(buttonClick(button:)), for: .touchUpInside)
        twobut.addTarget(self, action: #selector(buttonClick(button:)), for: .touchUpInside)
        thirdbut.addTarget(self, action: #selector(buttonClick(button:)), for: .touchUpInside)
        fourbut.addTarget(self, action: #selector(buttonClick(button:)), for: .touchUpInside)
    }
    @objc func buttonClick(button:UIButton){
        switch button.tag {
        case 0:
            testOne()
            break
        case 1:
            textTwo()
            break
        case 2:
            textThird()
            break
        case 3:
            textFour()
            break
        default:
            break
        }
    }
    @objc func redGes(){
        print("red点击相应")
    }
    @objc func blueGes(){
        print("blue点击相应")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //red加到view上，blue加到red上
    func testOne(){
        removeFromSuperView()
        red.backgroundColor = UIColor.red
        red.isUserInteractionEnabled = true
        red.frame = CGRect.init(x: 100, y: 100, width: 200, height: 200)
        self.view.addSubview(red)
        
        blue.backgroundColor = UIColor.blue
        blue.frame = CGRect.init(x: 50, y: 50, width: 100, height: 100)
        red.addSubview(blue)
        
        let redTapGes = UITapGestureRecognizer()
        redTapGes.addTarget(self, action: #selector(redGes))
        red.addGestureRecognizer(redTapGes)
        
        let blueTapGes = UITapGestureRecognizer()
        blueTapGes.addTarget(self, action: #selector(blueGes))
        blue.addGestureRecognizer(blueTapGes)
    }
    //red、blue都加到view上
    func textTwo(){
        removeFromSuperView()
        red.backgroundColor = UIColor.red
        red.isUserInteractionEnabled = true
        red.frame = CGRect.init(x: 100, y: 100, width: 200, height: 200)
        self.view.addSubview(red)
        
        blue.backgroundColor = UIColor.blue
        blue.frame = CGRect.init(x: 150, y: 150, width: 100, height: 100)
        self.view.addSubview(blue)
        
        let redTapGes = UITapGestureRecognizer()
        redTapGes.addTarget(self, action: #selector(redGes))
        red.addGestureRecognizer(redTapGes)
        
        let blueTapGes = UITapGestureRecognizer()
        blueTapGes.addTarget(self, action: #selector(blueGes))
        blue.addGestureRecognizer(blueTapGes)
    }
    //red、blue都加到view上，red不接受事件传递
    func textThird(){
        removeFromSuperView()
        red.backgroundColor = UIColor.red
        red.isUserInteractionEnabled = false
        red.frame = CGRect.init(x: 100, y: 100, width: 200, height: 200)
        self.view.addSubview(red)
        
        blue.backgroundColor = UIColor.blue
        blue.frame = CGRect.init(x: 150, y: 150, width: 100, height: 100)
        self.view.addSubview(blue)
        
        let redTapGes = UITapGestureRecognizer()
        redTapGes.addTarget(self, action: #selector(redGes))
        red.addGestureRecognizer(redTapGes)
        
        let blueTapGes = UITapGestureRecognizer()
        blueTapGes.addTarget(self, action: #selector(blueGes))
        blue.addGestureRecognizer(blueTapGes)
    }
    //red都加到view上，、blue加到red上，red不接受事件传递
    func textFour(){
        removeFromSuperView()
        red.backgroundColor = UIColor.red
        red.isUserInteractionEnabled = false
        red.frame = CGRect.init(x: 100, y: 100, width: 200, height: 200)
        self.view.addSubview(red)
        
        blue.backgroundColor = UIColor.blue
        blue.frame = CGRect.init(x: 50, y: 50, width: 100, height: 100)
        red.addSubview(blue)
        
        let redTapGes = UITapGestureRecognizer()
        redTapGes.addTarget(self, action: #selector(redGes))
        red.addGestureRecognizer(redTapGes)
        
        let blueTapGes = UITapGestureRecognizer()
        blueTapGes.addTarget(self, action: #selector(blueGes))
        blue.addGestureRecognizer(blueTapGes)
    }
    func removeFromSuperView(){
        red.removeFromSuperview()
        blue.removeFromSuperview()
    }
}
class Person:NSObject,NSCoding{
    var name: String = ""
    var age: Int = 0
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.name, forKey: "name")
        aCoder.encode(self.age, forKey: "age")
    }
    override init() {
        super.init()
    }
    required init?(coder aDecoder: NSCoder) {
       super.init()
        self.name = aDecoder.decodeObject(forKey: "name") as! String
        self.age = aDecoder.decodeObject(forKey: "age") as! Int
    }
    
    
}

