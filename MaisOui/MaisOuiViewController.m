//
//  MaisOuiViewController.m
//  MaisOui
//
//  Created by Robert Irwin on 1/28/14.
//  Modified by Bharath Darapu on 09/15/14
//  Copyright (c) 2014 Robert Irwin. All rights reserved.
//

#import "MaisOuiViewController.h"
#import "MaisOuiDictionary.h"

@interface MaisOuiViewController ()
@property (strong,nonatomic) MaisOuiDictionary *dictionary;
@property (weak, nonatomic) IBOutlet UITextField *inWord; // word to be tranlated to
@property (weak, nonatomic) IBOutlet UILabel *outWord; //tranlated word
- (IBAction)translate:(UIButton *)sender; //button labelled as "Translate"
@end

@implementation MaisOuiViewController

@synthesize inWord = _inWord;
@synthesize outWord = _outWord;
@synthesize dictionary = _dictionary;


@synthesize languageData;


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.inWord.delegate = self;
    
   languageData = @[@"English", @"Spanish",@"French", @"German"]; //languages to be shown in UIpicker
    
    UIPickerView *pickerView = [[UIPickerView alloc] init]; //initializing the picker
    pickerView.dataSource = self; //setting the datasource to picker
    pickerView.delegate = self; //setting the delegate to picker
    
    self.fromTextField.inputView = pickerView; //call picker on texfield click instead of keyboard
    self.toTextField.inputView = pickerView; //call picker on texfield click instead of keyboard
 
    self.fromTextField.delegate = self; //delegating textfield to self so as to use the textFieldDidBeginEditing method
    self.toTextField.delegate = self;  //delegating textfield to self so as to use the textFieldDidBeginEditing method
    
    
    UIToolbar *toolBar = [[UIToolbar alloc] init]; //toolbar initialization which holds the uipicker
    toolBar.barStyle = UIBarStyleBlackOpaque;
    [toolBar sizeToFit];
    UIBarButtonItem *flexSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                                                               target:self
                                                                               action:nil]; //to allign done button
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                                                                target:self
                                                                                action:@selector(doneButtonPressed:)]; //declaring done button to be used in toolbar later
    
    
    [toolBar setItems:@[flexSpace, doneButton] animated:YES]; //assigning donebutton and flexspace to toolbar
    self.fromTextField.inputAccessoryView = toolBar; //setting accessory view to open toolbar (which contains picker) on textfield click
    self.toTextField.inputAccessoryView = toolBar; //setting accessory view to open toolbar (which contains picker) on textfield click
    
}

//method sets tag to the selected textfield to identify it later
-(void)textFieldDidBeginEditing:(UITextField *)textField{
    if(textField == self.fromTextField)
    {
        self.fromTextField.tag = 1;
        self.toTextField.tag = 0;
    }else if(textField == self.toTextField)
    {
        self.fromTextField.tag = 0;
        self.toTextField.tag = 1;
    }

}

// close the picker on done button clicked in the toolbar
-(void)doneButtonPressed:(id)sender
{
    //NSLog(@"done clicked");
    [self.fromTextField resignFirstResponder];
    [self.toTextField resignFirstResponder];
}


//- (MaisOuiDictionary *) dictionary
//{
//    if (!_dictionary)
//        _dictionary = [[MaisOuiDictionary alloc] initWithFrom:@"English" withTo:@"English"];
//    return _dictionary;
//}

// actions to perform on translate button clicked
- (IBAction)translate:(UIButton *)sender
{
    [self.inWord resignFirstResponder];  // dismisses soft keyboard
    _dictionary = [[MaisOuiDictionary alloc] initWithFrom:self.fromTextField.text withTo:self.toTextField.text]; //initializing the dictionary with the values selected from respective pickers
           self.outWord.text = [self.dictionary lookup: self.inWord.text.lowercaseString];//calls the lookup method which returns the translated word (converts by default to lowercase)
    // equivalent to preceding; doesn't use dot notation:
    // [[self outWord] setText: [[self dictionary] lookup: [[self inWord] text]]];
}

// implements UITextFieldDelegate protocol method
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField == self.inWord ) {
        [textField resignFirstResponder];
        _dictionary = [[MaisOuiDictionary alloc] initWithFrom:self.fromTextField.text withTo:self.toTextField.text];//initializing the dictionary with the values selected from respective pickers
        self.outWord.text = [self.dictionary lookup: self.inWord.text.lowercaseString];//calls the lookup method which returns the translated word (converts by default to lowercase)
        return NO;
    }
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



//sets the total number of columns you need to show in picker
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

//sets the number of rows you need to show in picker
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    
     return languageData.count;
}

//sets the language names/data in the picker
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent: (NSInteger)component
{
    return languageData[row];
}


// Catpure the picker view selection
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    // This method is triggered whenever the user makes a change to the picker selection.
    // The parameter named row and component represents what was selected.
   if(self.fromTextField.tag) //checks for which text field the picker was used
    {
        self.fromTextField.text = [languageData objectAtIndex:row]; //sets the selected language in the textfield

        if([self.fromTextField.text isEqualToString:@"English"]) //changes the labels to the respective language
            _fromLanguageLabel.text = @"Enter English Word Here:";
        else if([self.fromTextField.text isEqualToString:@"Spanish"])
            _fromLanguageLabel.text = @"Ingrese la palabra española aquí:";
        else if([self.fromTextField.text isEqualToString:@"French"])
            _fromLanguageLabel.text = @"Entrez le code français ici:";
        else if([self.fromTextField.text isEqualToString:@"German"])
            _fromLanguageLabel.text = @"GGeben Sie deutsche Wort, das hier:";
        else
            _fromLanguageLabel.text = @"Enter English Word Here:";

        
        if([self.fromTextField.text isEqualToString:self.toTextField.text] && ![self.toTextField.text isEqualToString:@"Spanish"]) //Checks if the from and to languages are the same and is not spanish
        {
            _toLanguageLabel.text = @"(Defaulted to Spanish) En Espagnol: ";
            self.toTextField.text = @"Spanish"; //defaulting to spanish
        }
        else if([self.fromTextField.text isEqualToString:self.toTextField.text] ) //if languages are same and also spanish
        {
            _toLanguageLabel.text = @"Defaulted to French/En Francais: ";
            self.toTextField.text = @"French"; //defaulting to french
        }

        
    }
    else if(self.toTextField.tag)
    {
        
        self.toTextField.text = [languageData objectAtIndex:row]; //sets the selected language in the textfield
        
        if([self.toTextField.text isEqualToString:@"English"]) //changes the labels to the respective language
            _toLanguageLabel.text = @"In English:";
        else if([self.toTextField.text isEqualToString:@"Spanish"])
            _toLanguageLabel.text = @"En Espagnol: ";
        else if([self.toTextField.text isEqualToString:@"French"])
            _toLanguageLabel.text = @"En Francais:";
        else if([self.toTextField.text isEqualToString:@"German"])
            _toLanguageLabel.text = @"auf Deutsch:";
        else
            _toLanguageLabel.text = @"In English:";
        
        
        
        if([self.fromTextField.text isEqualToString:self.toTextField.text] && ![self.toTextField.text isEqualToString:@"Spanish"]) //Checks if the from and to languages are the same and is not spanish
        {
            _toLanguageLabel.text = @"(Defaulted to Spanish) En Espagnol: ";
            self.toTextField.text = @"Spanish"; //defaulting to spanish
        }
        else if([self.fromTextField.text isEqualToString:self.toTextField.text] ) //if languages are same and also spanish
        {
            _toLanguageLabel.text = @"Defaulted to French/En Francais: ";
            self.toTextField.text = @"French"; //defaulting to french
        }

        
        
    }
    
   
}

@end
