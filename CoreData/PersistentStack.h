//
//  PersistentStack.h
//  ShoppingCart
//
//  Created by Suhit P on 08/11/15.
//  Copyright © 2015 Suhit. All rights reserved.
//

@import Foundation;
@import CoreData;

@interface PersistentStack : NSObject

- (instancetype)initWithStoreURL:(NSURL*)storeURL modelURL:(NSURL*)modelURL;

@property (nonatomic,strong,readonly) NSManagedObjectContext* managedObjectContext;


@end
