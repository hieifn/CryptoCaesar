use warnings;
use strict;


sub code{
    my ($mensagem, $senha, $tamanho) = @_;
    my @charsMensagem = split("", $mensagem);
    my $lowerSenha= lc($senha);
    my @charsSenha = split("", $lowerSenha);
    my $contador=0;
    foreach (@charsMensagem){
        my $i='a';
        if (/[a-zA-Z0-9]/){
            while($i ne @charsSenha[$contador % $tamanho]){
                ++$_;
                ++$i;
            }
            my @letra = split("",$_);
            $_= $letra[-1];
            $contador++;
            #print $_,"\n";
        }
    }
    return (@charsMensagem);
}

sub decode{
    my ($mensagem, $senha, $tamanho) = @_;
    my @charsMensagem = split("", $mensagem);
    my $lowerSenha= lc($senha);
    my @charsSenha = split("", $lowerSenha);
    my $contador=0;
    foreach (@charsMensagem){
        my $i='a';
        if (/[a-zA-Z0-9]/){
            while($i ne @charsSenha[$contador % $tamanho]){
                for (my $j=0; $j<25; $j++){#HACK PARA FAZER DECREMENTO, JA QUE PERL NÃO CONSEGUE DECREMENTAR
                    ++$_;
                }
                ++$i;
            }
            my @letra = split("",$_);
            $_= $letra[-1];
            $contador++;
            #print $_,"\n";
        }
    }
    return (@charsMensagem);
}
#my @alfabeto=('a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z');
#sfnjapm =  code (abacaxi,senha,3);
##Eduardo asa 3
my $m= "Eduardo999";
my $s= "b";
my $lenght= 1;
print code($m,$s, $lenght), "\n";
#print decode($m,$s, $lenght), "\n";

