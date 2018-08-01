//
//  ItemDetailPresenter.h
//  MercardoLibre
//
//  Created by Ricardo Herrera on 7/31/18.
//  Copyright © 2018 TestMercardoLibre. All rights reserved.
//

#import "ItemDetailView.h"

@protocol ItemDetailPresenter <NSObject>

@property(nonatomic,strong) id< ItemDetailView > view;

- (void)initWithView:(id < ItemDetailView >) view;
- (void)getDetailWithId:(NSString *)itemId;
- (void)getDescriptionWithId:(NSString *)itemId;

@end
