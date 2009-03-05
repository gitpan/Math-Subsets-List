=head1 Name

Math::Power::List - Generate all subsets of a list.

=head1 Synopsis

 use Math::Subsets::List;

 subsets {say "@_"} qw(a b c);

 #    
 #  a 
 #  b
 #  c
 #  a b 
 #  a c 
 #  b c
 #  a b c

=cut

use strict;

package Math::Subsets::List;

sub subsets(&@)
 {my $s = shift;       # Subroutine to call to process each subset

  my $n = scalar(@_);  # Size of list to be subsetted
  my $l = 0;           # Current item
  my @p = ();          # Current subset
  my @P = @_;          # List to be subsetted

  my $p; $p = sub      # Generate each subset
   {if ($l < $n)
     {++$l;
      &$p();
      push @p, $P[$l-1];
      &$p();
      pop @p;
      --$l
     }
    else 
     {&$s(@p)
     }
   };

  &$p;
  
  2**$n;
 }

# Export details
 
require 5;
require Exporter;

use vars qw(@ISA @EXPORT $VERSION);

@ISA     = qw(Exporter);
@EXPORT  = qw(subsets);
$VERSION = '1.001';

=head1 Description

Generate and process all the all the subsets of a list using the
standard Perl metaphor. 

C<subsets()> returns the number of subsets. Please note that this
incloudes the empty set as it is a subset of all sets.

Its easy to use and fast. Its written in 100% Pure Perl.

Please note that the order in which the subsets are generated is
not guaranteed, so please do not rely on it.

=head1 Export

The C<subsets()> function is exported.

=head1 Installation

Standard Module::Build process for building and installing modules:

  perl Build.PL
  ./Build
  ./Build test
  ./Build install

Or, if you're on a platform (like DOS or Windows) that doesn't require
the "./" notation, you can do this:

  perl Build.PL
  Build
  Build test
  Build install

=head1 Author

PhilipRBrenan@handybackup.com

http://www.handybackup.com

=head1 See Also

L<Math::Permute::List>
L<Math::Disarrange::List>

=head1 Copyright

Copyright (c) 2009 Philip R Brenan.

This module is free software. It may be used, redistributed and/or
modified under the same terms as Perl itself.

=cut
