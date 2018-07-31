//
//  SearchServices.m
//  MercardoLibre
//
//  Created by Ricardo Herrera on 7/30/18.
//  Copyright © 2018 TestMercardoLibre. All rights reserved.
//

#import "SearchServices.h"
#import "AFNetworking.h"
#import "SearchResult.h"

static NSString * const URLBaseString = @"https://api.mercadolibre.com/sites/MLU/";

@implementation SearchServices

+ (void)searchProductWithText:(NSString *)searchQuery
                       offset:(NSInteger)offset
               withCompletion:(void (^)(SearchResult *result, NSError *error))completion {
    AFHTTPSessionManager *session = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:URLBaseString]];
    session.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    
    NSDictionary *parameters = @{@"q": searchQuery, @"limit": @(10), @"offset": @(offset)};
    
    [session GET:@"search" parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable JSON) {
        SearchResult *result = [[SearchResult alloc] initWithAttributes:JSON];
        if (completion) {
            completion(result, nil);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (completion) {
            completion(nil, error);
        }
    }];
}

@end
