//
//  PersistentStore.m
//  ShoppingCart
//
//  Created by Suhit P on 08/11/15.
//  Copyright © 2015 Suhit. All rights reserved.
//

#import "PersistentStore.h"
#import "Product.h"
#import "CartItem.h"

@implementation PersistentStore


- (void)initProducts {
    
    [Product insertItemWithId:1 name:@"Dress" price:1650 image:@"dress" inManagedObjectContext:self.managedObjectContext];
    
    [Product insertItemWithId:3 name:@"Sandals" price:620 image:@"sandals" inManagedObjectContext:self.managedObjectContext];
    
    [Product insertItemWithId:4 name:@"Cap" price:525 image:@"cap1" inManagedObjectContext:self.managedObjectContext];
    
    [Product insertItemWithId:2 name:@"Top" price:875.5 image:@"top" inManagedObjectContext:self.managedObjectContext];
    
    //save all entities
    [self saveContext];
    
}

#pragma mark - SaveContext
- (void)saveContext {
    
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        NSError *error = nil;
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            //abort();
        }
    }
}

#pragma mark - Products
- (NSArray *)loadAllProducts {
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription
                                   entityForName:@"Product" inManagedObjectContext:self.managedObjectContext];
    [fetchRequest setEntity:entity];
    
    NSError *error;
    NSArray *fetchedObjects = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    if (fetchedObjects.count > 0) {
        return fetchedObjects;
    }
    return nil;
}

#pragma mark - CartItems
- (NSMutableArray *)loadCartItems {
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"CartItem" inManagedObjectContext:self.managedObjectContext];
    [fetchRequest setEntity:entity];
    NSError *error;
    NSArray *fetchedObjects = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    if (fetchedObjects.count > 0) {
        NSMutableArray *items = [NSMutableArray arrayWithArray:fetchedObjects];
        return items;
    }
    return nil;
}

- (double)totalAmount
{
    double total = 0;
    
    NSMutableArray *items = [self loadCartItems];
    
    for(CartItem *item in items)
    {
        total += (item.price.doubleValue * item.quantity.integerValue);
    }
    return total;
}


- (NSInteger)totalProducts
{
    int total = 0;
    
    NSMutableArray *items = [self loadCartItems];
    
    for(CartItem *item in items)
    {
        total += [item.quantity integerValue];
    }
    return total;
}


#pragma mark - Cart
- (BOOL)addItemToCart:(Product *)product
{
    return [self addItemToCart:product quantity:1];
}

- (BOOL)addItemToCart:(Product *)product quantity:(NSInteger)quantity {
    
    BOOL success = NO;
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"CartItem" inManagedObjectContext:self.managedObjectContext];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"itemId == %@", product.itemId];
    [fetchRequest setEntity:entity];
    [fetchRequest setPredicate:predicate];
    
    NSError *error;
    NSArray *fetchedObjects = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    
    if (fetchedObjects.count > 0) {
        CartItem *item = fetchedObjects[0];
        NSInteger count = [item.quantity integerValue] + quantity;
        [item setValue:@(count) forKey:@"quantity"];
        [self saveContext];
        success = YES;
    } else {
        [CartItem insertItemWithId:product.itemId  name:product.name price:product.price quantity:@(1) image:product.image inManagedObjectContext:self.managedObjectContext];
        [self saveContext];
        success = YES;
    }
    
    return success;
}

- (BOOL)removeItem:(CartItem *)item {
    BOOL success = NO;
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"CartItem" inManagedObjectContext:self.managedObjectContext];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"itemId == %@", item.itemId];
    [fetchRequest setEntity:entity];
    [fetchRequest setPredicate:predicate];
    
    NSError *error;
    NSArray *fetchedObjects = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    
    if (fetchedObjects.count > 0) {
        [self.managedObjectContext deleteObject:fetchedObjects[0]];
        [self saveContext];
        success = YES;
    }
    return success;
}

@end
