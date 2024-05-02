//
// Story.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct Story: Codable, Hashable {

    /** The unique ID of the story resource. */
    public var id: Int?
    /** The story title. */
    public var title: String?
    /** A short description of the story. */
    public var description: String?
    /** The canonical URL identifier for this resource.  */
    public var resourceURI: String?
    /** The story type e.g. interior story, cover, text story. */
    public var type: String?
    /** The date the resource was most recently modified. */
    public var modified: Date?
    public var thumbnail: Image?
    public var comics: ComicList?
    public var series: SeriesList?
    public var events: EventList?
    public var characters: CharacterList?
    public var creators: CreatorList?
    public var originalissue: ComicSummary?

    public init(id: Int? = nil, title: String? = nil, description: String? = nil, resourceURI: String? = nil, type: String? = nil, modified: Date? = nil, thumbnail: Image? = nil, comics: ComicList? = nil, series: SeriesList? = nil, events: EventList? = nil, characters: CharacterList? = nil, creators: CreatorList? = nil, originalissue: ComicSummary? = nil) {
        self.id = id
        self.title = title
        self.description = description
        self.resourceURI = resourceURI
        self.type = type
        self.modified = modified
        self.thumbnail = thumbnail
        self.comics = comics
        self.series = series
        self.events = events
        self.characters = characters
        self.creators = creators
        self.originalissue = originalissue
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case title
        case description
        case resourceURI
        case type
        case modified
        case thumbnail
        case comics
        case series
        case events
        case characters
        case creators
        case originalissue
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(id, forKey: .id)
        try container.encodeIfPresent(title, forKey: .title)
        try container.encodeIfPresent(description, forKey: .description)
        try container.encodeIfPresent(resourceURI, forKey: .resourceURI)
        try container.encodeIfPresent(type, forKey: .type)
        try container.encodeIfPresent(modified, forKey: .modified)
        try container.encodeIfPresent(thumbnail, forKey: .thumbnail)
        try container.encodeIfPresent(comics, forKey: .comics)
        try container.encodeIfPresent(series, forKey: .series)
        try container.encodeIfPresent(events, forKey: .events)
        try container.encodeIfPresent(characters, forKey: .characters)
        try container.encodeIfPresent(creators, forKey: .creators)
        try container.encodeIfPresent(originalissue, forKey: .originalissue)
    }
}
