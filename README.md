////////MODULE: PROJETO PROCESSADOR RISC-V EM MICROARQUITETURA CICLO ÚNICO////////

Este projeto contém o trabalho feito na linguagem de hardware System Verilog utilizando o software QUARTUS II da construção de uma microarquitetura de processador de Ciclo único para RISC-V, contem algumas instruções comumente utilizadas para a área. É feito o suporte para utilização nas placas FPGA, especificamente, no qual é enviado juntamente arquivos auxiliares para facilitar a utilização da placa, porém é possível utilizar para simulações, sem a presença da placa física, em testbenchs online. 

-->Descrevendo DATA-PATH:
	-Composto por um registrador "PC" responsável por garantir a continuidade do funcionamento do processador por linha de instruções; 
	-Um decodificador de endereço de linha de instruções para a linguagem de máquina, "Instruction Memory";
	-Um bloco responsável por conter todos os registradores utilizados para trabalhar com todas as instruções desenvolvidas, sendo eles 8 registros de 1 byte cada, além de permitir a capacidade de leitura e escrita nos registradores através de sistemas de endereçamento, utilizados em RISC-V, no "Register File";
	-A "ULA" será o bloco responsável pelas operações lógicas entre os operadores acessados no Register File entre eles e entre imediatos, que se tratam de valores pré-determinados;
	-Contém também um bloco de memoria, denominado "Data Memory", onde é possível acessar a leitura e escrita no mesmo através de endereçamentos de memória;
	-Um extensor de imediatos propriamente específico para cada tipo de instrução utilizada;
	-Habilita-se entrada e saída paralela de dados através do endereçamento de memória em instruções "sb"(para saída) e "lb"(para entrada) no endereço 0xFF;
	-Capacidade de saltos/desvios na arquitetura;

-->Descrevendo CONTROL-UNIT:
	-Decodifica os bits recebidos da "Instruction Memory", alocando o "op", "funct3", "funct7" e determina quais sinais de controle serão habilitados e quais sinais de seleção serão enviados, para cada tipo de instrução suportado pelo processador, caracaterizando um Ciclo-Único no qual irá permitir processamento de instruções em apenas um ciclo de clock, que poderá ser previamente definido.

-->Funções suportadas:
	-ADD;
	-SUB;
	-AND;
	-OR;
	-SLT;
	-ADDI;
	-LB;
	-SB;
	-BEQ;
	-JAL;
	-JR;
	-ANDI;
	-ORI.

-->Utilização:
	Para o trabalho com esse projeto, será necessário incialmente criar o programa em Assembly RISC-V e convertê-lo para linhas de código de máquina. Posteriormente adicionar cada linha ao decodificador de "Instruction Memory", em um decodificador de linha de PC, definindo em qual endereço de PC a instrução já convertida irá acontecer. Poderá utilizar qualquer uma das funções suportadas pela arquitetura e realizar seus projetos.

//endmodule
	
