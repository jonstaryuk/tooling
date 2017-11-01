# Defined in - @ line 0
function rand --description 'alias rand=openssl rand -base64'
	openssl rand -base64 $argv;
end
