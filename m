Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92665293C4E
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Dec 2025 16:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764693843; cv=fail; b=EwAPzAtN3FwoSqo9dGHvxrLqGXF0mgJXtncAs/zwbHrRFf6x/zuZxka+OIvxsaiqZJ2EUaJTo7X62grrbylDTlFaXweMzuVwdLc1YOvypseuN7WpiZiL0KEP6QafhpZIxi7Sm0uTBC6mCiUDO0AJuBfQrStkVLbWCwWsDIXQX60=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764693843; c=relaxed/simple;
	bh=oFVu+4qrLxwjytfI3j4vr3I6qesxP79QbYJfFp5dCc8=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=l6Jc91ThlHWD8BXtEHvr5MGg3Ut41/KO3Pw6ReEBVeAv7tatJBAklQg+3iFEt4hsOMx5ZyAGHaVzGm5LKkhwwEsVdrH1STSvUb/fNVb0qpyWdOJDVfp/ocERZJqhsTbTQ+jeBsrz3pISmwubGtEri9Wh7JtPZw8CC4jt/67r7mE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j8eWB6Uj; arc=fail smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j8eWB6Uj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764693842; x=1796229842;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oFVu+4qrLxwjytfI3j4vr3I6qesxP79QbYJfFp5dCc8=;
  b=j8eWB6Uj1tlXXP+kaW0t4b4buw0QrHNdYauI86lT8KtVi1MpOzzZk/uS
   2lFO4DXXRok7hBBn9y02Gt17M+s/px3qv8UPXiB2D4bFssO8XFdYRLrH2
   +VWJuRz1uEvmKZpbkdy/jfRgnD/aMJH3uV0ttadRSWt7XxkVJyPPJVva4
   BuPcZucVjRH7PVWvsp1X2d6PuHU7Ia8HlquMAN3BXhECtA/gCBiPu1Dla
   9i2qN837VqAqzg6AZblYBWTSPjySHOmwQQrYN697u90uJh/7Pk13pe1OF
   r5nwa2RraF+weU8ug/d9urbVR6CNyX5rA+6YLdLdiGqxsaGGKzcbrQhHM
   g==;
X-CSE-ConnectionGUID: ayczTlq0QJCqRV5gPY6KqA==
X-CSE-MsgGUID: 2JJreRtYSNCgOcrPt7Al/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="66386186"
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; 
   d="scan'208";a="66386186"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 08:43:58 -0800
X-CSE-ConnectionGUID: MKqAgPpxQOa8w//mZe4srQ==
X-CSE-MsgGUID: 56CTE7AsRz61fdJhiik9pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; 
   d="scan'208";a="193522181"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 08:43:59 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 08:43:57 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 2 Dec 2025 08:43:57 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.55) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 08:43:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o5+1mFNJ3IUWXAslkdeQlYz8qw0VnIwD7eMUsz4QVVpe1rC6ZdHIt0tfPmvcHiE0iPBaWSyBBm7nXZYGcChCiZ7PtHL/her8lhiJIulP59ibY0ZHSlvmppqs+VnpLKCsv+d2WZmxk9w2bag53vhRLM928wZxIOG/okoYQYIgkroJ7VYt3SfcBDshuoVN+hamKyIDw1MkLQ+hHCoXDsmNd9NlEuwkiGlSI5LbrRaFRO0m6qjQvtF4hkIeonhuu5/s73yxmJlqfxGSbiFovTIMhn8Nd4tuM7ZM19jJFj7PNhoOijNCD9RsO3QPdXrW+803UBPP4jbiVd0BLhQ6xmRctg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1pes/rAJ3gXqEJdrG1AeLn/Ogd3XOmlHqX12uKoTkZU=;
 b=e4fHBdCP32dKPpCcmXdnid/FM4cirXckxQUZV/ocF1mWG1oFCXlj63B5yPQ/jIByLSWZXYoWY6v7AaS6W6P9py/J+xJc60ZQydJeXc0wfqy0uVZjItqayO/6dyjfFod0cFZEgt9msWNNiywF7zDkb4fejPg0q81FwP2GPntRAWlgi69c/erz8mn9nxL3fj+SLZ7BJnN7w53zig0zkt2EkHDYJGJePQnT3c8gDyugtASJCXzBhv6H1mXW3XewOMekr5YIj57CKqFt1+bk6DYIzhVgCa8szOu+d7fCVKRdztV4xhL/xqCivy0E/qeiFhaxboscXL/u/E/xgOyV59iE4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
 by SA1PR11MB6808.namprd11.prod.outlook.com (2603:10b6:806:24f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 16:43:54 +0000
Received: from MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9]) by MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9%5]) with mapi id 15.20.9366.012; Tue, 2 Dec 2025
 16:43:53 +0000
Date: Wed, 3 Dec 2025 00:43:45 +0800
From: kernel test robot <lkp@intel.com>
To: <cros-kernel-buildreports@googlegroups.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [android-common:android15-6.6-lts 14/14]
 drivers/block/loop.c:1989:6: warning: no previous prototype for function
 'loop_process_cmd_list'
Message-ID: <aS8XQe2Q4hwsjKxQ@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0151.apcprd04.prod.outlook.com (2603:1096:4::13)
 To MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB5963:EE_|SA1PR11MB6808:EE_
X-MS-Office365-Filtering-Correlation-Id: 93dc2d2a-eb51-48a8-086b-08de31c1fa94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ip4iJf25Fj2uKhxkcWDp8pxYRJ0PTOC9B8k6Ttu5ZhG+GJu4PrMxuZEPoRzM?=
 =?us-ascii?Q?zHEq8n/WwqYZ1mbsRLxrRA7nx9GYHUcXNTbo43lldFPAVt0v27qjNTKL0HJD?=
 =?us-ascii?Q?5D6pnfV+Fo8xzGJCyfX9HNd2NVzf++3wSeu8GvEtwPmDgfdtMT+qaOqbdQg3?=
 =?us-ascii?Q?wqUQiL5ebhEcJaiTADRs/CgkfPh4vjexIqvACflrgI84f/IrUhA1XNJGIQHr?=
 =?us-ascii?Q?SjzblQx8NU0+ctg0Z0/K8Kyn8hXAC2EwUfKuCAJTBuUO1MxrUs1cRRbAbUUK?=
 =?us-ascii?Q?7swxnRVs5DAcfpj2zcfIhxR+YNCuSvz8Q9BcAXZ9CTH9McN+uv8l+wh33SCq?=
 =?us-ascii?Q?PNXCLKxobI3bdo5Tep+lcL5WuAxt4ITFamrOOoAyNcDC8/M9qwGUgIa+UktB?=
 =?us-ascii?Q?HFGQ/2ZDuf6OCJTWL7+dcVAExVZyLP6es3PmpD9sp9ByDlp4zD+OANpU7Qp1?=
 =?us-ascii?Q?RTn5suivMATPM1JBJw+YURtP9+uNZD2DtbR7iejAEnffSHm6EYs/t/3feeTW?=
 =?us-ascii?Q?CnXLVnwLkDJoDqGP7/yqG5WMeD5CeMuAmf4xBV1M7hVkt78yK+m6hsxaGRya?=
 =?us-ascii?Q?Zs91AD6eiBV1Qoa2LttT7f1lfUfFnyjinCgkmhK6CAVfPxWX1lkuXLgWPUqJ?=
 =?us-ascii?Q?zl4CRCd9mZSMj9HY5aDOiFORpMIystEAlutK3Q3Kza2REWqugGSduM2cmUqa?=
 =?us-ascii?Q?JMvSh4fiqKBnRJk5OKRf7IcoirSJqutCaMFi9t9TaJZUq8nsxRrSR9CWcO/5?=
 =?us-ascii?Q?ekaR1Jj8+yl1DlQX/mNkDSzaTQlePP4ABmwHI4eEVQhMj6w4zhfnEZ1bZvTK?=
 =?us-ascii?Q?0zaTRrZiCdQ6WWU/mD1g4AOJAL1rK70w6q2bl+rfCL+QG9VAqeFzGC1o8il4?=
 =?us-ascii?Q?4nYBZYHfenUvZJ3k2pSsy5W+bVi6hFcUXI7yqTriYCZffYonHfo8g/ixJPzC?=
 =?us-ascii?Q?/flbD1J6uPFMnVQr3fhhtaWrd9qKAOXPfYlU9qvzw4G4dCzTPRaDYHQ+TBTF?=
 =?us-ascii?Q?YMihGDa5E8N6PDSxAHGnNouZi2UVOmabz4NuKzl94dzuhqCpuDA+2SZoiSzW?=
 =?us-ascii?Q?h05op0vR6bBQt7p/IftjrUa0f2UgHRdZ705H1EYEp1SfTctqAjp8AxqBACnQ?=
 =?us-ascii?Q?QZ1Q4Cod1XKH9mhsOu1iJiupr9JXJdxLOAYsi8iIoiNAbV+8SJV33fNyzQig?=
 =?us-ascii?Q?UBvRisj7qZ5HwH3ok5PeTLtuLMDfIQX6AEl1waZADAVbVC0MbKuZ2s68mC+C?=
 =?us-ascii?Q?EfDlqcDU1MUKYI/Ax2UeM1XVN+wY9M7wXsxK6f6ZThZKgmEvaFAaOvhmoMVj?=
 =?us-ascii?Q?O427Yvop9rKqrHouPZvB5z9qhdTGTUnSYKjy1NxcR41TyHYJ6e/D1sAUAtNj?=
 =?us-ascii?Q?HF6XwQzNMlPQzHpx26Y6b+ftuw5SvVlUqSlxTC9GLLlHOHSXLwtyTtrj9a1Z?=
 =?us-ascii?Q?yiBXIaS4XSL11rbALc3/jZYIplzlrdmapBFYPcmWfLBt5s0AoY5KJA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB5963.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VPgd+oMGSCS0KTV6jw4gDXiV65nkhY4cleFLK2Rec144TLeKLLr6ih8SsYS/?=
 =?us-ascii?Q?HAbSMyRwA8wb+XxM2EwmZnaY+GpnFsMPqtJTcraDnyYk7vI/xVOVLyRm74uY?=
 =?us-ascii?Q?6ekWERoaSg2jiRRAYHFF9BrmTDLc0ArY5xyszvqhqToVQCOSMFP6PoS77ubR?=
 =?us-ascii?Q?PMUq2IjUUD9yzAtG9mDrL4r/cUXlzET/NYuMOX9h33lpuqtajws6VZQLvdnW?=
 =?us-ascii?Q?Gt3oO6QX2EwVvBFYSK83865XLdXa4lYfwZVrU7set9uYszBCWc1Q9ihJ95RZ?=
 =?us-ascii?Q?wR0SJFRaXM125EpfSmuaf7kRLvdRy9hg+aSNk7cjuNU6L/pUN6yH+Ue69BaW?=
 =?us-ascii?Q?ckzE6si0L5gsPDwKEWAnaBrV3XL1Wo6ztnvYPtlme42odSLuafZ/SZAQp5Vu?=
 =?us-ascii?Q?hd6G4WT62QigVn1zj5p2T8UE73Smt0DT6ZgedAp0Wr4CzqmZVWTjOuWQFFP1?=
 =?us-ascii?Q?t68SVGnUfAQbaicwz1870diyIl9pQz71/Wx4lln+1iQrtZsN4F4u6/rwd/Gw?=
 =?us-ascii?Q?sRKEL6oHhlLgldAt7+FL1dOzwe9jBLHTNSyUNfNgV6YTpNmLWrLlytHGibU0?=
 =?us-ascii?Q?PpXXI9dygOMa5Vy+dnJyoQYYLZDsKYOEW6izRNt5LWk8B2ROxMN3GKS4SzVo?=
 =?us-ascii?Q?6DR4t3VPDRKNmRU7SroYD25ugrdkrtEjpRDUb66C2QXAVBeyiVUe6wozi8W7?=
 =?us-ascii?Q?zsHI6dt1v9woVPFRp1lNHe1qT87LmdbnakZgVSexO6OlUw6kd9GEmBXdSlIQ?=
 =?us-ascii?Q?pREe9I22kVONxRYhBYn6nCwVY9XAO/btdHQoS7wRApVh550/cQvHU1nZQxvh?=
 =?us-ascii?Q?6GBPDYUxj5GzUYTo+YQbp0TowaKnlYYERGSvcH9NdN3AxwPpzEmduhVzfnzc?=
 =?us-ascii?Q?zPdmC8NazpbsGGaTtXwnbHl2tKfEYdEQN5Jbcuw+B+a5MgZmKmwbiACTvEzu?=
 =?us-ascii?Q?xgoL9MzrlVORvGnpSu4r9i0dds33X9cd3/pr1GAF6cSBdrYPpEHc7ecaJsb+?=
 =?us-ascii?Q?n9dkFliNTdWDuPgtBQL0aumP5pHsAadiDPjl9tpz9odha5EyYO7O7aIECmm6?=
 =?us-ascii?Q?hn7pc7eQ83HbTdJ0ULuhkpn3c6IvfqaMyGZdhMS2XMbo5BtwredFz9k/Pgt9?=
 =?us-ascii?Q?q9WMQYVTyrje0AO7h0zQS0efADLCnBLEEgdbmPMi7iKGD/kwwWid9euTCFel?=
 =?us-ascii?Q?gqBO67nm4r/ImuFuCOftTjj99iPsZy35cp+ZwB2WrQ16flH5FT3FUz9DfMBp?=
 =?us-ascii?Q?ipaXIBjYr4v92aIbkD5nIInzPKO9c3jaXVDQfMWUZ2YsIP6TMuqP6kXmWInd?=
 =?us-ascii?Q?+21fLR12BXIfOgJ3Am6hjPTAGISYku3lgBoUczhqGubyS1S19OmvCq065BRT?=
 =?us-ascii?Q?oQ7CobMcyltHkd1mvgvPhDBjNJIUM7rP+XGSbUq8LIZWgIibnLQXz3ZiUIc5?=
 =?us-ascii?Q?cyypeY4b8bxePdf1pl73N+frFfahI3lE6xUItxFYrC4+K3O5XsMr6qyhzmYm?=
 =?us-ascii?Q?rWzg4TG+mckCf8WkxjC/lUwhEMx76q869l/JHbwe+FPVgFTIQodh1WvXbtO0?=
 =?us-ascii?Q?8FtwMSuwMjN+15G6pPMaIvZNk2k7vX68/1OwLAzcincHBh9viq79Kev73QuQ?=
 =?us-ascii?Q?DA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 93dc2d2a-eb51-48a8-086b-08de31c1fa94
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB5963.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 16:43:53.9139
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AG7K24/wAR98Gm/n/Q9GFzbt5P5P1om5aqmwAwpcH16dTHnKYUHY+KQhmIln6kEwK5P+B3U1rJP6+xtiUS+Gzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6808
X-OriginatorOrg: intel.com

tree:   https://android.googlesource.com/kernel/common android15-6.6-lts
head:   039073ca9a42736c777c0eb2bb7f177568c5866f
commit: aa8a9034d8a0e18d37fff6c6053f470be77637ae [14/14] ANDROID: loop: export loop_process_cmd_list
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251202/202512021118.vPp25EEq-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251202/202512021118.vPp25EEq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512021118.vPp25EEq-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/block/loop.c:1989:6: warning: no previous prototype for function 'loop_process_cmd_list' [-Wmissing-prototypes]
    1989 | void loop_process_cmd_list(struct list_head *cmd_list, struct gendisk *disk)
         |      ^
   drivers/block/loop.c:1989:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1989 | void loop_process_cmd_list(struct list_head *cmd_list, struct gendisk *disk)
         | ^
         | static 
   1 warning generated.


vim +/loop_process_cmd_list +1989 drivers/block/loop.c

b5dd2f6047ca10 Ming Lei   2014-12-31  1988  
aa8a9034d8a0e1 jiayingrui 2025-11-10 @1989  void loop_process_cmd_list(struct list_head *cmd_list, struct gendisk *disk)
aa8a9034d8a0e1 jiayingrui 2025-11-10  1990  {
aa8a9034d8a0e1 jiayingrui 2025-11-10  1991  	struct loop_device *lo = disk->private_data;
aa8a9034d8a0e1 jiayingrui 2025-11-10  1992  	loop_process_work(NULL, cmd_list, lo);
aa8a9034d8a0e1 jiayingrui 2025-11-10  1993  }
aa8a9034d8a0e1 jiayingrui 2025-11-10  1994  EXPORT_SYMBOL_GPL(loop_process_cmd_list);
aa8a9034d8a0e1 jiayingrui 2025-11-10  1995  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

