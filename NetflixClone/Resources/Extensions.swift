//
//  Extensions.swift
//  NetflixClone
//
//  Created by Praval Gautam on 11/02/24.
//

import Foundation

extension String{
    func capitalizeFirstLetter()->String{
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
        
    }
}
