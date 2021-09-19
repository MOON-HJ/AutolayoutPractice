//
//  YourBubbleTableViewCell.swift
//  AutolayoutPractice
//
//  Created by 문효재 on 2021/09/19.
//

import UIKit

class YourBubbleTableViewCell: UITableViewCell {
    static let id = "YourBubble"

    let textView = UITextView()
    let dateLabel = UILabel()
    let bubbleImage = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        defer {
            textView.isScrollEnabled = false
            let bubble = UIImage(named: "yourBubble")
            bubble?.resizableImage(withCapInsets: UIEdgeInsetsMake(18, 10, 18, 10), resizingMode: .stretch)
            bubbleImage.image = bubble
            dateLabel.text = "2021.00.00"
            dateLabel.font = UIFont.systemFont(ofSize: 10)
            
            [textView, bubbleImage, dateLabel].forEach {
                self.addSubview($0)
            }
            
            textView.snp.makeConstraints {
                $0.left.equalTo(textView).offset(20)
                $0.right.equalTo(textView).offset(-10)
                $0.top.equalTo(textView).offset(5)
                $0.bottom.equalTo(textView).offset(-5)
            }
            
            bubbleImage.snp.makeConstraints {
                $0.top.left.equalToSuperview().offset(10)
                $0.bottom.equalToSuperview().offset(-10)
            }
            textView.setContentHuggingPriority(.required, for: .horizontal)
            textView.setContentHuggingPriority(.required, for: .vertical)
            
            dateLabel.snp.makeConstraints {
                $0.right.lessThanOrEqualToSuperview().offset(-40).priority(.required)
                $0.bottom.equalTo(bubbleImage)
                $0.left.equalTo(bubbleImage.snp.left).offset(5)
            }
        }
        super.init(style: style, reuseIdentifier: reuseIdentifier)
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