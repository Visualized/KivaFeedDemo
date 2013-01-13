//
//  KivaFeed.h
//  JSON_HelloWorld
//
//  Created by Marin Todorov on 13/01/2013.
//  Copyright (c) 2013 Underplot ltd. All rights reserved.
//

#import "JSONModel.h"
#import "LoanModel.h"

@interface KivaFeed : JSONModel

@property (strong, nonatomic) NSArray<LoanModel>* loans;

@end
