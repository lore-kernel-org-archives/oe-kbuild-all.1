Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11022080.outbound.protection.outlook.com [52.101.66.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD6E824DFF9
	for <oe-kbuild-all@lists.linux.dev>; Fri,  2 Oct 2026 14:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790951023; cv=fail; b=LrlfhaeAAAHMyRpMp4ggLjhqePcD3OvT2RYVV7XAy8QBVM04lrH+meH3ru4OvSw5MkTnym/hZ9aky07xhQZymNrgQcqxR9JxTnDwr6ieTo12cA4YMjZMood5Ka3GuQ696foNmhqQ4t1eOAKH5b7ZV/7r8RbEU05bAJNie8GOyTk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790951023; c=relaxed/simple;
	bh=cUF3IyfdDDfoHJOgT9rShW/RI6nh03/n7IifEwcSV58=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ZQ6SiD3wFhjowYhMZozwMbi2HsrhQLqe87jJrMBoiHOYHrQdayESjGJzJ/4/nufGxTWD6Mel164QZhZczFjpq+1TfHF5dviglboUE2A+X/XoTZXvvZTPg2qz7OlSZr0ALmhG6gbdOxkHmmBHcf8ePE8SAG1KvWcjGeuukOogvOo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=studio.unibo.it; spf=pass smtp.mailfrom=studio.unibo.it; dkim=pass (2048-bit key) header.d=studio.unibo.it header.i=@studio.unibo.it header.b=UgV9tJHO; arc=fail smtp.client-ip=52.101.66.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=studio.unibo.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=studio.unibo.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=studio.unibo.it header.i=@studio.unibo.it header.b="UgV9tJHO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zQ0fqzHKmO9A6ZkU0e7FoXLqe/AGcKT5ZrYCI6AwwZio6Idi0b+sDgO9kIZtZu3Jrcg5wNsNMCyrN5wKSWuW52tiJmDFRE1mRzIx5dD6ZaziHDGEK2DmpQpz+aRlE4J5O4aoz7qswAEDb/PoEfBFqLsDf6v6zEJAebqR5/tkIj8CM9g0QcWYNq9m84E+FYJvYQ39fowH3L8qinjIMb7L//Z9dRId3lFOaiFX0XaQtyIJ0Y2H8RTLVn4aFsYXpCbiFEyPEl1JqLrYG8qu54ZPJa4A1P9nWS6ocOrsMALaZlRjgnBrgMCTaVWNnEh0GIbPsEjh/7zdGFjvUBSdtXmN8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eMT+YDqu0o10NRouGhW3yxxp9IfXSnyjoG8suH+KSYM=;
 b=xAPSQtNUSVBOUDn2Js1VP46ZqCjJySJW0ovzIIgr6vpzJA5OBj+4ifxAjdXa4dYbdlZe+34rUHj/6cjif7647OcjNgJPenkqlwIc4ZNDvHM+MDbnYAmtQ3bFN5EUIpSsTOulOS4U/SRxGB2BGZ5qOC+Tz3QDLqDDmABVK6KnTAqND8MwgVynEr6Ea+dD8jLaxa3aYdQjzK4ttkYsf+AcMBu2zv17kbZp3lvL7alm1Qn6r3CJxqnUtHLeCmVr5RSVbr0Mf+l83TeMw+FtZUkrlO9Jfq0xOYIqbez3pAChkJMIAi4ck0QLFioaOfX9AmekSg2oZG4QmbQxLEdgQAAk2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=studio.unibo.it; dmarc=pass action=none
 header.from=studio.unibo.it; dkim=pass header.d=studio.unibo.it; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=studio.unibo.it;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eMT+YDqu0o10NRouGhW3yxxp9IfXSnyjoG8suH+KSYM=;
 b=UgV9tJHOSJIbY2asAU5rNsVJFN6HIuYQAmia0tz5zgPgDaA2F54Vp05JFxmCZm9Ef7e3VbfYvcg1YdwKEha9GhS6U/fWhPZsh8N8fDEgc1c0/y9W8wnANO0xZw22iNc8bHrG8fqiowE9mhs5ni2lvti3iw2ZDhfXXhF5NBEolFDKgPFkeF88n/wtP3coQX0Q9YCh4Afrjf77KGihctsgSy2aba2soehj0/iNgPZZS2E/zxGq3nO6t9oOhtBPC/TTE7SnErN4Tr7kpEOYYwLiCtjNZYDB4lterHBk2ocPYeyer+7TZuQ5MgRb9jXzUc+TGSS9+GKet9iiya0aQvSJ1A==
Received: from AM6PR01MB5686.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:da::18) by DB9PR01MB9320.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:363::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Fri, 2 Oct
 2026 14:23:34 +0000
Received: from AM6PR01MB5686.eurprd01.prod.exchangelabs.com
 ([fe80::d9de:826:e4be:1934]) by AM6PR01MB5686.eurprd01.prod.exchangelabs.com
 ([fe80::d9de:826:e4be:1934%5]) with mapi id 15.21.0451.022; Fri, 2 Oct 2026
 14:23:34 +0000
From: =?iso-8859-1?Q?Nicol=F2_Giuliani_-_nicolo=2Egiuliani6=40studio=2Eunibo=2E?=
 =?iso-8859-1?Q?it?= <nicolo.giuliani6@studio.unibo.it>
To: kernel test robot <lkp@intel.com>
CC: "oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>, Gregory
 CLEMENT <gregory.clement@bootlin.com>, Andrew Lunn <andrew@lunn.ch>
Subject: R: [linux-next:master 11703/13246]
 arch/arm64/boot/dts/marvell/cn9130-sophos-xgs107w.dtb:
 system-controller@6f4000 (syscon): compatible: ['syscon', 'simple-mfd'] is
 too short
Thread-Topic: [linux-next:master 11703/13246]
 arch/arm64/boot/dts/marvell/cn9130-sophos-xgs107w.dtb:
 system-controller@6f4000 (syscon): compatible: ['syscon', 'simple-mfd'] is
 too short
Thread-Index: AQHdUnS7DnQkzj+mvkK3r5e1BJT3t7bqTiuq
Date: Fri, 2 Oct 2026 14:23:34 +0000
Message-ID:
 <AM6PR01MB56862E18ABBD9039E267993780892@AM6PR01MB5686.eurprd01.prod.exchangelabs.com>
References: <202610021532.JJJUVqD9-lkp@intel.com>
In-Reply-To: <202610021532.JJJUVqD9-lkp@intel.com>
Accept-Language: it-IT, en-US
Content-Language: it-IT
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=studio.unibo.it;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM6PR01MB5686:EE_|DB9PR01MB9320:EE_
x-ms-office365-filtering-correlation-id: 7a02c628-b083-4d41-5a7b-08df2090be2f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|786006|13003099007|38070700021|10067099003|11063799006|56012099006|22082099003|18002099003|3023799007|220923002;
x-microsoft-antispam-message-info:
 2kqH8wSd0XQzfNlD7D06chAXXlZ3aq0VjTGwbQLl854WMMDS9Tw3TmYOHQyNNjQz23LY74bpTg3V8d43nUQllVaWz+tPNGQSKru+PkFmSOt6BmPGn0sEBnJn7Fdoa0+aXvTe97cipXBQpAy1yRxnNDCzuZdLVFCtWIyWfE/9QvzSJ5OY21v9xWblhKVFCd8hlOQB2cTwLxz5/3IleGwbsc49uhX95DHm9ffC+mMzjshibxxqBwh8eQbB1+7bwHcJzhJIrJ1ZO7bBBmoqLlr+iAstGNmU/X0i5gb17Mk083w0K4F1s7cvB5RN2toebs0kuFUcdNHrcyggXgw/OtuLq3+B/Azl9u88jtdDh+LRTaeuSFYLtaz8vxBebhqEk4W6lF3PpVmSy9Hls1Wgqzuznva68CZ3ZQRwcwKhoglFgeLeTuvNarYLcwJW1mKDJ4wg1MzUcrK0UiOK8nyqN8J2A4dP/ljp2uq7i/ago1EZ1pUjDHzlSH2PV9IEAAhvpd7cLBSXyS8lg0fuKOJ6QmPb8i8qYIzczzG4ISx4fiOUzBGb3jRYQZqZtzDDAniaB5yB69UiKWiAHUvLkN+glRBIGssMzZ890uViyFSAvJ/f6k+zNxXfFWGhJFLOqNpqAr+6Pi+VI7HyUd4ZCQTYaBdNTZXeglQcqkBcLHcpzx5098QCeZFDAmcw0NUSQR3rDADz2dy1TdPj62Vn+8+7M8i3Wg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR01MB5686.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(786006)(13003099007)(38070700021)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003)(3023799007)(220923002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?HEmly9v61W1lp7dUQg9pKmA2u77WGcUOD6KtuJ5nDgHHan788q+9ws4mRs?=
 =?iso-8859-1?Q?rpKAnVXyUgXsfnsglH51IhQPqiYTqJk/TMjfNb+l0hVruiD0U0NCj4kmjP?=
 =?iso-8859-1?Q?BSW65R7YspwT9iFUaqR7ZgpmRFEPpUfj2BNtmKwo3+vP9Jo4a8gSQyO+Cn?=
 =?iso-8859-1?Q?+X3tm5qQtqn/gZvy5nlsBjMRos9XVqFYd1KKBM90Ik/aKQ+vlvTIqr22wz?=
 =?iso-8859-1?Q?Y3stkshT5Pf2++vGaoqoGHUb2BRR5OAJ+YKGcB7G7zCE/wFnk7EyL7MLqC?=
 =?iso-8859-1?Q?ftsr7YI1VGKOb6RCoIlxfHgoOezev5p57t0vlWQkJTEz2V0A3Mhy0eUErh?=
 =?iso-8859-1?Q?zFJSMjZngeHwnBNibQEa9LZ7iGuFFixJusZtqanvowiejvmAufFUEbh48M?=
 =?iso-8859-1?Q?e4hwchMssPgigamhTGF44D0yycs2bL9v+iEkgs3KmQ3sOgRhZvKIrL2o7Z?=
 =?iso-8859-1?Q?iCCTOpB5nuIVeB0NrONd/I1FmTXRIHnl5XHU9/ob1gOPVcK8AZjFIhv4qK?=
 =?iso-8859-1?Q?5iMOGk+5OzXOFTXymmvKrqEYNdVPPuaW2+DU69qamf2TA/SZRyImaYp4Si?=
 =?iso-8859-1?Q?KNfYBdiNuKHFAF4t/evoK9aW/z0Nl6XAB3wrREr1j+r54g0RBsOBIrDc1d?=
 =?iso-8859-1?Q?NwGhwsqOtAWDyz9EZK/uzFfUDaiG/mfoQzjDLJRyne+cwyfglxG+Ex6zx6?=
 =?iso-8859-1?Q?zba+NCKUujJzv4D7tGk9KjV1DzXFUHa84jj+vzCtuo5jztUGGBK8KZxK7K?=
 =?iso-8859-1?Q?2pAkbIjSdjVoPuyj8ILxgodumz7cHgV8mEmHe2pFxdjVhKTB+yENPqbNb9?=
 =?iso-8859-1?Q?q6N4IVancnuudSmvkLrSJMG3n0AmwDU9d/GWlMUrHTm9/ifzwZXwWVmwhX?=
 =?iso-8859-1?Q?mvgtJC+0KXGbBdJBZNd9/Esn5ZPi1Ya4+HVLqRcjVvkDKLxyNDH63p6vLL?=
 =?iso-8859-1?Q?B1rL2QjwS4aAr3mqxQJYIMmn6H2L7pz41Sd22nRkcgaqKFNuZP/BES62dv?=
 =?iso-8859-1?Q?e7igSSF1ti1QG83tvY0eTd0pcjpd9NJioaYZPpoofS61BAKhlBg8h+5leM?=
 =?iso-8859-1?Q?nTXUtuFdCCngevcQNgX3q88woTtJPkfwGlFgLG5nc5QNg96Q6MiyPd7mIn?=
 =?iso-8859-1?Q?+g7tFumLsyRWLpkcn/GAgw6nQ43AL3vG4GCZxgtM5uXOi838bwhosq8IuD?=
 =?iso-8859-1?Q?xoPx8LUxsvIW/vyXCzWfVEbH9XQ+o6coZrop2gI8N+YG/YfO9iBePktiuA?=
 =?iso-8859-1?Q?+d4KVstTF4mlUH3fLh2L2nvSE90PrazJzWiygMji4fVl4Bp3mnwebjd7XR?=
 =?iso-8859-1?Q?22+IpoUg+nJ72pM2YOn7juhqdxosImX9buxH90YnqlxnwOJz/XKWhoXoxi?=
 =?iso-8859-1?Q?yy7OrAXmF8MTwM81zCnYI+UoO6/V4ypQmBxnlXpImudAfvOtpPz10zIzz0?=
 =?iso-8859-1?Q?2pxDKfRIDVVcqW2WHHjPeF6wdU2EOzG+jf//ftN3wTZczYP9dlRyC/V5+8?=
 =?iso-8859-1?Q?s/7sIBo8GNbaFYPZH8ysks2KcwWEmWCrwQFnhxOAfj6brX7bR2daJoYgq1?=
 =?iso-8859-1?Q?QhC1fzTDK3heCy2dU2crm6aDgH6wjGX5Vfb30Dy96LUuQKVsAvYn/60HQe?=
 =?iso-8859-1?Q?OGU3i7s+0X0B/WaM7R81CrTYyExTurorWn1ITmXv60obg7rT2g7NufN8ZU?=
 =?iso-8859-1?Q?2g47IG8co9xNI3FRZNV4j1xn5QOVohhaLolrV++LJ3VfxDGpququQMMW84?=
 =?iso-8859-1?Q?fgrJamoCN8HIpeeusToWmCH7/dQmHPIXh+LwZR+aWdt/R24H5T4YINzncD?=
 =?iso-8859-1?Q?zEZITgTRGaVRJY5bhjBEWP/8q35oTLc=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: studio.unibo.it
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR01MB5686.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a02c628-b083-4d41-5a7b-08df2090be2f
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Oct 2026 14:23:34.7501
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e99647dc-1b08-454a-bf8c-699181b389ab
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iQdI6rSZ17QEnumWmFYpwcCu6AqYsymJVyLx8cWcsEw/maQxmEZ/C5MlhPC6FhNS/KBZqJ5GgBlK+cGOk5ZXYng5BeCDOgR8KGVwHlUrpduWjyHX5QBYncIj7PdsIf/t
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR01MB9320

Hi,

Thanks for the report. These three syscon nodes are not in the patch this r=
obot flagged: they are in the shared armada-ap80x.dtsi (system-controller@6=
f4000, @6f8000) and armada-cp11x.dtsi (system-controller@440000), used by e=
very CN913x/AP807 board, so the "too short" compatible predates this series=
 and is not something I can fix in the Sophos DTS.

I looked at an obvious fix (adding the existing driver compatibles, "marvel=
l,ap806-system-controller" and "marvell,cp110-system-controller0", to make =
the lists 3 items long) and backed off: those two strings are the legacy si=
ngle-node binding matched by ap806-system-controller.c and cp110-system-con=
troller.c. Both nodes here already use the modern split (a "clock" child wi=
th its own compatible), so adding the legacy compatible to the parent would=
 also probe the legacy driver and double-register the same static clk array=
s alongside the modern child driver.

armada-cp11x.dtsi is also shared between armada-cp110.dtsi and armada-cp115=
.dtsi, so I am not sure a single new compatible is even correct for both va=
riants, and I would rather not guess at a new ABI string for a file I do no=
t maintain.

I don't have a safe fix to propose myself. Happy to test a patch on the XGS=
 107w's 88E6193X/CN9130 if one of you has one.

Thanks,
Nicolo Giuliani

________________________________________
Da: kernel test robot <lkp@intel.com>
Inviato: venerd=EC 2 ottobre 2026 15:47
A: Nicol=F2 Giuliani - nicolo.giuliani6@studio.unibo.it
Cc: oe-kbuild-all@lists.linux.dev; Gregory CLEMENT; Andrew Lunn
Oggetto: [linux-next:master 11703/13246] arch/arm64/boot/dts/marvell/cn9130=
-sophos-xgs107w.dtb: system-controller@6f4000 (syscon): compatible: ['sysco=
n', 'simple-mfd'] is too short

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   9f24d789f03b22941b905ded43cb5ff8eea9ce62
commit: 0f72e965efec4cda7c3b1ac76edfab53f27ed9a7 [11703/13246] arm64: dts: =
marvell: Add Sophos XGS 107w NPU board
config: arm64-randconfig-2402-20261001 (https://download.01.org/0day-ci/arc=
hive/20261002/202610021532.JJJUVqD9-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema: 2026.10.dev4+g568711590
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20261002/202610021532.JJJUVqD9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610021532.JJJUVqD9-lkp@i=
ntel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/marvell/armada-ap80x.dtsi:282.24-292.7: Warning (uni=
t_address_vs_reg): /soc/bus@f0000000/system-controller@6f4000/gpio@1040: no=
de has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:236.24-255.6: Warning (uni=
t_address_vs_reg): /cp0-bus/bus@f2000000/system-controller@440000/gpio@100:=
 node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:257.24-276.6: Warning (uni=
t_address_vs_reg): /cp0-bus/bus@f2000000/system-controller@440000/gpio@140:=
 node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/marvell/cn9130-sophos-xgs107w.dtb: system-controller=
@6f4000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
        from schema $id: http://devicetree.org/schemas/mfd/syscon-common.ya=
ml
>> arch/arm64/boot/dts/marvell/cn9130-sophos-xgs107w.dtb: system-controller=
@6f8000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
        from schema $id: http://devicetree.org/schemas/mfd/syscon-common.ya=
ml
>> arch/arm64/boot/dts/marvell/cn9130-sophos-xgs107w.dtb: system-controller=
@440000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
        from schema $id: http://devicetree.org/schemas/mfd/syscon-common.ya=
ml
   arch/arm64/boot/dts/marvell/cn9130-sophos-xgs107w.dtb: system-controller=
@400000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
        from schema $id: http://devicetree.org/schemas/mfd/syscon-common.ya=
ml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
