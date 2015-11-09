//
//  Product.m
//  ShoppingCart
//
//  Created by Suhit P on 08/11/15.
//  Copyright © 2015 Suhit. All rights reserved.
//

#import "Product.h"

@class Product;

@implementation Product

// Insert code here to add functionality to your managed object subclass
+ (void)insertItemWithId:(NSInteger )itemId
                    name:(NSString *)name
                   price:(double)price
                   image:(NSString *)imageName
  inManagedObjectContext:(NSManagedObjectContext *)managedObjectContext
{
    Product *product = [NSEntityDescription insertNewObjectForEntityForName:self.entityName inManagedObjectContext:managedObjectContext];
    product.itemId = @(itemId);
    product.name   = name;
    product.price  = @(price);
    product.image = imageName;
}

+ (NSString *)entityName
{
    return @"Product";
}

@end
