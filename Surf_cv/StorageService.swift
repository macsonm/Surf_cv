import Foundation

class StorageService {
    static let shared = StorageService()

    private(set) var tags: Set<String> = ["MVI/MVVM", "Kotlin Coroutines", "Room", "OkHttp", "DataStore", "WorkManager", "custom view", "DataStore", "ООП и Solid"]

    func addTags(title: String) {
        tags.insert(title)
    }

    func remodeTag(title: String) {
        tags.remove(title)
    }
}
