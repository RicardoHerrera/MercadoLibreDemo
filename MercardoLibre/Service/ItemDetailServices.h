//
//  ItemDetailServices.h
//  MercardoLibre
//
//  Created by Ricardo Herrera on 8/1/18.
//  Copyright © 2018 TestMercardoLibre. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Product;

@interface ItemDetailServices : NSObject

+ (void)getItemdDetailById:(NSString *)itemId
            withCompletion:(void (^)(Product *product, NSError *error))completion;
+ (void)getItemdDescriptionById:(NSString *)itemId
                 withCompletion:(void (^)(NSString *itemDescription, NSError *error))completion;
@end
