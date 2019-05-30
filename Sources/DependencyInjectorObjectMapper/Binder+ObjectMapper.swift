//
//  Binder+ObjectMapper.swift
//  DependencyInjector_ObjectMapper
//
//  Created by Benoit BRIATTE on 23/08/2017.
//  Copyright © 2017 Digipolitan. All rights reserved.
//

import DependencyInjector
import ObjectMapper

public extension Binder {

    @discardableResult
    func to(_ type: Mappable.Type) -> Self {
        return self.to(Provider(type: type))
    }

    @discardableResult
    func to(_ type: BaseMappable.Type) -> Self {
        return self.to(Provider(type: type))
    }

    @discardableResult
    func to(_ type: ImmutableMappable.Type) -> Self {
        return self.to(Provider(type: type))
    }
}
