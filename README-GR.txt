ReHLDS FakeBot Auth STABLE - ReHLDS 3.14.0.857 / Linux i386

ΤΙ ΚΑΝΕΙ
- Τα YaPB/fake clients δείχνουν Steam2-style ID στο `status`.
- Το ΙΔΙΟ ID επιστρέφεται από PF_GetPlayerAuthId().
- Άρα AMXX get_user_authid() μπορεί να πάρει SteamID αντί για BOT.
- Το ID παράγεται από το όνομα του bot με FNV-1a και παραμένει ίδιο για το ίδιο bot name μετά από reconnect/restart.
  Αυτό είναι πολύ καλύτερο για rank/stats databases από το random-per-connection patch.

ΣΗΜΑΝΤΙΚΟ
- ΔΕΝ αφαιρείται το FL_FAKECLIENT.
- is_user_bot(id) θα συνεχίσει να επιστρέφει 1.
- Αν ένα RankSystem έχει `if (is_user_bot(id)) return;`, θα πρέπει να αφαιρεθεί/αλλαχθεί αυτός ο έλεγχος.
- Δεν γίνεται πραγματικό Steam authentication. Τα IDs είναι fake identifiers για engine/plugin compatibility.

BUILD
1. Φτιάξε νέο GitHub repository.
2. Ανέβασε όλο το περιεχόμενο του φακέλου, μαζί με `.github`.
3. GitHub -> Actions -> Build patched ReHLDS i386 -> Run workflow.
4. Κατέβασε το artifact `engine_i486-fakebot-auth-stable-3.14.0.857-legacy`.
5. Μέσα θα είναι το `engine_i486.so`.
6. Κράτα backup από το τωρινό engine, full stop, αντικατάσταση στο server root, full start.

TEST
Compile/install το `fakebot_auth_test.sma` και τρέξε από console:

amx_fakebot_test

Θέλουμε για bot:
auth=[STEAM_0:1:XXXXXXXX]
is_user_bot=1

Και στο `status` το ίδιο SteamID.
