/* Copyright 2006 Sun Microsystems, Inc. All rights reserved. You may not modify, use, reproduce, or distribute this software except in compliance with the terms of the License at: http://developer.sun.com/berkeley_license.html
$Id: CarstoreConstants.java,v 1.4 2006/05/03 21:49:00 inder Exp $ */

package com.sun.javaee.blueprints.carstore.util;

public class CarstoreConstants {
    
    public static final String CARSTORE_INDEX_DIRECTORY=System.getProperty("com.sun.aas.instanceRoot") +
                                                            "/lib/carstore/searchindex";
    public static final String CARSTORE_IMAGE_DIRECTORY=System.getProperty("com.sun.aas.instanceRoot") +
                                                            "/lib/carstore";
    public static final String CARSTORE_BASE_LOGGER="com.sun.javaee.blueprints.carstore";
    public static final String CARSTORE_BASE_LOG_STRINGS="com.sun.javaee.blueprints.carstore.util.LogStrings";
    
    /** private constructor to enforce only constants class */
    private CarstoreConstants() {}
    
}
