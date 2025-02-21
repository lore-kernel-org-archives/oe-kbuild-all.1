Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DC3E3C2F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Feb 2025 02:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740105467; cv=fail; b=MHQvYw5kZfhMx2PIO9sQYZyN+XW+fYD9eqHOLZEQdcAJbeJlc3Fmy4YxFQKwHehMT0j1B2hlucu3v3VlUEa4SCPfbdppVj1FQ4jc37XBbbvI/ycJbp+vfbv3iDlT3av/venPuclUtN+qjGCmjb7SISLXTdmStG5VPGmwzx9+sTw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740105467; c=relaxed/simple;
	bh=xzr160nP94YhfJj9MvHuavlmdiOz5MXLevSp6cxfbVk=;
	h=Date:From:CC:Subject:Message-ID:Content-Type:Content-Disposition:
	 MIME-Version; b=p6IQvAP3tnNsABg8ZI+dj6QrVqzlYagLoPbwG6lGl8vtO2TpUm8M4vCp12/Zj74KctGTzYbmdRUoJYscv4hSnfbhqXoD2xfErGXGEyNEmciu/BUgLO3D50jGlCkZhhPWibSpl3brXlDy44hf9z5gNed+hOrAgbl62dOFAm4wwl4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VXka6Y+X; arc=fail smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VXka6Y+X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740105465; x=1771641465;
  h=date:from:cc:subject:message-id:mime-version;
  bh=xzr160nP94YhfJj9MvHuavlmdiOz5MXLevSp6cxfbVk=;
  b=VXka6Y+X9LcZo8uxIb8TaRm71qMsq0Mz12vZ/hT8udnMhR7qc0DSYNTo
   8xOSTYsm3npixRUqUuWVgBSEqepHl/tzPTM92UHim1I5ZD4Kj4PU4vQb3
   LD5a3WpU/4JKc5f1XcxbkZsuTyxNQ8ylm1ut6vmAo92mjBP6TOZopM1wa
   VcpRcnl9tb1ClJODDHVqC8LQmQzBCgG3vl9N0hfaPvmO8zN/3i8Afjydz
   VjsxSeKWWoMa0HsuOLIB1NqTffw+/CXmOS6RBCjl+M57NsX89ZbSadxus
   //n9v0s1M+ZVQPVTw4OpmpccK6KASbKPOiOjobGsN4yNgJxXJQviIQpqh
   Q==;
X-CSE-ConnectionGUID: fWqPF5X3QDC0fTdCfZ37qQ==
X-CSE-MsgGUID: KzcanA+3RNOC4Ejj2uP5Bg==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="43744769"
X-IronPort-AV: E=Sophos;i="6.13,303,1732608000"; 
   d="scan'208";a="43744769"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2025 18:37:43 -0800
X-CSE-ConnectionGUID: EO1S2OvyRLKoHxHBrciL7A==
X-CSE-MsgGUID: UJhDoHYXQhaWFr/NbpeKvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="116131512"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 20 Feb 2025 18:37:43 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 20 Feb 2025 18:37:42 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 20 Feb 2025 18:37:42 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 20 Feb 2025 18:37:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o3CWBpfLVZQFWsOJ2JJQAF8ju+C46gmCG4bHmkR3R8d8ysdfD1hKKKzELJSgXY9MewRtxq0P/5FPN3GRVDGsvlhJcA7ty9hHY+fuVnW+1IFntktcK1qIzr69x9YD4ynvqAHK15kd86anHJyiyPLeHSsgUo2CrhfmASvbmuUjusYC0IioWEMflLKbOpAuRhi5y8mKEU8YVb7QO03SyLhmupeUS/3ZuoikFu+PHy9rfaswoHirmb7wvBH5s0Q8CB0N42a71pXWr9AclQjfaWayzioLsTNEMo7scvoObPl6rzQLZCx32ouLHeg/rYjHuUlefOZy+PEefAvNd8dyz8kGhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6S0suDGMVu88ThqoZEorTZCEPyNQMm2TBEraEuOIGzQ=;
 b=UywQMePkBR0CULXWrQpk/ex7jIgVu87ea2Dy4bhwxyytRJ+p4xXXhEpybeD59qmI+KQV+6yhqJpdmyArlW2DpiCa6gJnVHU9vUybtPBGBR97ujLSwZ1T2BmPGOE3fdQ87HgYAdY92UMzv7FJ0DLk4P1ghzp71J0ynVLHGSt+uTGR6HGqf86aOB7fikkEfrnDDkoc2587MgrRHjmoJWsOFznuqf/1GZjPPWJmQG4FakgBxujBo0whOiNd/0ln4P3y1tY+821gL2sQicSIZ5OrjJuSZVZh2eJl6phST9o1jrRD18yYlKBzUx2VAa9HvCl9tHVlqULR1hFXJWjIcxCjIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
 by DS7PR11MB6125.namprd11.prod.outlook.com (2603:10b6:8:9f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.15; Fri, 21 Feb
 2025 02:37:22 +0000
Received: from DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e]) by DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e%6]) with mapi id 15.20.8466.013; Fri, 21 Feb 2025
 02:37:22 +0000
Date: Fri, 21 Feb 2025 10:37:15 +0800
From: kernel test robot <lkp@intel.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [intel-lts:pr/60 1/1]
 arch/arm/boot/dts/bcm47094-phicomm-k3.dts:21.12-31.4: Warning
 (avoid_unnecessary_addr_size): /gpio-keys: unnecessary
 #address-cells/#size-cells without "ranges" or child "reg" property
Message-ID: <Z7fm2wR2XEqKWPu3@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0157.apcprd04.prod.outlook.com (2603:1096:4::19)
 To DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5423:EE_|DS7PR11MB6125:EE_
X-MS-Office365-Filtering-Correlation-Id: f59baee8-2377-47ec-dcb7-08dd5220aafa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rQtohSiXCccGabsUuzH0SfbUf7pg/nMFSdzzY8awj9X0kk7OjBK0OztiNyqZ?=
 =?us-ascii?Q?XH6KShW0QX+l3y4shfSdkVlHXeaXyqts9ayy9bYxbZueq/P1LS9inte25T6L?=
 =?us-ascii?Q?haGDBcRHlypyZDR5q9E5XrsPRfB+BgdNFtW3ab5CCEa6iiPsAog5J73ndF6Z?=
 =?us-ascii?Q?zwLmuQX87YmFaF3OFDbahqbfAu9SI6SmCrdbN5YlATifOLN33S668HmZMrrx?=
 =?us-ascii?Q?NvT8qpJhsNXE/p/Kp7ZElagacRZaRsl/01hCpz8bWnWH5RABf33rLn/uUduz?=
 =?us-ascii?Q?8QGJDelBVWo2lfYQBAx0qhrwlahICV4oAt2df8RyGGwwcF8lPd/REgs831nJ?=
 =?us-ascii?Q?7knwBl9+huGwn64SYd33I6+ttSQuvU1zGfG1soXzjFhKHUkgukyzq2pY+uLM?=
 =?us-ascii?Q?B88HTJr1H62/2w9mJ3T0M8AN9mX6RTCmxVV/NuhpbwUvyznYaF7pZ/0QYAaV?=
 =?us-ascii?Q?yPKGKaMwQC6cQ6yhfYCSE5LriAfGpHm8saDH9hn9X5dEa8Em5X6Bm2JTymac?=
 =?us-ascii?Q?kGos3D+P5KAZiwhUfJcq0bZ5+fSLw4ip5cahPjyualgD5nbfwCOPFy9Q1rAX?=
 =?us-ascii?Q?kaDIFyMnRNpy/Rt0MEEl/et+CNOsLTItD+QhI4lzXlPNx3tC+Jik58MfhqT0?=
 =?us-ascii?Q?mxV0WqumVxbdvoffrX/ZRs/GkcePwgPH03c54KrOFv7wzPgaiZmUYHWbVsPM?=
 =?us-ascii?Q?QMf5xOpSrqgIyF5QpcFCmanhc0kKcvsSh026+whbkBOduQuToPZpksNBdG7x?=
 =?us-ascii?Q?MPT+fVWROc94zxWwccD58d4368rcj4jk4uUxNY7yPCqMF1yNIqNkWkta+gDF?=
 =?us-ascii?Q?ynGi6Ommg/gVnkDHN2gNn0PhAQ9xxI4kgGDM4mcQU652gea6ACorpjerg6xm?=
 =?us-ascii?Q?fwCT0XWOGpYH1Ff/Gdb82qQs9NBSMjzh3l2wwPxpOTn4WesXhP8nZZuyati1?=
 =?us-ascii?Q?JVgMMuhVGTiMsv9G6ERQ6iVAjerHG7hHpOxPhB+AABoT115rPGhyaHSG8UK9?=
 =?us-ascii?Q?qMeLZD4PLnrbbc8fcKmJX4bbC2haudeXUvJIVmCFtXtP/oIAi5ByNtJSWLhM?=
 =?us-ascii?Q?6VopZzTRdZohDfieJCZ1Ls3jJb8PAfvyy20GYVq7Cpj8v33Hhaop1MTQXAKp?=
 =?us-ascii?Q?u+vYPO5sM3clFsdI92CfBpoDPYh55VtCtsXLIy4I1Q19HxGfNCXua+h0x0BV?=
 =?us-ascii?Q?VLdRwXqwcyCA5BFtm/HS64aZYLnQCVTTg36Z2pfMuEzBfu0k8KjBYgTYsphH?=
 =?us-ascii?Q?rsSKTUjtPZ41w9dkfw70q4y7Pp3pAgnOT4rXKJT6UfOwcvHoC5yB7Yj9cN6p?=
 =?us-ascii?Q?G0buSYJbYFbh2Y6eKWcg4oZWhkyxy0Tge6UAIHqVVsC5Aw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5423.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?g5A8QVj8IACkqVhZtIAK56VQLxNO4W/H8DXJaWW+AwdGU3h7/UmUaIYe+5g+?=
 =?us-ascii?Q?50KJvU6nrTntVkAIZbEDvMLFO4OHqm28g3O9L77KaS+XMSg9qVySbzXaELor?=
 =?us-ascii?Q?g0Ulcidy0QEVE9ZLoPi1BShLgvmlDEQvz6qFQJ0dQjG5Nl6w9FBMZ5NmRfo+?=
 =?us-ascii?Q?MA6NmeA9yUJ2ojxBNW/TfDaGvap9UQbqqxEGXs7z2SbYE1NrJz0L2dKemghe?=
 =?us-ascii?Q?525LkEskbg71TcwXlbv1igkUpHmVHrA5dbc5E1t0XiigdEH8jLgARtveIVrG?=
 =?us-ascii?Q?es0T3ewUnA+VSnf7P1M3U9EIsN+RDhe3ZsjHY/K9zwPcJpnWxOybLKEtzxG4?=
 =?us-ascii?Q?/wKvnVtKvYWPgAAJsuSRFRS4IRFM9zbdZIqe9DnMXB7YwrcI5xrJfKlnA7OX?=
 =?us-ascii?Q?Vx9DIDo3gR7KrIPGsCmj8hTYGFrU076Pp1B1x2MSp4Q8MK4TCxWca6Mlk7Ut?=
 =?us-ascii?Q?Gp61bU/ZMIBbJklAX4+UV2XzlCEN005VhmSv1+noNi+RMA/DIeF9vlOx/4sr?=
 =?us-ascii?Q?K4Vdpp1TO30NGLApfHYmH/M9+wn71pXr6p6Hl19KQslY8KFnHLqAfOlqpJF1?=
 =?us-ascii?Q?gtuN4722gvAGjRy2opLnTngIGytHfRQ8lfj5Gk6AxizezQa7ntkX1LCSOP45?=
 =?us-ascii?Q?lPvw7cyxvPx1CYVDZTKMLsZaa/Zio5WjTaJQXCpr3CRezKZOiDMkbzhe7jBr?=
 =?us-ascii?Q?K8V64LxEBt5Z8bwo9uTX4ah75pJ/S5OuG7vS8tZhRwMrOOD4JZtbX26qoGIO?=
 =?us-ascii?Q?MGbt4aNXp1Bcdg9Bv44SrKqjADsFTQ+JGUneHrb/PMZolbFbus66M6tYlFF+?=
 =?us-ascii?Q?+8+uHYD4olnMb+ZptMBxGlD1at09EXJbJgNzQY5GrKQNx8B5XDO3yRKczXj3?=
 =?us-ascii?Q?ktZRhE1yJt68LzR6zpSNh9ceirgRbwQ+1e5nzwgUxKaqt9CsSV+SaMSzBado?=
 =?us-ascii?Q?pWx3nwzgW1iWiEpGkVccK4i6YZB+v8mhO3mDY/cWUqk78z9ssuimVTbAlPfp?=
 =?us-ascii?Q?2mJM9wuTzhGjA4MEvUF+A6+Qn8hBgYvDMdBRMGN04Nzjfy7QsgHK6NqwnPQW?=
 =?us-ascii?Q?Cqo/KSogy3ucTO0L6F9n09BzNgCigdx7cXsY6/ygRvKJ5Oz9961Xc3kSYREC?=
 =?us-ascii?Q?iYxOvL+7sBc53ZEcGTdfcDI1gOHXOf6Kpmc3U3RtUTSfNZmKW2MA8OBic11b?=
 =?us-ascii?Q?o66x0/RPQcsczNj+dskHgWwYme7v9D2TxrJN+6iQHoI2nO95T7OJ43bQWZjo?=
 =?us-ascii?Q?4xPpmpzXvjwKJ/JxO+497jABD/gvqEYw7UVZCQ7ZB7DgNsc8sMLG9JJ7yx0K?=
 =?us-ascii?Q?Ewv1OjybYnetj6t2khGOmvv+s2UQPTtMgpy3RhCTfCvjqTUcHElIiGPBVLxk?=
 =?us-ascii?Q?EuoXqfEkgTGZp/RXjsUI9Xv32g5dKZ0gknyNsoZNeezDgNpUrukpFcR0XTmt?=
 =?us-ascii?Q?myrPMXdhs3Ne6sZeJRbSZjD/Y9wPfiPVjGWGi4PqBJo/nv1g2IxZ7lkb1lXy?=
 =?us-ascii?Q?iM9aaPRv11O/FGhh3xbJZjKrPF1Z2YuQ3+ERfLn8TSxvFhjTOW9oZJB8lHjH?=
 =?us-ascii?Q?FnZx9Bo1ok7Coxp9gw82duuG6ghyyib+fHannqz/?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f59baee8-2377-47ec-dcb7-08dd5220aafa
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5423.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2025 02:37:22.2363
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OCtYKlh9HHZhfNn0KQgUVe659xrkiuCU2H9yEZ89i85YvEB9u00O1G8bxVVT4iobc9saJtK6vfFvn/hR+G/I9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6125
X-OriginatorOrg: intel.com

tree:   https://github.com/intel/linux-intel-lts.git pr/60
head:   9e3b33a0fe250f006a2d39da8cc8f99a0101e89b
commit: 40a17923367118e32e5e413a952736dd83635b32 [1/1] ARM: dts: BCM5301X: Add basic DT for Phicomm K3
:::::: branch date: 4 days ago
:::::: commit date: 6 years ago
config: arm-randconfig-002-20250218 (https://download.01.org/0day-ci/archive/20250221/202502210914.ivCLa9qA-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250221/202502210914.ivCLa9qA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202502210914.ivCLa9qA-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/skeleton.dtsi:17.9-50: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:21.14-44.4: Warning (unit_address_vs_reg): /chipcommonA: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:46.9-105.4: Warning (unit_address_vs_reg): /mpcore: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:150.21-157.4: Warning (unit_address_vs_reg): /usb2-phy: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:359.15-380.4: Warning (unit_address_vs_reg): /mdio-bus-mux: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x-nand-cs0.dtsi:10.20-19.5: Warning (avoid_unnecessary_addr_size): /nand@18028000/nandcs@0: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
>> arch/arm/boot/dts/bcm47094-phicomm-k3.dts:21.12-31.4: Warning (avoid_unnecessary_addr_size): /gpio-keys: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property

vim +21 arch/arm/boot/dts/bcm47094-phicomm-k3.dts

40a17923367118e Hao Dong 2019-01-20  11  
40a17923367118e Hao Dong 2019-01-20  12  / {
40a17923367118e Hao Dong 2019-01-20  13  	compatible = "phicomm,k3", "brcm,bcm47094", "brcm,bcm4708";
40a17923367118e Hao Dong 2019-01-20  14  	model = "Phicomm K3";
40a17923367118e Hao Dong 2019-01-20  15  
40a17923367118e Hao Dong 2019-01-20  16  	memory {
40a17923367118e Hao Dong 2019-01-20  17  		reg = <0x00000000 0x08000000
40a17923367118e Hao Dong 2019-01-20  18  		       0x88000000 0x18000000>;
40a17923367118e Hao Dong 2019-01-20  19  	};
40a17923367118e Hao Dong 2019-01-20  20  
40a17923367118e Hao Dong 2019-01-20 @21  	gpio-keys {
40a17923367118e Hao Dong 2019-01-20  22  		compatible = "gpio-keys";
40a17923367118e Hao Dong 2019-01-20  23  		#address-cells = <1>;
40a17923367118e Hao Dong 2019-01-20  24  		#size-cells = <0>;
40a17923367118e Hao Dong 2019-01-20  25  
40a17923367118e Hao Dong 2019-01-20  26  		restart {
40a17923367118e Hao Dong 2019-01-20  27  			label = "Reset";
40a17923367118e Hao Dong 2019-01-20  28  			linux,code = <KEY_RESTART>;
40a17923367118e Hao Dong 2019-01-20  29  			gpios = <&chipcommon 17 GPIO_ACTIVE_LOW>;
40a17923367118e Hao Dong 2019-01-20  30  		};
40a17923367118e Hao Dong 2019-01-20  31  	};
40a17923367118e Hao Dong 2019-01-20  32  };
40a17923367118e Hao Dong 2019-01-20  33  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

