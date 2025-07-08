Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013070.outbound.protection.outlook.com [40.107.162.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF83F23DE
	for <oe-kbuild-all@lists.linux.dev>; Tue,  8 Jul 2025 01:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751939855; cv=fail; b=N9IixOLetoYiEFGkwZq5j3eYOS9yjhHmaIqfBpPnBBpK+ZZmE4QWkab0bszlcNor6GDHHdUAfY+2Z1rqSevb1rIHaDkrFct2ZVrtWlLNhcRH0rKbS6BR8zlvmjcFBoHAXSVA+SFdzaIwxbGPAlyOljtySNgHy7a7gnJzAWjNdWU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751939855; c=relaxed/simple;
	bh=U1ecwfAUCqrKYQ6d14Y91/YQ4Qa3k2n4KJq1pfiY+ZQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=QwifGrTC9NX5BpEYb6urTscoZB+KKJpueo2AhO809jqA+H21Z8H74dp97Bxcw1rPs+OPFjpXKJ4PzLPbyaZKs4FN98JUnmnFkTYETOnNjcWmfTQkqDQUJdi8zPFuSOU9t61IejON2nODVMKOxbgZvA/CCjROVaRs+BWMQtnDpac=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=m+bOhydg; arc=fail smtp.client-ip=40.107.162.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="m+bOhydg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H7P5cI6PSi8XPDHVHZ1ZVbajM+pUxsEon6mQjS6L+fwEyRsfAD+LOfewsTBJoXor1eG+Hhmftqc6HGlwqD2Lt9R/SMfoNKrOTVIF914Zun8zW8/g4Po3zv50wC5OuF2OP3xID7wCw2zMJh7lI1oCzu+ve9DoJbi09WP5xedvjMc+pqOBK/lIA9p6FSPlxrVkVq6LkSmW1G7Go5dZ2LnLAu4thjclUuVMqHBuoGpo4H/E27yWPRLvaO6WptrjNxv4fAOPCV71Z1hja3na0nLpn71A+00adeNdOLhNRvm8pH6be5nJfWz1cSMN8+JU6gxzIB+1C2O/axaXMZObh8SA3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A+pkeNqD69Xqo8n+JIxWD5Qo3UHHR2O+oU8SDEd2KDw=;
 b=JlReAjBytRydxS7m7kPiHNVuxvgVacEbBfVbYTorjBZkNYCJYKU9Tmj3nD0+zNpM+EcZOLmFL4i3ItoMOCKC3/BIABV5rCJaq6KtE4LR9mPhjp5S7f/E3Z5hmpfMiFjn4ddigim7Dr+a2+Q6JOH5JyrrUcLnBQoXHDwue5+POp9IH3HnsRgYuqlbd1qFsCCxaFsMwIDpV3w8UibQMsuEsK3CMsD1G3Lm5nOmoB0hFpgzkUuvdGUFnXCHpRtC/EAxwGuKl9m7PvbWm8vj4nqCQXyf3eCYvI/c3+yLTRbVywlibUheqGP6aeaBwSksoMWGdLmhd5ITzpZT0AJ3dBWZjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A+pkeNqD69Xqo8n+JIxWD5Qo3UHHR2O+oU8SDEd2KDw=;
 b=m+bOhydg51nPnHWJMUW1x2NCiNaoCIiSmJSe+B+y8EUgJpzAUw4JQXOJPnDVXSl1IPdyZKs6LOTbA2vPFu1YvRtvW1iFKQZR5Ez1jNLTJZgNad1Eo5CHhEQwalQRKKjQDkxGhTIDiPDfEMEysbf5U54j/ygyFFGxYQHPXHxKdBAn4OCMMdU5NIyrVd9w27U+LHbtuDupzypMGyYyUJuZwHAhvXAQlG9gvYGKPXA6kpF2s/Hmp8FDFet4qshCgNV2eqCzfSLxkbu74OAz3tJ6LN5013H7Gl2NO0S2563Eoyc+ysTCuGYZ1hI5BNzRCUKGNWgDc0D6r+o44nFdd2LHjw==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DB9PR04MB8138.eurprd04.prod.outlook.com (2603:10a6:10:25c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Tue, 8 Jul
 2025 01:57:26 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%7]) with mapi id 15.20.8901.024; Tue, 8 Jul 2025
 01:57:26 +0000
From: Peng Fan <peng.fan@nxp.com>
To: kernel test robot <lkp@intel.com>, Sudeep Holla <sudeep.holla@arm.com>
CC: "oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>, Cristian
 Marussi <cristian.marussi@arm.com>
Subject: RE: [sudeep-holla:for-next/scmi/updates 5/6]
 drivers/firmware/arm_scmi/bus.c:349:33: error: 'scmi_pm_suspend' undeclared
 here (not in a function)
Thread-Topic: [sudeep-holla:for-next/scmi/updates 5/6]
 drivers/firmware/arm_scmi/bus.c:349:33: error: 'scmi_pm_suspend' undeclared
 here (not in a function)
Thread-Index: AQHb71TYaP52xMML7UeWyXx2Jmv53bQncDGAgAAH90A=
Date: Tue, 8 Jul 2025 01:57:26 +0000
Message-ID:
 <PAXPR04MB84595E0F0BDB6BDE444D3D00884EA@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <202507072359.Hfy79Adu-lkp@intel.com>
 <PAXPR04MB845932CD9E1C87FA1A4F72BC884EA@PAXPR04MB8459.eurprd04.prod.outlook.com>
In-Reply-To:
 <PAXPR04MB845932CD9E1C87FA1A4F72BC884EA@PAXPR04MB8459.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|DB9PR04MB8138:EE_
x-ms-office365-filtering-correlation-id: 5e829cca-f5b9-47d7-e57e-08ddbdc2ca14
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|1800799024|19092799006|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?YA5w25QlJP4W5bMDBMBubTHI6NvknmJKr2eIDW4K4UykJpuxmjwn/sY0r0s1?=
 =?us-ascii?Q?5Ke4O/u2ezlqhkrSEg2eg0/gMg4cL/pA7kGLK10bNiJkYmREkjd54L06HBVG?=
 =?us-ascii?Q?SQ1K54MUKjxzfUapbNylOhM4zB1tn9MFMc6hEdhgGrGmRAC8O/gMfLp2QYm9?=
 =?us-ascii?Q?ZYm7mTnPcPfDZHX7MmePA5+2ddnEjvsbnHcO64q2tJtroFoFfdNloK+YmFoH?=
 =?us-ascii?Q?Ov2wg34dnAjcF2Yosa/W2vgP4nTuALftBaMx2vqO3yIc7JvlXT9JzaejW5Uq?=
 =?us-ascii?Q?h081wLzdT70p6eoU4c2v29ycoYOxnCrLJGCE4/4/Tc3HTd5kTRBnCorIaIhb?=
 =?us-ascii?Q?MAJS18BC1fyF2phYsMFg+KVbI8+EiPiXYu7KyaqJN9Taiixe63za2gLzIALa?=
 =?us-ascii?Q?A0pikjNvEsqN/jm+Eg7DoshbOHq9RBp7QHBvVcdzZV4Fd5A0BcTIOyeSigKz?=
 =?us-ascii?Q?acaX4i3Zp6FQ/PHJsU2dHPluo/p0yJoHfPEc6i/ylh9SQ3i9IHUJ37ubkZfD?=
 =?us-ascii?Q?urbFIb/3ylOJ5Du9GjMzHlILdK1cUZILjbx3vOCXui9YeJ6JF96nCIIvJ7ey?=
 =?us-ascii?Q?AsNMTuJEndqXJ/6Y5gOlgnujc1M2hkZk4AlcrNw9SpTVuOz7yvSiI1O5mIFK?=
 =?us-ascii?Q?7OgPRp7GYcoIhq43Q664Vl8g+XDmnXpHlxC5u7evVls6Y/cRKsVBIva2L0Ao?=
 =?us-ascii?Q?ViUE3PKJ6rKHtpoZchMoH38osD5RIxcsEYQ5c7PkkTBnKHPIkGZOgud3nfmk?=
 =?us-ascii?Q?ZLBCeDDRoZ09Y4XboOyVVaBBsKSUg5UJhzbPYNTkpjo4RrgzdnNS972ZY+9X?=
 =?us-ascii?Q?Oexb2+W6pfEdGiOZok7fOSNuFtzesKlRjGRqiv+sI3zRLF0BeomY4msrcglJ?=
 =?us-ascii?Q?gcck8F6H9k6GsIeStZq2yP+CpAHEEGXZP8iYZ5/6YrRq4sln6TyPiXwud6ep?=
 =?us-ascii?Q?yKIy1woDSorcl8I7AWbRkVTyg0ZdF3K3aRvK7dsModK9moBzOqHe88hgn5S/?=
 =?us-ascii?Q?sgRONrAcv0YYUa+87Hmgsfzxp+O1rjUz3A64+DBvOTs3tzm8oJzJA3IpOBMN?=
 =?us-ascii?Q?A0pEzJKI+kRAgPSK+0SAh6Z9b2NrKCAm5FP1RQxN5R6zFsq6j7nnZp5X02iQ?=
 =?us-ascii?Q?jAdoiJ7UzuzAO9kKUeBpEX+VLlhfu1RU1AH0Zlwp5LFivRxAhjbqLBq0o+O3?=
 =?us-ascii?Q?Jz/z21I8iX9q/W3bTHgyZ9cNVI2jIEazNcSNOXh0u7FPPOHkF3XjMLjuuM5e?=
 =?us-ascii?Q?NMBFKz5Xqx82KNblbLVz32+x06NxT2HJyzumFeuW2sahGU7zbbPtSfCfoZ5R?=
 =?us-ascii?Q?1WOHoE1tzXF1bT2LaWtRbBNbG0tBOicg5QVO4IAh84G+J+BBLDLiO0BL5fJV?=
 =?us-ascii?Q?U6OJy2YfbEVKzSQ1QvjhmcTXcZG0q+xREeaJD6VwsO50qJ4zt39pwzMRa5ry?=
 =?us-ascii?Q?zkrHKhaJvj66w2S57E15NJm2O7Nxd+hZAG+Bj59SVRRQYV2kpSRnew1/vb3H?=
 =?us-ascii?Q?v4Nv/ESegaNni3g=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(19092799006)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?pQFEfx89QdDHhSuH2j3qa3o2M6zM8pkHdcQrB0QBo/OygA6huj4CKxg+BlVX?=
 =?us-ascii?Q?s1DV8Y8YzLusX0NFJt6mOK+YXCQrfkv5Dt4XQ/O424UUaADm/jT5fhdOE+ka?=
 =?us-ascii?Q?DyKYo4AXQR4KXxkd4sEPHv84D3YeWsu36kqi/OrYmsg52TA+PqEB6kBLdaR1?=
 =?us-ascii?Q?v79BG0K2Hpfecj5d7liKJEV/bF+EiQXqp16QYINcYo4+C51xtHGBg1m9osdu?=
 =?us-ascii?Q?ns4Ay/a32NWukkL2eKf18zz+mLW9OniVxpClE+6RUZMtOnNxG0ghZAs4Xf40?=
 =?us-ascii?Q?T2Aj2l0JKJe90/GBx3J31V0XFFdJizyOTEBrAvl59RdadO8q19QFSFtCRmE3?=
 =?us-ascii?Q?Q8mlfkvVuE8RD8MtGrs1npqgN3Jcbah7IAj/Is875h8gLvf9aJ/N7Qv5lfOU?=
 =?us-ascii?Q?STmrHAN9M/ndrRfj9VEKTyixhIZrCm68hoa20rOeehPKTFr6TkZGKhnEXr8h?=
 =?us-ascii?Q?Z6YN61mSBwAlcmKDPsg2TpwtPCmy+l6QmLFdSMGd3PwngZxScSHTPSg8Zo0Q?=
 =?us-ascii?Q?35h/OPPhsgHEIBzrnPHQi2PYPq9844gaVqScEQFsrYs93EFHORXPv9DcgMRR?=
 =?us-ascii?Q?laHNaehx6IxzKBvF20vp+/ZYy/zQrruCu1QSxPf2di1RX/0F6Zzk2voCYG30?=
 =?us-ascii?Q?458kWrWtypUN+7AYE8VFZD7pZZeB3D6mnpcOIs5sSBY3DuVdbQQ6hNYUAr9W?=
 =?us-ascii?Q?9scHWboPZ8HCS86tXHUFDSGoyN+dwra00R+EDcjr82LRZ6l9o7bvW+VWkLRR?=
 =?us-ascii?Q?2jXGrHzzvzRf0ovvJgXE7wImZsr7o7koqJZ9YQvuGWzzBM8wxyCkY15ZgqaP?=
 =?us-ascii?Q?2b+kRAHAMOosACySqB26cuxN2ad0NFwFlk/qzCg/BPxB7BDiNax2y8vywpX1?=
 =?us-ascii?Q?b0d7pbURJudocK4vBWQl1BYSkD9NZjNCUG1DQ1wie1vzjHIIa8f7yMwCbG3y?=
 =?us-ascii?Q?OKX5HiTvf13DF5wzSvheLYviHanQa4c2Ua8s0qc1XcOQq6ATTtWtlzDvyN5H?=
 =?us-ascii?Q?n8h1VkF6W0QmqSJJ/i5ydk738YWLYmF4dRAJIXiz6KuDaRo/WNA1lz7yThcb?=
 =?us-ascii?Q?PR7q+LfsoaB3+l1a5TYiK6wt3tXvyWEpYpETiGA3c+kpfcq+0XMgQ8a2/Vy9?=
 =?us-ascii?Q?MfIGidjOpkbkvhzUQ14gcj7chdCfH6O/qh8Bp9ciYFA5cc+G+FRqaltLWKrV?=
 =?us-ascii?Q?1EC1rslfhbfMDfTPVBPNK19SOiPcE3uxunQVRJcBKHUZkCd6UIOne93PGWlO?=
 =?us-ascii?Q?4hBj9klBHk1NrmQ3S1SKAFR+q4eDC+pqjAmXGql5UyTyjiq97f3IOxF1mo+K?=
 =?us-ascii?Q?D01Zdg+BUpF3J+YGJF1osExum3M0xB2myLvNIzYR4jVQoQr74laxSHwje41+?=
 =?us-ascii?Q?IHaNMcdkG3k9urTR8p+jsGSiUaBfbavTcvSYRmPxNeDXP+bVxingwbPz94IX?=
 =?us-ascii?Q?NIZ8yvPd2vcNSEX2PD/OPJ3KmJVLF2S/f9Nqk34VpDf9VArmaAweCvJ+US07?=
 =?us-ascii?Q?kqvvf8N7+M4L2k+OpBlzbz+JfXrc8ZjhmRts3LSxJjN9WAgwQ0309bsP4q+C?=
 =?us-ascii?Q?KS5OzJRgUz0EP7EdoJs=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e829cca-f5b9-47d7-e57e-08ddbdc2ca14
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jul 2025 01:57:26.7806
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0tKj0MMEOqlsRFnCwPdkQwLfujeVsuOlGgiUSuLplwM9nJsafrYrpshlAuoDrLcOUvAFrD2nxxwqiR1qfnGJxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8138

> drivers/firmware/arm_scmi/bus.c:349:33: error: 'scmi_pm_suspend'
> undeclared here (not in a function)
>=20
> > drivers/firmware/arm_scmi/bus.c:349:33: error: 'scmi_pm_suspend'
> > undeclared here (not in a function)

Seems there is a force push in the branch, I not able to find the
commit f9a301ca0e82d0bb923cddde667c4a035b8a23e9

Latest branch, per my test, not able to reproduce the issue.

Thanks,
Peng

>=20
> I downloaded toolchain from [1] and export CROSS_COMPILE=3Di386-
> linux-
>=20
> But not able to reproduce this issue:
>   CC      drivers/firmware/arm_scmi/bus.o
>   CC      drivers/firmware/arm_scmi/driver.o
>   CC      drivers/firmware/arm_scmi/notify.o
>   CC      drivers/firmware/arm_scmi/quirks.o
>=20
> Sudeep, Cristian,
>=20
> Do you know what could be the issue here?
>=20
> Thanks,
> Peng
>=20
> [1]
> https://www.kernel.org/pub/tools/crosstool/files/bin/x86_64/12.2.0/

