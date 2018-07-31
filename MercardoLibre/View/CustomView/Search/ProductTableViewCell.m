//
//  ProductTableViewCell.m
//  MercardoLibre
//
//  Created by Ricardo Herrera on 7/30/18.
//  Copyright © 2018 TestMercardoLibre. All rights reserved.
//

#import "ProductTableViewCell.h"
#import "UIImageView+WebCache.h"

@interface ProductTableViewCell()

@property (weak, nonatomic) IBOutlet UIImageView *productImage;
@property (weak, nonatomic) IBOutlet UILabel *productTitle;
@property (weak, nonatomic) IBOutlet UILabel *productPrice;
@property (weak, nonatomic) IBOutlet UILabel *productAvailable;
@property (weak, nonatomic) IBOutlet UILabel *productCondition;

@end

@implementation ProductTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+ (NSString *)cellIdentifier {
    return @"ProductTableViewCellIdentifier";
}

- (void)setupCell:(Product *)product {
    self.productTitle.text = product.title;
    self.productPrice.text = [NSString stringWithFormat:@"%lu %@", product.price, product.currency];
    self.productAvailable.text = [NSString stringWithFormat:@"Disponibles: %lu", product.available];
    self.productCondition.text = product.condition;
    
    [self.productImage sd_setImageWithURL:[NSURL URLWithString:product.imageURL] placeholderImage:[UIImage imageNamed:@"placeholder"]];
}

@end
