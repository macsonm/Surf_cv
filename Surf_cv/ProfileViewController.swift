import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    private let storage = StorageService.shared

    private var editMode = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UINib(nibName: "HeaderCell", bundle: nil),
                           forCellReuseIdentifier: HeaderCell.reuseIdentifier)
        tableView.register(UINib(nibName: "TagsHeaderCell", bundle: nil),
                           forCellReuseIdentifier: TagsHeaderCell.reuseIdentifier)
        tableView.register(UINib(nibName: "AboutCell", bundle: nil),
                           forCellReuseIdentifier: AboutCell.reuseIdentifier)

        tableView.register(UINib(nibName: "TagsCell", bundle: nil),
                           forCellReuseIdentifier: TagsCell.reuseIdentifier)
    }
}

extension ProfileViewController {
    func createAlert() {

        let alert = UIAlertController(
            title: "Добавление навыка",
            message: "Введите название навыка которым вы владеете",
            preferredStyle: .alert
        )

        alert.addTextField { (textField) in
            textField.placeholder = "Введите текст"
        }

        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
            let textField = alert?.textFields![0] 
            guard let text = textField?.text else { return }
            self.storage.addTags(title: text)
            self.tableView.reloadData()
        }))

        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))

        self.present(alert, animated: true)
    }
}

extension ProfileViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        4
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        switch indexPath.row {
            case 0:
                return tableView.dequeueReusableCell(withIdentifier: HeaderCell.reuseIdentifier)!
            case 1:
                let cell = tableView.dequeueReusableCell(withIdentifier: TagsHeaderCell.reuseIdentifier) as! TagsHeaderCell
                cell.editButtonClickHandler = { [weak self] in
                    self?.editMode.toggle()
                    self?.tableView.reloadRows(at: [IndexPath(row: 2, section: 0)], with: .automatic)
                }
                return cell
            case 2:
                let cell = tableView.dequeueReusableCell(withIdentifier: TagsCell.reuseIdentifier) as! TagsCell
                cell.editMode = self.editMode
                cell.addTagsHandler = { [weak self] in
                    self?.createAlert()
                }
                return cell
            case 3:
                return tableView.dequeueReusableCell(withIdentifier: AboutCell.reuseIdentifier)!
            default:
                break
        }
        return UITableViewCell()
    }

    
}
