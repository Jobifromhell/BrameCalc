import Foundation
import Combine

class RSEObjective: Identifiable, ObservableObject, Codable {
    let id: UUID
    @Published var title: String
    @Published var description: String
    @Published var targetDate: Date
    @Published var status: String

    init(id: UUID = UUID(), title: String = "", description: String = "", targetDate: Date = Date(), status: String = "Not Started") {
        self.id = id
        self.title = title
        self.description = description
        self.targetDate = targetDate
        self.status = status
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case description
        case targetDate
        case status
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(UUID.self, forKey: .id)
        title = try container.decode(String.self, forKey: .title)
        description = try container.decode(String.self, forKey: .description)
        targetDate = try container.decode(Date.self, forKey: .targetDate)
        status = try container.decode(String.self, forKey: .status)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(title, forKey: .title)
        try container.encode(description, forKey: .description)
        try container.encode(targetDate, forKey: .targetDate)
        try container.encode(status, forKey: .status)
    }
}
