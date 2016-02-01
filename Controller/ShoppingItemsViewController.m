//
//  ShoppingMenuViewController.m
//  ShoppingCart
//
//  Created by Suhit P on 27/01/16.
//  Copyright © 2015 Suhit. All rights reserved.
//

#import "ShoppingItemsViewController.h"
#import "ShoppingMenuCell.h"
#import "PersistentStore.h"
#import "Product.h"
#import "ShoppingCartViewController.h"
#import "AppDelegate.h"

@interface ShoppingItemsViewController ()

@property(nonatomic, strong) NSArray *items;

@end

@implementation ShoppingItemsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.tableFooterView = [UIView new];
    self.tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
    
    // Load Items
    [self loadItems];
}


- (void)loadItems {
    self.items = [self.store loadAllProducts];
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.items.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ShoppingMenuCell *cell = [tableView dequeueReusableCellWithIdentifier:@"shoppingCell" forIndexPath:indexPath];
    
    Product *product = self.items[indexPath.row];
    NSString *rupeeSign = @"\u20B9";
    
    cell.productNameLabel.text = product.name;
    cell.priceLabel.text = [NSString stringWithFormat:@"%@%@",rupeeSign, product.price];
    cell.productImageView.image = [UIImage imageNamed:product.image];
    
    [cell.addToCartButton addTarget:self action:@selector(addToCart:) forControlEvents:UIControlEventTouchUpInside];
    cell.addToCartButton.layer.cornerRadius = 5;
    cell.addToCartButton.tag = indexPath.row;
    
    return cell;
}


- (void)addToCart:(UIButton *)button
{
    Product *item = [self.items objectAtIndex:button.tag];
    BOOL success = [self.store addItemToCart:item];
    
    if(success)
    {
        [(AppDelegate *)[[UIApplication sharedApplication] delegate] updateCartTabBadge];
        
        // reload cart items
        UINavigationController *cartNavController = (UINavigationController *)[self.tabBarController.viewControllers objectAtIndex:1];
        ShoppingCartViewController *cartViewController = (ShoppingCartViewController *)cartNavController.viewControllers[0];
        cartViewController.store = self.store;
        [cartViewController loadCartItems];
        
        NSString *message = [NSString stringWithFormat:@"%@ succesfully added to the cart", item.name];
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Product Added" message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alertView show];
    }
}


@end
