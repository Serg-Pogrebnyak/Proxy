//
//  ImageViewController.swift
//  Proxy
//
//  Created by Sergey Pohrebnuak on 5/20/19.
//  Copyright © 2019 Sergey Pohrebnuak. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {

    @IBOutlet private weak var imageView: UIImageView!
    
    private let loader = ImageLoaderProxy(service: ImageLoader())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadImage()
    }
    
    @IBAction func refresh(_ sender: Any) {
        loadImage()
    }
    
    private func loadImage() {
        imageView.image = nil
        imageView.backgroundColor = UIColor(red:   .random(),
                                            green: .random(),
                                            blue:  .random(),
                                            alpha: 1.0)
        loader.loadImage { [weak self] (image) in
            guard image != nil else {
                print("error")
                return
            }
            
            DispatchQueue.main.async {
                self?.imageView.image = image!
            }
        }
    }
}

extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}
