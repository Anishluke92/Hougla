# README

## Usage of platform
Users can sign up and sign in. Users can add projects with name and description. For each project they can log time spent by creating tasks with start and end time.

## MVP
* User
	* Project
		* Task

## Models
	* User
		* first_name
		* last_name
		* email
		* password
	* Project
		* user_id
		* name
		* description 
	* Task
		* project_id
		* name
		* start_time
		* end_time
