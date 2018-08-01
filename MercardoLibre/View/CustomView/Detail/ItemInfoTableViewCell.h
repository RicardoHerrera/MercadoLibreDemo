//
//  ItemInfoTableViewCell.h
//  MercardoLibre
//
//  Created by Ricardo Herrera on 8/1/18.
//  Copyright © 2018 TestMercardoLibre. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Product;

@interface ItemInfoTableViewCell : UITableViewCell

- (void)configureCellForProduct:(Product *)product;
+ (NSString *)cellIdentifier;

@end
