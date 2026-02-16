Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF75A21772A
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Feb 2026 01:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771205851; cv=fail; b=QEdCdGG1ttf7d5v/z4E7C9uSGpWaOcoRIjcW6QoegfGXCxgm4cugTj3xKj8Esp7DGC3AkKR/a6JYP6CFu11EXjoSB1Ni6gOEWV+a7NDnats8P9hSCWtEoQCeIrxRyjXI7s82pKnDWLZFXDacH5aIPxE0lonDLl0CVkpQRxvLArw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771205851; c=relaxed/simple;
	bh=zytQ0GFafkN0bePMGV8YREqkF/sjFOseNeqFiw569T0=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=jbASZLQt7us+cTmfzG2AytaaXBdompdZnDE8V2JJ5Aymh9FCF96M2GMPyHmVOVBmDArQCGm6rCgwV2ekjFWUSKblWt6SsyzhTv8vMN+h9o/rJcVzvTOUrXvXIqZsBWnCVxtcGUzWUh5tB75IyhF/TBeb3xQ3wzxunP4siYOo+Wo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R3gVGucO; arc=fail smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R3gVGucO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771205850; x=1802741850;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zytQ0GFafkN0bePMGV8YREqkF/sjFOseNeqFiw569T0=;
  b=R3gVGucOr9k7EIrCiwhZCPOuUgXCmxBOuGUaUoUqWfEFuPPn9vWeQRJC
   ALiW0W5l0Y1C6//s9nM06ml0E0YYaCpLZbacqskSiYqkPiZ7CU2HofNmf
   ptGdshw6ifn+CwuWiSP1VvfUcWQgp60KwzCMh5T96k3sDbzniX/RaCeuw
   AuJvbl7mGqe4+sdNsCBQqIL84ZNSw2I4T6+fgkqHTuoGR/EPsuQSFOn5u
   2JGKqTkHV5BvCfeisTE2hJUkOWS7p4JajpTyOZvcA8MXBwqgxV0NWeRCy
   wg67yVh3C8TU8FmYeSB1r7D1ihAyffUyEhvsZgukEHMBRvvvWHurx0x3W
   A==;
X-CSE-ConnectionGUID: HBDYVZtDQhuElB1s2HPXSg==
X-CSE-MsgGUID: Vvy3cThxSTaTAxOce5gX4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11702"; a="72004229"
X-IronPort-AV: E=Sophos;i="6.21,293,1763452800"; 
   d="scan'208";a="72004229"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2026 17:37:29 -0800
X-CSE-ConnectionGUID: lFXw3T3oSSeu5H9x0UIbRw==
X-CSE-MsgGUID: xyUVD5LMTyuIyT3UJWyw/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,293,1763452800"; 
   d="scan'208";a="212710368"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2026 17:37:30 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Sun, 15 Feb 2026 17:37:29 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Sun, 15 Feb 2026 17:37:29 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.68) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Sun, 15 Feb 2026 17:37:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lmnxu/LnXm49Muo47sui1cLwzowrR85PrN6oEJtcCxn9XXb5Gl4ooWZ4vbTBDMzQERv09goaj84oCojw3rIB/AWCikWFrMn49zbUTQeRWxh5B/ajV2CvGYYXai17RGS4rmykdKQnY1guEvJCtPCPN9l4PqLGj8chTAaKJW98ha/Q1RDrx7CgcfkFDqXUEUF40MfqPVMvavKIJ77fMPuKK1EUiIQKEvAN514LiyfbLNM4AGMnWiR2ink3G4Ty9Qr/i1KNJFi+8OKqQQSAB9CVFymRyiI0PpGO+/b9nHfahX3221Yk/UtBdWd4SwQm6GBA61fdd8j/3/qYDfDkLR4emw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w1QDo/cR2jrTvW0R+LLhwMQZJ7FdLxiYYRGuIaFYeDE=;
 b=M/dmJgKgE+v5FuBBCEOrL/1+AHoq4KrPBxOA6MQMKz79/fclJWQK6HRbbLFoHpbE6AA0xwZVbfkI0F6efg3BHOkoFH+UVnSlOCmydUlYx/hsVnuJakYRvzIy2KdWZdltLmcRwtLkPDyKnBIYAc4PLnR0UsQzYTJTTnLHQCYOLzTyYDyTQf/el7R28hN6vknmMD8w0vpg+o62Yh6b91b7MeI0wrL/+N+tDVsVzP79r3v18adGNFTvhlV2G67+RRFj4dElNajQPmSZ8vlMud0NDvF1TMALa4uOY8tYHmFOFig8Yp9oo/3MixD64IHRDNpB4T0gd6dAtow+nSCk9aadMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8468.namprd11.prod.outlook.com (2603:10b6:610:1ba::19)
 by MN0PR11MB6160.namprd11.prod.outlook.com (2603:10b6:208:3c8::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.15; Mon, 16 Feb
 2026 01:37:26 +0000
Received: from CH3PR11MB8468.namprd11.prod.outlook.com
 ([fe80::8188:d688:bbca:2394]) by CH3PR11MB8468.namprd11.prod.outlook.com
 ([fe80::8188:d688:bbca:2394%5]) with mapi id 15.20.9611.013; Mon, 16 Feb 2026
 01:37:26 +0000
Date: Mon, 16 Feb 2026 09:37:16 +0800
From: kernel test robot <lkp@intel.com>
To: Macpaul Lin <macpaul.lin@mediatek.com>
CC: <oe-kbuild-all@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk-ufs.dtb: pmic
 (mediatek,mt6359): '#sound-dai-cells' does not match any of the regexes:
 '^pinctrl-[0-9]+$'
Message-ID: <aZJ0zLn1U56qF+Xj@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0157.apcprd04.prod.outlook.com (2603:1096:4::19)
 To CH3PR11MB8468.namprd11.prod.outlook.com (2603:10b6:610:1ba::19)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8468:EE_|MN0PR11MB6160:EE_
X-MS-Office365-Filtering-Correlation-Id: 09e3c7f7-436f-4a39-ee6e-08de6cfbf050
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?lIUMC/2ik66b+f5pEGmcvhm6oFppWBlNXfMmeFe9Ycl4AhwXQ+rxP32fw7ub?=
 =?us-ascii?Q?ugKyC2b6a/o1yHL3L5TLDSqMi3MQ1DYt3QcLw5WK8wJwqwTjXYmKwSdl6EMI?=
 =?us-ascii?Q?vFO4pyIbbsHyj0KDOO+kZoWVZ8kKB3cPK6GJo0MX3M2Oyu6yuVwrXSdABEbm?=
 =?us-ascii?Q?0/B8Tz9zQ/wA4g0gWsXv+EHlnSeUlxn7tHN5oLxPLLFDoY4xGVTiBsq3XRAi?=
 =?us-ascii?Q?25MeWbbYhfZFYB4h7sSY++aHJiJqunQY3w58Xzs7rcXT7gk+S5AQ5IGtBxxf?=
 =?us-ascii?Q?IGpooeZ4zIw7+ycLyDb0BY2jd98l9sDMkMvXyU9fzpfAaw9e24o2NTk49bG/?=
 =?us-ascii?Q?ALvwbMeF+eteWTg8cMsSYahrXxWcOhgBQZ4f8Tzka4Ew0y1zw413ZmxmElHU?=
 =?us-ascii?Q?cqxIEtWlqN4oGM0Zkhk9i4D2fuEU66Yl1sqM2/Vka8IZSITg8QwlaAeIbHeU?=
 =?us-ascii?Q?MAEmKqTzVGguPrYtEEOaoA+kanMFSVUJotFDxurkK3oABEXRS044aFCKiCp4?=
 =?us-ascii?Q?jG/vDhmaSyNdwZuqGxPczkHLXMdq+U4M4ICFfY+BNLECnMd6BKC3/UThDUoh?=
 =?us-ascii?Q?izrSTNcsp0tsmdP7Qfuish6qkfu0VoJ+6XnhhoaedsIhf2P4PM1Mzk3EOsEw?=
 =?us-ascii?Q?/LYlkWwSayrKW7bOg9oLtWxBZAz5al0vxBheqdJZ3ofUZHvki7Hs74sg7ebX?=
 =?us-ascii?Q?TPd3g2fXllGJjqDHjNz/PuuB5xmk35yVO3YXLWzAoTFSTz9vftZTPrTn+DZg?=
 =?us-ascii?Q?g2xKUP0Jr1Ayir7T5FOY4XZ6WDbrdxE+ughEnhiQEBsW47bTXiGMyTmG54lp?=
 =?us-ascii?Q?u+f1c/ahkQCHCgs38+2XDabr7OTK1rR2tb4Zr5tmrpMf2SD8X29ybmPbkMmp?=
 =?us-ascii?Q?xXl6r9ZxO7OY7emlpAHS5VoiejF+F6Wr25DS22kZWqvPwjSLpXDWD0mFAGS+?=
 =?us-ascii?Q?DpNyy2mvCihM3FF2hlNAsgoBM0hEeAViZZuwEvddWSWxAsT+XMfMcW1tP3SO?=
 =?us-ascii?Q?8Aru0Xl2Vxn1WYpW/XQ6YH/xrqq/ydaxsTjIwwdt1Ok7hNJCGrQL5ySjcZ2J?=
 =?us-ascii?Q?BaHetzDQlRne6DgdZwGoAdfBUBTZSqe5A4kaBRZTLNyVlEuQoaCs/2NYmAt3?=
 =?us-ascii?Q?9ADtd9IelAVGw+5+nX5P93Ey7uDRLwCtyjb81HN1X2W+H0C/4j4dJqVbxh70?=
 =?us-ascii?Q?2LGAu2txrqt+9Z+bOMzTCKn+sW4xtnqm3y1VSBje1KGOTkCjfEV/MxAyMiu+?=
 =?us-ascii?Q?E7sVMEuGFUnlBvhrbKmaq4Cv30nzSfpy3DGGma6XAV3/b3W1fHhqjD2LlbVh?=
 =?us-ascii?Q?ZTTYZXCwtp5ceFIyUvR2eojfs7o7x49/imo+VA5wsEckVhi+hkSFo1eKFsEc?=
 =?us-ascii?Q?aKbbShMMR+6G73SRLNgpIxm+wvc3QJ6bElDrBXU4uhJo6ufAeT7KmaKb9Xqg?=
 =?us-ascii?Q?YUGssD4GLnlkt9/t5bIuc5B5/dYhrXiC5zcYp3gVxSfJyMo3jHDqGwmvJXdZ?=
 =?us-ascii?Q?p5rpA4abVAvubJf7PZHZTivOd64+gjZwS+pOn4J9WrAvXdz5aZmiSICOpDjh?=
 =?us-ascii?Q?fnHk4OweqGQKfaHoAI8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8468.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zErcNRuVdo1gcxuhgKDcV6GZg69liIEdlAdXmYpp/4E6DfaGzv1slCrDtnW+?=
 =?us-ascii?Q?mI4FsoP42GK9wniAyOEYStBxIc7bvxzo6AFuMnft3mfIBUSwjZz6wQWNHV7U?=
 =?us-ascii?Q?wmHvJ1dSBniPVHtL/JKZ4A5V1xTNDMgRFdxITYNEfBdUM2R9c/cmARUW6ytm?=
 =?us-ascii?Q?lzuNWddxFH6pkkgR9Ha6MOVGrxev8GZFWE+Q9yTvL6K/5pdQbMPdeq8Jm5ym?=
 =?us-ascii?Q?rQke3q3CU2pQabIzRmPK9wZey8prf972LsxT0QKIJagkfm/F+Hw/kpRXRkaS?=
 =?us-ascii?Q?Coxxyk54BrkIayzsBxyULKtIbH+kEGEy1F5LZOJGzwycJ71iFHxYd89juE63?=
 =?us-ascii?Q?OvvjZmZs9m00p9nyQYkavyV2AMpqv3x15I8BCndqmoiJkGh5IwHDg16zpEGf?=
 =?us-ascii?Q?oADMswq4vasanfmdhU1IDJwBZ8kRP3nTdJqvwksahDeyL4kfcc5zT3QuElpO?=
 =?us-ascii?Q?J4pYrFYBhuyHGlnZFwhj6+ykTXMfsHgx73F+nv3HOK2qEYhb9DaMqAfoD1ln?=
 =?us-ascii?Q?Bu3CDwTkxgmy/lI2/+MQ2NP1o1UKBID+3Prm1kyLt5BLujBX40nd1qCyKWLi?=
 =?us-ascii?Q?VKMYsfQSNVkjyYm3sjP4KXsQPlfvmwl6S5qvVgFyA+t3XA803WOMf8AmIdEX?=
 =?us-ascii?Q?M6pTscK5BCjxxMbKg1xfCICi3XW0QvJjkRXfYCc3e2U413ZjBrGwjwWvVM9y?=
 =?us-ascii?Q?76/FDaaDjHbmKBn54DPoPiSWdRTHoSSqm666rO5SfsYImAiDKqiUm4Ophzen?=
 =?us-ascii?Q?Mg4IS/UXcuYitWAxBBHMDrAkpEmkYnxhl5D4/12IhIGCSgGHkW3JnomBOhoP?=
 =?us-ascii?Q?0AnuvHIH3FBxTNF7wgUfrOo/ndbtMmX24/hhq4tz2Sh7h+FmUE+2YcB1NqDu?=
 =?us-ascii?Q?hCp2cK0toyc47+wV8WTYboWfHwzxnziAd5+Z46HQwH5K7vJ7hGm5ha7JLdXY?=
 =?us-ascii?Q?jS8vEoe8c4bMGhjYb1NVtillnmlPwDjRFng0Vc8WqD2Bx5yphMVT8dXmS77r?=
 =?us-ascii?Q?aoukGL7igrkoXfA3/p7vkjumn/SrlvpC4KLKp4SjWTxS4obLqjACwxjduaAp?=
 =?us-ascii?Q?1lc2akv2pEaD81wXW6lmlAC1Jt19z7xLPoluuu2P9j3SMQQ4u7r6FhEAnnkQ?=
 =?us-ascii?Q?3CaGJXWZbMtZ0NjLKsl0XvD7h64ge+dogUHYwC8ybrh38NQNfWkBfZ+xMlMW?=
 =?us-ascii?Q?+CEsuFHqOLDbB5Vnjlq1em2Ap/BGivYyLyfiQl8ty//kV8PqK+zP4wag/p/5?=
 =?us-ascii?Q?Ut9Jkqxz7qv+7HVw/SMcrFOC0+Mw3I3EPRJ2fjOOPN3L9t8eWNgopFNInBKx?=
 =?us-ascii?Q?cl1WwQclsQuNJ0pDNQ8IFjByESf5/hCKNpq3OyjMLGdIp6QYeeGDdocFHbtR?=
 =?us-ascii?Q?t6WXlN0qZ7HK4CeqEtSCUKTfNKXj4appFE50TMAu0oY2h/sO6bkfZ5HcAH/V?=
 =?us-ascii?Q?LrN+Gj/PHP+smrXtt4FoA8UbUFc9Nm/aq0O0Jx5D3EsFhaUrBU91hkFqUGyc?=
 =?us-ascii?Q?V/Z36StGO1J0Duz8eri2ZIkNxFIZ19ws9O6FTZms8JdvoqwEnR4YSEBbfZ5u?=
 =?us-ascii?Q?PEMrIHQNj5x/mev5QT/ONxApDa4dLFaewCae3lCbyL+MTFILj9g4DB+U/S8k?=
 =?us-ascii?Q?uHBzGrBayXcfZ+J/sRRlzTlx9Wj1n+6bScD7fEul+X2rGgdkAWRfXcCAFrwy?=
 =?us-ascii?Q?gbw0IdOgm2r2eVL9USKACPu1ObMESeRdLiDEWzkyZJQxPQfryG8f4MMS/I0z?=
 =?us-ascii?Q?MM2ng0f9MQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 09e3c7f7-436f-4a39-ee6e-08de6cfbf050
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8468.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2026 01:37:26.1845
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TOT+bUDPsBtfGspicC2nOlqpumWj0++auvYQcMzkZ1GUicXTfvEZY8FLpVxT+xBkPb/eMBYq9W4B9Z00xvZ9ig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6160
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   26a4cfaff82a2dcb810f6bfd5f4842f9b6046c8a
commit: e6bd92bb204757a7b1f4b4dc263a82b3985fadd3 arm64: dts: mediatek: add device-tree for Genio 1200 EVK UFS board
date:   4 months ago
config: arm64-randconfig-2051-20260215 (https://download.01.org/0day-ci/archive/20260216/202602160122.o6LTcchQ-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
dtschema: 2025.13.dev7+gd16dc68b0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260216/202602160122.o6LTcchQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202602160122.o6LTcchQ-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi:1172.7-1180.4: Warning (graph_child_address): /soc/syscon@1c01a000/port: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk-ufs.dtb: pmic (mediatek,mt6359): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
>> arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk-ufs.dtb: infra-iommu@10315000 (mediatek,mt8195-iommu-infra): interrupts: [[0, 795, 4, 0], [0, 796, 4, 0], [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml
   arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk-ufs.dtb: jpeg-decoder@1a040000 (mediatek,mt8195-jpgdec): 'jpgdec@0,0', 'jpgdec@0,10000', 'jpgdec@1,0' do not match any of the regexes: '^jpgdec@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegdec.yaml
   arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk-ufs.dtb: jpeg-encoder@1a030000 (mediatek,mt8195-jpgenc): 'jpgenc@0,0', 'jpgenc@1,0' do not match any of the regexes: '^jpgenc@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegenc.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

