//
//  ViewController.swift
//  Project07 - PullToRefresh
//
//  Created by calmkeen on 2022/05/26.
//

import UIKit

class ViewController: UIViewController{

    @IBOutlet weak var tableView :UITableView!
    
    let cellIdentifer = "NewCellIdentifier"

    var beforeList = ["🤗🤗🤗🤗🤗", "😅😅😅😅😅", "😆😆😆😆😆"]
    var afterList = ["🏃🏃🏃🏃🏃", "💩💩💩💩💩", "👸👸👸👸👸", "🤗🤗🤗🤗🤗", "😅😅😅😅😅", "😆😆😆😆😆" ]
    var dataEmo = [String]()
    var refreshControl = UIRefreshControl()
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        
        let dataEmo = beforeList
        
        tableView.refreshControl = self.refreshControl
                self.refreshControl.addTarget(self, action: #selector(ViewController.RoadCell), for: .valueChanged)
        
        
        self.view.addSubview(tableView!)
        
    }
}
    extension ViewController : UITableViewDataSource, UITableViewDelegate{
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataEmo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReuseableCell",for: indexPath)
        cell.textLabel?.text = beforeList[indexPath.row]
        return cell
    }
        
        func RoadCell(){
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3){
                self.dataEmo = [self.afterList,self.beforeList][self.index]
                self.tableView.reloadData()
                self.refreshControl.endRefreshing()
                self.index = (self.index + 1) % 2
            }
        }

}

