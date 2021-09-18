//
//  BubbleTableViewCell.swift
//  AutolayoutPractice
//
//  Created by 문효재 on 2021/09/18.
//

import UIKit

class MyBubbleTableViewCell: UITableViewCell {
    
    let textView = UITextView()
    let bubbleImage = UIImageView()
    
    init() {
        defer {
            textView.isScrollEnabled = false
            bubbleImage.image = UIImage(named: "myBubble")
        }
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
