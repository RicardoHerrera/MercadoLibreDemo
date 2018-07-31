//
//  ViewController.m
//  MercardoLibre
//
//  Created by Ricardo Herrera on 7/30/18.
//  Copyright © 2018 TestMercardoLibre. All rights reserved.
//

#import "SearchItemViewController.h"
#import "SearchServices.h"
#import "ProductTableViewCell.h"
#import "SearchResult.h"
#import "MBProgressHUD.h"
#import "SearchItemPresenterImp.h"

@interface SearchItemViewController ()

@property (nonatomic, strong) NSMutableArray *products;
@property (nonatomic, assign) NSInteger offset;
@property (nonatomic, strong) NSString *searchString;

@end

@implementation SearchItemViewController

# pragma mark - Initialization
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.products = [NSMutableArray new];
    self.offset = -1;
    self.presenter = [[SearchItemPresenterImp alloc] init];
    [self.presenter initWithView:self];
    [self.tableView registerNib:[UINib nibWithNibName:@"ProductTableViewCell" bundle:nil]
         forCellReuseIdentifier:[ProductTableViewCell cellIdentifier]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableDatasource, UITableDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (self.products.count == 0) {
        return 0;
    } else if (self.offset == -1 && self.products.count > 0) {
        return self.products.count;
    } else {
        return self.products.count + 1;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == self.products.count) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LoadingCell"];
        cell.textLabel.text = @"Cargar Más..";
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    ProductTableViewCell *cell = (ProductTableViewCell *)[tableView
                                                          dequeueReusableCellWithIdentifier:[ProductTableViewCell cellIdentifier]];
    Product *product = self.products[indexPath.row];
    [cell setupCell: product];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return (indexPath.row == self.products.count) ? 44 : 127.0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == self.products.count) {
        [self.presenter getProductsForText:self.searchString withOffset:self.offset];
    }
}
#pragma mark - UISearchBarDelegate
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    self.searchString = searchBar.text;
    self.offset = -1;
    [self.products removeAllObjects];
    [self.presenter getProductsForText:self.searchString withOffset:self.offset];
}

#pragma mark - View Delegate
- (void) onProductsReceived:(NSArray *)array withOffset:(NSInteger)offset forTotal:(NSInteger)total {
    [self.products addObjectsFromArray:array];
    if (self.products.count >= total) {
        self.offset = -1;
    } else {
        self.offset = offset;
    }
    [self.tableView reloadData];
}

- (void)showLoading {
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
}

- (void)hideLoading {
    [MBProgressHUD hideHUDForView:self.view animated:YES];
}

@end
