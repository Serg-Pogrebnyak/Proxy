//
//  ImageLoaderProxy.swift
//  Proxy
//
//  Created by Sergey Pohrebnuak on 5/20/19.
//  Copyright © 2019 Sergey Pohrebnuak. All rights reserved.
//

import UIKit

var cacheData: UIImage?

class ImageLoaderProxy: ImageLoadProtocol {
    private let service: ImageLoadProtocol
    
    init(service: ImageLoadProtocol) {
        self.service = service
    }
    
    func loadImage(compleation: @escaping (UIImage?) -> Void) {
        if cacheData == nil {
            service.loadImage { (image) in
                compleation(image)
                cacheData = image
            }
        } else {
            compleation(cacheData)
        }
    }
}
