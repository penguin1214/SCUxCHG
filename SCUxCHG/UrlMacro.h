//
//  UrlMacro.h
//  SCUxCHG
//
//  Created by 杨京蕾 on 5/14/16.
//  Copyright © 2016 yang. All rights reserved.
//

#ifndef                        UrlMacro_h
#define                        UrlMacro_h

#define kUrlBase        @"http://localhost:5000/api/"

#define kUrlUserLogin            kUrlBase@"user/login"
#define kUrlCategories           kUrlBase@"categories"
#define kUrlProductsOfCategory   kUrlBase@"category/products"
#define kUrlProduct              kUrlBase@"product"
#define kUrlAllProductsPairs     kUrlBase@"product/all_id_name_pairs"
#define kUrlSearchProductsByName kUrlBase@"product/search_by_name"
#define kUrlCheckUsableUserName  kUrlBase@"user/usable_username"
#define kUrlCheckUsablePhone     kUrlBase@"user/usable_phone"
#define kUrlAddNewUser           kUrlBase@"user/add_new_user"

#endif /* UrlMacro_h */
