-- Edit each term's enUS and deDE text below. Other client locales use English.
-- Keep internal IDs, commands and saved values out of translated UI text.
local _, addon = ...
local terms = {
    ["ADD_AURA"] = { enUS = "Add aura", deDE = "Aura hinzufügen" },
    ["COPY_AURA"] = { enUS = "Copy aura", deDE = "Aura kopieren" },
    ["EXPORT_AURA"] = { enUS = "Export aura", deDE = "Aura exportieren" },
    ["EXPORT_ALL_AURAS"] = { enUS = "Export all auras", deDE = "Alle Auren exportieren" },
    ["DELETE_AURA"] = { enUS = "Delete aura", deDE = "Aura löschen" },
    ["MOVE_UP"] = { enUS = "Move up", deDE = "Nach oben verschieben" },
    ["MOVE_DOWN"] = { enUS = "Move down", deDE = "Nach unten verschieben" },
    ["ENABLED"] = {
        enUS = "Enabled",
        deDE = "Aktiviert",
    },
    ["MY_CASTS_ONLY"] = {
        enUS = "My Casts only",
        deDE = "Nur eigene Zauber",
    },
    ["AURA_NAME"] = {
        enUS = "Aura Name:",
        deDE = "Aura-Name:",
    },
    ["ICON_TEXTURE"] = {
        enUS = "Icon/Texture:",
        deDE = "Icon/Textur:",
    },
    ["AUTODETECT"] = {
        enUS = "Autodetect",
        deDE = "Automatisch",
    },
    ["BROWSE"] = {
        enUS = "Browse",
        deDE = "Durchsuchen",
    },
    ["SCALE"] = {
        enUS = "Scale:",
        deDE = "Größe:",
    },
    ["X_POS"] = {
        enUS = "x pos:",
        deDE = "X-Position:",
    },
    ["Y_POS"] = {
        enUS = "y pos:",
        deDE = "Y-Position:",
    },
    ["SHOW_DURATION"] = {
        enUS = "Show Duration",
        deDE = "Dauer anzeigen",
    },
    ["SHOW_STACKS"] = {
        enUS = "Show Stacks",
        deDE = "Stapel anzeigen",
    },
    ["CONDITIONS"] = {
        enUS = "Conditions",
        deDE = "Bedingungen",
    },
    ["TYPE"] = {
        enUS = "Type:",
        deDE = "Typ:",
    },
    ["UNIT"] = {
        enUS = "Unit:",
        deDE = "Einheit:",
    },
    ["LOW_DURATION_COLOR"] = {
        enUS = "Low Duration Color",
        deDE = "Farbe bei kurzer Restdauer",
    },
    ["SEC"] = {
        enUS = "sec)",
        deDE = "Sek.)",
    },
    ["IN_COMBAT"] = {
        enUS = "In Combat",
        deDE = "Im Kampf",
    },
    ["OUT_OF_COMBAT"] = {
        enUS = "Out of Combat",
        deDE = "Außerhalb des Kampfes",
    },
    ["IN_PARTY"] = {
        enUS = "In Party",
        deDE = "In einer Gruppe",
    },
    ["IN_RAID"] = {
        enUS = "In Raid",
        deDE = "Im Schlachtzug",
    },
    ["INVERT"] = {
        enUS = "Invert",
        deDE = "Umkehren",
    },
    ["DUAL"] = {
        enUS = "Dual",
        deDE = "Doppelt",
    },
    ["DELETE"] = {
        enUS = "Delete",
        deDE = "Löschen",
    },
    ["YES"] = {
        enUS = "Yes",
        deDE = "Ja",
    },
    ["NO"] = {
        enUS = "No",
        deDE = "Nein",
    },
    ["SELECT_TEXTURE"] = {
        enUS = "Select Texture",
        deDE = "Textur auswählen",
    },
    ["SELECT"] = {
        enUS = "Select",
        deDE = "Auswählen",
    },
    ["UNNAMED"] = {
        enUS = "<unnamed>",
        deDE = "<unbenannt>",
    },
    ["ENABLE_YAURAS"] = {
        enUS = "Enable |cff4b7dccy|r|cffffffffAuras|r",
        deDE = "|cff4b7dccy|r|cffffffffAuras|r aktivieren",
    },
    ["CONFIGURE_BUFF_DEBUFF_AND_SPELL_COOLDOWN_DISPLAYS_IN_THE_EDITOR"] = {
        enUS = "Configure buff, debuff and spell cooldown displays in the editor.",
        deDE = "Konfiguriere die Anzeige von Buffs, Debuffs und Cooldowns im Editor.",
    },
    ["OPEN_EDITOR"] = {
        enUS = "Open Editor",
        deDE = "Editor öffnen",
    },
    ["ZOOM_ICONS_SQUARE_1PX_BLACK_BORDER"] = {
        enUS = "Zoom icons (square, 1px black border)",
        deDE = "Icons vergrößern (quadratisch, schwarzer 1px-Rahmen)",
    },
    ["OPEN_YAURAS_EDITOR"] = {
        enUS = "Open yAuras editor",
        deDE = "yAuras-Editor öffnen",
    },
    ["SA_REFRESH_1_10_CURRENT"] = {
        enUS = "/sa refresh 1-10 (current: ",
        deDE = "/sa refresh 1-10 (aktuell: ",
    },
    ["APPROXIMATE_PLAYER_DEBUFFS"] = {
        enUS = "Approximate player debuffs: ",
        deDE = "Geschätzte Spieler-Debuffs: ",
    },
    ["SA_APPROXIMATE_ON_OFF_LEARNS_OUTSIDE_COMBAT_MATCHES_MAY_BE_AMBIGUOUS"] = {
        enUS = ". /sa approximate on|off. Learns outside combat; matches may be ambiguous.",
        deDE = ". /sa approximate on|off. Lernt außerhalb des Kampfes; Zuordnungen können mehrdeutig sein.",
    },
    ["CLIENT"] = {
        enUS = "Client: ",
        deDE = "Client: ",
    },
    ["AURAS"] = {
        enUS = "; auras: ",
        deDE = "; Auren: ",
    },
    ["UNAVAILABLE_RULES"] = {
        enUS = "; unavailable rules: ",
        deDE = "; nicht verfügbare Regeln: ",
    },
    ["SA_EDITOR_SA_REFRESH_1_10_SA_ENABLE_DISABLE_SA_STATUS_SA_NATIVE_SA_APPROXIMATE_ON_OFF"] = {
        enUS = "/sa — editor; /sa refresh 1-10; /sa enable|disable; /sa status; /sa native; /sa approximate on|off",
        deDE = "/sa — Editor; /sa refresh 1-10; /sa enable|disable; /sa status; /sa native; /sa approximate on|off",
    },
    ["UNSUPPORTED_DATA"] = {
        enUS = "Unsupported data",
        deDE = "Nicht unterstützte Daten",
    },
    ["IMPORT_IS_TOO_LARGE"] = {
        enUS = "Import is too large",
        deDE = "Import ist zu groß",
    },
    ["IMPORT_IS_TOO_COMPLEX"] = {
        enUS = "Import is too complex",
        deDE = "Import ist zu komplex",
    },
    ["EXPECTED"] = {
        enUS = "Expected ]=",
        deDE = "]= erwartet",
    },
    ["EXPECTED_2"] = {
        enUS = "Expected =",
        deDE = "= erwartet",
    },
    ["INVALID_TABLE_KEY"] = {
        enUS = "Invalid table key",
        deDE = "Ungültiger Tabellenschlüssel",
    },
    ["EXPECTED_COMMA_OR"] = {
        enUS = "Expected comma or }",
        deDE = "Komma oder } erwartet",
    },
    ["INVALID_ESCAPE"] = {
        enUS = "Invalid escape",
        deDE = "Ungültige Escape-Sequenz",
    },
    ["UNCLOSED_STRING"] = {
        enUS = "Unclosed string",
        deDE = "Nicht abgeschlossene Zeichenfolge",
    },
    ["INVALID_NUMBER"] = {
        enUS = "Invalid number",
        deDE = "Ungültige Zahl",
    },
    ["EXPECTED_TABLE_STRING_NUMBER_OR_BOOLEAN_AT"] = {
        enUS = "Expected table, string, number or boolean at ",
        deDE = "Tabelle, Zeichenfolge, Zahl oder Wahrheitswert erwartet bei ",
    },
    ["UNEXPECTED_TRAILING_TEXT"] = {
        enUS = "Unexpected trailing text",
        deDE = "Unerwarteter Text am Ende",
    },
    ["INVALID_IMPORT"] = {
        enUS = "Invalid import: ",
        deDE = "Ungültiger Import: ",
    },
    ["IMPORT_CONTAINS_AN_INVALID_AURA"] = {
        enUS = "Import contains an invalid aura.",
        deDE = "Der Import enthält eine ungültige Aura.",
    },
    ["NO_AURA_RULES_FOUND"] = {
        enUS = "No aura rules found.",
        deDE = "Keine Aura-Regeln gefunden.",
    },
    ["IMPORTED"] = {
        enUS = "Imported ",
        deDE = "Importiert: ",
    },
    ["AURA_S"] = {
        enUS = " aura(s).",
        deDE = " Aura(s).",
    },
    ["EXPORTED_AURA_STRING"] = {
        enUS = "Exported Aura String",
        deDE = "Exportierter Aura-Code",
    },
    ["PASTE_AURA_STRING_TO_IMPORT"] = {
        enUS = "Paste Aura String to Import",
        deDE = "Aura-Code zum Importieren einfügen",
    },
    ["CLOSE"] = {
        enUS = "Close",
        deDE = "Schließen",
    },
    ["IMPORT"] = {
        enUS = "Import",
        deDE = "Importieren",
    },
    ["CANCEL"] = {
        enUS = "Cancel",
        deDE = "Abbrechen",
    },
    ["AURACONTAINER_METHODS_ARE_UNAVAILABLE"] = {
        enUS = "AuraContainer methods are unavailable",
        deDE = "AuraContainer-Methoden sind nicht verfügbar",
    },
    ["NATIVE_AURA_PROCESSING_POLICY_IS_UNAVAILABLE"] = {
        enUS = "Native aura processing policy is unavailable",
        deDE = "Die native Aura-Verarbeitung ist nicht verfügbar",
    },
    ["BUILD_2_2_31_APPROXIMATE_PLAYER_DEBUFFS"] = {
        enUS = "Build 2.2.31; approximate player debuffs ",
        deDE = "Build 2.2.31; geschätzte Spieler-Debuffs ",
    },
    ["IDS"] = {
        enUS = "; IDs ",
        deDE = "; IDs ",
    },
    ["LEARNED_PROPERTY_MATCHING_NATIVE_LIVE_TIMER"] = {
        enUS = "  Learned property matching; native live timer; ",
        deDE = "  Zuordnung über gelernte Eigenschaften; nativer Timer; ",
    },
    ["STABLE_INSTANCE_ID_ORDER_NOT_AN_INSTANCE_LOCK"] = {
        enUS = "stable instance-ID order (not an instance lock).",
        deDE = "stabile Reihenfolge der Instanz-IDs (keine Instanzsperre).",
    },
    ["INSTANCE_ID_SORTING_UNAVAILABLE_ON_THIS_CLIENT"] = {
        enUS = "instance-ID sorting unavailable on this client.",
        deDE = "Sortierung nach Instanz-ID in diesem Client nicht verfügbar.",
    },
    ["WAITING_TO_LEARN_THIS_DEBUFF_OUTSIDE_COMBAT_APPLY_IT_ONCE_THEN_ENTER_COMBAT"] = {
        enUS = "  Waiting to learn this debuff outside combat. Apply it once, then enter combat.",
        deDE = "  Dieser Debuff muss außerhalb des Kampfes gelernt werden. Wende ihn einmal an und beginne dann den Kampf.",
    },
    ["COMBAT_IDENTITY_FILTER_UNAVAILABLE_FOR"] = {
        enUS = "  Combat identity filter unavailable for ",
        deDE = "  Identitätsfilter im Kampf nicht verfügbar für ",
    },
    ["ONLY_READABLE_EXACT_MATCHES_CAN_BE_SHOWN"] = {
        enUS = "; only readable exact matches can be shown.",
        deDE = "; nur lesbare, exakte Treffer können angezeigt werden.",
    },
    ["TEXTURE_COLOUR"] = {
        enUS = "  Texture colour: ",
        deDE = "  Texturfarbe: ",
    },
    ["THRESHOLD"] = {
        enUS = "; threshold ",
        deDE = "; Schwellenwert ",
    },
    ["NORMAL"] = {
        enUS = "; normal ",
        deDE = "; normal ",
    },
    ["LOW"] = {
        enUS = "; low ",
        deDE = "; niedrig ",
    },
    ["COLOUR"] = {
        enUS = "  Colour: ",
        deDE = "  Farbe: ",
    },
    ["ENGINE_RENDERED_TEXTURE_NO_PROTECTED_READS"] = {
        enUS = "engine-rendered texture; no protected reads",
        deDE = "Vom Spiel gerenderte Textur; keine geschützten Lesezugriffe",
    },
    ["NOT_CONFIGURED"] = {
        enUS = "not configured",
        deDE = "nicht konfiguriert",
    },
    ["NATIVE_SLOTS"] = {
        enUS = "Native slots: ",
        deDE = "Native Slots: ",
    },
    ["LAST_ERROR"] = {
        enUS = "; last error: ",
        deDE = "; letzter Fehler: ",
    },
    ["ICON_SWIPE"] = {
        enUS = "Icon swipe: ",
        deDE = "Icon-Cooldown: ",
    },
    ["TEXTURE_COLOUR_2"] = {
        enUS = "Texture colour: ",
        deDE = "Texturfarbe: ",
    },
    ["NATIVE_TEXTURE_FORMATTER_IS_UNAVAILABLE"] = {
        enUS = "Native texture formatter is unavailable",
        deDE = "Der native Textur-Formatter ist nicht verfügbar",
    },
    ["DURATION_TEXT_BINDINGS_ARE_UNAVAILABLE"] = {
        enUS = "Duration text bindings are unavailable",
        deDE = "Die Bindungen für den Dauertext sind nicht verfügbar",
    },
    ["COOLDOWN_PRESENTATION"] = {
        enUS = "Cooldown presentation: ",
        deDE = "Cooldown-Anzeige:",
    },
    ["VALUE_BUFF"] = {
        enUS = "Buff",
        deDE = "Buff",
    },
    ["VALUE_DEBUFF"] = {
        enUS = "Debuff",
        deDE = "Debuff",
    },
    ["VALUE_COOLDOWN"] = {
        enUS = "Cooldown",
        deDE = "Cooldown",
    },
    ["VALUE_PLAYER"] = {
        enUS = "Player",
        deDE = "Spieler",
    },
    ["VALUE_TARGET"] = {
        enUS = "Target",
        deDE = "Ziel",
    },
    ["ONLY_SHOW_WITH_TARGET"] = {
        enUS = "Only show with target:",
        deDE = "Nur anzeigen mit Ziel:",
    },
    ["VALUE_ANY"] = {
        enUS = "Any",
        deDE = "Beliebig",
    },
    ["VALUE_NONE"] = {
        enUS = "None",
        deDE = "Keines",
    },
    ["VALUE_FRIENDLY"] = {
        enUS = "Friendly",
        deDE = "Freundlich",
    },
    ["VALUE_ENEMY"] = {
        enUS = "Enemy",
        deDE = "Feindlich",
    },
    ["VALUE_TARGET_TARGET"] = {
        enUS = "Target of Target",
        deDE = "Ziel des Ziels",
    },
    ["VALUE_FOCUS"] = {
        enUS = "Focus",
        deDE = "Fokus",
    },
    ["VALUE_PET"] = {
        enUS = "Pet",
        deDE = "Begleiter",
    },
    ["VALUE_ALWAYS"] = {
        enUS = "Always",
        deDE = "Immer",
    },
    ["VALUE_CD"] = {
        enUS = "CD",
        deDE = "Mit CD",
    },
    ["VALUE_NO_CD"] = {
        enUS = "No CD",
        deDE = "Ohne CD",
    },
    ["VALUE_ON"] = {
        enUS = "on",
        deDE = "an",
    },
    ["VALUE_OFF"] = {
        enUS = "off",
        deDE = "aus",
    },
    ["VALUE_ENABLED"] = {
        enUS = "enabled",
        deDE = "aktiviert",
    },
    ["VALUE_DISABLED"] = {
        enUS = "disabled",
        deDE = "deaktiviert",
    },
    ["VALUE_NATIVE"] = {
        enUS = "native",
        deDE = "nativ",
    },
    ["VALUE_FALLBACK"] = {
        enUS = "fallback",
        deDE = "Fallback",
    },
    ["DELETE_AURA_CONFIRM"] = {
        enUS = "Delete '[%s] %s'?",
        deDE = "'[%s] %s' löschen?",
    },
    ["ICON_PATH_HELP_TITLE"] = {
        enUS = "Icon path or texture ID",
        deDE = "Iconpfad oder Textur-ID",
    },
    ["ICON_PATH_HELP"] = {
        enUS = "Enter a path such as Interface\\Icons\\Spell_Nature_StarFall, or a numeric texture ID. Disable Autodetect to keep your manual icon.",
        deDE = "Gib einen Pfad wie Interface\\Icons\\Spell_Nature_StarFall oder eine numerische Textur-ID ein. Deaktiviere Automatisch, um dein manuelles Icon beizubehalten.",
    },
}

local locale = GetLocale() == "deDE" and "deDE" or "enUS"
addon.localization = terms
addon.L = setmetatable({}, {
    __index = function(_, key)
        local term = terms[key]
        return term and (term[locale] or term.enUS) or key
    end,
})
