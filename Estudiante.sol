// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract estudiante 
{
string private _nombre;
string private _apellido;
string private _curso;
address private _docente;
mapping(string => uint) private _notas_materias;
mapping(uint => string) private _materias;
uint8 private _cantidad_materias;


constructor (string memory nombre_, string memory apellido_, string memory curso_)
{
    _nombre = nombre_;
    _apellido = apellido_;
    _curso = curso_;
    _docente = msg.sender;
}

function apellido() public view returns (string memory)
{
    return _apellido;
}

function _nombre_completo() public view returns (string memory)
{
    string memory _nombre_completo_concat = string(abi.encodePacked(_nombre, """", _apellido));
    return _nombre_completo_concat;
}

function curso() public view returns (string memory)
{
    return _curso;
}

function set_nota_materia (string memory materia, uint nota) public
{
    require (msg.sender == _docente, "El docente es el unico que puede asignar la nota");
    if (nota > 0 && nota < 101)
    {
    _notas_materias[materia] = nota;
    _cantidad_materias += 1;
    }
}

function nota_materia (string memory materia) public view returns (uint)
{
    return _notas_materias[materia];
}

function aprobo (string memory materia) public view returns (bool)
{
    bool _aprobo = false;
    if (_notas_materias[materia] > 59)
    {
        _aprobo = true;
    }
    return _aprobo;
}

function promedio () public view returns (uint)
{
    uint _puntos = 0;
    for (uint8 i = 0; i < _cantidad_materias; i++)
    {
        _puntos += _notas_materias[_materias[i]];
    }
    _puntos /= _cantidad_materias;
    return _puntos;
}


}