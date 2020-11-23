//
//  HangeulSigye.swift
//  HangeulSigyeApp
//
//  Created by zombietux on 2020/11/23.
//

import Foundation

struct HangeulSigye {
    
    private(set) var amPm: String
    private(set) var hour: Int
    private(set) var minute: Int
    private(set) var second: Int
    private(set) var sunOrMoon: String
    private let hourDic: [Int : String] = [0:"영", 1:"한", 2:"두", 3:"세", 4:"네", 5:"다섯", 6:"여섯", 7:"일곱", 8:"여덟", 9:"아홉", 10:"열", 11:"열한", 12:"열두", 13:"한", 14:"두", 15:"세", 16:"네", 17:"다섯", 18:"여섯", 19:"일곱", 20:"여덟", 21:"아홉", 22:"열", 23:"열한", 24:"열두"]
    private let minuteDic: [Int : String] = [0:"영" ,1:"일", 2:"이", 3:"삼", 4:"사", 5:"오", 6:"육", 7:"칠", 8:"팔", 9:"구"]
    private let secondDic: [Int : String] = [1:"일", 2:"이", 3:"삼", 4:"사", 5:"오", 6:"육", 7:"칠", 8:"팔", 9:"구"]

    init(apPm: String ,hour: Int, minute: Int, second: Int) {
        self.amPm = apPm
        self.hour = hour
        self.minute = minute
        self.second = second
        
        if hour >= 7 && hour < 19 {
            self.sunOrMoon = "☀️"
        } else {
            self.sunOrMoon = "🌙"
        }
    }
    
    //hh:mm:ss a => 한글로
    func make() -> [String] {
        var result = [String]()
        result.append(self.amPm)
        result.append(makeHour())
        result.append(makeMinute())
        result.append(makeSecond())
        result.append(self.sunOrMoon)
        
        return result
    }
    
    private func makeHour() -> String {
        return "\(hourDic[self.hour]!)"
    }
    
    private func makeMinute() -> String {
        if String(self.minute).count == 2 {
            let minuteArr = String(self.minute).map { String($0) }
            let tens = minuteDic[Int(minuteArr[0]) ?? 0] ?? ""
            let units = minuteDic[Int(minuteArr[1]) ?? 0] ?? ""
            
            if tens != "일" {
                if units != "영" {
                    return "\(tens)십\(units)"
                } else {
                    return "\(tens)십"
                }
            } else {
                if units != "영" {
                    return "십\(units)"
                } else {
                    return "십"
                }
            }
        } else {
            return "\(minuteDic[self.minute]!)"
        }
    }
    
    private func makeSecond() -> String {
        if String(self.second).count == 2 {
            let secondArr = String(self.second).map { String($0) }
            let tens = secondDic[Int(secondArr[0]) ?? 0] ?? ""
            let units = secondDic[Int(secondArr[1]) ?? 0] ?? ""
            
            if tens != "일" {
                return "\(tens)십\(units)초"
            } else {
                return "십\(units)초"
            }
        } else if self.second == 0 {
            return "정각"
        } else {
            return "\(secondDic[self.second]!)초"
        }
    }
}
