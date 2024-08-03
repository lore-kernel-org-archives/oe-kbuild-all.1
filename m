Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2AE54C6D
	for <oe-kbuild-all@lists.linux.dev>; Sat,  3 Aug 2024 04:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722660334; cv=fail; b=UkHpkggmNC/JtCpAxuOnlpWZayQOGmapOfGu0CS61J5XzIQx7nSOuG+BkPkG2DZBodKPrFaeYU3etE6xTcQ0GGsh9gtbf8/G2irnRYkJ6IbewJl1VQvE6C4ffPnwFUJHzTZf8sBfQgmRdK8BPi1uL7CxYjZy2uNfneUYUlIcwtk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722660334; c=relaxed/simple;
	bh=vMvSsvL2kfh36yMuCHDDEtyZCtEXXCDVc014skW6Zeg=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=crCUTRGMYdJlpcXUmRoc8peRXSP91vUSx9kA5HheqFe8FHT7pn9HRQ4yuRKO3baXlKiRsaNC5w7QZoiMRiU+7rKIzpvgge6m3QU9z5xK5I5fDIm371QvpVflc0c/hPgZfrs072ZyWPaoTOjhq1QTB2MW5BDxgXLf2xdJt7zFHDA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aVSD5onu; arc=fail smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aVSD5onu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722660331; x=1754196331;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vMvSsvL2kfh36yMuCHDDEtyZCtEXXCDVc014skW6Zeg=;
  b=aVSD5onudLWDRXUYLw1nSuuvdaE9Vv9CR0/o1b+MPnD9Nu2hDKkkfs1Z
   liKVCg0u9l5FtSqczqHY/pcf90TlWmpIH02vKxrvqPhLhnXDxPttWh/cK
   YlQC8+ypjO++ltMkuhiIZwFuGBUVhKi1oju0KWqhSzF2ReMCB+1mDRZ2i
   qXmy4f9bdjT8oLDfKueFz3GWr1x5NxzXit2nRtVjwrXDutShjd2t5PteK
   uy5c923OYgwyawwv0N8/fyxWcc6S5UgDjBc4IXqUI6DUIxZUoPe60SQy4
   wy53JCTw3nA4+eSKQSNoFuGJ1psTxZmqNVJJSfiX7shxWGiTwf384Ixmc
   Q==;
X-CSE-ConnectionGUID: UbaPyckpTGaOAG7vQZK8Bw==
X-CSE-MsgGUID: Ny/PlrM6Qrmb0GBayZks1Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11152"; a="24457603"
X-IronPort-AV: E=Sophos;i="6.09,259,1716274800"; 
   d="scan'208";a="24457603"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2024 21:45:30 -0700
X-CSE-ConnectionGUID: BR1ZDzKTRrW7sYPVi1OwTw==
X-CSE-MsgGUID: 0pXPNbJdQmm6bjnwtp/NPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,259,1716274800"; 
   d="scan'208";a="60252473"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 02 Aug 2024 21:45:30 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 2 Aug 2024 21:45:29 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 2 Aug 2024 21:45:29 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 2 Aug 2024 21:45:29 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.175)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 2 Aug 2024 21:45:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zSgRBUt6dpmmWU6vtG3v4BrSzvHBxwPnX4i6MlLcEgFGnSpH2XXgL7Evk8c5W9f/PO6FDRWyaCYGEP7ZZ9vUtD/hJk/1XqsEr3GkNREjRhtIfqhWK5KYLpd/DEy2wR9rfvyAFvEdt94SNFBEsRHxygeuobR5mjtoAz6bd0bbvg5ajlfsb54FjU3SgCzOr6Z/3+9ZUCy/d7qvpeDPiWZukKPoz0h9G5KDqn44zGGspMbH3FUgF9cIDlnxg8miJjRpI3g5WwqF1/mhbRIhA5qGUgi+vmYhNw0J9g+BOKIjdPMX2TF7GjSHW1gLfZZCxSrTV1iyBl9kvRmYZ3ZW18Ikbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/2OfWOUSnwPagadasrGZ8xrUjHrERo+c42VVcEaPOkE=;
 b=LcIZAPhgcjtSEjPose5sL23uTaG+XvZrV0S01A3e3jcfYKh57zcfoHlWrEPtqJzfdyFeHtN8cL+SBGzvekiU3yZTLXDsg+3JLWTtm3QR70fM3NF7D6EjnlBGy6Vu588pKkFqZT32bmlwdCqiOKoX5nhNiAdY7mOJl07+c91Ye+xWHu/L7AIVEt2WbLpsT54z0gmw/CYeEzVVpbdPwr+Qus2lIvODqeAfipbIF+xfh4NHToKxfHnEepev8FTjJral45XxmKsmYz63mAUpNyI9N2U5Lqjuh2hg0qECnEQQ2YksESxGmMb2DCDLA715f6KXUb7nEXqltXc3HAJtX7KQYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
 by CH3PR11MB8156.namprd11.prod.outlook.com (2603:10b6:610:165::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.24; Sat, 3 Aug
 2024 04:45:20 +0000
Received: from DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e]) by DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e%5]) with mapi id 15.20.7828.023; Sat, 3 Aug 2024
 04:45:20 +0000
Date: Sat, 3 Aug 2024 12:45:11 +0800
From: kernel test robot <lkp@intel.com>
To: <cros-kernel-buildreports@googlegroups.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [chrome-os:chromeos-6.1 4/7]
 arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:331.19-349.4: Warning
 (unit_address_vs_reg): /soc/dsi@1c008000/panel: node has a reg or ranges
 property, but no unit name
Message-ID: <Zq2113wbvSl0rr9L@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0172.apcprd04.prod.outlook.com (2603:1096:4::34)
 To DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5423:EE_|CH3PR11MB8156:EE_
X-MS-Office365-Filtering-Correlation-Id: 430cef80-5abb-4a34-654a-08dcb37713f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|220923002;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9671LxG8fC5r1bNvXAW30ZvbrOqFqo/Vj0V9xAJZuQTK2Jw2OMg3r9mNSG2x?=
 =?us-ascii?Q?Nh2ZMfh5TG6U5X6eKCbc4cb5QFx0f1XfpqtnAEY0CNpd19EiKGpJgp+FEFhe?=
 =?us-ascii?Q?uJIY7WqrC0EgSDh9nqS8nyMy4vSRT8HovyxEnNU//Sj7aMMJ3K9Ri85Q5MWA?=
 =?us-ascii?Q?o5Zp3BFzLEkBMBiOAPCmkWT3BjxW9buwUHJKYFi1oS3xaR9Sd36TOv2miJAo?=
 =?us-ascii?Q?PPc3qg2iFkwMTvmunP7hNj+44CuVQlW1Mv9Hjg9GSNIR0KSiZqylr11Sd4NX?=
 =?us-ascii?Q?I3LwgyxgMl7LCmCZ6mrbrG1ux9fOhwQh/H33DHXOmR2uESzueU5AAZX1tol6?=
 =?us-ascii?Q?nQdjPw/82ZJY17yXM7CmzlwIRjnYbbnDuTF0/cXQMq9Tl+s/3xZajvNBFNu6?=
 =?us-ascii?Q?iwMcXjRnr3p5s+k1P+Ab7p7yEOtufUIEqxbgHfI8f7JykpN5Rv88s/tNkG/m?=
 =?us-ascii?Q?DY3k2MDM09izmO79//Stoevqm/XX2sYiyaXP3QcwlyQ6fZOhkhURZNjUOTl8?=
 =?us-ascii?Q?bZ9ziCjK6QX1oRV7shl/cyJC35BnQC3KtcYyyZo0E/NAQnih/bBmHxjJc3Od?=
 =?us-ascii?Q?YkyK03pEHcwTOxvzws/Pcl0V4MeyfY1BBAUV9/Oi8zP0rVCK3XFD6OdR3aTU?=
 =?us-ascii?Q?LU0Sk2cmb2hQlH/cAsVIN92I5l8sOL12F3cBWjv/lbTEbpcMTNh0DaLs6OCV?=
 =?us-ascii?Q?4m7Did816DLXk6QuJEzNTkPqwGfKcXFFl5NqD1bzTMBjQV9oTd9haaEMCYJ9?=
 =?us-ascii?Q?Wu8cDnzLodMbDHWX22oXbxDQ1TMz4ChskBG1B/ZYd5/l7lkd6/ZLyyXN8p0f?=
 =?us-ascii?Q?H/mBX2VVM2VOUiiMVCOu8VCJDcJQQi5J5Y1nAQsnkELHLwjSt0AgC09f3a85?=
 =?us-ascii?Q?U38p31tWtElBB4jrKRFS+Xj7CM8g+fv0gcW1m/pBxZE+LwFhf3ckH2nM7w1a?=
 =?us-ascii?Q?3QGAPPkZR9r8ZtNPETQsj37wn8790Mc0jn7klZ+JwgqnIec/yzQb/2iux0PD?=
 =?us-ascii?Q?sONUthsWwXKHNApVF0tSnpucCjJznXuhLuP0rw0fcliLbtj2uZsShmosIuPO?=
 =?us-ascii?Q?p7K5Y3569SJrc6OKlhMeck1BgceZll63nHuCU9D8J1Au9v2LP89i4pOTyyVo?=
 =?us-ascii?Q?O5hH5H/cwfGALJzafjqyLrPOZavB5k2i1V90pKKK935xJmrbWQDt4uxL1n+i?=
 =?us-ascii?Q?FZAJYyjC4HJiFfYA6/5ulVzJQCnzXjD5d4r9i/7caO7gjRlA6s9wqUJ0W809?=
 =?us-ascii?Q?v0EeH4wdWk+/cq1o8mtBuchh1Obkx7QzI25t/Lyh8z5G1TNK6eEiSGhhZCUw?=
 =?us-ascii?Q?CF4SY22R1LvkF3Dskkef9EmkndBR03Ae0gBKs4HGymCD2eRVQU7uzcVRylnB?=
 =?us-ascii?Q?S0gev2w=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5423.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(220923002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7diwDJ9FqNY2xl+OxXa0XTEDzWUun0g67mXwq/qsy9K3YGgtOmGAzIY3g8yf?=
 =?us-ascii?Q?nHPDkfEuYwYYKybia3alZ7cxGO9AU2uOOts16gGS7fP9e5N9AsrESpEWOG9l?=
 =?us-ascii?Q?3BRMDn0rZGmFXve+qMbXpjvOWPJEazhIFCo0BAfH5b0I4qy8OYp36ZgGQr7e?=
 =?us-ascii?Q?6p7QXosTs4wmZgLrD+2Mb72GthUz/B9fRaOLHu6BEUoHOuEaHwffs3Fcfb6R?=
 =?us-ascii?Q?F0G8SKf9zyAirTWlZI6cF2b+vN1JvWqzhc315BPdIMKz8jzqFJ7O1UUtmzQ7?=
 =?us-ascii?Q?HLj+Sr+bwRf4Hl6JWbUjUh7cqCm5j7NmWeJbTJC6VCNwSl5aqPCi7wDI8vOs?=
 =?us-ascii?Q?ktPfZWNj1iVG+9psQ7Ut2mdtmdS6KxLpwHFAP4F9uHXTM/Rn8CIrae3Rursy?=
 =?us-ascii?Q?zKTqEIugSRoEvgCs7aVFUqnzGWxoauxWQvc7b8k7VkeRxdHm02sLIK45IJbm?=
 =?us-ascii?Q?TYBo9UdD6lR5aifbYulYMof3cchcW+l2dxy/KQEsqlDycgDRQ7hp9ve0i822?=
 =?us-ascii?Q?jdDELi/pwOqBNHXkvjQy6Xdmmis9vqB6PBTbYlR3fMFfxK1Oqoiaw7IQnEiV?=
 =?us-ascii?Q?xLc3nxIxXsyoxW8Ox0Il+g3fF6+zFEgWKiQd6stQXoQyrAw9rf+oD/XhcDtf?=
 =?us-ascii?Q?64nhvj8AQLLSFGijWqqo0/eIZP1tie/LulbkVWNIgihS2kgYdtMNsSx3DJMR?=
 =?us-ascii?Q?q/Uigsx2WE6+dOZ8NcJo7xto7gPrHuQrH/vHX0y6cRMhgtYMNtRJPT7HUprs?=
 =?us-ascii?Q?BmPRACtC/zbnI/J0L+zaUKKx2/raqV9+634T0lA4AK5Z4Qo8PBg32LuDuBCf?=
 =?us-ascii?Q?0QvZhXvBYotBKr1iTuLJwLDyz3Sh+4Kg2ZEEe1PLaZrP8AO2AVY4z4smU28z?=
 =?us-ascii?Q?4n6ckH4TSqKEcnonyHpkMyeGQFEEDl57BkP03SkcRCvA6O3LoTvIV2m11IjL?=
 =?us-ascii?Q?w2L17iroKvyN4fQCwwzuJguQXbOGXccCiqxlXVUbvEfcu9DcgxEsSk+SGxwl?=
 =?us-ascii?Q?L+IVGOsUJLG/QTVIHUnPBZwxGTsG2la0SySiw5YsoPFMdCbU8+WsN8ABAomU?=
 =?us-ascii?Q?SUpCue5vFSZt2jhiZIEZWnXuWHLGRzzS+CgXVZkuvysz5QELCLRBbwvDaKtL?=
 =?us-ascii?Q?Q9hwPDLyoSUlF+YtQtNo86ISUDRjAdzWY+VC5VW9q50HuAYy7W69K4X2/zqi?=
 =?us-ascii?Q?CCoHeeKg+5GBp8ZA9n9Kwm8lmYw6/PUkfhV27Ff30Th6k/93nCPQG2Xc69qR?=
 =?us-ascii?Q?G8pUOTzitk84xWbFun4xpqu/wmkgNOF//7AZs27TgZwLXP4N+9I+qayjgVIy?=
 =?us-ascii?Q?lkwBklQVH7Xj49Kt/a2s1Sf/bavwdrkrMclZq8axjsOQkDzflU5m/NBbNnYT?=
 =?us-ascii?Q?/OtdvJ1EgDgSscLH+9nbMjVYi47CbgSE46LlaJBgXrjE0xHvh3PJQOU2jTD6?=
 =?us-ascii?Q?Gvy0CTKo5HqcvtcaRWio/opnl2jxpsxIZW9nMOrSHyMGQaya7n1hqtf9tnJF?=
 =?us-ascii?Q?t7ul3gls2FaK5Lv5L7oGGZ97n5gKPjRVnGOubbe2J0eu48zO/TSoxdX+MQ14?=
 =?us-ascii?Q?bvRjkOBO0Zy9NvptKSirp4Htt7/ea8BG9oE+ugRL?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 430cef80-5abb-4a34-654a-08dcb37713f8
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5423.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2024 04:45:20.3581
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZnCrza30GBXbx+FI5KBTS36Kstogtl1IxXlwPGXbj309XN/7mlzRZToCQtKYFLoGTcNVQDq7tqBogcQFPpEijQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8156
X-OriginatorOrg: intel.com

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   714b7640b7e49da5d8d3b9b3a36c0d776accbe6d
commit: fb83121c01a156634ed0cf816f5bbac12de2656c [4/7] CHROMIUM: arm64: dts: mt8188: Refactor panel node names and labels
:::::: branch date: 18 hours ago
:::::: commit date: 20 hours ago
config: arm64-randconfig-001-20240803 (https://download.01.org/0day-ci/archive/20240803/202408031005.IpmbEzat-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 423aec6573df4424f90555468128e17073ddc69e)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240803/202408031005.IpmbEzat-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408031005.IpmbEzat-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:1983.26-1997.5: Warning (unit_address_vs_reg): /soc/t-phy@11e80000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:452.16-458.4: Warning (unit_address_vs_reg): /soc/gpu@13000000/power_model@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:460.16-463.4: Warning (unit_address_vs_reg): /soc/gpu@13000000/power_model@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:2325.14-2361.5: Warning (unit_address_vs_reg): /soc/hcp@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8188-ciri-camera-v4l2.dtsi:30.37-39.5: Warning (unit_address_vs_reg): /soc/seninf-top@16010000/csi-receiver@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8188-ciri-camera-v4l2.dtsi:34.40-37.7: Warning (unit_address_vs_reg): /soc/seninf-top@16010000/csi-receiver@0/port/endpoint@2: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8188-ciri-camera-v4l2.dtsi:41.37-50.5: Warning (unit_address_vs_reg): /soc/seninf-top@16010000/csi-receiver@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8188-ciri-camera-v4l2.dtsi:45.40-48.7: Warning (unit_address_vs_reg): /soc/seninf-top@16010000/csi-receiver@1/port/endpoint@2: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:331.19-349.4: Warning (unit_address_vs_reg): /soc/dsi@1c008000/panel: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:103.9-106.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:229.36-233.5: Warning (unit_address_vs_reg): /reserved-memory/scp-mem-region: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:235.42-238.5: Warning (unit_address_vs_reg): /reserved-memory/apu-reserve-memory: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:240.38-244.5: Warning (unit_address_vs_reg): /reserved-memory/adsp-mem-region: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:246.44-250.5: Warning (unit_address_vs_reg): /reserved-memory/snd-dma-mem-region: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:252.46-256.5: Warning (unit_address_vs_reg): /reserved-memory/adsp-dma-mem-region: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:258.46-262.5: Warning (unit_address_vs_reg): /reserved-memory/scp-dual-mem-region: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:264.44-268.5: Warning (unit_address_vs_reg): /reserved-memory/scp-isp-cma-region: node has a reg or ranges property, but no unit name
--
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:1983.26-1997.5: Warning (unit_address_vs_reg): /soc/t-phy@11e80000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:452.16-458.4: Warning (unit_address_vs_reg): /soc/gpu@13000000/power_model@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:460.16-463.4: Warning (unit_address_vs_reg): /soc/gpu@13000000/power_model@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:2325.14-2361.5: Warning (unit_address_vs_reg): /soc/hcp@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8188-ciri-camera-v4l2.dtsi:30.37-39.5: Warning (unit_address_vs_reg): /soc/seninf-top@16010000/csi-receiver@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8188-ciri-camera-v4l2.dtsi:34.40-37.7: Warning (unit_address_vs_reg): /soc/seninf-top@16010000/csi-receiver@0/port/endpoint@2: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8188-ciri-camera-v4l2.dtsi:41.37-50.5: Warning (unit_address_vs_reg): /soc/seninf-top@16010000/csi-receiver@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8188-ciri-camera-v4l2.dtsi:45.40-48.7: Warning (unit_address_vs_reg): /soc/seninf-top@16010000/csi-receiver@1/port/endpoint@2: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:331.19-349.4: Warning (unit_address_vs_reg): /soc/dsi@1c008000/panel: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:103.9-106.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:229.36-233.5: Warning (unit_address_vs_reg): /reserved-memory/scp-mem-region: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:235.42-238.5: Warning (unit_address_vs_reg): /reserved-memory/apu-reserve-memory: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:240.38-244.5: Warning (unit_address_vs_reg): /reserved-memory/adsp-mem-region: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:246.44-250.5: Warning (unit_address_vs_reg): /reserved-memory/snd-dma-mem-region: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:252.46-256.5: Warning (unit_address_vs_reg): /reserved-memory/adsp-dma-mem-region: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:258.46-262.5: Warning (unit_address_vs_reg): /reserved-memory/scp-dual-mem-region: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:264.44-268.5: Warning (unit_address_vs_reg): /reserved-memory/scp-isp-cma-region: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:270.42-274.5: Warning (unit_address_vs_reg): /reserved-memory/secure-cma-region: node has a reg or ranges property, but no unit name
--
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:1983.26-1997.5: Warning (unit_address_vs_reg): /soc/t-phy@11e80000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:452.16-458.4: Warning (unit_address_vs_reg): /soc/gpu@13000000/power_model@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:460.16-463.4: Warning (unit_address_vs_reg): /soc/gpu@13000000/power_model@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:2325.14-2361.5: Warning (unit_address_vs_reg): /soc/hcp@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8188-ciri-camera-v4l2.dtsi:30.37-39.5: Warning (unit_address_vs_reg): /soc/seninf-top@16010000/csi-receiver@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8188-ciri-camera-v4l2.dtsi:34.40-37.7: Warning (unit_address_vs_reg): /soc/seninf-top@16010000/csi-receiver@0/port/endpoint@2: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8188-ciri-camera-v4l2.dtsi:41.37-50.5: Warning (unit_address_vs_reg): /soc/seninf-top@16010000/csi-receiver@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8188-ciri-camera-v4l2.dtsi:45.40-48.7: Warning (unit_address_vs_reg): /soc/seninf-top@16010000/csi-receiver@1/port/endpoint@2: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:331.19-349.4: Warning (unit_address_vs_reg): /soc/dsi@1c008000/panel: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:103.9-106.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:229.36-233.5: Warning (unit_address_vs_reg): /reserved-memory/scp-mem-region: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:235.42-238.5: Warning (unit_address_vs_reg): /reserved-memory/apu-reserve-memory: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:240.38-244.5: Warning (unit_address_vs_reg): /reserved-memory/adsp-mem-region: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:246.44-250.5: Warning (unit_address_vs_reg): /reserved-memory/snd-dma-mem-region: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:252.46-256.5: Warning (unit_address_vs_reg): /reserved-memory/adsp-dma-mem-region: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:258.46-262.5: Warning (unit_address_vs_reg): /reserved-memory/scp-dual-mem-region: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:264.44-268.5: Warning (unit_address_vs_reg): /reserved-memory/scp-isp-cma-region: node has a reg or ranges property, but no unit name
--
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:1983.26-1997.5: Warning (unit_address_vs_reg): /soc/t-phy@11e80000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:452.16-458.4: Warning (unit_address_vs_reg): /soc/gpu@13000000/power_model@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:460.16-463.4: Warning (unit_address_vs_reg): /soc/gpu@13000000/power_model@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:2325.14-2361.5: Warning (unit_address_vs_reg): /soc/hcp@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8188-ciri-camera-v4l2.dtsi:30.37-39.5: Warning (unit_address_vs_reg): /soc/seninf-top@16010000/csi-receiver@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8188-ciri-camera-v4l2.dtsi:34.40-37.7: Warning (unit_address_vs_reg): /soc/seninf-top@16010000/csi-receiver@0/port/endpoint@2: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8188-ciri-camera-v4l2.dtsi:41.37-50.5: Warning (unit_address_vs_reg): /soc/seninf-top@16010000/csi-receiver@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8188-ciri-camera-v4l2.dtsi:45.40-48.7: Warning (unit_address_vs_reg): /soc/seninf-top@16010000/csi-receiver@1/port/endpoint@2: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:331.19-349.4: Warning (unit_address_vs_reg): /soc/dsi@1c008000/panel: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:103.9-106.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:229.36-233.5: Warning (unit_address_vs_reg): /reserved-memory/scp-mem-region: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:235.42-238.5: Warning (unit_address_vs_reg): /reserved-memory/apu-reserve-memory: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:240.38-244.5: Warning (unit_address_vs_reg): /reserved-memory/adsp-mem-region: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:246.44-250.5: Warning (unit_address_vs_reg): /reserved-memory/snd-dma-mem-region: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:252.46-256.5: Warning (unit_address_vs_reg): /reserved-memory/adsp-dma-mem-region: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:258.46-262.5: Warning (unit_address_vs_reg): /reserved-memory/scp-dual-mem-region: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:264.44-268.5: Warning (unit_address_vs_reg): /reserved-memory/scp-isp-cma-region: node has a reg or ranges property, but no unit name
--
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:1983.26-1997.5: Warning (unit_address_vs_reg): /soc/t-phy@11e80000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:452.16-458.4: Warning (unit_address_vs_reg): /soc/gpu@13000000/power_model@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:460.16-463.4: Warning (unit_address_vs_reg): /soc/gpu@13000000/power_model@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:2325.14-2361.5: Warning (unit_address_vs_reg): /soc/hcp@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8188_geralt_camera_v4l2.dtsi:14.37-28.5: Warning (unit_address_vs_reg): /soc/seninf-top@16010000/csi-receiver@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8188_geralt_camera_v4l2.dtsi:23.40-26.7: Warning (unit_address_vs_reg): /soc/seninf-top@16010000/csi-receiver@1/port/endpoint@2: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8188_geralt_camera_v4l2.dtsi:29.37-42.5: Warning (unit_address_vs_reg): /soc/seninf-top@16010000/csi-receiver@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8188_geralt_camera_v4l2.dtsi:37.40-40.7: Warning (unit_address_vs_reg): /soc/seninf-top@16010000/csi-receiver@0/port/endpoint@2: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:331.19-349.4: Warning (unit_address_vs_reg): /soc/dsi@1c008000/panel: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:103.9-106.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:229.36-233.5: Warning (unit_address_vs_reg): /reserved-memory/scp-mem-region: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:235.42-238.5: Warning (unit_address_vs_reg): /reserved-memory/apu-reserve-memory: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:240.38-244.5: Warning (unit_address_vs_reg): /reserved-memory/adsp-mem-region: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:246.44-250.5: Warning (unit_address_vs_reg): /reserved-memory/snd-dma-mem-region: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:252.46-256.5: Warning (unit_address_vs_reg): /reserved-memory/adsp-dma-mem-region: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:258.46-262.5: Warning (unit_address_vs_reg): /reserved-memory/scp-dual-mem-region: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:264.44-268.5: Warning (unit_address_vs_reg): /reserved-memory/scp-isp-cma-region: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:270.42-274.5: Warning (unit_address_vs_reg): /reserved-memory/secure-cma-region: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188_geralt_camera_v4l2.dtsi:80.27-86.4: Warning (unit_address_format): /soc/i2c@11ec1000/vcm@0c: unit name should not have leading 0s
--
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:1983.26-1997.5: Warning (unit_address_vs_reg): /soc/t-phy@11e80000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:452.16-458.4: Warning (unit_address_vs_reg): /soc/gpu@13000000/power_model@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:460.16-463.4: Warning (unit_address_vs_reg): /soc/gpu@13000000/power_model@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:2325.14-2361.5: Warning (unit_address_vs_reg): /soc/hcp@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8188-ciri-camera-v4l2.dtsi:30.37-39.5: Warning (unit_address_vs_reg): /soc/seninf-top@16010000/csi-receiver@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8188-ciri-camera-v4l2.dtsi:34.40-37.7: Warning (unit_address_vs_reg): /soc/seninf-top@16010000/csi-receiver@0/port/endpoint@2: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8188-ciri-camera-v4l2.dtsi:41.37-50.5: Warning (unit_address_vs_reg): /soc/seninf-top@16010000/csi-receiver@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8188-ciri-camera-v4l2.dtsi:45.40-48.7: Warning (unit_address_vs_reg): /soc/seninf-top@16010000/csi-receiver@1/port/endpoint@2: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:331.19-349.4: Warning (unit_address_vs_reg): /soc/dsi@1c008000/panel: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:103.9-106.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:229.36-233.5: Warning (unit_address_vs_reg): /reserved-memory/scp-mem-region: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:235.42-238.5: Warning (unit_address_vs_reg): /reserved-memory/apu-reserve-memory: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:240.38-244.5: Warning (unit_address_vs_reg): /reserved-memory/adsp-mem-region: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:246.44-250.5: Warning (unit_address_vs_reg): /reserved-memory/snd-dma-mem-region: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:252.46-256.5: Warning (unit_address_vs_reg): /reserved-memory/adsp-dma-mem-region: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:258.46-262.5: Warning (unit_address_vs_reg): /reserved-memory/scp-dual-mem-region: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:264.44-268.5: Warning (unit_address_vs_reg): /reserved-memory/scp-isp-cma-region: node has a reg or ranges property, but no unit name

vim +331 arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi

4d82972937d69c Johnson Wang 2023-01-10  325  
419700708d1b37 Johnson Wang 2023-02-16  326  &disp_dsi0 {
419700708d1b37 Johnson Wang 2023-02-16  327  	#address-cells = <1>;
419700708d1b37 Johnson Wang 2023-02-16  328  	#size-cells = <0>;
419700708d1b37 Johnson Wang 2023-02-16  329  	status = "okay";
419700708d1b37 Johnson Wang 2023-02-16  330  
fb83121c01a156 Fei Shao     2024-07-24 @331  	dsi_panel: panel {
419700708d1b37 Johnson Wang 2023-02-16  332  		compatible = "boe,tv110c9m-ll3";
419700708d1b37 Johnson Wang 2023-02-16  333  		reg = <0>;
419700708d1b37 Johnson Wang 2023-02-16  334  		enable-gpios = <&pio 25 0>;
5a892039af765a Fei Shao     2024-07-24  335  		avdd-supply = <&ppvar_mipi_disp_avdd>;
5a892039af765a Fei Shao     2024-07-24  336  		avee-supply = <&ppvar_mipi_disp_avee>;
419700708d1b37 Johnson Wang 2023-02-16  337  		pinctrl-names = "default";
0d093046fe4ae1 Fei Shao     2024-07-22  338  		pinctrl-0 = <&disp_default>;
419700708d1b37 Johnson Wang 2023-02-16  339  		pp1800-supply = <&mt6359_vm18_ldo_reg>;
b98a01409487b4 Fei Shao     2024-07-23  340  		backlight = <&backlight_lcd0>;
231fceca7d470a Fei Shao     2023-03-29  341  		rotation = <270>;
419700708d1b37 Johnson Wang 2023-02-16  342  		status = "okay";
419700708d1b37 Johnson Wang 2023-02-16  343  
419700708d1b37 Johnson Wang 2023-02-16  344  		port {
fb83121c01a156 Fei Shao     2024-07-24  345  			dsi_panel_in: endpoint {
419700708d1b37 Johnson Wang 2023-02-16  346  				remote-endpoint = <&dsi_out>;
419700708d1b37 Johnson Wang 2023-02-16  347  			};
419700708d1b37 Johnson Wang 2023-02-16  348  		};
419700708d1b37 Johnson Wang 2023-02-16  349  	};
419700708d1b37 Johnson Wang 2023-02-16  350  
419700708d1b37 Johnson Wang 2023-02-16  351  	ports {
419700708d1b37 Johnson Wang 2023-02-16  352  		port {
419700708d1b37 Johnson Wang 2023-02-16  353  			dsi_out: endpoint {
fb83121c01a156 Fei Shao     2024-07-24  354  				remote-endpoint = <&dsi_panel_in>;
419700708d1b37 Johnson Wang 2023-02-16  355  			};
419700708d1b37 Johnson Wang 2023-02-16  356  		};
419700708d1b37 Johnson Wang 2023-02-16  357  	};
419700708d1b37 Johnson Wang 2023-02-16  358  };
419700708d1b37 Johnson Wang 2023-02-16  359  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

