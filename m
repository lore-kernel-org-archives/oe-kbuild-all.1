Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011044.outbound.protection.outlook.com [52.101.65.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 135DF8248B
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Jul 2026 03:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782874997; cv=fail; b=p6+82Ow8e6PkBFWaE0/Zx3+YZuvwsgYeI/TuaKWiGT19I+h/4mJlJ7+nUX6GU8Dqzw8cfT2IAzWr3J4gg1rXRuDpQlsnED/jvjTvN9zbK+bgBNZC26OGUKXnge4ibHGGjCmRh3NuDpQmcxdWb3/Qip/Lweq6Toi1SymPZY6jHtg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782874997; c=relaxed/simple;
	bh=GkwzqGMNK7YXwGmanT/N7nfeeKu6lrBcoKh+Nvhnn/8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=OvPX5av8czMlgaRMhM8I0mhIfQptgYuUrKdKWnveeQHSkdGqe0xCvaTkfcu/W7sR6BVptQ0+Bw+iXLU6c0CfPRF6OaG4Mp9wKEVwe5PgpJ0y2hzFYOb7eGQounW7mHKBWeASPPW13pspbzFe3khrhP6hZ63b6YvP8iyRlxfa4lw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=c6QaqDHZ; arc=fail smtp.client-ip=52.101.65.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="c6QaqDHZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JJ+KJvA/PTJKqD2ysODipFLExh1kIJvaTb9vD5x75TeMnHFYLDWS6mfpr57c3cCTVLXrIDoiLuf2Th7SsYPZWQWCusxGZEZ6o5gamMERUqA5Xnmk9wvoF31M4NewC9OUkKTO6TDYZeiWYyo1O0mfj/yvTOE7jpWzMf5DBy23OLlbIOSGNY8qSxFZSnoIHNUKLNbx6FWglAkb0Xnk/duhGFgxCzw9mFgsnyesqTyT6Sot2IRu50zi1wwLUn7TUig2CeoF+rs/HS2dNtOveH686jTKDquROSe3G6YPNrbuX+Z6CzBIBnnLwNJLrC93ztv/WVGG/n6ynE0cXFcf0ZXQ2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8JOq1KQimNFK+KznT8KsjxzsAmWHZOzPQPAS9IBenFE=;
 b=MkrPfAE9pPDtA/789aK8ybDuwjJdaX33Bp92GLboA2j/NPpreuS0g958/b6b+X/PkCLeIoiGs8s15w/zPBbYkuRItMRFPfb3a/H+I+5FBW4i8NtbndCmcv/pSyVpCJT+MtgUW5LqNLTKrwEonZt2LLx0nVszw6OlH//t+AU5u62mCo49I1i0iiJU8oXJncGVvHbMQkoqwOQlLI+zP1cumoPUZVNnYLyZpxR8dmqe64S7aE+1/dDtwIYYp9IY8F7Tz5liNDnKTQnutrS4IWriHWAS7SDm1h3dcaEE2zEaYSHbnu7ll1trJohbtnN/JEm0QInqPVdWA0G8kQ5Arpg+0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8JOq1KQimNFK+KznT8KsjxzsAmWHZOzPQPAS9IBenFE=;
 b=c6QaqDHZxQF58gMlcIflHJXP85tqJVwovkkDumccxuTwxh6F0n6B5yNeqfxyWBUEudcfCNT6G5aSKTr2ZjB061s7f1JRQLf1fTLOlW7KZM8RXLBCt/Hdo4sDOuFFp04ATbkHPV0HoEX22v55XDooz3SfBWoNbzVYEiFa0k0hzemcYaZQCXqQK6doRZJAPs+TWemnZZFdBDRjv9MOIZrMFbLcmhJVHdg+kB20RaJ5kB20LiGnShOCxzvrC2recf2m0pO38edTfp/wLymtYJJ12Lp9X8o35NhXWN3aAn5F2qwjb21mkrRNJe7mWmmh2f7iAuaomBfjYfhhSNMtLmQwJQ==
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13) by AS8PR04MB8529.eurprd04.prod.outlook.com
 (2603:10a6:20b:420::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 1 Jul 2026
 03:03:12 +0000
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994]) by VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994%6]) with mapi id 15.21.0159.015; Wed, 1 Jul 2026
 03:03:12 +0000
From: Sherry Sun <sherry.sun@nxp.com>
To: kernel test robot <lkp@intel.com>
CC: "oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Manivannan
 Sadhasivam <mani@kernel.org>, Frank Li <frank.li@nxp.com>
Subject: RE: pci-imx6.c:undefined reference to `pci_pwrctrl_power_off_devices'
Thread-Topic: pci-imx6.c:undefined reference to
 `pci_pwrctrl_power_off_devices'
Thread-Index: AQHdCQGctl3KBD+IPEWAcfmlGsVkCrZX+cGg
Date: Wed, 1 Jul 2026 03:03:12 +0000
Message-ID:
 <VI0PR04MB1211464F33BCAAA508D2D16F192F62@VI0PR04MB12114.eurprd04.prod.outlook.com>
References: <202607011039.GLadQKgQ-lkp@intel.com>
In-Reply-To: <202607011039.GLadQKgQ-lkp@intel.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI0PR04MB12114:EE_|AS8PR04MB8529:EE_
x-ms-office365-filtering-correlation-id: 2447d7a2-649b-43d9-0b94-08ded71d49d3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|19092799006|376014|23010399003|366016|1800799024|38070700021|11063799006|56012099006|18002099003|22082099003|4133799003;
x-microsoft-antispam-message-info:
 fcNZ2bA6plXHkF2Aex+ByGeQR5DpgSUWxzrxVjoRvTkHSmCP1E6tZgBNjOXs97HmdmUo/e+eq/yqyV4UiAe+s7LETqAnkmPQLrRTR/Uc7mfPd/WCA0+RUjSz/++TLu6b/wRFvpv7FfosA9G5buRSebSsJcVDSCFAjNntR1mXeGMdG74UqBrRnRKRm58xK5lv//EQ70kwwx/JCf/Ph754WiaYbdZv/F+gHX4l7P7FZL5PGk6SGYQ1XOrSOoKCHwSLmErv0+WzuL8lP9XjYdhhRShyRNBUtnPSsXdz4loTrJ16vNPaZ/+IcLx9wuYm+XXPlRY+ISdgpDJIRctZl2x25I7N5A/ahFZft+rIJ7juf/fbJm8xuQkDiHY3CfStxzU3PG2n+9KzEkyfBcNL0K3nDXOy9WqEGhlrgGVVswox8AW/e6L9URAof0EpL+08k5iDBTVwn0ad7F6DclNJLE+nZzScgQjm5axLRM+8e6goohH2XZ+dKCFxlbLj8FatOtHnSAHxkEZV0ZMEk5FVDksdNOhRR2BOWvksE3AMRwOfPjUMEeMQUNXasoyeYAjYAEj2sBlqHxoX8L69+QIbAjCLVvWsPuFe+icfGhoZYtoJOQY5Z6xElBKdDkJyDTZKSAFzgO4rzV38g/9M7QiCfPmb/bMWpTeQ8XPOiGkjEmKdQmk=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12114.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(23010399003)(366016)(1800799024)(38070700021)(11063799006)(56012099006)(18002099003)(22082099003)(4133799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?cy4Mukb8YuAy4u/BtxFqH6I4MdM+EoG63lapMX0KVB7oNuEkAZIrrec4R7rQ?=
 =?us-ascii?Q?uIcq41JPryylN7RbfuZH19g22GCgLxEaesuwczCXrrc5Bpd9kJtOyTCBuMoP?=
 =?us-ascii?Q?4/iPBahPcn2yWzHGxORgp3pFKhLwj0j9gC0i+DDfSSbZ2unyYeNKE56YW2J7?=
 =?us-ascii?Q?Fufryco+eDY/5cMkHHn9wGnaZMmnxJymyuN/t6yuA9VyiWRqfwuf/HX5iNDS?=
 =?us-ascii?Q?1MsLBcFmX5mZ3L8I7Xgr4v7o9Z5OaPMylNZCISeuls1Icjxww8tSUcDJo1qI?=
 =?us-ascii?Q?SViZw2KZqjvTQgEvcOqm2Dr+Llz1SbOunlOnlCnXqe508MEwv5IYOg4vt2p6?=
 =?us-ascii?Q?M4AE1ja80oa4LkPb2vqImDrw6DsBoXhVA64OLNFgyUkdOHCG/6a2+DmiGDRi?=
 =?us-ascii?Q?hPH3QCzCpVlJtJk3Wl6crkVIUTq4HV5paMNFluB9yiAPHzRMQt34GkxTlfhw?=
 =?us-ascii?Q?SzgJ/ac1ywJhUiBhNBwvBr8pTQKuaj+1KCu9IhjOBwPn87ciGRmQ9C+qmYXa?=
 =?us-ascii?Q?x5Ir2sZ+EgybqFGFurt3yIzcpCUotNY+UyUr2FtThfzDGVgPIussSUDXuawY?=
 =?us-ascii?Q?NLxsIaXMf5kbAnnPcna1ozW7ajR7H0I2rH3wFAUYzdKaODWj8LZq0Pc6Zwbw?=
 =?us-ascii?Q?sS8XIlgy9dcsryXfjS2c9cFXWPjUO5ifJk1x47z7ChFCIcrMLuuYk60XDJCh?=
 =?us-ascii?Q?8LeM5e1CNbawS4RRi5zehFFqh4NQRm9x3u7OMCj2C+9YYbnOFslyq+9NTFgA?=
 =?us-ascii?Q?Ee4yqD4clNkjgJhtuqJrIoyustnJ7q2biQORMOrYRg4+AI6CnwxyU4XeflJp?=
 =?us-ascii?Q?TxAzsbXZvu6A5nnEpOPntvkCoHmGyC02cxP3pS5Va5PtNkzJGHzTb9Ey59Tl?=
 =?us-ascii?Q?p4U6KlSGBMeMQhLiJXapcsYMwx0wnFGfHHCCRkc4BypG1Fq4MwTC08Onm6RQ?=
 =?us-ascii?Q?W75rs4Mi0rBaPh6rp9wIVcqVTY6zKsOt4ZauEkoBSHhEBDVI9GcpSLlmr5It?=
 =?us-ascii?Q?B04Q1YjbeOJWEPoSVuSxZ7xsxB2kX9uZctLB/UhR56Xlnw4O3Yeqs0JSZ5+3?=
 =?us-ascii?Q?hc4BKywqk+ZKhsjqDYqO3HaWR8TL8IhqcDj5B5/WPmYlh0QnPweRcg3mnLxE?=
 =?us-ascii?Q?mPfflBGOBbrMOj93oxOqMF9jrDNHCSUMi1xw7HkTz/iWWmPoX+xSc4qdl7FX?=
 =?us-ascii?Q?JzJ8Y3OMO52KyxiFKN18MLN8SFt7ClwcAU9uY8Ys7plMlvIte/SnpB7+ZY1l?=
 =?us-ascii?Q?x8nwmgySw4IzKUlQUJBydYhewHLerjTpR0f5SefpH7SIlLvNK6IQegUwrLRr?=
 =?us-ascii?Q?C+w3ShDO2f+HPDMaHllWaNtjGsS87BWziXF4H6xyrWwS3DnYouJvmm8rxeNI?=
 =?us-ascii?Q?JsN0YGuW0BMU8LHpuikyRAgTLCrXBQe8dlstUuMjIenzNOfibbhpIBDByH8D?=
 =?us-ascii?Q?qnYpOnfjYvi/7l0LTfIoUsXnH7VfFC8XZfXyNvtjbAiso8YH+ggnoqeSQGyj?=
 =?us-ascii?Q?Mc3t7ZE8pRg2RZIhTTLIOXEv3W6tncGCpqqKmDcMSF4MDCi3MqymybTXvZhe?=
 =?us-ascii?Q?B5xRcwYu9+wG01jhGdmCdBvXkODuumCkZOh92LUZ0kcCiTQOvQYr0mHCY6yt?=
 =?us-ascii?Q?PFZpMl4VxGWaZ99ZPJaHL2BldP42RPVycq4p6oZDeo/GOCUW5U3mhxSfCiLp?=
 =?us-ascii?Q?x44y+aHq0/ETYIXSqJgxyzb/N5zmnLWhW0JzgdseBCilMW+f?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI0PR04MB12114.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2447d7a2-649b-43d9-0b94-08ded71d49d3
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2026 03:03:12.5298
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iQsWMdRmq9NbCWe1LHVmfAZqccCnhhLjP0DIomopaLRO8FtDNs9V1qaL2FfdC+WAP3Z5eJjCKzFHU7FyS6jxWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8529

> Subject: pci-imx6.c:undefined reference to `pci_pwrctrl_power_off_devices=
'
>
> tree:
> https://git.kern/
> el.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Ftorvalds%2Flinux.git&data
> =3D05%7C02%7Csherry.sun%40nxp.com%7C9803d0803e634aea04b408ded718
> bd93%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C639184698423
> 001937%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiI
> wLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0
> %7C%7C%7C&sdata=3DSxK1eCxxJN%2BmNVXFSwkgu7c0usnrEXe3%2BqqaRL3YA
> eU%3D&reserved=3D0 master
> head:   dc59e4fea9d83f03bad6bddf3fa2e52491777482
> commit: 85c1fcfa740d4c737f5575fc7251883e54227a51 PCI: imx6: Integrate
> new pwrctrl API
> date:   3 weeks ago
> config: powerpc-randconfig-r053-20260630
> (https://downl/
> oad.01.org%2F0day-ci%2Farchive%2F20260701%2F202607011039.GLadQKgQ-
> lkp%40intel.com%2Fconfig&data=3D05%7C02%7Csherry.sun%40nxp.com%7C98
> 03d0803e634aea04b408ded718bd93%7C686ea1d3bc2b4c6fa92cd99c5c30163
> 5%7C0%7C0%7C639184698423020096%7CUnknown%7CTWFpbGZsb3d8eyJF
> bXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiT
> WFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3DjpQIrEvcVuPQa%2FfSS
> QOWV1nS064bT3YzzSpaIEJclmQ%3D&reserved=3D0)
> compiler: powerpc-linux-gcc (GCC) 12.5.0 reproduce (this is a W=3D1 build=
):
> (https://downl/
> oad.01.org%2F0day-ci%2Farchive%2F20260701%2F202607011039.GLadQKgQ-
> lkp%40intel.com%2Freproduce&data=3D05%7C02%7Csherry.sun%40nxp.com%
> 7C9803d0803e634aea04b408ded718bd93%7C686ea1d3bc2b4c6fa92cd99c5c
> 301635%7C0%7C0%7C639184698423031804%7CUnknown%7CTWFpbGZsb3d
> 8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOI
> joiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3DTfQQpDHJaxV2U7F
> FPHsFPGxylLih4dydUf%2FKu3qSSAA%3D&reserved=3D0)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Fixes: 85c1fcfa740d ("PCI: imx6: Integrate new pwrctrl API")
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes:
> | https://lore/
> | .kernel.org%2Foe-kbuild-all%2F202607011039.GLadQKgQ-
> lkp%40intel.com%2F
> |
> &data=3D05%7C02%7Csherry.sun%40nxp.com%7C9803d0803e634aea04b408d
> ed718bd9
> |
> 3%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C639184698423041
> 414%7CUn
> |
> known%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAw
> MCIsIlAiOi
> |
> JXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3Diw
> 6HxJN6
> | LCsvBhUcXck6SFdMvolSshU9nJp1JjELIZM%3D&reserved=3D0
>
> All errors (new ones prefixed by >>):
>
>    powerpc-linux-ld: drivers/pci/controller/dwc/pci-imx6.o: in function
> `imx_pcie_shutdown':
> >> pci-imx6.c:(.text+0x5a8): undefined reference to
> `pci_pwrctrl_power_off_devices'
> >> powerpc-linux-ld: pci-imx6.c:(.text+0x5c4): undefined reference to
> `pci_pwrctrl_destroy_devices'
>    powerpc-linux-ld: drivers/pci/controller/dwc/pci-imx6.o: in function
> `imx_pcie_host_exit':
>    pci-imx6.c:(.text+0x2018): undefined reference to
> `pci_pwrctrl_power_off_devices'
>    powerpc-linux-ld: drivers/pci/controller/dwc/pci-imx6.o: in function
> `imx_pcie_host_init':
> >> pci-imx6.c:(.text+0x2130): undefined reference to
> `pci_pwrctrl_create_devices'
> >> powerpc-linux-ld: pci-imx6.c:(.text+0x2140): undefined reference to
> `pci_pwrctrl_power_on_devices'
> >> powerpc-linux-ld: pci-imx6.c:(.text+0x2690): undefined reference to
> `pci_pwrctrl_power_off_devices'
>    powerpc-linux-ld: pci-imx6.c:(.text+0x26a0): undefined reference to
> `pci_pwrctrl_destroy_devices'
>
> Kconfig warnings: (for reference only)
>    WARNING: unmet direct dependencies detected for HOTPLUG_CPU
>    Depends on [n]: SMP [=3Dy] && (PPC_PSERIES [=3Dn] || PPC_PMAC [=3Dn] |=
|
> PPC_POWERNV [=3Dn] || FSL_SOC_BOOKE [=3Dn])
>    Selected by [y]:
>    - PM_SLEEP_SMP [=3Dy] && SMP [=3Dy] && (ARCH_SUSPEND_POSSIBLE [=3Dn] |=
|
> ARCH_HIBERNATION_POSSIBLE [=3Dy]) && PM_SLEEP [=3Dy]
>

There is already a fix patch pending for this issue: https://lore.kernel.or=
g/all/20260618143629.2035247-1-arnd@kernel.org/

Best Regards
Sherry
