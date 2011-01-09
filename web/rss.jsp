<%-- Copyright 2006 Sun Microsystems, Inc. All rights reserved. You may not modify, use, reproduce, or distribute this software except in compliance with the terms of the License at: http://developer.sun.com/berkeley_license.html
$Id: rss.jsp,v 1.2 2006/05/03 22:00:34 inder Exp $ --%>

<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@taglib prefix="ui" uri="http://java.sun.com/blueprints/ui" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>RSS</title>
    </head>
    <body>

    <h1>RSS test</h1>
    <f:view>
    <ui:rssreader>
        <ui:rsscategory title="Car Store">
            <ui:rssfeed title="BMW" url="http://www.bmw.tv/core-services/rs/rss/feed/get/4/US"></ui:rssfeed>
            <ui:rssfeed title="BMW0" url="http://www.bmw.tv/core-services/rs/rss/feed/get/4/US"></ui:rssfeed>
        </ui:rsscategory>
        <ui:rsscategory title="BMW1">
            <ui:rssfeed title="BMW2" url="http://www.bmw.tv/core-services/rs/rss/feed/get/4/US"></ui:rssfeed>
            <ui:rssfeed title="BMW3" url="http://www.bmw.tv/core-services/rs/rss/feed/get/4/US"></ui:rssfeed>
        </ui:rsscategory>
    </ui:rssreader>
            
    </f:view>
    </body>
</html>
