#### version1.0
  #### Auto install Dependencies
#### version1.1
  #### Auto download Biogrid data and install RSEM and SRA TOOLKIT along with other dependencies
print "\nCSBB is installing a Perl CPAN module so please allow access if required\n";
system('sudo apt-get update');
system('sudo apt-get install build-essential');
system('sudo apt-get install libbundle-cpan-perl');
system('sudo apt-get install libfile-chdir-perl');
use Cwd;
my $cwd = getcwd;
my $dir_to_install=$ARGV[0];
system('sudo apt-get install linuxbrew-wrapper');
system('brew', 'update');
system('brew', 'doctor');
system('sudo apt-get install bowtie2');
system('brew','install','samtools');
system('brew','upgrade','samtools');
system('sudo apt-get install bedtools');
system('sudo apt-get install fastqc');
system('sudo apt-get install wget');
system('sudo apt-get install libssl-dev');
system('sudo apt-get install libxml2-dev');
system('sudo apt-get install pandoc');
system('sudo apt-get install gcc');
system('sudo apt-get install python-pip');
print "\nMaking bash scripts executable\n";
my $bash1=$dir_to_install."\/"."RNA-SEQ_SINGLE-END.sh";
system('chmod' ,'+x' ,$bash1);
my $bash2=$dir_to_install."\/"."RNA-SEQ_PAIRED-END.sh";
system('chmod' ,'+x' ,$bash2);
my $bash3=$dir_to_install."\/"."Bedgraph_Bigwig_Linux"."\/"."bedGraphToBigWig";
system('chmod' ,'+x' ,$bash3);
my $bash4=$dir_to_install."\/"."CHIP-ATAC-Seq_SingleEnd.sh";
system('chmod' ,'+x' ,$bash4);
my $bash5=$dir_to_install."\/"."CHIP-ATAC-Seq_PairedEnd.sh";
system('chmod' ,'+x' ,$bash5);
print "\nInstalling SRA TOOLKIT\n";
my $script_to_install_sratoolkit=$cwd."\/"."Modules"."\/"."Install_SRAtoolkit_Linux.pl";
system("perl","$script_to_install_sratoolkit","$dir_to_install");
print "\nInstalling RSEM\n";
my $script_to_install_rsem=$cwd."\/"."Modules"."\/"."Install_RSEM_Linux.pl";
system("perl","$script_to_install_rsem","$dir_to_install");
print "\nInstalling MACS2\n";
system('sudo pip install numpy');
system('sudo pip install MACS2');
print "\nInstalling DeepTools\n";
system('sudo pip install deeptools');
print "\nDownloading Files from SourceForge\.Net\n";
my $script_to_download=$cwd."\/"."Modules"."\/"."Download_Files_from_sourceforge.pl";
system("perl","$script_to_download","$dir_to_install");
print "\nDownloading Indexes from SourceForge\.Net\n";
my $script_to_download1=$cwd."\/"."Modules"."\/"."Download_RSEM_Bowtie2_Indexes_Sourceforge.pl";
system("perl","$script_to_download1","$dir_to_install");