//
//  ItemDetailTableViewController.h
//  MercardoLibre
//
//  Created by Ricardo Herrera on 7/31/18.
//  Copyright © 2018 TestMercardoLibre. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Product.h"
#import "ItemDetailView.h"

@interface ItemDetailTableViewController : UITableViewController <ItemDetailView>

@property (nonatomic, strong) Product *product;

@end
