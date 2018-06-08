//
//  ViewController.m
//  MyCalculator
//
//  Created by Sword Software on 18/12/17.
//  Copyright © 2017 Sword Software. All rights reserved.
//

#import "ViewController.h"


int operation;
double displayNumber;
double resultNumber;
BOOL isDecimal;

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *display;

- (void)setResultWithNumber:(int)number;
- (void)operationWithNumber:(int)number;
- (IBAction)plusMinus:(id)sender;
- (IBAction)button1:(id)sender;
- (IBAction)button2:(id)sender;
- (IBAction)button3:(id)sender;
- (IBAction)button4:(id)sender;
- (IBAction)button5:(id)sender;
- (IBAction)button6:(id)sender;
- (IBAction)button7:(id)sender;
- (IBAction)button8:(id)sender;
- (IBAction)button9:(id)sender;
- (IBAction)button0:(id)sender;
- (IBAction)decimal:(id)sender;
- (IBAction)plusbutton:(id)sender;
- (IBAction)minusbutton:(id)sender;
- (IBAction)multiplybutton:(id)sender;
- (IBAction)dividebutton:(id)sender;
- (IBAction)equalbutton:(id)sender;
- (IBAction)cleardisplay:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    isDecimal = false;
    resultNumber = 0;
   
}

- (void)setResultWithNumber:(int)number{
    if(!isDecimal)
    {
        displayNumber = displayNumber * 10 + (float)number;
        self.display.text=[NSString stringWithFormat:@"%.0f",displayNumber];
    }
    else{
        self.display.text=[self.display.text stringByAppendingString:[NSString stringWithFormat:@"%d",number]];
    }
    displayNumber=[self.display.text floatValue];
}

-(void) operationWithNumber:(int)number {
    isDecimal=false;
    
    if(resultNumber == 0)
    {
            resultNumber = displayNumber;
    }
    
    else{    //self.display.text=[NSString stringWithFormat:@"%.0f",resultNumber];
        //resultNumber = [self.display.text floatValue];
         
    switch(operation)
    {
        case 1:
            resultNumber += displayNumber;
            break;
        case 2:
            resultNumber -= displayNumber;
            break;
        case 3:
            resultNumber *= displayNumber;
            // _display.text=[NSString stringWithFormat:@"%qi",[value longLongValue]*[storage longLongValue]];
            break;
        case 4:
                resultNumber /= displayNumber;
            //_display.text=[NSString stringWithFormat:@"%qi",[storage longLongValue]/[value longLongValue]];
            break;
        default:
        break;
            }
        }
    operation=number;
    displayNumber=0;
    
}

- (IBAction)cleardisplay:(id)sender {
    operation=0;
    resultNumber=0;
    displayNumber=0;
    isDecimal=false;
    self.display.text=[NSString stringWithFormat:@"%i",0];
}
- (IBAction)plusMinus:(id)sender {
    displayNumber=0-displayNumber;
    if(isDecimal)
        self.display.text=[NSString stringWithFormat:@"%.2f",displayNumber];
    else
        self.display.text=[NSString stringWithFormat:@"%.0f",displayNumber];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)button1:(id)sender {
   [self setResultWithNumber:1];
}

- (IBAction)button2:(id)sender {
    [self setResultWithNumber:2];
}

- (IBAction)button3:(id)sender {
    [self setResultWithNumber:3];
}

- (IBAction)button4:(id)sender {
    [self setResultWithNumber:4];
}

- (IBAction)button5:(id)sender {
   [self setResultWithNumber:5];
}

- (IBAction)button6:(id)sender {
    [self setResultWithNumber:6];
}

- (IBAction)button7:(id)sender {
    [self setResultWithNumber:7];
}

- (IBAction)button8:(id)sender {
    [self setResultWithNumber:8];
    
}

- (IBAction)button9:(id)sender {
    [self setResultWithNumber:9];
    
}
    
- (IBAction)button0:(id)sender{
    [self setResultWithNumber:0];
}
- (IBAction)decimal:(id)sender {
    isDecimal = true;
    NSRange range = [self.display.text rangeOfString:@"."];
    if(range.location == NSNotFound){
        self.display.text=[self.display.text stringByAppendingString:@"."];
    }
}

- (IBAction)plusbutton:(id)sender {
    
    self.display.text=@"+";
    if(resultNumber != 0){
        [self operationWithNumber:operation];
        self.display.text = [NSString stringWithFormat:@"%.2f",resultNumber];
        displayNumber = [self.display.text floatValue];
        resultNumber = 0;
    }
    [self operationWithNumber:1];
}

- (IBAction)minusbutton:(id)sender {
    NSString *minus = @"-";
    self.display.text=minus;
    if(resultNumber != 0){
        [self operationWithNumber:operation];
        self.display.text = [NSString stringWithFormat:@"%.2f",resultNumber];
        displayNumber = [self.display.text floatValue];
        resultNumber = 0;
    }
    [self operationWithNumber:2];
}

- (IBAction)multiplybutton:(id)sender {
    NSString *div = @"*";
    self.display.text=div;
    if(resultNumber!=0){
        [self operationWithNumber:operation];
        self.display.text=[NSString stringWithFormat:@"%.2f",resultNumber];
        displayNumber=[self.display.text floatValue];
        resultNumber=0;
    }
    [self operationWithNumber:3];

}

- (IBAction)dividebutton:(id)sender {
    NSString *div = @"/";
    self.display.text=div;
    if(resultNumber!=0){
        [self operationWithNumber:operation];
        self.display.text=[NSString stringWithFormat:@"%.2f",resultNumber];
        displayNumber=[self.display.text floatValue];
        resultNumber=0;
    }
    [self operationWithNumber:4];
}



- (IBAction)equalbutton:(id)sender{
    [self operationWithNumber:operation];
    self.display.text=[NSString stringWithFormat:@"%.2f",resultNumber];
    displayNumber=[self.display.text floatValue];
    resultNumber=0;
}



@end
