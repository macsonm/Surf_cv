import UIKit

class TagsHeaderCell: UITableViewCell {

    static let reuseIdentifier = "TagsHeaderCell"


    @IBOutlet weak var editButton: UIButton!

    var editButtonClickHandler: (() -> Void)?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }


    @IBAction func tapHadler(_ sender: UIButton) {
        sender.isSelected.toggle()
        editButtonClickHandler?()
    }

    
}
