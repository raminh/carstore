<%-- Copyright 2006 Sun Microsystems, Inc. All rights reserved. You may not modify, use, reproduce, or distribute this software except in compliance with the terms of the License at: http://developer.sun.com/berkeley_license.html
$Id: banner.jsp,v 1.28 2006/12/19 20:23:53 yutayoshida Exp $ --%>

<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@taglib prefix="ui" uri="http://java.sun.com/blueprints/ui" %>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles.css"></link>
<script type="text/javascript" src="${pageContext.request.contextPath}/faces/static/META-INF/dojo/bpcatalog/dojo.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/faces/static/META-INF/rss/rssbar.js"></script>
<script type="text/javascript" src="swfobject.js"></script>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/faces/static/META-INF/rss/rssbar.css" />
<style type="text/css">

#rss-bar {
    margin: 0 auto 0px;
}

#rss-bar table td#rss-channel {
    background-repeat: no-repeat;
    background-position: top left;
    font-size: 14px;
    font-weight: bold;
    vertical-align: top;
    text-align: center;
    width: 254px;
}

#rss-bar table td#rss-item {
    background-repeat: no-repeat;
    font-size: 14px;
    width: 534px;
    text-align: left;
}

#rss-bar table a {
    color: white;
    text-decoration: none;
}
#rss-bar table a:hover { color: #ffff00;}

</style>
<script type="text/javascript">
    var rss = new bpui.RSS();
    dojo.addOnLoad(function(){rss.getRssInJson('${pageContext.request.contextPath}/faces/dynamic/bpui_rssfeedhandler/getRssfeed', 'http://www.bmw.tv/core-services/rs/rss/feed/get/4/US', '4', '4000', 'News From BMW', 'news.jsp');});
</script>

<table border="0" bordercolor="gray" cellpadding="0" cellspacing="0" bgcolor="white" width="100%">
 <tr id="injectionPoint">
  <td width="100%" valign="bottom"><a class="menuLink" href="${pageContext.request.contextPath}/faces/index.jsp""><span class="banner">Car Store</span></a></td>
  <td>
  </td>
  <td align="left" width="100%">
  <div id="FlashMenuLabs">
        You need to upgrade your Flash Player or to allow javascript to enable Website menu.</br>
        <a href="http://www.adobe.com/go/getflashplayer">Get Flash Player</a>            
    </div>
    <script type="text/javascript">
    // <![CDATA[
        var so = new SWFObject("menu.swf", "menu", "840", "140", "8", "#000000");
        
        so.addParam("wmode", "transparent");
        so.addParam("scale", "noscale");
        so.addParam("salign", "TL");    
        so.write("FlashMenuLabs");
    // ]]>
    </script>
   <!-- <a class="menuLink" onmouseover="this.className='menuLinkHover';" onmouseout="this.className='menuLink';" href="${pageContext.request.contextPath}/faces/fileupload.jsp">Seller</a> <span class="menuItem">|</span>
    <a class="menuLink" onmouseover="this.className='menuLinkHover';" onmouseout="this.className='menuLink';" href="${pageContext.request.contextPath}/faces/search.jsp">Search</a> <span class="menuItem">|</span>
    <a class="menuLink" onmouseover="this.className='menuLinkHover';" onmouseout="this.className='menuLink';" href="${pageContext.request.contextPath}/faces/catalog.jsp">Catalog</a> <span class="menuItem">|</span>
    <a class="menuLink" onmouseover="this.className='menuLinkHover';" onmouseout="this.className='menuLink';" href="${pageContext.request.contextPath}/faces/mapAll.jsp">Map</a> <span class="menuItem">|</span>
    <a class="menuLink" onmouseover="this.className='menuLinkHover';" onmouseout="this.className='menuLink';" href="${pageContext.request.contextPath}/faces/tag.jsp">Tags</a> <span class="menuItem">|</span>
    <a class="menuLink" onmouseover="this.className='menuLinkHover';" onmouseout="this.className='menuLink';" href="${pageContext.request.contextPath}/faces/index.jsp">Home</a>
-->  </td>
  </tr>
 </tr>
  <tr bgcolor="#6699CC">
  <td id="menubar" align="left" colspan="3" height="10" >
    <div id="rss-bar">
    <table border="0" cellpadding="0" cellspacing="0">
        <tr>
        <td id="rss-channel" nowrap="true"></td>
        <td id="rss-item" nowrap="true"></td>
        </tr>
    </table>
    </div>
  </td>
 </tr>
 </table>


