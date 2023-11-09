# assignment_task

Flutter News Project.

## Getting Started

This project was created using the free News API (https://www.thenewsapi.com/).

This project is made with the getX pattern and the help of getX-cli as per MVC architecture.

There are two screens: the home screen and the expanded screen.
# Home screen
Section 1: 
It contains a ListView builder with a horizontal scroll to show the top news with pagination. 
When someone scrolls from left to right, it will load or scroll page by page.

Section 2: 
It contains a GridView builder.
It shows only the All News list with pagination.
When someone scrolls from bottom to top, it will load or scroll page by page.

# Expanded screen: 
This page was made to show a single image with a pinch zoom effect. The same picture will open when news is selected from the home screen.

# Widget Test:
I created two widget tests, as below:
1. To test the text validation error finder with the help of one button, TextField2.
2. Create a test to check, add the two string values, and test the result with the help of a button, a text field, and a function.

# Unit Test: 
I created a unit test to check the name step by step, from first to last.
This test was created with a home controller by triggering the methods to change the name.
Controller initialization, first name initialization, changing method to check the middle name, and again changing method to the last name and checking the same properly. 
These are the steps that are done to get the result and check.