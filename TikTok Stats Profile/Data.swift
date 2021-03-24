//
//  Data.swift
//  TikTok Stats Profile
//
//  Created by Arrinal Sholifadliq on 03/03/21.
//

import Foundation
import SwiftUI



struct Counter {
    

    
    var kunyuk = "jogja"
    var iya = true
    
    mutating func yow() {
        iya.toggle()
        if iya == true {
            kunyuk = "jogja"
        } else {
            kunyuk = "malang"
        }
    }
    
    
    
    

    
}

class Yuhu: ObservableObject {
    
    var baseUrl = "https://www.tiktok.com/@"
    var username = "indonesianidol"
    var nickname = "cok"
    
    
    let leftSideOfTheNickname = """
    ,"nickname":"
    """

    let rightSideOfTheNickname = """
    ","avatarLarger"
    """
    
    func gaskeun() {
        
        let url = URL(string: self.baseUrl + self.username)!
        let task = URLSession.shared.dataTask(with: url) { (data, resp, error) in
            
            guard let data = data else {
                print("data was nil")
                return
            }
            
            guard let htmlString = String(data: data, encoding: String.Encoding.utf8) else {
                print("cannot cast data into string")
                return
            }
            
            //Nickname
            guard let leftRangeNickname = htmlString.range(of: self.leftSideOfTheNickname) else {
                print("cannot find left range")
                return
            }
            
            guard let rightRangeNickname = htmlString.range(of: self.rightSideOfTheNickname) else {
                print("cannot find right range")
                return
            }
            
            let rangeOfTheNickname = leftRangeNickname.upperBound..<rightRangeNickname.lowerBound
            
            
            self.nickname = String(htmlString[rangeOfTheNickname])
            print("nicknadme: " + self.nickname)
        }
        
        task.resume()
    }
}
