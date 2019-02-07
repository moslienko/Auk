//
//  ViewController.swift
//  aukDemo
//
//  Created by Pavel Moslienko on 07/02/2019.
//  Copyright © 2019 Pavel Moslienko. All rights reserved.
//

import UIKit
import Auk

class ViewController: UIViewController, UIScrollViewDelegate {
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self
        
        let serverUrl = "https://www.apple.com/newsroom/images/product/ipad/standard/"
        let images = ["ipad-pro_next-gen_10302018_big.jpg.large_2x.jpg", "ipad-pro_11-inch_12inch_10302018_inline.jpg.large_2x.jpg","ipad-pro_smart-keyboard-apple-pencil_10302018_inline.jpg.large_2x.jpg", "ipad-pro_edge-to-edge-retina_10302018_inline.jpg.large_2x.jpg", "ipad-pro_hand-5mm_10302018_inline.jpg.large_2x.jpg", "ipad-pro_gaming-a12x-chip_10302018_inline.jpg.large_2x.jpg", "ipad-pro_large-display_10302018_inline.jpg.large_2x.jpg"]
        
        scrollView.auk.settings.placeholderImage = UIImage(named: "great_auk_placeholder.png")
        scrollView.auk.settings.errorImage = UIImage(named: "error_image.png")
        
        scrollView.auk.settings.preloadRemoteImagesAround = images.count
        
        for image in images {
            //Add remote image
            scrollView.auk.show(url: "\(serverUrl)\(image)")
        }
        
        //Add local image
        scrollView.auk.show(image: UIImage(named: "great_auk_placeholder")!)
    }
    
}

