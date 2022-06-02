//
//  PostListVC2.swift
//  DaangnMarket-iOS
//
//  Created by subinyoon on 2022/05/26.
//

import UIKit

final class PostListVC2: UIViewController, Storyboarded {
        
    static var storyboard: Storyboards = .postList2
    
    private var model = ItemModel.samplePost
    
    private lazy var naviLocateButton: UIButton =  {
        let bt = UIButton()
        bt.setTitleColor(UIColor.carrotBlack, for: .normal)
        bt.setTitle("잠실3동", for: .normal)
        bt.titleLabel?.font = .NotoBold(size: 18)
        return bt
    }()
    
    private lazy var naviSearchButton: UIButton =  {
        let bt = UIButton()
        bt.setImage(ImageLiterals.PostList2.searchIcon, for: .normal)
        return bt
    }()
    
    private lazy var naviMenuButton: UIButton =  {
        let bt = UIButton()
        bt.setImage(ImageLiterals.PostList2.menuIcon, for: .normal)
        return bt
    }()
    
    private lazy var naviAlarmButton: UIButton =  {
        let bt = UIButton()
        bt.setImage(ImageLiterals.PostList2.alarmIcon, for: .normal)
        return bt
    }()

    @IBOutlet weak var itemTableView: UITableView!
    @IBOutlet weak var floatingButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerNib()
        configUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setNavigationBar()
    }
    
    private func registerNib() {
        
        let nib = UINib(nibName: PostTVC.identifier, bundle: nil)
        itemTableView.register(nib, forCellReuseIdentifier: PostTVC.identifier)

        itemTableView.delegate = self
        itemTableView.dataSource = self
    }
    
    @IBAction func floatingButtonTapped(_ sender: Any) {
        let writeVC = PostWriteVC.instantiate()
        self.navigationController?.pushViewController(writeVC, animated: true)
    }
    
    private func configUI() {
        let spacer = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        spacer.width = 16
                
        self.navigationItem.setLeftBarButton(UIBarButtonItem(customView: naviLocateButton), animated: false)
        self.navigationItem.rightBarButtonItems = [UIBarButtonItem(customView: naviAlarmButton), spacer, UIBarButtonItem(customView: naviMenuButton), spacer, UIBarButtonItem(customView: naviSearchButton)]
    }
    
    private func setNavigationBar() {
        self.navigationController?.isNavigationBarHidden = false
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
        let detailVC2 = PostDetailVC2.instantiate()
        detailVC2.postId = "628f3743b32d474b28bba948"
        self.navigationController?.pushViewController(detailVC2, animated: true)
    }
}
