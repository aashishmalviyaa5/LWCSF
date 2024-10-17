import { LightningElement, wire } from 'lwc';
import getMovies from '@salesforce/apex/IMDB_Integration_Callout.getImdbInfo';

export default class Immmdb extends LightningElement {
    enteredText = '';  // Stores the input from the user
    searchText = '';   // Trigger the API call when updated
    showText = 'Please enter a valid movie name';
    movies = [];  // Array to hold the movie data from API

    // Update the enteredText property when the user types
    handleChange(event) {
        this.enteredText = event.target.value;
    }
    // Update searchText on button click to trigger API call
    handleClick() {
        if (this.enteredText.trim()) {
            this.searchText = this.enteredText.trim();
            this.showText = '';  // Clear any previous error messages
        } else {
            this.showText = 'Please enter a valid movie name';
            this.movies = [];
        }
    }

    // Wire to call Apex method and get movie data based on searchText
    @wire(getMovies, { searchText: '$searchText' })
    fetchMovies(result) {
        if (result.data) {
            let data = JSON.parse(result.data);

            // Check if data is successfully retrieved
            if (data.success) {
                this.movies = data.result;
                this.showText = '';
            } else {
                this.movies = [];
                this.showText = 'No movies found. Please try another name.';
            }
        } else if (result.error) {
            console.error(result.error);  // Log errors to the console
            this.movies = [];
            this.showText = 'Error retrieving movie data';
        }
    }
}
