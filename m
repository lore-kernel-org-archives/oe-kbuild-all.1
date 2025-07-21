Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011069.outbound.protection.outlook.com [40.107.130.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED5D31F4C8C
	for <oe-kbuild-all@lists.linux.dev>; Mon, 21 Jul 2025 02:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753064868; cv=fail; b=DjI0DX+LqLkKYxoM1m6O1WOoBoknNclOD8/4M8ugvroZ8hoo6mIPGar/nH5rxuS8x/PdWNlgopibNpr29dYymW+g1h7OgWGs3VInsS4uZEyFWSmbwLh2SgJU58jh70+U+vjweQhdZl/gGDS1/bEnbsCrP2KHzF7BHd+ESsQ6hpU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753064868; c=relaxed/simple;
	bh=WYpRAGKOkVjfYLu7ZdFbxz1EC+4kkRLi+rAduxoRwrc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=KyD7Pq4ZZ7axCHfDsxtyT6PlOX+qvYi31pHtSmaEXM85I6/cjGqp6AgILI8E45gWh4l2b1djfE04EREqdrMaZ7QUFGog/XZ02EU6CD+MOQdreIoT+0gP54ILUpzX6+7LSSJPdJXvkviybEMh/KEmi4vEXR8E2bURNbBMd67MmRM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=iG4aJ2p4; arc=fail smtp.client-ip=40.107.130.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="iG4aJ2p4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g70ozTd+Pe9RzIerwEQAXeCi5qVtKwmx0L9t3SpTtldEK9HwWzcNWTw+wj9VfJ1+mXd/ePXmw0h4N2Kdm5k0nTpyafbPSIt4u2/hm68CCSH9kRwyJWkW86jNJjvwRErswrblmO+DMOGyIuvvpQsPJMZqEXVdXUyOnWgMO19HFYe+KBk5vqM062/ftm4qHSZU7nWP5Qg61WW5vhGjw5QWsa/2IVvwR59X3/jEW0fgbpcwkW0ZyUSA34YM1y8a3HVZCJHvt2HhOHe5EClned2ZS8tfr+sXm+R2JdIisaeLoBHgigi1rt7SrHNyihCqRnaePJ2o10LPREpuiPSnF43qoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MHhUsVJlESZEXYPckZswLH3mcXi2Wo4o9lTgLEPVjAM=;
 b=GH7AizXbybpt6tboEs6A4vg0jNkelLcTofWqgSONPPX/RU1pQelXkopjdLZPDknovV7lbXNOfJf0nkWuazxXQQnR6JAQ/rJEcWgGAwh0+9YW+EB2p3DbvCVUr4/co/CM5QriRaIAs+AtLSJ1TMXS76Zud3UMeGp6av3cC3aAxFt1qrp+s1rvWxUAVhDO8BJ0C+IlxrZXFxB+2fhdASoaHhVR4IjG0++jt5vUp1qkSJN6OqGdR70fjI2RlEDIFai+/d9HPq4h8Cy9aq1JRZY3/2OZwVaJUOI0FRLcHfBb7udNBtkrnvsvhI84D67chz9J9HdXr+YVO8cbScUXDOvDYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MHhUsVJlESZEXYPckZswLH3mcXi2Wo4o9lTgLEPVjAM=;
 b=iG4aJ2p44ormywY0OA+VkGORHVmQXo3CHJNJ7DVd11IXysegbUSsdjMD0G3iHPTU19qE0lb/3i/XXg5QZMVRSax1PJJmL5smg2yeXn24WoM9RfNIxodwSkH/hu70NI8JVWWOuKQSwWWDa3jitujj7tG6oe1chBSfrOgBMPix3SAk4kM7Dqyxs8//s6l3/cgDOP332NgUnwb4pPqZISeTNjfdePQUEjV6uB/z4OxbUDo+gsoHuhpPyxl5/HCPUC3O/sDOI1eM+S92UOObgL4dzAA2JF+z9JYvDCuNl1ir8bD7L2rqTekhDHCeiyOhE/0yRX02IEsufVEis/jyqUemVA==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM7PR04MB6919.eurprd04.prod.outlook.com (2603:10a6:20b:10e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Mon, 21 Jul
 2025 02:27:38 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%7]) with mapi id 15.20.8943.029; Mon, 21 Jul 2025
 02:27:38 +0000
From: Peng Fan <peng.fan@nxp.com>
To: kernel test robot <lkp@intel.com>, Xu Yang <xu.yang_2@nxp.com>
CC: "oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>, Shawn Guo
	<shawnguo@kernel.org>, Frank Li <frank.li@nxp.com>
Subject: RE: [linux-next:master 5388/11307]
 arch/arm64/boot/dts/freescale/imx95-15x15-evk.dtb: phy@4c1f0040
 (fsl,imx95-usb-phy): fsl,phy-pcs-tx-deemph-3p5db-attenuation-db: 17 is not of
 type 'array'
Thread-Topic: [linux-next:master 5388/11307]
 arch/arm64/boot/dts/freescale/imx95-15x15-evk.dtb: phy@4c1f0040
 (fsl,imx95-usb-phy): fsl,phy-pcs-tx-deemph-3p5db-attenuation-db: 17 is not of
 type 'array'
Thread-Index: AQHb+NZhfmjjaRhEaEGp6u3ehFPxv7Q73C4Q
Date: Mon, 21 Jul 2025 02:27:38 +0000
Message-ID:
 <PAXPR04MB8459FC7DAC843EBC3FF81B19885DA@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <202507191945.DjTsT5El-lkp@intel.com>
In-Reply-To: <202507191945.DjTsT5El-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|AM7PR04MB6919:EE_
x-ms-office365-filtering-correlation-id: eae8ed32-82d4-483d-ce26-08ddc7fe2965
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|19092799006|13003099007|38070700018|220923002;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?Vsb2OaVRhPLkv5MpqlXBy1AYDFjQL9sPN3lOBScDYMAJebCKQR5nVsfq+VkL?=
 =?us-ascii?Q?Vxb9qLf5Gaa21Are+HjjWuNYJVqKz+IHOYPmr8KBLZml/0FDnJ1U8w0D606h?=
 =?us-ascii?Q?SdbdLPgxbEQdZbnVp9yTl1FzzBaHSCVE50ivgXVIV1dgrZj/Bv4lWbfoRHvS?=
 =?us-ascii?Q?4CmlcNz3Jy1j6WmSSbbhZZhmIVAqDmOCBtrL8C0oDkKgJEhIQg5Gv9fmPuH7?=
 =?us-ascii?Q?fHMnU938NxesJk1D4b6wfmgDAuw7sYfKK42QxXD4aPW33VKkeDpS5/a5cuJI?=
 =?us-ascii?Q?9QeuHuuZWtKy4sGB3zxLh8Y3ArrVwEZQXWzbKLdr15AY2Ksvr1KoWRFyZqsu?=
 =?us-ascii?Q?KLwmJuhMejkXiivoIjYbn06kgy0qdZZ1Y/noMAz0ae0LDwF8p+qg2ld30c6L?=
 =?us-ascii?Q?aT2CmHXhf9H2jaLEK4NJZ9SjqzfGQ3h6snkHWrsuWgZhELp48j5Z7kOzn8ad?=
 =?us-ascii?Q?lJYSevtiH4QldmrXYM4tVofFOxbVBWx1XScaQSjcXut++dwj6VfarWZ/h6B1?=
 =?us-ascii?Q?yy7uwZGVtfl2EjD3RLYo0jM7UNNMRKpRWY6rmbfqypUVaeYk+haBJNLjbXPe?=
 =?us-ascii?Q?OWJv9LUpMAOIzsktyLuaR0XBWJZ7c6i6QpbW5EXOjwINkrr1w6U1pbZv2huy?=
 =?us-ascii?Q?hkyLy2RgSH2DdAh43CO+L3tbDurn/CPyE5EcEOsqR8YqLV2k4FyPHTVb239L?=
 =?us-ascii?Q?kxc0+Txf+bpTcYJzjIA8RhnPi2jsmQpt1aRAN9d/Mnfbi6qhUm6xKBue25Xm?=
 =?us-ascii?Q?S7v4k71rZc8RFBNcivphjHJAKOYspukMV9XigVPt1qqkJAeAIZDysSoJfn9E?=
 =?us-ascii?Q?rphf90d9qBjGqdN8VZ81P07sBKRs/DwhxfZNggP7ZUe6mrrdorN0pgpmWUy/?=
 =?us-ascii?Q?VlBSxDUjefxMh9KJagkCdjvE2QNEVCikFLDV9AfKqdJ2kfaz8rRwe7x1nxXy?=
 =?us-ascii?Q?tB95mjaTvPg7lw+Fpizl8MYVOrHkvBYMjdpse/ASP5q73+5AxceNOWczse2G?=
 =?us-ascii?Q?M/LmqEUjCqhGgu8/yIfFA4ndk5wVr/ZXgy8U1x1+Z83s6ZtscHxNU/29BlkG?=
 =?us-ascii?Q?CAL6Oexo6ogjJLO7TLRKObHEYABnuj04wRoqEzpSAe+FvTmPquCFbx8LxGjB?=
 =?us-ascii?Q?Yi0ZTx+qnDZUJYlfsvJNqeiil1ykz8RbFcIc1ol480wCZ3DbXYLLDIgyrXlc?=
 =?us-ascii?Q?F+I9x8pOeYKD7docC5m7XV02ekcDDbmd/cwfnuEAyVsu/ITXf+yheavPUmXW?=
 =?us-ascii?Q?oa6kIr68VH65quoBveeVtsXcizZvEqQd9ew+9m8Uo4WV0qhV27sR4FiNoJYU?=
 =?us-ascii?Q?MVSgWzKjFbwQWLaO+9b71zRpjjD0LL2fSevKDWxX671zVyLSzO5c/RUTyhWh?=
 =?us-ascii?Q?Tg2YdXZLWsLHqhpGpIcsWTvcpvhKiDb1VauvJTyV++RClFkd1P+imcQyJ/Gw?=
 =?us-ascii?Q?w1CFLSJh+CYWBFxIhUdoxaxHRulzxInw?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(19092799006)(13003099007)(38070700018)(220923002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?ny2zXedjHpJaOMH+YP9T5dT9wzywQocMtk1T8Hjm2e9ne5vhsZaivU7jQAtR?=
 =?us-ascii?Q?RecTqes1SqqBrs7styWwONWWWnD6sToSuFsLik0XFWoIluiF9q51mToJxIKd?=
 =?us-ascii?Q?z+2/182862b8q8bQqWc4jnQRLwr3o7nONoYTxDQ6Aq5OqB0yXSr5Jltk/XtW?=
 =?us-ascii?Q?UjyXvkKI779c6StMdDKpoJ5DSYk/3mY6cLBuB8euhZBa14w5XwCrj+aZJ1Zv?=
 =?us-ascii?Q?Nz0tbu1VZqLve+W6jbH9MJmf9V5FFpRwsDzEpCpar9oXCkK2yJAMIqMuCuh6?=
 =?us-ascii?Q?ydQkNDUTylfPVwu8avuAXyEPUzalVaz/uEszrxzs0DDUrGQWUfCmorvY6vsg?=
 =?us-ascii?Q?8RULGOU1yOKIrL7ZsXDz27vNOVsaFFxEE0P8jab/eBOZG5/MtU/vrs/XGQYf?=
 =?us-ascii?Q?0DUPstPfLR+NgZK7CmAEZnqq3jYZkCu0y/rYoa2AD6nOOPlBvqIU2bQYSgBr?=
 =?us-ascii?Q?miMPIVhnHGwgES7yAd4o60OnuDyMt3pQD2szF9wBSwM2M1ZzSMklHn5vnJvd?=
 =?us-ascii?Q?2cOTbokURO4X7R6rIIuR9iWSft7ay/+U4s5f++uj3wnby01TvKyZ0ZnlQOTl?=
 =?us-ascii?Q?c7iGzakL1E8HqRcu0vLxKD38vjnx/AgjLnQEwyXmuHgjPTHxI+itdNA8n9Jr?=
 =?us-ascii?Q?8JAsuIjYHcozv0MPH0MgUOR7tM/jt8fPQyJh7pM9xe3H9hDG9Cd5laqiW7Al?=
 =?us-ascii?Q?gljnI+C/YpMYV/bzRCz29/xxH42CRQN3E6CF+4ke9HkeOFOtVB2cE2zK5whp?=
 =?us-ascii?Q?MSydrB29DWuMMdVFMsze1N6v9jC8r2YhqljtfmYMPNC/cziu/FIfvYLP3RAo?=
 =?us-ascii?Q?np7w0sSWdnzBPLBeAzyh40Dr+JEagZGlPGuFy/90yH2VPfyh+O1F6qnWsfmX?=
 =?us-ascii?Q?LGyg9uQ4dIVkuEYTgyGfjakgZVj6CHmbLiGUzqs+68QPEYmwa/fpdsIJLA6E?=
 =?us-ascii?Q?U61li6gsPzk7SJO9h2rWJs0iAt3iERWB8XIhVpy7vZlN15bbKzg4RIcqLm7j?=
 =?us-ascii?Q?KYhqfYebZx9edXcssaI8+n7mC8sLojhPw4upVUAUbPMjWJl1EMquFICJvE28?=
 =?us-ascii?Q?U9VOkOcUmGK4qwDv5kF+5XF/Bi3Isc+LxQSULpTgsxgNn8DOKvny82x2OqXm?=
 =?us-ascii?Q?jqaRvYH7spMWNJ32zepnXf8EtrmCFToCjxoTQwW9fXu+n6s8g1nvWTFoK3SK?=
 =?us-ascii?Q?Y+nnS8Mwr/BT0TmbArdHLw8odnnK2no43G0lXTskdOPVU2LQLhgaNKK81YV5?=
 =?us-ascii?Q?KImN9RmBna42NwZS6ARdOmJuAlNsVRLgin82SNTWW9bak+glU9aVfcAXCQ0p?=
 =?us-ascii?Q?vyRYQvHNj4xeBR2N7RYrV9YyH103Cs16lXUIgx21MLgAppEDZswgWtDuXCaU?=
 =?us-ascii?Q?THxMNgnNQNGW9RAKipO3mIR6aHUE7Qswd7dlmnp0OaeCYZWxL6DadNdFNHmv?=
 =?us-ascii?Q?4Ur7zC7LjoA7Xr2DYOnBNF6pAKsouK41/jb1wPD51nnROS6B/x8o7L2kME9x?=
 =?us-ascii?Q?0Pf99Reuo9uYOahpykVhovG/taifHX55vEak4zdqoTOTvo6y30UeIyetIvbp?=
 =?us-ascii?Q?5+aWeT2VqZ3+NUaq8do=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eae8ed32-82d4-483d-ce26-08ddc7fe2965
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jul 2025 02:27:38.6167
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /frjOUZ4o54aYGegZ3jPVqzwQFCvQfRe0OW5Yaxymg9ahG+PUDlMt6LyrOwyc6O5Jw5xeOEdS6g6C7BEL+TCSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6919


> Subject: [linux-next:master 5388/11307]
> arch/arm64/boot/dts/freescale/imx95-15x15-evk.dtb: phy@4c1f0040
> (fsl,imx95-usb-phy): fsl,phy-pcs-tx-deemph-3p5db-attenuation-db: 17 is
> not of type 'array'

This warning could be ignored.

The binding is in tree now.

Regards
Peng.

>=20
> tree:
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2F
> git.kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Fnext%2Flin
> ux-
> next.git&data=3D05%7C02%7Cpeng.fan%40nxp.com%7Cedc6e993d2b14
> 19c52ce08ddc6ed823c%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C
> 0%7C0%7C638885445582682177%7CUnknown%7CTWFpbGZsb3d8ey
> JFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIk
> FOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3DO%2FII%
> 2Fi3hJY9IdGYgeJUa0qwy39pYNwn3gVXgxitG51k%3D&reserved=3D0
> master
> head:   d086c886ceb9f59dea6c3a9dae7eb89e780a20c9
> commit: 04c9dd9c7d19c44c2290373129793213a198552c
> [5388/11307] arm64: dts: imx95-evk: add USB3 PHY tuning properties
> config: arm64-randconfig-2051-20250717
> (https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2
> Fdownload.01.org%2F0day-
> ci%2Farchive%2F20250719%2F202507191945.DjTsT5El-
> lkp%40intel.com%2Fconfig&data=3D05%7C02%7Cpeng.fan%40nxp.com
> %7Cedc6e993d2b1419c52ce08ddc6ed823c%7C686ea1d3bc2b4c6fa92
> cd99c5c301635%7C0%7C0%7C638885445582705932%7CUnknown%
> 7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMC
> IsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C
> %7C&sdata=3DSGsf8GAt1oNqROMCYWd5zTpHjrIiGGR%2FGSCSQyjbIGU%
> 3D&reserved=3D0)
> compiler: aarch64-linux-gcc (GCC) 8.5.0
> dtschema version: 2025.6.2.dev4+g8f79ddd reproduce (this is a W=3D1
> build):
> (https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2
> Fdownload.01.org%2F0day-
> ci%2Farchive%2F20250719%2F202507191945.DjTsT5El-
> lkp%40intel.com%2Freproduce&data=3D05%7C02%7Cpeng.fan%40nxp.c
> om%7Cedc6e993d2b1419c52ce08ddc6ed823c%7C686ea1d3bc2b4c6f
> a92cd99c5c301635%7C0%7C0%7C638885445582720557%7CUnknow
> n%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAw
> MCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%
> 7C%7C&sdata=3D84sqwKouuPLmvPMwyrk32PP4cn2ke14FpYJyQFBafp4
> %3D&reserved=3D0)
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new
> version of the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes:
> |
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2F
> lore
> | .kernel.org%2Foe-kbuild-all%2F202507191945.DjTsT5El-
> lkp%40intel.com%2F
> |
> &data=3D05%7C02%7Cpeng.fan%40nxp.com%7Cedc6e993d2b1419c52c
> e08ddc6ed823c%
> |
> 7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C6388854455
> 82734787%7CUnkn
> |
> own%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMD
> AwMCIsIlAiOiJX
> |
> aW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdat
> a=3DUOfhx4WeH%
> | 2Fqt%2BuUvZ11HZ4f60yZe8DpQyiPlNk%2Biu2Y%3D&reserved=3D0
>=20
> dtcheck warnings: (new ones prefixed by >>)
> >> arch/arm64/boot/dts/freescale/imx95-15x15-evk.dtb:
> phy@4c1f0040 (fsl,imx95-usb-phy): fsl,phy-pcs-tx-deemph-3p5db-
> attenuation-db: 17 is not of type 'array'
>    	from schema $id:
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fd
> evicetree.org%2Fschemas%2Fphy%2Ffsl%2Cimx8mq-usb-
> phy.yaml%23&data=3D05%7C02%7Cpeng.fan%40nxp.com%7Cedc6e993
> d2b1419c52ce08ddc6ed823c%7C686ea1d3bc2b4c6fa92cd99c5c3016
> 35%7C0%7C0%7C638885445582748009%7CUnknown%7CTWFpbGZs
> b3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW
> 4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3DB
> aOta2YPyDtIrR8lT4IMUVStKXYZ0rBhiYgrhsVuOQs%3D&reserved=3D0
>    arch/arm64/boot/dts/freescale/imx95-15x15-evk.dtb:
> phy@4c1f0040 (fsl,imx95-usb-phy): Unevaluated properties are not
> allowed ('fsl,phy-pcs-tx-deemph-3p5db-attenuation-db' was
> unexpected)
>    	from schema $id:
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fd
> evicetree.org%2Fschemas%2Fphy%2Ffsl%2Cimx8mq-usb-
> phy.yaml%23&data=3D05%7C02%7Cpeng.fan%40nxp.com%7Cedc6e993
> d2b1419c52ce08ddc6ed823c%7C686ea1d3bc2b4c6fa92cd99c5c3016
> 35%7C0%7C0%7C638885445582761042%7CUnknown%7CTWFpbGZs
> b3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW
> 4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3D
> WWL7zfQaXyVIOKaGGLlE4L1m4P5QKaOTMDwjHDe6xPU%3D&reserve
> d=3D0
> >> arch/arm64/boot/dts/freescale/imx95-15x15-evk.dtb:
> phy@4c1f0040 (fsl,imx95-usb-phy): fsl,phy-pcs-tx-deemph-3p5db-
> attenuation-db: 17 is not of type 'array'
>    	from schema $id:
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fd
> evicetree.org%2Fschemas%2Fproperty-
> units.yaml%23&data=3D05%7C02%7Cpeng.fan%40nxp.com%7Cedc6e99
> 3d2b1419c52ce08ddc6ed823c%7C686ea1d3bc2b4c6fa92cd99c5c301
> 635%7C0%7C0%7C638885445582774314%7CUnknown%7CTWFpbGZ
> sb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW
> 4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3D4
> n0TBAdUuXqVxwLHKqK4mQi9FYRKQd8USIYvsFayVFw%3D&reserved=3D
> 0
> --
> >> arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb:
> phy@4c1f0040 (fsl,imx95-usb-phy): fsl,phy-pcs-tx-deemph-3p5db-
> attenuation-db: 17 is not of type 'array'
>    	from schema $id:
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fd
> evicetree.org%2Fschemas%2Fphy%2Ffsl%2Cimx8mq-usb-
> phy.yaml%23&data=3D05%7C02%7Cpeng.fan%40nxp.com%7Cedc6e993
> d2b1419c52ce08ddc6ed823c%7C686ea1d3bc2b4c6fa92cd99c5c3016
> 35%7C0%7C0%7C638885445582787571%7CUnknown%7CTWFpbGZs
> b3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW
> 4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3Dk
> GFwWO%2BQwi%2Bnv6Wuy%2Fy2V5gIvvD%2Bq9jsA5RFPAEZkJc%3D
> &reserved=3D0
>    arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb:
> phy@4c1f0040 (fsl,imx95-usb-phy): Unevaluated properties are not
> allowed ('fsl,phy-pcs-tx-deemph-3p5db-attenuation-db' was
> unexpected)
>    	from schema $id:
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fd
> evicetree.org%2Fschemas%2Fphy%2Ffsl%2Cimx8mq-usb-
> phy.yaml%23&data=3D05%7C02%7Cpeng.fan%40nxp.com%7Cedc6e993
> d2b1419c52ce08ddc6ed823c%7C686ea1d3bc2b4c6fa92cd99c5c3016
> 35%7C0%7C0%7C638885445582800564%7CUnknown%7CTWFpbGZs
> b3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW
> 4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3D
> Qz7aAqwF9QWUnSb42Fx6ntxm6WOEMEDlGCtHvhtv%2B7w%3D&res
> erved=3D0
> >> arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb:
> phy@4c1f0040 (fsl,imx95-usb-phy): fsl,phy-pcs-tx-deemph-3p5db-
> attenuation-db: 17 is not of type 'array'
>    	from schema $id:
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fd
> evicetree.org%2Fschemas%2Fproperty-
> units.yaml%23&data=3D05%7C02%7Cpeng.fan%40nxp.com%7Cedc6e99
> 3d2b1419c52ce08ddc6ed823c%7C686ea1d3bc2b4c6fa92cd99c5c301
> 635%7C0%7C0%7C638885445582814116%7CUnknown%7CTWFpbGZ
> sb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW
> 4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3D
> N9sfWsl9FUaGY85TAuwBv4oBoqkv0brfYot%2BRG5jh70%3D&reserved
> =3D0
> --
>    arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts:54.18-57.4:
> Warning (unique_unit_address_if_enabled): /memory@80000000:
> duplicate unit-address (also used in node /cm7-cpu@80000000)
> >> arch/arm64/boot/dts/freescale/imx95-19x19-evk-sof.dtb:
> phy@4c1f0040 (fsl,imx95-usb-phy): fsl,phy-pcs-tx-deemph-3p5db-
> attenuation-db: 17 is not of type 'array'
>    	from schema $id:
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fd
> evicetree.org%2Fschemas%2Fphy%2Ffsl%2Cimx8mq-usb-
> phy.yaml%23&data=3D05%7C02%7Cpeng.fan%40nxp.com%7Cedc6e993
> d2b1419c52ce08ddc6ed823c%7C686ea1d3bc2b4c6fa92cd99c5c3016
> 35%7C0%7C0%7C638885445582826381%7CUnknown%7CTWFpbGZs
> b3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW
> 4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3Dfi
> 5XpevdCwq6jC8UMYIaCfLynV7sZGrx%2BK5mglS9lCE%3D&reserved=3D0
>    arch/arm64/boot/dts/freescale/imx95-19x19-evk-sof.dtb:
> phy@4c1f0040 (fsl,imx95-usb-phy): Unevaluated properties are not
> allowed ('fsl,phy-pcs-tx-deemph-3p5db-attenuation-db' was
> unexpected)
>    	from schema $id:
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fd
> evicetree.org%2Fschemas%2Fphy%2Ffsl%2Cimx8mq-usb-
> phy.yaml%23&data=3D05%7C02%7Cpeng.fan%40nxp.com%7Cedc6e993
> d2b1419c52ce08ddc6ed823c%7C686ea1d3bc2b4c6fa92cd99c5c3016
> 35%7C0%7C0%7C638885445582840910%7CUnknown%7CTWFpbGZs
> b3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW
> 4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3Dh
> 4dm5k%2FQEPPu9GgJF1YMFpBy7h3EPMOQ%2FFalDC0BUY4%3D&res
> erved=3D0
> >> arch/arm64/boot/dts/freescale/imx95-19x19-evk-sof.dtb:
> phy@4c1f0040 (fsl,imx95-usb-phy): fsl,phy-pcs-tx-deemph-3p5db-
> attenuation-db: 17 is not of type 'array'
>    	from schema $id:
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fd
> evicetree.org%2Fschemas%2Fproperty-
> units.yaml%23&data=3D05%7C02%7Cpeng.fan%40nxp.com%7Cedc6e99
> 3d2b1419c52ce08ddc6ed823c%7C686ea1d3bc2b4c6fa92cd99c5c301
> 635%7C0%7C0%7C638885445582854129%7CUnknown%7CTWFpbGZ
> sb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW
> 4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3DR
> bzsnVWAk6f9P2sNWC8Nis4kZ%2F3L28c4LnyHoh8ibB4%3D&reserved
> =3D0
> --
>    arch/arm64/boot/dts/freescale/imx95-15x15-evk-pcie0-ep.dtb:
> phy@4c1f0040 (fsl,imx95-usb-phy): fsl,phy-pcs-tx-deemph-3p5db-
> attenuation-db: 17 is not of type 'array'
>    	from schema $id:
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fd
> evicetree.org%2Fschemas%2Fphy%2Ffsl%2Cimx8mq-usb-
> phy.yaml%23&data=3D05%7C02%7Cpeng.fan%40nxp.com%7Cedc6e993
> d2b1419c52ce08ddc6ed823c%7C686ea1d3bc2b4c6fa92cd99c5c3016
> 35%7C0%7C0%7C638885445582867585%7CUnknown%7CTWFpbGZs
> b3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW
> 4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3D6
> QCXlbQvXd2RozByrhz0r1FM%2B9RBszpfzUaiBtG785k%3D&reserved=3D0
> >> arch/arm64/boot/dts/freescale/imx95-15x15-evk-pcie0-ep.dtb:
> >> phy@4c1f0040 (fsl,imx95-usb-phy): Unevaluated properties are not
> >> allowed ('fsl,phy-pcs-tx-deemph-3p5db-attenuation-db' was
> unexpected)
>    	from schema $id:
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fd
> evicetree.org%2Fschemas%2Fphy%2Ffsl%2Cimx8mq-usb-
> phy.yaml%23&data=3D05%7C02%7Cpeng.fan%40nxp.com%7Cedc6e993
> d2b1419c52ce08ddc6ed823c%7C686ea1d3bc2b4c6fa92cd99c5c3016
> 35%7C0%7C0%7C638885445582880513%7CUnknown%7CTWFpbGZs
> b3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW
> 4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3D3
> xCt%2BCjY7M7HtPKcSVoLKlPquhyK5lyPdh2LNHft5mA%3D&reserved=3D
> 0
>    arch/arm64/boot/dts/freescale/imx95-15x15-evk-pcie0-ep.dtb:
> phy@4c1f0040 (fsl,imx95-usb-phy): fsl,phy-pcs-tx-deemph-3p5db-
> attenuation-db: 17 is not of type 'array'
>    	from schema $id:
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fd
> evicetree.org%2Fschemas%2Fproperty-
> units.yaml%23&data=3D05%7C02%7Cpeng.fan%40nxp.com%7Cedc6e99
> 3d2b1419c52ce08ddc6ed823c%7C686ea1d3bc2b4c6fa92cd99c5c301
> 635%7C0%7C0%7C638885445582893762%7CUnknown%7CTWFpbGZ
> sb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW
> 4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3DY
> IkeYZgDLcr2QihoK%2BzV0ZJZONM%2Fzk49Uh%2Fnl2nWAeM%3D&res
> erved=3D0
> --
>    arch/arm64/boot/dts/freescale/imx95-19x19-evk-pcie0-ep.dtb:
> phy@4c1f0040 (fsl,imx95-usb-phy): fsl,phy-pcs-tx-deemph-3p5db-
> attenuation-db: 17 is not of type 'array'
>    	from schema $id:
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fd
> evicetree.org%2Fschemas%2Fphy%2Ffsl%2Cimx8mq-usb-
> phy.yaml%23&data=3D05%7C02%7Cpeng.fan%40nxp.com%7Cedc6e993
> d2b1419c52ce08ddc6ed823c%7C686ea1d3bc2b4c6fa92cd99c5c3016
> 35%7C0%7C0%7C638885445582906857%7CUnknown%7CTWFpbGZs
> b3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW
> 4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3D5
> YVFyJ0oW%2BxlhmtK8FYyjSng1c1fWdLx8U%2BqNiPW9h0%3D&reserv
> ed=3D0
> >> arch/arm64/boot/dts/freescale/imx95-19x19-evk-pcie0-ep.dtb:
> >> phy@4c1f0040 (fsl,imx95-usb-phy): Unevaluated properties are not
> >> allowed ('fsl,phy-pcs-tx-deemph-3p5db-attenuation-db' was
> unexpected)
>    	from schema $id:
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fd
> evicetree.org%2Fschemas%2Fphy%2Ffsl%2Cimx8mq-usb-
> phy.yaml%23&data=3D05%7C02%7Cpeng.fan%40nxp.com%7Cedc6e993
> d2b1419c52ce08ddc6ed823c%7C686ea1d3bc2b4c6fa92cd99c5c3016
> 35%7C0%7C0%7C638885445582919882%7CUnknown%7CTWFpbGZs
> b3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW
> 4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3D
> G3FqX6jwYwQWRrEl0Nq7xvcGva%2B2a%2B%2BxWH9GrTHa8ig%3D&r
> eserved=3D0
>    arch/arm64/boot/dts/freescale/imx95-19x19-evk-pcie0-ep.dtb:
> phy@4c1f0040 (fsl,imx95-usb-phy): fsl,phy-pcs-tx-deemph-3p5db-
> attenuation-db: 17 is not of type 'array'
>    	from schema $id:
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fd
> evicetree.org%2Fschemas%2Fproperty-
> units.yaml%23&data=3D05%7C02%7Cpeng.fan%40nxp.com%7Cedc6e99
> 3d2b1419c52ce08ddc6ed823c%7C686ea1d3bc2b4c6fa92cd99c5c301
> 635%7C0%7C0%7C638885445582932993%7CUnknown%7CTWFpbGZ
> sb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW
> 4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3D0
> TXyICu%2FaocxjkUbbuvUGzWtHWWwBkUsT4l6cF9qb2E%3D&reserve
> d=3D0
> --
> >> arch/arm64/boot/dts/freescale/imx95-19x19-evk-pcie1-ep.dtb:
> phy@4c1f0040 (fsl,imx95-usb-phy): fsl,phy-pcs-tx-deemph-3p5db-
> attenuation-db: 17 is not of type 'array'
>    	from schema $id:
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fd
> evicetree.org%2Fschemas%2Fphy%2Ffsl%2Cimx8mq-usb-
> phy.yaml%23&data=3D05%7C02%7Cpeng.fan%40nxp.com%7Cedc6e993
> d2b1419c52ce08ddc6ed823c%7C686ea1d3bc2b4c6fa92cd99c5c3016
> 35%7C0%7C0%7C638885445582946025%7CUnknown%7CTWFpbGZs
> b3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW
> 4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3D
> wd%2Fz5Vo3Nt40VHIy84eQiRAjFiEbC4nv98m8NJZB%2BQg%3D&reser
> ved=3D0
>    arch/arm64/boot/dts/freescale/imx95-19x19-evk-pcie1-ep.dtb:
> phy@4c1f0040 (fsl,imx95-usb-phy): Unevaluated properties are not
> allowed ('fsl,phy-pcs-tx-deemph-3p5db-attenuation-db' was
> unexpected)
>    	from schema $id:
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fd
> evicetree.org%2Fschemas%2Fphy%2Ffsl%2Cimx8mq-usb-
> phy.yaml%23&data=3D05%7C02%7Cpeng.fan%40nxp.com%7Cedc6e993
> d2b1419c52ce08ddc6ed823c%7C686ea1d3bc2b4c6fa92cd99c5c3016
> 35%7C0%7C0%7C638885445582959265%7CUnknown%7CTWFpbGZs
> b3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW
> 4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3DI
> W7Q4JLfjWzlkXe6x8hQa7Aq0cygBQKZYpmBqynJwXU%3D&reserved=3D0
> >> arch/arm64/boot/dts/freescale/imx95-19x19-evk-pcie1-ep.dtb:
> phy@4c1f0040 (fsl,imx95-usb-phy): fsl,phy-pcs-tx-deemph-3p5db-
> attenuation-db: 17 is not of type 'array'
>    	from schema $id:
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fd
> evicetree.org%2Fschemas%2Fproperty-
> units.yaml%23&data=3D05%7C02%7Cpeng.fan%40nxp.com%7Cedc6e99
> 3d2b1419c52ce08ddc6ed823c%7C686ea1d3bc2b4c6fa92cd99c5c301
> 635%7C0%7C0%7C638885445582972451%7CUnknown%7CTWFpbGZ
> sb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW
> 4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3Da
> YyIyCt4YANYZPMOnx%2B7vF8HzVosOoi%2FKvvxhXuQ5Rc%3D&reserv
> ed=3D0
>=20
> --
> 0-DAY CI Kernel Test Service
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2F
> github.com%2Fintel%2Flkp-
> tests%2Fwiki&data=3D05%7C02%7Cpeng.fan%40nxp.com%7Cedc6e993d
> 2b1419c52ce08ddc6ed823c%7C686ea1d3bc2b4c6fa92cd99c5c30163
> 5%7C0%7C0%7C638885445582986275%7CUnknown%7CTWFpbGZsb
> 3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4z
> MiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3DTP
> mD8WiFDUJbkHcu3XohSuERdeSF7Pbeabq%2BknQHvxY%3D&reserved
> =3D0
