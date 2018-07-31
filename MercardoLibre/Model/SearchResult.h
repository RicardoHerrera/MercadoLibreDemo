//
//  SearchResult.h
//  MercardoLibre
//
//  Created by Ricardo Herrera on 7/31/18.
//  Copyright © 2018 TestMercardoLibre. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Product;

@interface SearchResult : NSObject

@property (nonatomic, assign) NSUInteger total;
@property (nonatomic, assign) NSUInteger offset;
@property (nonatomic, strong) NSArray<Product *> *products;

- (instancetype)initWithAttributes:(NSDictionary *)attributes;

@end
