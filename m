Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B269939A7E1
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Feb 2026 13:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772114246; cv=fail; b=l8O+QC7Yf3PnAcy0NCKAeKYym6VKo1xGpn0kCVOSunmicB8Mwis23gUL0o4oFUEHnj8y14XUo1oeBxIrYkL341DiaAHxWZk4WcqI52rU4owkaDNciQKkkxjnwSqPwZbOYa500LZays0V5MbX3ZiB4TPgkGoCOCwrLlCEl5sGb94=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772114246; c=relaxed/simple;
	bh=NDu0tV5xqY4f5rI/eNF9J/26hlwvcN56e62wk3+Xb9k=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=K5j48uH5ur5S53EplNVn0eAnLk8JRR5CrnG7tdhtPCg6zWmRUxCsrornoDzQ0aTZmFsM2WO04tlqi85DrRmajyZfoiPc5Ihic01ocIrLBr7gJhwYRTjEuLE4JkBkrQfK7i0Bccg8fnBGagdwpbmTNUTVzjj1pvTOe1nK4JUZeIs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XVboplg0; arc=fail smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XVboplg0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772114242; x=1803650242;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NDu0tV5xqY4f5rI/eNF9J/26hlwvcN56e62wk3+Xb9k=;
  b=XVboplg00ub1Cs6/L4ywjUOdguWHWoASfUlYWbHU6zaA2/t2PYeq8OBJ
   7nWelTtVfS4daLbGyYPAbIM/MKkIj+K7D8098fjSGuAaosveseBpCPdLJ
   pqcoHS/kdlyZEs+9Vxsr5ZlnAZbuyeFhESYy4p9gtYE014143V1cZPNCO
   kcO1MtSYsCcLwXJpgvQH2EBGGjGBmBqJZyMdQubrAqwV1+QEELkw71QXL
   x2ytFMoQ1eeG9TrSbjFtKq4pjqlPKTzyzb8Do+OYBoL/EzeV7MQ/kKLlF
   ybDQlL/V874SObIWEm0+mbWkxWUAM6X86s+SENqJqcxLnabnjgfERGXIG
   Q==;
X-CSE-ConnectionGUID: nkRWTDtLT8yjaGQUOy8FoA==
X-CSE-MsgGUID: CdHy+V5SRwWtuZ49Uhav0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="83883503"
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; 
   d="scan'208";a="83883503"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2026 05:57:21 -0800
X-CSE-ConnectionGUID: 1tkPyUkmT6GiGBEgOGeOfw==
X-CSE-MsgGUID: kB+i9+nETaOM5YhYTV/piQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; 
   d="scan'208";a="239561912"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2026 05:57:21 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 26 Feb 2026 05:57:20 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 26 Feb 2026 05:57:20 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.40) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 26 Feb 2026 05:57:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n+F5npmlkapOgGjzUXqeN2R/opLCKYaAvqIrHCC8pTCfj5Rmq27xN/SqYLZFPSBTcztaHk9cya2hRZWbUA3TJ2j8iHKRBkGwS0Iyhp/2pBclhMnDWX4pKtpnYflFliWKG9PJEPHNl6VubUxARDhrmlqK6BNA+uEN2CYbAwD/J6Yj99InQNnHj9TDM8r+wdbLqyuLpD+P18xggqGaGpgHoaZDkGPoGvNeoqocYU4MdfSzEdXKpC2Pj1w5HUYG0QZBFQXu78dFH18q95RUIGod6g4KGX8JMtMXuObmx1+OqnvTwrsQrgg6ZIYfO5dICj3wpzpegQn+q6zoCM0Fanak0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yhOa+dsdqE7dMJwEXUoloY0mJSZIaOWY0X5kjvohxIQ=;
 b=hlHBfsS5MZcrjCeAjl0TfN/wX/Oc5uR/zTano+9QyiE6Wgp/2Go7tZnxIVWC5BtLdxQ7y3JM7g1HT396gfvWCrSmIpUz4IbxA3FIBmM69iy/+Jr4aLZ78FprL+TllM8rBwSUKXE0rIjkEiBmoIvEbTfU628MgQ2Sxqb8HxR55zp4hXz94orFcHgZmgkpamjGpYah5ADFM+yaS56sBYwbzzgeeKNwhRNKGYoBQc2UBzPh1R2bdijBgFzHlijjDcPw78pwC54tePrZbkJO5g4Qaw6b9J63Mw0j2484LVana+MkaVObGp0Q5er48tYptf+ZVfmJBVprAQ6f280FCChyWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8468.namprd11.prod.outlook.com (2603:10b6:610:1ba::19)
 by SA1PR11MB8573.namprd11.prod.outlook.com (2603:10b6:806:3ab::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Thu, 26 Feb
 2026 13:57:17 +0000
Received: from CH3PR11MB8468.namprd11.prod.outlook.com
 ([fe80::8188:d688:bbca:2394]) by CH3PR11MB8468.namprd11.prod.outlook.com
 ([fe80::8188:d688:bbca:2394%5]) with mapi id 15.20.9654.014; Thu, 26 Feb 2026
 13:57:17 +0000
Date: Thu, 26 Feb 2026 21:57:08 +0800
From: kernel test robot <lkp@intel.com>
To: Leon Romanovsky <leonro@nvidia.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [leon-rdma:var-tlp-v2 12/28] WARNING: modpost: module ib_uverbs uses
 symbol dma_buf_move_notify from namespace DMA_BUF, but does not import it.
Message-ID: <aaBRNAK3hE7rsPsR@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0164.apcprd04.prod.outlook.com (2603:1096:4::26)
 To CH3PR11MB8468.namprd11.prod.outlook.com (2603:10b6:610:1ba::19)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8468:EE_|SA1PR11MB8573:EE_
X-MS-Office365-Filtering-Correlation-Id: 7190a691-7201-438d-c20a-08de753ef361
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: yqJWfyGF6hNuHZH8/pLOedPs24qru4OTlfhxDhF1LxZaHUiAeEo80Wwa1ERtBA9HUsPzFRE1XfJ+bMV3hA16vGb4F/beZypb8I6w6f5+YN+m3OU/rPhubsgn/kqRE/blOCW57C6ipBqDk41kWvdlzdfKUF2PoRSid1D+ybu9FMV7DozF3ZMD6PyL3k4gS3bUX1J+dmFSfxEXe9YKNJVSSi9pKL/ofWjsCfJzWpXDbCazExYKBPXYW9Qk9ItKgoFMMwpeTWTOpaacz6Yxz5GwhNFqhMyo+lBKS0RYiN/B9aS1w71PIrzg/iH0YmefpprX0gSq+fCGssvL29dLvPG6oTp9PnZzyuCzfbmzIa72RplK97FZnUTZVsMs4tWBU78L+iqHN0THe/iyVUPtFzzsSKyrOZ8ggt8y9YDmiNPzCUzp6Y7jgzYamtn8e9a6dA6BOtt7D8plelBDGMnpBimLZAki/zY91RXVKyRyGJO8h7xxRlbxjZxKVFt6lBjzt106r49xlWIWx5x4YfOTvkN4avd2LJ71saRE1vSOTr4FS/Nn733SSpIMNgyhyZhuK5vzxW/CcvPlZFzb9KqZvLTamJwycoMAr4X8yxiLM6vWCiGmqZ5JI84maFKPhANfv/5LbwBdhaYjNX9XtDs5wHBzXvabHX0/Xe2cSvMZe5siozu0h41byf0vulHkhhd7jyG7t72VkRdaRQBWtzgfFVv0CA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8468.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BBaBndAqCRTVmXpYb6vElbPR1Ney7HFtInMDSkksacAuQcKaVtGvd1Nf+q8U?=
 =?us-ascii?Q?hBhDQjIqoOZiOTcTXzuCA8K0Ixjyl1Kg6rfqTu2tWnbV3MQ2wLHDkd6WnsVs?=
 =?us-ascii?Q?ZBHV4UTa2h7lr5xOJGZKVpaMchN/sqAd0IdTB8I/nf+rQmCMMvl6pGhNpgBM?=
 =?us-ascii?Q?1TluOEuj78qJR5xtCuMRxLKunYnvTby8DEpmRRsFasPmTBPDwTcWyM5PKqFU?=
 =?us-ascii?Q?xfdV95TW+pCBgj77cfmmaWwlYWZBCh/1OENVgSl2ZD2D+TzCSsh3CsgUZxw+?=
 =?us-ascii?Q?LDLTt2SCUFs1kDMDhyMkOV+5tqRlTqHo4CN5T6a7hRiMWosQnB7DBqD4ai6i?=
 =?us-ascii?Q?gc9U76bOAM/Ees6PHL21UpKTrVYiyHbb4fHjYmwZA7y1A7vxe2+iUL5yNybj?=
 =?us-ascii?Q?JqeKhS+VxGd5ynA9Rtms2zGQxLAkM1Df7FlbPWuL/619oXV1Fu/UG2ZYN0D+?=
 =?us-ascii?Q?tzU4goBag3lQKLwPfByg4KnJbGXhI0c+PTpBZKjRjYsjgeYk3rsh6GK3EO2k?=
 =?us-ascii?Q?XL6NEEZwJx2DYuVL9K2q5e1mzo9Gwb/9clA7DDSEDb0/glPQ4HGEyH5Poe4a?=
 =?us-ascii?Q?0j02/s00NCw2y9zEkVw4wuF8Fis2RBFsoJLsDOhtHDMSbD7fC5vD0vqkVoX0?=
 =?us-ascii?Q?6W4lWLGEZ5dLgqrSAXWnnx1yj6+JHzmLZsg9pAFbhfAL6fd9ysYMB9vU3jrx?=
 =?us-ascii?Q?bzJQ87Ky0BQ/aLLcQtmr9BlVPMRlz6QZiqIraFDIzbJWkYEXNlAg1aiMcC/I?=
 =?us-ascii?Q?YSCHZjEDPlUJcVfd7foyQ9vCqvn1F2XgkBx4KBZJaz6aCBfzKQwwXu/FLD32?=
 =?us-ascii?Q?At2F/veqkXjuayCfVHt2vAHrnqua3UKbpICzQx5KwJBJ+1vaZHHyBFpmyhYR?=
 =?us-ascii?Q?052FfLNTWVaPK1w+8UWTvJ75hBUaDvArFB1UFwBlTGrX3hGyAfBmyp4WQI5c?=
 =?us-ascii?Q?75QPt5f8b3uqdMEqTJ+DZs2A5Lli9xhxuDjlX7B0jbP7/eY95Dn3Qtqib9EN?=
 =?us-ascii?Q?s76yA7xQp5pXPfmk491uh/BY2bsQ5zoW6oWYcRzZOEBphnMm4QW6VX8Dr+y+?=
 =?us-ascii?Q?PyDMxfVXWulh34NUfobaaKtxxqMvRa/aZFxZZXpaQ0gRqfznIr1kt4wurDnU?=
 =?us-ascii?Q?9FRV34bRsOZDIRc37YvycLpU/SOITbpAMXzirrtR22HtaQFuYrkKzHoAcSoK?=
 =?us-ascii?Q?OAXTmMYZQ/5w9s9UT5Yi/7EFjAwsRLjuNkdvTOFi0CDDZ46HIO7X0L+f6G7b?=
 =?us-ascii?Q?7z0WvJyWp1SUch5r2FLzcC/dxJDr8mp98Aw8fRxYuWKkiz0dB3ykYRfUctuq?=
 =?us-ascii?Q?aJoqDmSNzU2/VBimF5z/lc9omgNbfHf67SiZccrbsaNQ+3e9ibJ5BGXG4GG/?=
 =?us-ascii?Q?jHyg9RPpSX+w8hd7rFDvfGhPvQOytMSVl18K8GVlJdQQGXG34gkSRsz5mJTC?=
 =?us-ascii?Q?8gzkELQC7wP47CjSTnfHOsRVSY4TJ/Wlvz08o1P9BD3T1brv3gvo2OEA5bW8?=
 =?us-ascii?Q?R6C8SFOiucBBt4v8CTqb015ucTbXnJK/jrpe2IClW50gTriB7dpO6KkHKMx/?=
 =?us-ascii?Q?8SSf43lspIxvLX1OT9MJNlS0aN4h1NtlVRZjH65vLWUDLkxq/iUXiI5if7Lc?=
 =?us-ascii?Q?BXfOKoc0boAXsUq4Hm16QI+G91qRbZ5o2M2UICBSExX9aKHplIEhJLPn+BYg?=
 =?us-ascii?Q?QhuJWdec1FBXdN/MxXbr+WUUCkpbUub3sloTwH7ljvDDWffHdR0FPTXyQQsi?=
 =?us-ascii?Q?8CeOZL5N0g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7190a691-7201-438d-c20a-08de753ef361
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8468.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 13:57:17.1084
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8HBP1hIStk62LuZxRlZxr+ccZfvKDnRIfPlTutpzi0A3cCfvT9NCSUW8ovtnUDobfwDvnl4eY8wTNEbznQCkmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8573
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git var-tlp-v2
head:   020795e4f34c4e609bfcdbbf48423d8f524afc05
commit: a731c8626507d2df0b34a572719e3e6efcf10530 [12/28] RDMA/core: Promote UMEM to a core component
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20260226/202602261714.4vDNLi2t-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260226/202602261714.4vDNLi2t-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202602261714.4vDNLi2t-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: module ib_uverbs uses symbol dma_buf_move_notify from namespace DMA_BUF, but does not import it.
>> WARNING: modpost: module ib_uverbs uses symbol dma_buf_phys_vec_to_sgt from namespace DMA_BUF, but does not import it.
>> WARNING: modpost: module ib_uverbs uses symbol dma_buf_export from namespace DMA_BUF, but does not import it.
>> WARNING: modpost: module ib_uverbs uses symbol dma_buf_free_sgt from namespace DMA_BUF, but does not import it.
>> WARNING: modpost: module ib_uverbs uses symbol dma_buf_put from namespace DMA_BUF, but does not import it.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

