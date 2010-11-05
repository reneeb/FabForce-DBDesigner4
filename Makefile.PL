use 5.006001;
use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile(
    NAME              => 'FabForce::DBDesigner4',
    VERSION_FROM      => 'lib/FabForce/DBDesigner4.pm', # finds $VERSION
    PREREQ_PM         => {
        'XML::Twig'   => 3.32,
        'IO::File'    => 1.1,
        'Carp'        => 1.04,
        'Exporter'    => 5.58,
    }, # e.g., Module::Name => 1.1
    ($] >= 5.005 ?     ## Add these new keywords supported since 5.005
      (ABSTRACT_FROM  => 'lib/FabForce/DBDesigner4.pm', # retrieve abstract from module
       AUTHOR         => 'Renee Baecker <module@renee-baecker.de>') : ()),
    ($ExtUtils::MakeMaker::VERSION >= 6.31 ?
      (LICENSE        => 'artistic_2' ) : ()),
);
