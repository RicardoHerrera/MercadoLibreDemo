//
//  ViewController.h
//  MercardoLibre
//
//  Created by Ricardo Herrera on 7/30/18.
//  Copyright © 2018 TestMercardoLibre. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SearchProductView.h"
#import "SearchItemPresenterImp.h"
#import "SearchItemRouterImp.h"

#define kSegueNavigateToDetail @"navigateToDetail"

@interface SearchItemViewController : UITableViewController <UISearchBarDelegate, SearchProductView>

@property SearchItemPresenterImp *presenter;
@property SearchItemRouterImp *router;

@end

