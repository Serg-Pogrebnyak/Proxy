//
//  ImageLoader.swift
//  Proxy
//
//  Created by Sergey Pohrebnuak on 5/20/19.
//  Copyright © 2019 Sergey Pohrebnuak. All rights reserved.
//

import UIKit

class ImageLoader: ImageLoadProtocol {
    
    fileprivate let imageURL = "http://www.effigis.com/wp-content/themes/effigis_2014/img/GeoEye_GeoEye1_50cm_8bit_RGB_DRA_Mining_2009FEB14_8bits_sub_r_15.jpg"
    //fileprivate let imageURL = "http://swiftbook.ru/sites/default/files/logo31200.png"
    
    func loadImage(compleation: @escaping (UIImage?) -> Void) {
        let config = URLSessionConfiguration.default
        config.requestCachePolicy = .reloadIgnoringLocalAndRemoteCacheData
        config.urlCache = nil
        
        let session = URLSession.init(configuration: config)
        session.dataTask(with: URL(string: imageURL)!) { (data, response, error) in
            if error != nil {
                compleation(nil)
            } else {
                compleation(UIImage(data: data!))
            }
        }.resume()
    }
}
