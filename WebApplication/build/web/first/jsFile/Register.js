/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function save(){
    if(document.getElementById("userno").value === "" || document.getElementById("userid").value === "" || document.getElementById("pass").value === ""){
        alert("UserNo or UserID or Password is empty.");
    } else{
        location.href = "save";
    }
}

