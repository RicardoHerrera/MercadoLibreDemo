//
//  ItemDetailServices.m
//  MercardoLibre
//
//  Created by Ricardo Herrera on 8/1/18.
//  Copyright © 2018 TestMercardoLibre. All rights reserved.
//

#import "ItemDetailServices.h"
#import "AFNetworking.h"
#import "Product.h"

static NSString * const URLBaseString = @"https://api.mercadolibre.com/items/";

@implementation ItemDetailServices

+ (void)getItemdDetailById:(NSString *)itemId
            withCompletion:(void (^)(Product *product, NSError *error))completion {
    AFHTTPSessionManager *session = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:URLBaseString]];
    session.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    
    [session GET:itemId parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable JSON) {
        Product *result = [[Product alloc] initWithDetailAttributes:JSON];
        if (completion) {
            completion(result, nil);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (completion) {
            completion(nil, error);
        }
    }];
}

+ (void)getItemdDescriptionById:(NSString *)itemId
            withCompletion:(void (^)(NSString *itemDescription, NSError *error))completion {
    AFHTTPSessionManager *session = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:URLBaseString]];
    session.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    
    [session GET:[NSString stringWithFormat:@"%@/description", itemId] parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable JSON) {
        NSString *desc = [JSON valueForKey:@"plain_text"];
        if (completion) {
            completion(desc, nil);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (completion) {
            completion(nil, error);
        }
    }];
}

@end
