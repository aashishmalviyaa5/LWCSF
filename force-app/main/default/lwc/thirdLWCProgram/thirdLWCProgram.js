import { LightningElement,api } from 'lwc';

export default class ThirdLWCProgram extends LightningElement {

    name = 'MyName';
    salary = 10000;
    phone = 466;
    Designation = 'Manager';
    city = 'Mexico';
    @api recordId;
    
    }

    handleonClick(event)
        this.name = event.target.name
        this.salary = event.target.salary
        this.phone = event.target.phone