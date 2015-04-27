//
//  MaisOuiDictionary.m
//  MaisOui
//
//  Created by Robert Irwin on 1/28/14.
//  Modified by Bharath Darapu on 09/15/14
//  Copyright (c) 2014 Robert Irwin. All rights reserved.
//

#import "MaisOuiDictionary.h"

@interface MaisOuiDictionary()

@property (strong,nonatomic,readonly) NSDictionary *words;
@end

@implementation MaisOuiDictionary

@synthesize words = _words;

//default initializer
- (id) init {
    self = [super init];
    _words = [NSDictionary dictionaryWithObjectsAndKeys:
              @"tableau noir", @"blackboard",
              @"zut", @"damn",
              @"chien", @"dog",
              @"triste", @"sad",
              @"heureux", @"happy",
              nil];
        return self;
}

//initializer which takes the languages as arguments
- (id) initWithFrom:(NSString *)from withTo:(NSString *)to{
    self = [super init];
    
    //initialzing dictionary for English to Spanish
    if([from  isEqual: @"English"])
    {
        if([to  isEqual: @"Spanish"])
        {
            _words = [NSDictionary dictionaryWithObjectsAndKeys:
                      @"pizarra", @"blackboard",
                      @"maldita", @"damn",
                      @"perro", @"dog",
                      @"triste", @"sad",
                      @"feliz", @"happy",
                      @"genio", @"genius",
                      nil];
            
        }else if([to  isEqual: @"French"])
        {
            //initialzing dictionary for English to French
            _words = [NSDictionary dictionaryWithObjectsAndKeys:
                      @"tableau", @"blackboard",
                      @"merde", @"damn",
                      @"chien", @"dog",
                      @"triste", @"sad",
                      @"heureux", @"happy",
                      @"genie", @"genius",
                      nil];
        }else if([to  isEqual: @"German"])
        {
           //initialzing dictionary for English to German
            _words = [NSDictionary dictionaryWithObjectsAndKeys:
                      @"Tafel", @"blackboard",
                      @"verdammt", @"damn",
                      @"Hund", @"dog",
                      @"traurig", @"sad",
                      @"glucklich", @"happy",
                      @"genie", @"genius",
                      nil];

        }
    }else if([from  isEqual: @"Spanish"])
    {
        if([to  isEqual: @"English"])
        {
            //initialzing dictionary for Spanish to English
            _words = [NSDictionary dictionaryWithObjectsAndKeys:
                      @"blackboard", @"pizarra",
                      @"damn", @"maldita",
                      @"dog", @"perro",
                      @"sad", @"triste",
                      @"happy", @"feliz",
                      @"genius", @"genio",
                      nil];
        }else if([to  isEqual: @"French"])
        {
            //initializing dictionary for spanish to french
            _words = [NSDictionary dictionaryWithObjectsAndKeys:
                      @"tableau", @"pizarra",
                      @"merde", @"maldita",
                      @"chien", @"perro",
                      @"triste", @"triste",
                      @"heureux", @"feliz",
                      @"genie", @"genio",
                      nil];
        }else if([to  isEqual: @"German"])
        {
            //initializing dictionary for spanish to German
            _words = [NSDictionary dictionaryWithObjectsAndKeys:
                      @"Tafel", @"pizarra",
                      @"verdammt", @"maldita",
                      @"Hund", @"perro",
                      @"traurig", @"triste",
                      @"glucklich", @"feliz",
                      @"genie", @"genio",
                      nil];
        }
    }else if([from  isEqual: @"French"])
    {
        if([to  isEqual: @"English"])
        {
            //initializing dictionary for French to English
            _words = [NSDictionary dictionaryWithObjectsAndKeys:
                      @"blackboard", @"tableau",
                      @"damn", @"merde",
                      @"dog", @"chien",
                      @"sad", @"triste",
                      @"happy", @"heureux",
                      @"genius", @"genie",
                      nil];

        }else if([to  isEqual: @"Spanish"])
        {
           //initializing dictionary for French to Spanish
 
            _words = [NSDictionary dictionaryWithObjectsAndKeys:
                      @"pizarra", @"tableau",
                      @"maldita", @"merde",
                      @"perro", @"chien",
                      @"triste", @"triste",
                      @"feliz", @"heureux",
                      @"genio", @"genie",
                      nil];
            
        }else if([to  isEqual: @"German"])
        {
           //initializing dictionary for French to German
            _words = [NSDictionary dictionaryWithObjectsAndKeys:
                      @"Tafel", @"tableau",
                      @"verdammt", @"merde",
                      @"Hund", @"chien",
                      @"traurig", @"triste",
                      @"glucklich", @"heureux",
                      @"genie", @"genie",
                      nil];
            
        }
        
    }else if([from  isEqual: @"German"])
    {
        if([to  isEqual: @"English"])
        {
            //initializing dictionary for German to English
            _words = [NSDictionary dictionaryWithObjectsAndKeys:
                      @"blackboard", @"Tafel",
                      @"damn", @"verdammt",
                      @"dog", @"Hund",
                      @"sad", @"traurig",
                      @"happy", @"glucklich",
                      @"genius", @"genie",
                      nil];
        }else if([to  isEqual: @"Spanish"])
        {
            //initializing dictionary for German to Spanish
            _words = [NSDictionary dictionaryWithObjectsAndKeys:
                      @"pizarra", @"Tafel",
                      @"maldita", @"verdammt",
                      @"perro", @"Hund",
                      @"triste", @"traurig",
                      @"feliz", @"glucklich",
                      @"genio", @"genie",
                      nil];
            
        }else if([to  isEqual: @"French"])
        {
            //initializing dictionary for German to French
            _words = [NSDictionary dictionaryWithObjectsAndKeys:
                      @"tableau", @"Tafel",
                      @"merde", @"verdammt",
                      @"chien", @"Hund",
                      @"triste", @"traurig",
                      @"heureux", @"glucklich",
                      @"genie", @"genie",
                      nil];

            
        }
        
    }
    
    return self;
}

- (NSString *) lookup: (NSString *)in
{
    NSString *rv = [self.words objectForKey: in];
    if ( !rv ) // if no translation is found in the dictionary
        return @"*** no translation ***";
    return rv;
}


// if we didn't use lazy instantiation in the words getter, can set it up in model class initializer
//- (instancetype) init
//{
//    if ( self = [super init] )
//    {
//        _words = [NSDictionary dictionaryWithObjects:
//                       [NSArray arrayWithObjects: @"tableau noir", @"zut", @"chien", @"triste", @"heureux", nil]
//                                             forKeys:
//                       [NSArray arrayWithObjects: @"blackboard", @"damn", @"dog", @"sad", @"happy", nil]];
//    }
//    return self;
//}

//- (NSDictionary *) words
//{
//   
//    if (!_words) {
//        
//        _words = [NSDictionary dictionaryWithObjectsAndKeys:
//                  @"tableau noir", @"blackboard",
//                  @"zut", @"damn",
//                  @"chien", @"dog",
//                  @"triste", @"sad",
//                  @"heureux", @"happy",
//                  nil];
//        //        // another way to do the same thing
//        //        _words = [NSDictionary dictionaryWithObjects:
//        //                  [NSArray arrayWithObjects: @"tableau noir", @"zut", @"chien", @"triste", @"heureux", nil]
//        //                                             forKeys:
//        //                  [NSArray arrayWithObjects: @"blackboard", @"damn", @"dog", @"sad", @"happy", nil]];
//    }
//    return _words;
//}


//the llokup method returns the translated word if found

@end
