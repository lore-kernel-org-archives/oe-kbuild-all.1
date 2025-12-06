Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3452B2F7AD0
	for <oe-kbuild-all@lists.linux.dev>; Sat,  6 Dec 2025 13:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765026009; cv=fail; b=If13P4SiOtg8Es+/6eJJYssV99Bnc3Sgpc0P3yvIvVj6AxEuZuQrE2wof+FZA29qY5AAH9HAdFil3Io8IDJChZp3XdnCZRhWWKX4KIs/BzIGaiSWjzDRxqHeLSFISWUB8p1ss2BO1SRMD3H/45CGl6sWRCureg7sxFWLP454em4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765026009; c=relaxed/simple;
	bh=36C7T/8Jg88EUc/XnqgTJbSy/GyYk1atvyYvdEVRrqQ=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=cMhqkaYqfjGvk4tB1sRxUKC11+Pwx7rGEhA5a1j2Ttkch9zn0g3H6k0fk3xrYruGje1qQPnLMTAwyXW8SwR29u9p1T/WqqUZUX2dNctoH8U8M64ri6DIM5btU2IVeirufEmspUaCsCT42ZWJsBIvk2Opbgg7o/nwgRxwKYDhATk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eGcsKACc; arc=fail smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eGcsKACc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765026008; x=1796562008;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=36C7T/8Jg88EUc/XnqgTJbSy/GyYk1atvyYvdEVRrqQ=;
  b=eGcsKACcQEjw9EXJtvzoSdXyte0+QBcciYV1DtRxmXHJMNHTcnZiO/qX
   klPj5szMH/iFoD9QSFuvckyUS2GoDHsQ2j4V92uS4A+jniexiDN4HfvOY
   XRteGXbFqq+UNKqNDU4IIwIyC1eacdR9j/jNLX2jQBqDVsIkyPdJnGpF3
   hggnEVp8m5V9hb6FiiksWO/my3orvZJ22wpf2GsZvnQhtj5QKY7OnlP1e
   6SrlAz8pTZXffhOd7znLhxXfK9nn8oX7wHHQqahpfGz4xp1uPtX9NQ/Ra
   yWrrtMnTue7gT4zITVHDKxApfFLGrxW0Sx0Tq7XOQhKFxJvk8vvyMpGTF
   A==;
X-CSE-ConnectionGUID: LMggCOz3T9eTORkNkDE3bg==
X-CSE-MsgGUID: om8HO28nS+eiUea1sKrjhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11634"; a="66227517"
X-IronPort-AV: E=Sophos;i="6.20,254,1758610800"; 
   d="scan'208";a="66227517"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2025 05:00:07 -0800
X-CSE-ConnectionGUID: tx/vZH6cQHy7yWvGmWEkSA==
X-CSE-MsgGUID: PbuMPT0zQICvyLhLjqaZoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,254,1758610800"; 
   d="scan'208";a="200005412"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2025 05:00:08 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sat, 6 Dec 2025 05:00:06 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Sat, 6 Dec 2025 05:00:06 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.44) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sat, 6 Dec 2025 05:00:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lsU+KISxkr0Mt5g0x1ZMLvYzEcN/RiaCkInnzYat78upB2kJcolfEDi8/RrR/0jucfDXxaTzqKvqP8IpcnDw6Oj2Wp5KYf8zs7RZwkmWVh+30vPtc97ICH+yCVUuBFLoj0o0DVb4ef6LCxD1A1xZBTYhwJ+edGwwCiEY6XjstQmUPwKGzt3wbz0U4s/mgUTCIlhktj6LtUXhkhX4ddgtP9tMBTlJe8Cl4zvKxXC9Rhz3JlxoT4JXZTVI+Xihc8504p8MGyGluzshH/V9FdFjuBPe7SAeFQ9tboMo3b/VS2BrwNoMAu4/2ivOaZWufSYW80nSmnALrO9h4lgtxtU6gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f067curzO0BOMN5I7m8/JER5ZMq5dPXTW8joOwVOt9A=;
 b=JVRg3YFAxFxjDhgCe0LvkVmM1J65NewoZ8cxje9HylqxQ8Len62CTSXzXbP2dgUYrLHJsjv4quNAigea/uEEiqLzt0p8WDY4NmhcBfvOipMRGIeelgsQTtCsCHy/A5QA4mimJpzrFAsR9lN3CQYIpXCA5eMe9PStOFXbncZOBJlNxDJf5l2Et1x2ax4QmXoZscmSUZEc2f+Jzws9fg5nhtL6TvFcJuIc9kfSJdBAcnFRzphxqhMx6jlGRFZOPZjIjo50k7ewb74gsIL4API5iHyDCiB4LZWsgz3ZdDpUSNsCQqQyMgVyos/S8omieEFp7yNZUimawBuqSaM1vHyMPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
 by IA1PR11MB8245.namprd11.prod.outlook.com (2603:10b6:208:448::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.11; Sat, 6 Dec
 2025 12:59:59 +0000
Received: from MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9]) by MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9%5]) with mapi id 15.20.9388.003; Sat, 6 Dec 2025
 12:59:53 +0000
Date: Sat, 6 Dec 2025 20:59:45 +0800
From: kernel test robot <lkp@intel.com>
To: Mikulas Patocka <mpatocka@redhat.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [device-mapper-dm:dm-6.19 16/29] checkpatch: WARNING:REPEATED_WORD:
 Possible repeated word: 'could'
Message-ID: <aTQowVcIX7ekCVWW@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0152.apcprd04.prod.outlook.com (2603:1096:4::14)
 To MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB5963:EE_|IA1PR11MB8245:EE_
X-MS-Office365-Filtering-Correlation-Id: 9bbd1b4e-8b1e-4219-90cb-08de34c75949
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?kLTdgBAgRY+KNF37J0zTDla2iPV6bcwKs5JerhHkiiW5Xh0AIGvDJAuzTmK+?=
 =?us-ascii?Q?EtnpLfPCAuunSKWM6cujPzJhcQcEN0yJbVob1EpUVFqdPBpHG9XlXZlACiYL?=
 =?us-ascii?Q?XlOxWXntOO5FErl0eVGg8/Fq1CYSnvgmYQxTQsI2qxOoEHrfBUkZe1L9RFQ5?=
 =?us-ascii?Q?9a2j+n1XdJDguHT2uuPX0GfomiiWin06fpMb81AXl+rxoceT0ZPRbpfTAFRJ?=
 =?us-ascii?Q?5Bnv109qKxlLmIUXbSLUBuJ3a1xQe7FVMqaNJJ8Ok+CkqETnnF0JXrtjylLa?=
 =?us-ascii?Q?7aowf9JnDOEDTG4fPR39inLSaYHwoOAOoCSZA4LIBr1g6PmdjyepklS2JMlb?=
 =?us-ascii?Q?BtX4pgBIVy4Pqb5KCCy2kU62XSpOwnKdZfsAyr+9oy7k186NzOHGDVLo3paj?=
 =?us-ascii?Q?lT7WZah8x+EwToz8v+c9cTAgumZ+hoT6d/beCU8OoMP6J0VDc8AwDRuNd3jb?=
 =?us-ascii?Q?TN93KBhd8WBgYSBur8/XmUhCDXGEXu8yh2RJlgDka83F+l/OFUNAxIu+L1hA?=
 =?us-ascii?Q?SAImDQ1wPP0UpGvh7DlZ6RExsL3OvjklXy9GOVbTPjpxhruN3xh+kC1fez7p?=
 =?us-ascii?Q?r2VA9TBq44HXEXxl9DWONB3THDTt/OtlKMnC6NmEEOfT0MFtE2QlvPxwteHK?=
 =?us-ascii?Q?ge7oIDMUQ0Ro/flmgP5LghN31mZB1mrjZbrDzugt6TWKEOEv+PP8lrIKw611?=
 =?us-ascii?Q?Kcc3/ZWQXOR0cPKrJ2GEaEg7UooiuQ4XO/WOV4my0ncUiyrLEuMMvmKa/44M?=
 =?us-ascii?Q?Uu4pmUszQGJifJvl/Ho2MgO0dXCtgruFc/nVKa/5DxnbubnxJWRa0Tu5gerS?=
 =?us-ascii?Q?062KUDP2ki8G8rRxOFoox9vdm2T0caGKxXwD3O9siVKvzePE5rzmez0kA+k3?=
 =?us-ascii?Q?XHZxM85lyvVGEALpWF0m/fdYW8Z9EOT0LFun0oXYhs3h74tyZfy1zPLkR1xN?=
 =?us-ascii?Q?VrlUAk5K4knU3ZR2y4dwkTVMjKtL1gDnQ2FJaq/4kJ+4n/D5BR6wbqlUKEo/?=
 =?us-ascii?Q?c408eRCVI4rpsBdVwE6Enp40+O8+9n3z33v7fh+hyM0r5Gl97VhzKWMo7Rvt?=
 =?us-ascii?Q?KdhJXwbzs8NRchDQQcTdgtVjznoitTlO7BmbhS9+mIlQ1oloGeSTwqhP5j+h?=
 =?us-ascii?Q?26dgR6w6Lx+Kbc2JU7JA/4vMTL+LiNU+GMi8t8mp5cUXpJwOF7cRTVg21/iH?=
 =?us-ascii?Q?ncSevKmAARSxE6hsv+IukbvJEEpzv049TVB9LJXn6KXmc2tXk7cbu4OYkiJg?=
 =?us-ascii?Q?OZOej1J9S6/MMEXmLDv2Tzf5/oMeDtWPgjLy5HIofytL1cDLBtoZCMacf1+T?=
 =?us-ascii?Q?wEbbHVjEIVvJ/992p0Xe+NEmbI1zYoBpr1Tx/YQ5mKHEdzJ4kUVfcHBP1V4P?=
 =?us-ascii?Q?b243dhXPXRTY7FtVuZen+w8mI6MIcheivOJqdkGMXaazGlQ2tT5rq/hjpQkh?=
 =?us-ascii?Q?YdvvjL6ze+M3VmXDROFdHq6MGOTw6PvOIzPTG5XbXblGJ8ehVfFPFQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB5963.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?j5lyR9Uk90/aJfHUICQpdjOj7uc1NefL167KdWFt/LLo93GSHWhBRc9d09bM?=
 =?us-ascii?Q?r15iNX1mm0yktce9IR9KaPDcaKflqdFsx5XQ5hs0LVDczttJ73UktLdnsw28?=
 =?us-ascii?Q?v02KVEsOVZ/9E3HvRdTUNdjEsHGU4mYTNcqQ0AXSShYZ6/vsY2hCsPBtP8pZ?=
 =?us-ascii?Q?A0aXmgkzhtS0Xr1P3BGL67wg3720azOXQaxPBafjUeE1fWFEUU7S6sfY3y7o?=
 =?us-ascii?Q?Xi+t61SsI/tB/kkBLxaysQsuMKC/C5c9L85nW2UE7F2biiQuYlYO9KilOYCx?=
 =?us-ascii?Q?Bkb/uWqHcSOnJ4Q9c/mGChaLj7NT6zWBOGIF1YyMfEPy1KwAohTL0qD1wO1I?=
 =?us-ascii?Q?U0k3luxvwCOAOhoWvsxnnk3meCcesv0M7MDNiaKMFTGYYyfKqDi4MFiKI6fm?=
 =?us-ascii?Q?bbfdQ9fDr0RBQWRXXdcfPPLDu/r9vAcOMnYM39fcgZhFk7Zjwiarius3uPTC?=
 =?us-ascii?Q?sObDAXfMSTtTZIEkd+dRgoKhQg0W+8e/TYw9lG0/1DGRprFnZqPmEBdDem4t?=
 =?us-ascii?Q?to9ISccp2sOBPPKAtesLwi994/ueivclDwLFBL3U+yOw7Kp0AfFvOqqFdqHt?=
 =?us-ascii?Q?3CT9UIw8HkVJ1f3+m7P6GkNQveY8ufGyOqDDYeYgSH6pAMxB9cAcvih71plK?=
 =?us-ascii?Q?dvElCkTqk4ST9H117AjHJUcRTS1g/D0RmMlWzcT/bpXKILzHwymMjKcwFi+C?=
 =?us-ascii?Q?4fGUn1/EEwvk/dAYdgl0NuSZ3aJGihn5rxfDn6Vwp5ZKCf/35xji5RLtS+H6?=
 =?us-ascii?Q?WCtUDotm7VRylj47QvStWTskIIiG5//+XsBkvqfrw1z4JfEvw8VkdepzItc6?=
 =?us-ascii?Q?ltayxaqqqpHL2UUu5WfDiFCgHsdQUdmyOhxHu7r5YnzmqZk9SHEr0FufwM9V?=
 =?us-ascii?Q?Bs4LvgUn245qUSQf/yMZ2NJjyMB0W1HWXsfW5l2qz7uvSADr+9IaV/FvwWdx?=
 =?us-ascii?Q?C+MSa6GNjpcMLoYSRYJIaQREOCTCmDdy3dAGycr+KVKKWi4OXzjdNNm3q43w?=
 =?us-ascii?Q?rQGaKSqfJstgAVVjBRZdieEpMKUZlrebf0anV8LAw97DO8u69VsgTk0Sw14n?=
 =?us-ascii?Q?1gDr33bfAFa2kMufGlMhekjdv0APQKQTpL1YuUzes64yUy3wJMVFRJL+zXL/?=
 =?us-ascii?Q?EMCJO04PvOFeshExNL1WfwHdMaygwLeRCXeva4b6hfKzbnqYLXF/iakSXHOi?=
 =?us-ascii?Q?aam1sI7Lk3yEv52rJK3x/LCBo91EVqGi48UpMJJEfmKy3+F1/95mFqYo5RGA?=
 =?us-ascii?Q?uXLjf8UTqlrAAV9JVw2dO5ePaDZXvWnsNR9hHHoxv4tzKC1RdKGkiNf6QztA?=
 =?us-ascii?Q?1QdhHcnkLLDd9kzknUKk8NP0JKBWfO3cto+rvR5dqkw8Fe9osFGqxj75hH1e?=
 =?us-ascii?Q?4KNKMihMYsqn2EVWF/E1HS1NQtUeXxEKi92ajNs7bIpHkv5Z1mxeKSsbKxxp?=
 =?us-ascii?Q?T9v2bf61UwusBCV9l64TQLDng8hkIFmjlzTEV1OLWMuHqZm13T1/bNpRADLn?=
 =?us-ascii?Q?siIb7FwXF2TeEarsV33vQgE6+GzCf5Fx7sLyu5Dm36JBKFKlfyO8LPeWq9Il?=
 =?us-ascii?Q?9Qx1WrQsst8oGs5FnIKl7lOsA3UAgiVdQYRn9Fkn?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bbd1b4e-8b1e-4219-90cb-08de34c75949
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB5963.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2025 12:59:53.5048
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m0XOFF2HCDDBU7fy1AMaKRk2CmBJbONCeMHQrTFrYiL/gO1zdiPW9XXh4oMjFKQUiQUACCeV7gf6h+jXbAGOdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8245
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git dm-6.19
head:   58a0cbb4f70a5dfbb7b70b50ad2e13026186b14e
commit: 7f75a7c9213aa5233310b20b8a5b3fd590c4948a [16/29] dm: test for REQ_ATOMIC in dm_accept_partial_bio()
reproduce: (https://download.01.org/0day-ci/archive/20251206/202512061300.GdVFVVx1-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'could'
#11: 
otherwise this BUG could could be triggered by stray bios that have the

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

