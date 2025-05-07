Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011071.outbound.protection.outlook.com [52.101.125.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DABB223DF1
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 May 2025 13:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746625442; cv=fail; b=NEpE9Js9CN7n72dJlNWa+4ALXWuImB+UhXM+4uHlKhBHO4G7foFCOzfJ75OpAuJ9OV3498G+X9zGjxJdRnAIOAi4CsZaTcqHcCCt4VkHdHhNCmLnC1jOPsgrXq4eaWZ6Gr6fZMGqqWykHZ2o9NLD6GAf1M67xmp5wGU5Theujro=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746625442; c=relaxed/simple;
	bh=SvIN1lgkEUL4IbHO/36bGHaoW6weTTSw96RU2i+THPI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=R0EdlrNIljwFcYEpDVrxDBFkUGGhq/ygmLUKe0eyw/XrWcFpVO/I5QotLhAm7D9nTftXh9gG5VDY57e8qiymHt1GhPXpzvtMLRDzFVyL3CRsI+ybYHlZaH1yVztZ7+MsIRSsDMRqccWVp2mc2Gb38iVSUS2RkO+7n2Az80CPGag=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=DHu3Xahd; arc=fail smtp.client-ip=52.101.125.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="DHu3Xahd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z3lk6txmtsp7yZKtY8S+aEGuOn000BmdStr6Lz+O/HIbFwBTJYk6ylcmUR+oEzOdKKYtgK/KcqYp1O8z7ukJj0Ga+sce177BEq8OGJ+bNHfQudIEmoBesQmz6uQvLszRElyg0LuCWfU/jjGFlp/8Yo3ANQbwyKXehBUY0gDNUiGOa/ggI3VrgReY+R7hARA3XbpyKVNBs0uYSY+8KmFNog2KlQ6XhwtlanhryVcSH7xQAZLwwuKDb/95R16GcUWDgeTbWOfQ1Pred4zw3zONy/IqSBTau/36xcxqsikScvO4GRlUcxM25MZ1P+fMopfrikbrM+u0lsV3wIavZquTaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sXRun3U7zKif2YRjoOWyS2lBi1e6OBZPFAHo4FKU2hs=;
 b=dU5IMEgjPU/r5Z0hLS12pNc6h8y+gBwqH4qmFuSAKXCr8N3RLj5rKIf1rekEX/zRauWL6GWFliaWpsmaofZP+R9BhmhBctgGtnho1oL22adokE072GKTju2uND8z/CVnmBaVuqfUezsmB4B4qvlHw8QCu8VryINxPeOFSfiS5EKeVbBxSGC2ZpNAcZHhcansngdnNrD96a+IBwy3gfHbavqknwqOd84P2GBNiH6AKV0z/eqrMHduBzh7sxr8u855PZBtjhHyLPhnkRSzvGAEsqtqumCPjALk8s1u4/LDfto8Pd5IoE2zceap37RAWkqlajDFxcQv+YVrEfyu8cKSPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sXRun3U7zKif2YRjoOWyS2lBi1e6OBZPFAHo4FKU2hs=;
 b=DHu3XahdR3nKR/6kd3QLSvfTEm4PMkWHhXk0qkC9V9SpBH6g5tntaIRFlCrrDU++X4uhJQ8WVXERNFYLOM9Gcs2ri8AJz5Vxw0LYJBA1EBCTM0Ky8FZgl7jxifagnKVS5rVj7sZL/R85OzZZQZC8EGG6v3naMXk4+OushoGU5QA=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYWPR01MB8917.jpnprd01.prod.outlook.com (2603:1096:400:16d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.20; Wed, 7 May
 2025 13:43:55 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.8722.020; Wed, 7 May 2025
 13:43:55 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: kernel test robot <lkp@intel.com>
CC: "oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>, Krzysztof
 Kozlowski <krzk@kernel.org>
Subject: RE: [PATCH v5 6/7] memory: renesas-rpc-if: Add RZ/G3E xSPI support
Thread-Topic: [PATCH v5 6/7] memory: renesas-rpc-if: Add RZ/G3E xSPI support
Thread-Index: AQHbtPdROme93wqRIkSSNhOrkbAidLPHOD8AgAAJq9A=
Date: Wed, 7 May 2025 13:43:55 +0000
Message-ID:
 <TY3PR01MB113460ACB1E23CFBB931505EC8688A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250424090000.136804-7-biju.das.jz@bp.renesas.com>
 <202505072013.1EqwjtaR-lkp@intel.com>
In-Reply-To: <202505072013.1EqwjtaR-lkp@intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYWPR01MB8917:EE_
x-ms-office365-filtering-correlation-id: 3710fbf5-d819-4d01-f822-08dd8d6d3637
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7053199007|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?HosUYKPmr2l3JGQopOdvAB3w+I+gwqxNmWZtL21nN4tcOAnksRVaNZZ685Jq?=
 =?us-ascii?Q?JGupcM3aD0AhhySIWWdlGSGOoSy9jsvRo5FmUZ+QFRQc8s2CbKzeogpCQGRg?=
 =?us-ascii?Q?dBEcokLqDNs2/B6eOCsZJcxtb9/CJGMGzBVK+/3qpBqCvc/bwKMAMfnWmhi2?=
 =?us-ascii?Q?mVP/2EqWgZfbyC3eJv75MN4fJFJmS6iHwu9cTPBe/uWwnr+uEsh+xMVayQ9p?=
 =?us-ascii?Q?eCApcAAKSZsOQju4TYXHJyYntH2kRqAzl4Shlapy3R57hyVWZCUneMY49ayG?=
 =?us-ascii?Q?aspl0ZhCv+6XwQjxLASEYNF7VDnOnoWGlJOK2vUXbjU7JGBDtoY9rlc0AI9d?=
 =?us-ascii?Q?453SCPCi0nKevPBCwbF5Bv9+F0kel6/bB4V1PcU0NXUvTyKygrQj6surShdH?=
 =?us-ascii?Q?XHNwyOsiYsKeIL0fya4qM55vtZv2WZWotTAKHkb7Xrz8SxM7rEPvh94Yu173?=
 =?us-ascii?Q?ewOK/INPZEHv2jN2ccHCm+HXxOKhSkqVLo/LEJ2ofmH5NRYH4ndQcBkj7Um7?=
 =?us-ascii?Q?538ywDX/qLFkgMgbkPHkXkUFXnlYXUryqFOmF5/YUIqYGCoNr5R+93HJ8o8q?=
 =?us-ascii?Q?UDhQouLR+I/DtmBDa34leQmcME/bRIeVk67B3Aa7Swto2K+3POYSk1uuLzBN?=
 =?us-ascii?Q?HtVuhR4ln6XIZA9Qj6CG1vR3kRurrqoLYQOT3xTiU6xkJ8eOmfgYhlr3P8IE?=
 =?us-ascii?Q?TbL+CVhj8bLINiJyyjvnQrzJfIZqPGZw0z8hGGaew7TW/KrtLEzLwVXQTcVi?=
 =?us-ascii?Q?32ZuckBE3rtdcI3bUHEVKuJqVfyJn9BT76A+vdYcDVisXZz7fyYd10ipYhx5?=
 =?us-ascii?Q?+q1u4UUD/1VY0UDVKsSTea4iAwq3zD0TtgZsEE9/NgNBLfhSa5m7NOWi6EUJ?=
 =?us-ascii?Q?ekV+Ogjn2kE6ZNNkwm1nJBrCd7mdYxb8rPHVPmx1JVOChyX4tMmiVxa/8Rv+?=
 =?us-ascii?Q?Lzo/QD2Am5I6UgGgt0vuvuIJRixzWwtfR1Xhh740tCqag2KQBqLtkReMyF8f?=
 =?us-ascii?Q?mWU0dSx9F6eDo1ZxJebKssVoxDPfbdwN/Nu1q2dvJdhqjez0pDWHP05scXTI?=
 =?us-ascii?Q?PGWpClKthmXxTc2mFoIg1cOU1vweJaIeog2IgACAzFknmnLnUYommJ8sKEZX?=
 =?us-ascii?Q?cHW1nxNMwPNPX37T6cZyQWsF44OihJHg3AbBdDKYnK5gbbfXNojZIsj3TORs?=
 =?us-ascii?Q?zmWOQbmr+xKUe73rO2YkedzyzSQ36zNL2Xir2H9fS5O2lDXJph03vj1Kd1Ce?=
 =?us-ascii?Q?NEuC7d/HJxWM000P2eD3zBHIPT3jg67BTFfYRCk2AEz/FcKEpBPzFeglO5dh?=
 =?us-ascii?Q?3/tt3ijNYiKU9FPO7Zaq27XRpOz1AsoimKyVfIh/YQCzr5kIUAJZihIw19c0?=
 =?us-ascii?Q?dHFX3UT6pGkKCAyL9GMjIXH2DbKkaDdYc5t8VY+TvHrH/upi8/lSH1LlEZ4P?=
 =?us-ascii?Q?iqJqoFoC4AW7BqmvBFCJIGWFLV9afFJ4?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?5h6TicgJ/Qw08SSY9dSi3z/tiSeYaI8Jgz+MgRMAdtMuVqop8ch5kZDpP6Dd?=
 =?us-ascii?Q?VYNKHo9sI5tXp/NKWhjN47k7Qjkz6IY3Di1di8QDDN8O041LA3tNCEkFlAp1?=
 =?us-ascii?Q?Ny9peQhdRY/juHiR/541+BYnK4yAGfit4aznnC4TZiDkeUq923+8K9CtZONp?=
 =?us-ascii?Q?o1ACbcYdX3tux1lIyZDZfDKlda75SFFiN1vle70dByewgFpQhuuPe+eYSlZe?=
 =?us-ascii?Q?nxZh/QWTODWwxh67fTJSDck/6ZJISPYuRYDOHtfmA+c6CwaohNpu7mloek0+?=
 =?us-ascii?Q?JOrPR2IfdwSk9FFt5kv8qptztx5W5Jd2hy7KFmqOr8w0spUoWoLcj+huxvOn?=
 =?us-ascii?Q?vwsudnyZ1Ina8vPfv+M6Y9LJdFNduu9LrV0V8MKo5h9VG0uIpRd9NCn8FDU0?=
 =?us-ascii?Q?2p10JEk2PwRzdiKlTNy08v0bP/eOxpWeP81t0exqQDl85ibZqAv4s8C4eqBJ?=
 =?us-ascii?Q?Rfq1M8lNfv+B9s8hhmrNyYogWGlrqENS11EopPLZ5/ytkjfxHwgMM7oJkeeF?=
 =?us-ascii?Q?ztJn3RW47DELJMIYXDO6PMYaNSFaqbm3INm13/Q7tNsgDRXewJwpqZUZTm0E?=
 =?us-ascii?Q?KyNmJnJcQMsrWiPv3TqXrEedKgEg2gKR4VI9UnCvF6JIR98aNvX0rhpmJO8D?=
 =?us-ascii?Q?lr51gD813eOwhM6zf3lykJxqXxqjkR4WWDZnigcuDghQV2AlMpfNviiYIYDz?=
 =?us-ascii?Q?bQdS7LA2UjgGKixYQQbU8KXSFbduF2oHKS0mgACTo5qCCIbcHd8EFIY4AdDK?=
 =?us-ascii?Q?pgt8wm0RfcHoiPVIKGMRJ1VpebQ3Ye0W94RDwBHr1dsW9CZ2Al8RT4Tpf4nQ?=
 =?us-ascii?Q?jObnNWA0yJVa2FjqTTEyor/shDX1Njsw+BDAywDFP4XUKXDql2BXeNr2AzM8?=
 =?us-ascii?Q?ywkWvhfYfVjs/addFwZjxzftWUXbHoMopn7TN0U4l9L5YYDZmk8T3RQ/biXe?=
 =?us-ascii?Q?Ao5H6r+ZzyaiD9CytyA0KChWzAEycz21jMB73LriDoHqws8ZMmTwdxWJMd5W?=
 =?us-ascii?Q?bgt9xoxqfc03cCbreZFxK0He9rxojWYGgmBjOWCpkHLXHhrMjpYnoCL9nf0T?=
 =?us-ascii?Q?8farTrmxg9jQ3/1O8G6FwrhLzKKMDeLu3LuGmTPsiuuV22ctb7SJHo18anOI?=
 =?us-ascii?Q?3yTosqQd50fR4LvJ/R1bBw9KxJe+HOaxurAf3QD1AABck+WxfNEaLrOEd+he?=
 =?us-ascii?Q?javRySnATYbh7SujqiRK/IhhaHN0R9enXxw3vdD69kyLsp3q3djH9ujN3abf?=
 =?us-ascii?Q?K2dmdGwbRXneX/9DZ0NMkgf2mPhs/J/qPLUW2rJ2RXIxLDx9jTTKgozTHbsV?=
 =?us-ascii?Q?ND6V5CJEYnwdS2PoRsB+vyIgSiCP6o6ZernR+fMN7F7R60Ft2hGVgH53RS8k?=
 =?us-ascii?Q?Wcds7clSTuBrNaz6cvnSYJQWCBjXdFMYfVuxc1dLQPRsicOcchFk+0JPme7r?=
 =?us-ascii?Q?xy/KHOo0DaoE/xBa5ipzNcALNARToaUNYUmgOY3Z6dxOYHjEErL3Zbbq9gx7?=
 =?us-ascii?Q?DZQA6Tni/Ktc+fY0Lwo+cEx9YuSztsIu7H7tNiXd5YgiVZAtMLVZ1Mvg6iFc?=
 =?us-ascii?Q?ZYutz8iJs8tLvZLSqlgkvWBJnWvKwRnDobKwfQmAp0XIav3G1Y24BxBPVVj5?=
 =?us-ascii?Q?HQ=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 3710fbf5-d819-4d01-f822-08dd8d6d3637
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2025 13:43:55.6803
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gCAwSGfmBVURRC/vaN2/83vcpjTr302g4I/YKx+1Y2kuqtoUOymv46USehFMJtKd4pSCV2oXrfhMaeEi3Aj7kfBoqLPxayTJIifYZYTrs30=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8917

Hi kernel test robot,

Thanks for the report.

> -----Original Message-----
> From: kernel test robot <lkp@intel.com>
> Sent: 07 May 2025 14:08
> Subject: Re: [PATCH v5 6/7] memory: renesas-rpc-if: Add RZ/G3E xSPI suppo=
rt
>=20
> Hi Biju,
>=20
> kernel test robot noticed the following build warnings:
>=20
> [auto build test WARNING on krzk-mem-ctrl/for-next] [cannot apply to robh=
/for-next broonie-spi/for-
> next krzk-dt/for-next linus/master v6.15-rc5 next-20250507] [If your patc=
h is applied to the wrong git
> tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in ht=
tps://git-scm.com/docs/git-
> format-patch#_base_tree_information]
>=20
> url:    https://github.com/intel-lab-lkp/linux/commits/Biju-Das/dt-bindin=
gs-memory-Document-RZ-G3E-
> support/20250424-210301
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ct=
rl.git for-next
> patch link:    https://lore.kernel.org/r/20250424090000.136804-7-biju.das=
.jz%40bp.renesas.com
> patch subject: [PATCH v5 6/7] memory: renesas-rpc-if: Add RZ/G3E xSPI sup=
port
> config: alpha-randconfig-r132-20250426 (https://download.01.org/0day-
> ci/archive/20250507/202505072013.1EqwjtaR-lkp@intel.com/config)
> compiler: alpha-linux-gcc (GCC) 8.5.0
> reproduce: (https://download.01.org/0day-ci/archive/20250507/202505072013=
.1EqwjtaR-
> lkp@intel.com/reproduce)
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of the same
> patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes:
> | https://lore.kernel.org/oe-kbuild-all/202505072013.1EqwjtaR-lkp@intel.
> | com/
>=20
> sparse warnings: (new ones prefixed by >>)
> >> drivers/memory/renesas-rpc-if.c:1066:19: sparse: sparse: symbol 'rpcif=
_impl' was not declared.
> Should it be static?
> >> drivers/memory/renesas-rpc-if.c:1075:19: sparse: sparse: symbol 'xspi_=
impl' was not declared.
> Should it be static?
>    drivers/memory/renesas-rpc-if.c: note: in included file (through arch/=
alpha/include/asm/core_cia.h,
> arch/alpha/include/asm/io.h, include/linux/io.h):
>    arch/alpha/include/asm/io_trivial.h:64:16: sparse: sparse: undefined i=
dentifier '__kernel_ldbu'
>    arch/alpha/include/asm/io_trivial.h:70:16: sparse: sparse: undefined i=
dentifier '__kernel_ldwu'
>    arch/alpha/include/asm/io_trivial.h:76:9: sparse: sparse: undefined id=
entifier '__kernel_stb'
>    arch/alpha/include/asm/io_trivial.h:82:9: sparse: sparse: undefined id=
entifier '__kernel_stw'
>=20
> vim +/rpcif_impl +1066 drivers/memory/renesas-rpc-if.c
>=20
>   1065
> > 1066	struct rpcif_impl rpcif_impl =3D {
>   1067		.hw_init =3D rpcif_hw_init_impl,
>   1068		.prepare =3D rpcif_prepare_impl,
>   1069		.manual_xfer =3D rpcif_manual_xfer_impl,
>   1070		.dirmap_read =3D rpcif_dirmap_read_impl,
>   1071		.status_reg =3D RPCIF_CMNSR,
>   1072		.status_mask =3D RPCIF_CMNSR_TEND,
>   1073	};
>   1074
> > 1075	struct rpcif_impl xspi_impl =3D {
>   1076		.hw_init =3D xspi_hw_init_impl,
>   1077		.prepare =3D xspi_prepare_impl,
>   1078		.manual_xfer =3D xspi_manual_xfer_impl,
>   1079		.dirmap_read =3D xspi_dirmap_read_impl,
>   1080		.status_reg =3D XSPI_INTS,
>   1081		.status_mask =3D XSPI_INTS_CMDCMP,
>   1082	};
>   1083


Will fix it by using static const.

Cheers,
Biju
