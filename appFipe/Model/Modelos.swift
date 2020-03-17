import Foundation

struct ResponseModelos: Codable {
    let modelos: [Modelos]?
    let anos: [Anos]?
}

struct Modelos: Codable {
    let nome: String?
    let codigo: Int?
}

struct Anos: Codable {
    let nome: String?
    let codigo: String?
}
