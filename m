Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02olkn2044.outbound.protection.outlook.com [40.92.44.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3825136347
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Aug 2025 18:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.44.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755195509; cv=fail; b=YaBA6GcSdVOzmoz4GmbDE/6XfikWWnD/ft0awSfVqqESZr+wf2qLuVErLBLxqUcXnP5Z8NUZaKdyAQkNEvewDD4Kd3kCv33p4pWxPpmQlhIKRRjz7h0rxv6cYDZIR1Uh9eOWM0c9WJ3G4/QaVSsFuNlZqA4A7BPfEqc6f67Yqos=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755195509; c=relaxed/simple;
	bh=eZ71jbpubARHgMbRx/xdYe3+veB0f5Kk7wCmlHILO68=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=e88fBAA2Yw0Ywq9L3P8SWj0SJNJUltdwk11g9kHjNxzQSUcdzBvgGrLc6dlZ8C4PCKi/0wZsnqq4J4NPozUCTilDw+U5AGYwnzhFPDvdnyvVv/X4NJI0JaxzSrvdFAA1Y6ozzDcEWIhgoI4TzyboVg6E7u3NlS8Tl8lt3F4KWpo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=BUkc2NhS; arc=fail smtp.client-ip=40.92.44.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="BUkc2NhS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CtiAyX9B/79Gz6kOOOoQFU1LKczwJqCHyOtHcrNE/W7ZISTSel0m9Ypb0J6iRa2ALK2dJ9I8bIOohUHoLCqus8xcGv93D2nFg8P/TnAVuK/obdkHhqkF8gHxDAvSKWuFEIsUBCzML2i+hg0c4+JayQrVnEczQhIZxAd7iK96flcZyZVq/94PxeF1kT2XLWv0dOlBVoLkeodRekdz6jaoWj5bPX5fsoEjzL/AeAz2izw51hqdfiYRs3r4Z+HJjrKsirUpLMDHMhBDcwYoEkUVBuNc8rSq+fsq5eE6F6R41j5/W+jQrNpIc8D18/O8sCxNteOlf+zmjxfavjyoN6K6wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ExSdoWXqGpI5qccYQp8EGUboZS4rTUt52bBA5PMl8cc=;
 b=zGhKt5obDl5e9g+OT8yMHVQI8+EKX3aQrBVrmzzPye+HFBkJOuPkFv+0nXOogr6egcDQNVgpn+vfgtKHY003zWDHkMz/Pb7ysKAgtkre+UgNIYLgbE9+Qvq3zPHBr/13Poyr2i9FmFIh3tweDi3koGzV/rnfMP3KTVeFmmi23xGc7SWHHNLqgcY7kWu1os2gdxA+pjxbvc7mjUe9iJkCkjh+TIh8+p7wUooE6LCk1MHEGJgi0ayBaKwQa8o30p2j/FGSUviSB7tBw7FSLLuYPC7dg3WiFET0nYYputjCX+/9FcG+mazQOoIjY8xQfbklFWxbl6TtpzxUDZTNBbgDYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ExSdoWXqGpI5qccYQp8EGUboZS4rTUt52bBA5PMl8cc=;
 b=BUkc2NhS+4/q1xUicinUsjM2+hOhi9MJ58Fj/d+txAjXH0rxVTjGQrCdXNeMkVQssLla/H5U7yci8LgL+p9O5aiHSOJ4j+bJEblEkNvgIZLblvWaS6koUpHRtByza+FqYxlZMjlbxnLE7epALvMSmuJ2GDEw7rmo46vqK6JRPs8ePYCKljpDzfjyzbXKKC/Lo/bWH1L7X4xVyIdyp0arC64iyTDt6pgosuSJTDmy07uhqJ2C0YnH/61tnnxKvdt6RNalxJrwwWFMly0nhc2/Acms83FLWb0cOGjEP9AZoWQHSmhoAeJnLhSjTAwhfwZDS9hE+4p8pteH2u07rEc5YQ==
Received: from SN6PR02MB4157.namprd02.prod.outlook.com (2603:10b6:805:33::23)
 by CH4PR02MB10755.namprd02.prod.outlook.com (2603:10b6:610:247::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.22; Thu, 14 Aug
 2025 18:18:25 +0000
Received: from SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::cedd:1e64:8f61:b9df]) by SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::cedd:1e64:8f61:b9df%4]) with mapi id 15.20.9031.014; Thu, 14 Aug 2025
 18:18:25 +0000
From: Michael Kelley <mhklinux@outlook.com>
To: Wei Liu <wei.liu@kernel.org>
CC: "oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>, Nuno Das
 Neves <nunodasneves@linux.microsoft.com>, Easwar Hariharan
	<eahariha@linux.microsoft.com>
Subject: RE: [hyperv:hyperv-next-staging 2/9]
 include/linux/compiler_types.h:572:45: error: call to
 '__compiletime_assert_494' declared with attribute error: BUILD_BUG_ON
 failed: HV_HVCALL_ARG_PAGES == 1
Thread-Topic: [hyperv:hyperv-next-staging 2/9]
 include/linux/compiler_types.h:572:45: error: call to
 '__compiletime_assert_494' declared with attribute error: BUILD_BUG_ON
 failed: HV_HVCALL_ARG_PAGES == 1
Thread-Index: AQHcDJlG8QycyjV2NEWY84t/9U1KVbRic1KQ
Date: Thu, 14 Aug 2025 18:18:25 +0000
Message-ID:
 <SN6PR02MB4157D5DE01EB0A200E2EA088D435A@SN6PR02MB4157.namprd02.prod.outlook.com>
References: <202508140537.LHGYEm9W-lkp@intel.com>
In-Reply-To: <202508140537.LHGYEm9W-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR02MB4157:EE_|CH4PR02MB10755:EE_
x-ms-office365-filtering-correlation-id: ef79d710-9942-4fd0-baf5-08dddb5ef5e0
x-ms-exchange-slblob-mailprops:
 jFQug8Ko5G/PSyMuhCYUNKyYBVjtW+4Edzgc390R0VUJoNkrhkupKwzms9IDto88+siNSlNQvQh+WUYYo7y1rX9nvny8go5pb/pYscOoRvcDOqNcjDduQ35GHu7F7WtFZh+ow5GrA+9u9tj0ZXweN2KjpOhzOTOPlV3xBNqSAE8hA9zk3AtTNLrqseR0gy6iC8dlqTjHulbeNJ5hdDgacW6Sc2tCpAiBBVzk1E9neLM+JUfT2KQMpS5IyVsiFH1y2vCIABbQI0UdIsGb9Z3OKL2mSxcEZfEyRUP573FfRetB3a/oZPxdcY+UmoAWNnaw+3wtQxOcBGxgE2t0yO2JWc++7716QKLp914c10m53/B6WKd0Qfe+s8ssYeyLvPN0a6VYXsJIBHI2vyzl7qza3nf0+gCq2hrrYcgPJGU7ayinTEVp9Sn3Rkmc+Sh0y1o1aDQJhGVkwsIlJO1JgsgA1ZsI7b0P0GNjT+fSy4d5fQuz2cVf07qzDhNvQdf7oTZupzJ6g8Lir+OtkH+VGffOQ/rcREdxUj7Dq39W04fQ6AkUYOpjoTH1UDhamiVVqia/tQortiC+O/2a8IZ/Zh843OvaT1QIOFTrua9adXU7QsKZ9D/aOQh3hKSBK8KIB/FUGTA5wnmAhww+/1tXi59oCQnw7PAmrYzF0Q7bPvE5ZY2GCluV9zYkGHF3iHmty+uodDuKzsCu7cq2MkX986oTQXoYe/NFZuBr9xmhLjbLvwTO5/p5aunC7/tRoVSJlHqQOpKIS9Fb0WzDkAMLGpTW1IhXr/dH2oGJZ4QSnTvEcYb5Xpy3421Z1Ihx8NOIORa5lh/YwfWRiO7/uGsc5NEiP9NI1XO8/GKTuB7fKVQu7i1vIU+Of8KcDHGvyWKM/PzkVss8OTkyzDVSFD2VNab7jk8zxM6iYq+Ioji8e6m+He0=
x-microsoft-antispam:
 BCL:0;ARA:14566002|15080799012|13091999003|8062599012|461199028|19110799012|8060799015|31061999003|1602099012|19061999003|4302099013|40105399003|440099028|3412199025|52005399003|10035399007|102099032;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?5AgdTj+ZMEJQ5WmT47bng3ElFGEsL3DFenNTKHZfFObiawaD+kaXEnC/qTK6?=
 =?us-ascii?Q?yY6niHZry+oZGqyVrs8vxzJlUK5hcJ0bLbWHLJdss5Th0vvUezgVub24jTfn?=
 =?us-ascii?Q?kCJQa8tgmrLcx2cOneRykAwDglDDuMVyUE3D4Kq71CfkWzoRMUezPkk3bEXB?=
 =?us-ascii?Q?utilcQ9bGiUqa7js3a3FYHKLZvN6eakRYFK0Krd22RUBwjj/kTPb59vMOvKM?=
 =?us-ascii?Q?OsDMyGrtvfY3pURkoXAruyEiBIgkq6f5UU953cxv2qRFRzlP20TY48+MTWqD?=
 =?us-ascii?Q?53p3A7lPUPFvklMX6ZkjzNmmxEVUFewhrrDn3Ab8On7QQt8/qqw+Cb7l2dQ3?=
 =?us-ascii?Q?wGl8goC82jDmfCdxTuWklSrGlBE7n0ilV5vBSQxmMmTFqKAtX7BeHw6XPcbr?=
 =?us-ascii?Q?zns9arzqZoOo4sbBwf7rdOFmFgSncaQ/xcLMx0yS6c/+Ty5XmPMJuuDU657t?=
 =?us-ascii?Q?8wqnttOo0w2jsRQsL3vNdeyRwX2f/LdLinj1/oyXN1+9LySl+xrxUoCyJhu0?=
 =?us-ascii?Q?QGPfyZkQmgrIXj+Tv8a+NA7u0wTGoRXFgtV0EvSqKTU4CDqemuNm2PF1t5Xz?=
 =?us-ascii?Q?jEdvqAhy31L1/c4kUujYV1NB2RLBI4EBcYuFvZN0S5t0/XSxOQy/LwutOlR+?=
 =?us-ascii?Q?BM+9jbDE11zueJhW7bC/KIUQIMjlt1EHgjj7JgXuIyqWAjwYGkZjWdU4lLZI?=
 =?us-ascii?Q?dXEXe2Xkfs+mDEswfEI/opvFDYGAN/Gw+UdkpmqgmKZn8xhuqVh6y+4kDdWU?=
 =?us-ascii?Q?w/F0WGKpTQnRZifcaXYL6CtdQCWolxGBEiTKzD1XorOoVwCmQSFkMQy0sLng?=
 =?us-ascii?Q?hfoIsJLWzxf/R+4mkIwJ2wAEYlbJCQ//kZvQb8NyN5s7u0Or8wtZyruh8VUz?=
 =?us-ascii?Q?tcAnHfP38oWuXEU7hmOGDKWBZocb4RMtbcFWYwjtumkFbAfmAese4xeyBQ9W?=
 =?us-ascii?Q?7pzghXavivDeiCB6WUA14MjpNPvnLQOXQBsX0l4fZZ1p0cergnJieTvB9b9A?=
 =?us-ascii?Q?GY6quWdMGKWjIc3c9/npwIpGEHfSQnHEqdonwesKuv6xQ1Uzi+X6gSOo7Vpx?=
 =?us-ascii?Q?CB6QBqKJWwZ2QpMP8ADf7pk3vSF3uXvDSITG9UP/vpcTtsmNkfWdUv7b9VDO?=
 =?us-ascii?Q?g5v+mL8Fd9hNXyEylGtqz33g73MNg6PfAogH4E1o7WWaQvfEx9I2gNlfiZ8h?=
 =?us-ascii?Q?ahlvc2vUjJjUe+NIW9S4l9CKjYqCBGGDNXc0woD8H1hBgTYIrctOJwHEuhsO?=
 =?us-ascii?Q?FxbOaliwH8g4X4r/m4DB+VqUsJ6rSEcgzDEG4CxiMiUVRvVxJ5IoP417Otth?=
 =?us-ascii?Q?0ucl5yfWSC9ZUZthTpBbymEE+7geQ14Uzld2Qt5KIGUfzw=3D=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?QuLRf3xQ7cXLUW9pDNQwq4Q1x91Ns3soTz0HHpWfD9J7dfqwawZPUQUfF83U?=
 =?us-ascii?Q?hEUwXnxios+BF6ABnNFzptC/OhGzDIVFEc3DNui/hqOkfPJMSwfXx8vBeA8C?=
 =?us-ascii?Q?9zclklTfidxHYQG6ORUAp5yBld1m1Itsj4fcmH2MiYNJ6VpGZQKrdxHAX1Kb?=
 =?us-ascii?Q?oPI2SzvAjFe/TT5/n5utD2D1PGl54P/BbvwmO+Q2twPdWIyTF75uT0kLAD86?=
 =?us-ascii?Q?2u1kjoYFyaIgfErBb1XWmyc0p2j08ke4MGAmp13NJPtAQXgk9VwbO7p4gguk?=
 =?us-ascii?Q?ryW0v16b3cv/bXw2NxvCeiVGmdsYnyJJnRXMYjF28LJSN9b2+vx6zEQuzqXk?=
 =?us-ascii?Q?tPML4okw8J/mn8wmMkh64IvQxV6ZjmZDaxJV4K51fvfHFlctqK0q2OjlwPzn?=
 =?us-ascii?Q?Ze7siwiZTTQ4VMbVcNlhYhiBJY0hiiMflf74Z0N133vLaG9Lf37KCnP51WMG?=
 =?us-ascii?Q?R9oI3JoF8Il7armdWwW9w5KnqD2wIVqBbh/DVuG+sTs39tAz4wHDisr9S6Bh?=
 =?us-ascii?Q?7PkE/gbMd91utUqLjXZZCE+csMCNOjT44Stdtz8aREBMCW/7DzytGKZVkqIx?=
 =?us-ascii?Q?amiUX4mqgnh9MX1Q+qeluXbBH+GjKB6LWEu4vyi5rwtbDLNBrTknydacNsGH?=
 =?us-ascii?Q?JhAzgaYlwoq81uos1GItnYTcv2pp21A05Y806Ifk3M/XkA+dOQAVvCVzoz16?=
 =?us-ascii?Q?z43ixMJqpWa2A8glgpekaRxLLxLolGr0x1OSJMQOuKUIo6DuBBE/IzuX5rbQ?=
 =?us-ascii?Q?FnarMw6ymoEbySu604EwZdWiwhH8wLD9Wuo/2PVKALwxN2dGSIPGmn39TrA8?=
 =?us-ascii?Q?/wqUzKezQ5bEdq628IAlPs+OH4ntQ8vVHeVRFWcFqQ5+4taRlvJeB1U2ory/?=
 =?us-ascii?Q?vXBQ7lL7uN49pPrQJGGmI9w+xtK85OuV81me7cyWd/pCvfuongc0vWI3DnXz?=
 =?us-ascii?Q?92KfnKn9U2SHADcyOuk1Jxfw4XPN8bjxnOpF2N3NmAZuYzhsIMSp4Z9ISy3D?=
 =?us-ascii?Q?nM78YYsGQFrQCVx94XPAGo5a7wuBsj/6MHjT/c+vXBDlkq5+mqH+SrZP7rB+?=
 =?us-ascii?Q?ubkTQyw+bePDlqVD9U5Q/KQragcRxqp+yNh7alqWikYNdkqjeKQ07qCzXCik?=
 =?us-ascii?Q?eaV1xDnPKn0c+hm7TAmks0oi1MCy3CBx3636mk6Wh3P06n2dC7Z5HMXCrcp5?=
 =?us-ascii?Q?xzpOABnxi9SDYCAU7SMNp6JBYjslouUvzTSkslkB0Xv5bQX2JpV0kQ0kfLM?=
 =?us-ascii?Q?=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4157.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: ef79d710-9942-4fd0-baf5-08dddb5ef5e0
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Aug 2025 18:18:25.4430
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH4PR02MB10755

From: kernel test robot <lkp@intel.com> Sent: Wednesday, August 13, 2025 2:=
28 PM
>=20
> tree: https://git.kernel.org/pub/scm/linux/kernel/git/hyperv/linux.git hy=
perv-next-staging
> head:   ee8b3b85ffbc4dc06a598a12185537dae67714ab
> commit: ffe1588178d5bb71c58361cb84cc3f4342f82100 [2/9] x86/hyperv: Use
> hv_setup_*() to set up hypercall arguments -- part 1
> config: i386-randconfig-014-20250813 (https://download.01.org/0day-ci/arc=
hive/20250814/202508140537.LHGYEm9W-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20250814/202508140537.LHGYEm9W-lkp@intel.com/reproduce)
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202508140537.LHGYEm9W-lkp=
@intel.com/
>=20
> All errors (new ones prefixed by >>):
>=20
>    In file included from <command-line>:
>    include/asm-generic/mshyperv.h: In function 'hv_setup_inout_array.cons=
tprop':
> >> include/linux/compiler_types.h:572:45: error: call to '__compiletime_a=
ssert_494' declared with attribute error: BUILD_BUG_ON failed: HV_HVCALL_AR=
G_PAGES =3D=3D 1
>      572 |         _compiletime_assert(condition, msg, __compiletime_asse=
rt_, __COUNTER__)
>          |                                             ^
>    include/linux/compiler_types.h:553:25: note: in definition of macro '_=
_compiletime_assert'
>      553 |                         prefix ## suffix();                   =
          \
>          |                         ^~~~~~
>    include/linux/compiler_types.h:572:9: note: in expansion of macro '_co=
mpiletime_assert'
>      572 |         _compiletime_assert(condition, msg, __compiletime_asse=
rt_, __COUNTER__)
>          |         ^~~~~~~~~~~~~~~~~~~
>    include/linux/build_bug.h:39:37: note: in expansion of macro 'compilet=
ime_assert'
>       39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond)=
, msg)
>          |                                     ^~~~~~~~~~~~~~~~~~
>    include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG=
_ON_MSG'
>       50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #c=
ondition)
>          |         ^~~~~~~~~~~~~~~~
>    include/asm-generic/mshyperv.h:239:25: note: in expansion of macro 'BU=
ILD_BUG_ON'
>      239 |                         BUILD_BUG_ON(HV_HVCALL_ARG_PAGES =3D=
=3D 1);
>          |                         ^~~~~~~~~~~~
>=20

Wei --

This error is due to the compiler *not* inlining hv_setup_inout_array() in
include/asm-generic/mshyperv.h, which makes sense because when the function
is inline, the clause with BUILD_BUG_ON() gets dropped. The function is tag=
ged
as "inline", but of course that doesn't guarantee inlining. The problematic=
 config is
for a 32-bit build, and perhaps the compiler is short on registers and deci=
des not to
inline. The problem is occurring when building arch/x86/hyperv/irqdomain.c,=
 though
that's not indicated in the problem report.

All that said, if I change the "inline" tag to "__always_inline" the proble=
m goes away.
Is that a fixup you can make to directly to the linux-hyperv tree? Or shoul=
d I spin
a new version of the patch?

Michael
