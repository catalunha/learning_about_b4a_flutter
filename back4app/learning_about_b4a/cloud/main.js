require('./user/user_triggers.js');

// Use Parse.Cloud.define to define as many cloud functions as you want.
// For example:
Parse.Cloud.define("hello", (request) => {
	return "Hello world!";
});
