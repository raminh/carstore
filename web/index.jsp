<%-- Copyright 2006 Sun Microsystems, Inc. All rights reserved. You may not modify, use, reproduce, or distribute this software except in compliance with the terms of the License at: http://developer.sun.com/berkeley_license.html
$Id: index.jsp,v 1.20 2007/03/16 20:18:59 basler Exp $ --%>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@page import="java.util.*, com.sun.javaee.blueprints.petstore.model.CatalogFacade, com.sun.javaee.blueprints.petstore.model.Tag"%>

<%
try {
    CatalogFacade cf = (CatalogFacade)config.getServletContext().getAttribute("CatalogFacade");
    List<Tag> tags=cf.getTagsInChunk(0, 12);
    // since top 20 come from database or desending refCount order, need to reorder by tag name
    Collections.sort(tags, new Comparator() {
        public int compare(Object one, Object two) {
             int cc=((Tag)two).getTag().compareTo(((Tag)one).getTag());
             return (cc < 0 ? 1 : cc > 0 ? -1 : 0);
        }
    });    
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html;charset=utf-8" >
        <title>Car Store</title>
        <link type="text/css" rel="stylesheet" href="./tag.css"/>
    </head>
    <body>
        
        <jsp:include page="banner.jsp" />
        <script>
            dojo.require("dojo.widget.FisheyeList");
            function browse(category) {
                window.location.href="${pageContext.request.contextPath}/faces/catalog.jsp?catid=" + category;
            }
        </script>
            <table bgcolor="white">
                <tr align="center">
                    <td valign="top">
                        <div class="outerbar" style="width: 200px">
                            
                            <div dojoType="FisheyeList"
                                 itemWidth="170" itemHeight="50"
                                 itemMaxWidth="340" itemMaxHeight="70"
                                 orientation="vertical"
                                 effectUnits="2"
                                 itemPadding="10"
                                 attachEdge="top"
                                 labelEdge="bottom"
                                 enableCrappySvgSupport="false">
                                
                                <div dojoType="FisheyeListItem" onClick="browse('TOYOTA CARS');"
                                     iconsrc="${pageContext.request.contextPath}/images/dogs_icon.gif">
                                </div>
                                
                                <div dojoType="FisheyeListItem" onClick="browse('FORD CARS');"
                                     iconsrc="${pageContext.request.contextPath}/images/cats_icon.gif">
                                </div>
                                
                                <div dojoType="FisheyeListItem" onClick="browse('AUDI/BMW CARS');"
                                     iconsrc="${pageContext.request.contextPath}/images/birds_icon.gif">
                                </div>
                                
                                <div dojoType="FisheyeListItem" onClick="browse('MERCEDES-BENZ');"
                                     iconsrc="${pageContext.request.contextPath}/images/fish_icon.gif">
                                </div>
                                
                                <div dojoType="FisheyeListItem" onClick="browse('JEEP CARS');"
                                     iconsrc="${pageContext.request.contextPath}/images/reptiles_icon.gif">
                                </div>
                            </div>
                            
                        </div>
                    </td>
                    
                    <td style="vertical-align:middle;">
                        <div>
                            <table>
                                <tr>
                                   
                                                        <div id="CarouselDiv">
			<a href="http://www.adobe.com/go/getflashplayer">
				<img src="http://www.adobe.com/images/shared/download_buttons/get_flash_player.gif" alt="Get Adobe Flash player" />
			</a>
		</div>
                                </tr>
                                <tr>
<script type="text/javascript" src="swfobject1.js"></script>
		<script type="text/javascript">
			var flashvars = {};
			var params = {};
			params.scale = "noscale";
			params.salign = "tl";
			params.wmode = "transparent";
			var attributes = {};
			swfobject.embedSWF("carousel.swf", "CarouselDiv", "900", "360", "9.0.0", false, flashvars, params, attributes);
		</script>
                                </tr>
                            </table>
                        </div>
                    </td>
                    <td style="vertical-align:top; width:100px; text-align:right;">
                       
                    </td>
                </tr>
            </table>
        
        <div style="position: absolute; visibility: hidden;z-index:5" id="menu-popup">
            <table id="completeTable" class="popupTable" ></table>
        </div>
        
        <br/><br/>
        <jsp:include page="footer.jsp" />
        

    </body>
</html>
<%
    } catch(Exception e) {
        e.printStackTrace();
    }
%>
