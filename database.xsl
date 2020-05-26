<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
            <head>
                <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous" />
                <style>
                    table {
                        border: 2px solid black;
                        border-collapse: collapse;
                    }
                    td, th, tr {
                        border: 1px solid black;
                        text-align: center;
                    }
                    p {
                        color: #333333;
                        font-weight: bold;
                    }
                </style>
            </head>
            <body>
                <div class="container-fluid jumbotron jumbotron-fluid">
                    <div class="row justify-content-center">
                        <div class="text-center col-auto">
                           <div id="Name">
                              <p>MENU:</p>
                              <table class="table table-responsive table-hover table-striped">
                                 <thead class="thead-dark">
                                    <tr>
                                        <th>Name</th>
                                        <th>Sauces</th>
                                        <th>Ingredients</th>
                                        <th>Price</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                        <xsl:for-each select="pizzeria/pizza">
                                            <xsl:sort select="name" order="ascending"/>
                                            <tr>
                                                <xsl:choose>
                                                    <xsl:when test="@info='v'">
                                                        <td style="color: #333333;"><xsl:value-of select="name" />&#160;(vegetarian)</td>
                                                    </xsl:when>
                                                    <xsl:when test="@info='s'">
                                                        <td style="color: #333333;"><xsl:value-of select="name" />&#160;(spicy)</td>
                                                    </xsl:when>
                                                    <xsl:when test="@info='vs'">
                                                        <td style="color: #333333;"><xsl:value-of select="name" />&#160;(very spicy)</td>
                                                    </xsl:when>
                                                    <xsl:otherwise>
                                                        <td style="color: #333333;"><xsl:value-of select="name" /></td>
                                                    </xsl:otherwise>
                                                </xsl:choose>
                                                <td style="color: #333333;">
                                                    <xsl:for-each select="sauces/sauce">
                                                        -&#160;<xsl:value-of select="node()"/>
                                                        <br/>
                                                    </xsl:for-each>
                                                </td>
                                                <td style="color: #333333;">
                                                    <xsl:for-each select="ingredients/ingredient">
                                                        -&#160;<xsl:value-of select="node()"/>
                                                        <br/>
                                                    </xsl:for-each>
                                                </td>
                                                <td style="color: #333333;">
                                                    <xsl:for-each select="price">
                                                        Small:&#160;<xsl:value-of select="small"/>&#160;PLN
                                                        <br/>
                                                        Large:&#160;<xsl:value-of select="large"/>&#160;PLN
                                                        <br/>
                                                        Mega:&#160;<xsl:value-of select="mega"/>&#160;PLN
                                                        <br/>
                                                    </xsl:for-each>
                                                </td>
                                            </tr>
                                        </xsl:for-each>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>