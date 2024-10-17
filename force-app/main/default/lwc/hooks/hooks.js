import { LightningElement } from 'lwc';
import logMessage from '@salesforce/apex/LifecycleLoggerController.logMessage';

export default class LifecycleDemo extends LightningElement {
    constructor() {
        super();
        this.ParentEvent('Parent-constructor');
    }

    connectedCallback() {
        this.ParentEvent('Parent-connectedCallback');
    }

    disconnectedCallback() {
        this.ParentEvent('Parent-disconnectedCallback');
    }

    renderedCallback() {
        this.ParentEvent('Parent-renderedCallback');
    }

    errorCallback(error, stack) {
        this.ParentEvent(`Parent-errorCallback: ${error} ${stack}`);
    }
    
    ParentEvent(event) {
        logMessage({ message: `Parent-LifecycleDemo ${event}` })
            .then(result => {
                console.log(`Parent-Logged: ${event}`);
            })
            .catch(error => {
                console.error(`Parent-Error logging ${event}:`, error);
            });
    }
}