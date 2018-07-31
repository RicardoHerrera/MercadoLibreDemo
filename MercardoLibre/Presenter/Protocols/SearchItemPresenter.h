//
//  SearchItemPresenter.h
//  MercardoLibre
//
//  Created by Ricardo Herrera on 7/31/18.
//  Copyright © 2018 TestMercardoLibre. All rights reserved.
//

#import "SearchProductView.h"

@protocol SearchItemPresenter<NSObject>

@property(nonatomic,strong) id< SearchProductView > view;

- (void) initWithView: (id < SearchProductView >) view;

- (void)getProductsForText:(NSString *)searchString withOffset:(NSInteger)offset;

@end
