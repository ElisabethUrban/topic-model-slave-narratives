<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.w3.org/1999/xhtml" exclude-result-prefixes="xs" version="2.0">
    
    <xsl:output method="html" indent="yes" encoding="UTF-8"/>
    
    <xsl:template match="/">
        <html>
            <head>
                <title>Publication Dates</title>
                <meta charset="utf-8"/>
                <script src="https://www.gstatic.com/charts/loader.js"/>
                <script>
                    google.charts.load('current', {packages: ['corechart']});
                    google.charts.setOnLoadCallback(drawChart);
                    
                    function drawChart() {
                    var data = new google.visualization.DataTable();
                    data.addColumn('number', 'Year');
                    data.addColumn('number', 'Texts Published');
                    
                    <xsl:for-each-group select="//row" group-by="substring(date, 1, 4)">
                        <xsl:sort select="current-grouping-key()" order="ascending"/>
                        <xsl:variable name="year" select="current-grouping-key()"/>
                        <xsl:variable name="count" select="count(current-group())"/>
                        data.addRow([<xsl:value-of select="$year"/>, <xsl:value-of select="$count"/>]);
                    </xsl:for-each-group>
                    
                    var options = {
                    title: 'DocSouth: Texts Published per Year',
                    width: '100%',
                    height: '100%',
                    chartArea: {width: '80%', height: '80%', left: '10%', top: '10%'},
                    hAxis: {title: 'Year', format: '####'},
                    vAxis: {title: 'Number of Texts Published'},
                    legend: {position: 'none'}
                    };
                    
                    var chart = new google.visualization.ColumnChart(document.getElementById('chart'));
                    chart.draw(data, options);
                    }
                </script>
                <style>
                    html, body {
                    width: 100%;
                    height: 100%;
                    margin: 0;
                    padding: 0;
                    }
                    
                    #chart {
                    width: 70%;
                    height: 70%;
                    }
                </style>
            </head>
            <body>
                <div id="chart"></div>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>