//
//  Product.m
//  MercardoLibre
//
//  Created by Ricardo Herrera on 7/31/18.
//  Copyright © 2018 TestMercardoLibre. All rights reserved.
//

#import "Product.h"
#import "ItemPictures.h"

@implementation Product

- (instancetype)initWithAttributes:(NSDictionary *)attributes {
    self = [super init];
    if (!self) {
        return nil;
    }
    self.productId = [attributes valueForKeyPath:@"id"];
    self.title = [attributes valueForKeyPath:@"title"];
    self.currency = [attributes valueForKeyPath:@"currency_id"];
    self.price = (NSUInteger)[[attributes valueForKeyPath:@"price"] intValue];
    self.condition = [attributes valueForKeyPath:@"condition"];
    self.available = (NSUInteger)[[attributes valueForKeyPath:@"available_quantity"] intValue];
    self.imageURL = [attributes valueForKeyPath:@"thumbnail"];
    
    return self;
}

- (instancetype)initWithDetailAttributes:(NSDictionary *)attributes {
    self = [super init];
    if (!self) {
        return nil;
    }
    self.productId = [attributes valueForKeyPath:@"id"];
    self.title = [attributes valueForKeyPath:@"title"];
    self.currency = [attributes valueForKeyPath:@"currency_id"];
    self.price = (NSUInteger)[[attributes valueForKeyPath:@"price"] intValue];
    self.available = (NSUInteger)[[attributes valueForKeyPath:@"available_quantity"] intValue];
    self.condition = [attributes valueForKeyPath:@"condition"];
    
    NSArray *picturesFromResponse = [attributes valueForKeyPath:@"pictures"];
    NSMutableArray *mutablePosts = [NSMutableArray arrayWithCapacity:[picturesFromResponse count]];
    for (NSDictionary *attributes in picturesFromResponse) {
        ItemPictures *product = [[ItemPictures alloc] initWithAttributes:attributes];
        [mutablePosts addObject:product];
    }
    self.pictures = mutablePosts;
    
    return self;
}

@end
