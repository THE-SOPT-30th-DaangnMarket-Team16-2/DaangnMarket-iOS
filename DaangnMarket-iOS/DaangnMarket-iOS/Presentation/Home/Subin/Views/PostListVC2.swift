//
//  PostListVC2.swift
//  DaangnMarket-iOS
//
//  Created by subinyoon on 2022/05/26.
//

import UIKit

class PostListVC2: UIViewController, Storyboarded {
        
    static var storyboard: Storyboards = .postList2
    
    private var model = ItemModel.samplePost

    @IBOutlet weak var itemTableView: UITableView!
    @IBOutlet weak var floatingButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerNib()
    }
    
    private func registerNib() {
        
        let nib = UINib(nibName: PostTVC.identifier, bundle: nil)
        itemTableView.register(nib, forCellReuseIdentifier: PostTVC.identifier)

        itemTableView.delegate = self
        itemTableView.dataSource = self
    }
    
    @IBAction func floatingButtonTapped(_ sender: Any) {
        guard let writeVC = UIStoryboard(name: "PostWrite", bundle: nil).instantiateViewController(withIdentifier: "PostWriteVC") as? PostWriteVC else { return }
        
        self.navigationController?.pushViewController(writeVC, animated: true)
        
    }
    
}

extension PostListVC2: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
}

extension PostListVC2: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PostTVC.identifier) as? PostTVC else { return UITableViewCell() }
        
        cell.setData(itemData: model[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        guard let detailVC = UIStoryboard(name: "PostDetail2", bundle: nil).instantiateViewController(withIdentifier: "PostDetailVC2") as? PostDetailVC2 else { return }
        
        self.navigationController?.pushViewController(detailVC, animated: true)
        
//        // 셀 선택 해제
//        tableView.deselectRow(at: indexPath, animated: true)
//
//        guard let detailVC2 = UIStoryboard(name: "PostDetail2", bundle: nil).instantiateViewController(withIdentifier: "PostDetailVC2") as? PostDetailVC2 else { return }
//
//        //detailVC.modalPresentationStyle = .overFullScreen
//        //detailVC.modalTransitionStyle = .crossDissolve
//
//        // 셀 선택 시 데이터 전달
//        detailVC2.itemModel = model[indexPath.row]
//
//        //self.present(detailVC, animated: true, completion: nil)
//        self.navigationController?.pushViewController(detailVC2, animated: true)
    }
}
