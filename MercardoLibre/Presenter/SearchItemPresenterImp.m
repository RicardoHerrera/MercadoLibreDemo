//
//  SearchItemPresenterImp.m
//  MercardoLibre
//
//  Created by Ricardo Herrera on 7/31/18.
//  Copyright © 2018 TestMercardoLibre. All rights reserved.
//

#import "SearchItemPresenterImp.h"

#import "SearchProductView.h"
#import "SearchServices.h"
#import "SearchResult.h"

@implementation SearchItemPresenterImp

@synthesize view;

-(void) initWithView:(id<SearchProductView>)theView {
    self.view = theView;
}

- (void)getProductsForText:(NSString *)searchString withOffset:(NSInteger)offset {
    [self.view showLoading];
    [SearchServices searchProductWithText:searchString offset:offset + 1 withCompletion:^(SearchResult *result, NSError *error) {
        [self.view hideLoading];
        if (!error) {
            [self.view onProductsReceived:result.products withOffset:result.offset forTotal:result.total];
        } else {
            // TODO: Handle error
            NSLog(@"%@", error.localizedDescription);
        }
    }];
}

@end
