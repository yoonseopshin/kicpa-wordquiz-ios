//
//  Dday.swift
//  cpaquiz
//
//  Created by yoonseop on 2023/03/02.
//

import Foundation

func calculateDDay(targetDateString: String) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd"
    guard let targetDate = dateFormatter.date(from: targetDateString) else { return "" }
    
    let today = Date()
    let calendar = Calendar.current
    let components = calendar.dateComponents([.day], from: today, to: targetDate)
    
    let dDay = components.day! + 1
    
    if dDay > 0 {
        return "D-\(dDay)"
    } else {
        return ""
    }
}
