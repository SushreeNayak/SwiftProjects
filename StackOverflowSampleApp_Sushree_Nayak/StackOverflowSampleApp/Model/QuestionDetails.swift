//
//  QuestionDetails.swift
//  StackOverflowSampleApp_Sushree_Nayak
//
//  Created by SUSHREE SANGITA NAYAK on 2/12/22.
//

import Foundation

class QuestionDetails: Codable{
    
    var items : [Question]
    var has_more:Bool?
    var quota_max:Int?
    var quota_remaining:Int?
    
}
