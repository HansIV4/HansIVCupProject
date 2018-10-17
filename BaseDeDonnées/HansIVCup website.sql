
USE master
IF EXISTS(select * from sys.databases where name='DBHansIVCupCompet')
DROP DATABASE DBHansIVCupCompet
GO

CREATE DATABASE DBHansIVCupCompet
GO

USE DBHansIVCupCompet
GO


--	--------------------------------------------
IF OBJECT_ID ('tblJoueur') IS NOT NULL
DROP TABLE tblJoueur
GO
CREATE TABLE tblJoueur
(
	idJoueur		INT					NOT NULL IDENTITY(1,1) UNIQUE,
	idDiscord		varchar (50)		NOT NULL,
	pseudoUplay		varchar (30)		NOT NULL,
	pseudoDiscord	varchar (30)		NOT NULL,
	noPseudoDiscord	varchar	(5)			NOT NUll,
	email			varchar (50)		NULL UNIQUE, 
	PRIMARY KEY (idJoueur)
)

GO

--	--------------------------------------------
IF OBJECT_ID ('tblTeam') IS NOT NULL
DROP TABLE tblTeam
GO
CREATE TABLE tblTeam
(
	idTeam		INT				NOT NULL IDENTITY(1,1) UNIQUE,
	nomTeam		varchar (50)	NOT NULL UNIQUE,
	idRegion	INT				NOT NULL,
	PRIMARY KEY (idTeam)
)


GO

--	--------------------------------------------
IF OBJECT_ID ('tblRegionTeam') IS NOT NULL
DROP TABLE tblRegionTeam
GO
CREATE TABLE tblRegionTeam
(
	idRegion	INT				NOT NULL IDENTITY(1,1) UNIQUE,
	nomRegion	VARCHAR(25)		NOT NULL UNIQUE,
	PRIMARY KEY (idRegion)
)

GO


--	--------------------------------------------
IF OBJECT_ID ('tblJoueurTeam') IS NOT NULL
DROP TABLE tblJoueurTeam
GO
CREATE TABLE tblJoueurTeam
(
	idMembreTeam		INT			NOT NULL IDENTITY(1,1) UNIQUE,
	idTeam				INT			NOT NULL,
	idJoueur			INT			NOT NULL,
	idRoleTeam			INT			NOT NULL,
	PRIMARY KEY (idMembreTeam)
)


--	--------------------------------------------
IF OBJECT_ID ('tblRoleMembreTeam') IS NOT NULL
DROP TABLE tblRoleMembreTeam
GO
create table tblRoleMembreTeam
(
	idRole	INT				NOT NULL	IDENTITY(1,1),
	nomRole	varchar (50)	NOT NULL,
	PRIMARY KEY (idRole)
)

GO


--	--------------------------------------------
IF OBJECT_ID ('tblSaison') IS NOT NULL
DROP TABLE tblSaison
GO
CREATE TABLE tblSaison
(
	idSaison			INT				NOT NULL IDENTITY(1,1) UNIQUE,
	NomSaison			VARCHAR (30)	NOT NULL,
	dateDebutSaison		Date			NOT NULL,
	dateFinSaison		Date			NOT NULL,
	PRIMARY KEY (idSaison)
)

GO

--	--------------------------------------------
IF OBJECT_ID ('tblTeamParticipeSaison') IS NOT NULL
DROP TABLE tblTeamParticipeSaison
GO
CREATE TABLE tblTeamParticipeSaison
(
	idInscriptionSaison			INT		NOT NULL IDENTITY(1,1) UNIQUE,
	idTeam						INT		NOT NULL,
	idSaison					INT		NOT NULL,
	ptsTeam						INT		NOT NULL,
	inscriptionActive			BIT		NOT NULL,
	PRIMARY KEY (idInscriptionSaison)
)

GO

--	-------------------------------------------- rendu ici pour les fk
IF OBJECT_ID ('tblBestOfTrois') IS NOT NULL
DROP TABLE tblBestOfTrois
GO
CREATE TABLE tblBestOfTrois
(
	idBO3						INT		NOT NULL IDENTITY(1,1) UNIQUE,
	dateHeureDebutBO3			DATETIME NOT NULL,
	idCauseFinBO3				INT,
	idSaison					INT		NOT NULL,
	PRIMARY KEY (idBO3)
)

GO

--	--------------------------------------------
IF OBJECT_ID ('tblcartes') IS NOT NULL
DROP TABLE tblcartes
GO
CREATE TABLE tblcartes
(
	idCarte		INT		NOT NULL IDENTITY(1,1) UNIQUE,
	nomCarte	INT		NOT NULL,
	PRIMARY KEY (idCarte)
)

GO

--	--------------------------------------------
IF OBJECT_ID ('tblPartie') IS NOT NULL
DROP TABLE tblPartie
GO
CREATE TABLE tblPartie
(
	idPartie				INT		NOT NULL IDENTITY(1,1) UNIQUE,
	idMap					INT		NOT NULL,
	devaitEtreJouee			INT, --dans le cas d'un best of 3 si les points sont de 2-0 la 3e partie n'est pas jouée
	idBO3					INT,
	PRIMARY KEY (idPartie)
)

GO

--	--------------------------------------------
IF OBJECT_ID ('tblJoueurTeamParticipeBO3') IS NOT NULL
DROP TABLE tblJoueurTeamParticipeBO3
GO
CREATE TABLE tblJoueurTeamParticipeBO3
(
	idParticipant			INT		NOT NULL IDENTITY(1,1) UNIQUE,
	idJoueur				INT		NOT NULL,
	idTeam					INT		NOT NULL,
	idBO3					INT		NOT NULL,
	participationConfirmee	BIT		NOT NULL,

	PRIMARY KEY (idParticipant)
)

GO

--	--------------------------------------------
IF OBJECT_ID ('tblEquipeParticipeBO3') IS NOT NULL
DROP TABLE tblEquipeParticipeBO3
GO
CREATE TABLE tblEquipeParticipeBO3
(
	idParticipationBo3		INT		NOT NULL IDENTITY(1,1),
	idBo3					INT		NOT NULL,
	idTeam					INT		NOT NULL,

	PRIMARY KEY (idParticipationBo3)
)

GO


--	--------------------------------------------
IF OBJECT_ID ('tblCauseFinBo3') IS NOT NULL
DROP TABLE tblCauseFinBo3
GO
CREATE TABLE tblCauseFinBo3
(
	idCauseFinBo3			INT		NOT NULL	IDENTITY(1,1) UNIQUE,
	causeFinBo3				varchar	NOT NULL	UNIQUE, 

	PRIMARY KEY (idCauseFinBo3)
)

GO

--	--------------------------------------------
IF OBJECT_ID ('tblTeamParticipePartie') IS NOT NULL
DROP TABLE tblTeamParticipePartie
GO
CREATE TABLE tblTeamParticipePartie
(
	idParticipationTeamPartie			INT		NOT NULL	IDENTITY(1,1) UNIQUE,
	idPartie							INT		NOT NULL,
	idTeam								INT		NOT NULL,
	nbrePts								INT, 

	PRIMARY KEY (idParticipationTeamPartie)
)

GO

ALTER TABLE tblTeam
ADD FOREIGN KEY (idRegion) REFERENCES tblRegionTeam (idRegion)


ALTER TABLE tblJoueurTeam
ADD FOREIGN KEY (idTeam) REFERENCES tblTeam (idTeam)

ALTER TABLE tblJoueurTeam
ADD FOREIGN KEY (idJoueur) REFERENCES tblJoueur (idJoueur)

ALTER TABLE tblJoueurTeam
ADD FOREIGN KEY (idRoleTeam) REFERENCES tblRoleMembreTeam (idRole)

ALTER TABLE tblTeamParticipeSaison
ADD FOREIGN KEY (idSaison) REFERENCES tblSaison (idSaison)

ALTER TABLE tblTeamParticipeSaison
ADD FOREIGN KEY (idTeam) REFERENCES tblTeam (idTeam)

ALTER TABLE tblBestOfTrois
ADD FOREIGN KEY (idSaison) REFERENCES tblSaison (idSaison)

ALTER TABLE tblBestOfTrois
ADD FOREIGN KEY (idCauseFinBO3) REFERENCES tblCauseFinBo3 (idCauseFinBo3)

ALTER TABLE tblPartie
ADD FOREIGN KEY (idMap) REFERENCES tblCartes (idCarte)

ALTER TABLE tblEquipeParticipeBO3
ADD FOREIGN KEY (idBo3) REFERENCES tblBestOfTrois (idBO3)

ALTER TABLE tblEquipeParticipeBO3
ADD FOREIGN KEY (idTeam) REFERENCES tblTeam (IdTeam)

ALTER TABLE tblPartie
ADD FOREIGN KEY	(idBO3) REFERENCES tblBestOfTrois (idBO3)

ALTER TABLE tblJoueurTeamParticipeBO3
ADD FOREIGN KEY (idJoueur) REFERENCES tblJoueur (idJoueur)

ALTER TABLE tblJoueurTeamParticipeBO3
ADD FOREIGN KEY (idTeam) REFERENCES tblTeam (idTeam)

ALTER TABLE tblJoueurTeamParticipeBO3
ADD FOREIGN KEY (idBO3) REFERENCES tblBestOfTrois (idBO3)

ALTER TABLE tblTeamParticipePartie
ADD FOREIGN KEY (idPartie) REFERENCES tblPartie (idPartie)

ALTER TABLE tblTeamParticipePartie
ADD FOREIGN KEY (idTeam) REFERENCES tblTeam (idTeam)

SET IDENTITY_INSERT [tblJoueur] ON
insert into tblJoueur	(	idJoueur	,	idDiscord	,		pseudoUplay			,		pseudoDiscord			,	noPseudoDiscord		,	email							)	VALUES			
						(	1			,	1			,		'Boardisenti' 		,		'Boardisenti' 			,	1111				,	'Boardisenti@gmail.com'			)	,
						(	2			,	2			,		'BuffBulletin'		,		'BuffBulletin' 			,	1112				,	'BuffBulletin@gmail.com'		)	,
						(	3			,	3			,		'Chiviorb' 			,		'Chiviorb' 				,	1113				,	'Chiviorb@gmail.com'			)	,
						(	4			,	4			,		'Coulumba' 			,		'Coulumba' 				,	1114				,	'Coulumba@gmail.com'			)	,
						(	5			,	5			,		'Craziiztel'		,		'Craziiztel'			,	1115				,	'Craziiztel@gmail.com'			)	,
						(	6			,	6			,		'Cyberload'			,		'Cyberload' 			,	1116				,	'Cyberload@gmail.com'			)	,
						(	7			,	7			,		'Dressorit' 		,		'Dressorit' 			,	1117				,	'Dressorit @gmail.com'			)	,
						(	8			,	8			,		'ExclusiveSuper' 	,		'ExclusiveSuper'		,	1118				,	'ExclusiveSuper @gmail.com'		)	,
						(	9			,	9			,		'Freshentu' 		,		'Freshentu' 			,	1119				,	'Freshentu @gmail.com'			)	,
						(	10			,	10			,		'Friendlynn' 		,		'Friendlynn' 			,	1120				,	'Friendlynn @gmail.com'			)	,
						(	11			,	11			,		'Funfellig' 		,		'Funfellig' 			,	1121				,	'Funfellig @gmail.com'			)	,
						(	12			,	12			,		'Grandenti' 		,		'Grandenti' 			,	1122				,	'Grandenti @gmail.com'			)	,
						(	13			,	13			,		'HelpfulDeluxe' 	,		'HelpfulDeluxe' 		,	1123				,	'HelpfulDeluxe @gmail.com'		)	,
						(	14			,	14			,		'Indingre' 			,		'Indingre' 				,	1124				,	'Indingre @gmail.com'			)	,
						(	15			,	15			,		'Lawgionat' 		,		'Lawgionat' 			,	1125				,	'Lawgionat @gmail.com'			)	,
						(	16			,	16			,		'Likersikal' 		,		'Likersikal' 			,	1126				,	'Likersikal @gmail.com'			)	,
						(	17			,	17			,		'MelVander' 		,		'MelVander' 			,	1127				,	'MelVander @gmail.com'			)	,
						(	18			,	18			,		'Pinchurer' 		,		'Pinchurer' 			,	1128				,	'Pinchurer @gmail.com'			)	,
						(	19			,	19			,		'Prideennect' 		,		'Prideennect' 			,	1129				,	'Prideennect @gmail.com'		)	,
						(	20			,	20			,		'Psychtestin'		,		'Psychtestin' 			,	1130				,	'Psychtestin @gmail.com'		)	,
						(	21			,	21			,		'RipSoft' 			,		'RipSoft' 				,	1131				,	'RipSoft @gmail.com'			)	,
						(	22			,	22			,		'Safesper' 			,		'Safesper' 				,	1132				,	'Safesper @gmail.com'			)	,
						(	23			,	23			,		'Siganywog' 		,		'Siganywog' 			,	1133				,	'Siganywog @gmail.com'			)	,
						(	24			,	24			,		'SisterBadVamp' 	,		'SisterBadVamp' 		,	1134				,	'SisterBadVamp @gmail.com'		)	,
						(	25			,	25			,		'Slipkerva' 		,		'Slipkerva' 			,	1135				,	'Slipkerva @gmail.com'			)	,
						(	26			,	26			,		'Socialdryd' 		,		'Socialdryd' 			,	1136				,	'Socialdryd @gmail.com'			)	,
						(	27			,	27			,		'Tercheal' 			,		'Tercheal' 				,	1137				,	'Tercheal @gmail.com'			)	,
						(	28			,	28			,		'Thinkmerkim'		,		'Thinkmerkim' 			,	1138				,	'Thinkmerkim @gmail.com'		)	,
						(	29			,	29			,		'TwoInvent' 		,		'TwoInvent' 			,	1139				,	'TwoInvent @gmail.com'			)	,
						(	30			,	30			,		'Acknoxon' 			,		'Acknoxon' 				,	1140				,	'Acknoxon @gmail.com'			)	,
						(	31			,	31			,		'Angeleefami'		,		'Angeleefami' 			,	1141				,	'Angeleefami @gmail.com'		)	,
						(	32			,	32			,		'Animiss' 			,		'Animiss' 				,	1142				,	'Animiss @gmail.com'			)	,
						(	33			,	33			,		'ApenguinYoung' 	,		'ApenguinYoung' 		,	1143				,	'ApenguinYoung @gmail.com'		)	,
						(	34			,	34			,		'Arsenalso' 		,		'Arsenalso' 			,	1144				,	'Arsenalso @gmail.com'			)	,
						(	35			,	35			,		'Dasherlow' 		,		'Dasherlow' 			,	1145				,	'Dasherlow @gmail.com'			)	,
						(	36			,	36			,		'DressyChikPower'	,		'DressyChikPower' 		,	1146				,	'DressyChikPower @gmail.com'	)	,
						(	37			,	37			,		'EventsBoosh' 		,		'EventsBoosh' 			,	1147				,	'EventsBoosh @gmail.com'		)	,
						(	38			,	38			,		'Explane' 			,		'Explane' 				,	1148				,	'Explane @gmail.com'			)	,
						(	39			,	39			,		'EyeThrill' 		,		'EyeThrill' 			,	1149				,	'EyeThrill @gmail.com'			)	,
						(	40			,	40			,		'GreyAquatic' 		,		'GreyAquatic' 			,	1150				,	'GreyAquatic @gmail.com'		)	,
						(	41			,	41			,		'HipAlone' 			,		'HipAlone' 				,	1151				,	'HipAlone @gmail.com'			)	,
						(	42			,	42			,		'Incaners' 			,		'Incaners' 				,	1152				,	'Incaners @gmail.com'			)
SET IDENTITY_INSERT [tblJoueur] OFF



SET IDENTITY_INSERT [tblRegionTeam] ON
insert into tblRegionTeam	(	idRegion	,	nomRegion			)	VALUES	
							(	1			,	'Europe'			),
							(	2			,	'Amerique du Nord'	)
SET IDENTITY_INSERT [tblRegionTeam] OFF
		

SET IDENTITY_INSERT [tblTeam] ON									
insert into tblTeam	(	idTeam	,	nomTeam			,		idRegion	)	VALUES
					(	1		,	'Beonalac'		,		1			)	,
					(	2		,	'Bobbeadve'		,		2			)	,
					(	3		,	'Chardust'		,		1			)	,
					(	4		,	'Gurunthrey'	,		2			)	,
					(	5		,	'GoldWeaver'	,		1			)	,
					(	6		,	'Kathaired '	,		2			)	
					--(	7		,	'team7'		,		1			)	,
					--(	8		,	'team8'		,		2			)	,
					--(	9		,	'team9'		,		1			)	,
					--(	10		,	'team10'	,		2			)
SET IDENTITY_INSERT [tblTeam] OFF

SET IDENTITY_INSERT [tblRoleMembreTeam] ON
INSERT INTO tblRoleMembreTeam	(	idRole	,	nomRole			)	VALUES
								(	1		,	'Chef d"équipe'	)	,
								(	2		,	'Gérant'		)	,
								(	3		,	'Membre'		)
SET IDENTITY_INSERT [tblRoleMembreTeam] OFF


SET IDENTITY_INSERT [tblJoueurTeam] ON
insert into tblJoueurTeam	(	idMembreTeam	,	idTeam	,	idJoueur	,	idRoleTeam	)	VALUES
							(	1				,	1		,	1			,	1			)	,
							(	2				,	1		,	2			,	2			)	,
							(	3				,	1		,	3			,	2			)	,
							(	4				,	1		,	4			,	3			)	,
							(	5				,	1		,	5			,	3			)	,
							(	6				,	1		,	6			,	3			)	,
							(	7				,	1		,	7			,	3			)	,
							(	8				,	2		,	8			,	1			)	,
							(	9				,	2		,	9			,	2			)	,
							(	10				,	2		,	10			,	2			)	,
							(	11				,	2		,	11			,	3			)	,
							(	12				,	2		,	12			,	3			)	,
							(	13				,	2		,	13			,	3			)	,
							(	14				,	2		,	14			,	3			)	,
							(	15				,	3		,	15			,	1			)	,
							(	16				,	3		,	16			,	2			)	,
							(	17				,	3		,	17			,	2			)	,
							(	18				,	3		,	18			,	3			)	,
							(	19				,	3		,	19			,	3			)	,
							(	20				,	3		,	20			,	3			)	,
							(	21				,	3		,	21			,	3			)	,
							(	22				,	4		,	22			,	1			)	,
							(	23				,	4		,	23			,	2			)	,
							(	24				,	4		,	24			,	2			)	,
							(	25				,	4		,	25			,	3			)	,
							(	26				,	4		,	26			,	3			)	,
							(	27				,	4		,	27			,	3			)	,
							(	28				,	4		,	28			,	3			)	,
							(	29				,	5		,	29			,	1			)	,
							(	30				,	5		,	30			,	2			)	,
							(	31				,	5		,	31			,	2			)	,
							(	32				,	5		,	32			,	3			)	,
							(	33				,	5		,	33			,	3			)	,
							(	34				,	5		,	34			,	3			)	,
							(	35				,	5		,	35			,	3			)	,
							(	36				,	6		,	36			,	1			)	,
							(	37				,	6		,	37			,	2			)	,
							(	38				,	6		,	38			,	2			)	,
							(	39				,	6		,	39			,	3			)	,
							(	40				,	6		,	40			,	3			)	,
							(	41				,	6		,	41			,	3			)	,
							(	42				,	6		,	42			,	3			)	
SET IDENTITY_INSERT [tblJoueurTeam] OFF

SET IDENTITY_INSERT tblSaison ON
insert into tblSaison	(	idSaison	,	NomSaison	,	dateDebutSaison	,	dateFinSaison	)	VALUES
							(	11			,	'Grim Sky'	,	'2018-09-04'	,	'2018-01-09'	)
SET IDENTITY_INSERT tblSaison OFF

SET IDENTITY_INSERT tblTeamParticipeSaison ON
insert into tblTeamParticipeSaison	(	idInscriptionSaison	,	idTeam	,	idSaison	,	ptsTeam	,	inscriptionActive	)	VALUES
									(	1							,	1		,	11			,	1241	,	1					)	,
									(	2							,	2		,	11			,	1390	,	1					)	,
									(	3							,	3		,	11			,	1189	,	1					)	,
									(	4							,	4		,	11			,	672		,	0					)	
