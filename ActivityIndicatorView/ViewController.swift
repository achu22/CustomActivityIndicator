//
//  ViewController.swift
//  ActivityIndicatorView
//
//  Created by Ashish Kumar Alugaddala on 7/29/17.
//  Copyright © 2017 Ashish Kumar Alugaddala. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        showActivityView()
        
        Timer.scheduledTimer(timeInterval: 10.0, target: self, selector: #selector(stopActivityView), userInfo: nil, repeats: false)
    }

    func stopActivityView() {
        hideActivityView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


var activityIndicatorView : UIView!
var alphaView: UIView!

extension UIViewController {    
    /**
     Displays an Activity Indicator to show loading
     */
    func showActivityView() {
        addActivityIndicatorView()
    }
    
    /**
     Hide the Activity Indicator
     */
    func hideActivityView() {
        activityIndicatorView?.removeFromSuperview()
        alphaView?.removeFromSuperview()
        
        self.view.isUserInteractionEnabled = true
        UIAccessibilityPostNotification(UIAccessibilityScreenChangedNotification, nil)
        
    }
    
    func addActivityIndicatorView() {
        activityIndicatorView = activityIndicatorView ?? self.createActivityView()
        alphaView = alphaView ?? self.createAlphaView()
        
        alphaView.alpha = 0.2
        
        self.view.addSubview(alphaView)
        self.view.addSubview(activityIndicatorView)
        self.view.isUserInteractionEnabled = false
        UIAccessibilityPostNotification(UIAccessibilityLayoutChangedNotification, activityIndicatorView)
        
    }
    
    func createActivityView() -> UIView {
        let activityHolderWidthHeight : CGFloat = 80.0
        let activityView = UIView(frame: CGRect(x: 0, y: 0, width: activityHolderWidthHeight, height: activityHolderWidthHeight))
        activityView.center = self.view.center
        activityView.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        activityView.layer.cornerRadius = 8.0
        
        let activityIndicatorWidthHeight : CGFloat = 45
        let centerPoint = CGPoint(x: activityView.bounds.midX, y: activityView.bounds.midY)
        
        let activityIndicator : UIActivityIndicatorView = UIActivityIndicatorView()
        activityIndicator.frame = CGRect(x: 0, y: 0, width: activityIndicatorWidthHeight, height: activityIndicatorWidthHeight)
        activityIndicator.center = centerPoint
        activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.whiteLarge
        
        activityIndicator.startAnimating()
        
        activityView.addSubview(activityIndicator)
        
        return activityView
    }
    
    
    func createAlphaView () -> UIView {
        let alphaView = UIView(frame: UIScreen.main.bounds)
        alphaView.backgroundColor = UIColor.black
        alphaView.alpha = 0.2
        return alphaView
    }


}

