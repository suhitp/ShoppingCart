//
//  ShoppingCartTableViewController.m
//  ShoppingCart
//
//  Created by Suhit P on 27/01/16.
//  Copyright © 2015 Suhit. All rights reserved.
//

#import "ShoppingCartViewController.h"
#import "ShoppingCartCell.h"
#import "CartItem.h"
#import "AppDelegate.h"

@interface ShoppingCartViewController ()

@property (nonatomic, strong) NSMutableArray *items;

@end

@implementation ShoppingCartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.tableFooterView = [UIView new];
    [self loadCartItems];
}

- (void)loadCartItems {
    self.items = [self.store loadCartItems];
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
    ShoppingCartCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ShoppingCartCell" forIndexPath:indexPath];
    NSString *rupeeSign = @"\u20B9";
    
    CartItem *item = self.items[indexPath.row];
    cell.nameLabel.text = item.name;
    cell.priceLabel.text = [NSString stringWithFormat:@"%@%@",rupeeSign, item.price];;
    cell.quantityLabel.text = [NSString stringWithFormat:@"Qty: %@", item.quantity];
    cell.cartImageView.image = [UIImage imageNamed:item.image];
    
    [cell.removeItemButton addTarget:self action:@selector(removeFromCart:) forControlEvents:UIControlEventTouchUpInside];
    cell.removeItemButton.layer.cornerRadius = 5;
    cell.removeItemButton.tag = indexPath.row;
    
    return cell;
}

- (void)removeFromCart:(UIButton *)button {
    CartItem *item = [self.items objectAtIndex:button.tag];
    BOOL success = [self.store removeItem:item];
    if(success)
    {
        [self.tableView beginUpdates];
        [self.items removeObjectAtIndex:button.tag];
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:button.tag inSection:0];
        [self.tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]
                              withRowAnimation:UITableViewRowAnimationFade];
        [self.tableView endUpdates];
        
        [self.tableView reloadData];
        
        [(AppDelegate *)[[UIApplication sharedApplication] delegate] updateCartTabBadge];
    }

}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {

   
    UIView *headerview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 70)];
    headerview.backgroundColor = [UIColor brownColor];
    UILabel *totalLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 70)];
    totalLabel.numberOfLines = 2;
    totalLabel.textAlignment = NSTextAlignmentCenter;
    totalLabel.font = [UIFont fontWithName:@"Avenir-Bold" size:15];
    totalLabel.textColor = [UIColor whiteColor];
    NSString *rupeeSign = @"\u20B9";
    
    if ([self.store totalProducts] > 0) {
        totalLabel.text = [NSString stringWithFormat:@"Total Items: (%ld)\nPay: %@%.2f",[self.store totalProducts], rupeeSign, [self.store totalAmount]];
    } else {
        totalLabel.text = @"Your cart is empty,\n add some items to the cart :-)";
    }
    
    [headerview addSubview:totalLabel];
    return headerview;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 70.0f;
}

@end
