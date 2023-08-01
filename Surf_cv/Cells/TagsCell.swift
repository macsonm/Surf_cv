import UIKit

class TagsCell: UITableViewCell {

    static let reuseIdentifier = "TagsCell"

    @IBOutlet weak var tagListView: TagListView!

    private let storage = StorageService.shared

    var addTagsHandler: (() -> Void)?

    var editMode: Bool = false {
        didSet {
            tagListView.removeAllTags()
            tagListView.addTags(Array(storage.tags))
            if editMode {
                let plusTag = tagListView.addTag("+")
                tagListView.enableRemoveButton = true
                plusTag.enableRemoveButton = false
                plusTag.onTap = { [weak self] _ in
                    self?.addTagsHandler?()
                }
            } else {
                //tagListView.removeTag("+")
                tagListView.enableRemoveButton = false
            }
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        tagListView.delegate = self
        tagListView.paddingX = 24
        tagListView.paddingY = 12
        tagListView.cornerRadius = 12
        tagListView.textFont = .systemFont(ofSize: 14)

        tagListView.addTags(Array(storage.tags))
    }
    
}

extension TagsCell: TagListViewDelegate {
    func tagRemoveButtonPressed(_ title: String, tagView: TagView, sender: TagListView) -> Void {
        sender.removeTagView(tagView)
        self.storage.remodeTag(title: title)
    }
}
