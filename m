Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2067.outbound.protection.outlook.com [40.107.113.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ADA146441
	for <oe-kbuild-all@lists.linux.dev>; Sun,  9 Jun 2024 20:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.113.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717964650; cv=fail; b=oVxUsBc+B/Cl7wh96/zNF1q3pUin/vJD3TuCtffSgxmZDSqj+sPxVosqzKowtl9Od7u8rJWg0NGQ/HkdYvDvlbyu4WbQnFFpvxvtJcguEokgLwhvSEM3ZFIKhLDJnxSMmqQg72RvyWvsTmgGBHVHzcN6vcOQ8EQk0lGyumi8WEY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717964650; c=relaxed/simple;
	bh=au1JRlr1BzU/WrPBITzRGrKuRxktilAQ4WySgHa/LPE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=SpldF/29TUexv4f4GpcrtYQKEtt6MzwFGK1Jj0E3t60/Y9jGTCsvGhi4IsOAsTkc53/jgL9canhE1/680sy6bs0JlR+bSQm5yjo39a85mj9bJ7KgJwYchhQG2Osxbsy7/G/S9dWL5L64QtZD9+A8riYO0zSX6n5LNyrsQTcbr3I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=gXRR5+Do; arc=fail smtp.client-ip=40.107.113.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="gXRR5+Do"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e2jTm4ex4aNbLdnWWRs4oyDtNfsfJx1ZbztKpelqaZcWVQd6ImYxtv+GKxSSJx5a2mPA6LwyTi1zHzNzZccC3XhcL7+wPM+Zx7PbnISSllvXPi25bTNnXT83HTWMWDL+p60Bx7bsuvpguRd11kQiEEvVA5DVex4OFv9hV9oGgiPAWrE3Z6/J53f4OAAp500HGZeiF0GziiLmxIC3oyyBxRGZLXCNhj1W0ccC8EdwUFXCRY3qKeNI6kh8Igqc+8leVOZRt88nqxNsGqz4YnXqdBIHHC+3Z0xrsA+eem2+mKtx5tsldfWo+jG7V68KR5jDKhUMS59EGW8fO0S7FYn9Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AoDQgCTSAVEASDt0ZMeggSmwxQ1wufqthMTssk1Dft8=;
 b=mdte5LNh0wJGCKz6iR76jgZwXFxzNjLxGRRYtEDSlURQuyKC8UNZNTN2py+WUaj12+yZKuJAgCOhGtEPuCcuDc/G+qme22ni5na74DZ4jvYQD4WVHE+t7Dh27YzI/LDPvG+eTfyypR/7v5Za8aFdlEql9991Lcok14QN1ir4//X5zhRQH5XDbfV/2b2UHOgAgi1nXmvkVkxUYP0Fz4RCueDpTcvS/RhKKKTvhs0tLgGc0zoTtzrDfcfFPKfU4X6BrtrwGUgrcY5SQ6V6eFVeOFXJBEZMZtI/35jV+Pny/oLfJGFIUNDNl+mFa6V/Zj0Tm7udKiFVzB7pCvvajFW0HA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AoDQgCTSAVEASDt0ZMeggSmwxQ1wufqthMTssk1Dft8=;
 b=gXRR5+Do+curaXcUvu9LeRt+6fpDupKRPb283KvKWsZeW6hFvdgpsZFOzpVUyoDyChDWlPCPf4Xx5/fbHke734mUOBHa5vut7vDrRAQcS5RodZSI9CFMDbonwHh+uxHs5ODv5FMyWYIuEOL8wHLsTKIlfp/kAZq4JrtFuVt86ho=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS0PR01MB6177.jpnprd01.prod.outlook.com (2603:1096:604:cc::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Sun, 9 Jun
 2024 20:24:03 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%5]) with mapi id 15.20.7633.036; Sun, 9 Jun 2024
 20:23:59 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: kernel test robot <lkp@intel.com>, Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert@linux-m68k.org>, Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>
CC: "oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>
Subject: RE: [PATCH RFC v2 4/4] arm64: dts: renesas: rz-smarc: Replace fixed
 regulator for USB VBUS
Thread-Topic: [PATCH RFC v2 4/4] arm64: dts: renesas: rz-smarc: Replace fixed
 regulator for USB VBUS
Thread-Index: AQHauM8vIES0UcKgMEaDXoVUMvCUWbG/ckYAgABwQwA=
Date: Sun, 9 Jun 2024 20:23:59 +0000
Message-ID:
 <TY3PR01MB113469C4D391530BE1B9D198086C52@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20240607113745.73934-5-biju.das.jz@bp.renesas.com>
 <202406092141.skQ4slrb-lkp@intel.com>
In-Reply-To: <202406092141.skQ4slrb-lkp@intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS0PR01MB6177:EE_
x-ms-office365-filtering-correlation-id: 9942ac63-5b54-4c90-dc90-08dc88c2183a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|366007|1800799015|376005|38070700009;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?9O/aQqmdRJj4+NM5Aru03iR2XzMDRL0w6X5BeZuB0PEt5t49YoMSZHDkCMAH?=
 =?us-ascii?Q?0vpHMcnjZQYrVZomagfAiH9z6GZoAC90+DjdwCdvpNl2ErSBssQXZrZYxI4D?=
 =?us-ascii?Q?Jhf9zBr3yji9W4jFrHSIlj/npJJSd/061iguQH4g1aip5TqVPZU3NYS97lO9?=
 =?us-ascii?Q?NlEtmdXjnIyvN9YmDwhHal3gcC6R9wKf9d+niVxr8ojwL71CDYVbhkOnELPG?=
 =?us-ascii?Q?Ws1KYV7CoX6ZdfJl9MFYhg5zrvKYGM4auBTx1OdPg5xRs72txNH6KNAvy3W5?=
 =?us-ascii?Q?Nl/lTANg2PLZpHM83oqczPaE6wJUELZmA6lwghVV7dOjpXcNJJ5dDzio/xBA?=
 =?us-ascii?Q?y/rW3QGBhg5iCdmxccpCZ7MobXyRXfEQ4sml7xjDOm63dFRZyBnIMLHZ9ZWX?=
 =?us-ascii?Q?CX/DcgWaC7AhxNI7J0Qa6jJfAMJnROdc98Z6GN9NR3SYy8ydUHEQRR5Zvdu+?=
 =?us-ascii?Q?qnuihxYpXrDoA6ie/hF+S6yY/UNlF4l61s90KanPnNOPJhBeRRtdYKEKx2VT?=
 =?us-ascii?Q?aYWnvjH+vuyLuOykRfm9lO70Jw1ePU6GUf9evd9VIRUDHShpdMCnK15OUSgt?=
 =?us-ascii?Q?O1rvyA3nuU7Iu0D6WVYAgJBa78Tol6Qicsc2/wvYgJW03rgzVsYoj12RfRxv?=
 =?us-ascii?Q?aNS4dHZosYR2E3KGySsBJCdMCToez5B/H3S5ulPDtTlANmP/PuvYQ7ZvzKdU?=
 =?us-ascii?Q?YO1NMXt3EOmHqglxwxmEflM82YliVtvY5Ie9Tumuet30KsVA2/k2U2IXx8T9?=
 =?us-ascii?Q?Uo4IwJQjDzYzzmqvRMRsN9VuDJ+MsbqeHTOuEUs9wgHIpOs87SfyxoR594Ev?=
 =?us-ascii?Q?RMqEtHcwY0iViuyMg5wPL2PFLK6ZlmSpmWYysQ27L6/s6cPh5UrCEc4s87e0?=
 =?us-ascii?Q?R/vnhmgVlbgdH8P0mvcmNKd3jKK+XqETzTxfhB9IhrmkI+3EsivzWJvRkish?=
 =?us-ascii?Q?Szkax0db8EijCuzEGZMYTa0w8u6dm5YBr3deOpWzt8LiN3FZSEZcHhmoSWqY?=
 =?us-ascii?Q?ukXUlQTbtVhzFLIICuSyjpWhzn9Uh+TF56FGXGS2dc8yZgkmy9DIJBVbWsiC?=
 =?us-ascii?Q?jtujV7wJAO7rXT3Bvm9fbQ2IflovAcfwzgSxE0gKrEUwi6UIGN2lMOl2SIa1?=
 =?us-ascii?Q?D4tPc+WJdufvXrnQaQOi1nU9uF5ZK1xZlAon+RsZvi9yxnCdOyC29b7xwqWS?=
 =?us-ascii?Q?y7FXySJBvlXGGLABTGt9hwhu7bYSvnABXynzWes/RTk19h5FuU1W6F9e4S5J?=
 =?us-ascii?Q?+G9H30LLSoAiESNu+q2JVnFMFgRvTrgUw6U8eadbQHAxdzGsPRHl1Kf1mVHZ?=
 =?us-ascii?Q?ZHQyO5OKurUpmVT2a2zeGa10?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?k48fe2yamanEtJp/7gjdhEiPHnXDz9as01drpliW4s7R5L//n9mLGe50QAzg?=
 =?us-ascii?Q?BCSXi0qxi7i3XJ5j+O68pW5cgftz9q9quR1tmQggsTvu+Hqt4obKH6Epci2Q?=
 =?us-ascii?Q?nkGoRHHf0iipirVEDCj+qsd/JDksJBuB3Hz4J2VmQgrYuSYkXcqRPnvYVK6z?=
 =?us-ascii?Q?z8rwCzDgRTGNPBWmsaH5dyt7H4G965UBLChwEUXjV4hFVS5jk/s3HINc+Qyo?=
 =?us-ascii?Q?rl6qXXRkWSGJ1JLj+RMeEaHRZADGjI3I6qFZ2+0M+KjNSDkQ4OUww6OmJv17?=
 =?us-ascii?Q?rSB09xMwakay76bMeC+vRbYsA4fvMSBaPbrT+4qqYx0sPdzzOd3IKmdiWj3B?=
 =?us-ascii?Q?Smnkduqiop0ckS+8mGO3MJ73EQ8U34+MHngm7ieJ1Ezg3DJDWIp3o6dTRdJT?=
 =?us-ascii?Q?U5dW2aDVAO3V4+gVCsNKN2/4aB3kb/ecv+2BIGU1lkJp7v83piKuH+wWNW9a?=
 =?us-ascii?Q?FDRTLo6uvpuPv01m4IjqRa2MSahD5Ez5DTgEd4NW0eU4R01vucSgC7ynSWOL?=
 =?us-ascii?Q?b2BVb2n2Ocq7SDvWUU1MI6tM+8Dx9EgWkgsRPcmZQeF5DuPbn4S2oKsMYBGG?=
 =?us-ascii?Q?dSZm5loElZXcVKR78XnJCIyYDu0sVdMJk/eZ5AtHRoL7Fu982NMJou9BjGy+?=
 =?us-ascii?Q?xMeRxr+QCSvN3AWHPAVoioGPWJtdsbhYAQyXLpli5IJ+qzIY8gsu4of0jK6y?=
 =?us-ascii?Q?gvDczY+2PmMXguITgsIRamfXq+GdPftt37MMXWdshSb7UOBQ0e2jrbXOUWKE?=
 =?us-ascii?Q?OkFhn7GEYqDdY0MYEa0RCOjs9nOp3YwUlLWN4g3IaBnZyw3/PAeEWRQmhPkN?=
 =?us-ascii?Q?eaIRYDaTnbFKIVYhRpqZ9qSwB41zNwsZrPeI9uCYIddIVmFiLzAXNF0M13C9?=
 =?us-ascii?Q?qBPzu+doxhVj80dW2Tx8kUzxMKrBMcaa0pGJ9pWuOPsTuGCws0CkvEv73vEQ?=
 =?us-ascii?Q?dVt01GzCy8qqZKdhtH8In3ZcVRqXbxSb5+1RAqCHU/w64iqLE8WWjY2MSX3T?=
 =?us-ascii?Q?gb+ykWpzj1bOUUYSn2As6gd/4za7MBJGSiCvWBGpuflqbGCGk6h4OOv0e4QX?=
 =?us-ascii?Q?aio6MaocM/zDQxuvFCXwLPAZyLDnvZRUHgVD92UlXA6DzTFOovttCwElGf/8?=
 =?us-ascii?Q?B4mCmBUjo5CHuxG39s5+GVWtvIwGHARftiO1XxuINCBUeMHKvM6KsL0ul9cC?=
 =?us-ascii?Q?0xW1IF84XHYxTlmywcElg6zFBcPE6ppcM4FCdyBGS0Qy/2sav9CBH+OncWyn?=
 =?us-ascii?Q?Y3YZSyEg+pF1+OSCIxyjKbAGlouv3K3+ypsmpvTNCsgLz487bvBAII/y9JTm?=
 =?us-ascii?Q?PiUcr30U8nPi0A1U5bKtsTTf92ddhmxq7TYB5Z3C+Q+zbDAtcrMZYDsPpH2v?=
 =?us-ascii?Q?5Q0rXAsHK7+nvE9ctSsDmt98UqxSV4pQrj7o4ZnAwgZwppsOqxb1B2CIgx0/?=
 =?us-ascii?Q?R0CzdiY336YBE1pGrRKe+4lygFCVaTL0DG47M3sNGl+6K/HAYAtdUQJuo0fo?=
 =?us-ascii?Q?bnn3XbRFfO4zPjpf1xzjlS4w5DJawF3avmVt9N8wZfqXvevBj37gT5DojpnS?=
 =?us-ascii?Q?kNXQUnTylnSgDq0zk5SDFC3qAJWSU0oviAB8OpbchO798rAkfdTHda3oGyyU?=
 =?us-ascii?Q?Nw=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 9942ac63-5b54-4c90-dc90-08dc88c2183a
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jun 2024 20:23:59.0811
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5UNoGen/EKSc1VHH7cSmr0NDozCx9a3XbaBRVumywa++lTaf2IEThuveLYO0qkBtue2NwkGtObPjMpvM3IeGYol8Z9y+Deh9WkqE7wTEKos=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB6177

Hi All,

I missed to add regulator object in renesas,rzg2l-usbphy-ctrl.yaml.
which corresponds to the child node "regulator-vbus".

+	vbus_usb0: regulator-vbus {
+		regulator-name =3D "vbus";
+		regulator-min-microvolt =3D <0>;
+		regulator-max-microvolt =3D <3300000>;
+	}

The corresponding regulator driver change will be

-	config.of_node =3D dev->of_node;
+	config.of_node =3D of_get_child_by_name(dev->parent->of_node, "regulator-=
vbus");

I will fix this in next version.

Cheers
Biju

> -----Original Message-----
> From: kernel test robot <lkp@intel.com>
> Sent: Sunday, June 9, 2024 2:36 PM
> To: Biju Das <biju.das.jz@bp.renesas.com>
> Cc: oe-kbuild-all@lists.linux.dev
> Subject: Re: [PATCH RFC v2 4/4] arm64: dts: renesas: rz-smarc: Replace fi=
xed regulator for USB VBUS
>=20
> Hi Biju,
>=20
> [This is a private test report for your RFC patch.] kernel test robot not=
iced the following build
> warnings:
>=20
> [auto build test WARNING on broonie-regulator/for-next] [also build test =
WARNING on geert-renesas-
> devel/next linus/master v6.10-rc2 next-20240607] [If your patch is applie=
d to the wrong git tree,
> kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in ht=
tps://git-
> scm.com/docs/git-format-patch#_base_tree_information]
>=20
> url:    https://github.com/intel-lab-lkp/linux/commits/Biju-Das/reset-ren=
esas-Instantiate-USB-VBUS-
> regulator-device/20240607-234023
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator=
.git for-next
> patch link:    https://lore.kernel.org/r/20240607113745.73934-5-biju.das.=
jz%40bp.renesas.com
> patch subject: [PATCH RFC v2 4/4] arm64: dts: renesas: rz-smarc: Replace =
fixed regulator for USB
> VBUS
> compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project
> d7d2d4f53fc79b4b58e8d8d08151b577c3699d4a)
> dtschema version: 2024.6.dev1+g833054f
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-
> ci/archive/20240609/202406092141.skQ4slrb-lkp@intel.com/reproduce)
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of the same
> patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes:
> | https://lore.kernel.org/oe-kbuild-all/202406092141.skQ4slrb-lkp@intel.
> | com/
>=20
> dtcheck warnings: (new ones prefixed by >>)
>    	'renesas,rcar-gen2-sdhi' was expected
>    	'renesas,rcar-gen4-sdhi' was expected
>    	'renesas,rzg2l-sdhi' was expected
>    	from schema $id: http://devicetree.org/schemas/mmc/renesas,sdhi.yaml#
>    arch/arm64/boot/dts/renesas/r9a07g043u11-smarc.dtb: mmc@11c10000: cloc=
ks: [[2, 1, 29], [2, 1,
> 31], [2, 1, 30], [2, 1, 32]] is too long
>    	from schema $id: http://devicetree.org/schemas/mmc/renesas,sdhi.yaml#
>    arch/arm64/boot/dts/renesas/r9a07g043u11-smarc.dtb: mmc@11c10000: cloc=
k-names: ['core', 'clkh',
> 'cd', 'aclk'] is too long
>    	from schema $id: http://devicetree.org/schemas/mmc/renesas,sdhi.yaml#
>    arch/arm64/boot/dts/renesas/r9a07g043u11-smarc.dtb: mmc@11c10000: Unev=
aluated properties are not
> allowed ('compatible' was unexpected)
>    	from schema $id: http://devicetree.org/schemas/mmc/renesas,sdhi.yaml#
> >> arch/arm64/boot/dts/renesas/r9a07g043u11-smarc.dtb: usbphy-ctrl@11c400=
00: 'usb-vbus-regulator'
> does not match any of the regexes: 'pinctrl-[0-9]+'
>    	from schema $id: http://devicetree.org/schemas/reset/renesas,rzg2l-us=
bphy-ctrl.yaml#
> --
>    	'renesas,rcar-gen2-sdhi' was expected
>    	'renesas,rcar-gen4-sdhi' was expected
>    	'renesas,rzg2l-sdhi' was expected
>    	from schema $id: http://devicetree.org/schemas/mmc/renesas,sdhi.yaml#
>    arch/arm64/boot/dts/renesas/r9a07g054l2-smarc.dtb: mmc@11c10000: clock=
s: [[4, 1, 36], [4, 1,
> 38], [4, 1, 37], [4, 1, 39]] is too long
>    	from schema $id: http://devicetree.org/schemas/mmc/renesas,sdhi.yaml#
>    arch/arm64/boot/dts/renesas/r9a07g054l2-smarc.dtb: mmc@11c10000: clock=
-names: ['core', 'clkh',
> 'cd', 'aclk'] is too long
>    	from schema $id: http://devicetree.org/schemas/mmc/renesas,sdhi.yaml#
>    arch/arm64/boot/dts/renesas/r9a07g054l2-smarc.dtb: mmc@11c10000: Uneva=
luated properties are not
> allowed ('compatible' was unexpected)
>    	from schema $id: http://devicetree.org/schemas/mmc/renesas,sdhi.yaml#
> >> arch/arm64/boot/dts/renesas/r9a07g054l2-smarc.dtb: usbphy-ctrl@11c4000=
0: 'usb-vbus-regulator'
> does not match any of the regexes: 'pinctrl-[0-9]+'
>    	from schema $id: http://devicetree.org/schemas/reset/renesas,rzg2l-us=
bphy-ctrl.yaml#
> --
>    	'renesas,rcar-gen2-sdhi' was expected
>    	'renesas,rcar-gen4-sdhi' was expected
>    	'renesas,rzg2l-sdhi' was expected
>    	from schema $id: http://devicetree.org/schemas/mmc/renesas,sdhi.yaml#
>    arch/arm64/boot/dts/renesas/r9a07g044c2-smarc.dtb: mmc@11c10000: clock=
s: [[4, 1, 36], [4, 1,
> 38], [4, 1, 37], [4, 1, 39]] is too long
>    	from schema $id: http://devicetree.org/schemas/mmc/renesas,sdhi.yaml#
>    arch/arm64/boot/dts/renesas/r9a07g044c2-smarc.dtb: mmc@11c10000: clock=
-names: ['core', 'clkh',
> 'cd', 'aclk'] is too long
>    	from schema $id: http://devicetree.org/schemas/mmc/renesas,sdhi.yaml#
>    arch/arm64/boot/dts/renesas/r9a07g044c2-smarc.dtb: mmc@11c10000: Uneva=
luated properties are not
> allowed ('compatible' was unexpected)
>    	from schema $id: http://devicetree.org/schemas/mmc/renesas,sdhi.yaml#
> >> arch/arm64/boot/dts/renesas/r9a07g044c2-smarc.dtb: usbphy-ctrl@11c4000=
0: 'usb-vbus-regulator'
> does not match any of the regexes: 'pinctrl-[0-9]+'
>    	from schema $id: http://devicetree.org/schemas/reset/renesas,rzg2l-us=
bphy-ctrl.yaml#
> --
>    	'renesas,rcar-gen2-sdhi' was expected
>    	'renesas,rcar-gen4-sdhi' was expected
>    	'renesas,rzg2l-sdhi' was expected
>    	from schema $id: http://devicetree.org/schemas/mmc/renesas,sdhi.yaml#
>    arch/arm64/boot/dts/renesas/r9a07g044l2-smarc.dtb: mmc@11c10000: clock=
s: [[4, 1, 36], [4, 1,
> 38], [4, 1, 37], [4, 1, 39]] is too long
>    	from schema $id: http://devicetree.org/schemas/mmc/renesas,sdhi.yaml#
>    arch/arm64/boot/dts/renesas/r9a07g044l2-smarc.dtb: mmc@11c10000: clock=
-names: ['core', 'clkh',
> 'cd', 'aclk'] is too long
>    	from schema $id: http://devicetree.org/schemas/mmc/renesas,sdhi.yaml#
>    arch/arm64/boot/dts/renesas/r9a07g044l2-smarc.dtb: mmc@11c10000: Uneva=
luated properties are not
> allowed ('compatible' was unexpected)
>    	from schema $id: http://devicetree.org/schemas/mmc/renesas,sdhi.yaml#
> >> arch/arm64/boot/dts/renesas/r9a07g044l2-smarc.dtb: usbphy-ctrl@11c4000=
0: 'usb-vbus-regulator'
> does not match any of the regexes: 'pinctrl-[0-9]+'
>    	from schema $id: http://devicetree.org/schemas/reset/renesas,rzg2l-us=
bphy-ctrl.yaml#
>=20
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
