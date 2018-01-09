//
//  LoadmationView.swift
//  loadmation
//
//  Created by Saqib Omer on 05/12/2017.
//  Copyright © 2017 KaboomLab. All rights reserved.
//

import UIKit

class LoadmationImageView: UIImageView {
    
    // MARK: - Properties
    private var img : UIImage?
    
    
    public init(frame: CGRect , image : UIImage) {
        super.init(frame: frame)
        self.image = image
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func updateConstraints() {
        super.updateConstraints()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    
    
    
}

public class Loadmation {
    
    // Style Enum
    /*
     * Each Style corresponds to a image.
     *
     */
    public enum Style: String {
        case circular
        case circular2
        case arrow
//        case pulse
        
        var imageFromStyle: String {
            return self.rawValue.appending(".png")
        }
    }
    
    private var loadingState        : Bool!    // Loading State of view
    private var loadingStyle        : Style?  // Loaading Style
    private var loadingContainer    : UIView?  // Parent View
    private var containerFrame      : CGRect?  // Frame
    fileprivate var loadingImgView  : UIImageView! // Serves as loading image view
    var loadmationImgView : LoadmationImageView?
    @discardableResult public init(parent: UIView, style: Loadmation.Style, frame: CGRect) {
        
        self.loadingStyle       = style
        self.loadingState       = false
        self.loadingContainer   = parent
        self.containerFrame     = frame
    }
    
    // MARK: - Circular Animation
    func startCircularAnimation() {
        
        let imageName = self.loadingStyle!.imageFromStyle
        
        
        let frameworkBundle = Bundle(for: Loadmation.self)
        let bundleURL = frameworkBundle.resourceURL?.appendingPathComponent("Loadmation.bundle")
        let resourceBundle = Bundle(url: bundleURL!)
        let image = UIImage(named: imageName, in: resourceBundle, compatibleWith: nil)
        
        loadmationImgView = LoadmationImageView(frame: (self.loadingContainer?.frame)!, image: image!)
        
        loadmationImgView?.contentMode             = .scaleAspectFit
        self.loadingContainer?.layoutIfNeeded()
        
        self.loadingContainer?.addSubview(loadmationImgView!)
        self.loadingContainer?.layer.cornerRadius  = (self.loadingContainer?.layer.frame.width)! / 2
        self.loadingContainer?.clipsToBounds       = true
        self.loadingContainer?.layoutIfNeeded()
        self.rotateAnimation(view: self.loadmationImgView!)
        self.loadingState = true
        
    }
    
    // MARK: - Pulse Animation
    
//    func startPulseAnimation() {
//
//        let baseViewPulse = CABasicAnimation(keyPath: "opacity")
//        baseViewPulse.duration = 1.5
//        baseViewPulse.fromValue = 0.7
//        baseViewPulse.toValue = 0.2
//        baseViewPulse.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
//        baseViewPulse.autoreverses = true
//        baseViewPulse.repeatCount = Float.greatestFiniteMagnitude
//
//        let containerPulse = CABasicAnimation(keyPath: "opacity")
//        containerPulse.duration = 1.0
//        containerPulse.fromValue = 0.9
//        containerPulse.toValue = 0.5
//        containerPulse.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
//        containerPulse.autoreverses = true
//        containerPulse.repeatCount = Float.greatestFiniteMagnitude
//
//        self.loadingContainer?.bounds              = self.containerFrame!
//        self.loadingContainer?.layer.cornerRadius  = (self.loadingContainer?.layer.frame.width)! / 2
//        self.loadingContainer?.clipsToBounds       = true
//        self.loadingContainer?.layer.add(containerPulse, forKey: nil)
//        let circle = UIView(frame: self.containerFrame!)
//        circle.frame = CGRect(x: ((self.containerFrame?.width)! / 2) - 30 , y: circle.frame.origin.y + 30, width: 30, height: 30)
//        circle.layer.cornerRadius  = circle.layer.frame.width / 2
//        circle.backgroundColor = UIColor.red
//        circle.clipsToBounds = true
//
//
//
//        let darkBlur = UIBlurEffect(style: UIBlurEffectStyle.dark)
//        let blurView = UIVisualEffectView(effect: darkBlur)
//
//        blurView.frame = circle.bounds
//
//        circle.addSubview(blurView)
//        self.loadingContainer?.addSubview(circle)
//        circle.layer.add(baseViewPulse, forKey: nil)
//
//
//    }
    
    
    // MARK: - Start Animation
    
    open func startAnimation() {
        
        self.loadingContainer?.isHidden = false
        if !self.loadingState {
            print("No Style Selected. Using default circular animation")
            self.startCircularAnimation()

            
        } else {
            // TO-Do Add More Styles
            
        }
    }
    
    
    // MARK: - Start loading animation
    func rotateAnimation(view:UIView,duration: CFTimeInterval = 1.5) {
        
        let rotateAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotateAnimation.fromValue = 0.0
        rotateAnimation.toValue = CGFloat(.pi * 2.0)
        rotateAnimation.duration = duration
        rotateAnimation.repeatCount = Float.greatestFiniteMagnitude;
        
        view.layer.add(rotateAnimation, forKey: nil)
        
    }
    
    // MARK: - Stop loading animation
    
    open func stopLoadingAnimation()  {
        self.loadmationImgView?.layer.removeAnimation(forKey: "transform.rotation")
        self.loadmationImgView?.removeFromSuperview()
        self.loadingContainer?.isHidden = true
        self.loadingState = false
    }
    
}


