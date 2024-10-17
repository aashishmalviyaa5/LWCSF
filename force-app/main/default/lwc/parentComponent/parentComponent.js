import { LightningElement } from 'lwc';

export default class ParentComponent extends LightningElement {

    constructor(){

        super();
        console.log('Parent Component: constructor');
    }

    connectedCallback() {
        console.log('Parent Component: connectedCallback');
    }

    valueChangesOnParent(event){
        const valueChangesOnParentstored = event.detail;
        
    }

    renderedCallback() {
        console.log('Parent Component: renderedCallback');
    }

    disconnectedCallback() {
        console.log('Parent Component: disconnectedCallback');
    }

    errorCallback(){
        console.log('Parent Component: errorCallback');
    }
}