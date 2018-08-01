//
//  ItemDescriptionTableViewCell.m
//  MercardoLibre
//
//  Created by Ricardo Herrera on 8/1/18.
//  Copyright © 2018 TestMercardoLibre. All rights reserved.
//

#import "ItemDescriptionTableViewCell.h"
@interface ItemDescriptionTableViewCell()

@property (weak, nonatomic) IBOutlet UILabel *itemDescription;
@property (weak, nonatomic) IBOutlet UILabel *arrowIndicator;

@end

@implementation ItemDescriptionTableViewCell

#pragma mark - Initialization
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - Public
+ (NSString *)cellIdentifier {
    return @"ItemDescriptionTableViewCellIdentifier";
}

- (void)configureCellForProduct:(NSString *)productDescription {
    self.itemDescription.text = productDescription;
}

- (void)expandCell {
    self.itemDescription.numberOfLines = 0;
    self.arrowIndicator.transform = CGAffineTransformMakeRotation(M_PI_2);
}

@end
