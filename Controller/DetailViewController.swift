//
//  DetailViewController.swift
//  News App
//
//  Created by Sharad Kumar on 9/27/19.
//  Copyright © 2019 Sharad Kumar. All rights reserved.
//

import UIKit

class DetailViewController: UITableViewController {
    
    @IBOutlet weak var lblNewsContent: UILabel!
    @IBOutlet weak var txtViewUrl: UITextView!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var lblNewsPublishedAt: UILabel!
    @IBOutlet weak var lblNewsId: UILabel!
    @IBOutlet weak var lblNewsAuthor: UILabel!
    @IBOutlet weak var lblNewsName: UILabel!
    @IBOutlet weak var imgDetailNews: UIImageView!
    
    var author: String = ""
    var content: String = ""
    var Description: String = ""
    var Title: String = ""
    var url: String = ""
    var urlToImage: String = ""
    var source: String = ""
    var name: String = ""
    var id:String = ""

    var modelData = JsonModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

     self.tableView.tableFooterView=UIView()
    }
    override func viewDidAppear(_ animated: Bool)
    {
        print("view2DidAppear")
    }
    override func viewWillDisappear(_ animated: Bool)
    {
        print("view2DisAppear")
    }
    override func viewDidDisappear(_ animated: Bool)
    {
        print("view2DidDisAppear")
    }
    override func viewWillAppear(_ animated: Bool) {
        imgDetailNews.kf.setImage(with: URL(string: modelData.urlToImage))
        lblNewsContent.text="Content :-" + modelData.content
        txtViewUrl.text="URL :-" + modelData.url
        txtViewUrl.isEditable = false
        txtViewUrl.dataDetectorTypes = .link
        lblDescription.text="Description :-" + modelData.Description
        lblNewsPublishedAt.text="PublishedAt :-" + modelData.publishedAt
        lblNewsAuthor.text="Author :-" + modelData.author
        lblNewsId.text="Id :-" + modelData.id
        lblNewsName.text="Name :-" + modelData.name
        print("view2Appear")
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }

}
