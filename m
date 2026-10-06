Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011010.outbound.protection.outlook.com [52.101.125.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A23F9381E9A
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 Oct 2026 05:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791265111; cv=fail; b=nSYSUwmg9vbcZIU3MViH+wkS+FZow3vcPhvqEPc+m7YAc7GrsDBivnOav952mW4q+0Z6mEKZvsm/tYp8JYZf9ltAuexkXLMtWM+QpteT04U1ZNOwduHphWF37ZHtEhieCAe2Vb+60Y5fUkZuQddSO9fbSmAZExyTk3UauvyLU3k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791265111; c=relaxed/simple;
	bh=OGQAfS1iQcMF95R2rDO4IzF4BMeo6wstWd6ETF8ctcM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=BEWThSptnu+0xz9XDcCItTDFbV1g63H5dkDnz3s7QD7yco/ULy2mCe0hyHBMLjvfPQgnGYQc6fjruBmNVGFqfafpcJpt/DdHy1GHOzj7FNvCJ5FfA/xz45HtSvDQc1yQDJW3xPQhBkUGZPmOYfGjZbR6tuVXdScJFF9sTfF4x/Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=XjWA/1CK; arc=fail smtp.client-ip=52.101.125.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="XjWA/1CK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BdwW2FWHCofP0y/bwsQW4tdbzU+xQMYCIQZmOU09iBLi+IkFum9GJqu22SBVypBcVS0zaT/McCxpkr5OhKO3hkRBxREdV9gz062hNdBvsm1IP9UwESLmsmLxsfEvwwFlfRJxmsemsDYtD7HiVxmvm5SMqhkLFtQdqEb6r5Gp3STK6dDwDdv9MHnDwpaBCfiEo86kz+HxWXBUbCcgUWH3yulQiiCTjpk3K9TqW/sn9YEr+p6Fz+3p8gbTid4181w9wBcZZDl09GU4cC9dW7tUK8spqa5vGzrhp7F4SrGO0SmC5sAfldExATtPSYrsxmxikI+fhse/Ly+2WZmCYhC8/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MzbIrMFLARUbBWJQASxAhUcqZfIjlJ1wOnzY389BHj8=;
 b=vRjZi1yRJKRB5yVYzSmqb5aVHwiPq8RADfcoQDvxL5P66j2AMi11/XFWJxuRmd5T5bF3KHygGCLYjKsYS2nhkFJDL2rZ2KL1lgb2meK1nlobny0Q8JVSil+fqLY1PvL3Ff5WoHMwT/T4FK+0CrmCUqRSVVvYAB+XtopUKJM34NukXdG5kIL48+o/hOivUw4/PCyKGJ21IBWu5DLYH0PBiyVY1pgnByOym/6QW/6JDt2HC8oN0PtBK6h5RbuJiPQ4oPJ3QZ3mWUrXQLh0dodFaNxM/8tFCefDC2UI/XWFLPGNCt8hSzjU38sVDzBDqRrjwYsxs8us3kKd2iGFBNtAig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MzbIrMFLARUbBWJQASxAhUcqZfIjlJ1wOnzY389BHj8=;
 b=XjWA/1CK3jeISYtIaysYktgdh2QDWfXrxIiowq9qD6+88AsY6KUQfvXtwFqkSR67ul/M4YoSaBqLX+q1Uj1aV3n1QXB/7YJYdxDXANbyNBH1poyKJ+i528rXH7mhzAQb9IVhM/8a251YVEpR8twqdZiveJixxs1wCPbEiuYsuNs=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYYPR01MB12400.jpnprd01.prod.outlook.com (2603:1096:405:fb::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Tue, 6 Oct
 2026 05:38:24 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%6]) with mapi id 15.21.0451.026; Tue, 6 Oct 2026
 05:38:24 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: kernel test robot <lkp@intel.com>
CC: "oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>
Subject: RE: drivers/reset/reset-rzg2l-usbphy-ctrl.c:199:undefined reference
 to `devm_pwrseq_get'
Thread-Topic: drivers/reset/reset-rzg2l-usbphy-ctrl.c:199:undefined reference
 to `devm_pwrseq_get'
Thread-Index: AQHdVQVSkj9gwL7GfUCJ0TEQ5jqjfLbv/qWA
Date: Tue, 6 Oct 2026 05:38:23 +0000
Message-ID:
 <TY3PR01MB11346087D32A8EC0F5252832786952@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <202610052142.gXOJlGh3-lkp@intel.com>
In-Reply-To: <202610052142.gXOJlGh3-lkp@intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYYPR01MB12400:EE_
x-ms-office365-filtering-correlation-id: 6c1f9fa8-2a1e-49a4-81e3-08df236c09e8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|10067099003|56012099006|11063799006|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info:
 tY4UFxu3WkBvpHbzJGL1MUOWeIGNbrAvLTGqFdP/7l00mgHHGDulXTwDjq2lkahG1YDDL20JgV+V68vW9ZiSjhEyr4fGYCFDrIqPo9zO+xT44tzFEh4F5bP+LDHsJgeH/wiI3xwi9q6e2a7cq/0wKGBJqM7tj2kyPNe/sr7Y3oz+YlWhI33BvOipYT0FxxQUY/FlIoiXNNM9ohVeyJ5MFzRMGx6HS//cK6cdT5klp4x6GbLKinekSQamwGL8qdWqtNXwjZcxFOdK9qqM5kjDNA/KheMp+Wtju7voclqd/uTNEuMj7cqO62OBPZeiXVVUmfHoIc9TV+GBm70wyb9y6MY4jjDWlGuJa0hpiAkywkT6uVD6OUJxYaz4um8X02Ht2gx7HSshORQOniRe23hDD9ZPvd52t62uDRGock/rPRakQg2RRGLenOXFhD+NB4aTEs9NhctV2k9myZLWlXBVRFq83MyFUkcDq+AFfT+9UgCqSmbN3EGJFOnzrlCVh5SIvijPrfRAn3zYQz6FWyMfsKbPHfBrmoi36OSCbMI7U+ksmCB9YDOI2eGfqu1GNtEb6UjO0+VCQZsdX3Ojth52PMhAl8F9Pewkt4R4YkKGv7357OTOI+spaGS4lMcGwVxuXsAuCubV5XjpoZe3lTee9VT7Dulw2lRm5rdGehqUzUQ=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?iqM/DH8WAemXFFaNhhSWZRChUewaoV/muK98m3/w8fhArnCdGYy0KsKwpN2Y?=
 =?us-ascii?Q?/CXIIIWPQyzDvZ+XZGjJBgrdwE1z+S4WxrnwgWXywAdrc8rDgkuDhC+XbKOs?=
 =?us-ascii?Q?EoRiFJFsaJtnUvU3dOZUOOltmRl3r4MR+wJByrsyq57kYceChUMJYYarLHsX?=
 =?us-ascii?Q?68qL+Wh8XEQ8YsAN+KZG+rIUnyky9NJNCsqT/Ny0gRIAZAzzSN5Qx8TH830z?=
 =?us-ascii?Q?H69D63fnBTCtIHt7cOZxB+v4lMyXLUpYiaxOmlkEu0kY7ppfOxI0bnhngGv/?=
 =?us-ascii?Q?CsWXcz7YN1Kk7OIIcQ7PcU2Qcpt2jcbBThHnEqptZIVFZJbvFPFhbBOM+GdE?=
 =?us-ascii?Q?ZK8cX/Ij41ebuK75jLrehufKYIx5Ne+APounMfemCAO7cn3Zt93mjo6g/iY+?=
 =?us-ascii?Q?ZpR847HHsGeAikGdTjk1PWlwEzUlNA8/UgaostLDNXkyQ8Z/R3dQd/7Nd4tk?=
 =?us-ascii?Q?kJyIbJoOWT2xC7BcS7YeexIEuaXgBHP3FB5W6dnFBd4SvHjmO+3hhW8hceWK?=
 =?us-ascii?Q?DZjLHR65eONll6BhhG1wOokoPYPDuwTmbOTjYljJXJEd3iTskxuZ2CkZgseS?=
 =?us-ascii?Q?FfL7mQrDAfEIfs94m1pnHpZIa5Y24ZCCx0SuTVbvlf2ammK+hbxTBCo3kgu2?=
 =?us-ascii?Q?suLSMB0qwFQlUkQMbrUmvKb5Zj+zvmSQCEVTX443DoKasuDXJMWtwNJwWQzo?=
 =?us-ascii?Q?MnjjQdskLfYfCj3QMzNDNo+0VDe+uryx7M1ySS2jS7Dxi47CxynWsgC351pW?=
 =?us-ascii?Q?AXGtJESKaEPRVFctXi/VEQA2hIgP8mjrQyhpH5UkQgvJBeULgPwyxjsUDskX?=
 =?us-ascii?Q?+qGxc1UzzYyyYgDEnwVf1W/fKR5OXE+2sOQp9Wdetajsugq+T6YuNOwu07L3?=
 =?us-ascii?Q?u3/IiUBHFeDNrZALig/AWz59iIZkB7MMguOU8kGAKeVFNfB5jZh9ANCX423W?=
 =?us-ascii?Q?GlsLyYjos/Ce75/uIH6JmCr438AqmnEFGo3cRnxa8V+1Lf9ZlW8IBJuJDN1N?=
 =?us-ascii?Q?F7OudQn/nSBQU7EmkEG1AFNPuNRT35VR0e3ieQJqZLTNMfzJBCjgApyhPLqO?=
 =?us-ascii?Q?agLfXDN+kCOqqPRl9YyN9A3cUTNHHOjt3p/Ydsv/ESDKbQU82vhBIIeghDde?=
 =?us-ascii?Q?P3928CbJxLIGnnfL+LhD8wHA4J5MnKFeM6+oHKE/RTJ33BYuNfPrr8dPT3Yg?=
 =?us-ascii?Q?nzCNfdLuDreFCcU0udhPPPpmXjDRobWZefofiuqlo1zPcFmRJh+ngxj5GNP7?=
 =?us-ascii?Q?NcsUa7iFpYIr+/Es7DBwThlhOXPlmmqQhR7EbE9rzvU/ojorzikryoNaZ0wa?=
 =?us-ascii?Q?pxnNHe1I+VKdYcb/r306/Ad9pjUR+5uX7xrlk6Kb+iM+6+fnaXLWOSTACehO?=
 =?us-ascii?Q?suTFOtGNrpwDxYK8hlwD/yjPsL8531KdfpPZ9lTyc8kBtAJVuWFoT/Gb/K1/?=
 =?us-ascii?Q?VOEg2bSlRroC7SalPkpB7BuDMcc/lmmHmLrQaOt3D13d+FvMsdpLvN4KyDOA?=
 =?us-ascii?Q?0w/aRoCutsuhDM9h18DPZiUPgZ7tyZ1x+lxV0OOyuvLfoPnB7mTELGM6uwnV?=
 =?us-ascii?Q?Bd75XCrMw+4GOnYCpy21WS4QuLDA9ewET7Jj8CN4P2kI3GwuEj8PvPmaB03+?=
 =?us-ascii?Q?pD2UBo4ylY/eQimT5lThsYmnBkIYS0/sgaZHm6SeynzXMDJQUQO51TwwpGe+?=
 =?us-ascii?Q?XqzI1uuO4ucNzEtq9aD1RnHGq/qXM5EPg+jZsD6Skpqn5wyeM8OsSOhsWPpp?=
 =?us-ascii?Q?hKtZvoJ8PA=3D=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c1f9fa8-2a1e-49a4-81e3-08df236c09e8
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Oct 2026 05:38:23.9545
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /0yYeqP8ulRMUzMLBbTQe10+wJj7+2n/wHMXyh6fAa2wWn/5gb+wui2lpIpvENNKwCYrMWpTSfe99+51IpvxKCS4tF2HanlbOcSvUM70Qn8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB12400

Hi All,

> -----Original Message-----
> From: kernel test robot <lkp@intel.com>
> Sent: 05 October 2026 21:08
> Subject: drivers/reset/reset-rzg2l-usbphy-ctrl.c:199:undefined reference =
to `devm_pwrseq_get'
>=20
> tree:   https://github.com/intel-lab-lkp/linux/commits/Biju/regulator-ren=
esas-usb-vbus-regulator-Rename-
> platform-device-to-rzg2l-vbus-regulator/20261002-121656
> head:   e6018e531312c0a59bb0b6540141285405702707
> commit: 71dd4a1d8943b8c05cc88a34b162a2eacd3aba46 reset: rzg2l-usbphy-ctrl=
: Add RZ/G3L support
> date:   3 days ago
> config: xtensa-randconfig-r2103-20261005 (https://download.01.org/0day-
> ci/archive/20261005/202610052142.gXOJlGh3-lkp@intel.com/config)
> compiler: xtensa-linux-gcc (GCC) 13.4.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20261005/202610052142.gXOJlGh3-
> lkp@intel.com/reproduce)
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of the same patch/commit),
> kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes:
> | https://lore.kernel.org/oe-kbuild-all/202610052142.gXOJlGh3-lkp@intel.
> | com/
>=20
> All errors (new ones prefixed by >>):
>=20
>    `.exit.text' referenced in section `__jump_table' of fs/fuse/inode.o: =
defined in discarded section
> `.exit.text' of fs/fuse/inode.o
>    `.exit.text' referenced in section `__jump_table' of fs/fuse/inode.o: =
defined in discarded section
> `.exit.text' of fs/fuse/inode.o
>    xtensa-linux-ld: drivers/reset/reset-rzg2l-usbphy-ctrl.o: in function
> `rzg2l_usbphy_ctrl_pwrrdy_syscon_init':
> >> drivers/reset/reset-rzg2l-usbphy-ctrl.c:199:(.text+0x440): undefined r=
eference to `devm_pwrseq_get'
> >> xtensa-linux-ld: drivers/reset/reset-rzg2l-usbphy-ctrl.c:199:(.text+0x=
444): undefined reference to
> `pwrseq_enable'
>    xtensa-linux-ld: drivers/reset/reset-rzg2l-usbphy-ctrl.o: in function =
`rzg2l_usbphy_ctrl_probe':
>    drivers/reset/reset-rzg2l-usbphy-ctrl.c:248:(.text+0x53b): undefined r=
eference to `devm_pwrseq_get'
>    xtensa-linux-ld: drivers/reset/reset-rzg2l-usbphy-ctrl.o: in function
> `devm_reset_control_get_exclusive':
> >> include/linux/reset.h:620:(.text+0x56b): undefined reference to `pwrse=
q_enable'
>=20

A fix has been posted yesterday [1] based on [2]

[1] https://lore.kernel.org/all/20261005111854.275120-5-biju.das.jz@bp.rene=
sas.com/T/#u
[2] https://lore.kernel.org/all/TY3PR01MB11346125B244C4B1DC27BFA8F86962@TY3=
PR01MB11346.jpnprd01.prod.outlook.com/T/#u

Cheers,
Biju
