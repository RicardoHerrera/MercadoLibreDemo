//
//  ItemPictures.m
//  MercardoLibre
//
//  Created by Ricardo Herrera on 8/1/18.
//  Copyright © 2018 TestMercardoLibre. All rights reserved.
//

#import "ItemPictures.h"

@implementation ItemPictures

- (instancetype)initWithAttributes:(NSDictionary *)attributes {
    self = [super init];
    if (!self) {
        return nil;
    }
    self.imageId = [attributes valueForKeyPath:@"id"];
    self.url = [attributes valueForKeyPath:@"secure_url"];
    
    return self;
}

@end
