//====== QUIZ
new quiz,
	answers[256],
	answermade,
	qprs;

CMD:makequiz(playerid, params[])
{
	if(pData[playerid][pAdmin] > 4)
	{
		new tmp[128], string[256], str[256], pr;
		if(sscanf(params, "s", tmp)) {
			Usage(playerid, "/makequiz [option]");
			Usage(playerid, "question, answer, price, end");
			Info(playerid, "Create question first!!.");
			return 1;
		}
		if(!strcmp(tmp, "question", true, 8))
		{
			if(sscanf(params, "s[128]s[256]", tmp, str)) return Usage(playerid, "/makequiz question [question]");
			if (quiz == 1) return Error(playerid, "Kuis sudah dimulai kamu bisa mengakhirinya dengan /makequiz end.");
			if (answermade == 0) return Error(playerid, "tolong buat jawaban dulu...");
			if (qprs == 0) return Error(playerid, "Tolong tambahkan hadiah terlebih dahulu.");
			format(string, sizeof(string), "{7fffd4}[QUIZ]: {ffff00}%s?, Price {00FF00}$%d.", str, qprs);
			SendClientMessageToAll(0xFFFF00FF, string);
			SendClientMessageToAll(-1,"{ffff00}/answer - to answer.");
			quiz = 1;
		}
		else if(!strcmp(tmp, "answer", true, 6))
		{
			if(sscanf(params, "s[128]s[256]", tmp, str)) return Usage(playerid, "/makequiz answer [answer]");
			if (quiz == 1) return Info(playerid, "Kuis sudah dimulai kamu bisa mengakhirinya dengan /makequiz end.");
			answers = str;
			answermade = 1;
			format(string, sizeof(string), "Anda telah membuat jawaban, {00FF00}%s.", str);
			SendClientMessage(playerid, 0xFFFFFFFF, string);
		}
		else if(!strcmp(tmp, "price", true, 5))
		{
			if(sscanf(params, "s[128]d", tmp, pr)) return Usage(playerid, "/makequiz price [amount]");
			if (quiz == 1) return Error(playerid, "Kuis sudah dimulai kamu bisa mengakhirinya dengan / makequiz end.");
			if (answermade == 0) return Error(playerid, " Membuat jawabannya lebih dulu...");
			if (pr <= 0) return Error(playerid, "buat harga lebih besar dari 0!");
			qprs = pr;
			format(string, sizeof(string), "Anda telah menempatkan {00FF00}%d sebagai jumlah hadiah untuk kuis.", pr);
			SendClientMessage(playerid, 0xFFFFFFFF, string);
		}
		else if(!strcmp(tmp, "end", true, 3))
		{
			if (quiz == 0) return Error(playerid, "Sayangnya tidak ada kuis dari admin server.");
			SendClientMessageToAll(0xFF0000FF, "Sayangnya Admin server telah mengakhiri kuis tersebut.");
			answermade = 0;
			quiz = 0;
			qprs = 0;
			answers = "";
		}
	}
	else return PermissionError(playerid);
	return 1;
}

CMD:answer(playerid, params[])
{
	new tmp[256], string[256];
	if (quiz == 0) return Error(playerid, "No quiz active!.");
	if (sscanf(params, "s[256]", tmp)) return Usage(playerid, "/answer [jawaban]");
	if(strcmp(tmp, answers, true)==0)
	{
		GivePlayerMoneyEx(playerid, qprs);
		format(string, sizeof(string), "[QUIZ]: %s telah memberikan jawaban yang benar '%s' dari kuis dan mendapatkan hadiah {00FF00}%d.", ReturnName(playerid), answers, qprs);
		SendClientMessageToAll(0xFFFF00FF, string);
		answermade = 0;
		quiz = 0;
		qprs = 0;
		answers = "";
	}
	else
	{
		Error(playerid,"Jawaban yang salah coba keberuntungan Anda lain kali.");
	}
	return 1;
}
