#!/usr/bin/perl

# Andrew Pennebaker
#
# Based on Colin Edwards' UAC Bypass
# http://www.recursivepenguin.com/index.php?projectID=3
#
# KOPIMI

use Error qw(:try);
use Crypt::SSLeay;
use WWW::Mechanize;
use HTML::TokeParser;

use strict;

# Get config variables from the command line.
#my ($url, $useragent, $success, $timeout, $username, $password)=@ARGV;

# Hardcoded config variables.
my $url="https://uac.gmu.edu/dana-na/auth/url_0/welcome.cgi?p=failed";
my $useragent="Windows Mozilla";
my $success="You have successfully logged in";
my $timeout=40;
my $username="USERNAME";
my $password="PASSWORD";

# From http://perl.coding-school.com/perl-timeout/
sub gripe {
        throw Error::Simple("Timeout");
}
$SIG{ALRM}=\&gripe;

sub login {
        my ($url, $ua, $s, $u, $p)=@_;

        try {
                my $agent=WWW::Mechanize->new( ssl_opts => {verify_hostname => 0 } );
                $agent->agent_alias($ua);

                alarm $timeout;
                $agent->get($url);
                alarm 0;

                $agent->submit_form(form_number=>1, fields=>{username=>$u, password=>$p});
                $agent->submit_form(form_number=>1);

                return $agent->success && $agent->content =~ /$s/;
        }
        catch Error with {
                print "Caught an error.\n";
                return 0;
        };
}

if (login($url, $useragent, $success, $username, $password)) {
        print "success!\n";
        exit 0;
}
else {
        print "failure!\n";
        exit -1;
}
