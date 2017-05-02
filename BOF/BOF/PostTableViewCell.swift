//
//  PostTableViewCell.swift
//  BOF
//
//  Created by Shahin on 2017-05-01.
//  Copyright © 2017 98%Chimp. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell
{
    // MARK: - Outlets
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var bofHandleLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    
    // MARK: - Helpers
    func configure(with post: Post)
    {
        if let imageName = post.poster?.firstName
        {
            profileImageView.image = UIImage(named: imageName)
        }
        fullNameLabel.text = post.poster?.fullName()
        bofHandleLabel.text = post.poster?.bofHandle()
        contentLabel.text = post.content
    }
}
