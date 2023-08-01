import UIKit

class HeaderCell: UITableViewCell {

    @IBOutlet weak var myIconView: UIImageView!

    static let reuseIdentifier = "HeaderCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        myIconView.layer.cornerRadius = 60

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
}
