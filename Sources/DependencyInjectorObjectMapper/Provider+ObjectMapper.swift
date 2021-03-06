//
//  Provider+ObjectMapper.swift
//  DependencyInjector_ObjectMapper
//
//  Created by Benoit BRIATTE on 23/08/2017.
//  Copyright © 2017 Digipolitan. All rights reserved.
//

import DependencyInjector
import ObjectMapper

public extension Provider {

    convenience init(type: BaseMappable.Type) {
        self.init { (_, arguments) -> T? in
            if let res = type.init(JSON: arguments ?? [:]) as? T {
                return res
            }
            return nil
        }
    }
}
