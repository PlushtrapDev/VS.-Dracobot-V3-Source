function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do

		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Blood Note' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'BloodNotes_assets'); 
			setPropertyFromGroup('unspawnNotes', i, 'hitHealth', '0'); 
			setPropertyFromGroup('unspawnNotes', i, 'missHealth', '150'); -- ~ 0.005 HP 
			setPropertyFromGroup('unspawnNotes', i, 'hitCausesMiss', true);

			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then --Doesn't let Dad/Opponent notes get ignored
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true); --Miss has no penalties
			end
		end
	end
end


local hpDrain = 0;
function goodNoteHit(id, noteData, noteType, isSustainNote)
	if noteType == 'Blood Note' then
		triggerEvent('Change Scroll Speed', 0.75, 0);
		hpDrain = hpDrain + 0.15;
	end
end

function onUpdate(elapsed)
	if hpDrain > 0 then
		hpDrain = hpDrain * elapsed;
		setProperty('health', getProperty('health') - 0.05 * elapsed);
		if hpDrain < 0 then 
			hpDrain = 0;
		end
	end
end