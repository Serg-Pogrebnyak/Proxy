//
//  ImageLoadProtocol.swift
//  Proxy
//
//  Created by Sergey Pohrebnuak on 5/20/19.
//  Copyright © 2019 Sergey Pohrebnuak. All rights reserved.
//

import UIKit

protocol ImageLoadProtocol {
    func loadImage(compleation: @escaping (UIImage?) -> Void)
}
