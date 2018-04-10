#import <UIKit/UIKit.h>

@interface ViewController : UITableViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField        *nameText;
@property (weak, nonatomic) IBOutlet UITextField        *surnameText;
@property (weak, nonatomic) IBOutlet UITextField        *dateOfBirthText;
@property (weak, nonatomic) IBOutlet UITextField        *gradeText;
@property (weak, nonatomic) IBOutlet UISegmentedControl *genderControl;

@end

