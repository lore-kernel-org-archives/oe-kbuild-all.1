Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C0863C489
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Apr 2024 07:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713425036; cv=fail; b=d1/4uVUUg3rxfpcG5AjwkVLBfDYZ3ULru5bBhlOLOxfIVEn3FHDX0eb+qvmzIG1bd7oi3CsEDf/0bb519cmjVwCT6bsI9B4NlOAijCmJfge0bMml/4b2qmXFTyOzzlzrDLZbIUSd5X+kN1mI+enG3gaWEEAtkx2pQ9V17lGHQBs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713425036; c=relaxed/simple;
	bh=PWYpKToAdLefU3dbwv8n3nGrC0YH0V1BdxOfIt4nMzw=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=HWXXCtg6cI0sa6Noxz5krWWnE+4xU1AHdbSdRjkEic8+7FTYESOahU0RdwDGI+JJIetbT6kOyNQiGQUbSv7XE8Y9rlpuMyXilJ+ZCe5TuIAS6e0ppulzy12Kq+NXVW2PXHOgHNF9WMrFCIl4H/XxC7JJjlH91cDmaKXgMKEx3Ew=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OhHOM/YT; arc=fail smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OhHOM/YT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713425034; x=1744961034;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PWYpKToAdLefU3dbwv8n3nGrC0YH0V1BdxOfIt4nMzw=;
  b=OhHOM/YTigY5h3i7Et9atLFw/qW738vO2osxGprKe4ig4WnXdwZ/YTEP
   MFprT43ptsi7GSUaiO5hKp+1XRDqJtIqiu1kiOPF01mRByHXtdcL3HgGr
   HAJ7eryF1s+99XzX64fLpQ4BPF5ulenqWiSxzJpFwyoa7/hc3MdIrLUAK
   AG9sB7AsnWBduCk7IGJjeYWaLQKvsbyDoslvaxH+BffFhJMd8v91uLGjR
   MEMEdRyVCZIGi/3lreAPo9nAA6z4v9IJ9WqVTl3HCYOCPBenk5W1ycYz4
   duuCmCQB2OsgEhBrmalpIm4DZqyWp9DOOpG/d0w+YhyHhSkt5HOT4fXe0
   Q==;
X-CSE-ConnectionGUID: r+6elbxJT8KatRmWZBisFg==
X-CSE-MsgGUID: cE5ZF2UBSPKIiDKal2ZFrg==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="9502029"
X-IronPort-AV: E=Sophos;i="6.07,211,1708416000"; 
   d="scan'208";a="9502029"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2024 00:23:53 -0700
X-CSE-ConnectionGUID: g2qITk6ZRDaPgBUNWwHEAw==
X-CSE-MsgGUID: GbiPglFlSGC/0wIRbM6/Cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,211,1708416000"; 
   d="scan'208";a="22962678"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 18 Apr 2024 00:23:53 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 18 Apr 2024 00:23:53 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 18 Apr 2024 00:23:52 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 18 Apr 2024 00:23:52 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 18 Apr 2024 00:23:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j3WAoXMsmyGxd6UklT9s5Wu7K/9HS95epGEQER2Kpm+OtzLp6/883pAFXlPg1eB9hB+dEbXq7CzyZ3zB7y645Ygvh/9PcCOHJGu7uoNEw4eZYIzDgdqzcv2/o136NUp/FR+1yGm8uSKSiX2FCpOk36HpY2eDMiLPE3xKOz1jcdPXBUlMCwpi3lq8nBwQKurBP7sKC4VyppjWyUpAnco9BoQNX5xO46zoP8A3Z48fypfYHi3Ixv3zg3OwymxPqHeQc3Lg1eJd/Xgn7uK8jyPTOVfXMGkWKJEb8eNnfUd9SRUXjF9J1tMGZn9BcRPXdjUF1C6DZ2Tink3AfuyjKOg6uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PniR9fMr0SaZsGTENEAaotzu6g9l8xvJX7ILVTqTIYI=;
 b=Td6/pdSBzZEoFWfNdqeTzhApjk9nNgTNjnjtwrVKOjL0/rWYf5YlsZmiOnbJdIEkF9MelmDNtrZjatBPpafpCCPyWpoxmSKTK0lvdMZr09+QtG+bUm8pgBujt3KB/vY0L3FACZbrh/8gifliIFIQdqMFcJafH82ltdeXaO9SGBUp1ISquybQRfSj90QOhy0Zy18+HZlX1JYZD461mTbBCXGs2sbfGWCxDZb/L01SuDoQJoYT3rkIAlmbPgyIeIhmA1+I5C5gbG+TDZRQzHipDi0tydYVSMmBXYltBBAoTLFhqvAXqA1H+Wj9WP6cIkIdK5OYdcNJI7MQz2W1GIzJVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB8393.namprd11.prod.outlook.com (2603:10b6:806:373::21)
 by SA2PR11MB4778.namprd11.prod.outlook.com (2603:10b6:806:119::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.26; Thu, 18 Apr
 2024 07:23:50 +0000
Received: from SA1PR11MB8393.namprd11.prod.outlook.com
 ([fe80::c0cf:689c:129c:4bcd]) by SA1PR11MB8393.namprd11.prod.outlook.com
 ([fe80::c0cf:689c:129c:4bcd%6]) with mapi id 15.20.7472.037; Thu, 18 Apr 2024
 07:23:50 +0000
Date: Thu, 18 Apr 2024 15:17:16 +0800
From: kernel test robot <yujie.liu@intel.com>
To: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
CC: <oe-kbuild-all@lists.linux.dev>, Linux Infrastructure
	<z1.linuxinfra@amd.com>, Leo Li <sunpeng.li@amd.com>
Subject: [agd5f:amd-staging-drm-next 1942/1975]
 drivers/gpu/drm/amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c:
 dcn32/dcn32_clk_mgr.h is included more than once.
Message-ID: <202404171411.FGKP7967-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR02CA0007.apcprd02.prod.outlook.com
 (2603:1096:3:17::19) To SA1PR11MB8393.namprd11.prod.outlook.com
 (2603:10b6:806:373::21)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB8393:EE_|SA2PR11MB4778:EE_
X-MS-Office365-Filtering-Correlation-Id: 86845359-6356-40c5-5941-08dc5f787ebf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: K27a+DoW1+Q8D3GcGiAz0HcjHnlM0nTWXCRAsvNIomDlHXpbny35e2j+quxFJNm2MbMgqgkrbaDG5wKcq80vbkd7ixgtnBw8y6+euk8f468JjbV6E7+S+khKie2sszmmmLKB3YVNigWc/Reo7ea0wTTFuMpUMmSf2NxFTnjgk1F+1i31DM7038ktqc9ub/PRhGqkH38HhY/P+IOJXiwXf9U/x2hgLTmFKQTntNUp8tV2pRu00wGh5c5zq5fKHoYIHc/oUQwENb0FXo+pzcjaXWBVeWi/XZk5whU6uTBuD1CjXTdBGVd/J16i1LLwwAyjqzKThlpbzL+fyPCaj5ETKE6BYn5kJ8Rb5TRIqrmSX2B8sq2AhfJw8mADNpy+btjlj1VqKLonhKpOst3syotryACLypxiAaWKVlyzjw1ec6b/1gDREJExdQmOyQkGdyvVfnw8JQvCXasy5FLWVOlaXXjgrz/8QOnB5zCPJJJubm46LzP8C9gW2u07wipGgMzRPOid9Y3nwRiQRPqJawfaCRnX2YUNJFGWBx3kGAqkpYlUbAL4/54AQwIJiuFAnafDAhUJvMKKdDciDsWBd36qGBiouEG+VpN1rwINlC0NBy8PxXsKsbrt1NqypLHRxAcZ
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB8393.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(366007)(376005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+9ye+ix3G1NpJJtVqn7kEUMni6CWGU50wna8qX0zwMZY+Jv0pq4sgyKu1fsP?=
 =?us-ascii?Q?7xelwxZ+xe60LsQUvS4jaIIw/n7PGmu4/bN5WV5uxlY++UaBfZm7hCUhpmJi?=
 =?us-ascii?Q?EbRc+Wrge3x9lgGWK5jR1pkUyea/uCKHR60F5n8O10/MMqakgrGBy6VZGLBL?=
 =?us-ascii?Q?YF+JjFI4+0D0RWpcCTX0iLsky3KUaAqS/tjDd+LFmE27vab8zY+V0AByLZCn?=
 =?us-ascii?Q?rrVEZnMNrknYGkTHM/b0FzmMTpnjijKNiY2+LTGnLglpudya2rducAa1MzL/?=
 =?us-ascii?Q?xJv8TqYFa6biCVqxgpvhgsy5wa3yrloL1X12eq0jzjSaGuki5FYMCCACO7af?=
 =?us-ascii?Q?oqvaV1Q+/+1Xi73oNdIV74xQVOdDB3m1qgb2TuOJy6tlLAr21UJFzAvHLX1r?=
 =?us-ascii?Q?jDqbnB2fLzjU4cYWDrf9duL0KwPkRCIO6r4ATpPnlA0+VQLi1fgk0SArMfMt?=
 =?us-ascii?Q?HtCsGaHKOExSzJxelEDMM+vBTHvZAVfnSWShmqkMavi0NlZE4kLH6oM9+yiI?=
 =?us-ascii?Q?DRYvUqUNsyS8YB7Aeg+cjH5T09TDimiDJNtSQh/t72rbHOwbVcDzSP5/5mCv?=
 =?us-ascii?Q?AdJDmH6r/ppnPzkO93L3TeFbS1IhrXmdvNAtjGf3WX44IWbrnmjHQvM/Fc+J?=
 =?us-ascii?Q?0wG9DIjBl50WE2NZqMZollPhseyb4Ezj+cys+oMWEjeZCP4hr5HJ1wz2O4kt?=
 =?us-ascii?Q?tdv72Ce4IThxg97pK4dheOgb0hw9bJoJU+Dfe9caGE3Xf+/DxAUGmDDrcGlu?=
 =?us-ascii?Q?nDIbkplVRm+S80A0I0JroZCwa8qSCU+Erz39QKYNuziEKRtnrV2JiJi+IXFj?=
 =?us-ascii?Q?p1EiAeHZpn/pLaeupQc2UYn2ndFHjJGFWGP/m4sZh7zlDK/AnoA8Bo7G933p?=
 =?us-ascii?Q?2a9BTR7JZfx9OxCpIW/C+a1vMrOfRiywo7C6B9CSML8oWwI1K+/7MYcnnjBA?=
 =?us-ascii?Q?Io9S1THTY1Gza3BV+W6CaLfke9WGNK6r6QSipcCQc4xWrVIWoHYORk7QbHEo?=
 =?us-ascii?Q?mz435KA2T82PkCmAlA3fndiL4qRuX/xyswz9wiawHWnazbB+y1nPktyOgogb?=
 =?us-ascii?Q?0SFtnqSxFDrAyRtq1Gtq3u5UP32X6eMgilHujPxVOPpRUvkp3AV4CdgsqPL6?=
 =?us-ascii?Q?yvSDATYfWLeLrv3g7UKTLFSr1DMRr2y1QOM6tw9SOXSMJo34G0wxXKObj7zC?=
 =?us-ascii?Q?eQkKAJigh3tjwbFO+DOIahcKiFAjlBLSpX7OiRUkAMjXz2vLCzNYYD8g3g78?=
 =?us-ascii?Q?cdYXYdYE51T1RP47DSyu0yugQtczUWYudsz4nxWpCN5zN8FDYL8bRLpyPP6r?=
 =?us-ascii?Q?P7le56jpqOJ4ksKYaeAf+fvMhTtvzChx+ocXhXFOCBP7WVmAfgTacv6nASSB?=
 =?us-ascii?Q?r4rTXEXnqPV/FglzrAyQilvMaiWXUJ5N40jR8RqfixlXqLggrDoLpMZOFybv?=
 =?us-ascii?Q?DCLg08s5C+9CSQkd5Q7VbqspCgfa6cUdGLQ/o5lpXjPI99Y7UTZ1oy3sEkD4?=
 =?us-ascii?Q?HpL3z1CcvwVNdO+7uGmVqgigipZ3x2owI1ddwH0p8R3chx9yGPxup4PB17CX?=
 =?us-ascii?Q?r/opdTXJ6XNNV0FZ5Fw7ByqiF0iDsYUiVFWrlY8u?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 86845359-6356-40c5-5941-08dc5f787ebf
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8393.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2024 07:23:50.7696
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XS/h1IOyHYuJB7eyEhPcNrJo06jmj9alLIDbWjT6HAripvCHi1BXi9gypWc/aDklTk507L5oIlfNyGmOuRYNhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4778
X-OriginatorOrg: intel.com

tree:   https://gitlab.freedesktop.org/agd5f/linux.git amd-staging-drm-next
head:   ff3f4d66e57f7714dd2beafd97a87720f3ce4a12
commit: 6ce9141e6f2ce016678e9a8a4d576b24f9bc5aec [1942/1975] drm/amd/display: Adjust headers
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <yujie.liu@intel.com>
| Closes: https://lore.kernel.org/r/202404171411.FGKP7967-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c: dcn32/dcn32_clk_mgr.h is included more than once.

vim +32 drivers/gpu/drm/amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c

  > 32	#include "dcn32/dcn32_clk_mgr.h"
    33	#include "reg_helper.h"
    34	#include "core_types.h"
    35	#include "dm_helpers.h"
    36	#include "link.h"
    37	#include "dc_state_priv.h"
    38	#include "atomfirmware.h"
    39	#include "smu13_driver_if.h"
    40	
    41	#include "dcn/dcn_3_2_0_offset.h"
    42	#include "dcn/dcn_3_2_0_sh_mask.h"
    43	
  > 44	#include "dcn32/dcn32_clk_mgr.h"
    45	#include "dml/dcn32/dcn32_fpu.h"
    46	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

