//
//  Address.swift
//  DependencyInjectorObjectMapper
//
//  Created by Benoit BRIATTE on 23/08/2017.
//  Copyright © 2017 Digipolitan. All rights reserved.
//

import ObjectMapper

public protocol Address: BaseMappable {
    var street: String { get set }
    var zipCode: String { get set }
    var country: String { get set }
}
