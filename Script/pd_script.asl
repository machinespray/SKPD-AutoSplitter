state("Shovel Knight Pocket Dungeon")
{
	byte tCount: 0x5552320;
}
init{
	vars.startTarget = 0;
	vars.target = 0;
	vars.lagFrames = 0;
}
onStart{
	vars.target = current.tCount+1;
}

onReset{
	vars.startTarget = current.tCount+2;
} 

start{
	if (vars.startTarget==current.tCount)
		return true;
}

split{
	if(current.tCount==vars.target){
		vars.target = current.tCount + 3;
		vars.lagFrames = 7;
		return true;
	}
}

isLoading{
	if(vars.lagFrames > 0){
		//print(vars.lagFrames.ToString());
		vars.lagFrames = vars.lagFrames - 1;
		return true;
	}
	return false;
}