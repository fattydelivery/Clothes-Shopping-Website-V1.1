/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* Clothing */
            var curIndex=0; //图片数组的下标
            var timeInterval=2000;   //时间间隔
            var arr = new Array();
            arr[0] = "../image/2.jpg";
            arr[1] = "../image/3.jpg";
            arr[2] = "../image/4.jpg";
            arr[3] = "../image/5.jpg";
            arr[4] = "../image/1.jpg";
            setInterval(changeImg,timeInterval);
            function changeImg(){
                var obj=document.getElementById("obj");   //给id赋名字
                if(curIndex===arr.length-1){
                    curIndex = 0;
                } else{
                    curIndex+=1;
                }
                obj.src = arr[curIndex];
            }


