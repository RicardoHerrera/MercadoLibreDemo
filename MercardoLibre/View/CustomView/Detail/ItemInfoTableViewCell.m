//
//  ItemInfoTableViewCell.m
//  MercardoLibre
//
//  Created by Ricardo Herrera on 8/1/18.
//  Copyright © 2018 TestMercardoLibre. All rights reserved.
//

#import "ItemInfoTableViewCell.h"
#import "Product.h"

@interface ItemInfoTableViewCell()

@property (weak, nonatomic) IBOutlet UILabel *itemTitle;
@property (weak, nonatomic) IBOutlet UILabel *itemPrice;
@property (weak, nonatomic) IBOutlet UILabel *itemCondition;

@end

@implementation ItemInfoTableViewCell

#pragma mark - Initialization
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - Public methods
- (void)configureCellForProduct:(Product *)product {
    self.itemTitle.text = product.title;
    self.itemPrice.text = [NSString stringWithFormat:@"%@ %ld", product.currency, product.price];
    self.itemCondition.text = product.condition;
}

+ (NSString *)cellIdentifier {
    return @"ItemInfoTableViewCellIdentifier";
}

@end
