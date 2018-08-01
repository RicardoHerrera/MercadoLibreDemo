//
//  ItemCollectionViewCell.h
//  MercardoLibre
//
//  Created by Ricardo Herrera on 7/31/18.
//  Copyright © 2018 TestMercardoLibre. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ItemCollectionViewCell : UICollectionViewCell

- (void)setImageWithURL:(NSString *)imageUrl;
+ (NSString *)cellIdentifier;

@end
