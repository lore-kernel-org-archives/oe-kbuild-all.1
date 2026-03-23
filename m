Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1402D18B0F
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Mar 2026 04:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774240529; cv=fail; b=ZIyykvkIqk7NZkq7co7ugbxeE8G9vxQJpzxERuUyCgIsV8bUxaME6FKgnlZoYKxIoGSa1om1rVsrFoKmvm2gTcw6LrgNSQFxYXAMXrAVFGxjZEpzfAz4wJf0I6HgHkGrjloZsP3T8W/2JUMU7VRz0J0PK/r8pQHZh8wcUuVCCKA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774240529; c=relaxed/simple;
	bh=9yvizCtX7smPfA17kseE8q2Manb+7YzK7BRGdxClh50=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=FlXu/f+9CkkNoY3EKp0a1ZaMzG9Tkq3m2RcJzKEyCMXcT1671mCbfFwEevKF+UjssAiPg3pzhtsVVqL7xveuPGoLwhWCtCA/zKQ7+3FmC2JzJAeoVKJm0mZ7vz6+0weW/feu7+ruvl1hMH1r5FRuIkszkC/yis5fUmzZgzcIJ+c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k87lZjxM; arc=fail smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k87lZjxM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774240528; x=1805776528;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9yvizCtX7smPfA17kseE8q2Manb+7YzK7BRGdxClh50=;
  b=k87lZjxMgw6OgI2KlqKveE73rOrgiYiNYq4j3b4J1LK9R7fAhyiv6FYL
   6fMQzIcrkehbBHX7V2V+CxCPGiDKbt47a6edAa/PCwEfV96bs3ifhKigz
   rw7S/Esk5mDQO7jK1uRzxRDgRjw8FtgOJZ2OBSPNnZ4jOh2TvTJ6aR0Yo
   AoLEhPl/cKs3XmEDQuV8keOufbq39U+2/3CpYeacl1akcC15GH3O/XAGT
   g1dthpWBzyaCshxnYiKLjwMjT3eTfvdMCYPJIMgJfgvpGixuAITARxU5g
   Ch8TU4Yl4Hf+zVB0eNJyQVRlFdFt69syfblSilRNV1ZTEdRxHBmBErxp3
   A==;
X-CSE-ConnectionGUID: ThoyG1GIS3e5RUYdOrcxBA==
X-CSE-MsgGUID: 7q2s97ryT6eB4NPJn9lBLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="79093663"
X-IronPort-AV: E=Sophos;i="6.23,136,1770624000"; 
   d="scan'208";a="79093663"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2026 21:35:28 -0700
X-CSE-ConnectionGUID: nYg9gfO+R9OnJQLU9jf6tg==
X-CSE-MsgGUID: t0vcwnT+TM6OPvF8TQhESg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,136,1770624000"; 
   d="scan'208";a="246945473"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2026 21:35:27 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 22 Mar 2026 21:35:26 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sun, 22 Mar 2026 21:35:26 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.36) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 22 Mar 2026 21:35:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aUFtc5J3cHW3hfi266fwEQsdrNfKhrNpSwr9zJBDMjHxSGhq6vKAUWPk3+tiAPg7xozVUpQ8Xvv0ml+uuxkVoJy40jWaXXPJ9TG88SG+desqwYuez0zHfw1DUW0qZEoHDlclElQJlIPUS/oAc/0jR9wGBZc2YmpYbz/XvtCxT7oULjzQnOlumJqSiDMeGBrJ3yhJ/uEojWnpxi/DAVvG8WWJbJh7bnlR23rOkYnakwAwOWM4oN+LEL+uwPXnwo9aK1F9b16lX4s1Clj76OeZ1R+aDcRM97nvvs1oGmqVKrmnJvY/csZOcijUjCY7/RJGEIaHoDzBKsvzTRv2UtrCpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V1cZ5yG8VyImk5P8mTxJ2O80VkIKoa6ScuzCz6fdkqg=;
 b=JISK9iZK6xwj3rafsb8Ml+vRiO/0QxYiLhDyIDgfZXw9StVLrWKI4I2yFDawhBDfxMVe98DiiJCSerS/NSQAPJMr0cPOrIyIbKGo5j3b+LV500GTCRPoO/T0XNFvs64T37lbzkM6WXkOHaUlwWz7mWqrARhlOHm9SkPkFGKLiSTEQUm+IIoEtdlAZnOvVUItHr8uYccP9xTm1jVzjVOPrh64awerkB9ujuL/6jcKr/2qo8zALSrKhKA7YC1amNvyh7bolHuXSZi/YvxDftV1wEkUXLB5znWrX2A3+Hkt6NFfXWTJeVBZdnr7wbSvgxwzudHp11UmQnCjy4j2O0GP0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2808.namprd11.prod.outlook.com (2603:10b6:a02:c8::26)
 by PH0PR11MB9521.namprd11.prod.outlook.com (2603:10b6:510:3b1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Mon, 23 Mar
 2026 04:35:24 +0000
Received: from BYAPR11MB2808.namprd11.prod.outlook.com
 ([fe80::defa:788:da96:2f9a]) by BYAPR11MB2808.namprd11.prod.outlook.com
 ([fe80::defa:788:da96:2f9a%4]) with mapi id 15.20.9745.007; Mon, 23 Mar 2026
 04:35:24 +0000
Date: Mon, 23 Mar 2026 12:35:17 +0800
From: kernel test robot <lkp@intel.com>
To: David Ahern <dsahern@kernel.org>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [dsahern:perf-trace-ioctl-wip 5/7] undefined reference to
 `syscall_arg__ioctl_cmd_decode_init'
Message-ID: <acDDBTSXWDkcd+HC@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0154.apcprd04.prod.outlook.com (2603:1096:4::16)
 To BYAPR11MB2808.namprd11.prod.outlook.com (2603:10b6:a02:c8::26)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2808:EE_|PH0PR11MB9521:EE_
X-MS-Office365-Filtering-Correlation-Id: 3fa9036f-3265-4ee6-8f1a-08de8895998b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: ZlVPFZeNNlij47VSbwuFmEE38vjRpndnfXoDJZGoErHtqmZUih3fC0Avrnw3EvfkhtrA5Ad4eAdVNhbvcB2jYQ0MCafBN1J7pFfv4KvD7vZPlsQ/ulzMlLIbAgIy4/mfJ2Fj1kLtX37mSBDRaqIWO3jsPx1HVEjjb2/67/5yS5LZiQBZvh1mnzxl01INOcRPc9PxqOowZFVbdye9Sh8KXF/bn+Z20EqJdxZFuVbHnQBUORJT9IVodvFfZWBNmU3DjO8QkpXnTp75WOR5xaY7E1aQ7sGP3oCGibwvRy4tnSaE9aJeUm/IjxV1GmUVviDWSsThpzyQwqP6NOAMgqNG9xWtUfzcCtAjZpcfbHt6IrNhGWk9D1ddD2/eSydQ3Pw9ILMDKEnIIN72JZ5+606Wa2+Y2wpKaPMVTWB+H6BTWXm8771DZgIncW6dQXZGRNbaiYj9EwJ9JefvXXPGg9kcOHkgrpimh4yhNmalBuDwgAKA0UwC1Np21Giex/Z53CcuAoCP6avxe8+Ebjiw9ZZZIfzwRsTzzkm2dQFNY3CCya+hzlunrINr+eB8pi2SXBneyZRBwRq41kn1d+WLR8BGRjbLLgnTBKKpqjzzoyuopdwI44q9KPxvdIwbTF3bTAqpQ+KFRZGti2wO2e/UsEg5ZX0O5aEqnSvP3owdm8ZvFFLn+r6kdSXY2bQLbf/HuYgV
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB2808.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3vCAFoM+K58Oa9b8Z4rP6VGaMk4ebH4G2xCxwEFpcGllIv2FZTK+UbhFdzB4?=
 =?us-ascii?Q?q/09QB3kH2Jv7m5OLnSJ5zeDzkAuS8r9b1W6SAmFJTgKLsULgJrrqkjEYTld?=
 =?us-ascii?Q?74c3hNCXPzUTbduYLVZGMo7td5lIkVt9aZLcaMqEOjhfFI1FJWkmi7vbpn3L?=
 =?us-ascii?Q?K+P4IBBoK0ObrdTmymQA8KdjAs3Dt3q3EHMTwjiJjxaadLx9ZYq1HMxOeUr5?=
 =?us-ascii?Q?FanIfbAj6bSuuV5pxYUUNy88TCmYFl6mo8Lcy0eD1DDL22L5W4Ha6B9nwtDn?=
 =?us-ascii?Q?ARgQWXHM2GEYA8iYGhjHyWT7PcGAP9b8Fn8DUjjYBwXjIIiUBO4ulEPOKVcO?=
 =?us-ascii?Q?Ndh6vncMMglOUg/8XHGQ3ot+XOB8SelKanSwwpTCRs167PL6ksN2iPE18pDR?=
 =?us-ascii?Q?Hu+ER8NYkcaYGPVHVJPLSzZXPgSvGNlhCKVArrmTACeqKYxdlpIXaOAq6KZB?=
 =?us-ascii?Q?wf58/5XnZGiQBmq4T0bRiOjzgUj4GRmfKsa9pTW6tSyHNrkNBBQXDt6AWLR0?=
 =?us-ascii?Q?SoMgVBt8Yr6U7C+FNeXQqMW7BbGOglKcWPbtkj8wptXTEQopGsKsOPGC2RGw?=
 =?us-ascii?Q?I9LZIrbDDQzgM4K/m9F9rcxjlwj8BvZnnZd+yvrvWkk5E4Df/gGts6e1bOOG?=
 =?us-ascii?Q?MrYHxELGmRp5wmIkJyoR/obc2GIBH5HFL7j6lg+oRDItcZkHrCtLGsF07pv9?=
 =?us-ascii?Q?pK0ci6nEBvFIjXFmVDGUcRSBZ71WTttdLw9ce9nEDWtImTg/14S7Ixv5uBT5?=
 =?us-ascii?Q?fHy3LCSy/pUEDoTftrzL2tWzEFfNuDpVJkyHY+gdCYrM6BxsiR2qb4DwjTMK?=
 =?us-ascii?Q?XKTtgn5shUXPjlWXJtXHduPmKI7NS6kLbG6xD6LDvh/RiUqnpRHbtsxqKpK5?=
 =?us-ascii?Q?Zv04DuLoyB5fMd8hsYlzHglsLr5IA0egh5QwZ8iKiGKpaJevVtRLnDKy3n4D?=
 =?us-ascii?Q?DlqHfkYzfLrkS/D9trZD4iJRRpxG20AkkQmhkEYH0uJtuR6R0POctQu2pkPp?=
 =?us-ascii?Q?aY6GAIObcVKc8EXdm5uC7c+WxeovyUwHQ/5inNhQ8A6bYPWfZaWtxq2QIz21?=
 =?us-ascii?Q?7pZBHNwgyLlaedbuoshhJHRd1FkaZ9CObv07fWxoHgUKwUCRLWjrYUu+I4XJ?=
 =?us-ascii?Q?DFWyDCJLxu999zGpP67a9yfZ1zCtYLcF+wj3NFkEWwmfR3eWc1SxA3eWA0SR?=
 =?us-ascii?Q?d5lYpy3M8HDKrvmeld25TgOBRO7SGLYvBJtxMcpH0Jr6PVVVZ08AvZRpm769?=
 =?us-ascii?Q?FySS0+j9qnDQ4X+YRSzNm8DByLOzOo4asxJrJ9rODhUkscCLRuXrNI5WXZ7f?=
 =?us-ascii?Q?y4jN0Wc9v7Wg7n3n7oC7Wm87UhLchNWy1mwU1eyGkcDAwl6N+ODMPgKoLaEV?=
 =?us-ascii?Q?MYDPbkQfkGEeJzr5iWZYq/HFDQYrBXFgGnlIvIcR/+Hh6hQQJ/WWoxdEPppz?=
 =?us-ascii?Q?bOYb/+SRF2yE6kS85ZyAdk1+jZREMnGH0/zfdpFHEVPEcS7JvYHHbco1UyZ+?=
 =?us-ascii?Q?XjH4P+AMvIj+9yhw1KnBaXANefC+Rb28Yvu5vUYnKzshsyGa+UG6K4Bq3aRC?=
 =?us-ascii?Q?VJrAGzynNyFAEcCaNVrkfvlJ9qD1YNvSaa0dz9wjnHDzY3PTXJ1OJAQ+U5P3?=
 =?us-ascii?Q?sJLcEGxfNxn0LYmF10jup4ejuFoEhCUlrxr6+iCBPbYnVYqdcAFjpHDkFlf2?=
 =?us-ascii?Q?TnuX72hPGDogDJS/U7JtFXzo9dy1KLd+7V0Cm8CYFpn1y5sB+qRLzoIOXzBp?=
 =?us-ascii?Q?ZpZ0eaLJSg=3D=3D?=
X-Exchange-RoutingPolicyChecked: ZWyZKR4PEZ5c4ohnD6gP19f/4C9l4g6kXTGa0r3zpZA6Wxedk/3/XFlJo+20EdmU1eUDYL8DVX2X3xAFmh6Q4P7F0yZKthc3ASFnabbEtnXOARzI+PLfsvtOCeKtBXB39L8KmEch2yhq1TfZoIgMTsgDaOSxOI/C7GUppfAabA5UW/LNiBDENcMCeqi/26v99iAdL4IaaV7CLlVC+dfccg3fjoxdopceGIhjhiM1IvOHMPPC//kokdWCP51anvAGtEZdKWsZnjMIh9lhqUXaRp2nqG0FhbLbu1p8ssnyUXq1rg2W/b09qCkLS4anDV/bxvc4Vwf5E6qLihGrMT2ABQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fa9036f-3265-4ee6-8f1a-08de8895998b
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2808.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2026 04:35:24.3976
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qCJzrWETRsTUsOZ+xdffAUeTtG5KCfwkPV/oW2Zkf9C6VB4S1+CJrb94PXdFkzJa6JhbZlFPQsaEnS75YRC8eA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB9521
X-OriginatorOrg: intel.com

tree:   https://github.com/dsahern/linux perf-trace-ioctl-wip
head:   3e523442f5974b9f0f74d6f2ce26701950696817
commit: 647ca7f9d1a391f033597ff7e34d230019c33421 [5/7] perf-trace: add support to read ioctl mapping files
config: s390-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260323/202603230200.4xhBcjpW-lkp@intel.com/config)
compiler: s390x-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260323/202603230200.4xhBcjpW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603230200.4xhBcjpW-lkp@intel.com/

All errors (new ones prefixed by >>):

   Makefile.config:576: No elfutils/debuginfod.h found, no debuginfo server support, please install libdebuginfod-dev/elfutils-debuginfod-client-devel or equivalent
   Makefile.config:963: No libllvm 13+ found, slower source file resolution, please install llvm-devel/llvm-dev
   Makefile.config:1159: Rust is not found. Test workloads with rust are disabled.
     PERF_VERSION = 7.0.rc4.g647ca7f9d1a3
   /usr/lib/gcc-cross/s390x-linux-gnu/14/../../../../s390x-linux-gnu/bin/ld: perf-in.o: in function `trace__fprintf_thread_summary.isra.0':
   builtin-trace.c:(.text+0x86ffc): undefined reference to `syscall_arg__ioctl_cmd_lookup'
   /usr/lib/gcc-cross/s390x-linux-gnu/14/../../../../s390x-linux-gnu/bin/ld: perf-in.o: in function `cmd_trace':
>> (.text+0x8b9a2): undefined reference to `syscall_arg__ioctl_cmd_decode_init'
>> /usr/lib/gcc-cross/s390x-linux-gnu/14/../../../../s390x-linux-gnu/bin/ld: (.text+0x8bab2): undefined reference to `syscall_arg__ioctl_cmd_decode_fini'
   collect2: error: ld returned 1 exit status
   make[2]: *** [Makefile.perf:803: perf] Error 1
   make[2]: *** Waiting for unfinished jobs....
   make[1]: *** [Makefile.perf:289: sub-make] Error 2

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

