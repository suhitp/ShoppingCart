//
//  ShoppingMenuViewController.h
//  ShoppingCart
//
//  Created by Suhit P on 27/01/16.
//  Copyright © 2015 Suhit. All rights reserved.
//

@import UIKit;
@class PersistentStore;

@interface ShoppingItemsViewController : UITableViewController

@property (nonatomic, strong) NSManagedObjectContext *manageObjectContext;
@property (nonatomic, strong) PersistentStore *store;

@end
