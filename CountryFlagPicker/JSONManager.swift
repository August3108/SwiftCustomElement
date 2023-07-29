import Foundation

struct countryList: Codable {
    let name, flag, code, dialCode: String
    let numberOfDigit: Int

    enum CodingKeys: String, CodingKey {
        case name, flag, code
        case dialCode = "dial_code"
        case numberOfDigit = "number_of_digit"

    }

    static let countries: [countryList] = Bundle.main.decode(file: "CountryList.json")
    static let smapleData: countryList = countries[0]
}

extension Bundle {
    func decode<T: Decodable>(file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("cant find file in the project")
        }
        guard let data = try? Data(contentsOf: url) else {
            fatalError("cant read file")
        }
        let decoder = JSONDecoder()
        guard let loadedData = try? decoder.decode(T.self, from: data) else {
            fatalError("error in decoding")
        }
        return loadedData
    }
}

