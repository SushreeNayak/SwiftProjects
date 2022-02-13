//
//  ServiceCaller.swift
//  StackOverflowSampleApp_Sushree_Nayak
//
//  Created by SUSHREE SANGITA NAYAK on 2/12/22.
//

import Foundation

class ServiceCaller {
    
    /* Api call for getting the list of questions */
    func fetchTopQuestions(completionHandler: @escaping ([Question]) -> Void) {
        let url = URL(string: "https://api.stackexchange.com/2.2/questions?site=stackoverflow&order=desc&sort=votes&tagged=swiftui&pagesize=10")!
        
        let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            if let error = error {
                print("Error with fetching TopQuestions: \(error)")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                      return
                  }
            
            if let data = data,
               let questionListApiResponse = try? JSONDecoder().decode(QuestionDetails.self, from: data) {
                completionHandler(questionListApiResponse.items)
            }
        })
        task.resume()
    }
    
    
    /* Api call for getting the question detail */
    func fetchQuestionDetails(completionHandler:@escaping (QuestionDetails) -> Void,questionID:String) {
        let url = URL(string: "https://api.stackexchange.com/2.2/questions/"+questionID+"?site=stackoverflow&order=desc&sort=votes&tagged=swiftui&pagesize=10&filter=!9_bDDxJY5")!
        
        let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            if let error = error {
                print("Error with fetching question Details: \(error)")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                      
                      return
                  }
            
            if let data = data,
               let questionDetailApiResponse = try? JSONDecoder().decode(QuestionDetails.self, from: data) {
                completionHandler(questionDetailApiResponse)
            }
        })
        task.resume()
    }
}

