<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:variable name="divID" select="generate-id(/)" />
  <xsl:variable name="hymnsID" select="generate-id(/hymns/hymn)" />
  
  <xsl:template match="/"> <!-- Matches hymns -->
    <div id="{$divID}" class="box">
      <p class="lessMarginBottom">
        <span class="colorRed" data-trans="searchresults"></span>
        (<xsl:value-of select="count(/hymns/hymn)" />)
        <a class="imageButton closeImage rightAlign" href="javascript: app.removeSearchResult('{$divID}');"></a>
        <a data-trans="title=showresults" class="imageButton expandImage rightAlign" href="javascript: toggleVisibility('{$hymnsID}');" title=""></a>
      </p>
      
      <div id="{$hymnsID}">
        <ul class="hymnlist">
          <xsl:apply-templates select="hymns/hymn" />
        </ul>
      </div>
    </div>
  </xsl:template>
  
  <xsl:template match="hymn">
    <li>
      <a href="javascript:nop()" onclick="app.searchHymn('{number}')">
        <xsl:value-of select="number" />
        .
        <xsl:value-of select="title" />
      </a>
    </li>
  </xsl:template>  
</xsl:stylesheet>