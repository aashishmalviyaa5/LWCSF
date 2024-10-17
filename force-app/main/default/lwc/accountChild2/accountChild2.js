//import Type from '@salesforce/schema/Account.Type';
import { LightningElement ,api, wire} from 'lwc';
import getAccounts from '@salesforce/apex/AccGetAccountsClass.getAccounts';

export default class AccountChild2 extends LightningElement {

@api searchTextChild2;

@wire(getAccounts,{SearchText : '$searchTextChild2'}) accRecords;

columns=[

    {label :'id', fieldName:'id'},
    {label :'Name', fieldName:'Name'},
    {label :'Actions',fieldName:'Actions',type:'button', typeAttributes :{
        label : 'View Contacts',
        value : 'View_Contacts',
        variant: 'brand'
    }}
]
rows=[
    {id:34,Name:'Ashish',Actions:''},
    {id:9898,Name:'R',Actions:''},
    {id:564,Name:'Malviya',Actions:''},
]

currentid;
currentname;

handleRowAction(event){

    if(event.detail.action.value == 'View_Contacts')
    this.currentid = event.detail.row.id;
    this.currentname = event.detail.row.Name;

}



}