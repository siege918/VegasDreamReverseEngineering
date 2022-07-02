$C3B8##Load data for given player ID into Register A
\Most significant bit is existence, next bit is gender (1 is female)
$C3BB##If user is undefined, set carry flag
$C3BF##If gender is invalid, set carry flag
$C3BD##If user exists, clear carry flag
$C3B2#GetPlayerData#
$CEE9##Branch if user is defined
$CD02#IndexToPlayerOffset#
$C3B7##Copy player data offset to register X
$CEF7##Initialize X to 0
$CEF9##AND the player data with 0x40 to get gender bit
$CEFB##If gender is 0, user is Mr., branch to $CEFF
$CEFD##Set X to 2 if Ms.
$CF01#GenderGraphicLoadingLoop#Load in graphic pointer for portion of signifier
$CF06##Increment X and Y
$CF08##Continue until Y equals 2
$CF0C##Load 0x3D into A
\(Tile ID for blank space)
$CF0E#Load dot graphic#
$CF25#M#
$CF26#s.#s.
$CF17#RenderNameLoop#Load the Xth letter of the name
$CF10##Reset Y
$CF11##Load player data
$CF1A##Place the letter sprite into X position (from Y register)
$CF1C##Increment X to get next letter
$CF1E##Loop until Y == 0x0D
$CF1D##Increment Y to go to next space
$CEEB##Load empty space
$CEEF#PrintEmptySpaceForNameLoop#Print empty space in location
$CEF1##Increment location
$CEF2##Loop until Y == 0x0D
$CEE6#RenderPlayerName#
