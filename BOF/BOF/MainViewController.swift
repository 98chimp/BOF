//
//  MainViewController.swift
//  BOF
//
//  Created by Shahin on 2017-04-30.
//  Copyright © 2017 98%Chimp. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, NewPostProtocol
{
    typealias cells = Constants.Identifiers.Cells
    typealias segues = Constants.Identifiers.Segues
    
    // MARK: - Outlets
    @IBOutlet weak var signoutBarButton: UIBarButtonItem!
    @IBOutlet weak var postsTableView: UITableView!
    
    // MARK: - Properties
    fileprivate let currentUser = User.current
    fileprivate var datasource = [Post]()
    fileprivate let refreshControl = UIRefreshControl()

    // MARK: - Lifecycle
    override func viewDidLoad()
    {
        super.viewDidLoad()
        setupUI()
        datasource = PostService.shared.mockedPosts
        Timer.scheduledTimer(timeInterval: 10.0, target: self, selector: #selector(checkForNewPosts), userInfo: nil, repeats: true)
    }
    
    // MARK: - Helpers
    fileprivate func setupUI()
    {
        if let font = UIFont(name: Constants.BOFTextField.iconFont, size: 25)
        {
            signoutBarButton.title = "\u{f08b}"
            signoutBarButton.setTitleTextAttributes([NSFontAttributeName: font], for: .normal)
        }
        
        let logo = UIImage(named: "logo small")
        let imageView = UIImageView(image: logo)
        navigationItem.titleView = imageView
        
        if #available(iOS 10.0, *)
        {
            postsTableView.refreshControl = refreshControl
        }
        else
        {
            postsTableView.addSubview(refreshControl)
        }
        refreshControl.addTarget(self, action: #selector(updatePosts), for: .valueChanged)
        refreshControl.tintColor = .white
        refreshControl.attributedTitle = NSAttributedString(string: "Fetching New Posts ...", attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 14.0), NSForegroundColorAttributeName: UIColor.white])
    }
    
    @objc fileprivate func checkForNewPosts()
    {
        if PostService.shared.areNewPostsAvailable
        {
            navigationItem.titleView?.bounce()
            execute(after: 1.0, closure: {
                self.navigationItem.titleView?.bounce()
            })
        }
    }

    // MARK: - TableView Data Source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return datasource.count
    }
    
    // MARK: - TableView Delegate
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: cells.postCell, for: indexPath) as! PostTableViewCell
        let post = datasource.reversed()[indexPath.row]
        cell.configure(with: post)
        return cell
    }
    
    // MARK: - Actions
    @IBAction func signoutButtonWasTapped(_ sender: UIBarButtonItem)
    {
        SessionService.shared.signout(currentUser)
        dismiss(animated: true, completion: nil)
    }
    
    @objc fileprivate func updatePosts()
    {
        PostService.shared.fetchNewPosts()
        execute(after: 2.0) {
            self.datasource += PostService.shared.mockedPosts
            self.postsTableView.reloadData()
            PostService.shared.areNewPostsAvailable = false
            self.refreshControl.endRefreshing()
        }
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segues.toNewPostScreen
        {
            let destinationVC = segue.destination as! NewPostViewController
            destinationVC.delegate = self
        }
    }
    
    func handleNew(_ post: Post)
    {
        datasource.append(post)
        let indexPath = IndexPath(row: 0, section: 0)
        postsTableView.beginUpdates()
        postsTableView.insertRows(at: [indexPath], with: .automatic)
        postsTableView.endUpdates()
    }
}
