//
//  SearchItemRouter.m
//  MercardoLibre
//
//  Created by Ricardo Herrera on 7/31/18.
//  Copyright © 2018 TestMercardoLibre. All rights reserved.
//

#import "SearchItemRouterImp.h"
#import "ItemDetailTableViewController.h"
#import "SearchItemViewController.h"

@implementation SearchItemRouterImp

@synthesize view;

- (void)initWithView: (id < SearchProductView >) view {
    self.view = view;
}

- (void)navigateToDetail:(Product *)product {
    SearchItemViewController *searchVC = (SearchItemViewController *)self.view;
    ItemDetailTableViewController *detailVC = [[ItemDetailTableViewController alloc] init];
    detailVC.product = product;
    [searchVC.navigationController pushViewController:detailVC animated:true];
}

@end
