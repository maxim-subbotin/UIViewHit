//
//  UIViewHitTests.swift
//  UIViewHitTests
//
//  Created by Maxim Subbotin on 14.06.2022.
//

import XCTest
import UIViewHit

class UIViewHitTests: XCTestCase {

    func testViewInView() throws {
        let rectView = UIView()
        rectView.backgroundColor = .orange
        let colors: [UIColor] = [.yellow, .green, .gray, .cyan]
        for i in 0..<colors.count {
            let v = UIView()
            v.backgroundColor = colors[i]
            v.frame = CGRect(x: (i + 1) * 20, y: (i + 1) * 20, width: 200 - (i + 1) * 40, height: 200 - (i + 1) * 40)
            rectView.addSubview(v)
        }
        
        var x = 10
        var y = 10
        for _ in 0..<5 {
            let p = CGPoint(x: x, y: y)
            let hitView = rectView.hitTest(p, with: nil)
            let myHitView = rectView.myHitTest(p, with: nil)
            assert(hitView === myHitView, "My hit implementation returns wrong view")
            x += 20
            y += 20
        }
    }
    
    func testChaoticViews() throws {
        let w = 1000
        let h = 1000
        let mainView = UIView(frame: CGRect(x: 10, y: 10, width: w, height: h))
        let n = 30
        for _ in 0..<n {
            let x = Int.random(in: 0..<800)
            let y = Int.random(in: 0..<800)
            let w = Int.random(in: 1..<(1000 - x))
            let h = Int.random(in: 1..<(1000 - y))
            let count = Int.random(in: 0..<10)
            let childView = generateView(rect: CGRect(x: x, y: y, width: w, height: h), subviewsCount: count, randomFlags: false)
            mainView.addSubview(childView)
        }
        for i in 0..<100 {
            for j in 0..<100 {
                let p = CGPoint(x: i * 10, y: j * 10)
                let hitView = mainView.hitTest(p, with: nil)
                let myHitView = mainView.myHitTest(p, with: nil)
                assert(hitView === myHitView, "My hit implementation returns wrong view")
            }
        }
    }
    
    func testChaoticViewsWithFlags() throws {
        let w = 1000
        let h = 1000
        let mainView = UIView(frame: CGRect(x: 10, y: 10, width: w, height: h))
        let n = 100
        for _ in 0..<n {
            let x = Int.random(in: 0..<800)
            let y = Int.random(in: 0..<800)
            let w = Int.random(in: 1..<(1000 - x))
            let h = Int.random(in: 1..<(1000 - y))
            let count = Int.random(in: 0..<10)
            let childView = generateView(rect: CGRect(x: x, y: y, width: w, height: h), subviewsCount: count, randomFlags: false)
            mainView.addSubview(childView)
        }
        for i in 0..<100 {
            for j in 0..<100 {
                let p = CGPoint(x: i * 10, y: j * 10)
                let hitView = mainView.hitTest(p, with: nil)
                let myHitView = mainView.myHitTest(p, with: nil)
                assert(hitView === myHitView, "My hit implementation returns wrong view")
            }
        }
    }
    
    func generateView(rect: CGRect, subviewsCount: Int, randomFlags: Bool) -> UIView {
        let view = UIView(frame: rect)
        for _ in 0..<subviewsCount {
            let x = Int.random(in: 0..<Int(rect.width * 0.8))
            let y = Int.random(in: 0..<Int(rect.height * 0.8))
            let w = Int.random(in: 1..<(Int(rect.width) - x))
            let h = Int.random(in: 1..<(Int(rect.height) - y))
            let v = UIView(frame: CGRect(x: x, y: y, width: w, height: h))
            if randomFlags {
                v.isHidden = Bool.random()
                v.isUserInteractionEnabled = Bool.random()
                v.alpha = Int.random(in: 0..<10) < 1 ? 0.0 : 1
            }
            view.addSubview(v)
        }
        return view
    }

}
