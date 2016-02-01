//
//  ShoppingCartTableViewController.h
//  ShoppingCart
//
//  Created by Suhit P on 27/01/16.
//  Copyright © 2015 Suhit. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PersistentStore.h"

@interface ShoppingCartViewController : UITableViewController

@property (nonatomic, strong) PersistentStore *store;

- (void)loadCartItems;

@end
