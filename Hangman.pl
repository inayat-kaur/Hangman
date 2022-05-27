#Inayat Kaur
#2020csb1088
#CS202 - Lab4

#The array containing all the words from which one word is chosen at random for guessing.
@wordarray = ("computer","radio","calculator","teacher","bureau","police","geometry","president","subject","country","enviroment","classroom","animals","province","month","politics","puzzle","instrument","kitchen","language","vampire","ghost","solution","service","software","virus25","security","phonenumber","expert","website","agreement","support","compatibility","advanced","search","triathlon","immediately","encyclopedia","endurance","distance","nature","history","organization","international","championship","government","popularity","thousand","feature","wetsuit","fitness","legendary","variation","equal","approximately","segment","priority","physics","branche","science","mathematics","lightning","dispersion","accelerator","detector","terminology","design","operation","foundation","application","prediction","reference","measurement","concept","perspective","overview","position","airplane","symmetry","dimension","toxic","algebra","illustration","classic","verification","citation","unusual","resource","analysis","license","comedy","screenplay","production","release","emphasis","director","trademark","vehicle","aircraft","experiment");
$maxIncorrect = 7;  #Maximum number of incorrect guesses that can be made.


#Initializing all the variables and calling startGame subroutine.
$winStatus = 0;
$incorrectGuessCount = 0;
$correctGuessCount = 0;
@yourWord;
@guessedLetters;
$word;
startGame();


#This subroutine starts the game by choosing a random word from the dictionary
#It also displays the number of letters in the word by the same number of underscores.
sub startGame{
    $word = chooseWord();
    for($i = 0; $i<length($word); $i++){
        push @yourWord,"_";
    }
    print "Your word is : @yourWord\n";
    playGame();
}


#This subroutine drives the game.
#It calls the subroutine for user to make guess and to match the guessed letter.
#It checks if the game has ended in a win or loss.
sub playGame{
    while($winStatus==0){
        $turnsLeft = $maxIncorrect-$incorrectGuessCount;
        print "You have $turnsLeft limbs left ...\n";
        my $letter = guessLetter();
        matchLetter($letter);
        if($incorrectGuessCount== $maxIncorrect){
            $winStatus = -1;
        }
        if($correctGuessCount == length($word)){
            $winStatus = 1;
        }
        print "@yourWord\n\n";
    }
    if($winStatus == 1){
        print "You guessed correct!!";
    }
    else{
        print "Sorry, you lost! ";
        print "The word is $word.";
    }
}


#This subroutine chooses a random word from the word array for the user to guess.
sub chooseWord{
    my $index = int(rand($#wordarray + 1));
    my $word = $wordarray[$index];
    return $word;
}


#This routine takes input letter from the user for guess.
#It checks if the letter has already been guessed in which case it prompts input again.
#In case the letter has not been guessed it returns the letter.
sub guessLetter{
    print "Guessed letters are : @guessedLetters\nMake next guess : ";
    my $letter = <STDIN>;
    chomp $letter;
    while(grep(/^$letter$/,@guessedLetters)){
        print "'$letter' already guessed!!\n";
        $letter = <STDIN>;
        chomp $letter;
    }
    push @guessedLetters, $letter;
    return $letter;
}


#Subroutine to check if the input letter matches any of the letters in the word.
#In case the letter doesn't match then it adds another limb to the Hangman.
#In case it does match, all the occurrences of the letter in the word are replaced by it.
sub matchLetter{
    ($letter) = @_;
    my $output = index($word,$letter,0);
    if($output==-1){
        $incorrectGuessCount++;
        drawHangman();
    }
    else{
        while($output != -1){
            $correctGuessCount++;
            $yourWord[$output] = $letter;
            $output = index($word,$letter,$output + 1);
        }
    }    
}


# subroutine to draw the hangman depending on the number of incorrect guesses till now
# It adds another limb to the hangman whenever there is an incorrect guess
sub drawHangman{
    if($incorrectGuessCount==0){
        print "    =========\n";
        print "           ||\n";
        print "           ||\n";
        print "           ||\n";
        print "           ||\n";
        print "           ||\n";
        print "  =============\n\n";
    }
    elsif($incorrectGuessCount==1){
        print "    =========\n";
        print "    O      ||\n";
        print "           ||\n";
        print "           ||\n";
        print "           ||\n";
        print "           ||\n";
        print "  =============\n\n";
    }
    elsif($incorrectGuessCount==2){
        print "    =========\n";
        print "    O      ||\n";
        print "    |      ||\n";
        print "           ||\n";
        print "           ||\n";
        print "           ||\n";
        print "  =============\n\n";
    }
    elsif($incorrectGuessCount==3){
        print "    =========\n";
        print "    O      ||\n";
        print "   \\|      ||\n";
        print "           ||\n";
        print "           ||\n";
        print "           ||\n";
        print "  =============\n\n";
    }
    elsif($incorrectGuessCount==4){
        print "    =========\n";
        print "    O      ||\n";
        print "   \\|/     ||\n";
        print "           ||\n";
        print "           ||\n";
        print "           ||\n";
        print "  =============\n\n";
    }
    elsif($incorrectGuessCount==5){
        print "    =========\n";
        print "    O      ||\n";
        print "   \\|/     ||\n";
        print "    |      ||\n";
        print "           ||\n";
        print "           ||\n";
        print "  =============\n\n";
    }
    elsif($incorrectGuessCount==6){
        print "    =========\n";
        print "    O      ||\n";
        print "   \\|/     ||\n";
        print "    |      ||\n";
        print "   /       ||\n";
        print "           ||\n";
        print "  =============\n\n";
    }
    else{
        print "    =========\n";
        print "    O      ||\n";
        print "   \\|/     ||\n";
        print "    |      ||\n";
        print "   / \\     ||\n";
        print "           ||\n";
        print "  =============\n\n";
    }
}