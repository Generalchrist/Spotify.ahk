#requires AutoHotkey v1.1
#SingleInstance,Force

#Include %A_ScriptDir%\Spotify.ahk

spoofy := new Spotify
Increment := 5

PlaybackInfo := spoofy.Player.GetCurrentPlaybackInfo()
VolumePercentage := PlaybackInfo.Device.Volume

return


;ctrl + alt + s to volume down
^!s:: 
if(VolumePercentage - Increment > 0)
  VolumePercentage := VolumePercentage - Increment
spoofy.Player.SetVolume(VolumePercentage) ; Decrement the volume percentage and set the player to the new volume percentage
return

;ctrl + alt + w to volume up
^!w::
if(VolumePercentage + Increment <= 100)
  VolumePercentage := VolumePercentage + Increment
spoofy.Player.SetVolume(VolumePercentage) ; Increment the volume percentage and set the player to the new volume percentage
return 

;ctrl + alt + d to next track
^!d::
spoofy.Player.NextTrack()
return 

;ctrl + alt + a to previous track
^!a::
spoofy.Player.LastTrack()
return 

;x key binding for Stardew Valley animation cancelling
/*
x::

While GetKeyState("x","P")

{
sendEvent {LButton Down}
sleep 10
sendEvent {LButton Up}
sleep 125
sendEvent {r Down}{Delete Down}{RShift Down}
sleep 10
sendEvent {r Up}{Delete Up}{RShift Up}
}

sleep 20
*/


return
