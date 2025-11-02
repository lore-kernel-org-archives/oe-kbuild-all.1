Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D225614B96E
	for <oe-kbuild-all@lists.linux.dev>; Sun,  2 Nov 2025 02:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762049014; cv=fail; b=ThvdrVv5XuWupSSevb6/dTxY7JGjPTR5Bq/UeGjPI98gxpGH+RE92zbv0PBBZBGPnrcaZnSGPfgmPKj82m1shObfZCUuTIBGSzXf9MauwGGHOgx3kEyVMsEuq31vPmE5D561exGJYK+GqU5ZsMnwMMml0T0brPeUn3M6098uHyc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762049014; c=relaxed/simple;
	bh=jL+vw0qQoM37+uicy1Y3AePmoXwnGpazjNGJMPLWjeI=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=UAtO5u2ut4eWXgM42c0knpv49UPjfl2DkHT1OneMQuXJ4lxc/cMJfCQQf+5Zhb7Mq4lyLls/1kemv238Q9ZO6hQ0jl64ynplBh/m6n5gtR2T4UcPo7uA84UZLq++0lzEGQVqCcfwJnB3qdBeje8wPql2qtYaV5y5VEQqZeqPwuM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fl6H0Nou; arc=fail smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fl6H0Nou"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762049011; x=1793585011;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jL+vw0qQoM37+uicy1Y3AePmoXwnGpazjNGJMPLWjeI=;
  b=fl6H0NoueP2bzpvRJd+E5dx70XUuyueiQl1VTsskE/ICR2kTLe3pyDM5
   VnjB2RIWTNp1enWe2/1VS2+ehy99DU1OZVOWoQp4PzB0RCBat0lcu2PCq
   9RFr8ldJzXwwE56UDDDBe+sLm4LCWAERwVkl/ozupS3a0i3KiWsZw4y6I
   LVnM6nWVVKu4FfhtV5G75RlwBYb50TLPB26Nj9Xp0TjCCOyTOvyyX4Rkz
   fHyJIN+k5h+oQ5zyqYf8fogjATOjcku/B2uqICxNwSI63B02vBAAfrwTW
   Q/eUsSZhBEGYcpJQq/eMrdwZ5PbHGkkPu3BRvlTZjkS2pxY40z3J4ydao
   A==;
X-CSE-ConnectionGUID: +MTcrlvMQaiRX6B5ox5qZA==
X-CSE-MsgGUID: QFGw3SbXSVG61HM7XuYWHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11600"; a="67822643"
X-IronPort-AV: E=Sophos;i="6.19,273,1754982000"; 
   d="scan'208";a="67822643"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2025 19:03:31 -0700
X-CSE-ConnectionGUID: 5AxVe9o+TOevjGbl2qIlVA==
X-CSE-MsgGUID: T3FqbFH8Tkm+6TVQPUWYeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,273,1754982000"; 
   d="scan'208";a="190894625"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2025 19:03:31 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 1 Nov 2025 19:03:30 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sat, 1 Nov 2025 19:03:30 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.65) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 1 Nov 2025 19:03:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SI+hYaJeWyi8in+s7dKk+D20FB3OrTCGpZbb0u3olP5ARyvcqMTsajmAI3ToOQB35rsqXbhMKoDxCQD1Y03eZtQLs7uwYTx0fEvbJu46zVLfAGpSOINLR+vQyd4nzJYYH8twdPV7otRm7QB0udPfU+0TQPetUEN7eJmQn3Wf5YbrBv1tO9EGuJvFRo/fuyPmawiD/a1wzUCfmIeQ+F/RGUHCrxflwvP0qlUEsXwOzzxsUTqr3PUuQk2mD4Mm/5ZKDpeyBjPtNKrRnVwDQeCQG1bIg+RZTr1lUM+jMl8DAUnYepXeMJcXs9r/7NwEthDqeaj6wToKC9LJT9ZYOfudtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1cM0giP8oL+i4zOZc9eDDucdcHCjxGplvoezeaMmnzI=;
 b=SxGL0OgjE/IoXthC1bIUTzd49RzW+h3xjKmXpnanfuewmg8LjXsp2ECKZFnuUewmt7y8tFZGOBWicXSCskz0NGnHPZM8XfBmGCSk7FKuKLbYrIVdwc/gLBwulii/0cHG+B3w5rxfYWzwBbaLXvyyzSfUK0LpZ36YJ9Ie2vzRfxKaUDgVTtrnPrLUX7shyX5wIY06Yn2yoTN7uGNtt65kbbdYNIV4ndFmiiGqoRN5M4RL6a7MjXPnUSX17vgEysFVeR1942mPd+seXcJonQneOrxKiuIl8NfLt17BSc/psZlKKHQDdXKKEWTxepX4I7f9P1YAnxjxIcTqxmEccJs8zA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4165.namprd11.prod.outlook.com (2603:10b6:a03:18c::26)
 by CY5PR11MB6416.namprd11.prod.outlook.com (2603:10b6:930:34::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Sun, 2 Nov
 2025 02:03:28 +0000
Received: from BY5PR11MB4165.namprd11.prod.outlook.com
 ([fe80::d9f7:7a66:b261:8891]) by BY5PR11MB4165.namprd11.prod.outlook.com
 ([fe80::d9f7:7a66:b261:8891%7]) with mapi id 15.20.9275.011; Sun, 2 Nov 2025
 02:03:27 +0000
Date: Sun, 2 Nov 2025 10:03:20 +0800
From: kernel test robot <lkp@intel.com>
To: <cros-kernel-buildreports@googlegroups.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [android-common:main-16k-gs-shusky-5.15 23/23]
 drivers/ufs/core/ufshcd-crypto.c: trace/hooks/ufshcd.h is included more than
 once.
Message-ID: <aQa76DjjnvvotROW@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0156.apcprd04.prod.outlook.com (2603:1096:4::18)
 To BY5PR11MB4165.namprd11.prod.outlook.com (2603:10b6:a03:18c::26)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4165:EE_|CY5PR11MB6416:EE_
X-MS-Office365-Filtering-Correlation-Id: e0786cc6-243a-4302-d29e-08de19b4037c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?eMX7mo92+Fw98SzMZbbueSWa7D8hOyO39wbt2+6HIMgnW34UX/KwZKlSW6dH?=
 =?us-ascii?Q?5pToQLHrzgJSNrb6AtN77HWrOEG/CFGn/+XBkcZc5ZPVr473gOMZ+g5Uu4DR?=
 =?us-ascii?Q?9D7kDoqga2qxBHtX7tQNX4Fy3Y4GeQaKz8/IUgv9JI53uROdGbLtzrazxBp2?=
 =?us-ascii?Q?MxrMtqmeIttbvr6wCDEbAtJj+cpXPS0b2ciouz8N/aX99Yqmraa/2iVLM5kE?=
 =?us-ascii?Q?A5l1BNcYMaVDRLNr6ui5DFXL/T9SN8faYE1XKdRjG+tD35ZQ/TD5dRJTGrb4?=
 =?us-ascii?Q?99eMPb5XqS1zKZPvl9yd4J5oiaaLClSRllHdHP516wprBY8TFI26BRFvYRCb?=
 =?us-ascii?Q?DzZc75AsLoMk2akr2ZE7pcJgPtjsh4VOrH2HfH4G3cg2VkVoV95QFjEk78++?=
 =?us-ascii?Q?TYBR2K8jB/uKQ36jXqba2RPTD9DKPMwIkmO65sLExTUkX41J5WgXavjpLglO?=
 =?us-ascii?Q?IuWiYvkqPMnJaqIkqHEeoG8nIQqyXQ3aHrBk7980gww5ygvgU+vimgHXum/c?=
 =?us-ascii?Q?2ISdklvbWWhJxAr54v638elSC35+ube1tsJf4tPZgH/EMGXFKT0Opkir7Y5r?=
 =?us-ascii?Q?ARHxeo7wsBquY4SzS1o2REw3pZFqDeNIoDvx66/YC8JgNc744meVT8QTnVEx?=
 =?us-ascii?Q?3cwYsgBVll8ualQsf2P6AB+7w8kAE4k5tyHcVcsx+MjAFQfFjdGyW1elle5+?=
 =?us-ascii?Q?oiAHbHnNFO815UnJk7R1gUWWRkGUwY7qLRZpZu6Wfdd3bgHOXEUVOuU/Euhi?=
 =?us-ascii?Q?5/GbBuqlECZEdbuh5WzQDrlBZPrm2bJxUPYJvWtn13GLaVRgI4lCQ/aGvxXV?=
 =?us-ascii?Q?3gD6D5KOzo8v0Dx19xgrLVxJPavXcR/dxk/RMyPhhXD5DM+TNDwfiTjAmBqe?=
 =?us-ascii?Q?jK18HISHC2J70J+5CvgmFYLaMv55y0IdFFp8a/gdvos8M+lnr8jXVjFaozMq?=
 =?us-ascii?Q?41Z4E4aWuA1CTi9eYXRoNYb03PwnxP5L/8HNoR7Aaf9CCwTZ2I2uNigEDmLi?=
 =?us-ascii?Q?h5X6l4LET7K16iXLbze1X2pNB8qw0rIGCsrI1y21JXOXMIc5yspbijSj1QBj?=
 =?us-ascii?Q?jva/BlcuUzQCeBb96CCwpwRkV0pwZj2Hph584LmXntt5Dv26KPXzn9FouOSF?=
 =?us-ascii?Q?bVy+f8kTd/Yw5wfaSPWvhzBLDtZHRVn/94ef7z/ESt0CneBWmTsuXO23oT0j?=
 =?us-ascii?Q?rUy963HWpWNiIkO7LJNoZWbcN5XHl2svHAJcayVHrwk6/5pNvr245xfQE5Sb?=
 =?us-ascii?Q?k6VuMZukplSRz+WKHgUk4eoBYxrGeMjz9E9QZ2bTWK13k/F8CnrL9p1G51bT?=
 =?us-ascii?Q?FxSZZBT/cPf3VOhjFMhJNNz7xYJSmxfsrwlzEDQ35MWKRVO3wQxB0XqteSdw?=
 =?us-ascii?Q?mB58qUgtqjn7duMgwEFhPYuaxqM2FPz+hH5wpJ00gpVoBIekqmMdR2lhi2TX?=
 =?us-ascii?Q?zJqR0cnHlGE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4165.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BDM4gmVwqaSinh2tST27p8PPsB7bwWl2QPEhkBDl0f2gr1BumGrSzIldUUBV?=
 =?us-ascii?Q?0BbDE8F1zfZSPSEVLp6G8vu45BWas3CKimF1+BdKXWHp91iWMRH/jxBCv2oU?=
 =?us-ascii?Q?ZHqKpxtK+NNQUeEN0ZEiczPnZ+k2luy6Z3QHG106d3JjL6peZtBaCmG4YNLP?=
 =?us-ascii?Q?KtapUlgfZoBNEsBdH3ekYZKIHtYfAxxQZ6Fw47DWZF6iwnQqal+uS7jAOv4v?=
 =?us-ascii?Q?yO6BE4SE1IKhP2rl11KTiIMKoHhiOC04K+f4cMOq1kYXukdt9jOGnwNMKwQt?=
 =?us-ascii?Q?peA7hgHfT4BT5nCdJdqWOVWYPqPZ1CRfPA74tpmugqmiAQGZX9jl9sLl7Zed?=
 =?us-ascii?Q?U7n9/+e4bzL/ipphhN+8TcBfdEtegDZqDhaMegsEIhJTe/BaL1p0WwMvz0ej?=
 =?us-ascii?Q?5WseLGcDmGXhkMypBun4kFRWceu5IJD1Xba/DCst8/BhDcWV0/jiXYSuWcKL?=
 =?us-ascii?Q?I66RPyA4M+LOr77cg7TfMstQQCoasvePzhL0pmHhSdlCJ5VtUDZq8nB0/weu?=
 =?us-ascii?Q?aEW6bTQzu3Mvn6uJhdStE01kUybthma2QhJ1pMqadHKzfM5/Dixr5ztNbLPY?=
 =?us-ascii?Q?rvyHniFOwgdLeOi6QD3p9YSzNxzFQ/0Tot6wkZQzqAFJj4w1Dk3rS9IDqrl6?=
 =?us-ascii?Q?0UShHBsCS5pT8rWupp1mMFsgzPGv2TaEYKHdCkzOgb1fcHzRlr0jFLWBTuSa?=
 =?us-ascii?Q?fJHwLAkUPMg5bP6bALgt7HWjDSS++qsqTRkZTAXsp5VJZ+hiMDlmB0K+mYPc?=
 =?us-ascii?Q?7T+Lhd9yDRgeTolVYxdNsS6gJ2CV61o8Ycp1q+23QB7RVEYmDdIbV4RxrHTs?=
 =?us-ascii?Q?g2J1WJIUeLCtx33CsOWG7PzuzDuBQlb3wHL8B6ca9rQ8APzryd0YMflYAFaW?=
 =?us-ascii?Q?sKkkJv3Nf1jbAdu4Y7607jn4EOPrjdJ9u4jDzePvpqPW5SkKFN7bzo1PMVv3?=
 =?us-ascii?Q?ritf/J5qGpbfS9hqtT3kpPxIjARjoCAu6fKD/fZmsm5E8K6VcI7vTBg36Imd?=
 =?us-ascii?Q?Cw/69ODdohugW0RX5z9abtrnM72KeO/zD2V9RFUG8tDyLWZJaIb2u730x3MU?=
 =?us-ascii?Q?dM670IWvwCYakHYs5oBuA5o4q62Zu4MJxN+UpzOpIZwqNJ0pX39Vs1sDPdF1?=
 =?us-ascii?Q?9uvgOHkggpJRnOCOdWbwDsdJWjgLiSy0gBIvF2V3xytszJPMjk1UZjWENlrF?=
 =?us-ascii?Q?hTzpvOkLbB55s6QPt2KDLJgV/FnKOG4IH+xd9EH17zbrH8WytkJkKq7I1Dl/?=
 =?us-ascii?Q?NbOgL8BaVmcg9kbd35oL3pYdBcvyXPgN75gKvsZmhyKo4rNmtMnkP3f6blVv?=
 =?us-ascii?Q?4mmIOEXAegu1f7B6BRiZ68ulhn0BcHsIiP+Pj25XYU8SBM9xIfBocuTYyAHy?=
 =?us-ascii?Q?evED5CoRvFgdJZLURxazCxDAt24OigH5ylObfsJ5gdwh/3KXVzOLTWTavnLR?=
 =?us-ascii?Q?H241lMUrCq2dZ4ULJJ9pld1z3qNKSBrwEOFTuhRwDluolP6gl66A9Cty/UZP?=
 =?us-ascii?Q?SphRULb4Q+Rr5owd3QLSoRf5EzUBXz4ROvTf7Gd87PjdQYx6O+wuHAKF055a?=
 =?us-ascii?Q?T/3yftzHZNuHrokp54BMu5juj9FmjpWGrn7Bdn5qx9KOVYH4aJhkeEp4NGGc?=
 =?us-ascii?Q?BA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e0786cc6-243a-4302-d29e-08de19b4037c
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4165.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2025 02:03:27.8475
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CUDEW6EFiwcmBw59eJJ6ge1NWteTnA9rySvhUtUCO83uxJt38XFM7Nxh5A4KB9b82R4ViDUoAjkHsl2ykzZbGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6416
X-OriginatorOrg: intel.com

tree:   https://android.googlesource.com/kernel/common main-16k-gs-shusky-5.15
head:   90b05bcbb174b28bb0bc20f6d7f68c092a66a64f
commit: 93f55093bb2cba35d6c729d2fc0361bdef7bd1be [23/23] ANDROID: scsi: ufs: add vendor hook to override key reprogramming
:::::: branch date: 3 days ago
:::::: commit date: 3 years ago
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511020020.pSdzEvdw-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> drivers/ufs/core/ufshcd-crypto.c: trace/hooks/ufshcd.h is included more than once.

vim +10 drivers/ufs/core/ufshcd-crypto.c

     8	
     9	#undef CREATE_TRACE_POINTS
  > 10	#include <trace/hooks/ufshcd.h>
    11	
    12	#undef CREATE_TRACE_POINTS
  > 13	#include <trace/hooks/ufshcd.h>
    14	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

