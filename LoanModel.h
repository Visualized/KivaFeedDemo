//
//  LoanModel.h
//  JSON_HelloWorld
//
//  Created by Marin Todorov on 13/01/2013.
//  Copyright (c) 2013 Underplot ltd. All rights reserved.
//

#import "JSONModel.h"
#import "LocationModel.h"

@protocol LoanModel @end

@interface LoanModel : JSONModel

@property (strong, nonatomic) NSString* name;
@property (strong, nonatomic) NSString* status;
@property (strong, nonatomic) NSString* use;

@property (strong, nonatomic) LocationModel* location;

@end
