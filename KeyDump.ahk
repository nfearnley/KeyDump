; KeyDump
; -------
; To run, type CTRL+ALT+K
; To see the results, paste your clipboard into a text editor

SendMode, Input
GetKey(k)
{
    name := GetKeyName(k)
    vk := GetKeyVK(k)
    sc := GetKeySC(k)
    return Format("vk{:02x}sc{:03x} {:s}`r", vk, sc, name)
}

hex := ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "a", "b", "c", "d", "e", "f"]

^!k::
    output := "# Virtual Key Codes`r"
    for i, h1 in hex
        for i, h2 in hex
            output := output . GetKey("vk" . h1 . h2)

    output := output . "`r# Scan Codes`r"
    for i, h1 in hex
        for i, h2 in hex
            for i, h3 in hex
                output := output . GetKey("sc" . h1 . h2 . h3)
    clipboard := output
    SoundPlay, *-1
