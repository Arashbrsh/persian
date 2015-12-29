do
function run(msg, matches)
  if msg.to.id == our_id or is_realm(msg) then
	 local data = load_data(_config.moderation.data)
    if matches[1] == 'join' and data[tostring(matches[2])] then
  		if is_banned(msg.from.id, matches[2]) then
	 		  return 'شما بن شدید.'
	  	end
      if is_gbanned(msg.from.id) then
		    return 'شما گلوبال بن شدید.'
      end
      if data[tostring(matches[2])]['settings']['lock_member'] == 'yes' and not is_owner2(msg.from.id, matches[2]) then
        return 'گروه خصوصی است'
      end
      local chat = "chat#id"..matches[2]
		  local user = "user#id"..msg.from.id
		  chat_add_user(chat, user, ok_cb, false)
    end
  end
end
return {
    patterns = {
      "^[/!](join) (.*)$"
    },
    run = run,
}

end
