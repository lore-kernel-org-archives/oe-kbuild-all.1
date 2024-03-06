Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2130.outbound.protection.partner.outlook.cn [139.219.146.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA689ECF
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Mar 2024 02:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.130
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709691995; cv=fail; b=AKOj9sA/aS7MYGpMCDi+IZ1IWEqCqonda9PkM4xzIwk5BY6jBvmbpu5XWKCinHKoKy+K0tag+T4UFyfHZJSCSuuHUR/jj5zuNnmQrdGD/dQNojpaFmS9p1fidrk5kOHpPhUyCRfbpAVICzb/hojYf9uQZfWCvqkuLaytnHW9qOQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709691995; c=relaxed/simple;
	bh=BLW1+lf4tZ82Jt4ICvIASfoAHdyH/ydc9SEJObgwSEo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Y9FTntLYcrKqjOg+m491K0UNsirWao3tFFEU8tHdUcAUG92prTyDAe5cuXah6TNw7rITwN239CcmUliYxST0fbzOFZEhhgefs0Krxi9PI2ChE5zznQ38b7FyqzML11XP+xD61ZYoqcAErzh50ymheFW9UwDta2/u+8pvwZ54m1k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mOTPh+M8ul9rqrK01JwDo2Nq55buTs/em2OHZIebkTtGfLE6i+4+Trk/cxzdo+GTQD2VvXTLs76GQX7vTJ1kAvf+hh5bHrq67h38w/19DwLyWEX02JPbReTGhhfZaQA+32zniHbLHSwEiqEY93BvFAtWPTwpcZ1bj3K+4GEAu17ETJz0BHoWNVHdjAWAN0BwYwHKKUYF4bMl6PxeUBELgjSHcwOYybySwpScG235XBhcbABMHtZ4AHWIOCyiTfNiYeQVU+/kgGJj05Z4QrKujM3+5YYwnD/2P0X9ASCuAg/UlQiwaF51vY/t3m8xp4XpBqxzW1BdEfINZ8ejFjp2Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eF8trLLrlOeQA4d8I6MZhN4U/AHb7Vuosj8WUZzu4Ic=;
 b=c3PzMCSjpw5gRCRtelLtV3v9EFpl0hI6+2MSqr5G45FtGs4umQIYqAtKPJKTnuLL2dNzV/niTuC4AF/nt+NS+X+P0voQ2nCP07jku2+NEdkgycI24nX6kwjt2TxcoYOlG5j8XwhKvUq+NmXBlaBwF3ibyOwmZg7tZJWmQkXZIzjkB8jEpvoq1wE/nNgq51Tgo5kiyLoUYQKLxJKgyg9pk5MCe/Nx42vNC3/4GBYn7qA8m+i/hA31I2+VH4hEbGrXqi9tTT2HPknpGjKAwuwbaSnwgb6KnE9s3EJYbyw3onAssRdARWpvEmT7wO+ebCttytGCeM7gU3UHJ4LRAjCrPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ0PR01MB1160.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:19::6) by ZQ0PR01MB1317.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:1a::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.51; Wed, 6 Mar
 2024 01:52:39 +0000
Received: from ZQ0PR01MB1160.CHNPR01.prod.partner.outlook.cn
 ([fe80::6ccd:2e8:e25b:bb17]) by ZQ0PR01MB1160.CHNPR01.prod.partner.outlook.cn
 ([fe80::6ccd:2e8:e25b:bb17%4]) with mapi id 15.20.7316.050; Wed, 6 Mar 2024
 01:52:39 +0000
From: JiSheng Teoh <jisheng.teoh@starfivetech.com>
To: Will Deacon <will@kernel.org>, kernel test robot <lkp@intel.com>
CC: "oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>
Subject: RE: [arm-perf:for-next/perf 34/37]
 drivers/perf/starfive_starlink_pmu.c:169:17: error: implicit declaration of
 function 'writeq'; did you mean 'writel'?
Thread-Topic: [arm-perf:for-next/perf 34/37]
 drivers/perf/starfive_starlink_pmu.c:169:17: error: implicit declaration of
 function 'writeq'; did you mean 'writel'?
Thread-Index: AQHabr5q7S3V2XswxEu5OJA/HTcN4bEo5DMAgAEPlZA=
Date: Wed, 6 Mar 2024 01:52:39 +0000
Message-ID:
 <ZQ0PR01MB1160CF9ED00F8380CFD722E5EB21A@ZQ0PR01MB1160.CHNPR01.prod.partner.outlook.cn>
References: <202403051305.36cANAVm-lkp@intel.com>
 <20240305093813.GA21932@willie-the-truck>
In-Reply-To: <20240305093813.GA21932@willie-the-truck>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ0PR01MB1160:EE_|ZQ0PR01MB1317:EE_
x-ms-office365-filtering-correlation-id: ce0d6fe5-636f-45f8-2805-08dc3d801aba
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 YQRFNf9TmYpyBIj/RxpSB/6wP52XKG9+ZvZn1tTvbUdif88aZIcpPHnKHralqpRRdkgBRwyDoYT3D5rQiwc9UBKG+2+8dKS8WKxy9w3v1gv3NUt/tBJXpe8U/2a9NDcwZKHztHDiGkyqJ9zJE9TuxaOStTz7+msm9/7wj9OMFxEwhTXXFUF3WmcuPi+4kc74zzDcxv8vn7garAm05sTejDKy/1IKzHmaVs+mD69+gUHPjgWcTdjFTgfqrAs5x+pvcmDTBuv9wn8x7YYYbPP2Trx8Zt1nLdlL0l4jVZD8ZSLiLUigHXLAkCkayDYSzj/3Yq51fQLZ8JGNunnMzukgdPyjtiHPnonB+Fjve3ivLJPVPHu36JYcg2Vc+qfEmlTOWgm795l8gVvaHSbb9EIDE+87k1FHlHLQZ3L4WQ41gqZGv2YXsl5eLX1o27U4+UM+fmKc2RJW0jqB68gyBLrydZTcz7Ilrxe1TL8439AVy3eqn6278zAl+OQsoVX+Oyy1/nQfVD0Hjq1F+Hm7SApzOmJJ65GBm9M2vaoCyMMZS3nmVqXRwbLJ25qns2agEePRzR+BJ3i4MBEK60DJrVH7nB9APFI9EMijeY2AFWZ5rer6bE3EPEY217ILV8Omn+2B
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ0PR01MB1160.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230031)(41320700004)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?B5xgAlwlwoKm+/AghkAe/1Xs45gZ/jq0kOb0iw6XEhXrio7SdTyMmJXIYn2j?=
 =?us-ascii?Q?Fv7Z21stnngMp3RGPR5Y5KIwoMWBYb/w2RGgOAdqE35NIsGeEkDvC9Bo9ad4?=
 =?us-ascii?Q?ExnvOImvET5AHXYGC5sQqqKurq+LC/lM2qCpiHfSUF5WuzuBfPpI6TFjlXPC?=
 =?us-ascii?Q?DMlb+yjq3rgL7NKDQrq3nLBssEh65+Rj99g3nCwpWCejItqKh1Z5EyBn+bpi?=
 =?us-ascii?Q?f84syU9czw42eeJblccPLOMVoZn8e9+oVOPRnL/kxrkxpdTaeGXrZ8NUoSI3?=
 =?us-ascii?Q?+uc/iych60VZisMkUv9mhAiLKRPZUDKfk9Pg3Gigjx1zRe2odUhgb4zHS1eX?=
 =?us-ascii?Q?F1yh75SYl+XH+EVmOTNlIDzVA73HRZjLEtg6iWxAmDC90xxT41eNGwmHMIog?=
 =?us-ascii?Q?b+BzEzvQBI24JnXWcBgDdW819hGNRCNGlK/unqBIN21u5v+aYp9lDMm50KUf?=
 =?us-ascii?Q?59bA0cMTQ9756YdT1STLqxgUaxOGYGxjOuoVP9V1hCs6MO5O+ufU/7CoMkcn?=
 =?us-ascii?Q?iybB9txZDZkLhJvfBQrHfDRP9/3xBeGe3wG8ZHw+KOuYUrwTbLa1ySsrXFPy?=
 =?us-ascii?Q?J0JoFgo2Fg50WYwt/riY8+A02xYvqb3ijaL7a/9LPykcbUWP4bB35T2DGHUx?=
 =?us-ascii?Q?A5QuOOq/PEwh2vQwoOT8E1xnjg0UNIdLs35UHQWBc5pdqTEhZMs/cNm1qzi3?=
 =?us-ascii?Q?nopIOb8idZJ/4/6yVWwrrPiaF4VmIIgWkJMl+qAieMsc/3o681uKPIxugmtp?=
 =?us-ascii?Q?UYcJqXO0gY3st57ELq+KTD+zy7LjmrdY2R2xgkKqvk5KLjg/VJ/QkkQtlSdd?=
 =?us-ascii?Q?KDgBv04k5vG1/gciHko+XoqRnMraXLEuDRx6kh5ml1FQhHNU/ZZeyoI83Py5?=
 =?us-ascii?Q?6SMI8RrMJsF1PbmpqSlQF35Ebs6KX5Dmno9X8yI+mMqF+UExd15vnovJZVyl?=
 =?us-ascii?Q?4Icq5n9vQnFQd2Fad282Cu/9QZehY5u5QNKLSYsRIinG0qy/8ByEdSTKZrRq?=
 =?us-ascii?Q?B4/7M65TMS7Ww8NiqlWO8kjDO0cjDHKgfmNawe97uKjZwwYZwD9sFfdLJv67?=
 =?us-ascii?Q?3bzkjEW6mZrQsBP6QLHqQPUZCxsJVnra2Xh0QYyask13WnBZuXbBzirqO4kT?=
 =?us-ascii?Q?fl71Ykv2tVkNCRCH1jp7LKsKhzyc7zBPgkWlBl8i0xF0o3V0FZXTD8g27oT8?=
 =?us-ascii?Q?BNkj7IgW7iPY1oprvGr1CqADYzc1EVQ+ewf1I8e6UNfHj2VXwH7T2l/d+3Sz?=
 =?us-ascii?Q?BLajNpMGmc5c/axbMehBou3iuGT3kHt5K4hzX52TBZ2DsWj5tWYmwLEgZ9nq?=
 =?us-ascii?Q?eP7nuGA1mE4421ZMIgqBARxj6qCY6bae0b0aEGnwTPgJ+Mr7mD8G8a8jbRdj?=
 =?us-ascii?Q?ijOMGP3n/ONbprdjnaXLZh1lCHV7egdHAN3LDUxgICPWPoZGL6EOWXs7Uuq8?=
 =?us-ascii?Q?QdWu/ANk5oztIgt3w6L+2HGK5my12gP/vTwcZWFWuSEssINzv6K8ZGVMhIZ5?=
 =?us-ascii?Q?EcmovhuUw9iveGSQsFbD5sQu0SLhbile4yAxv/kxggH9b43LlMXQ7RPfB1yZ?=
 =?us-ascii?Q?C07ACJdx/jVE7b1+HFHfLhpSTvV2PjOLdhs6nJVKscNJjhMGw5aoBFVkjtMJ?=
 =?us-ascii?Q?zA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZQ0PR01MB1160.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: ce0d6fe5-636f-45f8-2805-08dc3d801aba
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Mar 2024 01:52:39.3256
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EtpxOXl5FDn+LHvgkAWpx3QGFFa6ed4PTLL2vNfcMY4Oby9hU4OlC15ucrlMF2ANwN2Bq8ac0Lhnc5WPos114XenEbml4Cjb+CLFVxvBzD8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ0PR01MB1317

> On Tue, Mar 05, 2024 at 01:30:59PM +0800, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git =
for-next/perf
> > head:   b9f71ab2152e5b344c02eb3ff43637162aaf29e6
> > commit: c2b24812f7bc5fbd6f2f92af070856fbe4c37b40 [34/37] perf:
> > starfive: Add StarLink PMU support
> > config: parisc-allmodconfig
> > (https://download.01.org/0day-ci/archive/20240305/202403051305.36cANAV
> > m-lkp@intel.com/config)
> > compiler: hppa-linux-gcc (GCC) 13.2.0
> > reproduce (this is a W=3D1 build):
> > (https://download.01.org/0day-ci/archive/20240305/202403051305.36cANAV
> > m-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new
> > version of the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes:
> > | https://lore.kernel.org/oe-kbuild-all/202403051305.36cANAVm-lkp@inte
> > | l.com/
> >
> > All errors (new ones prefixed by >>):
> >
> >    drivers/perf/starfive_starlink_pmu.c: In function 'starlink_pmu_set_=
event_period':
> > >> drivers/perf/starfive_starlink_pmu.c:169:17: error: implicit
> > >> declaration of function 'writeq'; did you mean 'writel'?
> > >> [-Werror=3Dimplicit-function-declaration]
> >      169 |                 writeq(val, starlink_pmu->pmu_base + STARLIN=
K_PMU_CYCLE_COUNTER);
> >          |                 ^~~~~~
> >          |                 writel
> >    drivers/perf/starfive_starlink_pmu.c: In function 'starlink_pmu_coun=
ter_start':
> > >> drivers/perf/starfive_starlink_pmu.c:191:15: error: implicit
> > >> declaration of function 'readq'; did you mean 'readl'?
> > >> [-Werror=3Dimplicit-function-declaration]
> >      191 |         val =3D readq(starlink_pmu->pmu_base + STARLINK_PMU_=
INTERRUPT_ENABLE);
> >          |               ^~~~~
> >          |               readl
> >    cc1: some warnings being treated as errors
>=20
> Thanks. I'll add an '&& 64BIT' to the COMPILE_TEST clause in Kconfig for =
this driver, which I think will squash this and also the hexagon
> problems.
>=20
Thanks Will for looking into this.

JiSheng

> Will
