import { LightningElement } from 'lwc';

export default class HooksChild extends LightningElement {

    constructor() {
        super();
        this.ChildEvent('Child-constructor');
    }

    connectedCallback() {
        this.ChildEvent('Child-connectedCallback');
    }

    disconnectedCallback() {
        this.ChildEvent('Child-disconnectedCallback');
    }

    renderedCallback() {
        this.ChildEvent('Child-renderedCallback');
    }

    errorCallback(error, stack) {
        this.ChildEvent(`Child-errorCallback: ${error} ${stack}`);
    }
    
    ChildEvent(event) {
        logMessage({ message: `ChildLifecycleDemo ${event}` })
            .then(result => {
                console.log(`ChildLogged: ${event}`);
            })
            .catch(error => {
                console.error(`Child-Errorlogging ${event}:`, error);
            });
    }



}