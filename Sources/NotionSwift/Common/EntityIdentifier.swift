//
//  Created by Wojciech Chojnacki on 02/06/2021.
//

import Foundation

public struct EntityIdentifier<Marker, T: Codable>: CustomStringConvertible {
    public let rawValue: T

    public init(_ rawValue: T) {
        self.rawValue = rawValue
    }

    public var description: String {
        "ID<\(Marker.self)>:\(rawValue)"
    }
}

// MARK: - Codable

extension EntityIdentifier: Codable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        rawValue = try container.decode(T.self)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(rawValue)
    }
}