//
//  ItemDetailView.h
//  MercardoLibre
//
//  Created by Ricardo Herrera on 7/31/18.
//  Copyright © 2018 TestMercardoLibre. All rights reserved.
//
#import "Product.h"

@protocol ItemDetailView <NSObject>

- (void)showLoading;
- (void)hideLoading;
- (void)onProductReceived:(Product *)product;
- (void)onDescriptionReceived:(NSString *)description;
@end
