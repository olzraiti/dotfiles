" Vim syntax file
" Language:	Escript + POL functions
" Maintainer:	Marcin Biegun <biegun.m@gmail.com>
" Filenames:	*.src *.inc *.cfg *.em
" Last Change:	2010 Apr 17

if exists("b:current_syntax")
  finish
endif

syn case ignore

" Escript comments
syn match escriptLineComment "\/\/.*$"
syn region escriptBlockComment start="\/\*" end="\*\/"

" Escript operators
syn match escriptOperators "\~!@%^&*()\\-+=|/{}\[]:;\"'<>,.?" contained

" Escript strings
syn region escriptString start='"' end='"'

" Escript function names
syn match escriptFunction1 "%function ^([a-zA-Z0-9_]+([0-9a-zA-Z_,:=+    ^-^"]++)^)$"
syn match escriptFunction2 "%exported function ^([a-zA-Z0-9_]+([0-9a-zA-Z_,:=+    ^-^"]++)^)$"

" Escript indenting
syn match escriptIndentStrings     "case|else|elseif|enum|for|foreach|function|if|program|repeat|while|do"
syn match escriptUnindentStrings   "else|elseif|endif|endfunction|endprogram|endwhile|endcase|endenum|endfor|endforeach|until|dowhile"
"syn match escriptOpenBraceStrings  "case|else|elseif|enum|for|foreach|function|if|program|repeat|while|do|\{|\(|\["
syn match escriptOpenBraceStrings  "case|else|elseif|enum|for|foreach|function|if|program|repeat|while|do"
"syn match escriptCloseBraceStrings "endcase|endif|endif|endenum|endfor|endforeach|endfunction|endif|endprogram|until|endwhile|dowhile|\}|\)|\]"
syn match escriptCloseBraceStrings "endcase|endif|endif|endenum|endfor|endforeach|endfunction|endif|endprogram|until|endwhile|dowhile"
"syn match escriptOpenFoldStrings   "case|enum|for|foreach|function|if|program|repeat|while|do|\{|\(|\["
syn match escriptOpenFoldStrings   "case|enum|for|foreach|function|if|program|repeat|while|do"
"syn match escriptCloseFoldStrings  "endcase|endenum|endfor|endforeach|endfunction|endif|endprogram|until|endwhile|dowhile|\}|\)|\]"
syn match escriptCloseFoldStrings  "endcase|endenum|endfor|endforeach|endfunction|endif|endprogram|until|endwhile|dowhile"

" Escript core keywords
syn keyword escriptCoreKeywords array const dictionary endprogram endfunction endwhile error function include program struct use var


" Escript script keywords
syn match escriptScriptKeywords "!"
syn match escriptScriptKeywords "%"
syn match escriptScriptKeywords "&"
syn match escriptScriptKeywords "("
syn match escriptScriptKeywords ")"
syn match escriptScriptKeywords "*"
syn match escriptScriptKeywords "+"
syn match escriptScriptKeywords "-"
syn match escriptScriptKeywords "\."
"syn match escriptScriptKeywords "\/"
syn match escriptScriptKeywords ":"
syn match escriptScriptKeywords ":="
syn match escriptScriptKeywords ";"
"syn match escriptScriptKeywords "<"
syn match escriptScriptKeywords ">"
syn match escriptScriptKeywords "\["
syn match escriptScriptKeywords "\]"
syn match escriptScriptKeywords "\^"
syn match escriptScriptKeywords "{"
syn match escriptScriptKeywords "}"
syn match escriptScriptKeywords "\~"


syn keyword escriptScriptKeywords and break byref case continue default downto else elseif endcase endenum
syn keyword escriptScriptKeywords endfor endforeach endif endwhile enum exported for foreach if in not
syn keyword escriptScriptKeywords or repeat return to until while

" Escript EM files
syn keyword escriptEmFiles ATTRIBUTES BASIC BASICIO BOAT CFGFILE CLILOC DATAFILE FILE GUILDS HTTP MATH NPC OS POLSYS STORAGE UO UTIL UNICODE VITALS

" Escript EM functions
syn keyword escriptEmFunctions ACos ASin ATan Abs Accessible AddAmount AddMenuItem AlterAttributeTemporaryMod
syn keyword escriptEmFunctions AppendConfigFileElem AppendToFile ApplyConstraint ApplyDamage ApplyRawDamage
syn keyword escriptEmFunctions AssignRectToWeatherRegion Attach BaseSkillToRawSkill Bin BoatFromItem
syn keyword escriptEmFunctions Broadcast BroadcastUC CAsc CAscZ CChr CChrZ CDbl CInt CStr CancelTarget
syn keyword escriptEmFunctions CanMove Ceil CheckLineOfSight CheckLosAt CheckLosBetween CheckSkill Clear_Event_Queue
syn keyword escriptEmFunctions CloseGump CloseTradeWindow Compare ConstE ConstPi ConsumeMana ConsumeReagents
syn keyword escriptEmFunctions ConsumeSubstance ConsumeVital CoordinateDistance Cos CreateAccount CreateDataFile
syn keyword escriptEmFunctions CreateGuild CreateItemAtLocation CreateItemCopyAtLocation CreateItemInBackpack
syn keyword escriptEmFunctions CreateItemInContainer CreateItemInInventory CreateMenu CreateMultiAtLocation
syn keyword escriptEmFunctions CreateNpcFromTemplate CreatePacket CreateParty CreateRootItemInStorageArea
syn keyword escriptEmFunctions CreateStorageArea Create_Debug_Context DegToRad DestroyGuild DestroyItem
syn keyword escriptEmFunctions DestroyMulti DestroyRootItemInStorageArea Detach DisableEvents DisbandParty
syn keyword escriptEmFunctions DisconnectClient Distance EnableEvents EnumerateItemsInContainer EnumerateOnlineCharacters
syn keyword escriptEmFunctions EquipFromTemplate EquipItem EraseGlobalProperty EraseObjProperty Events_Waiting
syn keyword escriptEmFunctions FileExists Find FindAccount FindConfigElem FindGuild FindObjtypeInContainer
syn keyword escriptEmFunctions FindPath FindRootItemInStorageArea FindStorageArea FindSubstance Floor
syn keyword escriptEmFunctions FormatRealToString GetAmount GetAttribute GetAttributeBaseValue GetAttributeCap
syn keyword escriptEmFunctions GetAttributeDefaultCap GetAttributeIntrinsicMod GetAttributeLock GetAttributeName
syn keyword escriptEmFunctions GetAttributeTemporaryMod GetCmdLevelName GetCmdLevelNumber GetCommandHelp
syn keyword escriptEmFunctions GetConfigInt GetConfigIntKeys GetConfigMaxIntKey GetConfigReal GetConfigString
syn keyword escriptEmFunctions GetConfigStringArray GetConfigStringDictionary GetConfigStringKeys GetCoordsInLine
syn keyword escriptEmFunctions GetElemProperty GetEquipmentByLayer GetFacing GetGlobalProperty GetGlobalPropertyNames
syn keyword escriptEmFunctions GetHarvestDifficulty GetItemDescriptor GetMapInfo GetMenuObjTypes GetMultiDimensions
syn keyword escriptEmFunctions GetObjProperty GetObjPropertyNames GetObjType GetObjtypeByName GetPackageByName
syn keyword escriptEmFunctions GetPid GetProcess GetProperty GetRegionName GetRegionString GetRegionNameAtLocation
syn keyword escriptEmFunctions GetSpellDifficulty GetStandingHeight GetStandingLayers GetVital GetVitalMaximumValue
syn keyword escriptEmFunctions GetVitalName GetVitalRegenRate GetWorldHeight GrantPrivilege HarvestResource
syn keyword escriptEmFunctions HealDamage Hex IncRevision IsLegalMove Is_Critical IsStackable Len ListAccounts
syn keyword escriptEmFunctions ListConfigElemProps ListDataFiles ListEquippedItems ListGhostsNearLocation
syn keyword escriptEmFunctions ListGuilds ListHostiles ListItemsAtLocation ListItemsNearLocation ListItemsNearLocationOfType
syn keyword escriptEmFunctions ListItemsNearLocationWithFlag ListMobilesInLineOfSight ListMobilesNearLocation
syn keyword escriptEmFunctions ListMobilesNearLocationEx ListMultisInBox ListObjectsInBox ListStaticsAtLocation
syn keyword escriptEmFunctions ListStaticsInBox ListStaticsNearLocation ListTextCommands ListenPoints
syn keyword escriptEmFunctions LoadTusScpFile Log10 LogE LogToFile Lower MakeBoundingBox Max Min Move
syn keyword escriptEmFunctions MoveBoat MoveBoatRelative MoveBoatXY MoveCharacterToLocation MoveItemToContainer
syn keyword escriptEmFunctions MoveItemToLocation MoveItemToSecureTradeWin MOVEOBJECT_FORCELOCATION
syn keyword escriptEmFunctions MOVEITEM_IGNOREMOVABLE MOVEOBJECT_NORMAL MoveObjectToLocation MoveObjectToRealm
syn keyword escriptEmFunctions OpenDataFile OpenPaperdoll OpenURL Pack Packages PerformAction PlayLightningBoltEffect
syn keyword escriptEmFunctions PlayMovingEffect PlayMovingEffectEx PlayMovingEffectXYZ PlayMovingEffectXYZEx
syn keyword escriptEmFunctions PlayMusic PlayObjectCenteredEffect PlayObjectCenteredEffectEx PlaySoundEffect
syn keyword escriptEmFunctions PlaySoundEffectXYZ PlaySoundEffectPrivate PlayStationaryEffect PlayStationaryEffectEx
syn keyword escriptEmFunctions PolCore Pow Print PrintTextAbove PrintTextAboveCL PrintTextAbovePrivate
syn keyword escriptEmFunctions PrintTextAbovePrivateCL PrintTextAbovePrivateUC PrintTextAboveUC QueryIP
syn keyword escriptEmFunctions QueryParam RadToDeg RandomDiceRoll RandomFloat RandomInt RandomIntMinMax
syn keyword escriptEmFunctions RawSkillToBaseSkill ReadConfigFile ReadFile ReadGameClock ReadMillisecondClock
syn keyword escriptEmFunctions Realms RecalcVitals RegisterForSpeechEvents RegisterItemWithBoat ReleaseItem
syn keyword escriptEmFunctions ReloadConfiguration RequestInput RequestInputUC ReserveItem RestartScript
syn keyword escriptEmFunctions Resurrect RevokePrivilege Root RunAwayFrom RunAwayFromLocation RunToward
syn keyword escriptEmFunctions RunTowardLocation Run_Script Run_Script_To_Completion SaveWorldState
syn keyword escriptEmFunctions Say SayUC SecureTradeWin SelectColor SelectMenuItem2 Self SendBuyWindow
syn keyword escriptEmFunctions SendCharacterRaceChanger SendDialogGump SendEvent SendInstaResDialog
syn keyword escriptEmFunctions SendOpenBook SendOpenSpecialContainer SendPacket SendPartyMsg SendPrivatePartyMsg
syn keyword escriptEmFunctions SendQuestArrow SendSellWindow SendSkillWindow SendStatus SendStringAsTipWindow
syn keyword escriptEmFunctions SendSysMessage SendSysMessageCL SendSysMessageUC SendTextEntryGump SendViewContainer
syn keyword escriptEmFunctions SetAnchor SetAttributeBaseValue SetAttributeCap SetAttributeLock SetAttributeTemporaryMod
syn keyword escriptEmFunctions SetGlobalProperty SetName SetObjProperty SetOpponent SetProperty SetRegionLightLevel
syn keyword escriptEmFunctions SetRegionWeatherLevel SetScriptController SetSysTrayPopupText SetVital
syn keyword escriptEmFunctions SetWarMode Set_Critical Set_Debug Set_Event_Queue_Size Set_Priority Set_Script_Option
syn keyword escriptEmFunctions Shutdown Sin SizeOf Sleep Sleepms SpeakPowerWords SplitWords Sqrt StartSpellEffect
syn keyword escriptEmFunctions Start_Script StorageAreas StrFormatTime StrReplace Substr SubStrReplace
syn keyword escriptEmFunctions SubtractAmount SysLog SystemFindBoatBySerial SystemFindObjectBySerial
syn keyword escriptEmFunctions System_RPM Tan Target TargetCoordinates TargetMultiPlacement Trim TurnAwayFrom
syn keyword escriptEmFunctions TurnAwayFromLocation TurnBoat TurnToward TurnTowardLocation TypeOf UnloadConfigFile
syn keyword escriptEmFunctions UnloadDataFile Unload_Scripts Unpack UpdateMobile Upper UseItem Wait_For_Event
syn keyword escriptEmFunctions WalkAwayFrom WalkAwayFromLocation WalkToward WalkTowardLocation Wander
syn keyword escriptEmFunctions WriteFile WriteHTML WriteHTMLRaw

" Escript object members
syn match escriptObjectMembers "/.acct|/.acctname|/.alignment|/.all_scripts|/.allyguilds|/.amount|/.ar"
syn match escriptObjectMembers "/.ar_base|/.ar_mod|/.attached|/.attached_to|/.attribute|/.backpack|/.banned"
syn match escriptObjectMembers "/.buyprice|/.bytes_received|/.bytes_sent|/.call_depth|/.candidates|/.candidate_of_party"
syn match escriptObjectMembers "/.clientinfo|/.clientversion|/.clientver_detail|/.cmdlevel|/.cmdlevelstr"
syn match escriptObjectMembers "/.color|/.combat_operations_per_min|/.compiledate|/.compiletime|/.components"
syn match escriptObjectMembers "/.concealed|/.connected|/.consec_cycles|/.container|/.controller|/.corpsetype"
syn match escriptObjectMembers "/.createdat|/.criminal|/.cursor|/.damage|/.damage_cold|/.damage_cold_mod"
syn match escriptObjectMembers "/.damage_energy|/.damage_energy_mod|/.damage_fire|/.damage_fire_mod|/.damage_physical"
syn match escriptObjectMembers "/.damage_physical_mod|/.damage_poison|/.damage_poison_mod|/.dead|/.decayat"
syn match escriptObjectMembers "/.defaultcmdlevel|/.delay_mod|/.desc|/.dmg_mod|/.enabled|/.enemyguilds"
syn match escriptObjectMembers "/.equipscript|/.error_creations_per_min|/.errortext|/.evasionchance_mod"
syn match escriptObjectMembers "/.eventmask|/.events_per_min|/.facing|/.followers|/.followers_max|/.footprint"
syn match escriptObjectMembers "/.frozen|/.gender|/.getcorpse|/.globals|/.gold|/.graphic|/.guild|/.guildid"
syn match escriptObjectMembers "/.gump|/.gumpheight|/.gumpwidth|/.has_offline_mobiles|/.height|/.height"
syn match escriptObjectMembers "/.hidden|/.hitchance_mod|/.hitscript|/.hold|/.hp|/.instr_cycles|/.instr_per_min"
syn match escriptObjectMembers "/.intrinsic|/.invisible|/.iostats|/.ip|/.isopen|/.isUOKR|/.item|/.item_count"
syn match escriptObjectMembers "/.itemcount|/.items|/.langcode|/.layer|/.leader|/.locked|/.luck|/.mapid"
syn match escriptObjectMembers "/.master|/.maxhp|/.maxhp_mod|/.members|/.mobile|/.mobile_count|/.mobilecount"
syn match escriptObjectMembers "/.mobiles|/.movable|/.movemode|/.multi|/.murderer|/.name|/.newbie|/.npcdesc"
syn match escriptObjectMembers "/.npctemplate|/.num_globals|/.objtype|/.onhitscript|/.opponent|/.ownerserial"
syn match escriptObjectMembers "/.packages|/.paralyzed|/.party|/.partycanloot|/.passwordhash|/.pc|/.pid"
syn match escriptObjectMembers "/.poisoned|/.portplank|/.priority_divide|/.process|/.prompt|/.quality|/.queued_iostats"
syn match escriptObjectMembers "/.race|/.realm|/.reportables|/.resist_cold|/.resist_cold_mod|/.resist_energy"
syn match escriptObjectMembers "/.resist_energy_mod|/.resist_fire|/.resist_fire_mod|/.resist_physical|/.resist_physical_mod"
syn match escriptObjectMembers "/.resist_poison|/.resist_poison_mod|/.run_speed|/.saveonexit|/.script"
syn match escriptObjectMembers "/.script_profiles|/.sellprice|/.serial|/.shield|/.skill_checks_per_min"
syn match escriptObjectMembers "/.skillcap|/.sleep_cycles|/.source|/.speech_color|/.speech_font|/.squelched"
syn match escriptObjectMembers "/.stackable|/.starboardplank|/.statcap|/.state|/.stealthsteps|/.supports_http"
syn match escriptObjectMembers "/.sysload|/.sysload_severity|/.systime|/.tasks_late_per_min|/.tasks_late_ticks_per_min"
syn match escriptObjectMembers "/.tasks_ontime_per_min|/.texttype|/.tile_layer|/.tillerman|/.tithing|/.title_guild"
syn match escriptObjectMembers "/.title_prefix|/.title_race|/.title_suffix|/.toplevel_item_count|/.trading_with"
syn match escriptObjectMembers "/.truecolor|/.trueobjtype|/.type|/.uc_text|/.uclang|/.unequipscript"
syn match escriptObjectMembers "/.uptime|/.uo_expansion|/.use_adjustments|/.usernamepasswordhash|/.usescript"
syn match escriptObjectMembers "/.value|/.var_size|/.version|/.verstr|/.warmode|/.weapon|/.weight|/.width"
syn match escriptObjectMembers "/.x|/.xeast|/.xmax|/.xmin|/.xwest|/.y|/.ymax|/.ymin|/.ynorth|/.ysouth|/.z"

" Escript object methods
syn match escriptObjectMethods "/.AddAllyGuild|/.addcandidate|/.AddEnemyGuild|/.addcharacter|/.AddMember"
syn match escriptObjectMethods "/.Add_Component|/.Append|/.AppendPin|/.attack_once|/.Ban|/.CheckPassword"
syn match escriptObjectMethods "/.Clear_Event_Queue|/.cleargottenitem|/.Clear_Script_Profile_Counters"
syn match escriptObjectMethods "/.Close|/.compareversion|/.CreateElement|/.Custom|/.Delete|/.DeleteCharacter"
syn match escriptObjectMethods "/.DeleteElement|/.Disable|/.Enable|/.Enabled|/.Erase|/.erase_component"
syn match escriptObjectMethods "/.ErasePin|/.EraseProp|/.Exists|/.FindElement|/.gameclock|/.GetCharacter"
syn match escriptObjectMethods "/.GetGottenItem|/.GetInt16|/.GetInt16Flipped|/.GetInt32|/.GetInt32Flipped"
syn match escriptObjectMethods "/.GetInt8|/.GetItemDescriptor|/.GetPins|/.GetProp|/.GetSize|/.GetString"
syn match escriptObjectMethods "/.GetUnicodeString|/.GetUnicodeStringFlipped|/.Get_Member|/.Insert|/.InsertPin"
syn match escriptObjectMethods "/.IsA|/.IsAllyGuild|/.IsEnemyGuild|/.IsMember|/.Keys|/.Kill|/.Log_Profile"
syn match escriptObjectMethods "/.Move_Char|/.Move_Offline_Mobiles|/.Open|/.Print|/.privileges|/.PropNames"
syn match escriptObjectMethods "/.RemoveAllyGuild|/.RemoveEnemyGuild|/.RemoveMember|/.RemoveReportable"
syn match escriptObjectMethods "/.Remove_Component|/.removecandidate|/.Reverse|/.SendAreaPacket|/.SendEvent"
syn match escriptObjectMethods "/.SendPacket|/.SetCmdLevel|/.SetCriminal|/.setdefaultcmdlevel|/.setfacing"
syn match escriptObjectMethods "/.SetInt16|/.SetInt16Flipped|/.SetInt32|/.SetInt32Flipped|/.SetInt8|/.setleader"
syn match escriptObjectMethods "/.SetLightLevel|/.SetMaster|/.SetMurderer|/.SetName|/.SetParalyzed|/.SetPassword"
syn match escriptObjectMethods "/.SetPoisoned|/.SetProp|/.SetSize|/.SetString|/.SetUnicodeString|/.SetWarMode"
syn match escriptObjectMethods "/.Set_Member|/.Set_Priority_Divide|/.SetUnicodeStringFlipped|/.Set_UO_Expansion"
syn match escriptObjectMethods "/.setswingtimer|/.Shrink|/.Size|/.Sort|/.SpendGold|/.Split|/.Squelch"
syn match escriptObjectMethods "/.Toggle|/.Transmit|/.TypeOf|/.UnBan"

" Escript constants
syn keyword escriptConstants _DEFAULT_CLCOLOR _DEFAULT_CLFONT _DEFAULT_REALM _DEFAULT_TEXT_COLOR _DEFAULT_TEXT_FONT
syn keyword escriptConstants _DEFAULT_UCCOLOR _DEFAULT_UCFONT ACTION_DIR_BACKWARD ACTION_DIR_FORWARD
syn keyword escriptConstants ACTION_NOREPEAT ACTION_REPEAT all attackhidden ATTRIBUTE_LOCK_DOWN ATTRIBUTE_LOCK_LOCKED
syn keyword escriptConstants ATTRIBUTE_LOCK_UP ATTRIBUTE_MAX_BASE AUX_Connection_Receive_Event clotheany
syn keyword escriptConstants CRMULTI_FACING_EAST CRMULTI_FACING_NORTH CRMULTI_FACING_SOUTH CRMULTI_FACING_WEST
syn keyword escriptConstants CRMULTI_IGNORE_ALL CRMULTI_IGNORE_MULTIS CRMULTI_IGNORE_OBJECTS CRMULTI_IGNORE_WORLDZ
syn keyword escriptConstants dblclickany DELETE_BY_PLAYER DELETE_BY_SCRIPT DF_KEYTYPE_INTEGER DF_KEYTYPE_STRING
syn keyword escriptConstants ENUMERATE_IGNORE_LOCKED ENUMERATE_ROOT_ONLY FACE_FORCE FACE_NORMAL firewhilemoving
syn keyword escriptConstants FINDSUBSTANCE_FIND_ALL FINDSUBSTANCE_IGNORE_LOCKED FINDSUBSTANCE_ROOT_ONLY
syn keyword escriptConstants FP_IGNORE_DOORS FP_IGNORE_MOBILES freemove hearghosts hiddenattack ignoredoors
syn keyword escriptConstants INSERT_ADD_ITEM INSERT_INCREASE_STACK invul ITEMS_IGNORE_MULTIS ITEMS_IGNORE_STATICS
syn keyword escriptConstants JOURNAL_PRINT_NAME JOURNAL_PRINT_YOU_SEE JOURNAL_UC_PRINT_NAME JOURNAL_UC_PRINT_YOU_SEE
syn keyword escriptConstants LH_FLAG_INCLUDE_HIDDEN LH_FLAG_LOS LISTENPT_HEAR_GHOSTS LISTEX_FLAG_CONCEALED
syn keyword escriptConstants LISTEX_FLAG_GHOST LISTEX_FLAG_HIDDEN LISTEX_FLAG_NORMAL LIST_IGNORE_Z LOG_DATETIME
syn keyword escriptConstants losany MAPDATA_FLAG_ALL MAPDATA_FLAG_ALLOWDROPON MAPDATA_FLAG_BLOCKING
syn keyword escriptConstants MAPDATA_FLAG_BLOCKSIGHT MAPDATA_FLAG_DROP_FLAGS MAPDATA_FLAG_GRADUAL MAPDATA_FLAG_MORE_SOLIDS
syn keyword escriptConstants MAPDATA_FLAG_MOVELAND MAPDATA_FLAG_MOVESEA MAPDATA_FLAG_MOVE_FLAGS MAPDATA_FLAG_NONE
syn keyword escriptConstants MAPDATA_FLAG_OVERFLIGHT MAPDATA_FLAG_WALKBLOCK MOVECHAR_FORCELOCATION moveany
syn keyword escriptConstants moveanydist MOVEITEM_FORCELOCATION MOVEITEM_NORMAL MOVETYPE_CORECREATE
syn keyword escriptConstants MOVETYPE_COREMOVE MOVETYPE_PLAYER MSGLEN_VARIABLE plogany POLCLASS_ARMOR
syn keyword escriptConstants POLCLASS_BOAT POLCLASS_CONTAINER POLCLASS_CORPSE POLCLASS_DOOR POLCLASS_EQUIPMENT
syn keyword escriptConstants POLCLASS_HOUSE POLCLASS_ITEM POLCLASS_LOCKABLE POLCLASS_MAP POLCLASS_MOBILE
syn keyword escriptConstants POLCLASS_MULTI POLCLASS_NPC POLCLASS_SPELLBOOK POLCLASS_UOBJECT POLCLASS_WEAPON
syn keyword escriptConstants RACE_HUMAN RACE_ELF REALM_BRITANNIA REALM_ILSHENAR REALM_MALAS REALM_TOKUNO
syn keyword escriptConstants renameany RESURRECT_FORCELOCATION SAY_DOEVENT_DISABLE SAY_DOEVENT_ENABLE
syn keyword escriptConstants SAY_TEXTTYPE_DEFAULT SAY_TEXTTYPE_WHISPER SAY_TEXTTYPE_YELL SCRIPTOPT_CAN_ACCESS_OFFLINE_MOBILES
syn keyword escriptConstants SCRIPTOPT_DEBUG SCRIPTOPT_NO_INTERRUPT SCRIPTOPT_NO_RUNAWAY seeghosts seehidden
syn keyword escriptConstants seeinvisitems showadv SYSEVENT_SPEECH SYSEVENT_ENGAGED SYSEVENT_DISENGAGED
syn keyword escriptConstants SYSEVENT_DAMAGED SYSEVENT_ENTEREDAREA SYSEVENT_LEFTAREA SYSEVENT_OPPONENT_MOVED
syn keyword escriptConstants SYSEVENT_HOSTILE_MOVED SYSEVENT_HOSTILE_MOVED SYSEVENT_MERCHANT_SOLD SYSEVENT_ITEM_GIVEN
syn keyword escriptConstants SYSEVENT_DOUBLECLICKED SYSEVENT_GHOST_SPEECH SYSEVENT_GONE_CRIMINAL SYSFIND_SEARCH_OFFLINE_MOBILES
syn keyword escriptConstants SYSFIND_SEARCH_STORAGE_AREAS TE_CANCEL_DISABLE TE_CANCEL_ENABLE TE_STYLE_DISABLE
syn keyword escriptConstants TE_STYLE_NORMAL TE_STYLE_NUMERICAL TGTOPT_CHECK_LOS TGTOPT_HARMFUL TGTOPT_HELPFUL
syn keyword escriptConstants TGTOPT_NEUTRAL TGTOPT_NOCHECK_LOS TILEDATA_FLAG_ANIMATED TILEDATA_FLAG_ARMOR
syn keyword escriptConstants TILEDATA_FLAG_BACKGROUND TILEDATA_FLAG_BRIDGE TILEDATA_FLAG_CONTAINER TILEDATA_FLAG_DAMAGING
syn keyword escriptConstants TILEDATA_FLAG_DOOR TILEDATA_FLAG_FOLIAGE TILEDATA_FLAG_IMPASSABLE TILEDATA_FLAG_INTERNAL
syn keyword escriptConstants TILEDATA_FLAG_LIGHTSOURCE TILEDATA_FLAG_MAP TILEDATA_FLAG_NODIAGONAL TILEDATA_FLAG_NOSHOOT
syn keyword escriptConstants TILEDATA_FLAG_PARTIAL_HUE TILEDATA_FLAG_PREFIX_A TILEDATA_FLAG_PREFIX_AN
syn keyword escriptConstants TILEDATA_FLAG_ROOF TILEDATA_FLAG_STACKABLE TILEDATA_FLAG_STAIRBACK TILEDATA_FLAG_STAIRRIGHT
syn keyword escriptConstants TILEDATA_FLAG_SURFACE TILEDATA_FLAG_TRANSLUCENT TILEDATA_FLAG_TRANSPARENT
syn keyword escriptConstants TILEDATA_FLAG_UNK TILEDATA_FLAG_UNK1 TILEDATA_FLAG_UNK2 TILEDATA_FLAG_WALL
syn keyword escriptConstants TILEDATA_FLAG_WEAPON TILEDATA_FLAG_WEARABLE TILEDATA_FLAG_WET TILEDATA_FLAG_WINDOW
syn keyword escriptConstants TRIM_BOTH TRIM_LEFT TRIM_RIGHT VENDOR_SEND_AOS_TOOLTIP

" Escript other functions
syn keyword escriptOtherFunctions ALCHEMY AP_AwardPoints AP_AwardRawAttributePoints AP_AwardTrainingPoints
syn keyword escriptOtherFunctAP_BaseToRawSkill AP_ListAttributesByType AP_DoSkillCap AP_DoStatCap AP_GetBaseAttributeCap
syn keyword escriptOtherFunctAP_GetLevelTitle AP_GetNeededRawPointsToIncrease AP_GetSkillCap AP_GetSkillStats
syn keyword escriptOtherFunctAP_GetSkillTitle AP_GetStatCap AP_GetVitalRegenRateMod AP_RawToBaseSkill
syn keyword escriptOtherFunctAP_SaveVitalRegenRateProp AP_SetSkillCap AP_SetStatCap AP_SetVitalRegenRateMod
syn keyword escriptOtherFunctAP_SkillCheck AP_SkillCheckItem ANATOMY ANIMALLORE ARCANE ARCHERY ARMSLORE
syn keyword escriptOtherFunctARTISTRY BATTLEDEXTERITY BATTLEFOCUS BEGGING BLACKSMITHY BOWCRAFT CAMPING
syn keyword escriptOtherFunctCARPENTRY CARTOGRAPHY CHIVALRY CLUMSY COOKING DETECTHIDDEN DEXTERITY DISCORDANCE
syn keyword escriptOtherFunctEVALUATINGINTELLIGENCE FARMING FENCING FISHING FORENSICS FORENSICEVALUATION
syn keyword escriptOtherFunctGetRaceAttributeBaseValue GREATERPATH HEALING HERDING HIDING HITS ITEMIDENTIFICATION
syn keyword escriptOtherFunctINSCRIPTION INTELLIGENCE INVOCATION ITEMID LEADERSHIP LESSERPATH LOCKPICKING
syn keyword escriptOtherFunctLUMBERJACKING MACEFIGHTING MAGERY MAGICRESISTANCE MANA MEDITATION MINING
syn keyword escriptOtherFunctMORPHING MUSICIANSHIP MUSICIANSHIP NECROMANCY PANIC PARALYSE PARRY PEACEMAKING
syn keyword escriptOtherFunctPOISONING PROVOCATION REMOVETRAP RIDING SNOOPING SPIRITSPEAK STAMINA STAVES
syn keyword escriptOtherFunctSTEALING STEALTH STONEWORKING STRENGTH SWORDSMANSHIP TACTICS TAILORING
syn keyword escriptOtherFunctTAMING TASTEID TINKERING TRACKING VETERINARY WRESTLING

" Config (ultra edit)
"L2"POL Config File"
"Nocase
"Line Comment = //
"Line Comment Alt = #
"Escape Char = \
"File Extensions = CFG
"Delimiters =     
"Function String = "%^([a-zA-Z0-9_ ]++^)[^p^r^n]{"
"Indent Strings = "{"
"Unindent Strings = "}"
"Open Brace Strings = "{"
"Close Brace Strings = "}"
"Open Fold Strings = "{"
"Close Fold Strings = "}"



"Comment Identifier Function PreProc Todo Include Special Delimiter Character Type
hi def link escriptOperators Identifier
hi def link escriptFunction1 Function
hi def link escriptFunction2 Function
hi def link escriptIndentStrings Character
hi def link escriptUnindentStrings Identifier
hi def link escriptOpenBraceStrings Identifier
hi def link escriptCloseBraceStrings Identifier
hi def link escriptOpenFoldStrings Identifier
hi def link escriptCloseFoldStrings Identifier
hi def link escriptCoreKeywords Type
hi def link escriptScriptKeywords Type
hi def link escriptEmFunctions Function
hi def link escriptObjectMembers Function
hi def link escriptObjectMethods Special
hi def link escriptConstants PreProc
hi def link escriptOtherFunctions Function
hi def link escriptString Character

hi def link escriptLineComment Comment
hi def link escriptBlockComment Comment

let b:current_syntax = "escript"

"vim:set sw=4:
