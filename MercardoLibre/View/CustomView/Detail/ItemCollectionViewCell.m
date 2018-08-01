//
//  ItemCollectionViewCell.m
//  MercardoLibre
//
//  Created by Ricardo Herrera on 7/31/18.
//  Copyright © 2018 TestMercardoLibre. All rights reserved.
//

#import "ItemCollectionViewCell.h"
#import "UIImageView+WebCache.h"

@interface ItemCollectionViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *itemImageView;

@end

@implementation ItemCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setImageWithURL:(NSString *)imageUrl {
    [self.itemImageView sd_setImageWithURL:[NSURL URLWithString:imageUrl]];
}

+ (NSString *)cellIdentifier {
    return @"ItemCollectionViewCell";
}

@end
