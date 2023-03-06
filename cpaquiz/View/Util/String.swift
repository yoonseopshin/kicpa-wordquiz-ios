//
//  String.swift
//  cpaquiz
//
//  Created by yoonseop on 2023/03/07.
//

import Foundation

extension Optional where Wrapped == String {
    var isNilOrEmpty: Bool {
        return self?.trimmingCharacters(in: .whitespaces).isEmpty ?? true
    }
}
