//
//  PersistentStore.h
//  ShoppingCart
//
//  Created by Suhit P on 08/11/15.
//  Copyright © 2015 Suhit. All rights reserved.
//

@import Foundation;
@import CoreData;

@class Product;
@class CartItem;

@interface PersistentStore : NSObject

@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;

- (void)initProducts;
- (NSArray *)loadAllProducts;
- (void)saveContext;

- (double)totalAmount;
- (NSInteger)totalProducts;
- (NSMutableArray *)loadCartItems;

- (BOOL)removeItem:(CartItem *)item;
- (BOOL)addItemToCart:(Product *)product;
- (BOOL)addItemToCart:(Product *)product quantity:(NSInteger) quantity;


@end
