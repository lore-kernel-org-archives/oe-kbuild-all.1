Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F099EA1
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Aug 2023 02:47:16 +0000 (UTC)
X-SpamFilter-By: ArmorX SpamTrap 5.77 with qID 37V2eK2M1021782, This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36505.realtek.com.tw[172.21.6.25])
	by rtits2.realtek.com.tw (8.15.2/2.81/5.90) with ESMTPS id 37V2eK2M1021782
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 31 Aug 2023 10:40:20 +0800
Received: from RTEXMBS06.realtek.com.tw (172.21.6.99) by
 RTEXH36505.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.32; Thu, 31 Aug 2023 10:40:38 +0800
Received: from RTEXDAG02.realtek.com.tw (172.21.6.101) by
 RTEXMBS06.realtek.com.tw (172.21.6.99) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34; Thu, 31 Aug 2023 10:40:37 +0800
Received: from RTEXDAG02.realtek.com.tw ([fe80::4487:9c61:3072:c8d4]) by
 RTEXDAG02.realtek.com.tw ([fe80::4487:9c61:3072:c8d4%5]) with mapi id
 15.01.2375.007; Thu, 31 Aug 2023 10:40:37 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: kernel test robot <lkp@intel.com>, "kvalo@kernel.org" <kvalo@kernel.org>
CC: "oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>,
        "Kevin
 Yang" <kevin_yang@realtek.com>,
        "linux-wireless@vger.kernel.org"
	<linux-wireless@vger.kernel.org>
Subject: RE: [PATCH 1/6] wifi: rtw89: mcc: initialize start flow
Thread-Topic: [PATCH 1/6] wifi: rtw89: mcc: initialize start flow
Thread-Index: AQHZ2h+JnUG3RF/gi0SW0F+ZdLzKurACUGuAgAFkJHA=
Date: Thu, 31 Aug 2023 02:40:37 +0000
Message-ID: <649b583bd1da41bd895cb84345485af9@realtek.com>
References: <20230829021918.14599-2-pkshih@realtek.com>
 <202308302155.2snig4j9-lkp@intel.com>
In-Reply-To: <202308302155.2snig4j9-lkp@intel.com>
Accept-Language: en-US, zh-TW
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [172.21.69.25]
x-kse-serverinfo: RTEXMBS06.realtek.com.tw, 9
x-kse-antispam-interceptor-info: fallback
x-kse-antivirus-interceptor-info: fallback
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-ServerInfo: RTEXH36505.realtek.com.tw, 9
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-Antivirus-Interceptor-Info: fallback
X-KSE-AntiSpam-Interceptor-Info: fallback



> -----Original Message-----
> From: kernel test robot <lkp@intel.com>
> Sent: Wednesday, August 30, 2023 9:25 PM
> To: Ping-Ke Shih <pkshih@realtek.com>; kvalo@kernel.org
> Cc: oe-kbuild-all@lists.linux.dev; Kevin Yang <kevin_yang@realtek.com>; l=
inux-wireless@vger.kernel.org
> Subject: Re: [PATCH 1/6] wifi: rtw89: mcc: initialize start flow
>=20
> >> ERROR: modpost: "__umoddi3" [drivers/net/wireless/realtek/rtw89/rtw89_=
core.ko] undefined!

I will use div_u64_rem() instead, and send v2.

Ping-Ke

