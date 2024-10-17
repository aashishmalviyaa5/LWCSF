import { LightningElement } from 'lwc';
import { NavigationMixin } from 'lightning/navigation';

export default class NavigationServiceFullExample extends NavigationMixin(LightningElement) {

    // Navigate to a Record Page
    navigateToRecordPage() {
        this[NavigationMixin.Navigate]({
            type: 'standard__recordPage',
            attributes: {
                recordId: '001XXXXXXXXXXXXXXX',  // Replace with your record Id
                objectApiName: 'Account',  // Replace with your object API name
                actionName: 'view'
            }
        });
    }

    // Navigate to a Custom Application
    navigateToCustomApp() {
        this[NavigationMixin.Navigate]({
            type: 'standard__app',
            attributes: {
                appTarget: 'c__YourCustomAppName'  // Replace with your custom app name
            }
        });
    }

    // Navigate to an External URL
    navigateToExternalUrl() {
        this[NavigationMixin.Navigate]({
            type: 'standard__webPage',
            attributes: {
                url: 'https://www.example.com'  // Replace with your target URL
            }
        });
    }

    // Navigate to a Custom Tab
    navigateToCustomTab() {
        this[NavigationMixin.Navigate]({
            type: 'standard__navItemPage',
            attributes: {
                apiName: 'Custom_Tab_Name'  // Replace with your custom tab API name
            }
        });
    }

    // Navigate to a List View
    navigateToListView() {
        this[NavigationMixin.Navigate]({
            type: 'standard__objectPage',
            attributes: {
                objectApiName: 'Opportunity',  // Replace with your object API name
                actionName: 'list'
            },
            state: {
                filterName: 'Recent'  // Optional, use to specify a filter
            }
        });
    }

    // Navigate to a Related List
    navigateToRelatedList() {
        this[NavigationMixin.Navigate]({
            type: 'standard__recordRelationshipPage',
            attributes: {
                recordId: '001XXXXXXXXXXXXXXX',  // Replace with your record Id
                objectApiName: 'Account',  // Parent object API name
                relationshipApiName: 'Contacts',  // Child relationship name (e.g., Contacts on Account)
                actionName: 'view'
            }
        });
    }

    // Navigate to Files
    navigateToFiles() {
        this[NavigationMixin.Navigate]({
            type: 'standard__objectPage',
            attributes: {
                objectApiName: 'ContentDocument',
                actionName: 'home'
            }
        });
    }

    // Navigate to a Standard Tab (e.g., Account Home)
    navigateToStandardTab() {
        this[NavigationMixin.Navigate]({
            type: 'standard__objectPage',
            attributes: {
                objectApiName: 'Account',
                actionName: 'home'
            }
        });
    }

    // Navigate to a Visualforce Page
    navigateToVisualforcePage() {
        this[NavigationMixin.Navigate]({
            type: 'standard__webPage',
            attributes: {
                url: '/apex/YourVisualforcePage'  // Replace with your Visualforce page URL
            }
        });
    }

    // Navigate to a Custom Aura Component
    navigateToAuraComponent() {
        this[NavigationMixin.Navigate]({
            type: 'standard__component',
            attributes: {
                componentName: 'c__YourAuraComponent'  // Replace with your custom Aura component
            },
            state: {
                c__param1: 'value1',  // Replace with your component parameters
                c__param2: 'value2'
            }
        });
    }
}