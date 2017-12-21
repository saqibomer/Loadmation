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
    
    // Styles Enum
    /*
     * Each Style corresponds to a image.
     *
     */
    public enum Styles: String {
        case Circular = "circular.png"
        case Triangle = "triangle.png"
    }
    
    private var loadingState        : Bool!    // Loading State of view
    private var loadingStyle        : String?  // Loaading Style
    private var loadingContainer    : UIView?  // Parent View
    private var containerFrame      : CGRect?  // Frame
    fileprivate var loadingImgView  : UIImageView! // Serves as loading image view
    
    @discardableResult public init(parent: UIView, style: String, frame: CGRect) {
        
        self.loadingStyle       = style
        self.loadingState       = false
        self.loadingContainer   = parent
        self.containerFrame     = frame
        self.startAnimation()
    }
    
    
    func startCircularAnimation() {
        
        let imageName = Styles.Circular.rawValue.appending(".png")
        let image = UIImage(named: imageName)
        
        let loadmationImgView = LoadmationImageView(frame: (self.loadingContainer?.frame)!, image: image!)
        self.loadingContainer?.layoutIfNeeded()
        loadmationImgView.contentMode = .scaleAspectFit
        self.loadingContainer?.addSubview(loadmationImgView)
        self.loadingContainer?.bounds = self.containerFrame!
        self.rotateAnimation(view: self.loadingContainer!)
        
    }
    
    
    // MARK: - Start Animation
    
    func startAnimation() {
        if !self.loadingState {
            let loadStyle = Styles.Circular.rawValue
            
            switch loadStyle {
            case Styles.Circular.rawValue:
                self.startCircularAnimation()
            default:
                print("No Style Selected")
            }
        }
    }
    
    
    // MARK: - Start loading animation
    func rotateAnimation(view:UIView,duration: CFTimeInterval = 1.0) {
        
        let rotateAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotateAnimation.fromValue = 0.0
        rotateAnimation.toValue = CGFloat(.pi * 2.0)
        rotateAnimation.duration = duration
        rotateAnimation.repeatCount = Float.greatestFiniteMagnitude;
        
        view.layer.add(rotateAnimation, forKey: nil)
        view.isHidden = false
    }
    
    // MARK: - Stop loading animation
    
    func stopLoadingAnimation(view : UIView)  {
        view.layer.removeAnimation(forKey: "transform.rotation")
        view.isHidden = true
    }
    
}

