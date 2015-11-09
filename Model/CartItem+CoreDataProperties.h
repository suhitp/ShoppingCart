//
//  CartItem+CoreDataProperties.h
//  ShoppingCart
//
//  Created by Suhit P on 08/11/15.
//  Copyright © 2015 Suhit. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "CartItem.h"

@class Product;

NS_ASSUME_NONNULL_BEGIN

@interface CartItem (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSString *image;
@property (nullable, nonatomic, retain) NSNumber *price;
@property (nullable, nonatomic, retain) NSNumber *itemId;
@property (nullable, nonatomic, retain) NSNumber *quantity;
@property (nullable, nonatomic, retain) NSSet<Product *> *items;

@end

@interface CartItem (CoreDataGeneratedAccessors)

- (void)addItemsObject:(Product *)value;
- (void)removeItemsObject:(Product *)value;
- (void)addItems:(NSSet<Product *> *)values;
- (void)removeItems:(NSSet<Product *> *)values;

@end

NS_ASSUME_NONNULL_END
