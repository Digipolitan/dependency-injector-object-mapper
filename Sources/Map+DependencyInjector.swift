//
//  Map+DependencyInjector.swift
//  DependencyInjectorObjectMapper
//
//  Created by Benoit BRIATTE on 24/08/2017.
//  Copyright © 2017 Digipolitan. All rights reserved.
//

import ObjectMapper

public extension Map {

    public func injectedValue<BM>(_ key: String, type: BM.Type) throws -> BM {
        return try self.value(key, using: InjectorTransformerRegistry.default.get(type))
    }

    public func injectedValue<BM>(_ key: String, type: BM.Type) throws -> [BM] {
        return try self.value(key, using: InjectorTransformerRegistry.default.get(type))
    }

    public func inject<BM>(_ key: String, type: BM.Type) -> (Map, InjectorTransformer<BM>) {
        return (self[key], InjectorTransformerRegistry.default.get(type))
    }
}
