//
//  ViewController.swift
//  UIViewHit
//
//  Created by Maxim Subbotin on 14.06.2022.
//

import UIKit

class ViewController: UIViewController {
    var button = UIButton()
    var rectView = UIView()
    var disView = UIView()
    
    var circleView = UIView()
    
    override func loadView() {
        super.loadView()
        self.view = UIScrollView()
        self.view.backgroundColor = .white
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        button.backgroundColor = .blue
        button.frame = CGRect(x: 100, y: 100, width: 100, height: 50)
        button.addTarget(self, action: #selector(tap), for: .touchUpInside)
        self.view.addSubview(button)
        
        
        rectView.frame = CGRect(x: 100, y: 200, width: 200, height: 200)
        rectView.backgroundColor = .orange
        let colors: [UIColor] = [.yellow, .green, .gray, .cyan]
        for i in 0..<colors.count {
            let v = UIView()
            v.backgroundColor = colors[i]
            v.frame = CGRect(x: (i + 1) * 20, y: (i + 1) * 20, width: 200 - (i + 1) * 40, height: 200 - (i + 1) * 40)
            rectView.addSubview(v)
        }
        self.view.addSubview(rectView)
        
        disView.frame = CGRect(x: 100, y: 500, width: 200, height: 200)
        disView.backgroundColor = .blue
        let view1 = UIView(frame: CGRect(x: 20, y: 20, width: 120, height: 120))
        view1.backgroundColor = .green
        disView.addSubview(view1)
        let view2 = UIView(frame: CGRect(x: 200 - 120 - 20, y: 200 - 120 - 20, width: 120, height: 120))
        view2.backgroundColor = .yellow
        view2.isUserInteractionEnabled = false
        disView.addSubview(view2)
        self.view.addSubview(disView)
        
        circleView.frame = CGRect(x: 100, y: 800, width: 200, height: 200)
        circleView.backgroundColor = .orange
        circleView.layer.cornerRadius = 100
        for i in 0..<colors.count {
            let offset = (i + 1) * 20
            let w = 200 - 2 * offset
            let v = UIView()
            v.backgroundColor = colors[i]
            v.frame = CGRect(x: offset, y: offset, width: w, height: w)
            v.layer.cornerRadius = CGFloat(w / 2)
            circleView.addSubview(v)
        }
        self.view.addSubview(circleView)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if let view = button.myHitTest(.init(x: 10, y: 10), with: nil) {
            view.layer.borderColor = UIColor.red.cgColor
            view.layer.borderWidth = 1
        }
        if let view = button.hitTest(.init(x: 10, y: 10), with: nil) {
            view.layer.borderColor = UIColor.red.cgColor
            view.layer.borderWidth = 1
        }
        
        if let view = rectView.myHitTest(.init(x: 50, y: 50), with: nil) {
            view.layer.borderColor = UIColor.red.cgColor
            view.layer.borderWidth = 1
        }
        if let view = rectView.hitTest(.init(x: 50, y: 50), with: nil) {
            view.layer.borderColor = UIColor.red.cgColor
            view.layer.borderWidth = 1
        }
        
        if let view = disView.myHitTest(.init(x: 100, y: 100), with: nil) {
            view.layer.borderColor = UIColor.red.cgColor
            view.layer.borderWidth = 1
        }
        if let view = disView.hitTest(.init(x: 100, y: 100), with: nil) {
            view.layer.borderColor = UIColor.red.cgColor
            view.layer.borderWidth = 1
        }
        
        if let view = circleView.myHitTest(.init(x: 30, y: 30), with: nil) {
            view.layer.borderColor = UIColor.red.cgColor
            view.layer.borderWidth = 1
        }
        if let view = circleView.hitTest(.init(x: 30, y: 30), with: nil) {
            view.layer.borderColor = UIColor.red.cgColor
            view.layer.borderWidth = 1
        }
                
        (self.view as? UIScrollView)?.contentSize = CGSize(width: self.view.frame.width, height: 1100)
    }

    @objc func tap() {
        print("Tap")
    }
}

