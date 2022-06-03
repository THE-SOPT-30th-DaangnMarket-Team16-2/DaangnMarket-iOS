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
    var data: [PostListDataModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        let nib = UINib(nibName: ListTableViewCell.identifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: ListTableViewCell.identifier)
        
        getPostList()
        
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
        let nextVC = PostDetailVC2.instantiate()
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
}

extension PostListVC: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return self.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ListTableViewCell.identifier, for: indexPath) as? ListTableViewCell else{return UITableViewCell()}
        
        cell.setData(self.data[indexPath.row])
        
        return cell
    }
}

extension PostListVC {
    func getPostList() {
        HomeService.shared.getPostList { networkResult in
            switch networkResult {
            case .success(let data):
                if let data = data as? [PostListDataModel] {
                    
                    self.data = data
                    self.tableView.reloadData()
//                    var model = PostListDataModel.self
//                    model = data.data
//                    self.tableView.reloadData()
                    print(data)
                }
            default:
                break;
            }
        }
    }
}
