//
//  SearchResult.m
//  MercardoLibre
//
//  Created by Ricardo Herrera on 7/31/18.
//  Copyright © 2018 TestMercardoLibre. All rights reserved.
//

#import "SearchResult.h"
#import "Product.h"

@implementation SearchResult

- (instancetype)initWithAttributes:(NSDictionary *)attributes {
    self = [super init];
    if (!self) {
        return nil;
    }
    NSDictionary *pagin = [attributes valueForKey:@"paging"];
    self.total = (NSUInteger)[[pagin valueForKeyPath:@"total"] intValue];
    self.offset = (NSUInteger)[[pagin valueForKeyPath:@"offset"] intValue];
    
    NSArray *productsFromResponse = [attributes valueForKeyPath:@"results"];
    NSMutableArray *mutablePosts = [NSMutableArray arrayWithCapacity:[productsFromResponse count]];
    for (NSDictionary *attributes in productsFromResponse) {
        Product *product = [[Product alloc] initWithAttributes:attributes];
        [mutablePosts addObject:product];
    }   
    self.products = mutablePosts;
    return self;
}

@end
