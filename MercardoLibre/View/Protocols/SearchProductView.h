//
//  SearchItemView.h
//  MercardoLibre
//
//  Created by Ricardo Herrera on 7/31/18.
//  Copyright © 2018 TestMercardoLibre. All rights reserved.
//

@protocol SearchProductView <NSObject>

- (void) showLoading;
- (void) hideLoading;
- (void) onProductsReceived:(NSArray *)array withOffset:(NSInteger)offset forTotal:(NSInteger)total;

//- (void) navigateToDetail: (int) index;

@end
