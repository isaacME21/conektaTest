//
//  PostsViewController.swift
//  Examen Conekta
//
//  Created by Luis Isaac Maya on 31/03/21.
//

import UIKit

import WebKit

class PostsViewController: UIViewController {

    @IBOutlet weak var postsTableView: UITableView!
    @IBOutlet weak var postsWebview: WKWebView!
    private var postListMV: PostListViewModel!
    private let vm = AddPostViewModel(userId: 1, id: 2, title: "sunt aut facere repellat provident occaecati excepturi optio reprehenderit", body:  "quia et suscipit suscipit recusandae consequuntur expedita et cum reprehenderit molestiae ut ut quas totam nostrum rerum est autem sunt rem eveniet architecto")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
        self.title = "Posts"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        setupWebView()
        getPosts()
    }
    
    private func setupWebView(){
        let link = URL(string:"https://jsonplaceholder.typicode.com/")!
        let request = URLRequest(url: link)
        postsWebview.load(request)
    }
    
    private func getPosts(){
        WebService().getPosts(resource: Post.createPost(vm: vm)) { posts in
            if let posts = posts{
                self.postListMV = PostListViewModel(posts: posts)
                DispatchQueue.main.async {
                    self.postsTableView.reloadData()
                }
            }
        }
    }
}

extension PostsViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.postListMV.numberOfRowsInSection(section)
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.postListMV == nil ? 0 : self.postListMV.numberOfSections
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PostTableViewCell", for: indexPath) as? PostTableViewCell else{
            fatalError("PostTableViewCell not found")
        }
        
        let postVM = self.postListMV.postAtIndex(indexPath.row)
        cell.idLabel.text = "ID: \(postVM.id)"
        cell.userIDLabel.text = "User ID: \(postVM.userId)"
        cell.titleLabel.text = postVM.title
        cell.bodyLabel.text = postVM.body
        cell.cardView.layer.cornerRadius = postVM.cornerRadius
        
        return cell
    }
    
    
}
