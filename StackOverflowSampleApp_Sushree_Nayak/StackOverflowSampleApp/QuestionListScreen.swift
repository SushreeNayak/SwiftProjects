//
//  QuestionListScreen.swift
//  StackOverflowSampleApp_Sushree_Nayak
//
//  Created by SUSHREE SANGITA NAYAK on 2/12/22.
//

import UIKit
class QuestionListScreen: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    var questions :[Question]?
    var apicallClass:ServiceCaller=ServiceCaller()
    var questiondetails:QuestionDetails?
    
    @IBOutlet weak var questionsTable: UITableView!
    
    
    
    /*Table View Implementation Started*/
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questions?.count ?? 0
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableCell", for: indexPath) as! CustomTableCell
        cell.titleTextField.text=questions?[indexPath.row].title
        let datePost:Int = (questions?[indexPath.row].creation_date)!
        cell.datePosted.text = "Asked on "+convertDate(dateValue: datePost)
        
        cell.keywords.text=questions?[indexPath.row].tags?.joined(separator: ", ")
        cell.scoreLbl.text=String((questions?[indexPath.row].score)!)
        cell.replyLbl.text=String((questions?[indexPath.row].answer_count)!)
        print("formatNumber((items?[indexPath.row].view_count)!)",formatNumber((questions?[indexPath.row].view_count)!))
        cell.viewLbl.text=formatNumber((questions?[indexPath.row].view_count)!)
        cell.scoreImage.image=UIImage(named:"score.png")
        cell.replyImage.image=UIImage(named:"message.png")
        cell.viewImage.image=UIImage(named:"view.png")
        return cell;
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let itemID=questions![indexPath.row].question_id!
        apicallClass.fetchQuestionDetails(completionHandler: { [weak self] (questiondetails) in
            self?.questiondetails = questiondetails
            
            DispatchQueue.main.async {
                // self?.schoolTable.reloadData()
                self?.performSegue(withIdentifier:"questionDetailSegue", sender: self)
            }
        }, questionID: String(itemID))
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questionsTable.delegate=self
        questionsTable.dataSource=self
        questionsTable.register(UINib(nibName:"CustomTableCell", bundle: nil) , forCellReuseIdentifier: "CustomTableCell");
        
        
        self.title="Top Questions"
        self.additionalSafeAreaInsets = UIEdgeInsets(top: 0, left: 0, bottom:0, right: 0)
        apicallClass.fetchTopQuestions { [weak self] (films) in
            self?.questions = films
            DispatchQueue.main.async {
                self?.questionsTable.reloadData()
            }
        }
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "questionDetailSegue"){
            let destinationVC=segue.destination as! QuestionsDetailScreen
            destinationVC.bodyVal=questiondetails?.items[0].body
            destinationVC.titleVal=questiondetails?.items[0].title
            destinationVC.keywordsValue=questiondetails?.items[0].tags?.joined(separator: ", ")
            let postedDate:Int = (questiondetails?.items[0].creation_date)!
            destinationVC.datePostedVal="Asked on "+convertDate(dateValue: postedDate)
            destinationVC.scoreVal=String((questiondetails?.items[0].score)!)
            destinationVC.responseVal=String((questiondetails?.items[0].answer_count)!)
            destinationVC.viewVal=formatNumber((questiondetails?.items[0].view_count)!)
            destinationVC.autherNameValue=questiondetails?.items[0].owner?.display_name
            destinationVC.authorRankValue=String((questiondetails?.items[0].owner?.reputation)!)
            destinationVC.authorImageURLValue=URL(string: (questiondetails?.items[0].owner?.profile_image)!)
            
        }
    }
    
    
}

