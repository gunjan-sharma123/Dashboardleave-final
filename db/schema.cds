namespace app.schema;

using { cuid, managed, sap.common.CodeList } from '@sap/cds/common';

entity Employee :cuid, managed { 
firstName     : String;
lastName      : String;
name          : String = firstName || ' ' || lastName;
email         : EMailAddress;
phone         : PhoneNumber;
}

entity LeaveType :cuid , managed{
  LeaveTypeName  : String;
  Description    : String;
}

entity LeaveHistory :cuid , managed{
  sno : String;
  LeaveType: Association to LeaveType;
  StartDate        : DateTime;
  EndDate          : DateTime;
  Description    : String;
  postingDate :DateTime;
  AdminRemark    : String;
  Status    : String;
}

entity LeaveRequest : cuid , managed{
  Employee         : Association to Employee;
  LeaveType        : Association to LeaveType;
  StartDate        : DateTime;
  EndDate          : DateTime;
  Reason           : String;
  urgency        : Association to Urgency default 'M';
  Status         : Association to Status default 'N';
  SubmissionDate   : DateTime;
  ManagerApproval  : Boolean default false;
  ManagerComment   : String;
  HRComment        : String;
 
}

entity Manager : cuid, managed{
  Employee    : Association to Employee;
}

entity HR  : cuid, managed{
  Employee : Association to Employee;
  Manager  : Association to Manager
}

entity LeaveBalance : cuid, managed {  

  Employee      : Association to Employee;
  LeaveType     : Association to LeaveType;
  Balance       : Integer; 

}



entity Status : CodeList {
key code: String enum {
    new = 'N';
    pending = 'P'; 
    approved = 'A'; 
    rejected = 'R'; 
};
}

entity Urgency : CodeList {
key code: String enum {
    high = 'H';
    medium = 'M'; 
    low = 'L'; 
};
}

type EMailAddress : String;
type PhoneNumber : String;