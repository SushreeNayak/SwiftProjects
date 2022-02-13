//
//  Question.swift
//  StackOverflowSampleApp_Sushree_Nayak
//
//  Created by SUSHREE SANGITA NAYAK on 2/12/22.
//

import Foundation

class Question: Codable{
    
    var tags : [String]?
    var owner : Owner?
    var is_answered:Bool?
    var view_count: Int?
    var accepted_answer_id:Double?
    var answer_count:Int?
    var score:Int?
    var last_activity_date:Double?
    var creation_date:Int?
    var last_edit_date:Double?
    var question_id:Int?
    var content_license:String?
    var link:String?
    var title:String?
    var body:String?
    
    
}




