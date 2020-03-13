//
//  String+Extension.swift
//  common
//
//  Created by lmcmz on 13/3/20.
//  Copyright © 2020 DAOstack. All rights reserved.
//

import Foundation

extension String {
    func addHexPrefix() -> String {
        if !hasPrefix("0x") {
            return "0x" + self
        }
        return self
    }
}

