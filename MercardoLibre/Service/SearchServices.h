//
//  SearchServices.h
//  MercardoLibre
//
//  Created by Ricardo Herrera on 7/30/18.
//  Copyright © 2018 TestMercardoLibre. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SearchResult;

@interface SearchServices : NSObject

+ (void)searchProductWithText:(NSString *)searchQuery
                       offset:(NSInteger)offset
               withCompletion:(void (^)(SearchResult *result, NSError *error))completion;

@end
