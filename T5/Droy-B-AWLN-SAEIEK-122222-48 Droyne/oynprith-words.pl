#!/usr/local/bin/perl
 
#  
 #
 # Yet Another PERL Script
 #
 # Name: droyne
 #
 # Date: 1.18.97
 #
 # Desc: generates Droyne words
 #
 # Dude: rje
 #
 #
# 
srand (time ^ (($$ << 15) + $$));
my $count = shift || 1;

my @basicSyllable =
(
   ('V')   x 6,
    'V',        ('CV') x 5,
   ('CV')  x 6, 
   ('VC')  x 6,
   ('VC')  x 5,
   ('CVC') x 7
);

my @alternateSyllable =
(
   ('V')   x 6,
   ('CV')  x 6,
   ('VC')  x 6,
   ('CVC') x 18
);

my @initialConsonant =
(
   ('B')   x 8,
   ('BR')  x 4,
   ('D')   x 12,
   ('DR')  x 5,
   ('F')   x 13,
   ('H')   x 13,
   ('K')   x 13,
   ('KR')  x 3,
   ('L')   x 9,
   ('M')   x 14,
   ('N')   x 14,
   ('P')   x 12,
   ('PR')  x 2,
   ('R')   x 11,
   ('S')   x 24,
   ('SS')  x 10,
   ('ST')  x 3,
   ('T')   x 10,
   ('TH')  x 5,
   ('TR')  x 5,
   ('TS')  x 9,
   ('TW')  x 9,
   ('V')   x 9
);

my @vowel =
(
   ('A')  x 24,
   ('AY') x 18,
   ('E')  x 35,
   ('I')  x 30,
   ('O')  x 24,
   ('OY') x 12,
   ('U')  x 39,
   ('YA') x 9,
   ('YO') x 7,
   ('YU')  x 11
);

my @finalConsonant =
(
   ('B')  x 6,
   ('D')  x 11,
   ('F')  x 5,
   ('H')  x 6,
   ('K')  x 8,
   ('L')  x 4,
   ('LB') x 2,
   ('LD') x 7,
   ('LK') x 4,
   ('LM') x 3,
   'LN',
   'LP',
   'LS', 'LS',
   'LT', 'LT',
   ('M')  x 11,
   ('N')  x 7,
   ('P')  x 12,
   ('R')  x 9,
   ('RD') x 3,
   ('RF') x 2,
   ('RK') x 5,
   ('RM') x 4,
   ('RN') x 3,
   'RP',
   ('RS') x 4,
   ('RT') x 5,
   ('RV') x 2,
   ('S')  x 23,
   ('SK') x 6,
   ('SS') x 8,
   ('ST') x 5,
   ('T')  x 12,
   ('TH') x 6,
   ('TS') x 10,
   ('V')  x 4,
   ('X')  x 12
);

my $prevEnding;
my $thisSyl, $prevSyl;

for (1..$count)
{
   $prevEnding = 'C';
   $vowel      = 0;
   $word       = '';
   $numSyllables = int(rand(3)+2);

   $thisSyl = $basicSyllable[rand(@basicSyllable)];
   for $sylNum (1..$numSyllables)
   {
      if ($thisSyl eq 'V')
      {
         $word   .= $vowel[rand(@vowel)];
         $thisSyl = $basicSyllable[rand(@basicSyllable)];
      }
      elsif ($thisSyl eq 'VC')
      {
         $word   .= $vowel[rand(@vowel)];
         $word   .= $finalConsonant[rand(@finalConsonant)];
         $thisSyl = $alternateSyllable[rand(@alternateSyllable)];
      }
      elsif ($thisSyl eq 'CV')
      {
         $word   .= $initialConsonant[rand(@initialConsonant)];
         $thisSyl = $basicSyllable[rand(@basicSyllable)];
      }
      else  # CVC
      {
         $word   .= $initialConsonant[rand(@initialConsonant)];
         $word   .= $vowel[rand(@vowel)];
         $word   .= $finalConsonant[rand(@finalConsonant)];
         $thisSyl = $alternateSyllable[rand(@alternateSyllable)];
      }
   }
   $word =~ s/(\w)(.*)/\u$1\L$2\n/;
   print $word;
}
