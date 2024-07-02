Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2057.outbound.protection.outlook.com [40.107.22.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A29A2B9D8
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Jul 2024 06:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719901351; cv=fail; b=KMvw91vOJhv+vK7a7dq9FzWnWFDRUSHf4ZRDOOSI3xozfWA/z8Y3RuP/h1Nyjva4G+8adWzBEK9ypdl1aitT82PrX+4sn+zCoE6qKIBMtZch4VJyGgN/8HOmRnNIhkfJqdRSLuwD5EnNPuxAZuVKZZLQhxLqQv66jZ9d8m1MW5k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719901351; c=relaxed/simple;
	bh=RfD+1gZ/FVnTgXo1qGS42GmzwQdjrVhdXCEl9UQS5U4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=bXBk4PvRscDV0P2M/jPhg/ApFz73KnmI1DmJRsJVRv7sMlYd6x2CjaCRgEBvp6AdAXnSFzDufYrmSxMl+UVsZx4qNw1uHgaMBAkWno06LZ8a/u7tLBOqDXI8FTFLJro9FXxsYqUpyYRqVgC/ViSozPuRtnF2Li1k9he9j0pgZBI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=D00M/leU; arc=fail smtp.client-ip=40.107.22.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="D00M/leU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C3vNTGrzNL9/bg4RwcA8LNIRRs7CePaYBYmLevA2aBTYUu0Py3aJOgsMOq1y8rJKaYJQ8MntsHV+vX1qA8CQDP6iuvXRG/yT6UZgWpOfKDIEneyl3BIZmYTHyMg1LER9l0O5qUcWy6SQkEFjhUCw0aP3wvpdR2QAt9GYa1G4K/bsx1n2v9zi6knRsqRURpy8thX3GX3zd0iWnTWZKslKZ0HNWtg/lOagQKDusjw1LJDQr6DecPoke1UWM72l2GUnGgVYdY8oOonLhxusbeYdnH00cjo2syXg7hjb2uubCmtMVg8SQUkOQ3GScU1OmBGLvmDsKv5OwSjniA/G8C5ejQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bmyYPPrTLdWk8O8iP3dkSiSlxhjkLXVLn1FBvLeHC6Q=;
 b=kWr9bZXuqVTdweOpbNIDMu9i4Q+EeprV8RiQzN91UrXbypfWpMJ3rpFl7Bx/TkPWzHqEVU5lJwCpGJ9K/XP8bSUPb2G4jAFe/naAV7cCXuB7zLJ3yG9mlqqyTTTEACivn7Zrpb0wP47ky9Iv16vvdD7+/haRu+KG4CeZNlERZUtntZUSXxJLjspvgyUIuwLRsnbcRM+OVb2tw8+FGQ9TboMvXr3fuwkBU4CB5UVmoj75bszJAzqph7f9DA2Qze09cw2DplbOTk1A2i/OMJIq/NWEt2ekK8Y+ox/0q4/GWNdjeH64uFRuFmyqyNzEGgVzxW7EJDgIU5rRAX/UbKHhyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bmyYPPrTLdWk8O8iP3dkSiSlxhjkLXVLn1FBvLeHC6Q=;
 b=D00M/leU5I6UNlG755ek6RkfD1BHXNnJVxUufYTpnLZe8irzlrLbRRclLI49af/qgFqjDI3kVHcToRS4VZyRArRC1y7Fm6jImsfwC7Gf2LxE1Bd1YhsmKyY6gwJ0/cLGn7OPA2HJchKMos0ZHV7Mo42ArsHP/1IEolwurjLYpn8=
Received: from AM6PR04MB5941.eurprd04.prod.outlook.com (2603:10a6:20b:9e::16)
 by PA4PR04MB7632.eurprd04.prod.outlook.com (2603:10a6:102:e8::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.23; Tue, 2 Jul
 2024 06:22:26 +0000
Received: from AM6PR04MB5941.eurprd04.prod.outlook.com
 ([fe80::9f4e:b695:f5f0:5256]) by AM6PR04MB5941.eurprd04.prod.outlook.com
 ([fe80::9f4e:b695:f5f0:5256%4]) with mapi id 15.20.7719.028; Tue, 2 Jul 2024
 06:22:26 +0000
From: Peng Fan <peng.fan@nxp.com>
To: kernel test robot <lkp@intel.com>
CC: "oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, Shawn Guo <shawnguo@kernel.org>
Subject: RE: [shawnguo:imx/dt64 53/91]
 arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb: /: failed to match any
 schema with compatible: ['fsl,imx95-19x19-evk', 'fsl,imx95']
Thread-Topic: [shawnguo:imx/dt64 53/91]
 arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb: /: failed to match any
 schema with compatible: ['fsl,imx95-19x19-evk', 'fsl,imx95']
Thread-Index: AQHazEf3M5wbhKIrdk2Jolb0uWG/zrHi97PA
Date: Tue, 2 Jul 2024 06:22:26 +0000
Message-ID:
 <AM6PR04MB5941F075BB66E5D866A8F54988DC2@AM6PR04MB5941.eurprd04.prod.outlook.com>
References: <202407021405.ahrmTsPb-lkp@intel.com>
In-Reply-To: <202407021405.ahrmTsPb-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM6PR04MB5941:EE_|PA4PR04MB7632:EE_
x-ms-office365-filtering-correlation-id: e9b4e0c8-eac6-450a-faa5-08dc9a5f578c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?EsO7plBCco3sjv65EypjBq8XB195wjcGJls+LgDQ8lN8De4Vvo9FRavPGs7G?=
 =?us-ascii?Q?Kai9SXCJk4uFEahbn+j6YdXlaq+6IAyBXIkPNPLfyedPDjOTYm+VAAe4bseH?=
 =?us-ascii?Q?OwQg48tUCUGTEuDRj79fiefJn7Ad33WPfdJlDDgcU8gZX7P748NGx3jXoVcG?=
 =?us-ascii?Q?nZW/uBLe7fKRwIeadzWXZUY/NSRey30Qr7/twq2/F673FnAe07RySYKi001+?=
 =?us-ascii?Q?LvBFG2qcctmpxHIcHrsZ1djwDNCVs05Qak0h0UycErAjDA78R4RJY/A8qbi1?=
 =?us-ascii?Q?N2QoWZFzSPjUh58XGhxaANHoeWYVnSROQ7YzwqD29y1+8C3meE6VGMSA9/LO?=
 =?us-ascii?Q?BRltkImtGJnLXguretowHR6B5AxWlzMRQ/ynj8tBu25N5m6kkM9iGsOSeXey?=
 =?us-ascii?Q?suLpmViQ/tQPV0TJp3Utr6wV28cCSFGAP5AgM0aS8s2ZA7WxvwaIuDo4gRI3?=
 =?us-ascii?Q?e/HeeDaYHpvphSc9Y1VPD8DnljVGZkAeQqVDOhWHpBh3h3YouoQZSIHFtKq7?=
 =?us-ascii?Q?HUUqi8+DyBBlupPfEIjP+yrzy5cQjMVGJdM5iJX1TUDYccYT3cYbHTT6kB+A?=
 =?us-ascii?Q?ZJfix/dB5XDH0x++ZZ/LBEHUul+R3zpTKquuksD16F6h1987ZsNZLeO100iV?=
 =?us-ascii?Q?fubsp3zNhke9mknBi8woevEbTLFKbRqGv3XleVJpriYQsXu913KSyh9PXd0F?=
 =?us-ascii?Q?hgUyF7F38vDEj1yxhDDOIVz7slPWqfjo1/N4ObvEdMNCJC/JB/h5s2UCti8Q?=
 =?us-ascii?Q?kzuz3XdK5QKEsqnE56be9A+ht3HtMzn/DK5lMRB9L2/ZE0shcPSSJvTT3I1q?=
 =?us-ascii?Q?pnk4XG3FMntQf7vxwD56T4YctysTl7KhiOaGViRJFjPmaIvTJ3tU9ERpejy3?=
 =?us-ascii?Q?iX21A3+OrlPzpWZLiXTt84zU/KcN64EzHtOpgDWnegu5cwNqYHRjbT153TXs?=
 =?us-ascii?Q?sz8+AC7Hov5vkYyCP8KP/GU7Zi99axv7iJrtdIqTIhZBbzfnnEozLjX0XaLv?=
 =?us-ascii?Q?TnPnsBhpG6aBCN7tlAWOL28WHaAEZWTkuzVtRtr4ZmkKqhQR2Wnds4ywUmDz?=
 =?us-ascii?Q?LY0htGjeCTEva+zsbCvMUm80jdCCPUkL/fglr2Yk+kDkCR57faUmxbq/C1++?=
 =?us-ascii?Q?vwughafiI9+RRDoqCpjuWwoolaSaXDauBABTb2q91zU5EQXCSN75ECjqkgi/?=
 =?us-ascii?Q?8+Nh8wuTlhnO0gAAGBmJb/xAv/6hphdBshNEfHpQFe7QT8Cf/vC8d6G9qMQp?=
 =?us-ascii?Q?Jo9LNRTGg44cuuxI9GJRsGw2T6XyOt0KEobOxNgPWwWXXkyzI60SovWTNFUA?=
 =?us-ascii?Q?drYwmKi7tRIgYO1+9gvudr1N+AN4gMdM8UfTig78nfSBHxiOfV76VY8cWdxF?=
 =?us-ascii?Q?yTZYk6I=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB5941.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?NsZcUOCTcEY/y1SW+/8u6HQVthst8KlfkMSskyft04+p2TYTOYVQDyAswNlS?=
 =?us-ascii?Q?Z+dS4+N4od9MrdHh9no00gXuJvHy0Pc3zyBY4oVJdbjkevGyW2jDL69Db6qC?=
 =?us-ascii?Q?gIi02b/hA0ojH76lvyNYnicI0+dTR46bkS5/F+sf+HbnbngJAyZ11uPKecmB?=
 =?us-ascii?Q?cJwBXQYIot6Oz+UrwV2QGZoFBWNB0Cq9ANFPa/nb+yy+8cjufyt4wt2jLTQc?=
 =?us-ascii?Q?3EKo656em160k+VYt4JvnEip0FRriEiDjJaTlZiQUKqKHKwQwmvo5Ufutajk?=
 =?us-ascii?Q?sAuKBTpZi4YmgBhwz1ECQjPP7lYpinf7Xx1ACRSw7Q5JjPvdbryXm3VFNmK1?=
 =?us-ascii?Q?HhbyYhDevwgSsU2NG75lmRCJz6F23mXX1pabGoGE/c2URqv1e4MARUzxWTLO?=
 =?us-ascii?Q?ZGHlaqe3nm1GwErQ8BSOMguCRvk52vV02pqG+bvH57GpbAnlAHSOb8WgL8Bc?=
 =?us-ascii?Q?YnkUsq1GQR18d9nbUE+itAODCCXgRkYD6RCj581Sf1p1JEOxjZFRuFHAxS7/?=
 =?us-ascii?Q?1gQNvb0ibrPcGVR7zECb1cpvkHXoXxSIjti6oCbTDg9ellWqXf9oa6AaCmWM?=
 =?us-ascii?Q?la3wOQ+PBU2hBZR9MP/DG7VvCrVIbhC9nyMwLZxL4VouPtd5qvtesPP955cx?=
 =?us-ascii?Q?Qna0oqH2TITRr6FUpZlTN9gMF1UQsJHoxedKnZRj26pgd/3XPfO2eoyqKdHk?=
 =?us-ascii?Q?KCLlc29WMTlku4m8BcjS3uJnKCvmHlFzgsNpVFE1G38yUT7SmlRB293el8tP?=
 =?us-ascii?Q?JNGi/Xgbh9pBrDs4zz9xpp7G4pKLFxOiQyM4/QoLSyAzbZmvdYLh5uR+W3K3?=
 =?us-ascii?Q?cZgfBQa4lJcIkERYHDnRgn8rbKzJ5e+NyTaZ/+6KppS3naedrF8Sx7IVEfSy?=
 =?us-ascii?Q?msoS/xdGI9N64JUPxhB+Sd/9OlTDUv+TTGnq0ioRvJwr3eju/3mJg5dLzt6b?=
 =?us-ascii?Q?DrHspA2GkW/vaK/E0BjWlofgoNjvS9DDHbjD38SWLF6WjzoKoQbhXJCIWsOg?=
 =?us-ascii?Q?AQWhpovLKlwz+rkUv8C4U8cJtBb/MfqBx/LuWPY0pPHjVIIAWbBObD9+q19B?=
 =?us-ascii?Q?Eu1x7Vrxe9ri5rx3A3VCiYqyIGTkUz7QR/bv0MBWvI1ojMu2K7PlPhCSL/pV?=
 =?us-ascii?Q?SefRmFR0saQDc80OJbbqa4iZvbJ/+8ow9vSfwZxcMcVqFcTOYC49xIzZ8Ms8?=
 =?us-ascii?Q?Bvs/EnIJcfQrgP8hhdOix4V4HavrHgNrElMm8UNmLYYATXyjJ6nNPzujTKjW?=
 =?us-ascii?Q?fwthyX9zEMxlHR7kEGPYeBCRaPWCLxTPsG9x8ZJISOGLu70Bs9F5Tv9ZAcyK?=
 =?us-ascii?Q?vDNw+4N9HzAxaW7El62Zyq/AeX6h55V4mAx8H/wh13zdN/VeLQl5IsdF7dRi?=
 =?us-ascii?Q?C0LngsPNc4VKTklkG5HUeypT946+GXreddOM4+heInOUWLDSkzXI8exGo5Gl?=
 =?us-ascii?Q?pFnkQSIfB5Xe5tDrnIjgyjjjtE6woR1sxRbR6y4mJM90Ilx/OURFQ3vHQRGQ?=
 =?us-ascii?Q?+VHRZYFVFy+scfDQh2p6J15s50YUF90/qg7MHJO8TwYVGEoG5Zyn8lHmpwCw?=
 =?us-ascii?Q?sfcUT60zU75imlQR8bo=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB5941.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9b4e0c8-eac6-450a-faa5-08dc9a5f578c
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2024 06:22:26.0752
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eIJXizBA5CAnv8xUex7ra7Hh36camgaCaHObKEMcZVOgGyYGAen8EYt97EP3TNOwCmJWnoQ5Zcj7HQVWbqhSvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7632

> arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb: /: failed to
> match any schema with compatible: ['fsl,imx95-19x19-evk', 'fsl,imx95']
>=20
> tree:
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2F
> git.kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Fshawnguo
> %2Flinux.git&data=3D05%7C02%7Cpeng.fan%40nxp.com%7Cb357bd5c9
> 74f474b850608dc9a5f17a1%7C686ea1d3bc2b4c6fa92cd99c5c30163
> 5%7C0%7C0%7C638554980420478185%7CUnknown%7CTWFpbGZsb
> 3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVC
> I6Mn0%3D%7C0%7C%7C%7C&sdata=3DzOJwK%2FqDLTt9ctRcSl1bU57U
> XrDbURwhjE%2B%2B4qJNkXg%3D&reserved=3D0 imx/dt64
> head:   9db27bc55bd8363570c5a259ff4dc77bd6a0b2cd
> commit: b8f771037e9e34f46bd6ef6a0ae568d2a782e6e1 [53/91]
> arm64: dts: freescale: add i.MX95 19x19 EVK minimal board dts
> config: arm64-randconfig-051-20240702
> compiler: clang version 19.0.0git
> (https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2
> Fgithub.com%2Fllvm%2Fllvm-
> project&data=3D05%7C02%7Cpeng.fan%40nxp.com%7Cb357bd5c974f47
> 4b850608dc9a5f17a1%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0
> %7C0%7C638554980420486624%7CUnknown%7CTWFpbGZsb3d8eyJ
> WIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0
> %3D%7C0%7C%7C%7C&sdata=3DBFu0TQNSW3jPVSLoTlUU55qWNpdAY
> Ge7roisK0WUyzQ%3D&reserved=3D0
> 326ba38a991250a8587a399a260b0f7af2c9166a)
> dtschema version: 2024.6.dev3+g650bf2d
> reproduce (this is a W=3D1 build):
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new
> version of the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes:
> |
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2F
> lore
> | .kernel.org%2Foe-kbuild-all%2F202407021405.ahrmTsPb-
> lkp%40intel.com%2F
> |
> &data=3D05%7C02%7Cpeng.fan%40nxp.com%7Cb357bd5c974f474b850
> 608dc9a5f17a1%
> |
> 7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C6385549804
> 20491489%7CUnkn
> |
> own%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJB
> TiI6Ik1haWwi
> |
> LCJXVCI6Mn0%3D%7C0%7C%7C%7C&sdata=3D9VUZ0Vy4JPhjSp0y6Hmy
> 865YN8SyTMzBN%2F
> | gABuLu0xM%3D&reserved=3D0
>=20
> dtcheck warnings: (new ones prefixed by >>)
> >> arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb: /: failed to
> match
> >> any schema with compatible: ['fsl,imx95-19x19-evk', 'fsl,imx95']
> >> arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb: /: failed to
> match
> >> any schema with compatible: ['fsl,imx95-19x19-evk', 'fsl,imx95']
>    arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb: scmi:
> protocol@19: Unevaluated properties are not allowed
> ('regusdhc2vmmcgrp', 'uart1grp', 'usdhc1-100mhzgrp', 'usdhc1-
> 200mhzgrp', 'usdhc1grp', 'usdhc2-100mhzgrp', 'usdhc2-200mhzgrp',
> 'usdhc2gpiogrp', 'usdhc2grp' were unexpected)

The binding is in Linus' pinctrl tree.

Regards,
Peng.


>    	from schema $id:
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fd
> evicetree.org%2Fschemas%2Ffirmware%2Farm%2Cscmi.yaml%23&dat
> a=3D05%7C02%7Cpeng.fan%40nxp.com%7Cb357bd5c974f474b850608d
> c9a5f17a1%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C6
> 38554980420496327%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4w
> LjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%
> 7C%7C%7C&sdata=3DxCDo6NX%2FUZthtdsF8gT6Ue%2Bb4lJTLWJUW09c
> JNM7dn8%3D&reserved=3D0
>=20
> --
> 0-DAY CI Kernel Test Service
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2F
> github.com%2Fintel%2Flkp-
> tests%2Fwiki&data=3D05%7C02%7Cpeng.fan%40nxp.com%7Cb357bd5c9
> 74f474b850608dc9a5f17a1%7C686ea1d3bc2b4c6fa92cd99c5c30163
> 5%7C0%7C0%7C638554980420501016%7CUnknown%7CTWFpbGZsb
> 3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVC
> I6Mn0%3D%7C0%7C%7C%7C&sdata=3D%2Bq2%2FudOW%2BlL9BLf1lWi
> qLwMfMU0G4F140X5ZfPtJ4zg%3D&reserved=3D0
