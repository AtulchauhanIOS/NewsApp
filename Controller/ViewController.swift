//
//  ViewController.swift
//  News App
//
//  Created by Sharad Kumar on 9/18/19.
//  Copyright © 2019 Sharad Kumar. All rights reserved.
//

import UIKit
import SwiftyJSON
import Kingfisher


class ViewController: UIViewController, UISearchResultsUpdating {
    

    @IBOutlet var tableView: UITableView!
    let cellSpacingHeight: CGFloat = 0
    var arrData = [JsonModel]()
    var filteredTableData = [JsonModel]()
    var resultSearchController = UISearchController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        jsonParsing()

    self.definesPresentationContext = true
        resultSearchController = ({
            let controller = UISearchController(searchResultsController: nil)
            controller.searchResultsUpdater = self
            controller.dimsBackgroundDuringPresentation = true
            controller.searchBar.sizeToFit()
            
            tableView.tableHeaderView = controller.searchBar
            
            return controller
        })()
        
        // Reload the table
        tableView.reloadData()
    }
    override func viewWillAppear(_ animated: Bool)
    {
        print("view1Appear")
    }
    override func viewDidAppear(_ animated: Bool)
    {
        print("view1DidAppear")
    }
    override func viewWillDisappear(_ animated: Bool)
    {
        print("view1DisAppear")
    }
    override func viewDidDisappear(_ animated: Bool)
    {
        print("view1DidDisAppear")
    }
   
    func jsonParsing()
    {
       let url = URL(string: "https://newsapi.org/v2/everything?q=apple&from=2019-09-19&to=2019-09-19&sortBy=popularity&apiKey=1339347f71ba4041a7b219c93e98c86d")
       URLSession.shared.dataTask(with: url!) { (data, response, error) in
            guard let data = data else { return }
            do{
                let json = try JSON(data:data)
                let results = json["articles"]
                print("DATARESPONSE",results)
                for arr in results.arrayValue{
                    self.arrData.append(JsonModel(json: arr))
                }
                DispatchQueue.main.async{
                    self.tableView.reloadData()
                }
                
            }catch{
                print(error.localizedDescription)
            }
            }.resume()
    }
}


extension ViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if  (resultSearchController.isActive) {
            return filteredTableData.count
        } else {
            return arrData.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        if (resultSearchController.isActive) {
            cell.backgroundColor = UIColor.white
            cell.layer.borderColor = UIColor.white.cgColor
            cell.layer.borderWidth = 1
            cell.layer.cornerRadius = 8
            cell.clipsToBounds = true
            
            cell.lblNewsTitle.text = filteredTableData[indexPath.row].Title
            cell.imgNews.kf.setImage(with: URL(string: arrData[indexPath.row].urlToImage))
            return cell
        }
        else {
            cell.backgroundColor = UIColor.white
            cell.layer.borderColor = UIColor.white.cgColor
            cell.layer.borderWidth = 1
            cell.layer.cornerRadius = 8
            cell.clipsToBounds = true
            
            cell.lblNewsTitle.text = arrData[indexPath.row].Title
            cell.imgNews.kf.setImage(with: URL(string: arrData[indexPath.row].urlToImage))
            return cell
    }
}
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let secondVC:DetailViewController=storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        secondVC.modelData = arrData[indexPath.row]
        self.navigationController?.pushViewController(secondVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        let view:UIView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: self.view.bounds.size.width, height: 10))
        view.backgroundColor = .clear
        
        return view
    }
    
    private func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 250;
    }
    
    private func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        
        cell.contentView.backgroundColor = UIColor.clear
        let whiteRoundedView : UIView = UIView(frame: CGRect(x: 0, y: 10, width: self.view.frame.size.width, height: 70))
        whiteRoundedView.layer.backgroundColor = CGColor(colorSpace: CGColorSpaceCreateDeviceRGB(), components: [1.0, 1.0, 1.0, 1.0])
        whiteRoundedView.layer.masksToBounds = false
        whiteRoundedView.layer.cornerRadius = 3.0
        whiteRoundedView.layer.shadowOffset = CGSize(width: -1, height: 1)
        whiteRoundedView.layer.shadowOpacity = 0.5
        cell.contentView.addSubview(whiteRoundedView)
        cell.contentView.sendSubview(toBack: whiteRoundedView)
    }
    func updateSearchResults(for searchController: UISearchController)
    {
        guard let text = searchController.searchBar.text else { return }
        print("TEXTDATA",text)
         self.tableView.reloadData()
        }
    
    
}
