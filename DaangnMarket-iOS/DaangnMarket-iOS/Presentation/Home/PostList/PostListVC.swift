//
//  PostListVC.swift
//  DaangnMarket-iOS
//
//  Created by Junho Lee on 2022/05/16.
//

import UIKit

class PostListVC: UIViewController, Storyboarded {
    
    @IBOutlet weak var tableView: UITableView!
    static var storyboard: Storyboards = .postList
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .black
        
        let nib = UINib(nibName: ListTableViewCell.identifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: ListTableViewCell.identifier)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 100
        
    }
}

extension PostListVC: UITableViewDelegate{
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 400
//    }


}

extension PostListVC: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return PostListDataModel.sampleData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ListTableViewCell.identifier, for: indexPath) as? ListTableViewCell else{return UITableViewCell()}
        
        cell.setData(PostListDataModel.sampleData[indexPath.row])
        
        return cell
    }
    
    
}


