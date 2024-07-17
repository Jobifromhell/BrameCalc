import Foundation
import Combine

class RSEAccomplishment: Identifiable, ObservableObject, Codable {
    let id: UUID
    @Published var title: String
    @Published var description: String
    @Published var completionDate: Date

    init(id: UUID = UUID(), title: String = "", description: String = "", completionDate: Date = Date()) {
        self.id = id
        self.title = title
        self.description = description
        self.completionDate = completionDate
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case description
        case completionDate
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(UUID.self, forKey: .id)
        title = try container.decode(String.self, forKey: .title)
        description = try container.decode(String.self, forKey: .description)
        completionDate = try container.decode(Date.self, forKey: .completionDate)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(title, forKey: .title)
        try container.encode(description, forKey: .description)
        try container.encode(completionDate, forKey: .completionDate)
    }
}
