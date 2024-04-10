#!/usr/bin/perl
use v5.10;

my $num = shift || 30;

#
#  Horn sound inventory:
#
#  A B D E F H I K L M N O P R S T U Y
#  FR
#  NS NSK SK
#  SH SHT ST 
#  TH
#

my @initial = qw/
 N  N  N  N  N  N 
 N  SH SH J  K  K
 F  F  M  P  H  T
 L  L  L  L  L  W
 S  S  S  S  TH TH
 R  R  R  R  D  Y
/;

my @vowel = qw/
 A A A A A A
 A A A A A U
 I I I I I I
 I I I O O O
 EE EE Y Y E E
 E E E E E E
/;

my @final = qw/
 H H H H RT RT
 N N N N N B
 F F F F F K
 SHT SHT SHT ST NS SK
 R R R R NSK FR
 SH SH SH SH S T
/;

my @syllable = qw/
 CV CV CV CV CV CV
 CV CV CV CV CV CV
 CVC CVC V V VC VC
 CVC CVC CVC CVC CVC CVC
 CVC CVC CVC CVC CVC CVC
 CVC CVC CVC CVC CVC CVC
/;
               
for (1..$num)
{
   my $word = '';
   for (1..int(rand(6)+1))
   {
      my $syl = $syllable[rand @syllable];
      $word .= $initial[ rand @initial ] if $syl =~ /^C/;
      $word .= $vowel[ rand @vowel ];
      $word .= $final[ rand @final ] if $syl =~ /C$/;
   }
   say ucfirst lc $word;
}

