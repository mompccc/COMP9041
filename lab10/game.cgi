#!/usr/bin/perl -w

use CGI qw/:all/;
use CGI::Carp qw/fatalsToBrowser warningsToBrowser/;

$max_number_to_guess = 99;

sub main() {
    # print start of HTML ASAP to assist debugging if there is an error in the script
    print page_header();
    
    # Now tell CGI::Carp to embed any warning in HTML
    warningsToBrowser(1);
    
	$username = param('username') || '';
	$password = param('password') || '';

	# remove any non-word characters from username 
	# another malicious user could include ../ in username
	$username =~ s/\W//g;
	# limit username to 32 word characters
	$username = substr $username, 0, 32;

	if (!$username || !$password) {
		print login_form();
	} 
	elsif (not -d "./accounts/$username"){
		print"Unknown username!\n";
		print login_form();}
	elsif (not $password eq get()){
		print"Incorrect password!\n";
		print login_form();}
	else {
		$guess = param('guess') || '';
		# remove any non-digit characters from guess
		$guess =~ s/\D//g;
	
		$number_to_guess = param('number_to_guess') || '';
		$number_to_guess =~ s/\D//g;
		
		if ($number_to_guess eq '') {
			$number_to_guess = 1 + int(rand $max_number_to_guess);
 			print "I've thought of a number\n";
			print guess_number_form($username, $password, $number_to_guess);
		} elsif ($guess eq '') {
			print guess_number_form($username, $password, $number_to_guess);
		} elsif ($guess == $number_to_guess) {
    		print "You guessed right, it was $number_to_guess.\n";
    		print new_game_form($username, $password);
		} elsif ($guess < $number_to_guess) {
    		print "Its higher than $guess.\n";
			print guess_number_form($username, $password, $number_to_guess);
		} else {
    		print "Its lower than $guess.\n";
			print guess_number_form($username, $password, $number_to_guess);
		} 
	}
	
    print page_trailer();
}

# form to allow user to supply username/password 
sub get{
	my $correct = `cat ./accounts/$username/password`;
	chomp $correct;
	return $correct;}

sub login_form {
	return <<eof;
    <form method="POST" action="">
        Username: <input type="textfield" name="username">
        <p>
        Password: <input type="password" name="password">
         <p>
        <input type="submit" value="Login">
    </form>
eof
}

#
# form to allow user to guess a number
#
# Pass username & password to next invocation as hidden
# field so user doesn't have to login again
#

sub guess_number_form {
	my ($username, $password, $number_to_guess) = @_;
	return <<eof;
    <form method="POST" action="">
    	Enter a guess between 1 and $max_number_to_guess (inclusive):
     	<input type="textfield" name="guess">
     	<input type="hidden" name="username" value="$username">
     	<input type="hidden" name="password" value="$password">
     	<input type="hidden" name="number_to_guess" value="$number_to_guess">
     </form>
eof
}

#
# form to allow user to go to a new game
#
sub new_game_form {
	my ($username, $password) = @_;
	return <<eof;
    <form method="POST" action="">
        <input type="submit" value="Play Again">
     	<input type="hidden" name="username" value="$username">
     	<input type="hidden" name="password" value="$password">
    </form>
eof
}



#
# HTML placed at the top of every page
#
sub page_header {
    return <<eof
Content-Type: text/html;charset=utf-8

<!DOCTYPE html>
<html lang="en">
<head>
<title>Guess A Number</title>
</head>
<body>
eof
}


#
# HTML placed at the bottom of every page
#
sub page_trailer {
    return "</body>\n</html>\n";
}

main();
exit(0);

