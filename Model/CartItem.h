//
//  CartItem.h
//  ShoppingCart
//
//  Created by Suhit P on 08/11/15.
//  Copyright © 2015 Suhit. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


NS_ASSUME_NONNULL_BEGIN

@interface CartItem : NSManagedObject

// Insert code here to declare functionality of your managed object subclass
+ (void)insertItemWithId:(NSNumber *)itemId
                    name:(NSString *)name
                   price:(NSNumber *)price
                quantity:(NSNumber *)quantity
                   image:(NSString *)imageName
  inManagedObjectContext:(NSManagedObjectContext *)managedObjectContext;

@end

NS_ASSUME_NONNULL_END

#import "CartItem+CoreDataProperties.h"
