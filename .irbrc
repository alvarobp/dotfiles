require 'irb/completion'
require 'irb/ext/save-history'

IRB.conf[:PROMPT_MODE] = :DEFAULT
IRB.conf[:USE_READLINE] = true

# 200 entries in the list
IRB.conf[:SAVE_HISTORY] = 200

# Store results in home directory with specified file name
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb-history"
