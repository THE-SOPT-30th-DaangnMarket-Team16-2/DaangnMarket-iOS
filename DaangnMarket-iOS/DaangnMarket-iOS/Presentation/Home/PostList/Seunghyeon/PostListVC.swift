//
//  PostListVC.swift
//  DaangnMarket-iOS
//
//  Created by Junho Lee on 2022/05/16.
//

import UIKit

class PostListVC: UIViewController, Storyboarded {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addAction: UIButton!
    @IBOutlet weak var plusButton: UIImageView!
    
    static var storyboard: Storyboards = .postList
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: ListTableViewCell.identifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: ListTableViewCell.identifier)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 100
        
        self.tableView.contentInset = UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0)
        
        self.view.backgroundColor = .white
        
        setTapGesture()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.isNavigationBarHidden = true
    }
    
    private func setTapGesture() {
        plusButton.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(presentPostWriteVC))
        plusButton.addGestureRecognizer(tap)
    }
    
    @objc
    private func presentPostWriteVC() {
        let nextVC = PostWriteVC.instantiate()
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
}

extension PostListVC: UITableViewDelegate{

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let nextVC = PostDetailVC.instantiate()
        let nextVC = PostDetailVC2.instantiate()
        nextVC.postId = "628f3743b32d474b28bba948"
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
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

