<?xml version="1.0" encoding="ISO-8859-1"?>
<!-- 
Title: VRA Template
Author: Jeff Mixter <http://www.linkedin.com/profile/view?id=183522525&trk=tab_pro>
Also see: 
Description: This stylesheet can be used to convert VRA 4.0 XML formated records into RDF/XML.
			 The records must confrom the the VRA 4.0 Restricted Schema in order to work with the stylesheet
Attribution-NonCommercial-ShareAlike 3.0 United States (cc) 2008-2010 <http://creativecommons.org/licenses/by-nc-sa/3.0/>
 -->
<xsl:stylesheet version="1.0"
xmlns:schema="http://schema.org/"
xmlns:foaf="http://xmlns.com/foaf/0.1/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#"
xmlns:vra-p="http://purl.org/vra/"
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:library="http://purl.org/library/"
xmlns:void="http://rdfs.org/ns/void#"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:vc="http://www.vraweb.org/vracore4.htm"
exclude-result-prefixes="vc xsl">
  
<xsl:output
	method="xml"
	media-type="application/xml" 
	indent="yes"/>

	<xsl:template match="/vc:vra">
		<rdf:RDF>
			<xsl:apply-templates />
		</rdf:RDF>
	</xsl:template>
	
	<xsl:template match="vc:collection">
		<rdf:Description rdf:about="#{@refid}">
			<rdf:type rdf:resource="http://rdfs.org/ns/void#DataSet" />
			<rdfs:label>
				<xsl:value-of select="@source"/>
			</rdfs:label>
			<xsl:apply-templates select="*[not(name()='measurementsSet')]" />
		</rdf:Description>
	</xsl:template>
	<xsl:template match="vc:work">
		<rdf:Description rdf:about="#{@refid}">
		<rdf:type rdf:resource="http://schema.org/CreativeWork"/>
			<xsl:apply-templates select="vc:worktypeSet" mode="workType"/>
			<xsl:apply-templates />
			<xsl:if test="vc:relationSet/vc:relation/@type = 'imageOf'">
				<vra-p:imageOf>
					<rdf:Description rdf:about="#{translate(vc:relationSet/vc:relation/@relids, 'w_', '')}">
						<rdf:type rdf:resource="http://schema.org/CreativeWork" />
					</rdf:Description>
				</vra-p:imageOf>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'imageIs'">
				<vra-p:hasImage>
					<rdf:Description rdf:about="#{translate(vc:relationSet/vc:relation/@relids, 'w_', '')}">
						<rdf:type rdf:resource="http://schema.org/CreativeWork" />
					</rdf:Description>
				</vra-p:hasImage>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'cartoonFor'">
				<vra-p:cartoonFor>
					<rdf:Description rdf:about="#{translate(vc:relationSet/vc:relation/@relids, 'w_', '')}">
						<rdf:type rdf:resource="http://schema.org/CreativeWork" />
					</rdf:Description>
				</vra-p:cartoonFor>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'cartoonIs'">
				<vra-p:hasCartoon>
					<rdf:Description rdf:about="#{translate(vc:relationSet/vc:relation/@relids, 'w_', '')}">
						<rdf:type rdf:resource="http://schema.org/CreativeWork" />
					</rdf:Description>
				</vra-p:hasCartoon>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'componentOf'">
				<vra-p:componentOf>
					<rdf:Description rdf:about="#{translate(vc:relationSet/vc:relation/@relids, 'w_', '')}">
						<rdf:type rdf:resource="http://schema.org/CreativeWork" />
					</rdf:Description>
				</vra-p:componentOf>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'componentIs'">
				<vra-p:hasComponent>
					<rdf:Description rdf:about="#{translate(vc:relationSet/vc:relation/@relids, 'w_', '')}">
						<rdf:type rdf:resource="http://schema.org/CreativeWork" />
					</rdf:Description>
				</vra-p:hasComponent>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'copyAfter'">
				<vra-p:copyOf>
					<rdf:Description rdf:about="#{translate(vc:relationSet/vc:relation/@relids, 'w_', '')}">
						<rdf:type rdf:resource="http://schema.org/CreativeWork" />
					</rdf:Description>
				</vra-p:copyOf>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'copyIs'">
				<vra-p:hasCopy>
					<rdf:Description rdf:about="#{translate(vc:relationSet/vc:relation/@relids, 'w_', '')}">
						<rdf:type rdf:resource="http://schema.org/CreativeWork" />
					</rdf:Description>
				</vra-p:hasCopy>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'counterProofFor'">
				<vra-p:counterProofFor>
					<rdf:Description rdf:about="#{translate(vc:relationSet/vc:relation/@relids, 'w_', '')}">
						<rdf:type rdf:resource="http://schema.org/CreativeWork" />
					</rdf:Description>
				</vra-p:counterProofFor>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'counterProofIs'">
				<vra-p:hasCounterProof>
					<rdf:Description rdf:about="#{translate(vc:relationSet/vc:relation/@relids, 'w_', '')}">
						<rdf:type rdf:resource="http://schema.org/CreativeWork" />
					</rdf:Description>
				</vra-p:hasCounterProof>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'depicts'">
				<vra-p:depicts>
					<rdf:Description rdf:about="#{translate(vc:relationSet/vc:relation/@relids, 'w_', '')}">
						<rdf:type rdf:resource="http://schema.org/CreativeWork" />
					</rdf:Description>
				</vra-p:depicts>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'depictedIn'">
				<vra-p:depictedIn>
					<rdf:Description rdf:about="#{translate(vc:relationSet/vc:relation/@relids, 'w_', '')}">
						<rdf:type rdf:resource="http://schema.org/CreativeWork" />
					</rdf:Description>
				</vra-p:depictedIn>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'derivedFrom'">
				<vra-p:derivedFrom>
					<rdf:Description rdf:about="#{translate(vc:relationSet/vc:relation/@relids, 'w_', '')}">
						<rdf:type rdf:resource="http://schema.org/CreativeWork" />
					</rdf:Description>
				</vra-p:derivedFrom>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'sourceFor'">
				<vra-p:sourceFor>
					<rdf:Description rdf:about="#{translate(vc:relationSet/vc:relation/@relids, 'w_', '')}">
						<rdf:type rdf:resource="http://schema.org/CreativeWork" />
					</rdf:Description>
				</vra-p:sourceFor>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'designedFor'">
				<vra-p:designedFor>
					<rdf:Description rdf:about="#{translate(vc:relationSet/vc:relation/@relids, 'w_', '')}">
						<rdf:type rdf:resource="http://schema.org/CreativeWork" />
					</rdf:Description>
				</vra-p:designedFor>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'contextIs'">
				<vra-p:hasContext>
					<rdf:Description rdf:about="#{translate(vc:relationSet/vc:relation/@relids, 'w_', '')}">
						<rdf:type rdf:resource="http://schema.org/CreativeWork" />
					</rdf:Description>
				</vra-p:hasContext>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'exhibitedAt'">
				<vra-p:exhibitedAt>
					<rdf:Description rdf:about="#{translate(vc:relationSet/vc:relation/@relids, 'w_', '')}">
						<rdf:type rdf:resource="http://schema.org/CreativeWork" />
					</rdf:Description>
				</vra-p:exhibitedAt>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'venueFor'">
				<vra-p:venueFor>
					<rdf:Description rdf:about="#{translate(vc:relationSet/vc:relation/@relids, 'w_', '')}">
						<rdf:type rdf:resource="http://schema.org/CreativeWork" />
					</rdf:Description>
				</vra-p:venueFor>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'facsimileOf'">
				<vra-p:facsimileOf>
					<rdf:Description rdf:about="#{translate(vc:relationSet/vc:relation/@relids, 'w_', '')}">
						<rdf:type rdf:resource="http://schema.org/CreativeWork" />
					</rdf:Description>
				</vra-p:facsimileOf>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'facsimileIs'">
				<vra-p:hasFacsimile>
					<rdf:Description rdf:about="#{translate(vc:relationSet/vc:relation/@relids, 'w_', '')}">
						<rdf:type rdf:resource="http://schema.org/CreativeWork" />
					</rdf:Description>
				</vra-p:hasFacsimile>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'formerlyPartOf'">
				<vra-p:formerlyPartOf>
					<rdf:Description rdf:about="#{translate(vc:relationSet/vc:relation/@relids, 'w_', '')}">
						<rdf:type rdf:resource="http://schema.org/CreativeWork" />
					</rdf:Description>
				</vra-p:formerlyPartOf>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'formerlyLargerContextFor'">
				<vra-p:formerlyLargerContextFor>
					<rdf:Description rdf:about="#{translate(vc:relationSet/vc:relation/@relids, 'w_', '')}">
						<rdf:type rdf:resource="http://schema.org/CreativeWork" />
					</rdf:Description>
				</vra-p:formerlyLargerContextFor>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'mateOf'">
				<vra-p:imageOf>
					<rdf:Description rdf:about="#{translate(vc:relationSet/vc:relation/@relids, 'w_', '')}">
						<rdf:type rdf:resource="http://schema.org/CreativeWork" />
					</rdf:Description>
				</vra-p:imageOf>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'modelFor'">
				<vra-p:imageOf>
					<rdf:Description rdf:about="#{translate(vc:relationSet/vc:relation/@relids, 'w_', '')}">
						<rdf:type rdf:resource="http://schema.org/CreativeWork" />
					</rdf:Description>
				</vra-p:imageOf>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'modelIs'">
				<vra-p:hasModel>
					<rdf:Description rdf:about="#{translate(vc:relationSet/vc:relation/@relids, 'w_', '')}">
						<rdf:type rdf:resource="http://schema.org/CreativeWork" />
					</rdf:Description>
				</vra-p:hasModel>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'largerContextFor'">
				<vra-p:largerContextFor>
					<rdf:Description rdf:about="#{translate(vc:relationSet/vc:relation/@relids, 'w_', '')}">
						<rdf:type rdf:resource="http://schema.org/CreativeWork" />
					</rdf:Description>
				</vra-p:largerContextFor>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'partOf'">
				<vra-p:partOf>
					<rdf:Description rdf:about="#{translate(vc:relationSet/vc:relation/@relids, 'w_', '')}">
						<rdf:type rdf:resource="http://schema.org/CreativeWork" />
					</rdf:Description>
				</vra-p:partOf>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'partnerInSetWith'">
				<vra-p:partnerInSetWith>
					<rdf:Description rdf:about="#{translate(vc:relationSet/vc:relation/@relids, 'w_', '')}">
						<rdf:type rdf:resource="http://schema.org/CreativeWork" />
					</rdf:Description>
				</vra-p:partnerInSetWith>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'pendantOf'">
				<vra-p:pendantOf>
					<rdf:Description rdf:about="#{translate(vc:relationSet/vc:relation/@relids, 'w_', '')}">
						<rdf:type rdf:resource="http://schema.org/CreativeWork" />
					</rdf:Description>
				</vra-p:pendantOf>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'planFor'">
				<vra-p:planFor>
					<rdf:Description rdf:about="#{translate(vc:relationSet/vc:relation/@relids, 'w_', '')}">
						<rdf:type rdf:resource="http://schema.org/CreativeWork" />
					</rdf:Description>
				</vra-p:planFor>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'planIs'">
				<vra-p:hasPlan>
					<rdf:Description rdf:about="#{translate(vc:relationSet/vc:relation/@relids, 'w_', '')}">
						<rdf:type rdf:resource="http://schema.org/CreativeWork" />
					</rdf:Description>
				</vra-p:hasPlan>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'prepatoryFor'">
				<vra-p:prepatoryFor>
					<rdf:Description rdf:about="#{translate(vc:relationSet/vc:relation/@relids, 'w_', '')}">
						<rdf:type rdf:resource="http://schema.org/CreativeWork" />
					</rdf:Description>
				</vra-p:prepatoryFor>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'basedOn'">
				<vra-p:basedOn>
					<rdf:Description rdf:about="#{translate(vc:relationSet/vc:relation/@relids, 'w_', '')}">
						<rdf:type rdf:resource="http://schema.org/CreativeWork" />
					</rdf:Description>
				</vra-p:basedOn>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'printingPlateFor'">
				<vra-p:printingPlateFor>
					<rdf:Description rdf:about="#{translate(vc:relationSet/vc:relation/@relids, 'w_', '')}">
						<rdf:type rdf:resource="http://schema.org/CreativeWork" />
					</rdf:Description>
				</vra-p:printingPlateFor>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'printingPlateIs'">
				<vra-p:hasPrintingPlate>
					<rdf:Description rdf:about="#{translate(vc:relationSet/vc:relation/@relids, 'w_', '')}">
						<rdf:type rdf:resource="http://schema.org/CreativeWork" />
					</rdf:Description>
				</vra-p:hasPrintingPlate>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'prototypeFor'">
				<vra-p:prototypeFor>
					<rdf:Description rdf:about="#{translate(vc:relationSet/vc:relation/@relids, 'w_', '')}">
						<rdf:type rdf:resource="http://schema.org/CreativeWork" />
					</rdf:Description>
				</vra-p:prototypeFor>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'prototypeIs'">
				<vra-p:hasPrototype>
					<rdf:Description rdf:about="#{translate(vc:relationSet/vc:relation/@relids, 'w_', '')}">
						<rdf:type rdf:resource="http://schema.org/CreativeWork" />
					</rdf:Description>
				</vra-p:hasPrototype>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'relatedTo'">
				<schema:isRelatedTo>
					<rdf:Description rdf:about="#{translate(vc:relationSet/vc:relation/@relids, 'w_', '')}">
						<rdf:type rdf:resource="http://schema.org/CreativeWork" />
					</rdf:Description>
				</schema:isRelatedTo>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'reliefFor'">
				<vra-p:reliefFor>
					<rdf:Description rdf:about="#{translate(vc:relationSet/vc:relation/@relids, 'w_', '')}">
						<rdf:type rdf:resource="http://schema.org/CreativeWork" />
					</rdf:Description>
				</vra-p:reliefFor>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'impressionIs'">
				<vra-p:hasImpression>
					<rdf:Description rdf:about="#{translate(vc:relationSet/vc:relation/@relids, 'w_', '')}">
						<rdf:type rdf:resource="http://schema.org/CreativeWork" />
					</rdf:Description>
				</vra-p:hasImpression>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'replicaOf'">
				<vra-p:replicaOf>
					<rdf:Description rdf:about="#{translate(vc:relationSet/vc:relation/@relids, 'w_', '')}">
						<rdf:type rdf:resource="http://schema.org/CreativeWork" />
					</rdf:Description>
				</vra-p:replicaOf>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'replicaIs'">
				<vra-p:hasReplica>
					<rdf:Description rdf:about="#{translate(vc:relationSet/vc:relation/@relids, 'w_', '')}">
						<rdf:type rdf:resource="http://schema.org/CreativeWork" />
					</rdf:Description>
				</vra-p:hasReplica>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'studyFor'">
				<vra-p:studyFor>
					<rdf:Description rdf:about="#{translate(vc:relationSet/vc:relation/@relids, 'w_', '')}">
						<rdf:type rdf:resource="http://schema.org/CreativeWork" />
					</rdf:Description>
				</vra-p:studyFor>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'studyIs'">
				<vra-p:hasStudy>
					<rdf:Description rdf:about="#{translate(vc:relationSet/vc:relation/@relids, 'w_', '')}">
						<rdf:type rdf:resource="http://schema.org/CreativeWork" />
					</rdf:Description>
				</vra-p:hasStudy>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'versionOf'">
				<vra-p:versionOf>
					<rdf:Description rdf:about="#{translate(vc:relationSet/vc:relation/@relids, 'w_', '')}">
						<rdf:type rdf:resource="http://schema.org/CreativeWork" />
					</rdf:Description>
				</vra-p:versionOf>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'versionIs'">
				<vra-p:hasVersion>
					<rdf:Description rdf:about="#{translate(vc:relationSet/vc:relation/@relids, 'w_', '')}">
						<rdf:type rdf:resource="http://schema.org/CreativeWork" />
					</rdf:Description>
				</vra-p:hasVersion>
			</xsl:if>
		</rdf:Description>
	</xsl:template>
	<xsl:template match="vc:image">
		<rdf:Description rdf:about="#{@refid}">
		<rdf:type rdf:resource="http://schema.org/ImageObject" />
			<xsl:apply-templates select="vc:worktypeSet" mode="workType"/>
			<xsl:apply-templates />
			<xsl:if test="vc:relationSet/vc:relation/@type = 'imageOf'">
				<vra-p:imageOf>
					<rdf:Description rdf:about="#{vc:relationSet/vc:relation/@refid}">
						<rdf:type rdf:resource="http://schema.org/CreativeWork" />
					</rdf:Description>
				</vra-p:imageOf>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'imageIs'">
				<vra-p:hasImage>
					<rdf:Description rdf:about="#{vc:relationSet/vc:relation/@refid}">
						<rdf:type rdf:resource="http://schema.org/CreativeWork" />
					</rdf:Description>
				</vra-p:hasImage>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'cartoonFor'">
				<vra-p:cartoonFor>
					<rdf:Description rdf:about="#{vc:relationSet/vc:relation/@refid}">
						<rdf:type rdf:resource="http://schema.org/CreativeWork" />
					</rdf:Description>
				</vra-p:cartoonFor>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'cartoonIs'">
				<vra-p:hasCartoon>
					<rdf:Description rdf:about="#vc:relationSet/vc:relation/{@refid}">
						<rdf:type rdf:resource="http://schema.org/CreativeWork" />
					</rdf:Description>
				</vra-p:hasCartoon>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'componentOf'">
				<vra-p:componentOf>
					<rdf:Description rdf:about="#{vc:relationSet/vc:relation/@refid}">
						<rdf:type rdf:resource="http://schema.org/CreativeWork" />
					</rdf:Description>
				</vra-p:componentOf>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'componentIs'">
				<vra-p:hasComponent>
					<rdf:Description rdf:about="#{vc:relationSet/vc:relation/@refid}">
						<rdf:type rdf:resource="http://schema.org/CreativeWork" />
					</rdf:Description>
				</vra-p:hasComponent>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'copyAfter'">
				<vra-p:copyOf>
					<rdf:Description rdf:about="#{vc:relationSet/vc:relation/@refid}">
						<rdf:type rdf:resource="http://schema.org/CreativeWork" />
					</rdf:Description>
				</vra-p:copyOf>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'copyIs'">
				<vra-p:hasCopy>
					<rdf:Description rdf:about="#{vc:relationSet/vc:relation/@refid}">
						<rdf:type rdf:resource="http://schema.org/CreativeWork" />
					</rdf:Description>
				</vra-p:hasCopy>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'counterProofFor'">
				<vra-p:counterProofFor>
					<rdf:Description rdf:about="#{vc:relationSet/vc:relation/@refid}">
						<rdf:type rdf:resource="http://schema.org/CreativeWork" />
					</rdf:Description>
				</vra-p:counterProofFor>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'counterProofIs'">
				<vra-p:hasCounterProof>
					<rdf:Description rdf:about="#{vc:relationSet/vc:relation/@refid}">
						<rdf:type rdf:resource="http://schema.org/CreativeWork" />
					</rdf:Description>
				</vra-p:hasCounterProof>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'depicts'">
				<vra-p:depicts>
					<rdf:Description rdf:about="#{vc:relationSet/vc:relation/@refid}">
						<rdf:type rdf:resource="http://schema.org/CreativeWork" />
					</rdf:Description>
				</vra-p:depicts>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'depictedIn'">
				<vra-p:depictedIn>
					<rdf:Description rdf:about="#{vc:relationSet/vc:relation/@refid}">
						<rdf:type rdf:resource="http://schema.org/CreativeWork" />
					</rdf:Description>
				</vra-p:depictedIn>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'derivedFrom'">
				<vra-p:derivedFrom>
					<rdf:Description rdf:about="#{vc:relationSet/vc:relation/@refid}">
						<rdf:type rdf:resource="http://schema.org/CreativeWork" />
					</rdf:Description>
				</vra-p:derivedFrom>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'sourceFor'">
				<vra-p:sourceFor>
					<rdf:Description rdf:about="#{vc:relationSet/vc:relation/@refid}">
						<rdf:type rdf:resource="http://schema.org/CreativeWork" />
					</rdf:Description>
				</vra-p:sourceFor>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'designedFor'">
				<vra-p:designedFor>
					<rdf:Description rdf:about="#{vc:relationSet/vc:relation/@refid}">
						<rdf:type rdf:resource="http://schema.org/CreativeWork" />
					</rdf:Description>
				</vra-p:designedFor>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'contextIs'">
				<vra-p:hasContext>
					<rdf:Description rdf:about="#{vc:relationSet/vc:relation/@refid}">
						<rdf:type rdf:resource="http://schema.org/CreativeWork" />
					</rdf:Description>
				</vra-p:hasContext>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'exhibitedAt'">
				<vra-p:exhibitedAt>
					<rdf:Description rdf:about="#{vc:relationSet/vc:relation/@refid}">
						<rdf:type rdf:resource="http://schema.org/CreativeWork" />
					</rdf:Description>
				</vra-p:exhibitedAt>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'venueFor'">
				<vra-p:venueFor>
					<rdf:Description rdf:about="#{vc:relationSet/vc:relation/@refid}">
						<rdf:type rdf:resource="http://schema.org/CreativeWork" />
					</rdf:Description>
				</vra-p:venueFor>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'facsimileOf'">
				<vra-p:facsimileOf>
					<rdf:Description rdf:about="#{vc:relationSet/vc:relation/@refid}">
						<rdf:type rdf:resource="http://schema.org/CreativeWork" />
					</rdf:Description>
				</vra-p:facsimileOf>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'facsimileIs'">
				<vra-p:hasFacsimile>
					<rdf:Description rdf:about="#{vc:relationSet/vc:relation/@refid}">
						<rdf:type rdf:resource="http://schema.org/CreativeWork" />
					</rdf:Description>
				</vra-p:hasFacsimile>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'formerlyPartOf'">
				<vra-p:formerlyPartOf>
					<rdf:Description rdf:about="#{vc:relationSet/vc:relation/@refid}">
						<rdf:type rdf:resource="http://schema.org/CreativeWork" />
					</rdf:Description>
				</vra-p:formerlyPartOf>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'formerlyLargerContextFor'">
				<vra-p:formerlyLargerContextFor>
					<rdf:Description rdf:about="#{vc:relationSet/vc:relation/@refid}">
						<rdf:type rdf:resource="http://schema.org/CreativeWork" />
					</rdf:Description>
				</vra-p:formerlyLargerContextFor>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'mateOf'">
				<vra-p:imageOf>
					<rdf:Description rdf:about="#{vc:relationSet/vc:relation/@refid}">
						<rdf:type rdf:resource="http://schema.org/CreativeWork" />
					</rdf:Description>
				</vra-p:imageOf>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'modelFor'">
				<vra-p:imageOf>
					<rdf:Description rdf:about="#{vc:relationSet/vc:relation/@refid}">
						<rdf:type rdf:resource="http://schema.org/CreativeWork" />
					</rdf:Description>
				</vra-p:imageOf>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'modelIs'">
				<vra-p:hasModel>
					<rdf:Description rdf:about="#{vc:relationSet/vc:relation/@refid}">
						<rdf:type rdf:resource="http://schema.org/CreativeWork" />
					</rdf:Description>
				</vra-p:hasModel>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'largerContextFor'">
				<vra-p:largerContextFor>
					<rdf:Description rdf:about="#{vc:relationSet/vc:relation/@refid}">
						<rdf:type rdf:resource="http://schema.org/CreativeWork" />
					</rdf:Description>
				</vra-p:largerContextFor>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'partOf'">
				<vra-p:partOf>
					<rdf:Description rdf:about="#{vc:relationSet/vc:relation/@relids}">
						<rdf:type rdf:resource="http://schema.org/CreativeWork" />
					</rdf:Description>
				</vra-p:partOf>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'partnerInSetWith'">
				<vra-p:partnerInSetWith>
					<rdf:Description rdf:about="#{vc:relationSet/vc:relation/@refid}">
						<rdf:type rdf:resource="http://schema.org/CreativeWork" />
					</rdf:Description>
				</vra-p:partnerInSetWith>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'pendantOf'">
				<vra-p:pendantOf>
					<rdf:Description rdf:about="#{vc:relationSet/vc:relation/@refid}">
						<rdf:type rdf:resource="http://schema.org/CreativeWork" />
					</rdf:Description>
				</vra-p:pendantOf>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'planFor'">
				<vra-p:planFor>
					<rdf:Description rdf:about="#{vc:relationSet/vc:relation/@refid}">
						<rdf:type rdf:resource="http://schema.org/CreativeWork" />
					</rdf:Description>
				</vra-p:planFor>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'planIs'">
				<vra-p:hasPlan>
					<rdf:Description rdf:about="#{vc:relationSet/vc:relation/@refid}">
						<rdf:type rdf:resource="http://schema.org/CreativeWork" />
					</rdf:Description>
				</vra-p:hasPlan>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'prepatoryFor'">
				<vra-p:prepatoryFor>
					<rdf:Description rdf:about="#{vc:relationSet/vc:relation/@refid}">
						<rdf:type rdf:resource="http://schema.org/CreativeWork" />
					</rdf:Description>
				</vra-p:prepatoryFor>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'basedOn'">
				<vra-p:basedOn>
					<rdf:Description rdf:about="#{vc:relationSet/vc:relation/@refid}">
						<rdf:type rdf:resource="http://schema.org/CreativeWork" />
					</rdf:Description>
				</vra-p:basedOn>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'printingPlateFor'">
				<vra-p:printingPlateFor>
					<rdf:Description rdf:about="#{vc:relationSet/vc:relation/@refid}">
						<rdf:type rdf:resource="http://schema.org/CreativeWork" />
					</rdf:Description>
				</vra-p:printingPlateFor>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'printingPlateIs'">
				<vra-p:hasPrintingPlate>
					<rdf:Description rdf:about="#{vc:relationSet/vc:relation/@refid}">
						<rdf:type rdf:resource="http://schema.org/CreativeWork" />
					</rdf:Description>
				</vra-p:hasPrintingPlate>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'prototypeFor'">
				<vra-p:prototypeFor>
					<rdf:Description rdf:about="#{vc:relationSet/vc:relation/@refid}">
						<rdf:type rdf:resource="http://schema.org/CreativeWork" />
					</rdf:Description>
				</vra-p:prototypeFor>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'prototypeIs'">
				<vra-p:hasPrototype>
					<rdf:Description rdf:about="#{vc:relationSet/vc:relation/@refid}">
						<rdf:type rdf:resource="http://schema.org/CreativeWork" />
					</rdf:Description>
				</vra-p:hasPrototype>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'relatedTo'">
				<schema:isRelatedTo>
					<rdf:Description rdf:about="#{vc:relationSet/vc:relation/@refid}">
						<rdf:type rdf:resource="http://schema.org/CreativeWork" />
					</rdf:Description>
				</schema:isRelatedTo>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'reliefFor'">
				<vra-p:reliefFor>
					<rdf:Description rdf:about="#{vc:relationSet/vc:relation/@refid}">
						<rdf:type rdf:resource="http://schema.org/CreativeWork" />
					</rdf:Description>
				</vra-p:reliefFor>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'impressionIs'">
				<vra-p:hasImpression>
					<rdf:Description rdf:about="#{vc:relationSet/vc:relation/@refid}">
						<rdf:type rdf:resource="http://schema.org/CreativeWork" />
					</rdf:Description>
				</vra-p:hasImpression>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'replicaOf'">
				<vra-p:replicaOf>
					<rdf:Description rdf:about="#{vc:relationSet/vc:relation/@refid}">
						<rdf:type rdf:resource="http://schema.org/CreativeWork" />
					</rdf:Description>
				</vra-p:replicaOf>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'replicaIs'">
				<vra-p:hasReplica>
					<rdf:Description rdf:about="#{vc:relationSet/vc:relation/@refid}">
						<rdf:type rdf:resource="http://schema.org/CreativeWork" />
					</rdf:Description>
				</vra-p:hasReplica>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'studyFor'">
				<vra-p:studyFor>
					<rdf:Description rdf:about="#{vc:relationSet/vc:relation/@refid}">
						<rdf:type rdf:resource="http://schema.org/CreativeWork" />
					</rdf:Description>
				</vra-p:studyFor>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'studyIs'">
				<vra-p:hasStudy>
					<rdf:Description rdf:about="#{vc:relationSet/vc:relation/@refid}">
						<rdf:type rdf:resource="http://schema.org/CreativeWork" />
					</rdf:Description>
				</vra-p:hasStudy>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'versionOf'">
				<vra-p:versionOf>
					<rdf:Description rdf:about="#{vc:relationSet/vc:relation/@refid}">
						<rdf:type rdf:resource="http://schema.org/CreativeWork" />
					</rdf:Description>
				</vra-p:versionOf>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'versionIs'">
				<vra-p:hasVersion>
					<rdf:Description rdf:about="#{vc:relationSet/vc:relation/@refid}">
						<rdf:type rdf:resource="http://schema.org/CreativeWork" />
					</rdf:Description>
				</vra-p:hasVersion>
			</xsl:if>
		</rdf:Description>
	</xsl:template>
  
  <!-- Agent template -->
	<xsl:template match="vc:agent">
		<schema:creator>
		<rdf:Description>
			<xsl:if test="vc:name/@vocab= 'ULAN'">
					<xsl:attribute name="rdf:about">
					<xsl:text>http://viaf.org/viaf/sourceID/JPG%7C</xsl:text>
					<xsl:value-of select="vc:name/@refid"/>
					<xsl:text>#skos:Concept</xsl:text>
				</xsl:attribute>
			</xsl:if>
			<xsl:if test="vc:name/@vocab= 'LCNAF'">
				<xsl:attribute name="rdf:about">
					<xsl:text>http://id.loc.gov/authorities/names/</xsl:text>
					<xsl:value-of select="translate(vc:name/@refid,' ','')"/>
				</xsl:attribute>
			</xsl:if>
			<rdf:type rdf:resource="http://xmlns.org/foaf/0.1/Agent" />
			<xsl:if test="vc:name/@type='personal'">
				<rdf:type rdf:resource="http://schema.org/Person" />
			</xsl:if>
			<xsl:if test="vc:name/@type='corporate'">
				<rdf:type rdf:resource="http://schema.org/Organization" />
			</xsl:if>
			<xsl:choose>
			<xsl:when test="vc:name/@type='family'">
				<schema:familyName>
					<xsl:value-of select="vc:name" />
				</schema:familyName>
			</xsl:when>
			<xsl:otherwise>
			<schema:name>
				<xsl:value-of select="vc:name" />
			</schema:name>
			</xsl:otherwise>
			</xsl:choose>
			<xsl:if test="vc:dates/@type='life'">
				<schema:birthDate>
					<xsl:value-of select="vc:dates/vc:earliestDate"/>
				</schema:birthDate>
				<schema:deathDate>
					<xsl:value-of select="vc:dates/vc:latestDate"/>
				</schema:deathDate>
			</xsl:if>
			<xsl:if test="vc:dates/@type='activity'">
				<vra-p:creativeActivity>
				<rdf:Description>
				<rdf:type rdf:resource="http://schema.org/Event" />
					<schema:name>ArtisticActivity</schema:name>
					<schema:startDate>
						<xsl:value-of select="vc:dates/vc:earliestDate" />
					</schema:startDate>
					<schema:endDate>
						<xsl:value-of select="vc:dates/vc:latestDate" />
					</schema:endDate>
				</rdf:Description>
				</vra-p:creativeActivity>
			</xsl:if>
			<xsl:if test="vc:culture">
			<vra-p:hasCulture>
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:text>http://purl.org/getty/vocab/ulan/</xsl:text>
					<xsl:value-of select="vc:culture"/>
				</xsl:attribute>
				<schema:name>
					<xsl:value-of select="vc:culture" />
				</schema:name>
			</rdf:Description>
			</vra-p:hasCulture>
			</xsl:if>
		</rdf:Description>
		</schema:creator>
	</xsl:template>
   
   <!-- CreativeWork Culture template -->
	<xsl:template match="vc:culturalContext">
		<vra-p:culturalContext>
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:text>http://purl.org/getty/vocab/ulan/</xsl:text>
					<xsl:value-of select="."/>
				</xsl:attribute>
				<schema:name>
					<xsl:value-of select="." />
				</schema:name>
			</rdf:Description>
			</vra-p:culturalContext>
	</xsl:template>

	<!-- Date/Event templates -->
	<xsl:template match="vc:dateSet">
		<xsl:if test="not(vc:dateSet/vc:dates)">
			<schema:dateCreated>
				<xsl:value-of select="vc:display" />
			</schema:dateCreated>
		</xsl:if>

		<xsl:if test="vc:date[@type='creation']">
			<vra-p:wasCreated>
				<rdf:Description>
				<rdf:type rdf:resource="http://schema.org/Event" />
					<schema:name>Creation</schema:name>
					<schema:startDate>
						<xsl:value-of select="vc:date/vc:earliestDate" />
					</schema:startDate>
					<schema:endDate>
						<xsl:value-of select="vc:date/vc:latestDate" />
					</schema:endDate>
				</rdf:Description>
			</vra-p:wasCreated>
		</xsl:if>
		
		<xsl:if test="vc:date[@type='inclusive']">
			<vra-p:wasCreated>
				<rdf:Description>
				<rdf:type rdf:resource="http://schema.org/Event" />
					<schema:name>Inclusive</schema:name>
					<schema:startDate>
						<xsl:value-of select="vc:date/vc:earliestDate" />
					</schema:startDate>
					<schema:endDate>
						<xsl:value-of select="vc:date/vc:latestDate" />
					</schema:endDate>
				</rdf:Description>
			</vra-p:wasCreated>
		</xsl:if>

		<xsl:if test="vc:date[@type='broadcast']">
			<vra-p:wasBroadcast>
				<rdf:Description>
				<rdf:type rdf:resource="http://schema.org/Event" />
					<schema:name>Broadcast</schema:name>
					<schema:startDate>
						<xsl:value-of select="vc:date/vc:earliestDate" />
					</schema:startDate>
					<schema:endDate>
						<xsl:value-of select="vc:date/vc:latestDate" />
					</schema:endDate>
				</rdf:Description>
			</vra-p:wasBroadcast>
		</xsl:if>

		<xsl:if test="vc:date[@type='alteration']">
			<vra-p:wasAltered>
				<rdf:Description>
				<rdf:type rdf:resource="http://schema.org/Event" />
					<schema:name>Altered</schema:name>
					<schema:startDate>
						<xsl:value-of select="vc:date/vc:earliestDate" />
					</schema:startDate>
					<schema:endDate>
						<xsl:value-of select="vc:date/vc:latestDate" />
					</schema:endDate>
				</rdf:Description>
			</vra-p:wasAltered>
		</xsl:if>

		<xsl:if test="vc:date[@type='commission']">
			<vra-p:wasCommissioned>
				<rdf:Description>
				<rdf:type rdf:resource="http://schema.org/Event" />
					<schema:name>Commission</schema:name>
					<schema:startDate>
						<xsl:value-of select="vc:date/vc:earliestDate" />
					</schema:startDate>
					<schema:endDate>
						<xsl:value-of select="vc:date/vc:latestDate" />
					</schema:endDate>
				</rdf:Description>
			</vra-p:wasCommissioned>
		</xsl:if>

		<xsl:if test="vc:date[@type='design']">
			<vra-p:wasDesigned>
				<rdf:Description>
				<rdf:type rdf:resource="http://schema.org.org/Event" />
					<schema:name>Design</schema:name>
					<schema:startDate>
						<xsl:value-of select="vc:date/vc:earliestDate" />
					</schema:startDate>
					<schema:endDate>
						<xsl:value-of select="vc:date/vc:latestDate" />
					</schema:endDate>
				</rdf:Description>
			</vra-p:wasDesigned>
		</xsl:if>

		<xsl:if test="vc:date[@type='destruction']">
			<vra-p:wasDestroyed>
				<rdf:Description>
				<rdf:type rdf:resource="http://schema.org/Event" />
					<schema:name>Destruction</schema:name>
					<schema:startDate>
						<xsl:value-of select="vc:date/vc:earliestDate" />
					</schema:startDate>
					<schema:endDate>
						<xsl:value-of select="vc:date/vc:latestDate" />
					</schema:endDate>
				</rdf:Description>
			</vra-p:wasDestroyed>
		</xsl:if>

		<xsl:if test="vc:date[@type='discovery']">
			<vra-p:wasDiscovered>
				<rdf:Description>
				<rdf:type rdf:resource="http://schema.org/Event" />
					<schema:name>Discovery</schema:name>
					<schema:startDate>
						<xsl:value-of select="vc:date/vc:earliestDate" />
					</schema:startDate>
					<schema:endDate>
						<xsl:value-of select="vc:date/vc:latestDate" />
					</schema:endDate>
				</rdf:Description>
			</vra-p:wasDiscovered>
		</xsl:if>

		<xsl:if test="vc:date[@type='exhibition']">
			<vra-p:wasExhibited>
				<rdf:Description>
				<rdf:type rdf:resource="http://schema.org/Event" />
					<schema:name>Exhibition</schema:name>
					<schema:startDate>
						<xsl:value-of select="vc:date/vc:earliestDate" />
					</schema:startDate>
					<schema:endDate>
						<xsl:value-of select="vc:date/vc:latestDate" />
					</schema:endDate>
				</rdf:Description>
			</vra-p:wasExhibited>
		</xsl:if>

		<xsl:if test="vc:date[@type='performance']">
			<vra-p:wasPerformed>
				<rdf:Description>
				<rdf:type rdf:resource="http://schema.org/Event" />
					<schema:name>Performance</schema:name>
					<schema:startDate>
						<xsl:value-of select="vc:date/vc:earliestDate" />
					</schema:startDate>
					<schema:endDate>
						<xsl:value-of select="vc:date/vc:latestDate" />
					</schema:endDate>
				</rdf:Description>
			</vra-p:wasPerformed>
		</xsl:if>

		<xsl:if test="vc:date[@type='publication']">
			<vra-p:wasPublished>
				<rdf:Description>
				<rdf:type rdf:resource="http://schema.org/Event" />
					<schema:name>Publication</schema:name>
					<schema:startDate>
						<xsl:value-of select="vc:date/vc:earliestDate" />
					</schema:startDate>
					<schema:endDate>
						<xsl:value-of select="vc:date/vc:latestDate" />
					</schema:endDate>
				</rdf:Description>
			</vra-p:wasPublished>
		</xsl:if>

		<xsl:if test="vc:date[@type='restoration']">
			<vra-p:wasRestored>
				<rdf:Description>
				<rdf:type rdf:resource="http://schema.org/Event" />
					<schema:name>Restoration</schema:name>
					<schema:startDate>
						<xsl:value-of select="vc:date/vc:earliestDate" />
					</schema:startDate>
					<schema:endDate>
						<xsl:value-of select="vc:date/vc:latestDate" />
					</schema:endDate>
				</rdf:Description>
			</vra-p:wasRestored>
		</xsl:if>

		<xsl:if test="vc:date[@type='view']">
			<vra-p:wasViewed>
				<rdf:Description>
				<rdf:type rdf:resource="http://schema.org/Event" />
					<schema:name>Viewed</schema:name>
					<schema:startDate>
						<xsl:value-of select="vc:date/vc:earliestDate" />
					</schema:startDate>
					<schema:endDate>
						<xsl:value-of select="vc:date/vc:latestDate" />
					</schema:endDate>
				</rdf:Description>
			</vra-p:wasViewed>
		</xsl:if>
	</xsl:template>

<!-- Title template -->	
	<xsl:template match="vc:titleSet">
		<xsl:choose>
			<xsl:when test="not(vc:title)">
				<schema:name>
					<xsl:value-of select="vc:display" />
				</schema:name>
			</xsl:when>
			<xsl:otherwise>
				<xsl:apply-templates select="vc:title"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template match="vc:title">
		<schema:name>
		<xsl:if test="@xml:lang">
			<xsl:attribute name="xml:lang">
				<xsl:value-of select="@xml:lang"/>
			</xsl:attribute>
		</xsl:if>
			<xsl:value-of select="." />
		</schema:name>
	</xsl:template>
	
	<!-- Description template -->
	<xsl:template match="vc:description">
		<schema:description>
			<xsl:value-of select="." />
		</schema:description>
	</xsl:template>

<!-- Location templates -->	
	<xsl:template match="vc:location[@type='repository']">
		<vra-p:placeOfRepository>
			<rdf:Description>
				<rdf:type rdf:resource="http://schema.org/Place" />
				<rdf:type rdf:resource="http://schema.org/CivicStructure" />
				<xsl:apply-templates select="vc:name" mode="schema:Place"/>
				<schema:name>
					<xsl:value-of select="../vc:display"/>
				</schema:name>
				<schema:description>
					<xsl:value-of select="../vc:notes"/>
				</schema:description>
				</rdf:Description>
		</vra-p:placeOfRepository>
	</xsl:template>
	
	<xsl:template match="vc:location[@type='publication']">
		<vra-p:placeOfPublication>
			<rdf:Description>
				<rdf:type rdf:resource="http://schema.org/Place" />
				<xsl:apply-templates select="vc:name" mode="schema:Place"/>
				<schema:name>
					<xsl:value-of select="../vc:display"/>
				</schema:name>
				<schema:description>
					<xsl:value-of select="../vc:notes"/>
				</schema:description>
			</rdf:Description>
		</vra-p:placeOfPublication>
	</xsl:template>
	
	<xsl:template match="vc:location[@type='formerOwner']">
		<vra-p:formerOwner>
			<rdf:Description>
				<rdf:type rdf:resource="http://schema.org/Place" />
				<xsl:apply-templates select="vc:name" mode="schema:Place"/>
				<schema:name>
					<xsl:value-of select="../vc:display"/>
				</schema:name>
				<schema:description>
					<xsl:value-of select="../vc:notes"/>
				</schema:description>
			</rdf:Description>
		</vra-p:formerOwner>
	</xsl:template>
	
	<xsl:template match="vc:location[@type='discovery']">
		<vra-p:placeOfDiscovery>
			<rdf:Description>
				<rdf:type rdf:resource="http://schema.org/Place" />
				<xsl:apply-templates select="vc:name" mode="schema:Place"/>
				<schema:name>
					<xsl:value-of select="../vc:display"/>
				</schema:name>
				<schema:description>
					<xsl:value-of select="../vc:notes"/>
				</schema:description>
			</rdf:Description>
		</vra-p:placeOfDiscovery>
	</xsl:template>
	
	<xsl:template match="vc:location[@type='exhibition']">
		<vra-p:placeOfExhibition>
			<rdf:Description>
				<rdf:type rdf:resource="http://schema.org/Place" />
				<xsl:apply-templates select="vc:name" mode="schema:Place"/>
				<schema:name>
					<xsl:value-of select="../vc:display"/>
				</schema:name>
				<schema:description>
					<xsl:value-of select="../vc:notes"/>
				</schema:description>
			</rdf:Description>
		</vra-p:placeOfExhibition>
	</xsl:template>
	
	<xsl:template match="vc:location[@type='formerRepository']">
		<vra-p:formerRepository>
			<rdf:Description>
				<rdf:type rdf:resource="http://schema.org/Place" />
				<rdf:type rdf:resource="http://schema.org/CivicStructure" />
				<xsl:apply-templates select="vc:name" mode="schema:Place"/>
				<schema:name>
					<xsl:value-of select="../vc:display"/>
				</schema:name>
				<schema:description>
					<xsl:value-of select="../vc:notes"/>
				</schema:description>
			</rdf:Description>
		</vra-p:formerRepository>
	</xsl:template>
	
	<xsl:template match="vc:location[@type='formerSite']">
		<vra-p:formerSite>
			<rdf:Description>
				<rdf:type rdf:resource="http://schema.org/Place" />
				<xsl:apply-templates select="vc:name" mode="schema:Place"/>
				<schema:name>
					<xsl:value-of select="../vc:display"/>
				</schema:name>
				<schema:description>
					<xsl:value-of select="../vc:notes"/>
				</schema:description>
			</rdf:Description>
		</vra-p:formerSite>
	</xsl:template>
	
	<xsl:template match="vc:location[@type='installation']">
		<vra-p:placeOfInstallation>
			<rdf:Description>
				<rdf:type rdf:resource="http://schema.org/Place" />
				<xsl:apply-templates select="vc:name" mode="schema:Place"/>
				<schema:name>
					<xsl:value-of select="../vc:display"/>
				</schema:name>
				<schema:description>
					<xsl:value-of select="../vc:notes"/>
				</schema:description>
			</rdf:Description>
		</vra-p:placeOfInstallation>
	</xsl:template>
	
	<xsl:template match="vc:location[@type='intended']">
		<vra-p:placeOfIntention>
			<rdf:Description>
				<rdf:type rdf:resource="http://schema.org/Place" />
				<xsl:apply-templates select="vc:name" mode="schema:Place"/>
				<schema:name>
					<xsl:value-of select="../vc:display"/>
				</schema:name>
				<schema:description>
					<xsl:value-of select="../vc:notes"/>
				</schema:description>
			</rdf:Description>
		</vra-p:placeOfIntention>
	</xsl:template>
	
	<xsl:template match="vc:location[@type='owner']">
		<vra-p:placeOfOwnership>
			<rdf:Description>
				<rdf:type rdf:resource="http://schema.org/Place" />
				<xsl:apply-templates select="vc:name" mode="schema:Place"/>
				<schema:name>
					<xsl:value-of select="../vc:display"/>
				</schema:name>
				<schema:description>
					<xsl:value-of select="../vc:notes"/>
				</schema:description>
			</rdf:Description>
		</vra-p:placeOfOwnership>
	</xsl:template>
	
	<xsl:template match="vc:location[@type='performance']">
		<vra-p:placeOfPerformance>
			<rdf:Description>
				<rdf:type rdf:resource="http://schema.org/Place" />
				<xsl:apply-templates select="vc:name" mode="schema:Place"/>
				<schema:name>
					<xsl:value-of select="../vc:display"/>
				</schema:name>
				<schema:description>
					<xsl:value-of select="../vc:notes"/>
				</schema:description>
			</rdf:Description>
		</vra-p:placeOfPerformance>
	</xsl:template>
	
	<xsl:template match="vc:location[@type='site']">
		<vra-p:placeOfSite>
			<rdf:Description>
				<rdf:type rdf:resource="http://schema.org/Place" />
				<xsl:apply-templates select="vc:name" mode="schema:Place"/>
				<schema:name>
					<xsl:value-of select="../vc:display"/>
				</schema:name>
				<schema:description>
					<xsl:value-of select="../vc:notes"/>
				</schema:description>
			</rdf:Description>
		</vra-p:placeOfSite>
	</xsl:template>
	
	<xsl:template match="vc:name" mode="schema:Place">
		<schema:containedIn>
			<rdf:Description>
				<xsl:if test="@vocab='TGN'">
					<xsl:attribute name="rdf:about">
						<xsl:text>http://vocab.getty.edu/tgn/</xsl:text>
						<xsl:value-of select="@refid"/>
					</xsl:attribute>
				</xsl:if>
				<xsl:if test="@vocab='LCSH'">
					<xsl:attribute name="rdf:about">
						<xsl:text>http://id.loc.gov/authorities/subjects/</xsl:text>
						<xsl:value-of select="translate(@refid,' ','')"/>
					</xsl:attribute>
				</xsl:if>
				<rdf:type rdf:resource="http://schema.org/Place" />
				<xsl:if test="@extent='state'">
					<rdf:type rdf:resource="http://schema.org/State" />
				</xsl:if>
				<xsl:if test="@extent='nation'">
					<rdf:type rdf:resource="http://schema.org/Country" />
				</xsl:if>
				<xsl:if test="@extent='continent'">
					<rdf:type rdf:resource="http://schema.org/Continent" />
				</xsl:if>
				<xsl:if test="@vocab='TGN'">
					<schema:url>
						<xsl:text>http://www.getty.edu/vow/TGNFullDisplay?find=</xsl:text>
						<xsl:value-of select="@refid"/>
						<xsl:text>&amp;place=&amp;nation=&amp;prev_page=1&amp;english=N&amp;subjectid=</xsl:text>
						<xsl:value-of select="@refid"/>
					</schema:url>
				</xsl:if>
				<schema:name>
					<xsl:value-of select="."/>
				</schema:name>	
			</rdf:Description>
		</schema:containedIn>
	</xsl:template>
	
	<!-- Material template -->
		<xsl:template match="vc:materialSet">
			<xsl:choose>
					<xsl:when test="not(vc:material/node())">
						<vra-p:material>
						<rdf:Description>
						<rdf:type rdf:resource="http://purl.org/vra/Material" />
						<schema:name>
							<xsl:value-of select="vc:display"/>
						</schema:name>
						</rdf:Description>
						</vra-p:material>
					</xsl:when>
					<xsl:otherwise>
								<xsl:apply-templates select="vc:material"/>
					</xsl:otherwise>
			</xsl:choose>
	</xsl:template>
	
	<xsl:template match="vc:material">	
	<xsl:if test="string-length(.)&gt;0">	
		<xsl:choose>
			<xsl:when test="@vocab ='LCSAF'">
				<vra-p:material>
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:text>http://id.loc.gov/authorities/subjects/</xsl:text>
						<xsl:value-of select="translate(@refid,' ','')"/>
					</xsl:attribute>
					<rdf:type rdf:resource="http://purl.org/vra/Material" />
					<schema:name>
						<xsl:value-of select="."/>
					</schema:name>
			</rdf:Description>
			</vra-p:material>
			</xsl:when>
			<xsl:when test="@vocab ='LCNAF'">
				<vra-p:material>
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:text>http://id.loc.gov/authorities/names/</xsl:text>
						<xsl:value-of select="translate(@refid,' ','')"/>
					</xsl:attribute>
					<rdf:type rdf:resource="http://purl.org/vra/Material" />
					<schema:name>
						<xsl:value-of select="."/>
					</schema:name>
			</rdf:Description>
			</vra-p:material>
			</xsl:when>
			<xsl:when test="@vocab ='LCTGM'">
				<vra-p:material>
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:text>http://id.loc.gov/vocabulary/graphicMaterials/</xsl:text>
						<xsl:value-of select="translate(@refid,' ','')"/>
					</xsl:attribute>
					<rdf:type rdf:resource="http://schema.org/Intangible"/>
					<rdf:type rdf:resource="http://purl.org/vra/StylePeriod"/>
					<schema:name>
						<xsl:value-of select="."/>
					</schema:name>
			</rdf:Description>
			</vra-p:material>
			</xsl:when>
			<xsl:when test="@vocab ='AAT'">
				<vra-p:material>
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:text>http://vocab.getty.edu/aat/</xsl:text>
						<xsl:value-of select="@refid"/>
					</xsl:attribute>
					<rdf:type rdf:resource="http://purl.org/vra/Material" />
					<schema:name>
						<xsl:value-of select="."/>
					</schema:name>
				</rdf:Description>
				</vra-p:material>
			</xsl:when>
			<xsl:when test="@vocab ='ULAN'">
				<vra-p:material>
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:text>http://vocab.getty.edu/aat/</xsl:text>
						<xsl:value-of select="@refid"/>
					</xsl:attribute>
					<rdf:type rdf:resource="http://purl.org/vra/Material" />
					<schema:name>
						<xsl:value-of select="."/>
					</schema:name>
				</rdf:Description>
				</vra-p:material>
			</xsl:when>
			<xsl:when test="@vocab ='TGN'">
				<vra-p:material>
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:text>http://vocab.getty.edu/tgn/</xsl:text>
						<xsl:value-of select="@refid"/>
					</xsl:attribute>
					<rdf:type rdf:resource="http://purl.org/vra/Material" />
					<schema:name>
						<xsl:value-of select="."/>
					</schema:name>
				</rdf:Description>
				</vra-p:material>
			</xsl:when>
			<xsl:otherwise>
				<vra-p:material>
				<rdf:Description>
					<rdf:type rdf:resource="http://purl.org/vra/Material" />
					<schema:name>
						<xsl:value-of select="."/>
					</schema:name>
				</rdf:Description>
				</vra-p:material>
			</xsl:otherwise>
		</xsl:choose>
		</xsl:if>
	</xsl:template>
	
	<!-- StylePeriod templates -->
	<xsl:template match="vc:stylePeriodSet">
			<xsl:choose>
					<xsl:when test="not(vc:stylePeriod)">
						<vra-p:hasStylePeriod>
						<rdf:Description>
						<rdf:type rdf:resource="http://schema.org/Intangible" />
						<rdf:type rdf:resource="http://purl.org/vra/StylePeriod" />
						<schema:name><xsl:value-of select="vc:display"></xsl:value-of></schema:name>
						</rdf:Description>
						</vra-p:hasStylePeriod>
					</xsl:when>
					<xsl:otherwise>
								<xsl:apply-templates select="vc:stylePeriod"/>
					</xsl:otherwise>
			</xsl:choose>
	</xsl:template>
	
	<xsl:template match="vc:stylePeriod">		
		<xsl:choose>
			<xsl:when test="@vocab ='LCSAF'">
				<vra-p:hasStylePeriod>
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:text>http://id.loc.gov/authorities/subjects/</xsl:text>
						<xsl:value-of select="translate(@refid,' ','')"/>
					</xsl:attribute>
					<rdf:type rdf:resource="http://schema.org/Intangible"/>
					<rdf:type rdf:resource="http://purl.org/vra/StylePeriod"/>
					<schema:name><xsl:value-of select="."/></schema:name>
			</rdf:Description>
			</vra-p:hasStylePeriod>
			</xsl:when>
			<xsl:when test="@vocab ='LCNAF'">
				<vra-p:hasStylePeriod>
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:text>http://id.loc.gov/authorities/names/</xsl:text>
						<xsl:value-of select="translate(@refid,' ','')"/>
					</xsl:attribute>
					<rdf:type rdf:resource="http://schema.org/Intangible"/>
					<rdf:type rdf:resource="http://purl.org/vra/StylePeriod"/>
					<schema:name><xsl:value-of select="."/></schema:name>
			</rdf:Description>
			</vra-p:hasStylePeriod>
			</xsl:when>
			<xsl:when test="@vocab ='LCTGM'">
				<vra-p:hasStylePeriod>
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:text>http://id.loc.gov/vocabulary/graphicMaterials/</xsl:text>
						<xsl:value-of select="translate(@refid,' ','')"/>
					</xsl:attribute>
					<rdf:type rdf:resource="http://schema.org/Intangible"/>
					<rdf:type rdf:resource="http://purl.org/vra/StylePeriod"/>
					<schema:name><xsl:value-of select="."/></schema:name>
			</rdf:Description>
			</vra-p:hasStylePeriod>
			</xsl:when>
			<xsl:when test="@vocab ='AAT'">
				<vra-p:hasStylePeriod>
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:text>http://vocab.getty.edu/aat/</xsl:text>
						<xsl:value-of select="@refid"/>
					</xsl:attribute>
					<rdf:type rdf:resource="http://schema.org/Intangible" />
					<rdf:type rdf:resource="http://purl.org/vra/StylePeriod" />
					<schema:name><xsl:value-of select="."/></schema:name>
				</rdf:Description>
				</vra-p:hasStylePeriod>
			</xsl:when>
			<xsl:when test="@vocab ='ULAN'">
				<vra-p:hasStylePeriod>
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:text>http://vocab.getty.edu/aat/</xsl:text>
						<xsl:value-of select="@refid"/>
					</xsl:attribute>
					<rdf:type rdf:resource="http://schema.org/Intangible" />
					<rdf:type rdf:resource="http://purl.org/vra/StylePeriod" />
					<schema:name><xsl:value-of select="."/></schema:name>
				</rdf:Description>
				</vra-p:hasStylePeriod>
			</xsl:when>
			<xsl:when test="@vocab ='TGN'">
				<vra-p:hasStylePeriod>
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:text>http://vocab.getty.edu/tgn/</xsl:text>
						<xsl:value-of select="@refid"/>
					</xsl:attribute>
					<rdf:type rdf:resource="http://schema.org/Intangible" />
					<rdf:type rdf:resource="http://purl.org/vra/StylePeriod" />
					<schema:name><xsl:value-of select="."/></schema:name>
				</rdf:Description>
				</vra-p:hasStylePeriod>
			</xsl:when>
			<xsl:otherwise>
				<vra-p:hasStylePeriod>
				<rdf:Description>
					<rdf:type rdf:resource="http://schema.org/Intangible" />
					<rdf:type rdf:resource="http://purl.org/vra/StylePeriod" />
					<schema:name><xsl:value-of select="."/></schema:name>
				</rdf:Description>
				</vra-p:hasStylePeriod>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<!-- Subject Templates	  -->
	<xsl:template match="vc:subjectSet">
		<xsl:choose>
			<xsl:when test="not(vc:subject/vc:term)">
				<schema:about>
				<rdf:Description>
					<rdf:type rdf:resource="http://schema.org/Thing" />
					<schema:name><xsl:value-of select="vc:display"></xsl:value-of></schema:name>
				</rdf:Description>
				</schema:about>
			</xsl:when>
			<xsl:otherwise>
						<xsl:apply-templates select="vc:subject/vc:term"/>
			</xsl:otherwise>
			</xsl:choose>
	</xsl:template>
	
	<xsl:template match="vc:subject/vc:term">	 
		<xsl:choose>	
			<xsl:when test="@vocab = 'LCSAF'">
				<schema:about>
				<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:text>http://id.loc.gov/authorities/subjects/</xsl:text>
					<xsl:value-of select="translate(@refid,' ','')"/>
				</xsl:attribute>
				<xsl:choose>
					<xsl:when test="@type='corporateName'">
						<rdf:type rdf:resource="http://schema.org/Organization" />
					</xsl:when>	
					<xsl:when test="@type='personalName'">
						<rdf:type rdf:resource="http://schema.org/Person" />
					</xsl:when>
					<xsl:when test="@type='familyName'">
						<rdf:type rdf:resource="http://schema.org/Person" />
					</xsl:when>
					<xsl:otherwise>
						<rdf:type rdf:resource="http://schema.org/Thing" />
					</xsl:otherwise>
				</xsl:choose>
				<schema:name>
					<xsl:value-of select="."/>
				</schema:name>
				</rdf:Description>
				</schema:about>
			</xsl:when>
			<xsl:when test="@vocab = 'LCNAF'">
				<schema:about>
				<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:text>http://id.loc.gov/authorities/names/</xsl:text>
					<xsl:value-of select="translate(@refid,' ','')"/>
				</xsl:attribute>
				<xsl:choose>
					<xsl:when test="@type='corporateName'">
						<rdf:type rdf:resource="http://schema.org/Organization" />
					</xsl:when>	
					<xsl:when test="@type='personalName'">
						<rdf:type rdf:resource="http://schema.org/Person" />
					</xsl:when>
					<xsl:when test="@type='familyName'">
						<rdf:type rdf:resource="http://schema.org/Person" />
					</xsl:when>
					<xsl:otherwise>
						<rdf:type rdf:resource="http://schema.org/Thing" />
					</xsl:otherwise>
				</xsl:choose>
				<schema:name>
					<xsl:value-of select="."/>
				</schema:name>
				</rdf:Description>
				</schema:about>
			</xsl:when>
			<xsl:when test="@vocab = 'LCTGM'">
				<schema:about>
				<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:text>http://id.loc.gov/vocabulary/graphicMaterials/</xsl:text>
					<xsl:value-of select="translate(@refid,' ','')"/>
				</xsl:attribute>
				<xsl:choose>
					<xsl:when test="@type='corporateName'">
						<rdf:type rdf:resource="http://schema.org/Organization" />
					</xsl:when>	
					<xsl:when test="@type='personalName'">
						<rdf:type rdf:resource="http://schema.org/Person" />
					</xsl:when>
					<xsl:when test="@type='familyName'">
						<rdf:type rdf:resource="http://schema.org/Person" />
					</xsl:when>
					<xsl:otherwise>
						<rdf:type rdf:resource="http://schema.org/Thing" />
					</xsl:otherwise>
				</xsl:choose>
				<schema:name>
					<xsl:value-of select="."/>
				</schema:name>
				</rdf:Description>
				</schema:about>
			</xsl:when>
			<xsl:when test="@vocab = 'TGN'">
				<schema:about>
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:text>http://vocab.getty.edu/tgn/</xsl:text>
						<xsl:value-of select="@refid"/>
					</xsl:attribute>
					<xsl:choose>
						<xsl:when test="@type='corporateName'">
							<rdf:type rdf:resource="http://schema.org/Organization" />
						</xsl:when>	
						<xsl:when test="@type='personalName'">
							<rdf:type rdf:resource="http://schema.org/Person" />
						</xsl:when>
						<xsl:when test="@type='familyName'">
							<rdf:type rdf:resource="http://schema.org/Person" />
						</xsl:when>
						<xsl:otherwise>
							<rdf:type rdf:resource="http://schema.org/Thing" />
						</xsl:otherwise>
					</xsl:choose>
					<schema:name>
						<xsl:value-of select="."/>
					</schema:name>
				</rdf:Description>
				</schema:about>
			</xsl:when>
			<xsl:when test="@vocab = 'AAT'">
				<schema:about>
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:text>http://vocab.getty.edu/aat/</xsl:text>
						<xsl:value-of select="@refid"/>
					</xsl:attribute>
					<xsl:choose>
						<xsl:when test="@type='corporateName'">
							<rdf:type rdf:resource="http://schema.org/Organization" />
						</xsl:when>	
						<xsl:when test="@type='personalName'">
							<rdf:type rdf:resource="http://schema.org/Person" />
						</xsl:when>
						<xsl:when test="@type='familyName'">
							<rdf:type rdf:resource="http://schema.org/Person" />
						</xsl:when>
						<xsl:otherwise>
							<rdf:type rdf:resource="http://schema.org/Thing" />
						</xsl:otherwise>
					</xsl:choose>
					<schema:name>
						<xsl:value-of select="."/>
					</schema:name>
				</rdf:Description>
				</schema:about>
			</xsl:when>
			<xsl:when test="@vocab = 'ULAN'">
				<schema:about>
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:text>http://vocab.getty.edu/aat/</xsl:text>
						<xsl:value-of select="@refid"/>
					</xsl:attribute>
					<xsl:choose>
						<xsl:when test="@type='corporateName'">
							<rdf:type rdf:resource="http://schema.org/Organization" />
						</xsl:when>	
						<xsl:when test="@type='personalName'">
							<rdf:type rdf:resource="http://schema.org/Person" />
						</xsl:when>
						<xsl:when test="@type='familyName'">
							<rdf:type rdf:resource="http://schema.org/Person" />
						</xsl:when>
						<xsl:otherwise>
							<rdf:type rdf:resource="http://schema.org/Thing" />
						</xsl:otherwise>
					</xsl:choose>
					<schema:name>
						<xsl:value-of select="."/>
					</schema:name>
				</rdf:Description>
				</schema:about>
			</xsl:when>
			<xsl:otherwise>
				<schema:about>
				<rdf:Description>
					<xsl:choose>
						<xsl:when test="@type='corporateName'">
							<rdf:type rdf:resource="http://schema.org/Organization" />
						</xsl:when>	
						<xsl:when test="@type='personalName'">
							<rdf:type rdf:resource="http://schema.org/Person" />
						</xsl:when>
						<xsl:when test="@type='familyName'">
							<rdf:type rdf:resource="http://schema.org/Person" />
						</xsl:when>
						<xsl:otherwise>
							<rdf:type rdf:resource="http://schema.org/Thing" />
						</xsl:otherwise>
					</xsl:choose>
					<schema:name>
						<xsl:value-of select="."/>
					</schema:name>
				</rdf:Description>
				</schema:about>
			</xsl:otherwise>
			</xsl:choose>
	</xsl:template>
	
	<!-- Technique set templates -->
	<xsl:template match="vc:techniqueSet">
		<xsl:choose>
			<xsl:when test="not(vc:technique/node())">
				<vra-p:hasTechnique>
				<rdf:Description>
				<rdf:type rdf:resource="http://schema.org/Intangible" />
				<rdf:type rdf:resource="http://purl.org/vra/Technique" />
				<schema:name>
					<xsl:value-of select="vc:display" />
				</schema:name>
				</rdf:Description>
				</vra-p:hasTechnique>
			</xsl:when>
			<xsl:otherwise>
				<xsl:apply-templates select="vc:technique"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>		
			
	<xsl:template match="vc:technique">	 
		<xsl:choose>	
			<xsl:when test="@vocab = 'LCSAF'">
				<vra-p:hasTechnique>
				<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:text>http://id.loc.gov/authorities/subjects/</xsl:text>
					<xsl:value-of select="translate(@refid,' ','')"/>
				</xsl:attribute>
					<rdf:type rdf:resource="http://schema.org/Intangible" />
					<rdf:type rdf:resource="http://purl.org/vra/Technique" />
					<schema:name>
						<xsl:value-of select="."/>
					</schema:name>
				</rdf:Description>
				</vra-p:hasTechnique>
			</xsl:when>
			<xsl:when test="@vocab = 'LCNAF'">
				<vra-p:hasTechnique>
				<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:text>http://id.loc.gov/authorities/names/</xsl:text>
					<xsl:value-of select="translate(@refid,' ','')"/>
				</xsl:attribute>
					<rdf:type rdf:resource="http://schema.org/Intangible" />
					<rdf:type rdf:resource="http://purl.org/vra/Technique" />
					<schema:name>
						<xsl:value-of select="."/>
					</schema:name>
				</rdf:Description>
				</vra-p:hasTechnique>
			</xsl:when>
			<xsl:when test="@vocab = 'LCTGM'">
				<vra-p:hasTechnique>
				<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:text>http://id.loc.gov/vocabulary/graphicMaterials/</xsl:text>
					<xsl:value-of select="translate(@refid,' ','')"/>
				</xsl:attribute>
					<rdf:type rdf:resource="http://schema.org/Intangible" />
					<rdf:type rdf:resource="http://purl.org/vra/Technique" />
					<schema:name>
						<xsl:value-of select="."/>
					</schema:name>
				</rdf:Description>
				</vra-p:hasTechnique>
			</xsl:when>
			<xsl:when test="@vocab = 'TGN'">
				<vra-p:hasTechnique>
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:text>http://vocab.getty.edu/tgn/</xsl:text>
						<xsl:value-of select="@refid"/>
					</xsl:attribute>
					<rdf:type rdf:resource="http://schema.org/Intangible" />
					<rdf:type rdf:resource="http://purl.org/vra/Technique" />
				<schema:name>
					<xsl:value-of select="."/>
				</schema:name>
				</rdf:Description>
				</vra-p:hasTechnique>
			</xsl:when>
			<xsl:when test="@vocab = 'AAT'">
				<vra-p:hasTechnique>
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:text>http://vocab.getty.edu/aat/</xsl:text>
						<xsl:value-of select="@refid"/>
					</xsl:attribute>
					<rdf:type rdf:resource="http://schema.org/Intangible" />
					<rdf:type rdf:resource="http://purl.org/vra/Technique" />
					<schema:name>
						<xsl:value-of select="."/>
					</schema:name>
				</rdf:Description>
				</vra-p:hasTechnique>
			</xsl:when>
			<xsl:when test="@vocab = 'ULAN'">
				<vra-p:hasTechnique>
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:text>http://vocab.getty.edu/aat/</xsl:text>
						<xsl:value-of select="@refid"/>
					</xsl:attribute>
					<rdf:type rdf:resource="http://schema.org/Intangible" />
					<rdf:type rdf:resource="http://purl.org/vra/Technique" />
					<schema:name>
						<xsl:value-of select="."/>
					</schema:name>
				</rdf:Description>
				</vra-p:hasTechnique>
			</xsl:when>
			<xsl:otherwise>
				<vra-p:hasTechnique>
				<rdf:Description>
					<rdf:type rdf:resource="http://schema.org/Intangible" />
					<rdf:type rdf:resource="http://purl.org/vra/Technique" />
					<schema:name>
						<xsl:value-of select="."/>
					</schema:name>
				</rdf:Description>
				</vra-p:hasTechnique>
			</xsl:otherwise>
			</xsl:choose>
	</xsl:template>
	
	<!-- Measurement Templates -->
	<xsl:template match="vc:measurementsSet">
		<xsl:choose>
			<xsl:when test="not(vc:measurements/node())">
					<schema:contentSize>
					<xsl:value-of select="vc:display" />
					</schema:contentSize>
					<xsl:apply-templates select="/*//vc:measurements[@extent='each slide']"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:apply-templates select="vc:measurements"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>	
	
	<xsl:template match="vc:measurements">
		<xsl:if test="@type = 'height'">
			<schema:height>
				<rdf:Description>
					<rdf:type rdf:resource="http://schema.org/QuantitativeValue" />
					<schema:value>
						<xsl:value-of select="." />
					</schema:value>
					<xsl:if test="@unit = 'in'">
						<schema:unitCode>
							<xsl:text>INH</xsl:text>
						</schema:unitCode>
					</xsl:if>
					<xsl:if test="@unit = 'cm'">
						<schema:unitCode>
							<xsl:text>CMT</xsl:text>
						</schema:unitCode>
					</xsl:if>
					<xsl:if test="@unit = 'ft'">
						<schema:unitCode>
							<xsl:text>FOT</xsl:text>
						</schema:unitCode>
					</xsl:if>
					<xsl:if test="@unit = 'm'">
						<schema:unitCode>
							<xsl:text>MTR</xsl:text>
						</schema:unitCode>
					</xsl:if>
					<xsl:if test="@unit = 'yd'">
						<schema:unitCode>
							<xsl:text>YRD</xsl:text>
						</schema:unitCode>
					</xsl:if>
				</rdf:Description>
			</schema:height>
		</xsl:if>
		<xsl:if test="@type = 'width'">
			<schema:width>
				<rdf:Description>
					<rdf:type rdf:resource="http://schema.org/QuantitativeValue" />
					<schema:value>
						<xsl:value-of select="." />
					</schema:value>
					<xsl:if test="@unit = 'in'">
						<schema:unitCode>
							<xsl:text>INH</xsl:text>
						</schema:unitCode>
					</xsl:if>
					<xsl:if test="@unit = 'cm'">
						<schema:unitCode>
							<xsl:text>CMT</xsl:text>
						</schema:unitCode>
					</xsl:if>
					<xsl:if test="@unit = 'ft'">
						<schema:unitCode>
							<xsl:text>FOT</xsl:text>
						</schema:unitCode>
					</xsl:if>
					<xsl:if test="@unit = 'm'">
						<schema:unitCode>
							<xsl:text>MTR</xsl:text>
						</schema:unitCode>
					</xsl:if>
					<xsl:if test="@unit = 'yd'">
						<schema:unitCode>
							<xsl:text>YRD</xsl:text>
						</schema:unitCode>
					</xsl:if>
				</rdf:Description>
			</schema:width>
		</xsl:if>
		<xsl:if test="@type = 'depth'">
			<schema:depth>
				<rdf:Description>
					<rdf:type rdf:resource="http://schema.org/QuantitativeValue" />
					<schema:value>
						<xsl:value-of select="." />
					</schema:value>
					<xsl:if test="@unit = 'in'">
						<schema:unitCode>
							<xsl:text>INH</xsl:text>
						</schema:unitCode>
					</xsl:if>
					<xsl:if test="@unit = 'cm'">
						<schema:unitCode>
							<xsl:text>CMT</xsl:text>
						</schema:unitCode>
					</xsl:if>
					<xsl:if test="@unit = 'ft'">
						<schema:unitCode>
							<xsl:text>FOT</xsl:text>
						</schema:unitCode>
					</xsl:if>
					<xsl:if test="@unit = 'm'">
						<schema:unitCode>
							<xsl:text>MTR</xsl:text>
						</schema:unitCode>
					</xsl:if>
					<xsl:if test="@unit = 'yd'">
						<schema:unitCode>
							<xsl:text>YRD</xsl:text>
						</schema:unitCode>
					</xsl:if>
				</rdf:Description>
			</schema:depth>
		</xsl:if>
		<xsl:if test="@type = 'length'">
			<vra-p:length>
				<rdf:Description>
					<rdf:type rdf:resource="http://schema.org/QuantitativeValue" />
					<schema:value>
						<xsl:value-of select="." />
					</schema:value>
					<xsl:if test="@unit = 'in'">
						<schema:unitCode>
							<xsl:text>INH</xsl:text>
						</schema:unitCode>
					</xsl:if>
					<xsl:if test="@unit = 'cm'">
						<schema:unitCode>
							<xsl:text>CMT</xsl:text>
						</schema:unitCode>
					</xsl:if>
					<xsl:if test="@unit = 'ft'">
						<schema:unitCode>
							<xsl:text>FOT</xsl:text>
						</schema:unitCode>
					</xsl:if>
					<xsl:if test="@unit = 'm'">
						<schema:unitCode>
							<xsl:text>MTR</xsl:text>
						</schema:unitCode>
					</xsl:if>
					<xsl:if test="@unit = 'yd'">
						<schema:unitCode>
							<xsl:text>YRD</xsl:text>
						</schema:unitCode>
					</xsl:if>
				</rdf:Description>
			</vra-p:length>
		</xsl:if>
		<xsl:if test="@type = 'distanceBetween'">
			<vra-p:distanceBetween>
				<rdf:Description>
					<rdf:type rdf:resource="http://schema.org/QuantitativeValue" />
					<schema:value>
						<xsl:value-of select="." />
					</schema:value>
					<xsl:if test="@unit = 'in'">
						<schema:unitCode>
							<xsl:text>INH</xsl:text>
						</schema:unitCode>
					</xsl:if>
					<xsl:if test="@unit = 'cm'">
						<schema:unitCode>
							<xsl:text>CMT</xsl:text>
						</schema:unitCode>
					</xsl:if>
					<xsl:if test="@unit = 'ft'">
						<schema:unitCode>
							<xsl:text>FOT</xsl:text>
						</schema:unitCode>
					</xsl:if>
					<xsl:if test="@unit = 'm'">
						<schema:unitCode>
							<xsl:text>MTR</xsl:text>
						</schema:unitCode>
					</xsl:if>
					<xsl:if test="@unit = 'yd'">
						<schema:unitCode>
							<xsl:text>YRD</xsl:text>
						</schema:unitCode>
					</xsl:if>
				</rdf:Description>
			</vra-p:distanceBetween>
		</xsl:if>
		<xsl:if test="@type = 'diameter'">
			<vra-p:diameter>
				<rdf:Description>
					<rdf:type rdf:resource="http://schema.org/QuantitativeValue" />
					<schema:value>
						<xsl:value-of select="." />
					</schema:value>
					<xsl:if test="@unit = 'in'">
						<schema:unitCode>
							<xsl:text>INH</xsl:text>
						</schema:unitCode>
					</xsl:if>
					<xsl:if test="@unit = 'cm'">
						<schema:unitCode>
							<xsl:text>CMT</xsl:text>
						</schema:unitCode>
					</xsl:if>
					<xsl:if test="@unit = 'ft'">
						<schema:unitCode>
							<xsl:text>FOT</xsl:text>
						</schema:unitCode>
					</xsl:if>
					<xsl:if test="@unit = 'm'">
						<schema:unitCode>
							<xsl:text>MTR</xsl:text>
						</schema:unitCode>
					</xsl:if>
					<xsl:if test="@unit = 'yd'">
						<schema:unitCode>
							<xsl:text>YRD</xsl:text>
						</schema:unitCode>
					</xsl:if>
				</rdf:Description>
			</vra-p:diameter>
		</xsl:if>
		<xsl:if test="@type = 'circumfrence'">
			<vra-p:circumfrence>
				<rdf:Description>
					<rdf:type rdf:resource="http://schema.org/QuantitativeValue" />
					<schema:value>
						<xsl:value-of select="." />
					</schema:value>
					<xsl:if test="@unit = 'in'">
						<schema:unitCode>
							<xsl:text>INH</xsl:text>
						</schema:unitCode>
					</xsl:if>
					<xsl:if test="@unit = 'cm'">
						<schema:unitCode>
							<xsl:text>CMT</xsl:text>
						</schema:unitCode>
					</xsl:if>
					<xsl:if test="@unit = 'ft'">
						<schema:unitCode>
							<xsl:text>FOT</xsl:text>
						</schema:unitCode>
					</xsl:if>
					<xsl:if test="@unit = 'm'">
						<schema:unitCode>
							<xsl:text>MTR</xsl:text>
						</schema:unitCode>
					</xsl:if>
					<xsl:if test="@unit = 'yd'">
						<schema:unitCode>
							<xsl:text>YRD</xsl:text>
						</schema:unitCode>
					</xsl:if>
				</rdf:Description>
			</vra-p:circumfrence>
		</xsl:if>
		<xsl:if test="@type = 'area'">
			<vra-p:area>
				<rdf:Description>
					<rdf:type rdf:resource="http://schema.org/QuantitativeValue" />
					<schema:value>
						<xsl:value-of select="." />
					</schema:value>
					<xsl:if test="@unit = 'in²'">
						<schema:unitCode>
							<xsl:text>INK</xsl:text>
						</schema:unitCode>
					</xsl:if>
					<xsl:if test="@unit = 'cm²'">
						<schema:unitCode>
							<xsl:text>CMK</xsl:text>
						</schema:unitCode>
					</xsl:if>
					<xsl:if test="@unit = 'ft²'">
						<schema:unitCode>
							<xsl:text>FTK</xsl:text>
						</schema:unitCode>
					</xsl:if>
					<xsl:if test="@unit = 'm²'">
						<schema:unitCode>
							<xsl:text>MTK</xsl:text>
						</schema:unitCode>
					</xsl:if>
					<xsl:if test="@unit = 'yd²'">
						<schema:unitCode>
							<xsl:text>YDK</xsl:text>
						</schema:unitCode>
					</xsl:if>
				</rdf:Description>
			</vra-p:area>
		</xsl:if>
		<xsl:if test="@type = 'weight'">
			<schema:weight>
				<rdf:Description>
					<rdf:type rdf:resource="http://schema.org/QuantitativeValue" />
					<schema:value>
						<xsl:value-of select="." />
					</schema:value>
					<xsl:if test="@unit = 'mg'">
						<schema:unitCode>
							<xsl:text>MGM</xsl:text>
						</schema:unitCode>
					</xsl:if>
					<xsl:if test="@unit = 'g'">
						<schema:unitCode>
							<xsl:text>GRM</xsl:text>
						</schema:unitCode>
					</xsl:if>
					<xsl:if test="@unit = 'kg'">
						<schema:unitCode>
							<xsl:text>KGM</xsl:text>
						</schema:unitCode>
					</xsl:if>
					<xsl:if test="@unit = 't'">
						<schema:unitCode>
							<xsl:text>TNE</xsl:text>
						</schema:unitCode>
					</xsl:if>
					<xsl:if test="@unit = 'oz'">
						<schema:unitCode>
							<xsl:text>ONZ</xsl:text>
						</schema:unitCode>
					</xsl:if>
					<xsl:if test="@unit = 'lb'">
						<schema:unitCode>
							<xsl:text>LBR</xsl:text>
						</schema:unitCode>
					</xsl:if>
					<xsl:if test="@unit = 'ton (US)'">
						<schema:unitCode>
							<xsl:text>STN</xsl:text>
						</schema:unitCode>
					</xsl:if>
				</rdf:Description>
			</schema:weight>
		</xsl:if>
		<xsl:if test="@type = 'duration'">
			<vra-p:duration>
				<rdf:Description>
					<rdf:type rdf:resource="http://schema.org/QuantitativeValue" />
					<schema:value>
						<xsl:value-of select="." />
					</schema:value>
					<xsl:if test="@unit = 's'">
						<schema:unitCode>
							<xsl:text>SEC</xsl:text>
						</schema:unitCode>
					</xsl:if>
					<xsl:if test="@unit = 'min'">
						<schema:unitCode>
							<xsl:text>MIN</xsl:text>
						</schema:unitCode>
					</xsl:if>
					<xsl:if test="@unit = 'h'">
						<schema:unitCode>
							<xsl:text>HUR</xsl:text>
						</schema:unitCode>
					</xsl:if>
					<xsl:if test="@unit = 'd'">
						<schema:unitCode>
							<xsl:text>DAY</xsl:text>
						</schema:unitCode>
					</xsl:if>
					<xsl:if test="@unit = 'wk'">
						<schema:unitCode>
							<xsl:text>WEE</xsl:text>
						</schema:unitCode>
					</xsl:if>
					<xsl:if test="@unit = 'mo'">
						<schema:unitCode>
							<xsl:text>MON</xsl:text>
						</schema:unitCode>
					</xsl:if>
					<xsl:if test="@unit = 'a'">
						<schema:unitCode>
							<xsl:text>ANN</xsl:text>
						</schema:unitCode>
					</xsl:if>
				</rdf:Description>
			</vra-p:duration>
		</xsl:if>
		<xsl:if test="@type = 'runningTime'">
			<vra-p:runningTime>
				<rdf:Description>
					<rdf:type rdf:resource="http://schema.org/QuantitativeValue" />
					<schema:value>
						<xsl:value-of select="." />
					</schema:value>
					<xsl:if test="@unit = 's'">
						<schema:unitCode>
							<xsl:text>SEC</xsl:text>
						</schema:unitCode>
					</xsl:if>
					<xsl:if test="@unit = 'min'">
						<schema:unitCode>
							<xsl:text>MIN</xsl:text>
						</schema:unitCode>
					</xsl:if>
					<xsl:if test="@unit = 'h'">
						<schema:unitCode>
							<xsl:text>HUR</xsl:text>
						</schema:unitCode>
					</xsl:if>
					<xsl:if test="@unit = 'd'">
						<schema:unitCode>
							<xsl:text>DAY</xsl:text>
						</schema:unitCode>
					</xsl:if>
					<xsl:if test="@unit = 'wk'">
						<schema:unitCode>
							<xsl:text>WEE</xsl:text>
						</schema:unitCode>
					</xsl:if>
					<xsl:if test="@unit = 'mo'">
						<schema:unitCode>
							<xsl:text>MON</xsl:text>
						</schema:unitCode>
					</xsl:if>
					<xsl:if test="@unit = 'a'">
						<schema:unitCode>
							<xsl:text>ANN</xsl:text>
						</schema:unitCode>
					</xsl:if>
				</rdf:Description>
			</vra-p:runningTime>
		</xsl:if>
		<xsl:if test="@type = 'count'">
			<schema:inventoryLevel>
				<rdf:Description>
					<rdf:type rdf:resource="http://schema.org/QuantitativeValue" />
					<schema:value>
						<xsl:value-of select="." />
					</schema:value>
				</rdf:Description>
			</schema:inventoryLevel>
		</xsl:if>
		<xsl:if test="@type = 'bitDepth'">
			<schema:bitrate>
					<xsl:value-of select="." />
					<xsl:text>" "</xsl:text>
					<xsl:value-of select="@unit" />
			</schema:bitrate>
		</xsl:if>
		<xsl:if test="@type = 'fileSize'">
			<schema:contentSize>
					<xsl:value-of select="." />
					<xsl:text>" "</xsl:text>
					<xsl:value-of select="@unit" />
			</schema:contentSize>
		</xsl:if>
		<xsl:if test="@type = 'resolution'">
			<vra-p:resolution>
					<xsl:value-of select="." />
					<xsl:text>" "</xsl:text>
					<xsl:value-of select="@unit" />
			</vra-p:resolution>
		</xsl:if>
	</xsl:template>
	
	<!-- Rights Templates -->
	<xsl:template match="vc:rightsSet">
		<xsl:choose>
			<xsl:when test="not(vc:rights/node())">
				<dcterms:rights>
					<rdf:Description>
						<rdfs:label>
							<xsl:value-of select="vc:display" />
						</rdfs:label>
					</rdf:Description>
				</dcterms:rights>
			</xsl:when>
			<xsl:otherwise>
				<dcterms:rights>
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:text>http://purl.org/rights/</xsl:text>
							<xsl:value-of select="vc:rights/@type"/>
						</xsl:attribute>
						<xsl:value-of select="vc:rights/vc:text" />
					</rdf:Description>
				</dcterms:rights>
				<schema:copyrightHolder>
					<rdf:Description>
						<rdf:type rdf:resource="http://xmlns.org/foaf/0.1/Agent" />	
						<schema:name>
							<xsl:value-of select="vc:rights/vc:rightsHolder" />
						</schema:name>
					</rdf:Description>
				</schema:copyrightHolder>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<!-- Inscription templates -->
	<xsl:template match="vc:inscriptionSet">
		<xsl:choose>
			<xsl:when test="not(vc:inscription/vc:author/node())">
				<vra-p:hasInscription>
					<rdf:Description>
					<rdf:type rdf:resource="http://schema.org/CreativeWork" />
					<rdf:type rdf:resource="http://schema.org/Inscription" />
					<schema:description>
						<xsl:value-of select="vc:display"/>
					</schema:description>
					</rdf:Description>
				</vra-p:hasInscription>
			</xsl:when>
			<xsl:otherwise>
				<xsl:apply-templates select="vc:inscription"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template match="vc:inscription">
		<xsl:choose>
			<xsl:when test="vc:author/@vocab = 'LCSAF'">
				<vra-p:hasInscription>
				<rdf:Description>
					<rdf:type rdf:resource="http://schema.org/CreativeWork" />
					<rdf:type rdf:resource="http://purl.org/vra/Inscription" />
					<vra-p:position>
						<xsl:value-of select="vc:position"/>
					</vra-p:position>
					<vra-p:signiture>
						<xsl:value-of select="vc:signiture"/>
					</vra-p:signiture>
					<schema:text>
						<xsl:value-of select="vc:text"/>
					</schema:text>
					<vra-p:mark>
						<xsl:value-of select="vc:mark"/>
					</vra-p:mark>
					<vra-p:caption>
						<xsl:value-of select="vc:caption"/>
					</vra-p:caption>
					<vra-p:translation>
						<xsl:value-of select="vc:translation"/>
					</vra-p:translation>
					<schema:dateCreated>
						<xsl:value-of select="vc:date"/>
					</schema:dateCreated>
					<schema:author>
						<rdf:Description>
						<xsl:attribute name="rdf:about">
								<xsl:text>http://id.loc.gov/authorities/subjects/</xsl:text>
								<xsl:value-of select="translate(@refid,' ','')"/>
						</xsl:attribute>
					<rdf:type rdf:resource="http://xmlns.org/foaf/0.1/Agent" />	
					<schema:name>
						<xsl:value-of select="vc:author"/>
					</schema:name>	
					</rdf:Description>	
					</schema:author>
				</rdf:Description>
				</vra-p:hasInscription>
			</xsl:when>
			<xsl:when test="@vocab = 'LCNAF'">
				<vra-p:hasInscription>
				<rdf:Description>
					<rdf:type rdf:resource="http://schema.org/CreativeWork" />
					<rdf:type rdf:resource="http://purl.org/vra/Inscription" />
					<vra-p:position>
						<xsl:value-of select="vc:position"/>
					</vra-p:position>
					<vra-p:signiture>
						<xsl:value-of select="vc:signiture"/>
					</vra-p:signiture>
					<schema:text>
						<xsl:value-of select="vc:text"/>
					</schema:text>
					<vra-p:mark>
						<xsl:value-of select="vc:mark"/>
					</vra-p:mark>
					<vra-p:caption>
						<xsl:value-of select="vc:caption"/>
					</vra-p:caption>
					<vra-p:translation>
						<xsl:value-of select="vc:translation"/>
					</vra-p:translation>
					<schema:dateCreated>
						<xsl:value-of select="vc:date"/>
					</schema:dateCreated>
					<schema:author>
						<rdf:Description>
						<xsl:attribute name="rdf:about">
								<xsl:text>http://id.loc.gov/authorities/names/</xsl:text>
								<xsl:value-of select="translate(@refid,' ','')"/>
						</xsl:attribute>
					<rdf:type rdf:resource="http://xmlns.org/foaf/0.1/Agent" />	
					<schema:name>
						<xsl:value-of select="vc:author"/>
					</schema:name>	
					</rdf:Description>	
					</schema:author>
				</rdf:Description>
				</vra-p:hasInscription>
			</xsl:when>
			<xsl:when test="@vocab = 'LCTGM'">
				<vra-p:hasInscription>
				<rdf:Description>
					<rdf:type rdf:resource="http://schema.org/CreativeWork" />
					<rdf:type rdf:resource="http://purl.org/vra/Inscription" />
					<vra-p:position>
						<xsl:value-of select="vc:position"/>
					</vra-p:position>
					<vra-p:signiture>
						<xsl:value-of select="vc:signiture"/>
					</vra-p:signiture>
					<schema:text>
						<xsl:value-of select="vc:text"/>
					</schema:text>
					<vra-p:mark>
						<xsl:value-of select="vc:mark"/>
					</vra-p:mark>
					<vra-p:caption>
						<xsl:value-of select="vc:caption"/>
					</vra-p:caption>
					<vra-p:translation>
						<xsl:value-of select="vc:translation"/>
					</vra-p:translation>
					<schema:dateCreated>
						<xsl:value-of select="vc:date"/>
					</schema:dateCreated>
					<schema:author>
						<rdf:Description>
						<xsl:attribute name="rdf:about">
								<xsl:text>http://id.loc.gov/vocabulary/graphicMaterials/</xsl:text>
								<xsl:value-of select="translate(@refid,' ','')"/>
						</xsl:attribute>
					<rdf:type rdf:resource="http://xmlns.org/foaf/0.1/Agent" />	
					<schema:name>
						<xsl:value-of select="vc:author"/>
					</schema:name>	
					</rdf:Description>	
					</schema:author>
				</rdf:Description>
				</vra-p:hasInscription>
			</xsl:when>
			<xsl:when test="@vocab = 'TGN'">
				<vra-p:hasInscription>
				<rdf:Description>
					<rdf:type rdf:resource="http://schema.org/CreativeWork" />
					<rdf:type rdf:resource="http://purl.org/vra/Inscription" />
					<vra-p:position>
						<xsl:value-of select="vc:position"/>
					</vra-p:position>
					<vra-p:signiture>
						<xsl:value-of select="vc:signiture"/>
					</vra-p:signiture>
					<schema:text>
						<xsl:value-of select="vc:text"/>
					</schema:text>
					<vra-p:mark>
						<xsl:value-of select="vc:mark"/>
					</vra-p:mark>
					<vra-p:caption>
						<xsl:value-of select="vc:caption"/>
					</vra-p:caption>
					<vra-p:translation>
						<xsl:value-of select="vc:translation"/>
					</vra-p:translation>
					<schema:dateCreated>
						<xsl:value-of select="vc:date"/>
					</schema:dateCreated>
					<schema:author>
					<rdf:Description>
							<xsl:attribute name="rdf:about">
								<xsl:text>http://vocab.getty.edu/tgn/</xsl:text>
								<xsl:value-of select="@refid"/>
							</xsl:attribute>
					<rdf:type rdf:resource="http://xmlns.org/foaf/0.1/Agent" />	
					<schema:name>
						<xsl:value-of select="vc:author"/>
					</schema:name>	
					</rdf:Description>	
					</schema:author>
				</rdf:Description>
				</vra-p:hasInscription>
			</xsl:when>
			<xsl:when test="@vocab = 'AAT'">
				<vra-p:hasInscription>
				<rdf:Description>
					<rdf:type rdf:resource="http://schema.org/CreativeWork" />
					<rdf:type rdf:resource="http://purl.org/vra/Inscription" />
					<vra-p:position>
						<xsl:value-of select="vc:position"/>
					</vra-p:position>
					<vra-p:signiture>
						<xsl:value-of select="vc:signiture"/>
					</vra-p:signiture>
					<schema:text>
						<xsl:value-of select="vc:text"/>
					</schema:text>
					<vra-p:mark>
						<xsl:value-of select="vc:mark"/>
					</vra-p:mark>
					<vra-p:caption>
						<xsl:value-of select="vc:caption"/>
					</vra-p:caption>
					<vra-p:translation>
						<xsl:value-of select="vc:translation"/>
					</vra-p:translation>
					<schema:dateCreated>
						<xsl:value-of select="vc:date"/>
					</schema:dateCreated>
					<schema:author>
					<rdf:Description>
							<xsl:attribute name="rdf:about">
								<xsl:text>http://vocab.getty.edu/aat/</xsl:text>
								<xsl:value-of select="@refid"/>
							</xsl:attribute>
					<rdf:type rdf:resource="http://xmlns.org/foaf/0.1/Agent" />	
					<schema:name>
						<xsl:value-of select="vc:author"/>
					</schema:name>	
					</rdf:Description>	
					</schema:author>
				</rdf:Description>
				</vra-p:hasInscription>
			</xsl:when>
			<xsl:when test="@vocab = 'ULAN'">
				<vra-p:hasInscription>
				<rdf:Description>
					<rdf:type rdf:resource="http://schema.org/CreativeWork" />
					<rdf:type rdf:resource="http://purl.org/vra/Inscription" />
					<vra-p:position>
						<xsl:value-of select="vc:position"/>
					</vra-p:position>
					<vra-p:signiture>
						<xsl:value-of select="vc:signiture"/>
					</vra-p:signiture>
					<schema:text>
						<xsl:value-of select="vc:text"/>
					</schema:text>
					<vra-p:mark>
						<xsl:value-of select="vc:mark"/>
					</vra-p:mark>
					<vra-p:caption>
						<xsl:value-of select="vc:caption"/>
					</vra-p:caption>
					<vra-p:translation>
						<xsl:value-of select="vc:translation"/>
					</vra-p:translation>
					<schema:dateCreated>
						<xsl:value-of select="vc:date"/>
					</schema:dateCreated>
					<schema:author>
					<rdf:Description>
							<xsl:attribute name="rdf:about">
								<xsl:text>http://vocab.getty.edu/aat/</xsl:text>
								<xsl:value-of select="@refid"/>
							</xsl:attribute>
					<rdf:type rdf:resource="http://xmlns.org/foaf/0.1/Agent" />	
					<schema:name>
						<xsl:value-of select="vc:author"/>
					</schema:name>	
					</rdf:Description>	
					</schema:author>
				</rdf:Description>
				</vra-p:hasInscription>
			</xsl:when>
			<xsl:otherwise>
				<vra-p:hasInscription>
				<rdf:Description>
					<rdf:type rdf:resource="http://schema.org/CreativeWork" />
					<rdf:type rdf:resource="http://purl.org/vra/Inscription" />
					<vra-p:position>
						<xsl:value-of select="vc:position"/>
					</vra-p:position>
					<vra-p:signiture>
						<xsl:value-of select="vc:signiture"/>
					</vra-p:signiture>
					<schema:text>
						<xsl:value-of select="vc:text"/>
					</schema:text>
					<vra-p:mark>
						<xsl:value-of select="vc:mark"/>
					</vra-p:mark>
					<vra-p:caption>
						<xsl:value-of select="vc:caption"/>
					</vra-p:caption>
					<vra-p:translation>
						<xsl:value-of select="vc:translation"/>
					</vra-p:translation>
					<schema:dateCreated>
						<xsl:value-of select="vc:date"/>
					</schema:dateCreated>
					<schema:author>
					<rdf:Description>
					<rdf:type rdf:resource="http://xmlns.org/foaf/0.1/Agent" />	
					<schema:name>
						<xsl:value-of select="vc:author"/>
					</schema:name>	
					</rdf:Description>	
					</schema:author>
				</rdf:Description>
				</vra-p:hasInscription>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
<!-- WorkType template -->
	<xsl:template match="vc:worktypeSet" mode="workType">
		<xsl:apply-templates select="vc:worktype" mode="workType"/>
	</xsl:template>
	
	<xsl:template match="vc:worktype" mode="workType">
		<xsl:if test="@vocab = 'AAT'">
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:text>http://vocab.getty.edu/aat/</xsl:text>
					<xsl:value-of select="@refid"/>
				</xsl:attribute>
			</rdf:type>
		</xsl:if>
		<xsl:if test="@vocab = 'ULAN'">
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:text>http://vocab.getty.edu/ulan/</xsl:text>
					<xsl:value-of select="@refid"/>
				</xsl:attribute>
			</rdf:type>
		</xsl:if>
		<xsl:if test="@vocab = 'TGN'">
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:text>http://vocab.getty.edu/tgn/</xsl:text>
					<xsl:value-of select="@refid"/>
				</xsl:attribute>
			</rdf:type>
		</xsl:if>
		<xsl:if test="@vocab = 'LCSAF'">
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:text>http://id.loc.gov/authorities/subjects/</xsl:text>
					<xsl:value-of select="translate(@refid,' ','')"/>
				</xsl:attribute>
			</rdf:type>
		</xsl:if>
		<xsl:if test="@vocab = 'LCNAF'">
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:text>http://id.loc.gov/authorities/names/</xsl:text>
					<xsl:value-of select="translate(@refid,' ','')"/>
				</xsl:attribute>	
			</rdf:type>
		</xsl:if>
		<xsl:if test="@vocab = 'LCTGM'">
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:text>http://id.loc.gov/vocabulary/graphicMaterials/</xsl:text>
					<xsl:value-of select="translate(@refid,' ','')"/>
				</xsl:attribute>
			</rdf:type>
		</xsl:if>
	</xsl:template>
	
<!-- Catch remainder templates -->	
	<xsl:template match="*">
		<xsl:comment>
			<xsl:text>Skipping over </xsl:text>
			<xsl:value-of select="name()"/>
		</xsl:comment>
		<xsl:apply-templates />
	</xsl:template>
	
	<xsl:template match="@*|text()">
		<xsl:comment>
			<xsl:text>Skipping over </xsl:text>
			<xsl:value-of select="."/>
		</xsl:comment>
	</xsl:template>

</xsl:stylesheet>
