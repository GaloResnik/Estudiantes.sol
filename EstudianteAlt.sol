// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract EstudianteAlt
{
    string private _nombre;
    string private _apellido;
    string private _curso;
    mapping (uint => string) private _materias;
    mapping (uint8 => mapping (string => uint8)) private _bim_notas_mat;
    uint private _cantidad_materias;
    mapping (address => bool) _docentes;

    constructor (string memory nombre_, string memory apellido_, string memory curso_)
    {
        _nombre = nombre_;
        _apellido = apellido_;
        _curso = curso_;
        _docentes[msg.sender] = true;
    }

    modifier confirmar_docente()
    {
        require(_docentes[msg.sender], "Solo puede acceder un docente");
        _;
    }

    function _set_bim_nota_materia (uint8 _nota, string memory _materia, uint8 _bimestre) public confirmar_docente
    {
        require (_nota > 0 && _nota <= 100, "Ingresar una nota valida");
        _bim_notas_mat[_bimestre][_materia] = _nota;
    }

    function _nueva_materia (string memory _materia_nueva) public confirmar_docente
    {
        _materias[_cantidad_materias] = _materia_nueva;
        _cantidad_materias++;
    }

    function _nuevo_docente (address _docente_nuevo) public confirmar_docente
    {
        _docentes[_docente_nuevo] = true;
    }

    function apellido() public view returns (string memory)
    {
        return _apellido;
    }

    function nombre_completo() public view returns (string memory)
    {
        string memory _nombre_completo_concat = string(abi.encodePacked(_nombre, """", _apellido));
        return _nombre_completo_concat;
    }

    function curso() public view returns (string memory)
    {
        return _curso;
    }

    function nota_materia (string memory materia, uint8 bimestre) public view returns(uint8)
    {
        return _bim_notas_mat[bimestre][materia];
    }

    function aprobo (string memory materia, uint8 bimestre) public view returns(bool)
    {
        bool _aprobo = false;
        if (_bim_notas_mat[bimestre][materia] >= 60)
        {
            _aprobo = true;
        }
        return _aprobo;
    }

    function promedio (uint8 bimestre) public view returns(uint)
    {
        uint _puntos = 0;
        for (uint i = 0; i < _cantidad_materias; i++)
        {
            _puntos += _bim_notas_mat[bimestre][_materias[i]];
        }
        _puntos /= _cantidad_materias;
        return _puntos;
    }

}