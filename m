Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26FA723770A
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Dec 2025 02:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764728756; cv=fail; b=BT5Ca/EbyZm2ExMcLcDKQ8v5u/SHIfPfkR18S5ukmcCzRSJOKGe/Vf9RNUH3uUg9wjET24tTOM3y476eDdmJbi4hE4Mcx7OfPWDIH6HeusQ0DWrlgOBRtgh+Jge3VtqUAMNSWKZ7yxhRP0O2aoIClJJ55CJBMqpNrAPLwk2d5mw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764728756; c=relaxed/simple;
	bh=gTUzBBtYrSVhl4r+DGteOVZMgsAzZUIjDFVvfPKkVUs=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=NRNDkxG7cL8EHeUs6rI+73ry31ZxhrEXwJKFpVG33Yvj0PIsaP8I1oxJ7tWFlTpvY8r8zszAviuXV6GTUFUS8DltaPbgPF4c5GnXQ3QTEa2IGIero2dlvbQ2S6krWHcc9ulDiEJ5iZqeXszFolyqBPUyP/skOrGWBbNRcFElrXo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AfCf2Ib4; arc=fail smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AfCf2Ib4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764728755; x=1796264755;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gTUzBBtYrSVhl4r+DGteOVZMgsAzZUIjDFVvfPKkVUs=;
  b=AfCf2Ib4kD7nOl0phrPhaYfy/0POE4rOhSVkKSYqhBTQeq0h5XsmHUBK
   VFgQ3gr0c9GwxEMx9o/dWzgfEthdPjgVPGLw2T55y68Shb9ptAMXpPUkw
   2AMRyElZqRV6cuSnEFuJRftNQSkrFKfknmqtYBh91S+H2xFnV2nncU7Fh
   InP4h4uJsSNHa1WeK7iXLAgnnoeLipuoxQAup0qXiO5BQYEAttCT4fIU9
   3yqxy6zvagvr0CiVLZQlIAY+P9bxfWmCcTk+8l2QMwU8nIagO95CFDu/V
   LSP5JnGW61//Rt+m/mlwdtoKDj1wGShzso22JBfMQo5ppgVBD5h36Qwmz
   Q==;
X-CSE-ConnectionGUID: n4Fb7oStSJSZfAqZmv5JtQ==
X-CSE-MsgGUID: 2Dz+EM4dRQ+2YkTkTDmRCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="66602201"
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; 
   d="scan'208";a="66602201"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 18:25:54 -0800
X-CSE-ConnectionGUID: OliNIXp8TruhDeSrkUrptQ==
X-CSE-MsgGUID: VKIKOLMHRwyJtGSkXzxkVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; 
   d="scan'208";a="194967910"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 18:25:53 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 18:25:53 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 2 Dec 2025 18:25:53 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.24) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 18:25:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UUcouYXhKs29je6wZjY1/Fx6hLz+PbBy9BlW0aGXYMZEGKAQitcFCoXXGTCTqZyXzsBEEfJCZ5kUx7nTJYLkgSS18K3r1al5nq/MkdGZYPh14HBea4RBmA6Ne46CtW+FT4yXbaQMuGg+NEgBENRJ+YSxQIhgCZvdxZm5qeHljqdVbZnF9ZjAQAlWRZ6h1zjSMZam9FKkuAQO7t3WZc+T/X5QzGQHzoy7zlM0sjNuNzZWQmGuZDltdp6DjCJyJGZ7XpAmiWu7pP3EJUyqINJQ5TwE1u9UXly9ie33iG+Y66WFtOHGmNSHxJCBwqr1S2cmIuOZJyPNmzwXM2bC+ao/hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oSW6iV5ZcnUBzjkRgfQMwYapiSqwfjRvoYZpokreouI=;
 b=a7PvFEE+axjbb/PW2ZeAhDuNMn9bTu0tJkBc+Wc/AHkcOXTXZjA7G+1lMxgP7QOwkAgrNP+BfcVRKDaZpmBydHPOyid6ONWo0UPdRLQ1t4qbynw7YrrzEiwsEwVLJPKd0ugro7OkQl+FQkLQ6Na4/pjCFagxZbfBpSBWTgtseS8dpZ7mJmJTyO6mEVbyqbh5IgzPEXvlatDS6pHHHI4T5itu0KHMWNCXneQL+Qg3u2OP6sm5P/27lSnjFGL0lqCwEeC8WtTktRiX1xJ1gHfMaB2hI7ElKsQUayQ6+HHDU94BfiE3INBCPqfGVPT4hg+6qzLXrcLiN78wDNhqm2PVhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
 by DM3PPF1CEB6B7EF.namprd11.prod.outlook.com (2603:10b6:f:fc00::f10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Wed, 3 Dec
 2025 02:25:51 +0000
Received: from MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9]) by MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9%5]) with mapi id 15.20.9366.012; Wed, 3 Dec 2025
 02:25:51 +0000
Date: Wed, 3 Dec 2025 10:25:43 +0800
From: kernel test robot <lkp@intel.com>
To: <cros-kernel-buildreports@googlegroups.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [android-common:android14-kiwi-6.1 36/36]
 drivers/dma-buf/dma-buf.c:413: warning: Function parameter or member
 'dmabuf_info' not described in 'dma_buf_account_task'
Message-ID: <aS+fpwm+9levt67l@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0168.apcprd04.prod.outlook.com (2603:1096:4::30)
 To MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB5963:EE_|DM3PPF1CEB6B7EF:EE_
X-MS-Office365-Filtering-Correlation-Id: f0a22797-3807-44ab-1f9f-08de321346e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Qcs/Uuj0VUgV3v3zgA42Pm9s7c5ASd1p7cAoP2c8lozPSMt/9aVaFGCixoHD?=
 =?us-ascii?Q?8920a/woXfJfL816NSLw7Scx016iWgZj2ILMgeXXrqHmE+Pzl2PwjZ0E+aqa?=
 =?us-ascii?Q?4XggfNrkZCE6frA8zsf9VkFNVli+992SLQ48aQ2qn9PE8F1iCtjGlCmH3SvR?=
 =?us-ascii?Q?sc5XbhqrutY+9QW/JJh9GvEvdYj1TM/XpQ9kTOqzr7ZhWCabTlpgQ5b4b8Lg?=
 =?us-ascii?Q?IJ8QMTATE+a36+QlJWINJ/z/ZQKrDXqVDyOJF64MFfMg0UFuStbrNaFoqbtd?=
 =?us-ascii?Q?oYkM6lRqx5GMh6zUeTfNu6aDcT1lSODlAFKgodhus6UzOzGLjMCxOUM9wN+A?=
 =?us-ascii?Q?kR9K2siYbd/JiEyRcffQgW0Taicn81S+vAMh8rDjDYbKBURDTUC+bCCUOfOU?=
 =?us-ascii?Q?p5VHtCzUpBmmq960nWxAr59OF93o40imea+x49pN6t5aYTPZTpGJ3S3T8J9x?=
 =?us-ascii?Q?RCH+ogO6Ab2hmIuXWwJpn+cC75CpC49oMOp3JxI7jf6lkTvTJ7SVVuHgTMNI?=
 =?us-ascii?Q?oLJzeFis2XggGXwpNvjzwxOAa4JTagAwS5qU0a0aIJsLCwjZw+HM/zFg9Lqe?=
 =?us-ascii?Q?LZlJn6HF36Jv/y7cLlHqSQgxco0Jhm004bIUCpsqPBYZzAeI/1OLpHLufhqp?=
 =?us-ascii?Q?3vySGTJiy44G66uYz+qPVyyj50ALQu7r/umeCBhRsLtemtwGYUKVnjGKslUe?=
 =?us-ascii?Q?H/Unl32SWFV1au58cI+0f1bz8t4AyCtKi3aby9wZwj2D3JQMMGhR8pi0kULQ?=
 =?us-ascii?Q?h0PaRab928B6kxVdbodwHS/swgeSuy+YoNmZ9A3rcX6DEvzsOx+JDV5l7DZD?=
 =?us-ascii?Q?4AEcBova19OUpAcYsoQ3Q4jPUY24Li/4ToKSuZM+2tlTglfkgvrZmobL+Qnn?=
 =?us-ascii?Q?nNAYWr04PNZyc4B7nEE/hl/MjpPB7bIQ8c3Pd2wLCmobgLqY0D6icWFQfT/u?=
 =?us-ascii?Q?saP66VVPwD9ARdYeD/0iJ3CHv9hOP2OF7HMTn11LZNC3lzfMcAbRHryShqZI?=
 =?us-ascii?Q?oWL5xefInj1FH1m1B2PeqHKhSLJH5R8nbXzRshLCselkOBYjCdsGo+ttSM7o?=
 =?us-ascii?Q?00+4uQFDTH89ilUzUb3evzeO2Hde3CIllvodrMfMq3saijfhitmUyKx4b4pf?=
 =?us-ascii?Q?NhwWTZ7Ipwdj1TGqpdUkj9NVDVLDTWiejVCLxvta2OcQCzNM2wLjlDkR2JrC?=
 =?us-ascii?Q?L2Oyy+RMtR1cueD7BwtwMqXyq18K/k3GMocPPQfq1tzJQ/oSu3XhUcM6nwUC?=
 =?us-ascii?Q?8b2KWqe346tiTcirjBb4WiuXjfXyjnUb7eXUeT2bRsKFqzKP8aSFxfpBgSvp?=
 =?us-ascii?Q?+bjqX/QemdUaWlWwpzv4P2/+jkntA3PnPKzWlYCkLOqj/MWRyFyuzzIkHNHN?=
 =?us-ascii?Q?nFMRhk0U+5/EIipbtKbqxIoT7duf+wIlDjSCAsWUNGq7m7gS+WPKRO+hV+2c?=
 =?us-ascii?Q?prNtgxLQVcIY97hk3hNQYeUJSK00Z66G3zEKHwNUP/jYF78JcrVU6Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB5963.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Nyn1qGI0Of0S7lZwh7qs9nAcCt23a6tb5ZjOMEuBOXDgL7wZh5KgPXuQ0m7d?=
 =?us-ascii?Q?zpqtzm3nZy3wFVZWzCdz2kP3rPGCt8c+DAg03uO7b5Oe+Onz2AbAVn55tfm0?=
 =?us-ascii?Q?pDyWz8vHTTHsDPu7yj2xxAkr9ksgNEKYoJUnNef70tqkzU0wDfxSMmevzRpU?=
 =?us-ascii?Q?w4vn4mNbc560kQlYUtuqoo7ggLHxDkIm7Mk1TQq6bVSkr20B6SxWMiQ7Z+eN?=
 =?us-ascii?Q?7eaZ3q+pYepe/wGmTdqntY1+Gs55e7xaBgcrEN9FCHpP4d+3LfJJrGWEPewv?=
 =?us-ascii?Q?J3rJmTqms/lVSs6xn6i1JN2pfFIffyz9Ds/Ben2rD29gsbi4QhQzW+iO0xkG?=
 =?us-ascii?Q?PxrXdzlU9iZSIJ3Vy3XOfkEd9sDdcguwS2QWiRNMwWaBoyT3MGppLxSBrPQ+?=
 =?us-ascii?Q?zZ4/btxZkUmUVO4J/gk9e503yOV4jotE9DUAbMdnDLPyqh1Uz30S1bcSl3vh?=
 =?us-ascii?Q?zSsiVTgyHJjYx9GDA3YCDp8mXnXSq7HS0xUkEw+redIM2cXIbswHg9JAxZht?=
 =?us-ascii?Q?om8oWvEAvmbZOJFoqe6MrSKd7yfA6qgeTrD0wvra4UJFj5Fq/OKcyY/Qdx+o?=
 =?us-ascii?Q?FIgUfeDjx0ywebcEHQ2g00P60vUjNcdl1OvWonLqFpmb+1OIsEcYbRPviKe2?=
 =?us-ascii?Q?b0097UnJTEB/7PWUJFWIEAUQLPoaNSRS22C1HBmKljNC1yYfsiILiUWFUQFT?=
 =?us-ascii?Q?4opXdgi0HCRJpr2CU05xp3crlNYWtx4gizjnu7XtmVV6sKH02arNdUJavj21?=
 =?us-ascii?Q?2a76IwBlC3CTc6z+yNqZuB9q/nUoGcEUO2m683HZXMSKP9BIUCyJYCmZr69y?=
 =?us-ascii?Q?B+32Iny+QDRizH8w0mVk9D0tPaUT3Rh8BBgI6GQFwzih2f7UUSploSez8sr9?=
 =?us-ascii?Q?Kj/lN7uJZ0fK4naGua65QdlwLFv4GjwH6ik4jeSSPAEmXolHUy2yux3JUaCy?=
 =?us-ascii?Q?kr1pSh37IlCeLOYRDSn19nClmeZRorsf09WDhNrGkoBK8ygY78BzF6mQMfNm?=
 =?us-ascii?Q?ET5JHa356NZhov8bdfA8RPYTQmN80zEey/AaYl/MPT4O7NjoKPLp/en8OnBt?=
 =?us-ascii?Q?c9RF1uEg32XBr4tPjZDMf/1twwF8rSWiqAFOrBxbxIQT06wKg2OQ2YluvTkC?=
 =?us-ascii?Q?5D21mIA5i5OFZD1/OmBlp2U4SMZJmNmFOYyBAok/1l4DVS8LFjkAEO5bNw4t?=
 =?us-ascii?Q?Vtsvdlbnw8nidHpeJDEXsV2XsDt0siuiBNBKtLTLO5MrZEnq/q7JWyudtET+?=
 =?us-ascii?Q?XTUjue0QGH5EmbgTRV1U8gaGmR6ayfPKYHCOmy+zpXYzbfr7+2xoB2BS1Tzp?=
 =?us-ascii?Q?Vy/pzg0tThS6OtZeUSIYk4aXODKUGHf6H/HfEU7q870kagiF5J0OHdaOj7PF?=
 =?us-ascii?Q?IF9nf2W9sTfk1Aasm6ZTFicZNYTTf0mkaICjpA+mKQ7XTFEAeaKz0eLIERBp?=
 =?us-ascii?Q?pp+KpghWao7d/eUlTCbJ/QJOT1aTW3kpYSP1KtDVBMaNk1chJV2u/8bnOeR0?=
 =?us-ascii?Q?a5hcmVxM97B2vmzd7WODdOOkir4/ulz7wyBiSuKfGvCGDCm1n/iKnZrnHMdu?=
 =?us-ascii?Q?GAFErFjIiGEYWfR81Gt/N5tQ1mK1gZKhFNusjm0y7A48y02nzCQfvcyA9djN?=
 =?us-ascii?Q?tQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f0a22797-3807-44ab-1f9f-08de321346e2
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB5963.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 02:25:51.1206
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yES8p6vM7VhU7Xv9IA/B9GAe7OGB7cZupoCrv6MhhdR4AXQ0Qst/raK5DaKoeF5hBrwBWI6hhoI56KxR+kWQjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF1CEB6B7EF
X-OriginatorOrg: intel.com

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   81ab94df653806720116e45346cbfcbf5e63df44
commit: 5dd8a05ba11a36d91c244d3e482a18a275e5d8ad [36/36] ANDROID: Don't use current pointer for per-process dmabuf accounting
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251202/202512021648.up3mSDhg-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251202/202512021648.up3mSDhg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512021648.up3mSDhg-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/dma-buf/dma-buf.c:413: warning: Function parameter or member 'dmabuf_info' not described in 'dma_buf_account_task'
   drivers/dma-buf/dma-buf.c:413: warning: Excess function parameter 'task' description in 'dma_buf_account_task'
>> drivers/dma-buf/dma-buf.c:452: warning: Function parameter or member 'dmabuf_info' not described in 'dma_buf_unaccount_task'
   drivers/dma-buf/dma-buf.c:452: warning: Excess function parameter 'task' description in 'dma_buf_unaccount_task'
   drivers/dma-buf/dma-buf.c:932: warning: Function parameter or member 'name' not described in 'dma_buf_set_name'
   drivers/dma-buf/dma-buf.c:932: warning: Excess function parameter 'buf' description in 'dma_buf_set_name'


vim +413 drivers/dma-buf/dma-buf.c

060742b3d06d5d T.J. Mercier       2025-07-22  398  
060742b3d06d5d T.J. Mercier       2025-07-22  399  /**
060742b3d06d5d T.J. Mercier       2025-07-22  400   * dma_buf_account_task - Account a dmabuf to a task
060742b3d06d5d T.J. Mercier       2025-07-22  401   * @dmabuf:	[in]	pointer to dma_buf
060742b3d06d5d T.J. Mercier       2025-07-22  402   * @task:	[in]	pointer to task_struct
060742b3d06d5d T.J. Mercier       2025-07-22  403   *
060742b3d06d5d T.J. Mercier       2025-07-22  404   * When a process obtains a dmabuf file descriptor, or maps a dmabuf, this
060742b3d06d5d T.J. Mercier       2025-07-22  405   * function attributes the provided @dmabuf to the @task. The first time @dmabuf
060742b3d06d5d T.J. Mercier       2025-07-22  406   * is attributed to @task, the buffer's size is added to the @task's dmabuf RSS.
060742b3d06d5d T.J. Mercier       2025-07-22  407   *
060742b3d06d5d T.J. Mercier       2025-07-22  408   * Return:
060742b3d06d5d T.J. Mercier       2025-07-22  409   * * 0 on success
060742b3d06d5d T.J. Mercier       2025-07-22  410   * * A negative error code upon error
060742b3d06d5d T.J. Mercier       2025-07-22  411   */
5dd8a05ba11a36 T.J. Mercier       2025-11-12  412  int dma_buf_account_task(struct dma_buf *dmabuf, struct task_dma_buf_info *dmabuf_info)
060742b3d06d5d T.J. Mercier       2025-07-22 @413  {
060742b3d06d5d T.J. Mercier       2025-07-22  414  	struct task_dma_buf_record *rec;
060742b3d06d5d T.J. Mercier       2025-07-22  415  
baa7a3655a17c8 Suren Baghdasaryan 2025-08-01  416  	if (!static_key_enabled(&dmabuf_accounting_key))
baa7a3655a17c8 Suren Baghdasaryan 2025-08-01  417  		return 0;
baa7a3655a17c8 Suren Baghdasaryan 2025-08-01  418  
060742b3d06d5d T.J. Mercier       2025-07-22  419  	if (!dmabuf_info)
060742b3d06d5d T.J. Mercier       2025-07-22  420  		return 0;
060742b3d06d5d T.J. Mercier       2025-07-22  421  
060742b3d06d5d T.J. Mercier       2025-07-22  422  	if (!task_dmabuf_records_preload(1))
060742b3d06d5d T.J. Mercier       2025-07-22  423  		return -ENOMEM;
060742b3d06d5d T.J. Mercier       2025-07-22  424  
060742b3d06d5d T.J. Mercier       2025-07-22  425  	spin_lock(&dmabuf_info->lock);
060742b3d06d5d T.J. Mercier       2025-07-22  426  	rec = find_task_dmabuf_record(dmabuf_info, dmabuf);
060742b3d06d5d T.J. Mercier       2025-07-22  427  	if (rec) {
060742b3d06d5d T.J. Mercier       2025-07-22  428  		++rec->refcnt;
060742b3d06d5d T.J. Mercier       2025-07-22  429  		trim_task_dmabuf_records_locked();
060742b3d06d5d T.J. Mercier       2025-07-22  430  	} else {
060742b3d06d5d T.J. Mercier       2025-07-22  431  		rec = alloc_task_dmabuf_record();
060742b3d06d5d T.J. Mercier       2025-07-22  432  		WARN_ON(!rec);
060742b3d06d5d T.J. Mercier       2025-07-22  433  		add_task_dmabuf_record(dmabuf_info, dmabuf, rec);
060742b3d06d5d T.J. Mercier       2025-07-22  434  	}
060742b3d06d5d T.J. Mercier       2025-07-22  435  	spin_unlock(&dmabuf_info->lock);
060742b3d06d5d T.J. Mercier       2025-07-22  436  	task_dmabuf_records_preload_end();
060742b3d06d5d T.J. Mercier       2025-07-22  437  
060742b3d06d5d T.J. Mercier       2025-07-22  438  	return 0;
060742b3d06d5d T.J. Mercier       2025-07-22  439  }
060742b3d06d5d T.J. Mercier       2025-07-22  440  
060742b3d06d5d T.J. Mercier       2025-07-22  441  /**
060742b3d06d5d T.J. Mercier       2025-07-22  442   * dma_buf_unaccount_task - Unaccount a dmabuf from a task
060742b3d06d5d T.J. Mercier       2025-07-22  443   * @dmabuf:	[in]	pointer to dma_buf
060742b3d06d5d T.J. Mercier       2025-07-22  444   * @task:	[in]	pointer to task_struct
060742b3d06d5d T.J. Mercier       2025-07-22  445   *
060742b3d06d5d T.J. Mercier       2025-07-22  446   * When a process closes a dmabuf file descriptor, or unmaps a dmabuf, this
060742b3d06d5d T.J. Mercier       2025-07-22  447   * function removes the provided @dmabuf attribution from the @task. When all
060742b3d06d5d T.J. Mercier       2025-07-22  448   * references to @dmabuf are removed from @task, the buffer's size is removed
060742b3d06d5d T.J. Mercier       2025-07-22  449   * from the task's dmabuf RSS.
060742b3d06d5d T.J. Mercier       2025-07-22  450   */
5dd8a05ba11a36 T.J. Mercier       2025-11-12  451  void dma_buf_unaccount_task(struct dma_buf *dmabuf, struct task_dma_buf_info *dmabuf_info)
060742b3d06d5d T.J. Mercier       2025-07-22 @452  {
060742b3d06d5d T.J. Mercier       2025-07-22  453  	struct task_dma_buf_record *rec;
060742b3d06d5d T.J. Mercier       2025-07-22  454  
baa7a3655a17c8 Suren Baghdasaryan 2025-08-01  455  	if (!static_key_enabled(&dmabuf_accounting_key))
baa7a3655a17c8 Suren Baghdasaryan 2025-08-01  456  		return;
baa7a3655a17c8 Suren Baghdasaryan 2025-08-01  457  
060742b3d06d5d T.J. Mercier       2025-07-22  458  	if (!dmabuf_info)
060742b3d06d5d T.J. Mercier       2025-07-22  459  		return;
060742b3d06d5d T.J. Mercier       2025-07-22  460  
060742b3d06d5d T.J. Mercier       2025-07-22  461  	spin_lock(&dmabuf_info->lock);
060742b3d06d5d T.J. Mercier       2025-07-22  462  	rec = find_task_dmabuf_record(dmabuf_info, dmabuf);
060742b3d06d5d T.J. Mercier       2025-07-22  463  	if (rec) {
060742b3d06d5d T.J. Mercier       2025-07-22  464  		if (--rec->refcnt == 0) {
060742b3d06d5d T.J. Mercier       2025-07-22  465  			list_del(&rec->node);
060742b3d06d5d T.J. Mercier       2025-07-22  466  			dmabuf_info->dmabuf_count--;
060742b3d06d5d T.J. Mercier       2025-07-22  467  			dmabuf_info->rss -= dmabuf->size;
c8372adc56a99a T.J. Mercier       2025-07-01  468  			trace_dmabuf_rss_stat(dmabuf_info->rss, -dmabuf->size, dmabuf);
1b269f8eb12649 T.J. Mercier       2025-07-08  469  			atomic64_dec(&dmabuf->nr_task_refs);
060742b3d06d5d T.J. Mercier       2025-07-22  470  		} else {
060742b3d06d5d T.J. Mercier       2025-07-22  471  			rec = NULL;
060742b3d06d5d T.J. Mercier       2025-07-22  472  		}
060742b3d06d5d T.J. Mercier       2025-07-22  473  	} else {
5dd8a05ba11a36 T.J. Mercier       2025-11-12  474  		pr_err("Could not find dmabuf %lu in unaccount\n",
5dd8a05ba11a36 T.J. Mercier       2025-11-12  475  		       file_inode(dmabuf->file)->i_ino);
060742b3d06d5d T.J. Mercier       2025-07-22  476  	}
060742b3d06d5d T.J. Mercier       2025-07-22  477  	spin_unlock(&dmabuf_info->lock);
060742b3d06d5d T.J. Mercier       2025-07-22  478  	if (rec)
060742b3d06d5d T.J. Mercier       2025-07-22  479  		free_task_dmabuf_record(rec);
060742b3d06d5d T.J. Mercier       2025-07-22  480  }
060742b3d06d5d T.J. Mercier       2025-07-22  481  

:::::: The code at line 413 was first introduced by commit
:::::: 060742b3d06d5de7b692b6e7340e90bb950769e4 ANDROID: Track per-process dmabuf RSS

:::::: TO: T.J. Mercier <tjmercier@google.com>
:::::: CC: T.J. Mercier <tjmercier@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

