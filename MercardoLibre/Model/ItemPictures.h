//
//  ItemPictures.h
//  MercardoLibre
//
//  Created by Ricardo Herrera on 8/1/18.
//  Copyright © 2018 TestMercardoLibre. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ItemPictures : NSObject

@property (nonatomic, strong) NSString *imageId;
@property (nonatomic, strong) NSString *url;

- (instancetype)initWithAttributes:(NSDictionary *)attributes;

@end
