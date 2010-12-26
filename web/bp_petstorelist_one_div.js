var bpui;
if(typeof bpui == "undefined") {
    bpui=new Object();
}
bpui.carstoreList=new Object();

bpui.carstoreList.divName="";
bpui.carstoreList.currentCount=0;
bpui.carstoreList.category="feline01";


bpui.carstoreList.initialSetup=function() {
        // get outerdiv
        var targetDiv=document.getElementById(bpui.carstoreList.divName);
        
        // containier div
        tablex="<table><tr><td align=\"center\">";
        tablex += "<b>Java BluePrint's Pet Store Category:</b> <select size=\"1\" id=\"bpui.carstoreList.categoryList\" onchange=\"bpui.carstoreList.selectCategory()\">";
        tablex += "<option value=\"feline01\">Hairy Cat</option>";
        tablex += "<option value=\"feline02\">Groomed Cat</option>";
        tablex += "<option value=\"canine01\">Medium Dogs</option>";
        tablex += "<option value=\"canine02\">Small Dogs</option>";
        tablex += "<option value=\"avian01\">Parrot</option>";
        tablex += "<option value=\"avian02\">Exotic</option>";
        tablex += "<option value=\"fish01\">Small Fish</option>";
        tablex += "<option value=\"fish02\">Large Fish</option>";
        tablex += "<option value=\"reptile01\">Slithering Reptiles</option>";
        tablex += "<option value=\"reptile02\">Crawling Reptiles</option>";
        tablex += "</select>";
        tablex += "</td></tr><tr><td><div class=\"bpui_carstorelist_div\">";
        tablex += "</div>";
        
        // add product previous and next
        tablex += "</td></tr>";
        tablex += "<tr><td colspan=\"3\" style=\"text-align:center;\">";
        tablex += "<span class=\"bpui_carstorelist_previous\" onclick=\"bpui.carstoreList.previousProducts();\"><< PREVIOUS</span>&nbsp;&nbsp;&nbsp;&nbsp;";
        tablex += "<span class=\"bpui_carstorelist_next\" onclick=\"bpui.carstoreList.nextProducts();\">NEXT >></span><br/>";
        tablex += "</td></tr>";
        tablex += "</table>";
        targetDiv.innerHTML=tablex;
        bpui.carstoreList.setSelectedCategory();
}

bpui.carstoreList.populateData=function(datax) {
    if(typeof datax != "undefined") {
        
        // get outerdiv
        var targetDiv=document.getElementById(bpui.carstoreList.divName);
        
        // containier div
        tablex="<table><tr><td align=\"center\">";
        tablex += "<b>Java BluePrint's Pet Store Category:</b> <select size=\"1\" id=\"bpui.carstoreList.categoryList\" onchange=\"bpui.carstoreList.selectCategory()\">";
        tablex += "<option value=\"feline01\">Hairy Cat</option>";
        tablex += "<option value=\"feline02\">Groomed Cat</option>";
        tablex += "<option value=\"canine01\">Medium Dogs</option>";
        tablex += "<option value=\"canine02\">Small Dogs</option>";
        tablex += "<option value=\"avian01\">Parrot</option>";
        tablex += "<option value=\"avian02\">Exotic</option>";
        tablex += "<option value=\"fish01\">Small Fish</option>";
        tablex += "<option value=\"fish02\">Large Fish</option>";
        tablex += "<option value=\"reptile01\">Slithering Reptiles</option>";
        tablex += "<option value=\"reptile02\">Crawling Reptiles</option>";
        tablex += "</select>";
        tablex += "</td></tr><tr><td><div class=\"bpui_carstorelist_div\">";
        
        tablex += "<table class=\"bpui_carstorelist_table\">";

        // loop through product results
        for(ii=0; ii < datax.length; ii++) {
            // add row
            tablex += "<tr class=\"bpui_carstorelist_row\"><td class=\"bpui_carstorelist_cell\">";
            tablex += "<a class=\"bpui_carstorelist_image\" target=\"bpcarstore\" href=\"http://localhost:8080/carstore/faces/catalog.jsp#" +
                datax[ii].productID + "," + datax[ii].itemID + "\">";
            
            tablex += "<img src=\"http://localhost:8080/carstore/ImageServlet/" + datax[ii].imageThumbURL + "\"/>";

            tablex += "</a>";
            tablex += "</td><td class=\"bpui_carstorelist_cell\">";
            tablex += "<a class=\"bpui_carstorelist_link\" target=\"bpcarstore\" href=\"http://localhost:8080/carstore/faces/catalog.jsp#" +
                datax[ii].productID + "," + datax[ii].itemID + "\">";
            tablex += "<span class=\"bpui_carstorelist_name\">" + datax[ii].name + "</span><br/>";
            tablex += "</a>";
            tablex += "<span class=\"bpui_carstorelist_description\">" + datax[ii].description + "</span>";
            tablex += "</td><td class=\"bpui_carstorelist_cell\">";
            
            // add product price
            tablex += "<span class=\"bpui_carstorelist_price\">\$" + datax[ii].price + "</span><br/>";
            tablex += "</td></tr>";
            tablex += "<tr><td colspan=\"3\"><hr class=\"bpui_carstorelist_hr\" /></td></tr>";
        }
                
        tablex += "</table></div>";
        
        // add product previous and next
        tablex += "</td></tr>";
        tablex += "<tr><td colspan=\"3\" style=\"text-align:center;\">";
        tablex += "<span class=\"bpui_carstorelist_previous\" onclick=\"bpui.carstoreList.previousProducts();\"><< PREVIOUS</span>&nbsp;&nbsp;&nbsp;&nbsp;";
        tablex += "<span class=\"bpui_carstorelist_next\" onclick=\"bpui.carstoreList.nextProducts();\">NEXT >></span><br/>";
        tablex += "</td></tr>";
        tablex += "</table>";
        targetDiv.innerHTML=tablex;
        bpui.carstoreList.setSelectedCategory();
    }
}

bpui.carstoreList.setSelectedCategory=function() {
    catx=document.getElementById("bpui.carstoreList.categoryList");
    for(ii=0; ii < catx.length; ii++) {
        if(catx.options[ii].value == bpui.carstoreList.category) {
            catx.options[ii].selected=true;
        }
    }
}
    
    
bpui.carstoreList.selectCategory=function() {
    catx=document.getElementById("bpui.carstoreList.categoryList");
    bpui.carstoreList.category=catx.value;
    
    bpui.carstoreList.currentCount=0;
    bpui.carstoreList.updateProducts();
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
    scriptx.setAttribute("src", "http://localhost:8080/carstore/catalog?command=items&pid=" + bpui.carstoreList.category + "&start=" + bpui.carstoreList.currentCount + "&length=5&format=jsonp");
    bodyTag.appendChild(scriptx);
}

bpui.carstoreList.createCarstoreList=function(divName) {
    // keep divName for later references
    bpui.carstoreList.divName=divName;

    // load data from service
    bodyTag=document.getElementsByTagName("body")[0];
    scriptx=document.createElement("script");
    scriptx.setAttribute("type", "text/javascript");
    scriptx.setAttribute("src", "http://localhost:8080/carstore/catalog?command=items&pid=" + bpui.carstoreList.category + "&start=0&length=5&format=jsonp");
    bodyTag.appendChild(scriptx);
    
}
