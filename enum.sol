//SPDX-License-Identifier:MIT 
pragma solidity ^0.8.7 ;

contract Enum{

    enum hafta_gunleri{
        Pazartesi,
        Sali,
        Carsamba,
        Persembe,
        Cuma,
        Cumartesi,
        Pazar 
    }

    hafta_gunleri hafta ;
    hafta_gunleri secim;

    hafta_gunleri constant varsayilan = hafta_gunleri.Pazartesi;

    function set_value() public {
        secim = hafta_gunleri.Cuma ; 

    }

    function get_secim() public view returns(hafta_gunleri){
        return secim ; 
    }
}