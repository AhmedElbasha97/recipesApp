//
//  String+Trimming.swift
//  recipesApp
//
//  Created by bido elbasha on 02/08/2021.
//  Copyright © 2021 ahmed elbasha. All rights reserved.
//

import Foundation

extension String {
    var trimmed: String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}
