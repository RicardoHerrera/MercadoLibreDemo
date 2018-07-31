//
//  ProductTableViewCell.h
//  MercardoLibre
//
//  Created by Ricardo Herrera on 7/30/18.
//  Copyright © 2018 TestMercardoLibre. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Product.h"

@interface ProductTableViewCell : UITableViewCell

+ (NSString *)cellIdentifier;
- (void)setupCell:(Product *)product;

@end
