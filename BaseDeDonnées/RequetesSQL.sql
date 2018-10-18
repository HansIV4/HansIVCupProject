USE DBHansIVCupCompet
select nomTeam, tblTeam.idTeam, tblJoueur.pseudoUplay, tblJoueur.idJoueur, tblRoleMembreTeam.nomRole
from tblTeam
join tblJoueurTeam on 
tblJoueurTeam.idTeam = tblTeam.idTeam
join tblJoueur
on tblJoueur.idJoueur = tblJoueurTeam.idJoueur
join tblRoleMembreTeam 
on tblRoleMembreTeam.idRole = tblJoueurTeam.idRoleTeam


Select tblJoueur.pseudoUplay as 'Pseudo Du Joueur', tblTeam.nomTeam as 'Nom Equipe', idBO3  from tblJoueurTeamParticipeBO3
join tblJoueur on tblJoueur.idJoueur = tblJoueurTeamParticipeBO3.idJoueur
join tblTeam on tblTeam.idTeam = tblJoueurTeamParticipeBO3.idTeam