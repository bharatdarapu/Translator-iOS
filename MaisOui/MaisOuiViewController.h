//
//  MaisOuiViewController.h
//  MaisOui
//
//  Created by Robert Irwin on 1/28/14.
//  Modified by Bharath Darapu on 09/15/14
//  Copyright (c) 2014 Robert Irwin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MaisOuiViewController : UIViewController <UITextFieldDelegate,UIPickerViewDataSource,UIPickerViewDelegate>

@property (strong, nonatomic) NSArray *languageData; //array to hold the languages
@property (weak, nonatomic) IBOutlet UITextField *fromTextField; //textfield to select language to be translated from
@property (weak, nonatomic) IBOutlet UITextField *toTextField; //textfield to select language to be translated to
@property (weak, nonatomic) IBOutlet UILabel *fromLanguageLabel; //label displaying the word to enter in the language   selected fromTextFiled

@property (weak, nonatomic) IBOutlet UILabel *toLanguageLabel; //label displaying the word translated to the labguage selected in toTextFiled


@end
