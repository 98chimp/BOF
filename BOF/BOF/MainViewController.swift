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
    
    //MARK: - Outlets
    @IBOutlet weak var signoutBarButton: UIBarButtonItem!
    @IBOutlet weak var postsTableView: UITableView!
    
    //MARK: - Properties
    fileprivate let currentUser = User.current
    
    //MARK: - Lifecycle
    override func viewDidLoad()
    {
        super.viewDidLoad()
        setupUI()
    }
    
    //MARK: - Helpers
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
    }

    //MARK: - TableView Data Source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 1
    }
    
    //MARK: - TableView Delegate
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: cells.postCell, for: indexPath)
        return cell
    }
    
    //MARK: - Actions
    @IBAction func signoutButtonWasTapped(_ sender: UIBarButtonItem)
    {
        SessionService.shared.signout(currentUser)
        dismiss(animated: true, completion: nil)
    }
    
    //MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segues.toNewPostScreen
        {
            let destinationVC = segue.destination as! NewPostViewController
            destinationVC.delegate = self
        }
    }
    
    func handleNewPost() {
        execute(after: 1.0) {
            self.postsTableView.backgroundColor = .bofYellow
            execute(after: 0.5) {
                self.postsTableView.backgroundColor = .bofOrange
            }
        }
        
        print("addingNewPost")
    }
}
