Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A78E6257828
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Apr 2026 00:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775867644; cv=fail; b=t+/yo35/YMhnbwTpi0ROr38MRxwmw/klLSkWbEVIrhwQmw21RzbQ5QtC9ab7Oy+KZj3Qc/4pgwOmi5zgDEBDLAcrVmNwkMMRojEuMfIvoSdGpvC9Z3rxDrmLBUnw8SS0epjQNlTDDkX2jb0x8p98mUJQvQmXGqYrsEBfExlEKSc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775867644; c=relaxed/simple;
	bh=MW/sY9N7dHgsHKtJ4z6h3EBDMThLKisyKLPSg98etOY=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=dhklICJ4u8CHa6TKnZnc0BdCRKDQhmKO14WmJUJBCQmaNkC/FzhpUMNXqGTImxkud5LaxRjU7TAwb+czPUoEnjBJ2dr9QAH5S+t6SZ8a6yQu1FB0sBhfslefzSl+q3Jyf4EsWmiRs/yYlgBJmeYWqh2dbyxDOohI8iMtTLuWxxQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FFZHuuwu; arc=fail smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FFZHuuwu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775867644; x=1807403644;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MW/sY9N7dHgsHKtJ4z6h3EBDMThLKisyKLPSg98etOY=;
  b=FFZHuuwuJrYQV5EtBjVOSdOQ//Je+ScoMVZQMUrp106YUTThg5UIb3s2
   JkYT0mpHsUYXjN587/U1MJWLbyj20MLN3mvASXs+48CyXmAtoDWw6EEdS
   0oImHOU8QtEsnjlY3LY3ux7udwcAeSDe6rSDftOECYc2RQpM4xTmCwpt/
   PlZn7YY8OPRdUPHJAaxn09HyUne0hD0Euh6vHqWepM/adxRiZAmciBg+2
   EkrMy71O1/o1zy5dIO1Ba1vkIW55xHI7KeNGcktk+HocUGyCtsfaODN2F
   jKFcemc4li2qS6N/PeqkxVE1eiPiiRuKwgrvOd+Iu/FWQg1EyMQ6ZAEIe
   A==;
X-CSE-ConnectionGUID: pXRfEOAwQtCIfQQMxzg9Gw==
X-CSE-MsgGUID: AM3BNG7UQ6m+MbNXQ0UYkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="87521349"
X-IronPort-AV: E=Sophos;i="6.23,172,1770624000"; 
   d="scan'208";a="87521349"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 17:34:03 -0700
X-CSE-ConnectionGUID: 6uqzA0WBQB6RLO2JZ9147g==
X-CSE-MsgGUID: hwH+p0iBSoaMzt8YlEN39A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,172,1770624000"; 
   d="scan'208";a="233310816"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 17:34:03 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 10 Apr 2026 17:34:02 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 10 Apr 2026 17:34:02 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.39) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 10 Apr 2026 17:34:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BZE3gsd/3mdOnmS5b/sf35v2tLMJwF5Gi7gjnk/ZLMz177/6+pWiNJq4AWPGkntisjTQlquOJKv17hLCi9vEyvR8jS27WnWPrVFz0Utv/aIX9iYa6JuHj4WqGNHn6/NTC7GfHr+cNTYAurPVQ8rI5uF2lBArabK7jXzmStWiqtTxrFPyTpQsh3ntt/lEh4BAfjAA10/5UV6ACZg3MeqSoFZpdiTQ9v9OtaRq5DeTbgxlBsbW3P7iDozt9ZXYS3mPgIQCNd9xlw2PFrHbhuxVLgl95Dg11KwYzWiI2lQkbVdnrDd630vQs0tKnvi1r5LB2SCKPT1yjFjPBLam8g+X/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zI2z3FctXIvRTL4mY3o+4sSfQPQGelNUsLtW35IyBjQ=;
 b=GonxIoxPY1k0iB9E4GWaVzs2fpMRtPIQXNWeXDkxXlbzhsVe8grPu2avGyzUI7IfHYABJUrfy+I7YdRSdAXwwuSd+dt/vKHXwf2/XhR0T0nkOMMXadYrG7/69OAFDtlP2nmPFWvSRfjAcxnS6G51uhbGhRjwS2Qq3GrgcWdno25rNXnDkMFVdFxuiPsvPq3O1kd0g4YzEaRNkTT4kwO4gssPe6ZJKKnVXl7VqpZeqsrb9G7Vga0Y1L3ttN8Mld8woKfgcj8dcFMKwqS4LD0Bqf52eP1LEHboEyTGT7j3kWm2Rr5vKWmREd3y4psw6DT/Jq1wooFDeawkxKN3UXWl1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2808.namprd11.prod.outlook.com (2603:10b6:a02:c8::26)
 by DM4PR11MB6118.namprd11.prod.outlook.com (2603:10b6:8:b2::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9791.32; Sat, 11 Apr
 2026 00:33:59 +0000
Received: from BYAPR11MB2808.namprd11.prod.outlook.com
 ([fe80::defa:788:da96:2f9a]) by BYAPR11MB2808.namprd11.prod.outlook.com
 ([fe80::defa:788:da96:2f9a%4]) with mapi id 15.20.9769.020; Sat, 11 Apr 2026
 00:33:59 +0000
Date: Sat, 11 Apr 2026 08:33:53 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@kernel.org>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [tglx-devel:cleanups 18/38] ../../../lib/rbtree_test.c:246:9: error:
 unknown type name 'ktime_t'; did you mean 'time_t'?
Message-ID: <admW8dWrixL0If8Y@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0171.apcprd04.prod.outlook.com (2603:1096:4::33)
 To BYAPR11MB2808.namprd11.prod.outlook.com (2603:10b6:a02:c8::26)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2808:EE_|DM4PR11MB6118:EE_
X-MS-Office365-Filtering-Correlation-Id: e611fe03-69cc-4337-077b-08de97620567
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: OJSOPfVl9A2thqMc2qMN08vvoLvrg5tQqSUJjRWQnjHi7OEpDe5FTX018J98mUUXVzFgP300zt23jJvZihRYGU5oCzxvJbUPMt4a8Bq0YQ4U0gNnsC2OrHa6skE2S0LLbbjCjyEq0AmQgmq7O9qD/gZWc6uMiyJETyLGQZkitT7UG62XpHklVmq0xNfDOTOpSCwlqIJSJOXrqTdYrXlGbSjlyZuuD+K81VDcDsqfkL5n9ee8ozRqlwyPNMiZ01+rSO48x3rzjGKfwErwOox1TALWEDfjdEIMAVjiWYHRu2ilaU7odfe+QcBujg/lSeXATRfB/lL2gLmWSAxs7YSPkfSzkSisRByDy8hyU0FJi7Ow1y+y6e8cawuR6flwEhMX0H96A/P2RHVNxiHmE/FtIE3xZykTuG2HmJJXIrPMACcUwrR+ZMGIPe3Hwni9kWiUsZpD83CpPgxe4JWC2eRnU0jjld/7CviqCqfxb0JBaUVydi5PH5vZE1FCNo7OO6ERbmOR9ALlVG97CsO5KSFHMYojlqXQPxMbFsgm78nT/QnYWaoQ9toVWlDyOyy7SXvUj6XGt9GPOl2S2du7EJEpNFUJ4bpmeHT9B4Um3vTwEDMsHekHX07LuQO0RQqLGO/LQvmWNVFVVu6mmL5rXp1Wfg0r6TFAlmnQr4Xwmj+zlg+y+95zL95IKqjRySxckwdM
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB2808.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xXKDSr1Zkb6jZ6lGdfsd47w9Mq7mpFi8kDDOltaYKsGu2Yu9puZWhsAn43Dl?=
 =?us-ascii?Q?XM+7DSlJTe5u1TX3mpa+/hLdp7LjrWMHDDXTLXo6GKdUOW1EIcaZGFQwuibB?=
 =?us-ascii?Q?RlylkEMNGDTy6BX0baFTdXNzpucqF1CvL5mRZ/8Sj6rdH4z01y0EZ985PcLw?=
 =?us-ascii?Q?K/ReTzLTz3RpU1Xrb65ck2uL+q5hgx+cZJoEFTagoLhbHwFnyycCWwd2klz3?=
 =?us-ascii?Q?E96oRUy8CKHBiRGV+H+w14MaKnh1+hYxZwxqO8OmB4dMnzVqCN0uaq3ioLbL?=
 =?us-ascii?Q?p+hYLlN4nk5G+cqBUiM5wwa6PlSWNVjqL+c3uNcz9kmuZYbEHZhS+f2NB//4?=
 =?us-ascii?Q?aXX16AUkOXqQkHVhPQRqlFuaFdMT2npeTpAITtQ/FX30/Wy9GttgcW94Ky/z?=
 =?us-ascii?Q?wVhb3WDltO0VXXC8O+iOjQRhWRswo/UgeRjrcuWGhHaJWT4CjvylEhrk1Isi?=
 =?us-ascii?Q?5CiumdgAM1f/aMam4c1rrbLwHEdyRAjghyj5WM4MApFUKISoRuRYbtk73uly?=
 =?us-ascii?Q?fJqb80BQfAz41OKs9kes5hVUMlyOupw935/Lw7SD13lRFgUOmPkRop+v+mMU?=
 =?us-ascii?Q?etlVhrCvdZDaf+D3TxxHU/v0KoWkNVcjjnSfDWOgKHL4QjzD32OEU0jMoh0i?=
 =?us-ascii?Q?ePx9K45q9j6Bni8/5Qqn6T3+yjstmhq87GIKld1v3EDyg6B4EWNJYrE2WJWI?=
 =?us-ascii?Q?eZIWBVSvOUngrc+py32ZbPnIqMC+lEFDzPUXsMfwEZBY/9QExLdzgj5Hrwvs?=
 =?us-ascii?Q?x2A9uCItR1fbNQruWQMQGZDGI94HRVmOc7awefUNUXFHeJPQ9TanOAmdSkV2?=
 =?us-ascii?Q?k3zCYeMO1IMPQYi3uWPpf6/ZOGr8h4lidU4ohKAr9mo6347hkogVP/5+Ikxt?=
 =?us-ascii?Q?+iKdtW9dG62gDhW5Hwdg56Hw/iA/znr54e9mxQP3+RU/O8WXrg/s7PUR2vR7?=
 =?us-ascii?Q?CElHV8gWXmtbPEHVLD2tGJyKDmIRCALOnBUfgCdGEMwfzGlKy1rnY/M8XbpR?=
 =?us-ascii?Q?LXnDMiwSr73RqBuqyPXVaaKGAgxWjnV+UH4q2wlKnBNAzNnVgovCQRj/7DYE?=
 =?us-ascii?Q?ahvahNOFXM8oraqo575jo95ccgEITbbLrPX34311I8jvqgUkWRGlKil26Gzb?=
 =?us-ascii?Q?H2aA0ATauHepF3xcdLzC1pF89OSJpJeKe8vsD9fITdsv45T5nM28y6PE6Vxd?=
 =?us-ascii?Q?TrSGFsCpKfPbmQn+jp5J2KxxSnIXOeRaAXIT+Zv5dnbKOI6aeEkVjhXZIF0F?=
 =?us-ascii?Q?U2bccL5ocv/eTjhfKRTzFgFkoYDAj+AKrzwcQhb/isMHcCOn9EglCcmoa2s2?=
 =?us-ascii?Q?+rsJ2cNrRvhg34lKGenQjZ/6acRnGQ7VOdDwOlZhTI4urkfJP23hxwn/nc3H?=
 =?us-ascii?Q?0pFNHFRWi6abVnIhNX/O+xbkAzfW/vVq1nqRY0lMxwLWYmBVPVldVyTDpXJ6?=
 =?us-ascii?Q?sCh6dW4VzB0tE4WWMdW7EAYuyEoCN9MzoeyJXXlDsSgjJ+ZFmRYsg9fSXOxy?=
 =?us-ascii?Q?TGaFCNaB8KHDR2X8JMR5NXd4IPTOipGZNzspZC/uMicmOHpDo9wK9PbPcsAG?=
 =?us-ascii?Q?2iTQURDg93bHK5ib3A8HWDThY50feN1H73TLG72Y+Ph3RPw9G6k5YqbEF0w9?=
 =?us-ascii?Q?KmZFkNTsEZIIkbU7wsOx95Mis2yQJEyIatnPPE4bvaJxedEB8+k03qdN+JaD?=
 =?us-ascii?Q?6KLv0Knm0Vo7j8iUnU86jyECXRJQME156VIXR21njvyoYr1syQs5INqW+Js+?=
 =?us-ascii?Q?kUED+1d7DQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: ER41xVgUVwzf4tvmzpFNLFOeS8slTh/icyFsuHMF+FkODsaSig9q5f3hcCe/MFmbCur3CaSnHP9a2aJHjHGfEE3iA55V8ZetYQlvVb887vMRaHRJt0ow7/Ni4ppOBtUm3oRS0YnPk/H/+DVsveC8h8M8qE5tW/1SoNy3J34DjAA6R/Wc24y7ARI/2rhyiBq9irvciVtiu7Hyk6VUH7fQ+D/6BEdXdP4N4cuSX2u0HYftlANMK5GgtID4GheFjK4DZM2SPQrj5PWb2t4a+XD5K9dAdVLbNNCSenpc7RT5ofkZeeVHn+7NEpkze2o4xXpscfSy02c8VQOwPDz/xldjCA==
X-MS-Exchange-CrossTenant-Network-Message-Id: e611fe03-69cc-4337-077b-08de97620567
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2808.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2026 00:33:58.9379
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PZkFH13atE17FjfTdVe66+VCbT/iw4cVZYTAkJsTwo17e4LN0Hd8zL5Imvqtk7Nvkalm2DlBpkQ2mX2tQzRh+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6118
X-OriginatorOrg: intel.com

Hi Thomas,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git cleanups
head:   4334f669c43ca5506bf51471e81f18deb659410f
commit: 54c7fdc5e9c41063e1c76e8b23d52653e9d5beba [18/38] lib/tests: Replace get_cycles() with ktime_get()
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260410/202604101523.TsaqAHVI-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260410/202604101523.TsaqAHVI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604101523.TsaqAHVI-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from rbtree_test.c:11:
   ../../../lib/rbtree_test.c: In function 'basic_check':
>> ../../../lib/rbtree_test.c:246:9: error: unknown type name 'ktime_t'; did you mean 'time_t'?
     246 |         ktime_t time1, time2, time;
         |         ^~~~~~~
         |         time_t
>> ../../../lib/rbtree_test.c:253:17: error: implicit declaration of function 'ktime_get' [-Wimplicit-function-declaration]
     253 |         time1 = ktime_get();
         |                 ^~~~~~~~~
   ../../../lib/rbtree_test.c: In function 'augmented_check':
   ../../../lib/rbtree_test.c:348:9: error: unknown type name 'ktime_t'; did you mean 'time_t'?
     348 |         ktime_t time1, time2, time;
         |         ^~~~~~~
         |         time_t
   ../../../lib/rbtree_test.c: In function 'rbtree_test_init':
   ../../../lib/rbtree_test.c:402:17: error: implicit declaration of function 'kmalloc_objs'; did you mean 'kzalloc_obj'? [-Wimplicit-function-declaration]
     402 |         nodes = kmalloc_objs(*nodes, nnodes);
         |                 ^~~~~~~~~~~~
         |                 kzalloc_obj
   ../../../lib/rbtree_test.c:402:15: error: assignment to 'struct test_node *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     402 |         nodes = kmalloc_objs(*nodes, nnodes);
         |               ^
--
   In file included from interval_tree_test.c:11:
   ../../../lib/interval_tree_test.c: In function 'basic_check':
>> ../../../lib/interval_tree_test.c:68:9: error: unknown type name 'ktime_t'; did you mean 'time_t'?
      68 |         ktime_t time1, time2, time;
         |         ^~~~~~~
         |         time_t
>> ../../../lib/interval_tree_test.c:74:17: error: implicit declaration of function 'ktime_get' [-Wimplicit-function-declaration]
      74 |         time1 = ktime_get();
         |                 ^~~~~~~~~
   ../../../lib/interval_tree_test.c: In function 'search_check':
   ../../../lib/interval_tree_test.c:96:9: error: unknown type name 'ktime_t'; did you mean 'time_t'?
      96 |         ktime_t time1, time2, time;
         |         ^~~~~~~
         |         time_t
   ../../../lib/interval_tree_test.c: In function 'interval_tree_test_init':
   ../../../lib/interval_tree_test.c:314:17: error: implicit declaration of function 'kmalloc_objs'; did you mean 'kzalloc_obj'? [-Wimplicit-function-declaration]
     314 |         nodes = kmalloc_objs(struct interval_tree_node, nnodes);
         |                 ^~~~~~~~~~~~
         |                 kzalloc_obj
   ../../../lib/interval_tree_test.c:314:30: error: expected expression before 'struct'
     314 |         nodes = kmalloc_objs(struct interval_tree_node, nnodes);
         |                              ^~~~~~

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

