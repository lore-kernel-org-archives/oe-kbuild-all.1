Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010035.outbound.protection.outlook.com [52.101.228.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E672520010C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 27 Sep 2025 16:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758989476; cv=fail; b=dVO6+ay1Qnq7S6GsY47GEUnEKxCR1KEY+uWYbU4aMOWLy1M/NUP5QNIh+X66MXiiVhLsBviPQod8MNJVhpueYrFY/Imip5GaTTV1xMQLYm7kLPDkeMvmc6T0/JbXUe4/xdNw3QFBSp5Bp/amN8B1oYwPDKP8Mjix+kJ4UBousTQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758989476; c=relaxed/simple;
	bh=5u+ai0QXNbPpNZZhUhDK4Mruvmb/ovUCuaYKyDfIz5w=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ZWyu5MobFWR86JnAXwCrlhq5eCgOVc58qckF6hQycW4T9i33/HE0NQxC+iKQL+Vbm8iGuasdYyzm6TciItmN7HR5RUX1aptsUJMiBU7TwbdKfVpsSRC//tp9tmXa7Ug0jVMrTZvbvihk3U1pTRWwBebxnoXvqIQGWdwruOyC91E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=l0cCzFr6; arc=fail smtp.client-ip=52.101.228.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="l0cCzFr6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P6mc8lvmousjRO5Ghcv8zZcd/RTmzrTUr4XBECtodLM2NQtsKrO+/BYQwFNCInUcn1gISwSEhxP/0Tve7nu5O7NCtLigclmHtprP1g0HCM1dvmaCDW2tMBOtN3xieauPK7YRuyukkJpU/Z3xcDZZW1OVpz+ReVekydlBZvgIpnEMenvZs93yKrgZTHoUZ60AxjXvzEPSTWJkFLiSZMNdLZl9Ck4QrIDazCa+aZmcI4PtT/32hhybyXaK6+po11Z8Bzg8/H2ahFmvCEFC8X0qM+TgxDNasvYP1Caf5o4BTmVyGCc+vmYnzFFHYmGthkYbarOjTSFkE26P0kCHp2ukSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jPFEhkSpW/zTu/rOyz6IFdbeUl9V8XNiVU7OzfyyyBc=;
 b=anolvBeYILSo3wU96NXpQPKYrswNXrOEzDAjbvh5dQdptJT+90V9gWfPDA945OYxSFIhpqZorao992SbGzCU6vmZ1tTS7ilC2QEbLdEjkJNvVoeTG62SKJFLnGv0cDtphlyeAbELSSLzCzJKY6PCxbSuPP9gPSHqkvoXX1ezj2RDS9IHH6SLjHWO6J1MiCqfwSwO6Zo6Pg5qqnDTuners2/9CR7yJJmnxoshHGoyY/PVqyxOPBcgJ+j+O25XeAgkLShAyHnsI5bbvScYf0bFkT139YQ0FD7rCqgUKWes33hqmL5ns6IiNp2pcdoM5rOYzgA5TqOqytByAz5Xas6dZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jPFEhkSpW/zTu/rOyz6IFdbeUl9V8XNiVU7OzfyyyBc=;
 b=l0cCzFr6XxCTIQw6hBTWCu3pzNU9tmGScTCOqEw+L3U4XitRy9jMIM5fxgTmLjjWD/TADY23mrhWZ5su2jgwU/rA/89vloTDUpre8e8qPL11R+sOIYhwHl6aKQ8Bz8XqxmupaZ3gQRLiUsKMx7bCxLEUZTZNGyvDbFiMX1s08JY=
Received: from OSCPR01MB14647.jpnprd01.prod.outlook.com (2603:1096:604:3a0::6)
 by OS9PR01MB12245.jpnprd01.prod.outlook.com (2603:1096:604:2e7::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.15; Sat, 27 Sep
 2025 16:11:04 +0000
Received: from OSCPR01MB14647.jpnprd01.prod.outlook.com
 ([fe80::40e:e798:1aea:ca82]) by OSCPR01MB14647.jpnprd01.prod.outlook.com
 ([fe80::40e:e798:1aea:ca82%4]) with mapi id 15.20.9160.013; Sat, 27 Sep 2025
 16:11:00 +0000
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: kernel test robot <lkp@intel.com>, Daniel Lezcano
	<daniel.lezcano@linaro.org>
CC: "oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>, Daniel
 Lezcano <daniel.lezcano@linaro.org>, Biju Das <biju.das.jz@bp.renesas.com>
Subject: RE: [thermal:thermal/linux-next 23/24] make[6]: *** No rule to make
 target 'drivers/thermal/renesas/rzg3e_thermal.o', needed by
 'drivers/thermal/renesas/'.
Thread-Topic: [thermal:thermal/linux-next 23/24] make[6]: *** No rule to make
 target 'drivers/thermal/renesas/rzg3e_thermal.o', needed by
 'drivers/thermal/renesas/'.
Thread-Index: AQHcL7vPCMMtXXrTTEqra29KsjFnvbSnML/g
Date: Sat, 27 Sep 2025 16:11:00 +0000
Message-ID:
 <OSCPR01MB14647236D33DECC1590DB26EBFF19A@OSCPR01MB14647.jpnprd01.prod.outlook.com>
References: <202509272225.sARVqv2G-lkp@intel.com>
In-Reply-To: <202509272225.sARVqv2G-lkp@intel.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSCPR01MB14647:EE_|OS9PR01MB12245:EE_
x-ms-office365-filtering-correlation-id: 588dac9e-667f-4bb4-018e-08ddfde07348
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7053199007|38070700021|13003099007;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?oMbqqKTlTH8D5oOX5CwDbWS3ah3S/yqxq7e9FetHFpxL3dBO3aTv6c9fiP4Z?=
 =?us-ascii?Q?9OmY8utVmPrlE7vYU83FqNVLdZEPO5xamiPsoeYtJUuEdITsxKte2tgSZmb0?=
 =?us-ascii?Q?wXYHMsthvUDqwPYaZ2ewiyBdZrrGYiod2Rfowb6n9UeJePhp/jgCUAouVIIN?=
 =?us-ascii?Q?I5VhO/Ld7Hm1m9/rK7HuwFaqdXvW9sJlfMig1rHBdIUnc9C2x/5zkrL8JXvD?=
 =?us-ascii?Q?3NHL338gYa4rrXLhhCKZeEt9522u6CzkjAtbCXfVN7IN3J92iC8S0RYsekF1?=
 =?us-ascii?Q?79n8Hf/xPGzZCu1AwO0Ixi+d9QSZQmuaFZoyJqvWrLZX4q630kzEdlI9u39s?=
 =?us-ascii?Q?Gu2dj4pdyU2K1tdSOpwCeAiRkO1yiWGSpGy7jVnZjY/IA1f58ePqjl8vIAaO?=
 =?us-ascii?Q?/WvPeL1fMPag5nT8l+FhOaKfSWSTZ27cPQmKMDj7HC0FpPd57x5c3LSFYilk?=
 =?us-ascii?Q?WrT13+i3BXjd/tipx2Hjpq8K2gbXIJ9iX2IROjUQFOHtGpfEN7JEjbt6YI0y?=
 =?us-ascii?Q?XcLeNUG5UTtXWzVrGUf7mpscLB9jAvdJhEY+72dNW5a+q1Tuz5hXjo0gT+42?=
 =?us-ascii?Q?aYMyGqhET6DVAV4M8kDPjSSWKzhFfU4F73STjZxlFAgeRdaTren/WmPP8mQt?=
 =?us-ascii?Q?AaA1SphS5biG1EPD6e3MKGySFa+hYrjMSdzZN034bl2k42HbsHn2yZmisA5v?=
 =?us-ascii?Q?6b0JB1ZOmtHvcsTCg8g51kQuumFzzYGRxf0tPRJ0V6rqlyCJhpJFrbuvYIzO?=
 =?us-ascii?Q?fPklJVL4V58G8v7NKyVJbRWs1Ax1Tj21wF/Y6mKedoCtTNerGaD6qBOAuWTd?=
 =?us-ascii?Q?nw2NjFYZ7N4gUQ7jGqRIRjCLCdeg+srPAZrn+czgVcvaaNPGg5IG81YBve2z?=
 =?us-ascii?Q?eSLOWtoX8CuLSj8NGg3Nvl/9rNP7JCGA9NHVFiVcSO5eEXKwniMoSUE+pI3m?=
 =?us-ascii?Q?ScNM2P0weQZ2S6xK6vmRY3BAswH4EmH5vfSurv+8jM1dywrDCKGVXzND6S2g?=
 =?us-ascii?Q?Ahz9NC87dfiwC7eigOUVVdCSZ07QP7rIAuArA41Kj1yMPvg0rUDZDulQMFo4?=
 =?us-ascii?Q?cA6WbydQ1AIzrAF8KN6qK+QvvHF61v0OqjxmIrtCmkg7A641CsiwOzX4H1Z5?=
 =?us-ascii?Q?B0VLfeTmL+gwzJn3CJn0V1JIOie8UouztHJU9fnn3lCbYtIiFAcIkYBV1ShJ?=
 =?us-ascii?Q?3B6Jccp4k7kT5ZbATBAn3ayXC802fvgf153N8U43Lgd7RTh98RL5CLFJC6oP?=
 =?us-ascii?Q?jkpLP1iJ9P2vyD27EFaqe2jv5oU+5gQmH8+YCDd2xbpMRjHgUooTDVPNaBBd?=
 =?us-ascii?Q?YlL0Gux3tvWbq3QzA59T/CQ+mTwFyzluLbfuQoeHSzy6ITEsq8Io38S/z5Pz?=
 =?us-ascii?Q?VvjvZSLy/n+NCI+iEeZQELQuacj8R+KibAhYMYkyoBVai1rE6xGBGdEfkJJh?=
 =?us-ascii?Q?v34tQ1OqEaYgY5mY0rPekEV6Pia5KROf9MF+CjRyNUwIAQlQg1oUFw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSCPR01MB14647.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007)(38070700021)(13003099007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?EyuQSKBhZ7m2madenSQnvsHq/W71yQX7DuReOBYfcWlSargu58sWH/HZL2jb?=
 =?us-ascii?Q?8LXuFG6jwTLOj6VBbqq1WPyAKFypleecTHcbwZT7WpJZcsF6kn06g1D3LFUr?=
 =?us-ascii?Q?gC4dlY/7nh7xqwKLE5Ic4y3hGrzoELMaivrLGgVYfGv2mli5fw0k1BqbwKA/?=
 =?us-ascii?Q?/zri62/SxtVtfWGhFjRdx209r+i9gHC9rmzlHiha7y40qbu1cUKMoi6hkqxw?=
 =?us-ascii?Q?5sOYLi6/yzTH66WYaqn5aei0DmfLh/SJVz9C8Zz2kNuKojzvHfhPtHvEe2yU?=
 =?us-ascii?Q?AzJMY3X+84uI6QNC+Zzz38I8lyqSKkutRJ67jxuTNcM4idvcLSx1MSjZ8ahn?=
 =?us-ascii?Q?vVd18zgF/iVEKWt/LoCoeKqSdITsd7IFlyF+dXliFsU/vEoQWaJ2/c0b3hN3?=
 =?us-ascii?Q?ZaE7QQY31mgjyEATWRL++5E8Y4tx21MpaI/hS3vsQvG9L7gUNgkwxK0/XLbi?=
 =?us-ascii?Q?rDxHRZ/kMIIxU8X5Q1sNGaz94pjJtYpV/MPcJC2w8uguTuF02maICvC62Dmw?=
 =?us-ascii?Q?wxzWKjOXQy6GOOoPLVJSYmaNkQs178+7UXc+qDr8FDT7WCd2R32RG8apoPp1?=
 =?us-ascii?Q?uCIIwR1F80L0ErU/EUW3m4ewclJ8mW0wvPf/GTN7wROHZwhhFYad5bZsLWrx?=
 =?us-ascii?Q?7ugQc4GZDKNKxVw8fLGzBnncXPlcp72OKZVCtxi1WwkJynt7GaCK40oTrB2h?=
 =?us-ascii?Q?JRRK6tbGSbAXG2XTeRmJtfMTOtHF/Uvu+ZlMclIEGlnV55DkUhqo7IUY/dhw?=
 =?us-ascii?Q?V6hm31aUwBsHyuHNYL4fy4QENXdyHyf1PEQMVmKNORMgJzAj+jdJg6mc46tw?=
 =?us-ascii?Q?k+YMbCs1ugZPngMKVsMiJZDb+2lxEaZGU6LvOhJierEuxY9WHuR0EP7rn5zZ?=
 =?us-ascii?Q?M1sZ2pzAsS0Pe759uIceR5W1gaO7Fry5rmASb67NBZFHatINFQDdfsNEFCI1?=
 =?us-ascii?Q?2vApP4llHFxHBoBoYrvIWnVu5Mvi020N+xuMX3mFrZeJVemYxHOlSJv6Z0uX?=
 =?us-ascii?Q?8wE0+KfNVSiYY9MFK7dFBC21PDioW9f0sdURsGP76MozLwZVcbKMJhMJWrAf?=
 =?us-ascii?Q?8SI7fjGlKWzJ6GJDq5SGTKkKzm2/pQX2hvT0xNvD+5NuViiTkM2Mern8nk1h?=
 =?us-ascii?Q?aKasZqJi4URBJfcTfp8QaF2ml2qwXRbufHv82XIe6RM9P+2qiUbi7WU/YTs1?=
 =?us-ascii?Q?KXYyuHOSA/FuAj4IVKd/zzLvqKP5+KRSpkQ0qfcrYaLbWD/v5I317kEIHMu9?=
 =?us-ascii?Q?yRauDj0+rNYjTPWvUIyuoAkuNlmNJvJqsQ6DEqSfOMIYEsSF0k8we6ZeT9mL?=
 =?us-ascii?Q?VchO+hFJfmKxlt88dcDFzlrg3jR3Ze9JB3SfVzJyPUM7bqV3Tl0aFUc1pkCL?=
 =?us-ascii?Q?iOcUO0doSBFpCkrtRURGEQLE+RLeZaxof4IMs5Y5P1UR0E822SNcdtQWQsI5?=
 =?us-ascii?Q?a3b7eTLqbvniP3nHkGwRE46XsG4apwuGwveLuYljMJqH7uxLTy8i/ITlrkG7?=
 =?us-ascii?Q?99Wvg94qIRVdpl8TggxLbXAO8m3U1FgSHtR2b3VxgtP1EccYsQMyyGBQ5PEB?=
 =?us-ascii?Q?fbnwNhlhRQI8hZNtCua8HokQmNU40QDf8US8dj3EHzlQ5hTR9osZPVEHCV81?=
 =?us-ascii?Q?pg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSCPR01MB14647.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 588dac9e-667f-4bb4-018e-08ddfde07348
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2025 16:11:00.4767
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pwgky9EuaiwzSqB7+rs07Rmj/u3OtmVVffnlEbDg2n66sHHRiFmiQWHpabH9StUXmnarCwzPP3oeSaWaf4zXWlqg9ELnc86F6YuLuOM27EY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB12245

Hi Robot,

Thanks for the notification.

> -----Original Message-----
> From: kernel test robot <lkp@intel.com>
> Sent: Saturday, September 27, 2025 4:34 PM
> To: John Madieu <john.madieu.xa@bp.renesas.com>
> Cc: oe-kbuild-all@lists.linux.dev; Daniel Lezcano
> <daniel.lezcano@linaro.org>; Biju Das <biju.das.jz@bp.renesas.com>
> Subject: [thermal:thermal/linux-next 23/24] make[6]: *** No rule to make
> target 'drivers/thermal/renesas/rzg3e_thermal.o', needed by
> 'drivers/thermal/renesas/'.
>=20
> Hi John,
>=20
> First bad commit (maybe !=3D root cause):
>=20
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thermal/linux.git
> thermal/linux-next
> head:   79428e60897916401c9ed326f6ada4d7c7c997a3
> commit: 19d3a401a617c68e9487f55b9f2efe213f8f949d [23/24]
> thermal/drivers/renesas/rzg3e: Add thermal driver for the Renesas RZ/G3E
> SoC
> config: m68k-allmodconfig (https://download.01.org/0day-
> ci/archive/20250927/202509272225.sARVqv2G-lkp@intel.com/config)
> compiler: m68k-linux-gcc (GCC) 15.1.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-
> ci/archive/20250927/202509272225.sARVqv2G-lkp@intel.com/reproduce)
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new
> version of the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes:
> | https://lore.kernel.org/oe-kbuild-all/202509272225.sARVqv2G-lkp@intel.
> | com/
>=20
> All errors (new ones prefixed by >>):
>=20
> >> make[6]: *** No rule to make target
> 'drivers/thermal/renesas/rzg3e_thermal.o', needed by
> 'drivers/thermal/renesas/'.
>    make[6]: Target 'drivers/thermal/renesas/' not remade because of error=
s.

It looks like while applying the patch [1] in thermal tree,
maintainer probably missed adding the .c file, while original
submission [2] includes it.

Daniel, may be can you double check please ?
Or am I missing something ?

[1] https://git.kernel.org/pub/scm/linux/kernel/git/thermal/linux.git/commi=
t/?h=3Dthermal/linux-next&id=3D19d3a401a617c68e9487f55b9f2efe213f8f949d
[2] https://lore.kernel.org/all/20250917170202.197929-3-john.madieu.xa@bp.r=
enesas.com/


Regards,
John
>=20
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
