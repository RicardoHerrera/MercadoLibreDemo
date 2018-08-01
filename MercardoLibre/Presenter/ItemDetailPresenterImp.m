//
//  ItemDetailPresenterImp.m
//  MercardoLibre
//
//  Created by Ricardo Herrera on 7/31/18.
//  Copyright © 2018 TestMercardoLibre. All rights reserved.
//

#import "ItemDetailPresenterImp.h"
#import "ItemDetailServices.h"

@implementation ItemDetailPresenterImp

@synthesize view;

- (void)initWithView:(id<ItemDetailView>)view {
    self.view = view;
}

- (void)getDetailWithId:(NSString *)itemId {
    [self.view showLoading];
    [ItemDetailServices getItemdDetailById:itemId withCompletion:^(Product *product, NSError *error) {
        [self.view hideLoading];
        if (!error) {
            [self.view onProductReceived:product];
        } else {
            // TODO: Handle error
            NSLog(@"%@", error.localizedDescription);
        }
    }];
}

- (void)getDescriptionWithId:(NSString *)itemId {
    [self.view showLoading];
    [ItemDetailServices getItemdDescriptionById:itemId withCompletion:^(NSString *itemDescription, NSError *error) {
        [self.view hideLoading];
        if (!error) {
            [self.view onDescriptionReceived:itemDescription];
        } else {
            // TODO: Handle error
            NSLog(@"%@", error.localizedDescription);
        }
    }];
}

@end
