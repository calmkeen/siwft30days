//
//  ViewController.swift
//  Project09 - ImageScroller
//
//  Created by calmkeen on 2022/06/03.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var showImage: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var nsTopLocation: NSLayoutConstraint!
    @IBOutlet weak var nsBottomLocation: NSLayoutConstraint!
    @IBOutlet weak var nsLeadingLocation: NSLayoutConstraint!
    @IBOutlet weak var nsTraillingLocation: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    override var preferredStatusBarStyle : UIStatusBarStyle{
        return UIStatusBarStyle.default
    }
    
    fileprivate func updateMinZoomScaleForSize(_ size: CGSize){
        let widthScale = size.width / showImage.bounds.width
        let heightScale = size.height / showImage.bounds.height
        let minScale = min(widthScale,heightScale)
        
        scrollView.minimumZoomScale = minScale
        scrollView.maximumZoomScale = 3.0
        scrollView.zoomScale = minScale
    }

    func scrollViewDidZoom(_ scrollView: UIScrollView){
        updateViewConstraintsForSize(view.bounds.size)
    }
    fileprivate func updateViewConstraintsForSize(_ size: CGSize){
        
        
        let yOffset = max(0,(size.height - showImage.frame.height) / 2)
        nsTopLocation.constant = yOffset
        nsBottomLocation.constant = yOffset
        let xOffset = max(0, (size.width - showImage.frame.width) / 2)
        nsLeadingLocation.constant = xOffset
        nsTraillingLocation.constant = xOffset
        view.layoutIfNeeded()
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        updateMinZoomScaleForSize(view.bounds.size)
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return showImage
    }
    
    

}

