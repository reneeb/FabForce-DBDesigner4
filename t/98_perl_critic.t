#!perl -T

use Test::More tests => 7;
use FabForce::DBDesigner4;

SKIP:{

    skip 'Set RELEASE_TESTING=1 to run this test' => 7 if not $ENV{RELEASE_TESTING};

    eval "use Perl::Critic";
    skip "Perl::Critic required", 7 if $@;

    my $pc = Perl::Critic->new();
    my @violations = $pc->critique($INC{'FabForce/DBDesigner4.pm'});
    is_deeply(\@violations,[],'Perl::Critic');
    my @violations2 = $pc->critique($INC{'FabForce/DBDesigner4/Table.pm'});
    is_deeply(\@violations2,[],'Perl::Critic');
    my @violations3 = $pc->critique($INC{'FabForce/DBDesigner4/SQL.pm'});
    is_deeply(\@violations3,[],'Perl::Critic');
    my @violations4 = $pc->critique($INC{'FabForce/DBDesigner4/XML.pm'});
    is_deeply(\@violations4,[],'Perl::Critic');
    my @violations5 = $pc->critique($INC{'FabForce/DBDesigner4/SQL/Mysql.pm'});
    is_deeply(\@violations5,[],'Perl::Critic');
    my @violations6 = $pc->critique($INC{'FabForce/DBDesigner4/SQL/Utils.pm'});
    is_deeply(\@violations6,[],'Perl::Critic');
    my @violations7 = $pc->critique($INC{'FabForce/DBDesigner4/SQL/Sqlite.pm'});
    is_deeply(\@violations7,[],'Perl::Critic');
}

