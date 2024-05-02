//
// ComicDate.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct ComicDate: Codable, Hashable {

    /** A description of the date (e.g. onsale date, FOC date). */
    public var type: String?
    /** The date. */
    public var date: Date?

    public init(type: String? = nil, date: Date? = nil) {
        self.type = type
        self.date = date
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case type
        case date
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(type, forKey: .type)
        try container.encodeIfPresent(date, forKey: .date)
    }
}
