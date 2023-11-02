Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1220ED8
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Nov 2023 00:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-SpamFilter-By: ArmorX SpamTrap 5.78 with qID 3A20kiqeF2130566, This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36506.realtek.com.tw[172.21.6.27])
	by rtits2.realtek.com.tw (8.15.2/2.93/5.92) with ESMTPS id 3A20kiqeF2130566
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 2 Nov 2023 08:46:44 +0800
Received: from RTEXMBS04.realtek.com.tw (172.21.6.97) by
 RTEXH36506.realtek.com.tw (172.21.6.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.17; Thu, 2 Nov 2023 08:46:45 +0800
Received: from RTEXMBS04.realtek.com.tw (172.21.6.97) by
 RTEXMBS04.realtek.com.tw (172.21.6.97) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Thu, 2 Nov 2023 08:46:44 +0800
Received: from RTEXMBS04.realtek.com.tw ([fe80::40c2:6c24:2df4:e6c7]) by
 RTEXMBS04.realtek.com.tw ([fe80::40c2:6c24:2df4:e6c7%5]) with mapi id
 15.01.2375.007; Thu, 2 Nov 2023 08:46:44 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: kernel test robot <lkp@intel.com>
CC: "oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Kalle Valo
	<kvalo@kernel.org>
Subject: RE: drivers/net/wireless/realtek/rtw89/coex.c:1448:17: warning: writing 8 bytes into a region of size 0
Thread-Topic: drivers/net/wireless/realtek/rtw89/coex.c:1448:17: warning:
 writing 8 bytes into a region of size 0
Thread-Index: AQHaCyb77GwApLO1gkiavUd4YVAIPrBmM1uQ
Date: Thu, 2 Nov 2023 00:46:44 +0000
Message-ID: <92fba00735f3483cbbc77ad986cd7c16@realtek.com>
References: <202310301908.Wrj0diqe-lkp@intel.com>
In-Reply-To: <202310301908.Wrj0diqe-lkp@intel.com>
Accept-Language: en-US, zh-TW
Content-Language: zh-TW
x-originating-ip: [172.21.69.94]
x-kse-serverinfo: RTEXMBS04.realtek.com.tw, 9
x-kse-antivirus-attachment-filter-interceptor-info: license violation
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0



> -----Original Message-----
> From: kernel test robot <lkp@intel.com>
> Sent: Monday, October 30, 2023 7:48 PM
> To: Ping-Ke Shih <pkshih@realtek.com>
> Cc: oe-kbuild-all@lists.linux.dev; linux-kernel@vger.kernel.org; Kalle Va=
lo <kvalo@kernel.org>
> Subject: drivers/net/wireless/realtek/rtw89/coex.c:1448:17: warning: writ=
ing 8 bytes into a region of size
> 0

   drivers/net/wireless/realtek/rtw89/coex.c: In function '_append_tdma':
>> drivers/net/wireless/realtek/rtw89/coex.c:1448:17: warning: writing 8 by=
tes into a region of size 0 [-Wstringop-overflow=3D]
    1448 |                 memcpy(v, &dm->tdma, sizeof(*v));
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

> e3ec7017f6a20d Ping-Ke Shih 2021-10-11  1442
> e3ec7017f6a20d Ping-Ke Shih 2021-10-11  1443    tlv =3D (struct rtw89_btc=
_btf_tlv *)&btc->policy[len];
> e3ec7017f6a20d Ping-Ke Shih 2021-10-11  1444    tlv->type =3D CXPOLICY_TD=
MA;
> ce986f3dc4fc69 Ching-Te Ku  2022-07-25  1445    if (chip->chip_id =3D=3D =
RTL8852A) {
> ce986f3dc4fc69 Ching-Te Ku  2022-07-25  1446            v =3D (struct rtw=
89_btc_fbtc_tdma *)&tlv->val[0];
> e3ec7017f6a20d Ping-Ke Shih 2021-10-11  1447            tlv->len =3D size=
of(*v);
> e3ec7017f6a20d Ping-Ke Shih 2021-10-11 @1448            memcpy(v, &dm->td=
ma, sizeof(*v));

This statement is to append a struct named rtw89_btc_fbtc_tdma to value fie=
ld of
a TLV struct, but compiler warns dst of memcpy() because of tlv->val[]. May=
be,
this is a false alarm?

Anyway, for this case, a simple assignment "*v =3D dm->tdma;" would be easi=
er to
understand what it wants and also avoid compiler warnings. Then, I sent a
patch [1] for this.

[1] https://lore.kernel.org/linux-wireless/20231102003716.25815-1-pkshih@re=
altek.com/T/#u

