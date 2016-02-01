//
//  Product+CoreDataProperties.h
//  ShoppingCart
//
//  Created by Suhit P on 27/01/16.
//  Copyright © 2015 Suhit. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Product.h"

NS_ASSUME_NONNULL_BEGIN

@class CartItem;

@interface Product (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSNumber *itemId;
@property (nullable, nonatomic, retain) NSNumber *price;
@property (nullable, nonatomic, retain) NSString *image;
@property (nullable, nonatomic, retain) CartItem *cart;

@end

NS_ASSUME_NONNULL_END
