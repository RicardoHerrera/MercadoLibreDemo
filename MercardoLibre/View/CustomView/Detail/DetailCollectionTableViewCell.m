//
//  DetailCollectionTableViewCell.m
//  MercardoLibre
//
//  Created by Ricardo Herrera on 7/31/18.
//  Copyright © 2018 TestMercardoLibre. All rights reserved.
//

#import "DetailCollectionTableViewCell.h"
#import "ItemCollectionViewCell.h"
#import "ItemPictures.h"
@interface DetailCollectionTableViewCell()

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
@property (strong, nonatomic) NSArray *photos;

@end

@implementation DetailCollectionTableViewCell

#pragma mark - Initialization
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [self.collectionView registerNib:[UINib nibWithNibName:@"ItemCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:[ItemCollectionViewCell cellIdentifier]];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - CollectionViewDelegate, CollectionViewDataSource
- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.photos.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ItemCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[ItemCollectionViewCell cellIdentifier] forIndexPath:indexPath];
    ItemPictures *picture = self.photos[indexPath.row];
    [cell setImageWithURL:picture.url];
    
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake([[UIScreen mainScreen] bounds].size.width - 20, self.collectionView.frame.size.height);
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    CGFloat pageWidth = [[UIScreen mainScreen] bounds].size.width - 20;
    self.pageControl.currentPage = self.collectionView.contentOffset.x / pageWidth;
}

#pragma mark - Public
- (void)setupCell:(NSArray *)photos {
    self.photos = [NSArray arrayWithArray:photos];
    [self.collectionView reloadData];
    
    self.pageControl.numberOfPages = self.photos.count;
}

+ (NSString *)cellIdentifier {
    return @"DetailCollectionTableViewCellIdentifier";
}

@end
