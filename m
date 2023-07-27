Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2094.outbound.protection.outlook.com [40.107.114.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A080FBF2
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Jul 2023 08:34:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RlxQk+XItTZObWIZF3pyoRMTKzJDeF81YB41f3TUfezNAGwJ25F0tYRYGnHLsXFohxO1Y/nQOemFUSmrKWo4rXObhUU+9wuOdKVTJ3gNb+ys7brR5Az+FW8VT4+WTjyOGawASB1Nz2gzZ+o8cYIWEqChcOehGk6YGNa7vf0B75jsbN1FJ2WEgKN8Vk0R5llMY3gZEsbZyaPbW4QicZq8TewBtVk1puZQOtLFeX+x07dGKeR7lWBQZ6504QRpbtZIBO1D0mX8TviLJ6PeoJVfbNkgwa+NMFJRxElpzcVDrnhQNysoXARzGahdW6TTgFgZnQ6wXB1dTBmTRpJ62FjK3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BvOifXMyVPLbfa9mXzRQmvq/kQkzBSatqcFNUL+jN9k=;
 b=cy9rhLa7nTtSFtxwnRS64qtFFH29STtXvfFTpMO5bLPgWNle2AJ25cdgr5XR4s1xttxPZTqlcyJBEtjaD9hjM+JayA/amN8xFmdgBngBWMhFOhCrpSfkQ411oLi8rt+ty5offH8OjPdrNanj7ys1SVOMtnmr7vzm++jqvDBzPhjnePWTTdJc/Y97M+3AbiieeMFp/AEJg7TF3Yuf0DXd+xUGpGypa0pZZ9TSn0F4CffUqxZIwkN9j25zpmULLA/XISu5umXo1QkSmeZhbhGeMNzr4vUu/kkGNBurnQJ6R0yg05/lxBls3MegMpn7strMdt0+NOpGsc4SBkZlIGOfIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BvOifXMyVPLbfa9mXzRQmvq/kQkzBSatqcFNUL+jN9k=;
 b=CDXuXFNT3SJLhJKhm4Lz5jALLuzJOv7kTOaIJ/FAqUkw46B2wJ2vRwauCsP/oA5MBdl3bCUbYbCHyvDAojOpUi3EEYGi4rHEXsnWSejPMr9RnH7NGB00JkdENIPO8Ui5BDywa7lr6D1uWRGEcf9vpYq1At5T+iNRut2K+/2M6sk=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYVPR01MB11294.jpnprd01.prod.outlook.com (2603:1096:400:36a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Thu, 27 Jul
 2023 08:34:34 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::8f98:d64b:f092:766]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::8f98:d64b:f092:766%6]) with mapi id 15.20.6631.026; Thu, 27 Jul 2023
 08:34:34 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Julia Lawall <julia.lawall@inria.fr>
CC: Linux Memory Management List <linux-mm@kvack.org>, Stephen Boyd
	<sboyd@kernel.org>, "oe-kbuild-all@lists.linux.dev"
	<oe-kbuild-all@lists.linux.dev>
Subject: RE: [linux-next:master 2742/4710]
 drivers/clk/clk-versaclock3.c:404:2-8: WARNING: do_div() does a 64-by-32
 division, please consider using div64_ul instead. (fwd)
Thread-Topic: [linux-next:master 2742/4710]
 drivers/clk/clk-versaclock3.c:404:2-8: WARNING: do_div() does a 64-by-32
 division, please consider using div64_ul instead. (fwd)
Thread-Index: AQHZwEiu5bV74iVB8UuLI4yLfkRI3a/NSKAg
Date: Thu, 27 Jul 2023 08:34:34 +0000
Message-ID:
 <OS0PR01MB59227764417EB66A9CBDE69F8601A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <alpine.DEB.2.22.394.2307270709580.3082@hadrien>
In-Reply-To: <alpine.DEB.2.22.394.2307270709580.3082@hadrien>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYVPR01MB11294:EE_
x-ms-office365-filtering-correlation-id: 6315b250-9274-4572-cb30-08db8e7c4e48
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 C46+crJ+TKdjcaFd1shNXf9heMdkBGBerGiZrJPXXC7l+WfltuStYQRgfL/bG/GXf1tkN05YW8moaULEcewGGlIStEQESRRMkqvDCRgLk88io0RaV/obVuIwxDHmAuH8uU1Pb3G0YG36jyBLfFFYJRt4ajI7hyqsbPrRJ63UbSM/Tn3WY/qOtp1QITpmWT6bGOibshkuKlX6ubactxCZy9kkYgaYQgEh1qGYWxj6S3uDyFulutUNF+AGwRCj0uzjGNst83NJWFA5pwd6SSjDCKp2H0/v6mTBd4b2AOICCiN35wwiRgdogSDAGaVY5+bqwn5ToOpAgQ5pKpNPiegq8ozLRJD0CwESRTJk1OWy3GIRpyJIZ2M+F4frXnXV3NnIsMc5pPaLCVFmIVN3J+3ra72XaxZnhMneSf/hOVuv6wBlSwYDvqfM1HGMBaaSoCvvKOf/BNVnaE2oGcMauSzgTZUy1F+4vsaq1nY1F/0Y9n7zAO7Z7CXJt+PegQWFdLoFCU3zN19XEMoSDmpddLHg/UJCBbIix5QsjmAxVVvXMup8DBIjUl/cFgGmXRMztRN4Y2a6U3Py4y+h/P3khbpuajgoqL6RItpINBzu+3dl4Yk=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(39860400002)(376002)(346002)(396003)(136003)(451199021)(966005)(54906003)(7696005)(9686003)(478600001)(83380400001)(55016003)(86362001)(38070700005)(33656002)(6916009)(66556008)(66446008)(64756008)(2906002)(186003)(66476007)(6506007)(26005)(71200400001)(122000001)(38100700002)(5660300002)(4326008)(52536014)(316002)(41300700001)(76116006)(8936002)(66946007)(8676002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?R/WZf40F7+6EpOO7QRA4Oy3VsxGc/JA3RHFcq0o/yXWzBxLwk0WxsFDPP14C?=
 =?us-ascii?Q?pD0ITtt6SKqfXosV8giFoQXJwYYCjoGcYfCd05UJivec/yk/ZybloBwJatZB?=
 =?us-ascii?Q?z+fvB1l05GI4jNakKsBY47jQtOyycShqac+KXzqtMl3x3qWrPgdP6FiOL3L6?=
 =?us-ascii?Q?mboMJkxELwerbC3KgfTS+5KVymmPGYbN4liklgM/PYZWIYN/wI81BAOBUDFJ?=
 =?us-ascii?Q?L6geo8CR48qeObAvF3xcOyNc/QtlRR/KvqBVnWy+8YdU/i8W3iGMeKe7atIA?=
 =?us-ascii?Q?6Oi7IdxzCxSDorUmqVr0KYV/rdg+15svXHQAWrXA2fJWQr+/KnWVIkooe+5h?=
 =?us-ascii?Q?sAp1wyzQlXBWUnnueCtRm79is6O7CeIKnWHiJzS8XLtRw80k8xvT3BOotQry?=
 =?us-ascii?Q?PVZzwTkt/KREm+duXPOuGfHEGhYHlvfTLyhHE9F1m2fPIMG79g31Wmu8Fnuo?=
 =?us-ascii?Q?YhvPjDacGC7dklMO4uphfpEuptpRrAnOYAzvGD+ltHMFuGAuO3xKiie34gBX?=
 =?us-ascii?Q?UtW8lZK1qPLdS2nSBfl9YwpBm2ye2DlMoK2WdUOf/t89LpV9unU/EXRlnbzv?=
 =?us-ascii?Q?mtFun370Mwb2jEGUnlP2MKM99Qs6tqtUq9e+8qr37Uy9xtxmLVvhg8Nokvxv?=
 =?us-ascii?Q?IntCbiOxxg2tLU8Mm2pcrQuwgcTD+2GuMHMondTnILMgjkWhfK7cBPVAo+Lj?=
 =?us-ascii?Q?TshB21W/M9JBtA808yHq/gSOVvOVKXu9ZNUvX4I6l2zQTGDQr2pqnk/o9SGd?=
 =?us-ascii?Q?LWGIeMyF/Hs+7h8Fg31HOUQ+CuArEkAt4Kwm4vyG2OCqsgO+kNWZLp1Qpy/w?=
 =?us-ascii?Q?MgpDn6OHROqh6smBvLdZUXfdfIeObH+kui2e16H+MVBDxTitpkXX70vHo49r?=
 =?us-ascii?Q?BGSU6F0v45uZhjhpCwvGlEWSSLUIqHeCZez5blBXHjp12OxVQONpdNJSb+s+?=
 =?us-ascii?Q?BNWbClwbcvwLxJYIvTJB0NKZXHGlGwCirR8M7I12hbA7AIuVC6OYhJyuV848?=
 =?us-ascii?Q?Ah3OvA1toh/CFFUFDRmIPay0CIVZiNfSUknEu3auayVu23/b41UJCR5YuvZr?=
 =?us-ascii?Q?KUa1vL9i5cU4MHydAm7ijGXjihYO5jm5lnQCeImHYAR6GxSqcD7WenEzllSe?=
 =?us-ascii?Q?Y49NHmuZibH5GcMDQOHMEf1uCSQf7tSqdB05Ioy0qmfbvl0lc1nyZ3H5c8Cl?=
 =?us-ascii?Q?EFYz2W8XtBW1ciZRjhS1MR3qYqN17THbwc540bvLP2NULgnVE/kJSrIJgPiw?=
 =?us-ascii?Q?Wg+c/atI6ywxWWikS2Tb211qmhaIZR44tMMvu+NVgwus171OjbhGl8P+vpTl?=
 =?us-ascii?Q?ZObGf6WyRMHHluPtSKiR1AxAvpGHVIEtjdmML1/5Cwe1gBHeC+k1TuUowSL5?=
 =?us-ascii?Q?1HqlyzU/I/fh6M8RBC3LPjIPU1T8LatCKJKNVOSIlp6UdXdtCcMtO42+KcKc?=
 =?us-ascii?Q?dfhRr0byUNAFIWYg5jqodLrbfWIGgyQ9RG6rqtDPBRV8PvNzvNusjLa+/FX/?=
 =?us-ascii?Q?RIPR6HUk6wwrryuUauzEhF3aL/sR0ti8puklHT0smInMT4QzmuvmozdYlozC?=
 =?us-ascii?Q?wc5UMp0AH91zN6fkrLAVKbVTFOgYRQH8WhC1RmdB?=
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
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6315b250-9274-4572-cb30-08db8e7c4e48
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jul 2023 08:34:34.3131
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JldVYCoJhGfDNBYNz6w5XvvAw2/pq/nQ6vtu9J/H0AQ6PNVrivywdx9gaq+iCQQ1aYIdRiTSI8t3TlFdzf0azGLKBnLJnTGdaZAIT9NaxPo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYVPR01MB11294

Hi,

The reproduce link is not working for me.

https://download.01.org/0day-ci/archive/20230727/202307270841.yr5HxYIl-lkp@=
intel.com/reproduce

Can you please provide instruction to reproduce this issue?

Cheers,
Biju

> versaclock3.c:404:2-8: WARNING: do_div() does a 64-by-32 division,
> please consider using div64_ul instead. (fwd)
>=20
>=20
>=20
> ---------- Forwarded message ----------
> Date: Thu, 27 Jul 2023 08:50:37 +0800
> From: kernel test robot <lkp@intel.com>
> To: oe-kbuild@lists.linux.dev
> Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
> Subject: [linux-next:master 2742/4710] drivers/clk/clk-
> versaclock3.c:404:2-8:
>     WARNING: do_div() does a 64-by-32 division,
>     please consider using div64_ul instead.
>=20
> BCC: lkp@intel.com
> CC: oe-kbuild-all@lists.linux.dev
> CC: Linux Memory Management List <linux-mm@kvack.org>
> TO: Biju Das <biju.das.jz@bp.renesas.com>
> CC: Stephen Boyd <sboyd@kernel.org>
>=20
> tree:
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new
> version of the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Julia Lawall <julia.lawall@inria.fr>
> | Closes:
%2BsY49B78%3D&reserved=3D0
>=20
> cocci warnings: (new ones prefixed by >>)
> >> drivers/clk/clk-versaclock3.c:404:2-8: WARNING: do_div() does a 64-
> by-32 division, please consider using div64_ul instead.
>=20
> vim +404 drivers/clk/clk-versaclock3.c
>=20
> 6e9aff555db7b6 Biju Das 2023-07-05  382
> 6e9aff555db7b6 Biju Das 2023-07-05  383  static long
> vc3_pll_round_rate(struct clk_hw *hw, unsigned long rate,
> 6e9aff555db7b6 Biju Das 2023-07-05  384  			       unsigned
> long *parent_rate)
> 6e9aff555db7b6 Biju Das 2023-07-05  385  {
> 6e9aff555db7b6 Biju Das 2023-07-05  386  	struct vc3_hw_data *vc3 =3D
> container_of(hw, struct vc3_hw_data, hw);
> 6e9aff555db7b6 Biju Das 2023-07-05  387  	const struct vc3_pll_data *pll
> =3D vc3->data;
> 6e9aff555db7b6 Biju Das 2023-07-05  388  	u64 div_frc;
> 6e9aff555db7b6 Biju Das 2023-07-05  389
> 6e9aff555db7b6 Biju Das 2023-07-05  390  	if (rate < pll->vco_min)
> 6e9aff555db7b6 Biju Das 2023-07-05  391  		rate =3D pll->vco_min;
> 6e9aff555db7b6 Biju Das 2023-07-05  392  	if (rate > pll->vco_max)
> 6e9aff555db7b6 Biju Das 2023-07-05  393  		rate =3D pll->vco_max;
> 6e9aff555db7b6 Biju Das 2023-07-05  394
> 6e9aff555db7b6 Biju Das 2023-07-05  395  	vc3->div_int =3D rate /
> *parent_rate;
> 6e9aff555db7b6 Biju Das 2023-07-05  396
> 6e9aff555db7b6 Biju Das 2023-07-05  397  	if (pll->num =3D=3D VC3_PLL2) {
> 6e9aff555db7b6 Biju Das 2023-07-05  398  		if (vc3->div_int > 0x7ff)
> 6e9aff555db7b6 Biju Das 2023-07-05  399  			rate =3D *parent_rate
> * 0x7ff;
> 6e9aff555db7b6 Biju Das 2023-07-05  400
> 6e9aff555db7b6 Biju Das 2023-07-05  401  		/* Determine best
> fractional part, which is 16 bit wide */
> 6e9aff555db7b6 Biju Das 2023-07-05  402  		div_frc =3D rate %
> *parent_rate;
> 6e9aff555db7b6 Biju Das 2023-07-05  403  		div_frc *=3D BIT(16) - 1;
> 6e9aff555db7b6 Biju Das 2023-07-05 @404  		do_div(div_frc,
> *parent_rate);
> 6e9aff555db7b6 Biju Das 2023-07-05  405
> 6e9aff555db7b6 Biju Das 2023-07-05  406  		vc3->div_frc =3D
> (u32)div_frc;
> 6e9aff555db7b6 Biju Das 2023-07-05  407  		rate =3D (*parent_rate *
> 6e9aff555db7b6 Biju Das 2023-07-05  408  			(vc3->div_int *
> VC3_2_POW_16 + div_frc) / VC3_2_POW_16);
> 6e9aff555db7b6 Biju Das 2023-07-05  409  	} else {
> 6e9aff555db7b6 Biju Das 2023-07-05  410  		rate =3D *parent_rate *
> vc3->div_int;
> 6e9aff555db7b6 Biju Das 2023-07-05  411  	}
> 6e9aff555db7b6 Biju Das 2023-07-05  412
> 6e9aff555db7b6 Biju Das 2023-07-05  413  	return rate;
> 6e9aff555db7b6 Biju Das 2023-07-05  414  }
> 6e9aff555db7b6 Biju Das 2023-07-05  415
>=20
> --
> 0-DAY CI Kernel Test Service
