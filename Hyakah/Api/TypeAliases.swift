//
//  TypeAliases.swift
//  Hyakah
//
//  Created by Mac on 9/11/19.
//  Copyright © 2019 Mac. All rights reserved.
//

import Foundation

typealias InternetConnectionChecker = (_ status: Bool) -> Void
typealias RequestHandlerCMSPages = (_ response: MainPagesModels?) -> Void
typealias CategorRequestHandler  = (_ response: [CategoriesModel]?) -> Void
typealias ProductsRequestHandler  = (_ response: [ProductsModel]?) -> Void
typealias ProductRequestHandler = (_ response: ProductsModel?) -> Void
typealias ReviewsRequestHandler  = (_ response: [ReviewModel]?) -> Void
