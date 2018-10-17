USE DBHansIVCupCompet
select nomTeam, tblJoueur.pseudoUplay, tblRoleMembreTeam.nomRole
from tblTeam
join tblJoueurTeam on 
tblJoueurTeam.idTeam = tblTeam.idTeam
join tblJoueur
on tblJoueur.idJoueur = tblJoueurTeam.idJoueur
join tblRoleMembreTeam 
on tblRoleMembreTeam.idRole = tblJoueurTeam.idRoleTeam