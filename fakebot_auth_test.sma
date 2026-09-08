#include <amxmodx>

public plugin_init()
{
    register_plugin("FakeBot Auth Test", "1.0", "dragon/OpenAI")
    register_concmd("amx_fakebot_test", "cmd_test", ADMIN_RCON)
}

public cmd_test(id, level, cid)
{
    new maxp = get_maxplayers()
    new name[32], authid[64]

    console_print(id, "----- FakeBot Auth Test -----")

    for (new i = 1; i <= maxp; i++)
    {
        if (!is_user_connected(i))
            continue

        get_user_name(i, name, charsmax(name))
        get_user_authid(i, authid, charsmax(authid))

        console_print(id, "#%d %-24s auth=[%s] is_user_bot=%d", i, name, authid, is_user_bot(i))
    }

    console_print(id, "-----------------------------")
    return PLUGIN_HANDLED
}
