Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3616CF9DA
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 Aug 2024 02:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723168994; cv=fail; b=Wos5SyDjgCNrceWihB9fui3fEXR69t89WaI7vUus+tjAbZXkqGIIT748MjR6cSltZUi/AOOu/TP3+I9ckcIif+wSduPSDmm4PD6pOvyPK872keRqMMFyLTLBLRTRa95EqDT2gDAhAdf7B//6WDmWt41Wftlb4nqHJX6U7347tKE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723168994; c=relaxed/simple;
	bh=Zo0jo8oBnTAdDCL7Z3LP8A5jTZNioIxyfiCrHmqymiM=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=O85gWZSBAwtYnMtN1iwn139eClJfbNJyuJWHFGGfdsoCy876NcBaa7kWkw2+4WbtBeR2GP5Jdj0ecjPVnpj76wAzP+B9jLpdg5Xye+yYO94cCR31hGMuK+batp4D7xWXekntfZ9cMv5U2YWYDhWbCZqgUUKe7dEaGRhnBHENb9Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Rh/a7tSj; arc=fail smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rh/a7tSj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723168993; x=1754704993;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Zo0jo8oBnTAdDCL7Z3LP8A5jTZNioIxyfiCrHmqymiM=;
  b=Rh/a7tSjNqZBs/kfL8RspQHrtyt/Xf5THKZW27d7Y0WNdhmWZvX9im/q
   XWk/sfov151X4+Wp1NEypAN5Z92wyBdSFdtkqVX+a+7lqI1KOrWfmdQbr
   6S5kOcEBZ/IuKLeUbIRot+eF5sZkpUwj7UYblWSiPhlQLxwFWB1izV2eP
   lbd165hwG1pvwsLHRdSO6quuwc7mp89zTBCiLrx9wqeIK0Abtk8SbcFUK
   cCjrspeSttbvJPlhTxbsNl9/5pctik36Y0Ynx7MQzWX32lat9K4rJ6jQv
   Uhj+JPGGuEq7LfC4YMALUkYgBXiBF9Ruu4to8TSobU2l1WWCEg7Ue3r7G
   g==;
X-CSE-ConnectionGUID: 4uufS3ECS2aMVN4qy590+A==
X-CSE-MsgGUID: RzYhtAXfQcWjsf8AufYCcw==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="32476627"
X-IronPort-AV: E=Sophos;i="6.09,274,1716274800"; 
   d="scan'208";a="32476627"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2024 19:03:12 -0700
X-CSE-ConnectionGUID: 3LVq5X31RmaNgphWR9UtAg==
X-CSE-MsgGUID: NHWUkRLtQ8y+LTY4Le5xnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,274,1716274800"; 
   d="scan'208";a="57077759"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 08 Aug 2024 19:03:13 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 8 Aug 2024 19:03:11 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 8 Aug 2024 19:03:11 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.44) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 8 Aug 2024 19:03:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MgDgInTMT28orXyizijVqvaOmnorkJn8brBERoOqr0M7avGfGTpk7jP7ow7ziizo5qxO2qBlCXCZoqWU2CupGC5CruSdcX0OFucutt8JY6RUEtiNQU53RN+HwOeKERkM+a0bi0dNAhNO3JmpxI5ZzHDsCS9Wgb8ivQyd5Ukwo5nyN1kXByH9/dr06d4GUGW4OU1BmVDO565E9vAAersU6jCOFCxtCPRyrjzOVIjqud13lgVmkv3VYraKR5xqn57VpapGXsj0MS3tJOLOHagdw7OCh7gbcO59ToWOHWAeqT5HYS3mJNegCEQC0BqG6nMoUmStRrzB8R1st1McZU2eQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3WYTv0O3jwEfcPlqqN95Z4pH+oPEkTDYnVysO83xPWI=;
 b=t57VYM6Lkdp923OhyIVvO73L+tIEDzLTbJUdl/C6rXSumY4MWJxZgrkXeAwfs/fHl4YIvpHqq6J183W8oXkcfg0YF/mHGlnJyevAtXdWfdB6rFyt/4C6+amnEGcJ4hN/UXn+tHsDjEVaThEezlu48P1nVKjXpHd+7gTeE2moDfH+JwWOCPyjjiD4t1Ws2NwWrPDQIAzECVwHRJQsP9o6ZJQwKDO/SWN55WJJC3msZBTfrGtMNkLY5L5Mt1gW0X03sDtkGYKDZ9RKX0hoQ8hqmE3Cd2zK0koUSP/AsdPdJnk9I8Axnf8nb9s8DRv5FJxlknRF8kZUSqiJsrH2Hu7UUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
 by IA0PR11MB7379.namprd11.prod.outlook.com (2603:10b6:208:431::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26; Fri, 9 Aug
 2024 02:03:07 +0000
Received: from DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e]) by DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e%5]) with mapi id 15.20.7828.029; Fri, 9 Aug 2024
 02:03:07 +0000
Date: Fri, 9 Aug 2024 10:02:59 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
CC: <oe-kbuild-all@lists.linux.dev>, Dongjin Kim <tobetter@gmail.com>
Subject: [tobetter:odroid-6.1.y 10/91]
 arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dtb: phy@fe8c0000: reg: [[0,
 4270587904, 0, 131072]] is too short
Message-ID: <ZrV40xTuZ7WS+A4H@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0165.apcprd04.prod.outlook.com (2603:1096:4::27)
 To DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5423:EE_|IA0PR11MB7379:EE_
X-MS-Office365-Filtering-Correlation-Id: 863b910f-b9b5-4161-fe91-08dcb8176951
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|220923002;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?hYrFNJR5mSi1bqiXQqycKfHp3HWQTteYJho1vcKCkFO4+Le0RsOjE8B0+F/2?=
 =?us-ascii?Q?kzfeZSQpL7BnlycX9UzpT52N1XXNQByxdZ1MniEVYo4wu5U/4XFeHumCHO/M?=
 =?us-ascii?Q?b+KaAbX95JasiVDobhlfyvd35+N29LDW3UxPBNCea39L6RurJ63kNwVXqGOb?=
 =?us-ascii?Q?MtFwu0xavHxNIzfSUae2YGX8XvnwqY3Dc3T0Yb+kMpeS1/Gc3N6SAZQWW6nx?=
 =?us-ascii?Q?bCi5bgbwPJLogpC9UWZa0FwC1pKkQnWsFNEDvM+dWvO/snr4BI97O1x9sV/m?=
 =?us-ascii?Q?EuZK3px6pjT0UFlg4mkkcnTedbUjnaRJrnWKVFMZkgTXnrlKOR2BNwlU2vEb?=
 =?us-ascii?Q?gBFivAbyJ/16+6+mas1XcIehmAZI2PEzbiP1RVfn5K7J/7h8utc+K7Fz6Yot?=
 =?us-ascii?Q?RsDpiozxR5OD5hnhJmV6d6ZN+QiVeAqw8azciom+IcL9H7BK/7KL9a8T64mM?=
 =?us-ascii?Q?/qWKVFRDPywG4ymvGO4GpDoQnihLNjnTKhnIhXswwR2d3FrraWquvJ9tSo9y?=
 =?us-ascii?Q?yyshE5qTWB+26kHC5LvKmoqnKhiIFiFcJ9v+NECGjlJ0XbFRW+PKx1jbaYAE?=
 =?us-ascii?Q?cl+aJ2RdITL90ZPfrXgWk1qgnGlPfqTCklmLzue1A9q+qud3ArrfPWqa3m25?=
 =?us-ascii?Q?98DxA1x1AxS0aUMIFp9brKiRJ3H02zxzKCN+L6ggNytSuqTGC2ySP/xQip56?=
 =?us-ascii?Q?0Wp9hzo42/b3Mnuk5UDRDCK0k9d4wCfYt4j9LGFqNb0wh154+768HHIXvLEO?=
 =?us-ascii?Q?Y4mnZRkxOQ5tHc8UrwEobUaBg7y8l1yiPHRuOGDpgi1a71ZDHpbrrS5WS+UJ?=
 =?us-ascii?Q?cr6i5lt0I01LVlPp9/5Rv7mv8srcg+p6wCY8wP2gpdRSrz3RiC1CcYopRcn/?=
 =?us-ascii?Q?PmMLjsWiEmsLM1+bFJRtcXyZL1LzVOD0yLMbee6xMcgFQtNAJVobK44gujA/?=
 =?us-ascii?Q?reWvdGFcsIcUubXrxQdXbgXXrlMaASwcpdnrvr1vCTBZf+3tYrmDE5gMpIny?=
 =?us-ascii?Q?VSuusYpPIT2J0brl14Vnil3M/f7W74Z9o9n7+vBH20mMfxeDwUtCjkSQ02Ch?=
 =?us-ascii?Q?W7vmE0QuWRao0rpABly/KoQq08nPxqBPiqgHo6/gGBPGO0ukKdU5je7Hc/LJ?=
 =?us-ascii?Q?59Uf+RZM9ZJsUyjF9aYF6acp6zvHtdPgXjiAqVh83yJmiRTJWNUo8/H0LLIg?=
 =?us-ascii?Q?UGaGyJrtmWPrvmFPKklEwuv9EYtqt1xv6Gdh3iMwhwJh5IOrGbP9wDxIJWOi?=
 =?us-ascii?Q?RUtkwLZ3y5MQEVW6MdP1G2qc563/7oyJkn+LmshIcYXMgreiPYG5sUfFMwEG?=
 =?us-ascii?Q?eWx6317uu7GTuweyY9NJjO3eL26U6/XUcjhZMNQ3oiXwC1U24OoZkm81+kC+?=
 =?us-ascii?Q?dmm9+KE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5423.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(220923002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?d1m6Zz6JiTskzufABldUmfrQ+R3Y2Laxxf0eFiz07dw9RTjIGWUFAs1Wvn1C?=
 =?us-ascii?Q?JqD0betnmJNFVBU0XJje/p74DaNDpow2McORtqq+HDxTJiHj4YD1DdSXxokx?=
 =?us-ascii?Q?UdEFySTKVnJ+rIWxjwRAmlvmHPUJeltVyQhIdyDr/zCBRTp4evbIpISfCPhF?=
 =?us-ascii?Q?EYR5wiSIKXCU5VfJ5nQJ45YcXu2Z93lo0C3DkPJqcujByDp8IMX1LflRi1YN?=
 =?us-ascii?Q?cxtZaNmdXr8d6FeHixA58/V8LbJVzH0kJuskHfyb/zlW0k2HSEt6XCG57AO5?=
 =?us-ascii?Q?A+oAhMQuph/Z2dfr1Q6WWTAI+7bJNbBWhrTu685Dr3KJaQ+4c4bpidVIIUrW?=
 =?us-ascii?Q?9aCYmyB8DKJaoSBoGEDGWULKnaWUY0jhm9k+wS+bxkIXjeU8eAlAmzIjIKMM?=
 =?us-ascii?Q?R0GvK6e4HD7Bat8/bqYJN2jDvt2WfBabQmYxejecYy6rnQZVNlGLxdspiTdt?=
 =?us-ascii?Q?iK5qW/5GiAbpD6OBme3Lcd5IzWyFtIPt44bqy2BH+U22etaANGbso5VubyxE?=
 =?us-ascii?Q?1Q97e6t47lfKdJ6iXbggxl2z/Rbg836xqFgDzVB1xdFEwmDj5OQ1+3Skc22g?=
 =?us-ascii?Q?hdrfAstJHlwjPJyBw66KiZ0IcUjmprgrq2UKRrNlDHDQ0A2nbtvSPDytBupf?=
 =?us-ascii?Q?fXEtDauFwXdd3fIqTE+b07Fre8P9p6MbfvJJqJ+8c3VbUYtF5PlAySTRtvrZ?=
 =?us-ascii?Q?oputD8Iu17X3LZMTjT7YWx8Z3AD6vbeJ3RgbgxHAf7ml8/Mc3gXpDpSdNnVh?=
 =?us-ascii?Q?7UM3khUktXmIKvWCPj3QT/PR4s7yy6YGPwGiR1bGWK7gVB7xMa+eozjpevJ2?=
 =?us-ascii?Q?XjQKUtt9bPphIuj6Sbk3QNGTBXbbq+rpQB4UGvQKgL98TuHnpiu9FWtDL260?=
 =?us-ascii?Q?F8p52ck1skQLsxpKrzJ7jAvAH0aYf6vGpRjfJx+KpZSZQuo5lbT07ZGuEPeK?=
 =?us-ascii?Q?YSP3eO5OMHq4s6MD20szjL28Il43y038kj424k/ibymu8YWzJXtZNN+VMwX0?=
 =?us-ascii?Q?2drKQAbV4bc1vLqGsnA+gcD1fa47XtYA3btk9TX6Aa5mS5saRiVSBiDLZfWO?=
 =?us-ascii?Q?SzB2duSXuYczthGOed5OSOXVYhiY35MPWjPrkd3XITAhcF6cAol2tDvLQmZh?=
 =?us-ascii?Q?kCQUkK69YLj8ulppr13S4UgSxBg+PPtI4VXuruMqSWZpKCO0XlMw8oaJbTQW?=
 =?us-ascii?Q?SwadwP4LZISYf4krOkf+lIU95rRqZj1Ndfi6NFDr4W2TY36o/ki99RnBoLlw?=
 =?us-ascii?Q?gwTCcWZdT9AiSI6pRQNaJ5FlPc6deXVN45ga+p9/7NQvhwnzE4QkUgNVVSkY?=
 =?us-ascii?Q?3q9lnZ+6q1CmuDu03ga+1sNK1nLZ561wAyLoFOKmBTP6jZIcS62QRv4CUZV5?=
 =?us-ascii?Q?6Airq/xRCIoLCtcZo6+VX+7ZS+NU+CnGkBEKX2WLuxyaUTFSChFbqLaqdTwD?=
 =?us-ascii?Q?Ep/L7HAcjZE8Dl4T92ctgBBC+75/77bDSQm5hKZaA3XFSLyxK7PsV+EQCYcZ?=
 =?us-ascii?Q?+50U5z+9YXClKXAYGpov9dCNzG9jl3NodL6ToUx2rrPQHxn32AeBz0MG4KXl?=
 =?us-ascii?Q?pEvzspwHu/o6Qzi1sakMqEMAtAFdU5b/ONuKcS7O?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 863b910f-b9b5-4161-fe91-08dcb8176951
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5423.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2024 02:03:07.5502
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U/L8IzbGGqtjrUHtny3aZssnnZUdCxjExMdvklz4LmIoGL0YE+1OdpYS/UG52wqxJXv2Ot2HbMDwuPnOM4kp1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7379
X-OriginatorOrg: intel.com

tree:   https://github.com/tobetter/linux odroid-6.1.y
head:   2a5f985c90ffd8f4e2de3a2fd76f00c3e322aa6f
commit: 8129a8776feae59666307627215e7b4f653f3d60 [10/91] dt-bindings: phy: rockchip: add pcie3 phy
:::::: branch date: 2 days ago
:::::: commit date: 1 year, 7 months ago
config: arm64-randconfig-051-20240808 (https://download.01.org/0day-ci/archive/20240809/202408090604.1b4dGyhw-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.6.dev8+gf13c181
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240809/202408090604.1b4dGyhw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408090604.1b4dGyhw-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/media/rockchip-vpu.yaml#
   arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dtb: ethernet@fe010000: Unevaluated properties are not allowed ('rx-queues-config', 'tx-queues-config' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/rockchip-dwmac.yaml#
   arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dtb: /dsi@fe060000: failed to match any schema with compatible: ['rockchip,rk3568-mipi-dsi', 'snps,dw-mipi-dsi']
   arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dtb: /dsi@fe060000: failed to match any schema with compatible: ['rockchip,rk3568-mipi-dsi', 'snps,dw-mipi-dsi']
   arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dtb: /dsi@fe070000: failed to match any schema with compatible: ['rockchip,rk3568-mipi-dsi', 'snps,dw-mipi-dsi']
   arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dtb: /dsi@fe070000: failed to match any schema with compatible: ['rockchip,rk3568-mipi-dsi', 'snps,dw-mipi-dsi']
   arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dtb: hdmi@fe0a0000: Unevaluated properties are not allowed ('#sound-dai-cells', 'power-domains' were unexpected)
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,dw-hdmi.yaml#
   arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dtb: /i2c@fe5c0000/rtc@51: failed to match any schema with compatible: ['haoyu,hym8563']
>> arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dtb: phy@fe8c0000: reg: [[0, 4270587904, 0, 131072]] is too short
   	from schema $id: http://devicetree.org/schemas/phy/rockchip-pcie3-phy.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dtb: phy@fe8c0000: 'data-lanes', 'phy-supply' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/rockchip-pcie3-phy.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dtb: phy@fe8c0000: Unevaluated properties are not allowed ('data-lanes', 'phy-supply', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/phy/rockchip-pcie3-phy.yaml#
   arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dtb: pcie@fe270000: Unevaluated properties are not allowed ('interrupt-names', 'interrupts', 'legacy-interrupt-controller', 'num-ib-windows', 'num-ob-windows' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/rockchip-dw-pcie.yaml#
   arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dtb: pcie@fe280000: Unevaluated properties are not allowed ('interrupt-names', 'interrupts', 'legacy-interrupt-controller', 'num-ib-windows', 'num-ob-windows' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/rockchip-dw-pcie.yaml#
   arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dtb: ethernet@fe2a0000: Unevaluated properties are not allowed ('rx-queues-config', 'tx-queues-config' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/rockchip-dwmac.yaml#
   arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dtb: vcc3v3-pi6c-05-regulator: Unevaluated properties are not allowed ('gpios' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/fixed-regulator.yaml#
--
   arch/arm64/boot/dts/rockchip/rk3568-evb1-v10.dtb: video-codec@fdea0400: 'interrupt-names' is a required property
   	from schema $id: http://devicetree.org/schemas/media/rockchip-vpu.yaml#
   arch/arm64/boot/dts/rockchip/rk3568-evb1-v10.dtb: ethernet@fe010000: Unevaluated properties are not allowed ('rx-queues-config', 'tx-queues-config' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/rockchip-dwmac.yaml#
   arch/arm64/boot/dts/rockchip/rk3568-evb1-v10.dtb: /dsi@fe060000: failed to match any schema with compatible: ['rockchip,rk3568-mipi-dsi', 'snps,dw-mipi-dsi']
   arch/arm64/boot/dts/rockchip/rk3568-evb1-v10.dtb: /dsi@fe060000: failed to match any schema with compatible: ['rockchip,rk3568-mipi-dsi', 'snps,dw-mipi-dsi']
   arch/arm64/boot/dts/rockchip/rk3568-evb1-v10.dtb: /dsi@fe070000: failed to match any schema with compatible: ['rockchip,rk3568-mipi-dsi', 'snps,dw-mipi-dsi']
   arch/arm64/boot/dts/rockchip/rk3568-evb1-v10.dtb: /dsi@fe070000: failed to match any schema with compatible: ['rockchip,rk3568-mipi-dsi', 'snps,dw-mipi-dsi']
   arch/arm64/boot/dts/rockchip/rk3568-evb1-v10.dtb: hdmi@fe0a0000: Unevaluated properties are not allowed ('#sound-dai-cells', 'power-domains' were unexpected)
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,dw-hdmi.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-evb1-v10.dtb: phy@fe8c0000: reg: [[0, 4270587904, 0, 131072]] is too short
   	from schema $id: http://devicetree.org/schemas/phy/rockchip-pcie3-phy.yaml#
   arch/arm64/boot/dts/rockchip/rk3568-evb1-v10.dtb: ethernet@fe2a0000: Unevaluated properties are not allowed ('rx-queues-config', 'tx-queues-config' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/rockchip-dwmac.yaml#
--
   	from schema $id: http://devicetree.org/schemas/net/rockchip-dwmac.yaml#
   arch/arm64/boot/dts/rockchip/rk3568-rock-3a.dtb: /dsi@fe060000: failed to match any schema with compatible: ['rockchip,rk3568-mipi-dsi', 'snps,dw-mipi-dsi']
   arch/arm64/boot/dts/rockchip/rk3568-rock-3a.dtb: /dsi@fe060000: failed to match any schema with compatible: ['rockchip,rk3568-mipi-dsi', 'snps,dw-mipi-dsi']
   arch/arm64/boot/dts/rockchip/rk3568-rock-3a.dtb: /dsi@fe070000: failed to match any schema with compatible: ['rockchip,rk3568-mipi-dsi', 'snps,dw-mipi-dsi']
   arch/arm64/boot/dts/rockchip/rk3568-rock-3a.dtb: /dsi@fe070000: failed to match any schema with compatible: ['rockchip,rk3568-mipi-dsi', 'snps,dw-mipi-dsi']
   arch/arm64/boot/dts/rockchip/rk3568-rock-3a.dtb: hdmi@fe0a0000: Unevaluated properties are not allowed ('#sound-dai-cells', 'power-domains' were unexpected)
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,dw-hdmi.yaml#
   arch/arm64/boot/dts/rockchip/rk3568-rock-3a.dtb: pcie@fe260000: Unevaluated properties are not allowed ('interrupt-names', 'interrupts', 'legacy-interrupt-controller', 'num-ib-windows', 'num-ob-windows' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/rockchip-dw-pcie.yaml#
   arch/arm64/boot/dts/rockchip/rk3568-rock-3a.dtb: /i2c@fe5e0000/rtc@51: failed to match any schema with compatible: ['haoyu,hym8563']
>> arch/arm64/boot/dts/rockchip/rk3568-rock-3a.dtb: phy@fe8c0000: reg: [[0, 4270587904, 0, 131072]] is too short
   	from schema $id: http://devicetree.org/schemas/phy/rockchip-pcie3-phy.yaml#
   arch/arm64/boot/dts/rockchip/rk3568-rock-3a.dtb: vcc3v3-pcie-regulator: Unevaluated properties are not allowed ('gpios' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/fixed-regulator.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

