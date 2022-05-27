# Hangman

To run the program use : perl Hangman.pl 

How to play:
Guess letters one by one. 
If the letter is not present in the word, one limb will be added to the hangman.
If it is present, all occurrences of the letter in the word will be replaced by it.
You can make at most 7 incorrect guesses after which you will lose the game.

Note - wordarray contains all the words from which one word is selected at random for the user to guess.

Subroutines used:
1. startGame -
   This subroutine starts the game by choosing a random word from the dictionary
   It also displays the number of letters in the word by the same number of underscores.
2. playGame -
   This subroutine drives the game.
   It calls the subroutine for user to make guess and to match the guessed letter.
   It checks if the game has ended in a win or loss.
3. chooseWord -
   This subroutine chooses a random word from the word array for the user to guess.
4. guessLetter - 
   This routine takes input letter from the user for guess.
   It checks if the letter has already been guessed in which case it prompts input again.
   In case the letter has not been guessed it returns the letter.
5. matchLetter - 
   Subroutine to check if the input letter matches any of the letters in the word.
   In case the letter doesn't match then it adds another limb to the Hangman.
   In case it does match, all the occurrences of the letter in the word are replaced by it.
6. drawHangman -
   Subroutine to draw the hangman depending on the number of incorrect guesses till now
   It adds another limb to the hangman whenever there is an incorrect guess
