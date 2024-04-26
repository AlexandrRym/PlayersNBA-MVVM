// MARK: PlayerNBA
struct PlayerNBA: Codable, CustomStringConvertible {
    let id: Int
    let firstName, lastName, position, height: String

    var description: String {
        return """
        Player:
            ID: \(id)
            First Name: \(firstName)
            Last Name: \(lastName)
            Position: \(position)
            Height: \(height)
        """
    }
}

// MARK: - Decode Json
struct Welcome: Codable, CustomStringConvertible {
    let data: [Datum]
    let meta: Meta

    var description: String {
        return """
        Welcome:
            Data: \(data)
            Meta: \(meta)
        """
    }
}

// MARK: Datum
struct Datum: Codable, CustomStringConvertible {
    let id: Int
    let firstName, lastName, position, height: String
    let weight, jerseyNumber, college, country: String
    let draftYear, draftRound, draftNumber: Int?
    let team: Team

    enum CodingKeys: String, CodingKey {
        case id
        case firstName = "first_name"
        case lastName = "last_name"
        case position, height, weight
        case jerseyNumber = "jersey_number"
        case college, country
        case draftYear = "draft_year"
        case draftRound = "draft_round"
        case draftNumber = "draft_number"
        case team
    }

    var description: String {
        var desc = """
        Datum:
            ID: \(id)
            First Name: \(firstName)
            Last Name: \(lastName)
            Position: \(position)
            Height: \(height)
            Weight: \(weight)
            Jersey Number: \(jerseyNumber)
            College: \(college)
            Country: \(country)
        """
        if let draftYear = draftYear {
            desc += "\nDraft Year: \(draftYear)"
        }
        if let draftRound = draftRound {
            desc += "\nDraft Round: \(draftRound)"
        }
        if let draftNumber = draftNumber {
            desc += "\nDraft Number: \(draftNumber)"
        }
        desc += "\nTeam: \(team)"
        return desc
    }
}
// MARK: Team
struct Team: Codable, CustomStringConvertible {
    let id: Int
    let conference: Conference
    let division, city, name, fullName: String
    let abbreviation: String

    enum CodingKeys: String, CodingKey {
        case id, conference, division, city, name
        case fullName = "full_name"
        case abbreviation
    }
    
    var description: String {
        return """
        Team:
            Conference: \(conference)
            Division: \(division)
            City: \(city)
            Name: \(name)
            Full Name: \(fullName)
            Abbreviation: \(abbreviation)
        """
    }
}

enum Conference: String, Codable, CustomStringConvertible {
    case east = "East"
    case west = "West"
    
    var description: String {
        return self.rawValue
    }
}

// MARK: Meta
struct Meta: Codable, CustomStringConvertible {
    let nextCursor, perPage: Int
    
    enum CodingKeys: String, CodingKey {
        case nextCursor = "next_cursor"
        case perPage = "per_page"
    }
    
    var description: String {
        return """
        Meta:
            Next Cursor: \(nextCursor)
            Per Page: \(perPage)
        """
    }
}
