//
//  Product.h
//  MercardoLibre
//
//  Created by Ricardo Herrera on 7/31/18.
//  Copyright © 2018 TestMercardoLibre. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ItemPictures;

@interface Product : NSObject

@property (nonatomic, strong) NSString *productId;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *currency;
@property (nonatomic, assign) NSUInteger price;
@property (nonatomic, strong) NSString *condition;
@property (nonatomic, assign) NSUInteger available;
@property (nonatomic, strong) NSString *imageURL;
@property (nonatomic, strong) NSArray<ItemPictures *> *pictures;
@property (nonatomic, strong) NSString *productDescription;

- (instancetype)initWithAttributes:(NSDictionary *)attributes;
- (instancetype)initWithDetailAttributes:(NSDictionary *)attributes;

@end
