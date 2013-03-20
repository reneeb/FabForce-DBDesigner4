package FabForce::DBDesigner4::SQL::Sqlite;

use strict;
use warnings;

our $VERSION     = '0.01';

sub create_table {
    my ($class,$table,$options) = @_;
        
    my @columns   = $table->columns();
    my $tablename = $table->name();
    
    my $cols_string =  join(",\n  ",@columns);
       $cols_string =~ s!\s+\z!!;
    
    my $has_autoinc = $cols_string =~ m!AUTOINCREMENT!;
    $cols_string =~ s!AUTOINCREMENT!PRIMARY KEY!g;
    
    my $options_string = "";
    
    if ( $options and ref $options ) {
        my @options;
        if( $options->{engine} ) {
            push @options, 'ENGINE=' . $options->{engine};
        }
        if( $options->{charset} ) {
            push @options, 'DEFAULT CHARSET=' . $options->{charset};
        }

        $options_string = join ' ', @options;
    }
    
    my $stmt = "CREATE TABLE `$tablename` (\n  $cols_string,\n  ";
    $stmt   .= "PRIMARY KEY(" . join( ",", $table->key ) . "),\n  " 
        if scalar( $table->key ) > 1 or ( !$has_autoinc and scalar $table->key );
        
    $stmt    =~ s!,\n\s\s\z!\n!;
    
    $stmt   .= ")$options_string;\n\n";
}

sub drop_table {
    my ($class,$table,$options) = @_;
    
    my $name = $table->name;
    my $stmt = qq~DROP TABLE IF EXISTS `$name`;\n\n~;
    
    $stmt;
}

1;



=pod

=head1 NAME

FabForce::DBDesigner4::SQL::Sqlite

=head1 VERSION

version 0.31

=head1 SYNOPSIS

  my $create_stmt = FabForce::DBDesigner4::SQL::Sqlite->create_table( $fabforce_table_object );

=head1 DESCRIPTION

As each database system has its own syntax, it is important to provide functions
for each system.

=head1 NAME

FabForce::DBDesigner4::SQL::Sqlite - create sql with Sqlite specific syntax

=head1 METHODS

=head2 create_table

  my $create_stmt = FabForce::DBDesigner4::SQL::Sqlite->create_table( $fabforce_table_object );

Things it does:

=over 4

=item * Use AUTO_INCREMENT instead of AUTOINCREMENT

=item * don't use foreign keys

=back

=head2 drop_table

create a "drop table" statement for the given tablename

  $class->drop_table( $fabforce_table_object );

returns

  DROP TABLE IF EXISTS `tablename`

=head1 AUTHOR

Renee Baecker, E<lt>module@renee-baecker.deE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2005 - 2009 by Renee Baecker

This program is free software; you can redistribute it and/or
modify it under the terms of the Artistic License version 2.0.

=cut

=head1 AUTHOR

Renee Baecker <module@renee-baecker.de>

=head1 COPYRIGHT AND LICENSE

This software is Copyright (c) 2010 by Renee Baecker.

This is free software, licensed under:

  The Artistic License 2.0

=cut


__END__

