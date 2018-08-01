//
//  ItemDescriptionTableViewCell.h
//  MercardoLibre
//
//  Created by Ricardo Herrera on 8/1/18.
//  Copyright © 2018 TestMercardoLibre. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ItemDescriptionTableViewCell : UITableViewCell

+ (NSString *)cellIdentifier;
- (void)configureCellForProduct:(NSString *)productDescription;
- (void)expandCell;

@end
