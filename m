Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A1D71CAA78
	for <oe-kbuild-all@lists.linux.dev>; Sun, 21 Dec 2025 16:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766333610; cv=fail; b=ut0LgrhRqDT9YZsHWBKEUSw64EApYrLLfljAnTR/iaWE7kVdJUK9Se9Wy92OsGkcMeUebTGzSQ81ofyydGp4E95z0IgJeQmrNdvglaPxD4tezLQvwUJQrc/6k9EIcyE/xu1jgA9NWyecOloXkc8ZtCELB7kgDruhRPVy2H2OqPo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766333610; c=relaxed/simple;
	bh=KDBYXpJTxQiKSu9yWzEQK7L1nHyiX1vgKKRAWnsHREk=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=hcFhSPwdlguZs89qObROAO01IHq5hf4XsTqRsPPDC46cRi6I89MveuvFkJpPoPXmKKgft1WQiifjSa5V0RVUQi3SjjoDTQOkUZ2MmVTkZR1O5O2PvbdBJr0mYqj20au/C/6SmjWvvxBUl115AsilYFN705PScal6zB69B+kYYM0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ex5lAHeb; arc=fail smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ex5lAHeb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766333609; x=1797869609;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KDBYXpJTxQiKSu9yWzEQK7L1nHyiX1vgKKRAWnsHREk=;
  b=Ex5lAHebg1vS64jqT5F4CI/jrBhZQs/UHsMtoPc+5PbgolbzwUA0QdWb
   oAddlMtreQw8JglQtsQkiWFTzuE4x3E3rQoE1DUFOKPhjFT1m3NA/VNDK
   XnIO1IBrw2NhuYRNFFzt17dI0Y52fhP5ckd0bgKNziKpHLO+LTyacqKKq
   qQO28BHpetl1Os6M5fY9XQ5yv4n7AKCizrbG4DWgrNqEI34SXsShc/UmO
   X6VBNOsNBKEJ3TpJDXl2fYDJpr5MNuKekKkNzZV2h6bnl7ZAazxyQcyUo
   g5mo5SkGo6QXsGmeNBiGihc481Sagroe9QZSyJq7bdPnUkL31a+ArHwuQ
   g==;
X-CSE-ConnectionGUID: ifVQvh7uQQa7FzCybv8lhA==
X-CSE-MsgGUID: Ci+xlj1vRKG0Eu5BPkRfGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="68104359"
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; 
   d="scan'208";a="68104359"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 08:13:28 -0800
X-CSE-ConnectionGUID: 4afkj/rdQCOGKH9crKe3og==
X-CSE-MsgGUID: yU2haqikRAWKc45pnmeETw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; 
   d="scan'208";a="203462588"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 08:13:29 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sun, 21 Dec 2025 08:13:27 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Sun, 21 Dec 2025 08:13:27 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.53) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sun, 21 Dec 2025 08:13:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ut8ZgQ3UlQ3bqquKmzZA0oHJbSI1BJkigDhDQs/ZiAibHGLXMNiSRoh6aLeN9r+oP46npVmHwct7r9LOK5ZYbnfw/9JFhx80HU9sIY9JMquHZE+LL2QWnXIVyie21LiDUFx73NXdkwU0k15+QlXt9fx3gQ91nyzNKv1+/3GHcan6CEuXSitZbzpXcWrqJ+6GFOTwCtoHAHII2He6/q1gTMMr8uqSTzYxukGEhx04L2ypnjc74Or6DPpHJfsaxNud/dkwOi2ZWmYrK4ra70tZnxpGreWhSp/0xplK2sLkw5Pcv5lYTWKPNFeWBNbLMsVQuI87TacGi2sTrRHWJ1RBog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bLQFIDQjK2tFWFw7gNHg7fjgFfxAPc6ICBeVAqddVs8=;
 b=Lc7E4kLVGPdMeAsRa9uWEAWCBS8eNPWuRCtjpjrAZYN0ozVsjSIesJgPq/3lAxiUOgIqcNO/khgZdOqJE3Qc/juuITEWDjmVtjPVnFuNRtgBJlfa9eg+Fbln6JC0GWyCInGphSKfYWHhzpd8S13RwCLKvKfjseIKmAKCQJKJOMeA6PHjoerW+x3/7AdTcHyyuGr8qNBHY5ohAP1uIZtUHTbWS2JdBMoe+Mz3eK8WnSMwLGM0cJGzX/+i2/2Om9hjmXOcjjaIARSfhuwH+6DcTmIcYdNUvC7yCD+mRqrcgNxPs56aiIDjfK66sqpEIfGj4bU5Cilo3wXRhnwARkhGsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8468.namprd11.prod.outlook.com (2603:10b6:610:1ba::19)
 by DS0PR11MB7579.namprd11.prod.outlook.com (2603:10b6:8:14d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.10; Sun, 21 Dec
 2025 16:13:23 +0000
Received: from CH3PR11MB8468.namprd11.prod.outlook.com
 ([fe80::8188:d688:bbca:2394]) by CH3PR11MB8468.namprd11.prod.outlook.com
 ([fe80::8188:d688:bbca:2394%5]) with mapi id 15.20.9434.009; Sun, 21 Dec 2025
 16:13:22 +0000
Date: Mon, 22 Dec 2025 00:13:15 +0800
From: kernel test robot <lkp@intel.com>
To: Janne Grunau <j@jannau.net>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [asahilinux:bits/000-devicetree 20/125] checkpatch:
 WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
Message-ID: <aUgcm1E0GgbSfZJf@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0168.apcprd04.prod.outlook.com (2603:1096:4::30)
 To CH3PR11MB8468.namprd11.prod.outlook.com (2603:10b6:610:1ba::19)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8468:EE_|DS0PR11MB7579:EE_
X-MS-Office365-Filtering-Correlation-Id: f2637840-a01c-4eef-66ab-08de40abdcfe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4G8XC4SOSVbJCRvG4sD2e+Nx9iphMuoTMBmCsHxlUtA+08s8lG2M1xFuCdwD?=
 =?us-ascii?Q?4mu36RwQ+OSaBNkuEGlive66UvhKyJDM8fqkbYHNEQCxGtkocbNmglcfBIma?=
 =?us-ascii?Q?ZE9hDmoHA/1HJjw62wfYabl3/fSsBVJo54Xwo12nQUj2wjROvto34Wn6cYPo?=
 =?us-ascii?Q?Sp+i5vmrUfgbAabOo18yANGCbBpy42ADQoCmORlUwlHgapwbeFMkF3vs+AiF?=
 =?us-ascii?Q?54ZVeGJZjO7abn/+aOuT78bI0JXpCwHccGauEGz92CM4oZPjGOVApavcHoBG?=
 =?us-ascii?Q?4QqAyNTLzGNC2cuvkPQeqoAafen5DUweWAvozZ/drCO+bpfAERMlPYJWOfEt?=
 =?us-ascii?Q?mQPvYbATx2CmkDG0bFJdTujdMQ/XsXbTgUAjrxl7aHLoUOpI8tCoAeblUfYt?=
 =?us-ascii?Q?o6sxpkBxlcAuzxjPfa2GunF54ZZjRIoqmESLTfTk4KMWRDI7aBvgNB4jxwnU?=
 =?us-ascii?Q?SQgDUFPt36ZiIiKkOSsO1W/BAZEleMcWK25B2CjbxUfcpcN9Gg6UEGQRTptw?=
 =?us-ascii?Q?npr1O+s33gUR3fl3ELtlEXTzDMwG27m5Y44yblDPouELpF5IRofn7yW3wzgV?=
 =?us-ascii?Q?WC+f1/17XFcdP4sE3TYNfY4ZQMsspIR9SFoRr5TUTqPZpaSrj4cMF8mc4tGG?=
 =?us-ascii?Q?s9JdqxoGQwN+QHi+MRL0xnpgpolY7BFMqIPfyiEWW2hObDTCzENcQ17jrgEL?=
 =?us-ascii?Q?1Q1cO/HzToTwpyLBYT5W7EcF2TeTstkuNLLvfiV8tOen5NIT3sqk7KxvHLCD?=
 =?us-ascii?Q?yVeUIR26A3hs5oEDkkxVq5FAwKFEMiuuqqI9eZX37yG9nNkd6x65CV+6uMw7?=
 =?us-ascii?Q?Hd7idhuvBQPf0fvVAh4KatJ08sPKGxvTSvs152Aj29RzKTmx0fkBhbOLhR9v?=
 =?us-ascii?Q?ffFMLHr/nlOrlY4VyXXvVpqarnuhS0LY3iaM9FGi1m1JcJcAb0WbXkCt7Dmt?=
 =?us-ascii?Q?EHwpw/w/23wkaxSJCFTcxNuglu+ZhOAcdgAxklfqNlNOJ4AUB8CC/uHg0wso?=
 =?us-ascii?Q?9PnyzuLvg6Wxs1+2+Iq0+1YYyAnzBDb+eicSYh8KXoJW7RRbv7wAOSZFO6px?=
 =?us-ascii?Q?SG66c5Jglp9iuETjFH52EcpxfAvR8lXMRPHkp5LONtbP21OxzIztLiT5bR1Z?=
 =?us-ascii?Q?1uGFGcnkBCUVWjmG9MOFD4/c8E+tjyhzcRjs1/Fp4JNgRTrtujkud2zjKiNA?=
 =?us-ascii?Q?J4e2eJ7uaIC9xLWfCk2jSSYGbpWXTlH27kDo8DDzGCIDxM2upOI+7wl7r2ES?=
 =?us-ascii?Q?kzR5s2Vp7RZyP7V6ncuJP4TvuZELj3+2vtYi5X4J0xYfbElRpvILZzM28nB5?=
 =?us-ascii?Q?Xbdsn+hnm33wgg7PZZgyBF6lZ6TBnj6R/nfPRnsKJtHkgmBlSap/wpokxgw6?=
 =?us-ascii?Q?/FUxbhaNYnbVg2U3uSJdrLsvPaE6NGJUw43nxl4Z/5CDP3xRcuD/o9taQHaK?=
 =?us-ascii?Q?2MSWYATnjr/7WqQZ7HWhkTGupP1+MfVXBe4qU9YhKiMQwKjBPWlvLA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8468.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xBRcLEnFhP8xQOUILeflWpjfpXlvdFsbqc3QN8IONYH/dRfSEAOI45tNRQxH?=
 =?us-ascii?Q?/UnW+tpC/kmc/dBcZxcebvhYqoJTEM0p0I/1cF/paehcawk8wRbgh/wBpc25?=
 =?us-ascii?Q?YGmMorRhIlWRJbXkjfdOYaiTsbcSyf86VEzmVIaiu5/1ta06eNR+UHWQzVh/?=
 =?us-ascii?Q?TRfm8k2cLwMKiZ5iXeaUyLlPy5cpGKfVwkJzhS7TS8SXRE3t1dT8wrWjZ4PQ?=
 =?us-ascii?Q?I58vkppPJ2SP0Vsekh6YdE60J2ozzgUoCq+UBrCwK4HI0Sl4yau4SHycCCwY?=
 =?us-ascii?Q?1IR1rpEw7OXhJNqrcZmdWILhi7/PH1L8MX9YYFqy4zj88QsYQfCDsCn9NUJ0?=
 =?us-ascii?Q?YwZuG42oYk9kA1Af8kuC/gX78npmlgfPc09hMbVi/ymuboC+wlJh0olYWmbF?=
 =?us-ascii?Q?yBW4IYwb+7YuuhdHnrsoXodJcSofrFaD2uB5JoFskvxfGquNl8hTaypCHjtK?=
 =?us-ascii?Q?g2THWi1TOV55CahgCNaXyFOTq8oGwzDRFMfAuN0ulfvHMk24VopaWXZ5gtrF?=
 =?us-ascii?Q?TetmU9xLpe3V6aKZKixYHLw+CdTd0i0UjP+wKCtsDAvN210jgWd30SGzRxsa?=
 =?us-ascii?Q?OK1V0Srybd24PrdZlp+nxoPFVbpXpYlzRRNxosnW/m8GLXme1d3jzwKfhf1I?=
 =?us-ascii?Q?+E0RHhY5CHQVqKibLRoVCvxaAPh1ybBBm2k7UtV5DFYm4TPgjgzuPO4tQ0EM?=
 =?us-ascii?Q?0XvWmTif4AntC3vU/6OLVAgAfgANyQWQCDbCWAakzxubczipe0kctKXi2bP9?=
 =?us-ascii?Q?1S9GDGdb5YNAe9UG61fmhYkZGIDX5mJNRPBVmd6AYyHJoafDBH3CqIjnbhJ8?=
 =?us-ascii?Q?SHsfP6ReKnUghUTw4+Hic/W1yNKQBDuXQn8rBxT5xAwyGkiw+fuI1hnULouf?=
 =?us-ascii?Q?RzxtHeR9ki4OUkj7VcRQBppWtIn6EOx50q4DOhfn8QXQ3pDrO4WMHCNpsQIV?=
 =?us-ascii?Q?N7VW7E8B1YGu73c66kJ6lTlrEYgZE0qZwMoGi01sWEUf/UHU5Y2FLFXDYsZN?=
 =?us-ascii?Q?0gnxpEiDX5+XIO+cHgaQ9k+/tAIA4fQzOn1iyBQSAMiLFzeyV4xUH9IS09u1?=
 =?us-ascii?Q?DMSZdqPmOP1RF3PQ3ZqNn2z+jUaCK0BD9uYtfIpju8kg8xiqTl/3Ru/RsGI4?=
 =?us-ascii?Q?HJmeygHXfE6VTHHEThP8cfp0D4MhCjj4VMWuZg565l024hRjRMq8DwQAmDZi?=
 =?us-ascii?Q?xwbxK1QB/0w6eMmdh64F8CoOcE5VrlLPBN6MowIVLN3DnhXD2dksuRXd24fi?=
 =?us-ascii?Q?3gyG6KsLAk5VTLrnkBVyASXm86SHf9MY0AyYoeKhPbDiIany66LRcnnp5KH4?=
 =?us-ascii?Q?BjnigZIUaNsvu7JgDzOQWHdJVvuzTInJiW6pDO8rVmIJcl6/x9YeIpGImUoV?=
 =?us-ascii?Q?ouXln4ooaoMzMvjMrS3L19D51dKXaMmr03fE7ovRQcJzTJVnV2zXCGANfh8o?=
 =?us-ascii?Q?PGw1ekNeTS5n6+oGAFMsnQgWDXZ/GtTqai4yo4pgdZUj7CCsChkK5v3WNZ/6?=
 =?us-ascii?Q?Dgcr+1websleYgFo1FQwIMX6GBcK2AupTIVB7PokCkXVnTZAlkfUQx4fwqbS?=
 =?us-ascii?Q?RGmhk2FoBDHDImlXNsXzWpDIZgpM6Zj7EJxwu8Gg5s826e8Ivsb2sxUp0lCe?=
 =?us-ascii?Q?pm2JSDWedhgidBF5I9PMZT70VFyDSj4PXJ0w4/8W6nRtDetHVvQnu9CGy6Ly?=
 =?us-ascii?Q?21KjH0QJP3ZQyc/nRTtPhgPApIukBHsVGzaYPsjtrrRtzLduATHd8FzFZwhc?=
 =?us-ascii?Q?fv3v/Q2E9A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f2637840-a01c-4eef-66ab-08de40abdcfe
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8468.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2025 16:13:22.7187
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MzY8cnl49t6RRNLVNyHjN9Q6EDT6Wdf90B5rOaq1C1a2vv5tcsoMrAKRqmct4pxdX5qOdKUgI86StXLPPatnuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7579
X-OriginatorOrg: intel.com

tree:   https://github.com/AsahiLinux/linux bits/000-devicetree
head:   4efff51e5abb86055ae7cd906a51f24d000b87fd
commit: 248b4c9da66059b05d624bcd68b58f98dcb7e88e [20/125] arm64: dts: apple: j31[46]: Add keyboard nodes
:::::: branch date: 3 hours ago
:::::: commit date: 3 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20251221/202512211716.veyRIJLs-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#34: FILE: arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi:186:
+		 * best guess is they are cumulative.
+		*/

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

