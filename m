Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B5AB1FBC8E
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Oct 2025 01:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761613988; cv=fail; b=QjHpLsf5kSggin/dvyVjNMmgtLWV+MjDgUJA91JnDlArLLb0OrdaKDLDWylepds/l2dppQqD3Juo7tvpB3WyjugJlrR24k2+t0T+mwPQIVx6ibM59VZ5Q+ibCDLkGbbr+OdjTUVxlqegsV6qQVHpDP+NHHX2iF+A6DHILxAd/KA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761613988; c=relaxed/simple;
	bh=bddWDu19yOkY7R3jDsl9PSNKBYA70I/YxXwVDXGiCSI=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=LuQU51KA2M01xls80rzDhKWoPFod8boyMqynbE4Xrff9GTG8yq4r4oIoSHjUcVpK9uKw4R/ZZ5FPZh1ou1wyeHxhB8hD0nqccHHYts8wBxCOrvD77n1E3PadsUveHm0jO+AcQKLStTBD8B2Mb0GxbfktH/xqBRiwbjVCKhTReb8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h4qBwlmU; arc=fail smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h4qBwlmU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761613986; x=1793149986;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bddWDu19yOkY7R3jDsl9PSNKBYA70I/YxXwVDXGiCSI=;
  b=h4qBwlmUiyJgxrHC1tC02RJKMh6Z6KKezYmMtqFSvZlKXfPJ2S0LjYIM
   E5pCu/eIqjJuRIWWIbSfPccmlWoK8Q1Ht/zlAWZYCYwLdWn2UXHwZLsRj
   xvr3toWx8I32ZoB4B8DeekH46sPsmg/tnyHfzA/zjCzQ0LxYSVJMDncAE
   XGwl9ocWRN0tkGk7ie81/z62fuaG0NpEH9Qhz+ZfqKmrfEnqVchj8Fmhc
   DBPgmAvDuYueovdaeQ9ZI2g+bWhTRqOXRT7/ss6/IKi+80vp9il6m7Hdy
   YS3ym0Fx3Jj7e/YKbntbLqcZABdQW06sAThAinCKjxbPGLP3/f5Us3x1r
   g==;
X-CSE-ConnectionGUID: c5soVIdJR+KShPcE+/MsdQ==
X-CSE-MsgGUID: XgnnNDTCTOKM4Rq3vdhbRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74380902"
X-IronPort-AV: E=Sophos;i="6.19,260,1754982000"; 
   d="scan'208";a="74380902"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 18:13:05 -0700
X-CSE-ConnectionGUID: l6REHbqqR5m8ZPng76R3kA==
X-CSE-MsgGUID: UrKcns5sRkyz0hUfSsRCMQ==
X-ExtLoop1: 1
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 18:13:05 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 18:13:04 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 27 Oct 2025 18:13:04 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.62) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 18:13:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fkQ1GiBzttMNRoZmM/o5yavj5OuslV5z7LrMWej4c31g9CIcyGOoX5HpKcRC07sS+0MpnU0xSO+YTC8sJG9GC5rQtHXGJLYVyQ5t5DQelp7vZmk+q1H1ImiC0YpQb1f9J90TM5/P1D+qIHUwtNvYkfwgs0xhON6J59uF0bGOzEQ7SviWx8MuKSff0MK5JDTVF8NpVSdZyKw/mubAkOUF07Tgp5z+hdWK2paqatZyOYdst7xCzGWtfqqB6EZv0f3CVYC6A4VesNd0lQo0ZljXw0S7PzSCFaJz6fCT4fUiGFkkm5SvnRfQpNO0QKyXRcVqBebFnUHjcYtvb5+OXujo8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j/sRauTupFyaHRiL22hVo8ER4pW7Ov8YBVL4lT/0J3Y=;
 b=WVi1A6Dnn9e9K/8Zf9eNdmDqm3KJamrJhjpfflLnTve/ei5NGPc2f+U1N9em6+iNqeYoUvw8HBLpcxp/jbodUG2UGWPpq+sPikA11RuAJ/uy5N1p+igpcJGsz/z1JJvZl1abxbaj26LfbWOiw+3YhEff2S05RCuA9EyDd9pe0sxp89aA6lkwNTl15D/oBI6/0tEE6RbZL9oCpevNAB+KmXszEJ4Rb/dkZ+uIOHCAOdnwsY9gDfumH9nc3/1qOU6i5Np1ADqIfF9BgOtFuFTBNZaVFsRxLZIDbA8tyUP/zLmIQ/rBW/ZTICbp3JSQ3k8oARcDXbcgJYxlemw9+SEdjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4165.namprd11.prod.outlook.com (2603:10b6:a03:18c::26)
 by PH0PR11MB5205.namprd11.prod.outlook.com (2603:10b6:510:3d::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.15; Tue, 28 Oct
 2025 01:12:57 +0000
Received: from BY5PR11MB4165.namprd11.prod.outlook.com
 ([fe80::d9f7:7a66:b261:8891]) by BY5PR11MB4165.namprd11.prod.outlook.com
 ([fe80::d9f7:7a66:b261:8891%7]) with mapi id 15.20.9253.011; Tue, 28 Oct 2025
 01:12:57 +0000
Date: Tue, 28 Oct 2025 09:12:49 +0800
From: kernel test robot <lkp@intel.com>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
CC: <oe-kbuild-all@lists.linux.dev>, Kuninori Morimoto
	<kuninori.morimoto.gx@renesas.com>
Subject: [morimoto:renesas-lts/v6.18-rc2-2025-10-24-x5h-ironhide 18/21]
 arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: serial@c0704000
 (renesas,scif-r8a78000): 'resets' is a required property
Message-ID: <aQAYkQ+tPQywOM4V@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0155.apcprd04.prod.outlook.com (2603:1096:4::17)
 To BY5PR11MB4165.namprd11.prod.outlook.com (2603:10b6:a03:18c::26)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4165:EE_|PH0PR11MB5205:EE_
X-MS-Office365-Filtering-Correlation-Id: f9b6813e-53a2-4cd0-8b41-08de15bf212c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|13003099007|220923002;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?zWet9WT95Hffi+fNSNm+l4Xk7XIRTslaaHpNmBuiI5nbrjub6/uxL2ou5I4k?=
 =?us-ascii?Q?QRmkP0C9NoB2c0JBfJ/pNtkLE/1gdUBpvowDQIgdxwba2CuKdmzFlDBTwWCM?=
 =?us-ascii?Q?jjpwQCOtUJ0yI46wWiJF146czPf0XAbNyJVtoZXRECi4btV2Oq3Gu6Z4+Hh0?=
 =?us-ascii?Q?AsljaP7S9vZLP9EZcufiMRKTXN/TQ3j4eqzKEfzKRvKV2tGIcU7Cw4rS4Z+w?=
 =?us-ascii?Q?WTtVqtJiSRaq+XZ4kbHduW86KJycnR+Jfie1Orw1njlwy2B4sSxRVUcn3DEr?=
 =?us-ascii?Q?HThV5jtKnVmFCWHFNpteMWhMgEUfVb/Xem/pKwLGsypIMN/Mh/7d1AE3xo2L?=
 =?us-ascii?Q?jgQFQAn5dcHFAkDsKnWrmWW/FzgghTmilYVeO8MIssPQhMUSYFx9fFrWCTcB?=
 =?us-ascii?Q?wYL98QD2A9b7um4ZC9lP5a8YhsGo+UzoC8pIwFJctfP9/I010+MPnbGkvXQW?=
 =?us-ascii?Q?+q3bAa0eal1fw2Lf1EDEW7hbKeeHwZMA5B9KzJ6rseEZaBqVWQrUxSXexUyJ?=
 =?us-ascii?Q?g+xGVPclQfcjh5yv6jQDs0p2A4ofMgzCrXbxC+7OoMZGsCKJBfhdkHgh0Ahz?=
 =?us-ascii?Q?pm5p7XsUeiiRj1OHIVcxr+Q+XFDiyDNGcdI1vKZ9PMzspVVcKmCa1fLIZRVR?=
 =?us-ascii?Q?orK7smHL4y6n9Q0aqipSGUwI+OFZ5fyZ16JmUK2qnSxWxRZraX5S/zE2NOgT?=
 =?us-ascii?Q?1qZM5mK6n+Zn/C/hM5aAzbh3/HonI44obUP/lKTcPoT41Hyqip4uYB0dZOxf?=
 =?us-ascii?Q?hlDvTVYsMcUuqcl/JWVi8q8k45tE0J8oiGPHu70LY2xloSBARGflpK5zzmXS?=
 =?us-ascii?Q?Plew03UhCx6V1f04IEjN3COioi55lLtiZpuG8dxT3EUAjo8/0+sWYcxbcJZi?=
 =?us-ascii?Q?CBMHoBL0j07i+h7uInbV8ruPrWMsu36KQT9FqrREAVga3j7O+jbSAMCDkr/u?=
 =?us-ascii?Q?coVpS5X6D2qHWC39jkysk51cJBeRgi7Ow5itFTU20Lo76iqfGt58ggS8X7qA?=
 =?us-ascii?Q?E9q1M2IpAjTceaCtRQfHbRw0gT7EOonS/NpGj71m3Qno7VIWTbrUJvjJoGvS?=
 =?us-ascii?Q?Xtq3bCng+z/bBOzelJBDz8OYSWsPQmlU2rs9D1z/K+XnIfH1Ih4iRYV1l9RN?=
 =?us-ascii?Q?nYiSAp8dcxA6fmuRFp3HRym1b5IzwuIdcaHa/bE2//I3mvBWR51K3pGZtfO0?=
 =?us-ascii?Q?J9uiqccV4AUq8b56HrUSCbZgtht2FMkubEJbhSpkwPVnZouLmI/dD21uOjVQ?=
 =?us-ascii?Q?8Mgt3ACUSXLZN5BR7YOfrD9xAf6ugftEnDp9pYcM1vegsmhGQt2P2pEqOphO?=
 =?us-ascii?Q?Hv71iMk/JZYUhVYc1+sqp9mP1ktOrl0y55aEkWSAXaIh9xSCe06FdPjRYkul?=
 =?us-ascii?Q?nxfJelKtnRsiDsCT8kTHpAt4eOp1cFDyx11ISmSv4JIw1cJ2OxP7a++PZaFU?=
 =?us-ascii?Q?Ke3Mcyhj8bvmR29lErnh3frLBNLG3HcS4KLGVMwB5yXpznhhwEi+TQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4165.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(13003099007)(220923002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cN+4d2tkXZ8Aq66ipYDpPS4wCZO4T8xNPooree8Qr76qg5uAt8Ard5pdrBRS?=
 =?us-ascii?Q?hOMtGkA/WDp72qiN6+oc96k8SRaGNxXDgl8s6/oKt/yS46gr1Bv6hwmtTe2p?=
 =?us-ascii?Q?XqiUskNd5tC7MSYgprN3i+MFbsi/lyg5zselYNuKABclOnBIW5jPezNOGM2s?=
 =?us-ascii?Q?W3h3SxM6tGs4UG3shM8nQQ+6tbH4RMmBiIyObY7vzq9LUQyp62gJ6B47V/8M?=
 =?us-ascii?Q?ZDkx7U5QFGU+3YXpBx9Bf+wV0rEKWl7g5FvbUnkCjgMBuozDIK/BcR3vmhMa?=
 =?us-ascii?Q?6wUHXYEB0eM2uwEccxB25703ZdM7x9Q1QHYMapl3gZsGP9hKr0k771Oc+b4s?=
 =?us-ascii?Q?F5ZIAJNM4fAZ1eEzBHZmcrE+QT/O3AaezsgGkhcAiTsyv2BCK+jXNQL6gZi9?=
 =?us-ascii?Q?0kvu/XeWYLBwBk5K6X0mgyQCWLMsUweMFMXPr1X11HT+g/Laa2zYTmDTw0FH?=
 =?us-ascii?Q?MCbYNhm76+MCqegoJswGwJEP7GmrH2jNDB7V6oT+8pTWkhdoRIHOUg6BOzzw?=
 =?us-ascii?Q?0MNUOAfPdy0hOZPl8H3FbA8B2dsPMSqW/AbXTGmQi3VDmS8Ei1jCkLiSS8En?=
 =?us-ascii?Q?zT7f17zsTCe+LfQdG0MB9aKfyQqE3SStqyxu+yGFihhKYK4D8WxAIxaqLck4?=
 =?us-ascii?Q?GFkfIVUcgAF1CmC7o2sBlfpVpKHFpk6l4GAmGLDPa+RX4AfF2yuIszLfbi8N?=
 =?us-ascii?Q?HdIRxbW3l4SbZgKn3qyqRPtN48gisQgxsikvEa8V1+PppApMe6JLfm3qa7A8?=
 =?us-ascii?Q?mETlEzDRHLNvYYMrSmEGwAd6wXiwxSk7oy/YvWfbxgaF23ohyJbcSiObZNYI?=
 =?us-ascii?Q?nVWJb28vw5AE4O2JOiYYfu6SlGM6+b9sAkY6/NAtu8BJBJPRN0EqT35vMoIU?=
 =?us-ascii?Q?OttU1CCMvknOqQ8ZA9c4XHMraEX7R71pL6kElfj0BGTSYe2r5g6DWunGrD45?=
 =?us-ascii?Q?kxWIAgq9ZbhrsOdGBPxwiKMlIMCDE/73D9VeY4XvB5nKebUFyyBEJkDc4w5n?=
 =?us-ascii?Q?9NTiewndNTMnk11/KULvsT76bEFMWlfb7NjFR/NNLWRrWHQHMls11fXpWbz+?=
 =?us-ascii?Q?EetzlE2DgCYh4dT1NEBqmESMovlP1at6OIzb+fOdUE57nPKdh+eObHVAzqzr?=
 =?us-ascii?Q?V6yF2arpBNNq57ihyluL9W3tav4HdlJISaVt2fBzLaHhERS+bYT6wt0gkCuC?=
 =?us-ascii?Q?5ijxkasUxLinFZFioxJ/mSLZls6uE4SIG66OHgerZfr3wYfN1pw8exD46MII?=
 =?us-ascii?Q?7ZhBoAn0xF+it5blaz7LVgsgnuYQc7cc4G2j8Og+uF4BZWRXkg2/5J/zNRFX?=
 =?us-ascii?Q?3+6fEeS7Ws1bPLFn9yw3h9AAKEVBb/DSKD7qIwnJOh92ATaFF8BFjOpFKWFF?=
 =?us-ascii?Q?WqpmhBL0Cc+gczTE9kXS9Ul8oBQKDHoV6lhxcN+zVOndmrpDbsAN8KRO0lEx?=
 =?us-ascii?Q?zcznT4/6dgPIP1BmK6hjwxCReQ0LhYG94fhrQWbWQZ1dmartmBnyv6TTzpB3?=
 =?us-ascii?Q?dBq8g7KVK5t/kc2zQJWsb8pbF4R9bxDtC1gFD2RmLU6kZi+L+NzDgLI2CdZE?=
 =?us-ascii?Q?lUIAke4yBTINEgKI/GhNv6COE9tOJj1UgxOuAFwy?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f9b6813e-53a2-4cd0-8b41-08de15bf212c
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4165.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 01:12:57.6025
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 26gj/jU7iBcPG0HC2/9T7Wdw+/265ZvFqbaz91B+taZwWeCwAReuhSL6Av2kymh0wgE4TykWRn87JpZZkYfbfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5205
X-OriginatorOrg: intel.com

tree:   https://github.com/morimoto/linux renesas-lts/v6.18-rc2-2025-10-24-x5h-ironhide
head:   fe21d488fba0b6bcb0416fab7cf246e35592ce10
commit: c87576b462097163e19e94adabd82faaf3129281 [18/21] FIXME: arm64: renesas: r8a78000: Switch HSCIF0 back to dummy clock, enable HSCIF1 with SCMI clock
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: arm64-randconfig-051-20251024 (https://download.01.org/0day-ci/archive/20251028/202510280638.OZW7hDdv-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.4.0
dtschema version: 2025.9.dev12+gd6be03029
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251028/202510280638.OZW7hDdv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202510280638.OZW7hDdv-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	'renesas,mfis-mbox' does not match '^renesas,(can|cpg|dmac|du|(g)?ether(avb)?|gpio|hscif|(r)?i[i2]c|imr|intc|ipmmu|irqc|jpu|mmcif|msiof|mtu2|pci(e)?|pfc|pwm|[rq]spi|rcar_sound|sata|scif[ab]*|sdhi|thermal|tmu|tpu|usb(2|hs)?|vin|xhci)-[a-z0-9-]+$'
   	'renesas,mfis-mbox' does not match '^renesas,(d|s)?bsc(3)?-(r8a73a4|r8a7740|sh73a0)$'
   	'renesas,mfis-mbox' does not match '^renesas,em-(gio|sti|uart)$'
   	'renesas,mfis-mbox' does not match '^renesas,fsi2-(r8a7740|sh73a0)$'
   	'renesas,mfis-mbox' does not match '^renesas,hspi-r8a777[89]$'
   	'renesas,mfis-mbox' does not match '^renesas,sysc-(r8a73a4|r8a7740|rmobile|sh73a0)$'
   	'renesas,mfis-mbox' is not one of ['renesas,imr-lx4', 'renesas,mtu2-r7s72100']
   	'renesas,mfis-mbox' is not one of ['renesas,smp-sram']
   	'renesas,mfis-mbox' does not match '^(?!renesas,.+-.+).+$'
   	from schema $id: http://devicetree.org/schemas/soc/renesas/renesas-soc.yaml
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: serial@c0704000 (renesas,scif-r8a78000): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/serial/renesas,scif.yaml
   arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: serial@c0704000 (renesas,scif-r8a78000): 'interrupt-names' is a required property
   	from schema $id: http://devicetree.org/schemas/serial/renesas,scif.yaml
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: serial@c0704000 (renesas,scif-r8a78000): 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/serial/renesas,scif.yaml
   arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: serial@c0710000 (renesas,hscif-r8a78000): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/serial/renesas,hscif.yaml
   arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: serial@c0710000 (renesas,hscif-r8a78000): 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/serial/renesas,hscif.yaml
   arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: scp@c1000000 (arm,rcar-sram-ns): 'scp-shmem@60000', 'scp-shmem@60300' do not match any of the regexes: '^([a-z0-9]*-)?sram(-section)?@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: scp@c1000000 (arm,rcar-sram-ns): $nodename:0: 'scp@c1000000' does not match '^sram(@.*)?'
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: /soc/scp@c1000000: failed to match any schema with compatible: ['arm,rcar-sram-ns', 'mmio-sram']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

