window.onload = function(){
    var preview = document.getElementById('fdj-wrap');
    var big = document.getElementById('img-big');
    var bigImg = big.getElementsByTagName('img')[0];
    var medium = document.getElementById('img-medium');
    var mediumImg = medium.getElementsByTagName('img')[0];
    var mark = document.getElementById('mark');
    var detail = document.getElementById('detail');
	
    medium.onmouseover = function(){
        mark.style.display = "block";
        big.style.display = "block";
    }
    medium.onmouseout = function(){
        mark.style.display = "none";
        big.style.display = "none";
    }
    medium.onmousemove = function(e){
        var e = e || window.event;
        var left = e.clientX - preview.offsetLeft-mark.offsetWidth/2;
        var top = e.clientY - preview.offsetTop-mark.offsetHeight/2;
        var markOffsetWidth = mark.offsetWidth;
        var mediumOffsetWidth = this.offsetWidth;
        if(left<20){
            left = 20;
        }else if(left > mediumOffsetWidth - markOffsetWidth){
            left = mediumOffsetWidth - markOffsetWidth+20;
        }
        if(top<0){
            top = 0;
        }else if(top > mediumOffsetWidth - markOffsetWidth){
            top = mediumOffsetWidth - markOffsetWidth;
        }
        mark.style.left = left+'px';
        mark.style.top = top+'px';
        persentX = left/(mediumOffsetWidth - markOffsetWidth);
        persentY = top/(mediumOffsetWidth - markOffsetWidth);
        detail.style.left = -persentX*big.clientWidth+'px';
        detail.style.top = -persentY*big.clientHeight+'px';
    }
    var imgItems = document.getElementById('img-items');
    var liNodes = imgItems.childNodes;
    var tmpNodes = [];
    for(var i=0;i<liNodes.length;i++){
        if(liNodes[i].nodeType == 3) continue;
        tmpNodes.push(liNodes[i]);
    }
    var liNum = tmpNodes.length;
    var liWidth =80;
    var liNo1 = tmpNodes[0].getElementsByTagName('img')[0];
    	liNo1.style.border= "1px solid #e4393c";
        liNo1.style.width = "67px";
        liNo1.style.height = "67px";
        
        mediumImg.setAttribute('src',liNo1.getAttribute('src'));
        bigImg.setAttribute('src',liNo1.getAttribute('src'));
    for(var j=0;j<liNum;j++){
        tmpNodes[j].index = j;
        tmpNodes[j].onmouseover = function(){
            var img = this.getElementsByTagName('img')[0];
            img.style.border = "1px solid #e4393c";
            img.style.width = "67px";
            img.style.height = "67px";
            var _this = this;
            for(var k=0;k<liNum;k++){
                if(k != _this.index){
                    var imgI = tmpNodes[k].getElementsByTagName('img')[0];
                    imgI.style.border = "1px solid #FFFFFF";
                    imgI.style.width = "67px";
                    imgI.style.height = "67px";     
                }
            }
            mediumImg.setAttribute('src',img.getAttribute('src'));
            bigImg.setAttribute('src',img.getAttribute('src'));
        }

    }

    var totalWidth = liWidth*liNum;
    var mcount = liNum - 5;
    var now = 0;
    var lBtn = document.getElementById('left');
    var rBtn = document.getElementById('right');
    lBtn.onclick = function(){
        if(now == 0){
            now = 0;
        }else{                   
            now--;
            var timeId = setInterval(function(){
                imgItems.style.left = (parseInt(getCurrentStyle(imgItems)["left"])+1)+'px';
                if(parseInt(getCurrentStyle(imgItems)["left"]) == -now*liWidth){
                    clearInterval(timeId);
                }
            },10);
        }
    }
    rBtn.onclick = function(){
        if(now < mcount){
            now++;
            var timeId = setInterval(function(){
                imgItems.style.left = (parseInt(getCurrentStyle(imgItems)["left"])-1)+'px';
                if(parseInt(getCurrentStyle(imgItems)["left"]) == -now*liWidth){
                    clearInterval(timeId);
                }
            },10);
        }
    }
}