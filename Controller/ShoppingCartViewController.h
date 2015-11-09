//
//  ShoppingCartTableViewController.h
//  ShoppingCart
//
//  Created by Suhit P on 05/11/15.
//  Copyright © 2015 Suhit. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PersistentStore.h"

@interface ShoppingCartViewController : UITableViewController

@property (nonatomic, strong) PersistentStore *store;

- (void)loadCartItems;

@end
