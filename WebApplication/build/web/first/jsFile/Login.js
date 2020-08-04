/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import {findIdUser} from "impl.UserImpl";

function check(){
    var username = document.getElementById("user").value;
    var pass = document.getElementById("pass").value;
    if(username === "" || pass === "" || console.log(findIdUser(username))!==pass){
        alert("The username or password is incorrect.");
    } else{
        location.href="HomePage.jsp?userid="+username;
    }
}

