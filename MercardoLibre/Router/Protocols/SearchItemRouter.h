//
//  SearchItemRouter.h
//  MercardoLibre
//
//  Created by Ricardo Herrera on 7/31/18.
//  Copyright © 2018 TestMercardoLibre. All rights reserved.
//
#import "Product.h"
#import "SearchProductView.h"

@protocol SearchItemRouter<NSObject>

@property(nonatomic,strong) id< SearchProductView > view;

- (void)initWithView: (id < SearchProductView >) view;

- (void)navigateToDetail:(Product *)product;

@end
