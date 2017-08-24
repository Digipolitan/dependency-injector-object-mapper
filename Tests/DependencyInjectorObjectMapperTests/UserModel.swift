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
    public var address: Address

    public init(id: String, address: Address) {
        self.id = id
        self.address = address
    }

    public required init?(map: Map) {
        guard
            let id: String = try? map.value("id"),
            let address: Address = try? map.injectedValue("address") else {
                return nil
        }
        self.id = id
        self.address = address
    }

    public func mapping(map: Map) {
        self.id >>> map["id"]
        self.created <- map["createdAt"]
        self.address >>> map.inject("address")
    }
}
