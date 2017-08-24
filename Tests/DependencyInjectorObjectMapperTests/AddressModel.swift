//
//  AddressModel.swift
//  DependencyInjectorObjectMapper
//
//  Created by Benoit BRIATTE on 23/08/2017.
//  Copyright © 2017 Digipolitan. All rights reserved.
//

import ObjectMapper

class AddressModel: Address, Mappable {
    public var street: String
    public var zipCode: String
    public var country: String

    public init(street: String, zipCode: String, country: String) {
        self.street = street
        self.zipCode = zipCode
        self.country = country
    }

    public required init?(map: Map) {
        guard let street: String = try? map.value("street"), let zipCode: String = try? map.value("zipCode"), let country: String = try? map.value("country") else {
            return nil
        }
        self.street = street
        self.zipCode = zipCode
        self.country = country
    }

    public func mapping(map: Map) {
        self.street >>> map["street"]
        self.zipCode >>> map["zipCode"]
        self.country >>> map["country"]
    }
}
