function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do

		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Speed Note' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'SpeedNotes_assets'); --Change texture
			setPropertyFromGroup('unspawnNotes', i, 'hitHealth', '0'); 
			setPropertyFromGroup('unspawnNotes', i, 'missHealth', '0');

			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then --Doesn't let Dad/Opponent notes get ignored
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true); --Miss has no penalties
			end
		end
	end
end


function noteMiss(id, noteData, noteType, isSustainNote)
	if noteType == 'Speed Note' then
		triggerEventNote('Change Scroll Speed', 1.75, 0);
	end
end