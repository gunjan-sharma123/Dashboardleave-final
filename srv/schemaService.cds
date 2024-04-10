using { app.schema } from '../db/schema';

service LeaveManagementService  {

  entity LeaveBalance as projection on schema.LeaveBalance;
  entity LeaveType as projection on schema.LeaveType;
  entity LeaveRequest as projection on schema.LeaveRequest;
 
  entity LeaveHistory as projection on schema.LeaveHistory;

  @readonly
  entity Manager as projection on schema.Manager;

  @readonly
  entity HR as projection on schema.HR

  @readonly
  entity Employees as projection on schema.Employee;

  // @cds.persistence.exists
 @cds.persistence.exists
entity LoggedInUser {
    id : String;
    userRole : String;
}
}


