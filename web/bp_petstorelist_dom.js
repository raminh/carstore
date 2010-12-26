var bpui;
if(typeof bpui == "undefined") {
    bpui=new Object();
}
bpui.carstoreList=new Object();

bpui.carstoreList.divName="";
bpui.carstoreList.currentCount=0;

bpui.carstoreList.populateData=function(datax) {
    if(typeof datax != "undefined") {
        
        // get outerdiv
        var targetDiv=document.getElementById(bpui.carstoreList.divName);
        
        // make sure div is clear
        targetDiv.innerHTML="";
        
        // add class to containing div
        targetDiv.setAttribute("class", "bpui_carstorelist_div")
        
        // add table
        tablex=document.createElement("table");
        tablex.setAttribute("class", "bpui_carstorelist_table")
        targetDiv.appendChild(tablex);

        // loop through product results
        for(ii=0; ii < datax.length; ii++) {
            // add row
            rowx=document.createElement("tr");
            
            // add product image with hyperlink
            colx=document.createElement("td");
            ax=document.createElement("a");
            ax.setAttribute("href", "http://localhost:8080/carstore/faces/catalog.jsp#" + datax[ii].productID + "," + datax[ii].itemID)
            ax.setAttribute("target", "bpcarstore")
            ax.setAttribute("class", "bpui_carstorelist_image")
            imgx=document.createElement("img");
            imgx.setAttribute("src", "http://localhost:8080/carstore/ImageServlet/" + datax[ii].imageThumbURL);
            ax.appendChild(imgx);
            colx.appendChild(ax);
            rowx.appendChild(colx);

            // add product name with hyperlink
            colx=document.createElement("td");
            ax=document.createElement("a");
            ax.setAttribute("href", "http://localhost:8080/carstore/faces/catalog.jsp#" + datax[ii].productID + "," + datax[ii].itemID)
            ax.setAttribute("target", "bpcarstore")
            ax.setAttribute("class", "bpui_carstorelist_name_link")
            spanx=document.createElement("span");
            spanx.setAttribute("class", "bpui_carstorelist_name")
            spanx.appendChild(document.createTextNode(datax[ii].name));
            ax.appendChild(spanx);
            colx.appendChild(ax);
            colx.appendChild(document.createElement("br"));
            // add product description
            spanx=document.createElement("span");
            spanx.setAttribute("class", "bpui_carstorelist_description");
            spanx.appendChild(document.createTextNode(datax[ii].description));
            colx.appendChild(spanx);
            rowx.appendChild(colx);
            
            // add product price
            colx=document.createElement("td");
            spanx=document.createElement("span");
            spanx.setAttribute("class", "bpui_carstorelist_price");
            spanx.appendChild(document.createTextNode("\$" + datax[ii].price));
            colx.appendChild(spanx);
            rowx.appendChild(colx);

            // add row to table
            tablex.appendChild(rowx);
        }
        
        // add product previous and next
        rowx=document.createElement("tr");
        colx=document.createElement("td");
        colx.setAttribute("colspan", "3");
        spanx=document.createElement("span");
        spanx.setAttribute("class", "bpui_carstorelist_previous");
        spanx.setAttribute("onclick", "bpui.carstoreList.previousProducts();");
        spanx.appendChild(document.createTextNode("<< PREVIOUS"));
        colx.appendChild(spanx);
        
        spanx=document.createElement("span");
        spanx.setAttribute("class", "bpui_carstorelist_next");
        spanx.setAttribute("onclick", "bpui.carstoreList.nextProducts();");
        spanx.appendChild(document.createTextNode("NEXT >>"));
        colx.appendChild(spanx);
        rowx.appendChild(colx);

        // add row to table
        tablex.appendChild(rowx);
    }
}


bpui.carstoreList.nextProducts=function() {
    // load data from service
    bpui.carstoreList.currentCount += 5;
    bpui.carstoreList.updateProducts();
}


bpui.carstoreList.previousProducts=function() {
    bpui.carstoreList.currentCount -= 5;
    if(bpui.carstoreList.currentCount < 0) {
        bpui.carstoreList.currentCount=0;
    }
    bpui.carstoreList.updateProducts();
}


bpui.carstoreList.updateProducts=function() {
    // load data from service
    bodyTag=document.getElementsByTagName("body")[0];
    scriptx=document.createElement("script");
    scriptx.setAttribute("type", "text/javascript");
    scriptx.setAttribute("src", "http://localhost:8080/carstore/catalog?command=items&pid=feline01&start=" + bpui.carstoreList.currentCount + "&length=5&format=jsonp");
    bodyTag.appendChild(scriptx);
}



bpui.carstoreList.createCarstoreList=function(divName) {
    // keep divName for later references
    bpui.carstoreList.divName=divName;

    // load data from service
    bodyTag=document.getElementsByTagName("body")[0];
    scriptx=document.createElement("script");
    scriptx.setAttribute("type", "text/javascript");
    scriptx.setAttribute("src", "http://localhost:8080/carstore/catalog?command=items&pid=feline01&start=0&length=5&format=jsonp");
    bodyTag.appendChild(scriptx);
}

