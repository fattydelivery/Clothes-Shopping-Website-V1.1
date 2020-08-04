/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

//var size, color;
//var url = window.location.search;
//var str = new array();
//for(var i=0; i<url.indexOf("?"); i++){
//    str[i] = url.substr(i);
//}
//
//function buttonClicked(){
//    for(var i=1; i<=5; i++){
//       if(document.getElementById("size"+i).isclicked === true){
//           size = document.getElementById("size"+i).value;
//           break;
//       }
//    }
//    for(var i=1; i<5; i++){
//        if(document.getElementById("c"+i).isclicked === true){
//            color = document.getElementById("c"+i).value;
//            break;
//        }
//    }
//}

document.getElementById("m").onclick = minusGet;
            document.getElementById("p").onclick = plusGet;
            var num=1;
            function minusGet() {
                var value = document.getElementById("num").innerHTML;
                if (value.toString() !== "1") {
                    value--;
                    document.getElementById("num").innerHTML = value;
                } 
                num = value;
//                else if (value.toString() === "1") {
//                    document.getElementById("cart").parentNode.removeChild(document.getElementById("cart"));
//                    document.getElementById("blank").parentNode.removeChild(document.getElementById("blank"));
//                    }
                }
                function plusGet() {
                    var nums = document.getElementById("num").innerHTML;
                        nums++;
                        document.getElementById("num").innerHTML = nums;
                        num = nums;
                }
//                function buyGet() {
//                window.location.href = "#";
//                document.getElementById("cart").parentNode.removeChild(document.getElementById("cart"));
//                document.getElementById("blank").parentNode.removeChild(document.getElementById("blank"));
//            }

location.href="ClothingCheck.jsp?item_amount="+num;

