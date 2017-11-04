//
//  InjectorTransformer.swift
//  DependencyInjector_ObjectMapper
//
//  Created by Benoit BRIATTE on 23/08/2017.
//  Copyright © 2017 Digipolitan. All rights reserved.
//

import DependencyInjector
import ObjectMapper

public class InjectorTransformerRegistry {

    public static let `default` = InjectorTransformerRegistry()

    private var registry: [String: Any]
    public let injector: Injector

    public init(injector: Injector = Injector.default) {
        self.registry = [:]
        self.injector = injector
    }

    public func get<BM /** BaseMappable */>(_ model: BM.Type) -> InjectorTransformer<BM> {
        let key = String(describing: model)
        if let res = self.registry[key] as? InjectorTransformer<BM> {
            return res
        }
        let res = InjectorTransformer<BM>(injector: self.injector)
        self.registry[key] = res
        return res
    }
}

public class InjectorTransformer<BM>: TransformType {

    public typealias Object = BM
    public typealias JSON = [String: Any]

    public weak var injector: Injector?

    public init(injector: Injector? = Injector.default) {
        self.injector = injector
    }

    public func transformFromJSON(_ value: Any?) -> BM? {
        guard let injector = self.injector else {
            return nil
        }
        if value != nil {
            guard let dict = value as? [String: Any] else {
                return nil
            }
            return try? injector.inject(BM.self, arguments: dict)
        }
        return try? injector.inject(BM.self)
    }

    public func transformToJSON(_ value: BM?) -> [String: Any]? {
        if let mappable = value as? BaseMappable {
            return mappable.toJSON()
        }
        return nil
    }
}
