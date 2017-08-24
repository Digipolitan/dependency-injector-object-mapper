//
//  DefaultModule.swift
//  DependencyInjectorObjectMapper
//
//  Created by Benoit BRIATTE on 23/08/2017.
//  Copyright © 2017 Digipolitan. All rights reserved.
//

import DependencyInjector

class DefaultModule: Module {

    override init() {
        super.init()
        self.bind(User.self).to(UserModel.self)
        self.bind(Address.self).to(AddressModel.self)
    }
}
