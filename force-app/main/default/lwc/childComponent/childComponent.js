import { LightningElement } from 'lwc';

export default class ChildComponent extends LightningElement {


    constructor(){
        super();
        
        console.log('Child Component: constructor');
    }
    connectedCallback() {
        console.log('Child Component: connectedCallback');

    }
      HandleChange(event){
            const inputedValues = event.target.data;
            alert('inputedValues' + inputedValues);
            this.dispatchEvent(new CustomEvent ('changes',{
                detail :inputedValues
            }))
    }

    renderedCallback() {
        console.log('Child Component: renderedCallback');
    }

    disconnectedCallback() {
        console.log('Child Component: disconnectedCallback');
    }

    errorCallback(){
        console.log('Parent Component: errorCallback');
    }
}