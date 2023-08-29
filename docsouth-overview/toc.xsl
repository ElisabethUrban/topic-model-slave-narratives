<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.w3.org/1999/xhtml" exclude-result-prefixes="xs" version="2.0">

    <xsl:output method="xml" indent="yes" encoding="UTF-8"/>
    <xsl:variable name="texts" select="document('toc.xml')"/>

    <xsl:template match="/">
        <html>
            <head>
                <title>DocSouth: Overview</title>
                <meta charset="utf-8"/>
                <link rel="stylesheet" type="text/css" href="toc.css"/>
            </head>
            <body>
                <h1>American Slave Narratives</h1>
                <p>The following table contains the slave narratives compiled by<a
                        href="https://docsouth.unc.edu/neh/" target="_blank">Documenting the
                        American South</a></p>
                
                <p>While DocSouth's corpus encompasses 294 texts, the
                    overview shown here consists of 278 text since the texts that have been
                    categorised as fictional have been removed.</p>
                
                <p>They are listed in chronological
                    order.</p>
                
                <div class="table">
                    <table>
                        <tr class="header">
                            <th>Filename</th>
                            <th>Author</th>
                            <th>Title</th>
                            <th>Date</th>
                        </tr>
                        <xsl:for-each select="//row">
                            <xsl:sort select="number(date)" order="ascending"/>
                            <tr>
                                <td>
                                    <xsl:value-of select="filename"/>
                                </td>
                                <td>
                                    <xsl:value-of select="author"/>
                                </td>
                                <td>
                                    <xsl:value-of select="title"/>
                                </td>
                                <td>
                                    <xsl:value-of select="date"/>
                                </td>
                            </tr>
                        </xsl:for-each>
                    </table>
                </div>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
