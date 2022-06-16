# Estudiantes.sol
Estudiantes.sol: 0x88f5eD95Eb501D46cDA827605b2D692baCB4B3da
Galo R. y Francisco S.
> Opcional: 
> a. ¿Cómo modificarías el Smart Contract para que acepte notas de 4 bimestres? 

Para que el Smart Contract acepte notas de 4 bimestres hay que hacer:
- Un mapping que se componga de un uint8 y de otro mapping que este compuesto por un string y un uint8
Esto se escribe: 
                  mapping(uint8 => mapping(string => uint8)) private _bim_notas_mat
                  
- Una funcion que reciba el bimestre, la nota y la materia y le asigne un nuevo valor al mapping teniendo en cuenta los 3 valores

> b. Como le permitirias al docente darle permiso a otros docentes de asignar notas 

Para que el docente pueda darle permiso a otros docentes hay que hacer:
- Un mapping que se componga de un adress y de un bool para registrar a los docentes

- Una funcion que reciba un adress de un docente nuevo y que lo asigne como true en el mapping

> c. Investigar sobre los eventos de Solidity, como incluirías un evento para registrar cuando el docente determina una nota. 



> d. Implementar las consignas a, b y/o c en otro archivo EstudianteAlt.sol
