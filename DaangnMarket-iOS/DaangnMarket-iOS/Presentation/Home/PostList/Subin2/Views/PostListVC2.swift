//
//  PostListVC2.swift
//  DaangnMarket-iOS
//
//  Created by subinyoon on 2022/05/26.
//

import UIKit

final class PostListVC2: UIViewController, Storyboarded {
    
    // MARK: - Properties
    static var storyboard: Storyboards = .postList2
    var listModel: [PostList] = []
    private var infiniteScrollPage: Int = 0
    private var infiniteScrollLimit: Int = 10
    private var isInfiniteScroll = true
    private var listLastID: String?
    
    // MARK: - UI Component Part
    @IBOutlet weak var plusBtn: UIButton!
    @IBOutlet weak var itemTableView: UITableView!
    @IBOutlet weak var floatingButton: UIButton!
    
    // MARK: - Life Cycle Part
    override func viewDidLoad() {
        super.viewDidLoad()
        registerNib()
        navigationBarUI()
        getPostWithPage() {
            self.isInfiniteScroll = true
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setNavigationBar()
    }
    
    // MARK: - IBAction Part
    @IBAction func floatingButtonTapped(_ sender: Any) {
        let writeVC = PostWriteVC.instantiate()
        self.navigationController?.pushViewController(writeVC, animated: true)
    }
    
    // MARK: - Custom Method Part
    private func registerNib() {
        let nib = UINib(nibName: PostTVC.identifier, bundle: nil)
        itemTableView.register(nib, forCellReuseIdentifier: PostTVC.identifier)
        itemTableView.delegate = self
        itemTableView.dataSource = self
    }
    
    private func setNavigationBar() {
        self.navigationController?.isNavigationBarHidden = false
    }
    
    private func navigationBarUI() {
        let naviLocateButton: UIButton =  {
            let bt = UIButton()
            bt.setTitleColor(UIColor.carrotBlack, for: .normal)
            bt.setTitle("잠실3동", for: .normal)
            bt.titleLabel?.font = .NotoBold(size: 18)
            return bt
        }()
        
        let naviSearchButton: UIButton =  {
            let bt = UIButton()
            bt.setImage(ImageLiterals.PostList2.searchIcon, for: .normal)
            bt.frame = CGRect(x: 0, y: 0, width: 24, height: 24)
            return bt
        }()
        
        let naviMenuButton: UIButton =  {
            let bt = UIButton()
            bt.setImage(ImageLiterals.PostList2.menuIcon, for: .normal)
            bt.frame = CGRect(x: 0, y: 0, width: 24, height: 24)
            return bt
        }()
        
        let naviAlarmButton: UIButton =  {
            let bt = UIButton()
            bt.setImage(ImageLiterals.PostList2.alarmIcon, for: .normal)
            bt.frame = CGRect(x: 0, y: 0, width: 24, height: 24)
            return bt
        }()
        
        let spacer = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        spacer.width = 16
        
        self.navigationItem.setLeftBarButton(UIBarButtonItem(customView: naviLocateButton), animated: false)
        self.navigationItem.rightBarButtonItems = [UIBarButtonItem(customView: naviAlarmButton), spacer, UIBarButtonItem(customView: naviMenuButton), spacer, UIBarButtonItem(customView: naviSearchButton)]
    }
}

// MARK: - UITableView Delegate, DataSource
extension PostListVC2: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PostTVC.identifier) as? PostTVC else { return UITableViewCell() }
        cell.setData(self.listModel[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC2 = PostDetailVC2.instantiate()
        detailVC2.postId = listModel[indexPath.row].id
        self.navigationController?.pushViewController(detailVC2, animated: true)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        if scrollView.contentOffset.y > scrollView.contentSize.height - scrollView.bounds.height {
            if isInfiniteScroll {
                isInfiniteScroll = false
                getPostWithPage() {
                    self.isInfiniteScroll = true
                }
            }
        }
    }
}

// MARK: - NETWORK
extension PostListVC2 {
    private func getPostWithPage(completion: @escaping() -> Void) {
        HomeService.shared.getPostWithPage(page: infiniteScrollPage, limit: infiniteScrollLimit) { networkResult in
            switch networkResult {
            case .success(let data):
                if let data = data as? [PostList] {
                    self.listModel.append(contentsOf: data)
                    self.infiniteScrollPage += 10
                    self.itemTableView.reloadData()
                }
                completion()
            default:
                break;
            }
        }
    }
}
