//
//  DetailCollectionTableViewCell.h
//  MercardoLibre
//
//  Created by Ricardo Herrera on 7/31/18.
//  Copyright © 2018 TestMercardoLibre. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailCollectionTableViewCell : UITableViewCell <UICollectionViewDelegate, UICollectionViewDataSource, UIScrollViewDelegate, UICollectionViewDelegateFlowLayout>

- (void)setupCell:(NSArray *)photos;
+ (NSString *)cellIdentifier;

@end
