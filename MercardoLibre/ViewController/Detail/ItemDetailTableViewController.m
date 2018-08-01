//
//  ItemDetailTableViewController.m
//  MercardoLibre
//
//  Created by Ricardo Herrera on 7/31/18.
//  Copyright © 2018 TestMercardoLibre. All rights reserved.
//

#import "ItemDetailTableViewController.h"
#import "DetailCollectionTableViewCell.h"
#import "ItemDetailPresenterImp.h"
#import "MBProgressHUD.h"
#import "ItemInfoTableViewCell.h"
#import "ItemDescriptionTableViewCell.h"

typedef enum : NSUInteger {
    ItemDetailImages = 0,
    ItemDetailInfo,
//    ItemDetailBuy,
    ItemDetailDescription,
    ItemDetailNumberOfRows
} ItemDetail;

@interface ItemDetailTableViewController ()

@property ItemDetailPresenterImp *presenter;
@property (nonatomic, assign) BOOL shouldExpandDesc;

@end

@implementation ItemDetailTableViewController

#pragma mark - Initialization
- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%@", self.product.title);
    self.tableView.estimatedRowHeight = 20;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    [self.tableView registerNib:[UINib nibWithNibName:@"DetailCollectionTableViewCell" bundle:nil] forCellReuseIdentifier:[DetailCollectionTableViewCell cellIdentifier]];
    [self.tableView registerNib:[UINib nibWithNibName:@"ItemInfoTableViewCell" bundle:nil] forCellReuseIdentifier:[ItemInfoTableViewCell cellIdentifier]];
    [self.tableView registerNib:[UINib nibWithNibName:@"ItemDescriptionTableViewCell" bundle:nil] forCellReuseIdentifier:[ItemDescriptionTableViewCell cellIdentifier]];
    self.presenter = [[ItemDetailPresenterImp alloc] init];
    [self.presenter initWithView:self];
    
    [self.presenter getDetailWithId:self.product.productId];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return ItemDetailNumberOfRows;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case ItemDetailImages: {
            DetailCollectionTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[DetailCollectionTableViewCell cellIdentifier]];
            if (self.product.pictures != nil) {
                [cell setupCell:self.product.pictures];
            }
            return cell;
        }
        case ItemDetailInfo: {
            ItemInfoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[ItemInfoTableViewCell cellIdentifier]];
            if (self.product != nil) {
                [cell configureCellForProduct:self.product];
            }
            return cell;
        }
        case ItemDetailDescription: {
            ItemDescriptionTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[ItemDescriptionTableViewCell cellIdentifier]];
            if (self.shouldExpandDesc) {
                [cell expandCell];
            }
            if (self.product != nil) {
                [cell configureCellForProduct:self.product.productDescription];
            }
            return cell;
        }
    }
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == ItemDetailDescription) {
        self.shouldExpandDesc = !self.shouldExpandDesc;
        [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

#pragma mark - ItemDetailView
- (void)showLoading {
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
}

- (void)hideLoading {
    [MBProgressHUD hideHUDForView:self.view animated:YES];
}

- (void)onProductReceived:(Product *)product {
    self.product = product;
    [self.tableView reloadData];
    [self.presenter getDescriptionWithId:self.product.productId];
}

- (void)onDescriptionReceived:(NSString *)description {
    if (self.product != nil) {
        self.product.productDescription = description;
        [self.tableView reloadData];
    }
}

@end
