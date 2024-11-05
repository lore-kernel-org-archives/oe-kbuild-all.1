Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 945051FEFAE
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Nov 2024 07:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730793257; cv=fail; b=Hq02SMUa2jIaZRXmsUgpLTv+fop2Ee9IqvQvUFOGpkh/p5Jz7VChVRZBStTSnGB+W6ezA+L/fim/wZWJoF2gE9DRG0qgk3QGLZv+mM7RBUFts47BxFhKHSuselMXewf0Dzq7w7K9nsFb0/Zo+iQtKZUv7MzchHFKqATELf60mzA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730793257; c=relaxed/simple;
	bh=cnZecLiJYQ3KyJA+1MewovBVKoy28InPnoRNq/A8dqU=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=HvM1JOavrlXldBkJqslHU1crRQdO2CrAXM6kVQ5rDBBhCAQgFUz211Txvr21hIF295+A6W0jizukm0EpJMl9zsdH6TDK3+ggWSp7C+c5Cdl6raU5cNUYd9SI+zUE9FCISabhF4x75ptda0O4mdDq3IQnmDvst9pZT3butHCYxrE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kYbrTpxl; arc=fail smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kYbrTpxl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730793256; x=1762329256;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cnZecLiJYQ3KyJA+1MewovBVKoy28InPnoRNq/A8dqU=;
  b=kYbrTpxlpQ44lJjBdr89K+bzHSXoxo3lrcoqqjFnIcmtIN0v20Krj45g
   Eeu9WU4GfobT9Hc7POQVkAD8RW5dFcLApTWmyixzSYfXtK3tSTv39w5oo
   yKQcel5MV4khyHQc13t3rBt4ZdbWsrMyZZ3Yhz8N+8SIQ7umZILLsX4UG
   lME2Wu7iTwFO+kIK0WnPvAdEqhqPrUX+LgnxrJ/C1oJxub5yvRxzO0srE
   /UenlxUxtPcxRV+cIJMM82Hj9YRkxyI+Z/9jsBRJkF0n7i25CuqfYskdl
   PnXPsAJUmZxTAswDo0/o3/v4Op+TiXilgJqFEMSN9A9kSx02SVP6V4eDc
   A==;
X-CSE-ConnectionGUID: cu8rPTG/Rxmoxo5yrDOJCw==
X-CSE-MsgGUID: FDZxWDCHQ0yAdfofx73Q3w==
X-IronPort-AV: E=McAfee;i="6700,10204,11246"; a="41894926"
X-IronPort-AV: E=Sophos;i="6.11,259,1725346800"; 
   d="scan'208";a="41894926"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 23:54:13 -0800
X-CSE-ConnectionGUID: Agb+R1weS9+6Wjinv47EIA==
X-CSE-MsgGUID: EShFJ4XGQpel3N9znyIF+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,259,1725346800"; 
   d="scan'208";a="87855267"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 04 Nov 2024 23:53:58 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 4 Nov 2024 23:53:58 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 4 Nov 2024 23:53:58 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.173)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 4 Nov 2024 23:53:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XIFP7Qm2jTypTDS1uqOy70ktFemk++vHlDmUl7IOA4I5Gf9TikaOlc9mb4sKZASnxFAI88R8WKXJDOvsGvoBEh41UwuxScdmAPwubAQK0FOKyZ+3lcfFcEK0+DHko2R8FA4+q48ftiR2PMF9oKiAI2oR1FSqoNTs+U+WOZ/kWfIavnAFZQw/eCKB8+/tnq1U1KDdfKZHn+wbhGe/VH5QHqECearhayYrvLkSnPjtM/WiecEOt3DA0k3T7z9G5FnDO0AJ1PncIOFL7TOGvf93h/+8QH8I80GvjQMmtcfpPvzK9WRG8sZgIk+8F9BTr6bHaUTO2rRPLY1YpN21rZXUzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5BGx0f7HayQpIFJ7pXvcWMY6GPZ2DekrC1phBRov5J8=;
 b=UT5e5HOVd5v4j3C7WYNf8s2FbwSTKsFmH1cEI4d1yhFzG7V+7Mec9nNq5iRJ9sCQxtx5KcdsLML0awuMQzE4jC0n9JgTLdjQe0iFjJ6RJdTwtuDm4ECzgTgpRFn5adwOZD68y3IcpHKMmC07oBAIPZvCz6KBm06Ij0xFUGd/c+ud3Kvz79Xv+6PB8hKX3stG5RTswuKKBYl1sYvLpBuiaZOPtMKbYPiAgV2k1F/dWWDjziw+8O+fEavhpZULMHYb6lID3FDAebL4ohpa0YZZXBSSQfnB3+bSFV5VCNctAp7z6LLYveSTbNViVw0CKoo68WW8brkqsGUe0/wi2Kc4dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5420.namprd11.prod.outlook.com (2603:10b6:408:101::6)
 by SJ2PR11MB8498.namprd11.prod.outlook.com (2603:10b6:a03:56f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Tue, 5 Nov
 2024 07:53:51 +0000
Received: from BN9PR11MB5420.namprd11.prod.outlook.com
 ([fe80::7a2d:5b5d:f9ce:594f]) by BN9PR11MB5420.namprd11.prod.outlook.com
 ([fe80::7a2d:5b5d:f9ce:594f%4]) with mapi id 15.20.8114.031; Tue, 5 Nov 2024
 07:53:51 +0000
Date: Tue, 5 Nov 2024 15:53:42 +0800
From: kernel test robot <lkp@intel.com>
To: <cros-kernel-buildreports@googlegroups.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [android-common:android15-6.6-desktop 1/1]
 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dtb: /: failed to
 match any schema with compatible: ['google,pico-sku1', 'google,pico',
 'mediatek,mt8183']
Message-ID: <ZynPBndmRkN+KkFg@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0174.apcprd04.prod.outlook.com (2603:1096:4::36)
 To BN9PR11MB5420.namprd11.prod.outlook.com (2603:10b6:408:101::6)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5420:EE_|SJ2PR11MB8498:EE_
X-MS-Office365-Filtering-Correlation-Id: 5447f096-0ce0-48aa-2e39-08dcfd6efca0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ZLufn2gXdgJT0zBGSQAIYRbgT2ujZnWt4rgN+Zrl21ryfXXcQ+wTqNf1UVkl?=
 =?us-ascii?Q?f43lZIIVZahHsylFZH9DZye3sWArjapZQCqHdzi5D4IyQ/4eOLCmgmLz5UKT?=
 =?us-ascii?Q?SdXGTatB9XpDOJ+5JBVMCOqrQEjlr0Q5iCxTUXp11MjDZUoAIGJOUcQipQBh?=
 =?us-ascii?Q?AQxirE+hx4a41rDEtQ54hkjWbFSYDb4+7OdvtBbxi7n4ydhjgexP08QK8Sjy?=
 =?us-ascii?Q?Vo3taJTf9mYHdn5ts18vk95jKY4aErpUghhPpigBRkkpqrO7ataC4CUTViZo?=
 =?us-ascii?Q?T96aX0U3FeVqpmXrTo/NYlyJWht2TErXPbTQXOvnWXSoOdqUh8RKJjeGlUIp?=
 =?us-ascii?Q?+P01bxSLek8t5+9jsCfS3+pIQ1qOWS5K8KhqXasaF/8uRZOgJ/R3bjuVvrUR?=
 =?us-ascii?Q?xTS1IDq1TUPrYfGIvivZd4fybN+iUcP8WUzZ2ZDNFqPMIuJ9ynHfKdyVKZLG?=
 =?us-ascii?Q?VvFjqhNjdxueNgiatdWtLaXXe0qzMvPPf8rzJufEBw5oQSNv+0YH3aacBUFp?=
 =?us-ascii?Q?vGeNXgMT97VRWTk85BLFC8BSYcU4x8JNDrk2W46aUIlY1PQDFzw85BZEyXr+?=
 =?us-ascii?Q?3PrhYgP70Nq2pmz2+otnvUGWOwOokO4z7eHeBE1/b2eszCtEx0JfE8cOZYTV?=
 =?us-ascii?Q?2wwmcgphwEEiwtta1wgebgZGe+wZ8Oa6r4Yyaj6GYN1piSd6DBe1ShPHoEwu?=
 =?us-ascii?Q?0zGTAqz9Zz34KtvSmlmCG6M6C7yCZ7GQeWQsVqo9GYdLkDFW6d9LNqgeyFQ1?=
 =?us-ascii?Q?hXFdmtry7+iYKZKKCJb/IjAx2hdxsvyCabZ3g2gpzjGjXVDSib9+WQsMJJFm?=
 =?us-ascii?Q?MQAW9urIB4gwP0jQgjMUvO98+QMz0mZPDDNDps2hICae0vTlUFEsLv1UqGFR?=
 =?us-ascii?Q?kWZ8x2TY0LQ1QKUR/4K2LZFRSzPBMbF2x/peAU0ftu48Hsqw5Rpm33h7wndU?=
 =?us-ascii?Q?cxdscC79jR1K46w91K/b3AV1zWkFuc4uet8ftl2ma0TeEn65JhX+4sQ+kQkL?=
 =?us-ascii?Q?aJtxhLb9VXsu0aiUqnbcG3rudeLGucjA9t9L06jm0M7QixhPfEyD9CBMchbk?=
 =?us-ascii?Q?bo4CWA49uWHmvzzH+qPbkUYcfGOVQyRVqWWTf0Dq1ifIRuACu26ID4H6SXBM?=
 =?us-ascii?Q?VXutTKkzoBn7hXaAKJcq+ry8oCEPN+FukxvLTESXvcW8GiiDh7bTCgTB3ZZs?=
 =?us-ascii?Q?b8DvY6PJn9SBtxxsvlfuuXIXOvMJBPcfE13hsZ837jsRkikZVBAGtrgklfFP?=
 =?us-ascii?Q?5jpU5pim5GfBQz1TTbwNKR83JvyJa5L3PYbV9LcW1Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5420.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YLRHFMDaihkcuTbL83frLmsPHIC5O28t0ntSk04ii9WLjlOSodLEDxsVRULP?=
 =?us-ascii?Q?60VgOwPYcsynyvvW069MJfUPiPs7xhL00+o3THmN9vv6KuZuRt5vRfdLh+Cn?=
 =?us-ascii?Q?ZRaEN3Obw7mQJRK3wT4WETAVECD6s8BWm9BHrQhoFSkirrmnTVBOkfOL2YhK?=
 =?us-ascii?Q?39tHwCXjnY9ykLCK7JzDuN9awEUFOGvqJcMg5RezQvqCckZkmWGFWDpQVLrW?=
 =?us-ascii?Q?T/J87z65J7eLxAz6Symq6h5zANtBb1Q5uYjKvvo2YHKV4qXZUvLgYbI7ctlB?=
 =?us-ascii?Q?3sk73af6mYXN6+yfAO9sJf3Oe5hemr5Cn5aVLPbmy2viWn3rm5l+NhJrLw8N?=
 =?us-ascii?Q?AhiOwMaM+OQyMrTk9JNiAwj/q9898/NLmsdeThEGWfD4EAv8SAOsxaFIMg3P?=
 =?us-ascii?Q?e4zrrdxp2JTk2/PAIeedgvQJfCOh2zfsbEVKOtQ4zt4vQvPIDoPtCZehBOjW?=
 =?us-ascii?Q?Nn+awpaTRZMV8Ke2pct5jH3ufThy0Ua7uBvZd5yLcAHmFlZmr8BkyV/PSgfn?=
 =?us-ascii?Q?0rb5PsZovFd2PCepouVjTSLlRZYeh/32VfInzk5KfOqGLlXx/hYFqDH0cxv2?=
 =?us-ascii?Q?fkmo7lfcOIb3u2ta/iFAqzJHv4aJw7lTIZ6YSb1ENJ8MnoKUyJ/Bgl5j3dPa?=
 =?us-ascii?Q?0cS9hxWkmd09hXH+7tTFTdzm+Q4N0UvmYG2wEW0C/7LBxOg055l3rQBuZ3pV?=
 =?us-ascii?Q?S/XlIBMH1y3cSUZOoCBwYf441FVY+rzE8EmzebaLgehpPDQDS39He8WaUCCc?=
 =?us-ascii?Q?Y2qhrZS4Pg3wAVslqjkS3tOnJ72+OAUG8KBhC5wx0vnqNOTRUWY7ZPma9ZBS?=
 =?us-ascii?Q?5Uy0YfmQgIhnttP5+cf+lO2/F4AP6n1W/p+8Nqi4DCacPug6I4q7ve54tj3G?=
 =?us-ascii?Q?FZfpxYa3ywM77fb4VHjr0YQJ/UMQlTyjL3EfZkBxCnhONMLZfULEo4/o/U4U?=
 =?us-ascii?Q?X+mqgzcNHrVu2ZAkQwS12PLJtSG1vWxD5inq/OjFWsO/ZG0C6FKnsh/b7lA7?=
 =?us-ascii?Q?9cFw8yq/hgXUofun2Y4iWcIzKuBXYr12Fwvsdg9lFWgxj9Dt1QG9pbPaKC1L?=
 =?us-ascii?Q?TmxHgaR6xMPLVHBrlDulKFM0lXHa2+YlmyKNGFejrjRATEn1wzLVbvWnxnyh?=
 =?us-ascii?Q?cWxjXGzcHmG1cMTyIxHBeYnKJGU/Fm17KOsOu814uA9VgMxdSak7bCjm0JAa?=
 =?us-ascii?Q?wHlKCpyoWjlDuv9fPGQcLt78opBKlYyfFiI+I2MznZMR5b+wfagmHBssBV2u?=
 =?us-ascii?Q?Yw6zWFT3aDGkDyCKyA4mJhijp9KJF6yAfVudT/WubGO6EpIbXYaH4GXdzZ4k?=
 =?us-ascii?Q?x2tr+3T/BMf1rcs8vNxGE9LSAErqX0WSdwfBl3XjqrdW6/es9fKOcR49xgYQ?=
 =?us-ascii?Q?ruOmV42VfZJXuwctq8O2/C0IAC5qjI63H5YbqRKGUxk3NWWAQnP90tymyhgV?=
 =?us-ascii?Q?Jh0AlXWmYke7SBaNvG/tHmYyM4jwJH9vBkCYf4iTjs9a3yQ2KiwBZpNBojdT?=
 =?us-ascii?Q?9VzSRRSNRWKhYnq5NOs6ph2+zY+9eMpGTFrtYEgm8kJlCV97kMzyUSNW9v48?=
 =?us-ascii?Q?Xq4SqhqyCiX2T7UA5KCeBbNDPD7XRf1uTB84hJYrdvmxKz2vnl+S8XcI1eEI?=
 =?us-ascii?Q?oQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5447f096-0ce0-48aa-2e39-08dcfd6efca0
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5420.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2024 07:53:51.0190
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eTv4eOoovFx2uw81IsiDtr81scthbvYBMHyA9/h+pKbLT71fLiMXkYkx/GGkJxNc/S0CL3x4kFVZq4XFUZzxjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8498
X-OriginatorOrg: intel.com

tree:   https://android.googlesource.com/kernel/common android15-6.6-desktop
head:   81bd1eb3862e37f2ce6e1148ed51ac214ab5c007
commit: cbae8f3e9b30d9136bff1155071d3d2505c45e64 [1/1] CHROMIUM: arm64: dts: mt8183: Use icarus dtsi for pico dts file
:::::: branch date: 4 days ago
:::::: commit date: 6 months ago
config: arm64-randconfig-051-20241030 (https://download.01.org/0day-ci/archive/20241104/202411042239.YItwcZ1v-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.10.dev6+g12c3cd5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241104/202411042239.YItwcZ1v-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202411042239.YItwcZ1v-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	'google,kakadu-rev2-sku22' was expected
   	'google,kodama' was expected
   	'google,willow' was expected
   	'mediatek,mt8365' was expected
   	'mediatek,mt8516' was expected
   	'google,elm-rev6' was expected
   	'google,hana-rev4' was expected
   	'google,spherion-rev1' was expected
   	'google,kakadu' was expected
   	from schema $id: http://devicetree.org/schemas/arm/mediatek.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dtb: /: failed to match any schema with compatible: ['google,pico-sku1', 'google,pico', 'mediatek,mt8183']
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dtb: /: failed to match any schema with compatible: ['google,pico-sku1', 'google,pico', 'mediatek,mt8183']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dtb: /soc/syscon@c530000: failed to match any schema with compatible: ['mediatek,mt8183-mcucfg', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dtb: /soc/interrupt-controller@c530a80: failed to match any schema with compatible: ['mediatek,mt8183-sysirq', 'mediatek,mt6577-sysirq']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dtb: /soc/interrupt-controller@c530a80: failed to match any schema with compatible: ['mediatek,mt8183-sysirq', 'mediatek,mt6577-sysirq']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dtb: pinctrl@10005000: mmc0-pins-default:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dtb: pinctrl@10005000: mmc0-pins-uhs:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dtb: pinctrl@10005000: mmc0-pins-uhs:pins-ds:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dtb: pinctrl@10005000: mmc1-pins-default:pins-cmd-dat:mediatek,pull-up-adv: 10 is not one of [0, 1, 2, 3]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

