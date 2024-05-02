//
// StorySummary.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct StorySummary: Codable, Hashable {

    /** The path to the individual story resource. */
    public var resourceURI: String?
    /** The canonical name of the story. */
    public var name: String?
    /** The type of the story (interior or cover). */
    public var type: String?

    public init(resourceURI: String? = nil, name: String? = nil, type: String? = nil) {
        self.resourceURI = resourceURI
        self.name = name
        self.type = type
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case resourceURI
        case name
        case type
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(resourceURI, forKey: .resourceURI)
        try container.encodeIfPresent(name, forKey: .name)
        try container.encodeIfPresent(type, forKey: .type)
    }
}
