SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [RDF.].[Triple](
	[TripleID] [bigint] IDENTITY(1,1) NOT NULL,
	[Subject] [bigint] NOT NULL,
	[Predicate] [bigint] NOT NULL,
	[Object] [bigint] NOT NULL,
	[TripleHash] [binary](20) NOT NULL,
	[Weight] [float] NOT NULL,
	[Reitification] [bigint] NULL,
	[ObjectType] [bit] NULL,
	[SortOrder] [int] NULL,
	[ViewSecurityGroup] [bigint] NULL,
	[Graph] [bigint] NULL,
 CONSTRAINT [PK_Triple] PRIMARY KEY NONCLUSTERED 
(
	[TripleID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE CLUSTERED INDEX [idx_SPO] ON [RDF.].[Triple] 
(
	[Subject] ASC,
	[Predicate] ASC,
	[Object] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [idx_O] ON [RDF.].[Triple] 
(
	[Object] ASC
)
INCLUDE ( [ViewSecurityGroup],
[Subject],
[Predicate],
[Weight]) WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [idx_POS] ON [RDF.].[Triple] 
(
	[Predicate] ASC,
	[Object] ASC,
	[Subject] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [idx_Reitification] ON [RDF.].[Triple] 
(
	[Reitification] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [idx_triple_nc_predicate] ON [RDF.].[Triple] 
(
	[Predicate] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [idx_TripleHash] ON [RDF.].[Triple] 
(
	[TripleHash] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [idx_TripleObjectType] ON [RDF.].[Triple] 
(
	[ObjectType] ASC
)
INCLUDE ( [TripleID],
[Subject],
[Predicate],
[Object],
[TripleHash],
[Weight],
[Reitification],
[SortOrder],
[ViewSecurityGroup],
[Graph]) WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [idx_TriplePredicate] ON [RDF.].[Triple] 
(
	[Predicate] ASC
)
INCLUDE ( [TripleID],
[Subject],
[Object],
[TripleHash],
[Weight],
[Reitification],
[ObjectType],
[SortOrder],
[ViewSecurityGroup],
[Graph]) WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [idx_TriplePredicateReitification] ON [RDF.].[Triple] 
(
	[Predicate] ASC,
	[Reitification] ASC
)
INCLUDE ( [Subject],
[Object]) WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [missing_index_73037] ON [RDF.].[Triple] 
(
	[Predicate] ASC,
	[Reitification] ASC
)
INCLUDE ( [Subject],
[Object]) WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [missing_index_73079] ON [RDF.].[Triple] 
(
	[Predicate] ASC
)
INCLUDE ( [TripleID],
[Subject],
[Object],
[TripleHash],
[Weight],
[Reitification],
[ObjectType],
[SortOrder],
[ViewSecurityGroup],
[Graph]) WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [missing_index_73181] ON [RDF.].[Triple] 
(
	[ObjectType] ASC
)
INCLUDE ( [TripleID],
[Subject],
[Predicate],
[Object],
[TripleHash],
[Weight],
[Reitification],
[SortOrder],
[ViewSecurityGroup],
[Graph]) WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
