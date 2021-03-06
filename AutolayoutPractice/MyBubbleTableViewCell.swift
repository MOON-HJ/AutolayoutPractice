//
//  BubbleTableViewCell.swift
//  AutolayoutPractice
//
//  Created by 문효재 on 2021/09/18.
//

import UIKit

class MyBubbleTableViewCell: UITableViewCell {
    static let id = "MyBubble"
    
    var textView = UITextView()
    let dateLabel = UILabel()
    let bubbleImage = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        defer {
            textView.isScrollEnabled = false
            let bubble = UIImage(named: "myBubble")?.resizableImage(withCapInsets: .init(top: 10, left: 25, bottom: 10, right: 25), resizingMode: .stretch)            
            bubbleImage.image = bubble
            dateLabel.text = "2021.00.00"
            dateLabel.font = UIFont.systemFont(ofSize: 10)
            textView.backgroundColor = .clear
            
            [bubbleImage, textView, dateLabel].forEach {
                self.addSubview($0)
            }
            
            textView.snp.makeConstraints {
                $0.left.equalTo(bubbleImage).offset(5)
                $0.right.equalTo(bubbleImage).offset(-25)
                $0.top.equalTo(bubbleImage).offset(5)
                $0.bottom.equalTo(bubbleImage).offset(-5)
            }
            
            bubbleImage.snp.makeConstraints {
                $0.top.equalToSuperview().offset(10)
                $0.right.bottom.equalToSuperview().offset(-10)
            }
            textView.setContentHuggingPriority(.required, for: .horizontal)
            textView.setContentHuggingPriority(.required, for: .vertical)
            
            dateLabel.snp.makeConstraints {
                $0.left.greaterThanOrEqualToSuperview().offset(40).priority(.required)
                $0.bottom.equalTo(bubbleImage)
                $0.right.equalTo(bubbleImage.snp.left).offset(-5)
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
