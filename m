Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C384E757EA
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Nov 2025 10:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763807089; cv=fail; b=LkBur39JbCZXRUZiG0KMjdyMlsf7cwcBRRLsMbNUtILtkiV4vxFCvurNeMB/0EHqsp+0/ZvNC0fMFX5/Qahg2CFVoipaTzP02Xkct4m3P+u3YjVeiwk/+W4YnMRZkNgCCQWmmTVBlrhxsRfma9sbG+1tqRw5Kw7BUgxWwJjER6Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763807089; c=relaxed/simple;
	bh=6+wtXbLCeWad+gEkqgDITtt3mwMnEZpeuX98mae38e8=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=uzM22GAiFfFtxkUKCVTBKe5DIodA3a2Pd19uzNsoBpispJkSoxeeX/fph9f4Q7kOW39voOb9Uyq65ekas22+vF3pEzHWIr9zaBRLwG8QWIFSHIF+qAeRray4lSy1UvxsHXyKf7oPjeHsUBMZH8K9buc6RJyBpi6sgt8HoFKySMw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hMX1yTGv; arc=fail smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hMX1yTGv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763807088; x=1795343088;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6+wtXbLCeWad+gEkqgDITtt3mwMnEZpeuX98mae38e8=;
  b=hMX1yTGvLz9CNs8wEqb/P4bg768x7IwFfE+ilqSOrQiE3uvyfV7arVLm
   oPU8eHhhbOLoY/DI2IbJ74x0ZG3yIC2P8nNR6QjNjqLN6sXWvFX6oLHFa
   z/sUAWBejW0yxeRBZlzL2Rx0NL0WdVj8pCHMMEYKntVBTYUvDNdGE1z7M
   jYPY16IlK5npbpK5OBAhsFFbkcPbCJPU4lBUyq3NRPzxyxk9UiplPHrzD
   eYQ1IFmAfcutrgU+sUA68xVbRyj+BwpsObUxSU0en04BOxMofDMBxRWJf
   xN78aYAlS2U3k796ATgrwfggBeQoBWDk+S79FGYRaelxrs3vgLpCWNnjA
   Q==;
X-CSE-ConnectionGUID: EDFC922KS/SqbyWPGUvEKA==
X-CSE-MsgGUID: 41AciVZAQzanAz6B4d2vqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11620"; a="77247436"
X-IronPort-AV: E=Sophos;i="6.20,218,1758610800"; 
   d="scan'208";a="77247436"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2025 02:24:46 -0800
X-CSE-ConnectionGUID: pAK8JJL+QzaCdbFWMElObA==
X-CSE-MsgGUID: jXnDexh6QeeADvsqVNpoCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,218,1758610800"; 
   d="scan'208";a="192681259"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2025 02:24:46 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 22 Nov 2025 02:24:45 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sat, 22 Nov 2025 02:24:45 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.36) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 22 Nov 2025 02:24:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J8wvdAHK1oZzpqryYhlDdf/2mkyPw3str8tf2lBgOWHv1N4ZsLdxdfz7n5m52iYyavxVy9YgfU5aKqfxbQBo/Z7VJrxTW87/36v71pcAUdX4+Gm9+0zc3Lheomd5IT2PrkFaEYKrl+Jqq7pmEVlZ3SMB1OIQTNFwFbMsDewgG2aeTYF6uj8k6FHCIaxMU814U76Q1RFJNcw1Q9OYA6MijnPb6CPrc1B4PUoK1YW6V3sUvQsYYWgEXfs/HychuINssDIB+WUODZpnukTeZVlE2YvjaY9xB8ZZimwBndvCWo5iiqcmKj6vuqqV19K2EwA/zbsZiPVoY6+hg7bu6hTACA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bbuxyA7bEeQL3br/rWeIoJSVJ+hiAwo+MAha4rR/cvo=;
 b=YBOmL30i5YtRZ6qPpSPfXal3ABZkS60yj3z9yH87ntBMp5IvXR0sEidCncKupG7rehLTpljN10Li+KfmWqQushR8StxVUPWhFCptFf/4c3QwPy2z37iJ5byMTVxlKPkc0TZCMU022yuzT/aE/GaJV3hc/SehnCES7DPZhGQ/Sr7n9V4+uII//XZyuOMC3hzCLrpEpeg0+gOHLdpmELeTanUS8c4LJSaAOvIJqy/7lDW35ehoyXOd8WIQBq1sg4FzBmPeXDqDw27m2FmfEys9GNkSZPYTRsZwZVU7QUeh+r5sFqDWDaawL/jx+uc28XjLcAg2Q28iSX85LhHJG9NJ8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB4172.namprd11.prod.outlook.com (2603:10b6:5:19f::15)
 by DM3PR11MB8669.namprd11.prod.outlook.com (2603:10b6:0:14::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.14; Sat, 22 Nov 2025 10:24:43 +0000
Received: from DM6PR11MB4172.namprd11.prod.outlook.com
 ([fe80::f86d:a320:27b7:afcd]) by DM6PR11MB4172.namprd11.prod.outlook.com
 ([fe80::f86d:a320:27b7:afcd%3]) with mapi id 15.20.9343.009; Sat, 22 Nov 2025
 10:24:43 +0000
Date: Sat, 22 Nov 2025 18:24:36 +0800
From: kernel test robot <lkp@intel.com>
To: <cros-kernel-buildreports@googlegroups.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [android-common:android12-5.4 5/5] drivers/acpi/arm64/iort.c:637:
 warning: Function parameter or member 'id' not described in
 'iort_get_device_domain'
Message-ID: <aSGPZFOQm4w+cjoZ@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0157.apcprd04.prod.outlook.com (2603:1096:4::19)
 To DM6PR11MB4172.namprd11.prod.outlook.com (2603:10b6:5:19f::15)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB4172:EE_|DM3PR11MB8669:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e0daead-7d12-416e-62d9-08de29b15a38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?OQf0DgnZGzh9XfnIm//r91h5/V161SUNAlasJUU0iNZp+5Rri2szJxMcZHQO?=
 =?us-ascii?Q?seoZeVPjaxYhmu5YWdpgK87LNvbsw0ifHfMYdXCnBk36wN43u085ur9C77MJ?=
 =?us-ascii?Q?f+fjMZKhMw1l8Wf+o3KJ0htEbmf0vyX4RdKX/i0wcd9ODGIXQKmcc1chjp6J?=
 =?us-ascii?Q?h+nfkXDWmCUnKl2GtUqaO+b3cEn2jBqFLb/Jq1EMennceFTuk9nvVw/vaAfH?=
 =?us-ascii?Q?hB4qT5y0tz3Yoyd/7jSymE8uUIIN6f8bOI7YISmtS9O3h7EH0Isq62Eyqpk9?=
 =?us-ascii?Q?t8XwdBzL8OF2qW/ehnSTx9bQMtSxAQ1DhNJNCyZ4vsQgh4jHKx3T1aFi4Xkq?=
 =?us-ascii?Q?OYxWk2kdAt991hZYX6evsv+S+kw5grIhVGo/PXlu3IalnEEqp7qs19M8eXML?=
 =?us-ascii?Q?vrOeDfgJKehu8l8fkZViYdqTwmiwzAOk25ZEA7R/wzB2vPhXuY3e8uJA4lvt?=
 =?us-ascii?Q?nJzvVQzibi89EW0uWwngEQaSPXjjKpSuRPS1A36hKec4slw2Ez2Gdqjs4WFh?=
 =?us-ascii?Q?pJ8pKlML2OXuIhlVRnuikHMnfDfbYN3clfC329SQ3xclAnIO9nLKtQBN+m2f?=
 =?us-ascii?Q?c4Vp8hqggxpLofzviU2B49fitinawLA71LUGl2fMTN2hngobn3LmtXKyruUP?=
 =?us-ascii?Q?f3ecJ/jswg5TpuGDTZDPLrpzO05hZQlL7IP6xP7c9BBq/Ins+k8IKQaHpP/c?=
 =?us-ascii?Q?M4iY0mi5ubecdvWB6XDO+bt+fT804F+SJEz6y8A13iQoI9LOJXx9sAg703/l?=
 =?us-ascii?Q?KfAMKTbFl1gOJ1RU5t8a6BO9/E5mvEzx9cvF6RhspvCwvBqxhF6BIpzc3aW4?=
 =?us-ascii?Q?uvywT73wvNdrrx7XAGdhmO1+G/ngaOmbR70xXFHrAm1tAZxwlvIOXar9FVPy?=
 =?us-ascii?Q?t7iIHNJBK8/hgUal8Zs7fb0OHfQXzNak47g35EreoGcOBM0PkE5/5OAO4Kpy?=
 =?us-ascii?Q?RmT1OdwJDdYQMDP1WchZrN7FgjaAYH7YlXv+Uoa7SCjEJuerwsj/2rV/bP+9?=
 =?us-ascii?Q?ypbc9sLv1+TKbWuPlhx4FPpZGDUTgxcYV8PNTuYIRv56B6ZUbysetqEWROp1?=
 =?us-ascii?Q?KA2emRIoKEOIYChHXM3Jbyi0xzJA7+POxX4sk/33atrm5bg27UO6fAbdyXN9?=
 =?us-ascii?Q?D1ecCjelyhu8G0FQFtYW8L2fj8NZZed0SB0rx0VPVwEmz3U2xNBVUz5e4x4h?=
 =?us-ascii?Q?oZR60KnpqPITHUsSvNqHdcVhBB/ohSy8Xc5rEjnFS6uPmcDkSLWEK7N5G3+a?=
 =?us-ascii?Q?SeryNrKgl/eztWRo+rMx1Pke9gtTiMQSaWxrsB15VlI1X25pQwaXjcGgSvfF?=
 =?us-ascii?Q?ojL9hOv697h29L9E2FiZSa658ISPynoieYzzIQy81G3fFLE3P82Ed7RNxiop?=
 =?us-ascii?Q?ZB6Vm3CQWDSM7960NsJYddV6LlSFUe/m8ejHFlwJorIQeiAGQkSyzQoUg15y?=
 =?us-ascii?Q?vNQCJ4pJUcXF0iFYNtHSZvcn6KxKc87Q/fdW4rdQiw+BiIjUxhe0RA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4172.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pZf8OeJ2J5LP1Sxp4AxLjt7k/HpYDAU2raFbJAgo/m3lj7UbA/TL6n5Q5cTa?=
 =?us-ascii?Q?PeUMr/7n8YZuqMFNdilN9S40Yw5F7i/2vs/djpZ62h9tRFVtfHYcdMmXiONp?=
 =?us-ascii?Q?+0sS8/sPaRnw06w8f1AMvKI48ywzAEOmZSGZNbUncprXJyCxhv5gfCwL532R?=
 =?us-ascii?Q?CWbtGZyGG2/VuLqpJtYSwgVb2R53ONGkJEf8/l/52YsS3kHY97MUabnu0z+2?=
 =?us-ascii?Q?1JvYbGfUJApoIznL6QTUXyoNU2jmCscS1u+yWv5qQdkg+3ol4eayAGigi3IL?=
 =?us-ascii?Q?XYLwAeSx04PYRWKpzMvrYpSWGi1Nej6M5CCbcmtr7Znqcrl96ds2fAAMmNIO?=
 =?us-ascii?Q?15J+PbnIJVSfqx36bdNbdE1W6JLsvqnEs179G4WfxW56TcxyabETFkWCnsOD?=
 =?us-ascii?Q?ZPtLZZ/tjT8WszHpk9k09NtmWRJwpGYCrKOYS9IVpBy5ofoNcUIZakMl8QEA?=
 =?us-ascii?Q?1k8Y7b6Fy5HnbonQwVi2gNNVQAEgLBj8ueq1lpaZZX69wICxqKA3KpcBbOnB?=
 =?us-ascii?Q?qHa7en+tMTC6j2Kzt+Daz9JHXqSwGx8ahLdCyXR+tOvZsxhdlCgWJQj2XyY6?=
 =?us-ascii?Q?8drkz+GM8SFs8l1F1lQyoz9xNKuCzcx2jooC3LMtfgj8tn52ahE0s6Be9A+P?=
 =?us-ascii?Q?QoB5f4CPlJsAVqx+NfVc4k2MKIcNzQuyt3/pApopmFcV3WWC1ZS4yih4WMhN?=
 =?us-ascii?Q?YY8UeTu5RBaqayPowxHWCtv4LpoCOXNzwvmPE+OlM1Vv8+XndJwH6wGu0ybx?=
 =?us-ascii?Q?fuSj+aCqZ0KnPjxMr3fHTReJpMPN/SXOQPbw3svbpV5Gl0JJr5INPa6Umt7B?=
 =?us-ascii?Q?m5FiMJwJxgF2u/m5+WBvogJ2lou4+MoM7VRLSPRlUXjbf9pgU5TI57UPP83J?=
 =?us-ascii?Q?hJ8ED/9cwBHSXXChHpwJkn/2BtwSCzMwAAQlhyB/mfqKsR67qENbsZz8yfPN?=
 =?us-ascii?Q?hSCuMOelrvMquKCbZkKiehzP4cI2XBDKQYDUiCi6djNwUh8ji8v3cMYe9B1f?=
 =?us-ascii?Q?axvcwVHLJfKv4UXucODkHUqisOvoJjPhCNDJXF0eOjmBev6hqQpJ25ubljIf?=
 =?us-ascii?Q?xX7wVDHdq5XPu989LYV9uRXELR8YjU18k87O0MFwBV3yuXeWd1iW23oQVkJ/?=
 =?us-ascii?Q?DY89eeD5Y1G6XPvbtTdK299cfQRXRg08om4grC48I5vLcT25Pz//VhVUs+0F?=
 =?us-ascii?Q?owpuIy2Zi0qHnL5aoezMD5NcZWUpe1XE5ckxn2rHW7Cpx5lbIEQONbbd81zU?=
 =?us-ascii?Q?jO1UdYTJw0JVcPHNZsb1QjzsLnzO+m4cSxNZ62LhFU0enDbtH2PDCnC5arMn?=
 =?us-ascii?Q?4Mefp8xkgtIjuRLg+zeAcgDDgVVjvH4fyArEchIiG9/FZVr00sbmrP/tFMjx?=
 =?us-ascii?Q?/kKwM5U81iJPveIPSX9RYPHk7cl2IuOL+LQ8bwDfgX9p9RPooUyWXLa0dI4A?=
 =?us-ascii?Q?0z953XvLi1LR+4S6Oag+YM8SCHKUJXE5Nj/el3jZQXpjtLvnp8tL/WUb52t1?=
 =?us-ascii?Q?zyEvVYQDbHlFjOn49W6iJCW+UMsQpA70e1fS7b9wK/4AI78lq3HZQbW93/TS?=
 =?us-ascii?Q?C5kkVco7soeTQApcqyGJzSMBsNwX9o6PXVQN9hEc8p5a/LSUq3M2Ezr7GYTQ?=
 =?us-ascii?Q?zA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e0daead-7d12-416e-62d9-08de29b15a38
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4172.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2025 10:24:43.5707
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wqc+8QBl7Nytj+dYqwaIfKKeTh0XDCxqxuVou0s2/UbbcX4FNuD9++CGVQB1QrIXcXbOgex3q+aK7M+SqF7RxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8669
X-OriginatorOrg: intel.com

tree:   https://android.googlesource.com/kernel/common android12-5.4
head:   b2957a0ebc3b9949475a442f9e8ab64ccaa6e087
commit: da36a3ef32b476ca6464226010ef73135fc3c3a4 [5/5] ACPI/IORT: Make iort_get_device_domain IRQ domain agnostic
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251122/202511220710.1FEPC3f1-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251122/202511220710.1FEPC3f1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511220710.1FEPC3f1-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/acpi/arm64/iort.c:53: warning: Function parameter or member 'iort_node' not described in 'iort_set_fwnode'
   drivers/acpi/arm64/iort.c:53: warning: Excess function parameter 'node' description in 'iort_set_fwnode'
>> drivers/acpi/arm64/iort.c:637: warning: Function parameter or member 'id' not described in 'iort_get_device_domain'
>> drivers/acpi/arm64/iort.c:637: warning: Function parameter or member 'bus_token' not described in 'iort_get_device_domain'
>> drivers/acpi/arm64/iort.c:637: warning: Excess function parameter 'req_id' description in 'iort_get_device_domain'
   drivers/acpi/arm64/iort.c:1064: warning: Function parameter or member 'dma_size' not described in 'iort_dma_setup'
   drivers/acpi/arm64/iort.c:1064: warning: Excess function parameter 'size' description in 'iort_dma_setup'
   drivers/acpi/arm64/iort.c:1475: warning: Function parameter or member 'ops' not described in 'iort_add_platform_device'


vim +637 drivers/acpi/arm64/iort.c

4bf2efd26d7624 Tomasz Nowicki    2016-09-12  627  
4bf2efd26d7624 Tomasz Nowicki    2016-09-12  628  /**
4bf2efd26d7624 Tomasz Nowicki    2016-09-12  629   * iort_get_device_domain() - Find MSI domain related to a device
4bf2efd26d7624 Tomasz Nowicki    2016-09-12  630   * @dev: The device.
4bf2efd26d7624 Tomasz Nowicki    2016-09-12  631   * @req_id: Requester ID for the device.
4bf2efd26d7624 Tomasz Nowicki    2016-09-12  632   *
4bf2efd26d7624 Tomasz Nowicki    2016-09-12  633   * Returns: the MSI domain for this device, NULL otherwise
4bf2efd26d7624 Tomasz Nowicki    2016-09-12  634   */
da36a3ef32b476 Lorenzo Pieralisi 2020-06-19  635  struct irq_domain *iort_get_device_domain(struct device *dev, u32 id,
da36a3ef32b476 Lorenzo Pieralisi 2020-06-19  636  					  enum irq_domain_bus_token bus_token)
4bf2efd26d7624 Tomasz Nowicki    2016-09-12 @637  {
4bf2efd26d7624 Tomasz Nowicki    2016-09-12  638  	struct fwnode_handle *handle;
4bf2efd26d7624 Tomasz Nowicki    2016-09-12  639  	int its_id;
4bf2efd26d7624 Tomasz Nowicki    2016-09-12  640  
da36a3ef32b476 Lorenzo Pieralisi 2020-06-19  641  	if (iort_dev_find_its_id(dev, id, 0, &its_id))
4bf2efd26d7624 Tomasz Nowicki    2016-09-12  642  		return NULL;
4bf2efd26d7624 Tomasz Nowicki    2016-09-12  643  
4bf2efd26d7624 Tomasz Nowicki    2016-09-12  644  	handle = iort_find_domain_token(its_id);
4bf2efd26d7624 Tomasz Nowicki    2016-09-12  645  	if (!handle)
4bf2efd26d7624 Tomasz Nowicki    2016-09-12  646  		return NULL;
4bf2efd26d7624 Tomasz Nowicki    2016-09-12  647  
da36a3ef32b476 Lorenzo Pieralisi 2020-06-19  648  	return irq_find_matching_fwnode(handle, bus_token);
4bf2efd26d7624 Tomasz Nowicki    2016-09-12  649  }
4bf2efd26d7624 Tomasz Nowicki    2016-09-12  650  

:::::: The code at line 637 was first introduced by commit
:::::: 4bf2efd26d7624372fb7adff8745b4c2e8407004 ACPI: Add new IORT functions to support MSI domain handling

:::::: TO: Tomasz Nowicki <tn@semihalf.com>
:::::: CC: Marc Zyngier <marc.zyngier@arm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

