SELECT Country FROM ['FSI 2006-2022$']
WHERE [C2: Factionalized Elites] < 8.0

SELECT AVG([C2: Factionalized Elites])
FROM ['FSI 2006-2022$']

SELECT Country, [C2: Factionalized Elites]
FROM ['FSI 2006-2022$']
ORDER BY [C2: Factionalized Elites]

SELECT Country, Rank, Total
FROM ['FSI 2006-2022$']
WHERE EXISTS (
	SELECT [P1: State Legitimacy]
	FROM ['FSI 2006-2022$']
	WHERE [P2: Public Services] < 6.0)

