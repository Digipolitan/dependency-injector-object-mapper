//
//  UserModel.swift
//  DependencyInjectorObjectMapper
//
//  Created by Benoit BRIATTE on 23/08/2017.
//  Copyright © 2017 Digipolitan. All rights reserved.
//

import Foundation
import ObjectMapper
import DependencyInjectorObjectMapper

class UserModel: User, Mappable {
    public var id: String
    public var created: Date?
    public var addresses: [Address]

    public init(id: String, addresses: [Address]) {
        self.id = id
        self.addresses = addresses
    }

    public required init?(map: Map) {
        guard
            let id: String = try? map.value("id") else {
                return nil
        }
        self.id = id
        self.addresses = (try? map.injectedValue("addresses", type: Address.self)) ?? []
    }

    public func mapping(map: Map) {
        self.id >>> map["id"]
        self.created <- (map["createdAt"], DateTransform())
        self.addresses >>> map.inject("addresses", type: Address.self)
    }
}

class Sample: UserModel {
    public let sample: String

    public required init?(map: Map) {
        self.sample = ""
        super.init(map: map)
    }
}
