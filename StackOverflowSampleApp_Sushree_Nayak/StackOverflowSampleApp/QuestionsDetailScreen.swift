//
//  QuestionsDetailScreen.swift
//  StackOverflowSampleApp_Sushree_Nayak
//
//  Created by SUSHREE SANGITA NAYAK on 2/12/22.
//

import Foundation
import UIKit

class QuestionsDetailScreen: UIViewController,UITableViewDataSource,UITableViewDelegate  {
    var bodyVal : String?
    var datePostedVal : String?
    var titleVal:String?
    var otherValue:String?
    var scoreVal : String?
    var responseVal:String?
    var viewVal:String?
    var autherNameValue:String?
    var authorRankValue:String?
    var authorImageURLValue:URL?
    var keywordsValue:String?
    
    @IBOutlet var authorRank: UILabel!
    @IBOutlet var autherName: UILabel!
    @IBOutlet var authorProfileImage: UIImageView!
    @IBOutlet var itemTable: UITableView!
    @IBOutlet var bodyContent: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title="Question Details"
        bodyContent.attributedText=bodyVal?.htmlToAttributedString
        itemTable.delegate=self
        itemTable.dataSource=self
        itemTable.register(UINib(nibName:"CustomTableCell", bundle: nil) , forCellReuseIdentifier: "CustomTableCell");
        autherName.text=autherNameValue
        authorRank.text=authorRankValue
        authorProfileImage.load(url:authorImageURLValue!)
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*Table View Implementation Started*/
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableCell", for: indexPath) as! CustomTableCell
        cell.titleTextField.text=titleVal
        cell.datePosted.text = datePostedVal
        cell.keywords.text=keywordsValue
        cell.scoreLbl.text=scoreVal
        cell.replyLbl.text=responseVal
        cell.viewLbl.text=viewVal
        cell.scoreImage.image=UIImage(named:"score.png")
        cell.replyImage.image=UIImage(named:"message.png")
        cell.viewImage.image=UIImage(named:"view.png")
        return cell;
    }
    
}



