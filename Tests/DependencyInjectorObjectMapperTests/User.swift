//
//  User.swift
//  DependencyInjectorObjectMapper
//
//  Created by Benoit BRIATTE on 23/08/2017.
//  Copyright © 2017 Digipolitan. All rights reserved.
//

import Foundation
import ObjectMapper

public protocol User: BaseMappable {
    var id: String { get set }
    var created: Date? { get set }
    var address: Address { get set }
}
