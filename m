Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A25FD12F5A5
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Dec 2025 02:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764640996; cv=fail; b=ODbtrrfeNPqQK7SIt09XP4pFRhrcYHyVcMGO9IARz4qgpwPMrFTS8Xd0FH4k4hcmGvZLG49gg1/cisqiCtI6M0P4W4z1kuwKRJ60TkouOwyXpV6gs3Svp6HkZSCM8sb3SnRUVyKg2ZKYpRhFLXbubZg8r6OReXiXh+9aFOhSvps=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764640996; c=relaxed/simple;
	bh=DKXbVZ+JFXIDYxEu8rdrNprA9MMAhizygi9kCkElsHI=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=ps/6zITiYlATeFYmXdKrBSiHe2CANo67QZ1mx28qRJd7L8Z3JpFXsiL307OQ2yxgM65IDaRNiZKcV6JtVlMHOTU1OOlzrmFVmLdL80trDnFVswNyFrR1r0ESa7ppOirtvYnJWA4RVVWj0BJhIItB/nkVxabO4kRPcItZq6rUthw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hp8sVCbI; arc=fail smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hp8sVCbI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764640995; x=1796176995;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DKXbVZ+JFXIDYxEu8rdrNprA9MMAhizygi9kCkElsHI=;
  b=hp8sVCbI9/4v1m11cLNAKOHy/WRYY97UVU2LH7LK5Z9DnVZ9M16nHQFI
   XpLvZoNxRWCzNyb9GiG/O7Lbrh59W0YbWGaVtNiXSTNRkWWqvj8h0Fjjk
   O6Pcj1X2UE63tzAMWaXg119mfidBHjzxtFPFjetamltWc4jFbKvOtLvxs
   JsPB88brKjZ5eavFMyH1AL7YkqaKcE1H+iYJl6rNBSdSQbNdjfyjD3Wc2
   YFmK1tEUdD5lGUtE9NttWVRk/2/Oc8+S57/t8az5fUFgeExofBoaV92Fw
   ov3q9UDOQTk62JFgNpoe1ZHAh3Uneon5jfSfzJf6OPTMfVFMxH1tBX36v
   g==;
X-CSE-ConnectionGUID: YpgSeakyQ8CpQ3PdMWfoPw==
X-CSE-MsgGUID: JobdJG/FQ0y1su9xa+8GzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="66482305"
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; 
   d="scan'208";a="66482305"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2025 18:03:12 -0800
X-CSE-ConnectionGUID: BfI0DjwQSMCn2VyqLLAGuA==
X-CSE-MsgGUID: 0AQ76LEiSiuDl+Qp4oLx2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; 
   d="scan'208";a="195032388"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2025 18:03:12 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 18:03:11 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 1 Dec 2025 18:03:11 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.46) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 18:03:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SMOvoIR+Qhl20Eqn/ZRXiNRXS2k788KjAOO1V1pxZB3WjpHSRsZaPj3Sl2kOUQ1uBVGth9YdwHKALrqKtKo5hs3aLn4BpWm9ltIMCxciqYzrM9OgG0HWceigw1dQdg0m/8+9tfiBqjbNwryAf/3W+HcCIJ6sXnXU+J+2TWTpUJEgkViAJClXLm3AYCf2wHjz00Jm6O9TKJuewZZM28JrPKFr1vbPV+jwwJHWlfB01C6gN+4VVdKV1CEqq7wdpCJV548FgO2J0zB9Zld7hB9DB47O6ULrgEAWMp8Yoq0KUsxj7oclDeoCS2TNVX0AH1T5L2NIm1ILPkJydzY5mN59fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dNRNE9OW6zXTi9tuMqJWUWXOhArYNohN7l7vfog0lk8=;
 b=addPR+3Wz27Cni+N1yqAEKCOQum9JxNgUlaF2ner9bGRGYhJ+om0B6a/uVtReAbtBwXA6LFKGfidOmqOdO7G5oB9rnCl15umzfdibjLjbKRSZIkFQhHrcpsl7IYJnKkE52L9RxOG0c8r8fa7gDtdU53WazH2h7cgkBoJd4RKn0jeWxLn51zq19yHOhfIG4TPVm3Ee3K28E1YELbJY8rQFiNXutLzO1IXrzLt1/kc+j19gr6HKFQtbMrTyiN7o+GGjuqyDi0UxUEL9XtNeUJHlSYipjN0LhxXf4hepQGciVGYtPXAOySWXuARMzaCgTuT5H0jiY8oBDoMded8qB75IA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
 by SA2PR11MB5129.namprd11.prod.outlook.com (2603:10b6:806:11f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 02:03:08 +0000
Received: from MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9]) by MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9%5]) with mapi id 15.20.9366.012; Tue, 2 Dec 2025
 02:03:08 +0000
Date: Tue, 2 Dec 2025 10:02:58 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Novak <seimun018r@gmail.com>
CC: <oe-kbuild-all@lists.linux.dev>, 0day robot <lkp@intel.com>
Subject: s390-linux-ld: drivers/clk/hisilicon/clk.c:114:undefined reference
 to `clk_unregister_fixed_rate'
Message-ID: <aS5I0sRPmgztOXyU@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0165.apcprd04.prod.outlook.com (2603:1096:4::27)
 To MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB5963:EE_|SA2PR11MB5129:EE_
X-MS-Office365-Filtering-Correlation-Id: abb9f1aa-6b26-4f19-1303-08de3146f069
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?qIUmLpnZ25hMq0lzM0KRiz480GT6bCEmOhyWHqak9K/jUJIHTn+MGuHDPs3O?=
 =?us-ascii?Q?Ajjl/WnjPKEN7wZT40Wsrau/ytKb7f94vVQFJXxJpcIeUYWv4BT9NZanM7RB?=
 =?us-ascii?Q?NlOy7YaDqhxNbR9CmuzKESWqgQFWuNqolWV2UIhHiJjc2nh0bfYTR09KNlSI?=
 =?us-ascii?Q?+18sr5lxL3jfvXaAYk2j8IwGCxBYoir4igj+Mt4jpJ0wsw+TXqe56iVIcup2?=
 =?us-ascii?Q?7NDaEr/OFMCD80DZzkCuJ+Yya9T2PbCE9N2HHY/FK2qPeVE3xea74aSbsJzz?=
 =?us-ascii?Q?0YU6gFz2K3SoTsKOb+ouQHbl5G6toqqkCR4zFU9Ip5iB89vBrowZNES5EHcF?=
 =?us-ascii?Q?E73x8BTNpviFqa0eSxK5ctL+KCPaRV9JbeGyvlT971ZgMPEnn669CoCCmyc2?=
 =?us-ascii?Q?m3hpePP9AJHn7OjUvkenjVX92nLSIiMnOlZY5wd7EOLCd9djRazfsu5tLXiC?=
 =?us-ascii?Q?PmGBBh/JxWKVDbUGd8gTMRRpBxYFA/lQCaovA/ZFrMJSDSFlzOsvpv9SCCl5?=
 =?us-ascii?Q?SbcZsbNDTMFlFjet+Vkmblwo+NCrJDs5BiI0cGcEnF0oZYIPL4cmWA1Wr0Xv?=
 =?us-ascii?Q?WJoxBkP//QlmMueb9yhINdrcTVBHBHm/umyCGzZRllMUwHk4rEGT2iPRrf+Y?=
 =?us-ascii?Q?vKjPYOe/zNG8ekBsmu46YHBHDX3r1vGtuyXvWNSIOjvVopdS4AHm8TD0hp60?=
 =?us-ascii?Q?4gor+fyjnSZntwInEOjReiR3JuNLxcyw2m8aWNemhT/r+dGmTODJIzBKmHnm?=
 =?us-ascii?Q?c3a5vAV+bhu5VQij1FpImKAekArxtQX2lDBTFgYVk2IlFVg/72ju4mCx0q7n?=
 =?us-ascii?Q?G4tzFudecJ8jvu7pxyMewlYP7zjBGUAprJY/ffExY2+N06WjsQesaOe5KO+3?=
 =?us-ascii?Q?49sFZjPQcRBvRcCX4DuZJI10lIyVx/U0wCQmS1AsRllmA7yctqYqZ3P3Nqs/?=
 =?us-ascii?Q?PAqvAzIMnxwr8shWOKbDuUMT8XhD0Y+G1MwyeNITnjU6jgq+LtGhOGv5jbf+?=
 =?us-ascii?Q?7wRwVGGr8nmfctg2fUkhqrSGeiRgg/hEihfXOf+okPWBVARjwW4RQzI+kRxS?=
 =?us-ascii?Q?nk8bzdV4jCk9z0daLv41J6ij+i2LVRl0wdxzD96VO8117Di4Egzj+IXlKldi?=
 =?us-ascii?Q?CoHW7VyqYxRWyWncFC+2B5ZuqbW5znbR/ImW0S0ZSxv4HCLK04T5+VsbiWP3?=
 =?us-ascii?Q?XXnTW/j6jwDdivHx8ZFtc5LeL+S0gsT3PWxOj9fHawfl1K4i+iHLe0QwhMgR?=
 =?us-ascii?Q?B9AL9rZ0NCZrGNtJ8jekrFoMDjBJ/4w8aYAX0F7GxctRqhmEo9W/LgFH9DWw?=
 =?us-ascii?Q?eFmvKJigAwV3nCjNGbqgZqtUoj4RoR0OwbekhaGLZcVCFY/NPxnUqDFAZ7VD?=
 =?us-ascii?Q?n+v4m4/CCdnehr88rWBA6oTqo2p7F+3p450aYtlODJAOPN9XaymroCk4YhGm?=
 =?us-ascii?Q?plhOv8dojnqUUjzOG5OQBhBLX6gOWgzkcHRybyG8rpsta45IZpoJ+w=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB5963.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VTcRsoHAfmK4ZJXGGqQE6l+zvuu5LJ9DNH9wAnv4hNcQVG5fWP7f0yJLSpBY?=
 =?us-ascii?Q?lv2ORUatyTSh5tb4E50YAJZqkoa5PRiEkH7NZTWGyYp4Cd7Jd59CjQBb02OD?=
 =?us-ascii?Q?zs8FcolV5zCpHMgtmMTdVk8C6GVSnZlnWB8DMlYr0RowdVyrPHycU0KrdClT?=
 =?us-ascii?Q?HZg4U+Y91CZzjJyB0HlQOT1rwHZ0u5KCSzOLeVasjAb1YybbXAbl9fimo6tV?=
 =?us-ascii?Q?6vIhuXYLA9avvcsy+2LMTc4nCguAqW1Gns7X5g0uT/tTP/XksapTnEj2ENLP?=
 =?us-ascii?Q?mmSD9bA5yu4hY045RpIf8Cq0FQzAbky4NT4nEo/aAxBaqVuBhI6n7OV7WPCw?=
 =?us-ascii?Q?nEbn6x3JJGYJXpi+yyexGtECT2G+SX+PaLRy4QOhjENNPw3QYcaTKVHTEfs1?=
 =?us-ascii?Q?Eao78kCi0xtP/0AskGuX9yV4AuvQ3i0ujCGpahSt+Z1oVuBGuKY6NY7bb+Ti?=
 =?us-ascii?Q?bxfPUgwuge8OlUyZEkZBlc8uUh2aDvgCMRBZjAANhGL7eoIpVH4tKA4J+7YB?=
 =?us-ascii?Q?6NCMKXhucp+sBcv+IVRBpzNKqfVXxLhwgcl70ce4Q1v7SIYLSDMevMvRXaY1?=
 =?us-ascii?Q?xwQCydjPKpJs3VuriGRK8Q+oemurRGFQ+I5BfKVyj3xY3xDh5Pbml9D5APfV?=
 =?us-ascii?Q?WsyMqotlqzXgs9KyIyBiBPN79j8LMVgnpLysi67MRgAo2k8+jonKTRFVcXCx?=
 =?us-ascii?Q?WM81wiwb04bM4gh/GiwwppZijCSQXPkz1YAAl/eqtht3fVaMpduiRCMve8eN?=
 =?us-ascii?Q?/RLpJWG6VGKbgu68w5lkhqAxD5b4d646b7+5uBIIK081QZyvCD5RjfUmdtSt?=
 =?us-ascii?Q?Iygwc75aByBIuUIR0N8nqxz6z/QXSBJSED7NBk6qHS2K6eJZl+tfYEiiqb8R?=
 =?us-ascii?Q?+3FON0766kajEeHyjCwcVDCmJpYgOU2qubqrpnyovJsBylrVJENugCIZ2RdB?=
 =?us-ascii?Q?64nIuok5inqU2r3PuogObXzO6Kk0HS95Mzp3Al1SWMDCaYZQtdiLPZ1omIRE?=
 =?us-ascii?Q?c6SaRax88IBf0gMdnDhkpp8ozUCaAampzLV0SFd7FrgYJcayw59faOVnBkDp?=
 =?us-ascii?Q?2QENITr0Oge0NqZspZAWpnUEigEAKpBcMbJ0XFaCYvBMmgIERw3p0muK7D5r?=
 =?us-ascii?Q?SKuD5oAXn9UbztO2pdwhRp1o7tRFPP6Z3vSaSTWIAwcoPLvp7phslwyXLVfx?=
 =?us-ascii?Q?B9Nabmd2JZqXPJGBjSQ7mBTtfgK3yqcAUPBnK2e3IwvoB0HxU5HVyLfDCain?=
 =?us-ascii?Q?OHwOaIVcSHQmSEsOH+FHL2t1bY7MqwIqYk1pIdvpAIYsgbsPZasdGEweipH7?=
 =?us-ascii?Q?eYZJ9u14DMDhRQVoqRrJwktlLvpUHd2ATrrpIlwAyculMlCl3epnezNaP5EK?=
 =?us-ascii?Q?EhXLCHIeXH59UUE3tUr6LSDt/avrjaVWPzleogm3SB4SLm/7ADMbuVP9BJTL?=
 =?us-ascii?Q?giDOq2qZEL4BcVJAsjMe4DI4IYalOTQGO52NWdhys05D7rUYpVvgB2yN4i0U?=
 =?us-ascii?Q?4XxvC69l6poPhVSsGC5pJ/wOi5NWOVHWupcAmsM3yp8pfys3/Y4AVjUGNBEd?=
 =?us-ascii?Q?OF9H9fDxaiT2wfJWtJ5bnYDKLNnRFE3E2lzGVJnQBHr+bS9Ixor8kSkcCMm3?=
 =?us-ascii?Q?MA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: abb9f1aa-6b26-4f19-1303-08de3146f069
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB5963.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 02:03:08.7159
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8o4ADppGNGqBDdjDyTXpBNB6vHufmbsg3ujhrvPbA2+ZS036UjgGctq0PggApwsu36mEupr7o8GrzFH8EKxXkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5129
X-OriginatorOrg: intel.com

tree:   https://github.com/intel-lab-lkp/linux/commits/Peter-Novak/clk-hisilicon-fix-compile-testing/20251201-054942
head:   a5bd6f8973e4a0aa13b3e1d43790a85fe6bcefe6
commit: a5bd6f8973e4a0aa13b3e1d43790a85fe6bcefe6 clk: hisilicon: fix compile testing
date:   26 hours ago
config: s390-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251202/202512020039.zQcFAqne-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251202/202512020039.zQcFAqne-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512020039.zQcFAqne-lkp@intel.com/

All errors (new ones prefixed by >>):

   s390-linux-ld: drivers/clk/hisilicon/clk.o: in function `hisi_clk_register_fixed_rate':
   drivers/clk/hisilicon/clk.c:98:(.text+0x1a6): undefined reference to `clk_register_fixed_rate'
>> s390-linux-ld: drivers/clk/hisilicon/clk.c:114:(.text+0x2a6): undefined reference to `clk_unregister_fixed_rate'
   s390-linux-ld: drivers/clk/hisilicon/clk.o: in function `hisi_clk_register_fixed_factor':
   drivers/clk/hisilicon/clk.c:128:(.text+0x370): undefined reference to `clk_register_fixed_factor'
>> s390-linux-ld: drivers/clk/hisilicon/clk.c:144:(.text+0x46e): undefined reference to `clk_unregister_fixed_factor'
   s390-linux-ld: drivers/clk/hisilicon/clk.o: in function `hisi_clk_register_mux':
   drivers/clk/hisilicon/clk.c:160:(.text+0x5f0): undefined reference to `clk_register_mux_table'
>> s390-linux-ld: drivers/clk/hisilicon/clk.c:173:(.text+0x624): undefined reference to `clk_register_clkdev'
>> s390-linux-ld: drivers/clk/hisilicon/clk.c:182:(.text+0x71c): undefined reference to `clk_unregister_mux'
   s390-linux-ld: drivers/clk/hisilicon/clk.o: in function `hisi_clk_register_divider':
   drivers/clk/hisilicon/clk.c:220:(.text+0x976): undefined reference to `clk_register_divider_table'
   s390-linux-ld: drivers/clk/hisilicon/clk.c:235:(.text+0x9aa): undefined reference to `clk_register_clkdev'
>> s390-linux-ld: drivers/clk/hisilicon/clk.c:244:(.text+0xa9c): undefined reference to `clk_unregister_divider'
   s390-linux-ld: drivers/clk/hisilicon/clk.o: in function `hisi_clk_register_gate':
   drivers/clk/hisilicon/clk.c:258:(.text+0xbaa): undefined reference to `clk_register_gate'
   s390-linux-ld: drivers/clk/hisilicon/clk.c:272:(.text+0xbde): undefined reference to `clk_register_clkdev'
>> s390-linux-ld: drivers/clk/hisilicon/clk.c:281:(.text+0xcce): undefined reference to `clk_unregister_gate'
   s390-linux-ld: drivers/clk/hisilicon/clk.o: in function `hisi_clk_register_gate_sep':
   drivers/clk/hisilicon/clk.c:309:(.text+0xe12): undefined reference to `clk_register_clkdev'
   s390-linux-ld: drivers/clk/hisilicon/clk.o: in function `hi6220_clk_register_divider':
   drivers/clk/hisilicon/clk.c:339:(.init.text+0x186): undefined reference to `clk_register_clkdev'
   s390-linux-ld: drivers/clk/hisilicon/clkgate-separated.o: in function `hisi_register_clkgate_sep':
   drivers/clk/hisilicon/clkgate-separated.c:109:(.text+0x4a6): undefined reference to `clk_register'
   s390-linux-ld: drivers/clk/hisilicon/clkdivider-hi6220.o: in function `hi6220_clkdiv_set_rate':
   drivers/clk/hisilicon/clkdivider-hi6220.c:77:(.text+0xa0): undefined reference to `divider_get_val'
   s390-linux-ld: drivers/clk/hisilicon/clkdivider-hi6220.o: in function `divider_round_rate':
   ./include/linux/clk-provider.h:1445:(.text+0x210): undefined reference to `clk_hw_get_parent'
>> s390-linux-ld: ./include/linux/clk-provider.h:1445:(.text+0x23a): undefined reference to `divider_round_rate_parent'
   s390-linux-ld: drivers/clk/hisilicon/clkdivider-hi6220.o: in function `hi6220_clkdiv_recalc_rate':
   drivers/clk/hisilicon/clkdivider-hi6220.c:54:(.text+0x35e): undefined reference to `divider_recalc_rate'
   s390-linux-ld: drivers/clk/hisilicon/clkdivider-hi6220.o: in function `hi6220_register_clkdiv':
   drivers/clk/hisilicon/clkdivider-hi6220.c:149:(.text+0x5b0): undefined reference to `clk_register'
   s390-linux-ld: drivers/clk/hisilicon/clk-hisi-phase.o: in function `clk_register_hisi_phase':
   drivers/clk/hisilicon/clk-hisi-phase.c:119:(.text+0x424): undefined reference to `devm_clk_register'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

