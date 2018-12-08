//
//  ViewController.swift
//  ImageZoomer
//
//  Created by MUKUL on 08/12/18.
//  Copyright © 2018 CoderWork. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var myScrollView: UIScrollView!
    var imgView:UIImageView = {
        let img   = UIImageView(image: UIImage(named: "2"))
        return img
    }()
    
    //MARK: ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupScrollView()
        self.setupScrollZoomScale()
        self.setScrollContentInsets()
        
    }
  
    //MARK: Setup ScrollView
    func setupScrollView() {
        myScrollView.contentSize = imgView.bounds.size
        myScrollView.delegate = self
        myScrollView.addSubview(imgView)
    }
    
    //MARK: Setup ScrollView Zoom Scale
    func setupScrollZoomScale() {
        
        let scrollBounds = myScrollView.bounds.size
        let imgBounds  = imgView.frame.size
        let widthAspect = scrollBounds.width / imgBounds.width
        let heightAspect =  scrollBounds.height / imgBounds.height
        let minZoomScale = min(widthAspect,heightAspect)
        let maxZoomScale = 3.0
        myScrollView.minimumZoomScale = minZoomScale
        myScrollView.maximumZoomScale = CGFloat(maxZoomScale)
        myScrollView.zoomScale = myScrollView.minimumZoomScale
    }
    
    //MARK:Set Scroll Content Insets
    func setScrollContentInsets() {
        let scrollBound = myScrollView.bounds.size
        let imgbounds =  imgView.frame.size
        let horizontalAxis = imgbounds.width < scrollBound.width ? (scrollBound.width - imgbounds.width) / 2.0 : 0.0
        let verticalAxis = imgbounds.height < scrollBound.height ? (scrollBound.height - imgbounds.height) / 2.0 : 0.0
        myScrollView.contentInset = UIEdgeInsets(top: verticalAxis, left: horizontalAxis, bottom: verticalAxis, right: horizontalAxis)
    }
    
}

//MARK: UIScrollView Delegates
extension ViewController:UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imgView
    }
    
}
