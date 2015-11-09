//
//  CartItem.m
//  ShoppingCart
//
//  Created by Suhit P on 08/11/15.
//  Copyright © 2015 Suhit. All rights reserved.
//

#import "CartItem.h"

@class CartItem;

@implementation CartItem

// Insert code here to add functionality to your managed object subclass

+ (void)insertItemWithId:(NSNumber *)itemId
                    name:(NSString *)name
                   price:(NSNumber *)price
                quantity:(NSNumber *)quantity
                   image:(NSString *)imageName
  inManagedObjectContext:(NSManagedObjectContext *)managedObjectContext
{
    CartItem *item = [NSEntityDescription insertNewObjectForEntityForName:self.entityName inManagedObjectContext:managedObjectContext];
    item.itemId = itemId;
    item.name   = name;
    item.price  = price;
    item.quantity = quantity;
    item.image = imageName;
}

+ (NSString *)entityName
{
    return @"CartItem";
}


@end
