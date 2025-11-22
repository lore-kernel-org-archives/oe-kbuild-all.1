Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 595C12EA172
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Nov 2025 10:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763806937; cv=fail; b=Id59r792AnVwW6UpYDK131hFDfv25B5EZkJ21sOOSiYcmlS+HAMRJF7GSX5rd5TC43DV6dIqBnFRP0NTcNGsyOMJDGG08bi3R0QrismuA0RstoLZEidkBljF5oKuRVIPlrj0ZoddvRh5lPzD5FdGoqed8SXd0LYKg5W4l5xYto0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763806937; c=relaxed/simple;
	bh=L3MBJuJOz29PTdxdIvOM2N7jJPmwqnS7TMsgwQIqJyA=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=irekKglw2+pFhdCjMLUCLHZEdOGBPvQZQz7BbuwxZ7ZPm6r7p5CBpAn2UIO0VvxgkqYEjkPiAT9GtTu1Nx6WVDM9BNQpP5MmLA/wGDtNSLByQxNC+TwRSXkNNYDiptfISbYkb5oMBG0CHxoeIAixjM78aZwBAd0p7LrsmGvzl2o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MF3dcW2V; arc=fail smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MF3dcW2V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763806937; x=1795342937;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=L3MBJuJOz29PTdxdIvOM2N7jJPmwqnS7TMsgwQIqJyA=;
  b=MF3dcW2VAgSi/eI9/R247O7F8WORmcMPE4YhoHozCB4q6z9Up2Ga3Svx
   nLLKqzTL5q075wXegfCg52isEBJNsVgdVhlJIn3suMRb+XtIfJJl3ftYa
   hGhqhtv2FeSSWyY3AlJWYkmIDa/seB/ZW4iQXc9MfO5IE17PNXq4rid2W
   hre4gZcQgu5SALz0/SfdYxD5VvroGGfMgUnbzN3latzdWKvlbACmyAbHk
   VTIi4MeSkSJRmP7L22KpmiQODPD1LRoA2+O3tlkfkqlAxmYEt7PgF8uvz
   keQJg8srKpmCbHJfaAk00OoHFRTAal1NffUPjQbF8xeCeZ2Y3MeXadkMS
   w==;
X-CSE-ConnectionGUID: d4rPQ0pkQD6GZh8MDYXdhQ==
X-CSE-MsgGUID: 4JanTCgPRzOeUiuut9JpmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11620"; a="68486513"
X-IronPort-AV: E=Sophos;i="6.20,218,1758610800"; 
   d="scan'208";a="68486513"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2025 02:22:14 -0800
X-CSE-ConnectionGUID: wCV3f24PQaizMns6Hn9pvA==
X-CSE-MsgGUID: Q4hNoCSgR76dvXeoQftQ7g==
X-ExtLoop1: 1
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2025 02:22:13 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 22 Nov 2025 02:22:12 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sat, 22 Nov 2025 02:22:12 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.28) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 22 Nov 2025 02:22:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GJrtNiTbB3MxprODySH8OQP5SltyNxWsnBlmPGAhwSI8ksLH+XB0In1FdHNEGib6x69SesZ6Zi4wStHzZRRh+RpOm3xE+WMv2BOrNG9aFv1oq8C2zJpJBj5bnQFaQwUGDjl7K+qCkfgpgEf+GaA69M4ous6rFoWHOOGIeyGypJGqd6jlwgzlSn8244bwVYYakA0A8DdhR9pz7FnWURlG2BsgObERjSQwGcQS0BY3fwHejiQONMiULtK25XZYCoQ8LprCjnWN3mvmU/nj644ZygPnj6SAjZtEVXzRVGJiwjI6YPJQ4uLgrV6pkg9ei/mFNs2un963xs1cb+N/TwduYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2vQTK6/Oyzv5ICJ3qCe1MCAXPuYKgtmOldtfEU3cWes=;
 b=W51hAwhQU4MCCDyiLSwWvdiixlc8MiujJsPqHrC+0GGqWND8PpHO+mF07Z238TMQmEGgfSBJpARxpooGboEUCG4jF0qZINWUr37qVoXeEtRwqISztC98kGEnEoexmdw4lv67jtQcFGjWCDmgknengCsc81x85wfPir31k565sOoi6LJSS9lHWfZUWPFYJZZPYvAGRj2hGTXX0BBVFOJIBzLEo5kP1uoNbJmUlAVvoRkjmfXy/qZLOVLlpAMCNp592/eRV71gWFpZ4Lax9vOJcIErYfgQT8cGvMvyJMuUuEGKCj8VCRc1PBapOp/ylqovxlnka5wDB8NFzbm0cQqopA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB4172.namprd11.prod.outlook.com (2603:10b6:5:19f::15)
 by DM3PR11MB8669.namprd11.prod.outlook.com (2603:10b6:0:14::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.14; Sat, 22 Nov 2025 10:22:05 +0000
Received: from DM6PR11MB4172.namprd11.prod.outlook.com
 ([fe80::f86d:a320:27b7:afcd]) by DM6PR11MB4172.namprd11.prod.outlook.com
 ([fe80::f86d:a320:27b7:afcd%3]) with mapi id 15.20.9343.009; Sat, 22 Nov 2025
 10:22:05 +0000
Date: Sat, 22 Nov 2025 18:21:57 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [jolsa-perf:uprobe_mov 3/7] arch/x86/kernel/uprobes.c:1439:36:
 warning: unused variable 'mov_xol_ops'
Message-ID: <aSGOxc+iATT3uglz@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0163.apcprd04.prod.outlook.com (2603:1096:4::25)
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
X-MS-Office365-Filtering-Correlation-Id: a37938e5-9a8a-44fd-420b-08de29b0fb9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5UPbCU8RpIUBLXrZwbc0fe3vOKxQUB75PzsDCctAc+oyi9ZY1ZtitWwcgXVe?=
 =?us-ascii?Q?4nyE0VqNlNEpzh0kT1cODQ1fnoljfFBRncwjDqLvIobShV1+eiywRHNb4mKM?=
 =?us-ascii?Q?pGkaiPQ8duGVxXMgfKa+Q8hqPRYUH6iPuYaIs85MnT5GKD/47mXcZIn3Sf+x?=
 =?us-ascii?Q?10m4W9F8FH/wfZvPcIRYp46qJCh3VO3kak3azzIOzXRdLpDAenor2MuMJ91U?=
 =?us-ascii?Q?USV+E2CNzT4Z/bwIl+M9qKZvUQo07pp+323TAjOliNkoQPVW77rcPYlgHw8i?=
 =?us-ascii?Q?8w73jTHjBOEofXq0DRXF9+iYZPYT7pXFLrYSAhl1J81Aqvq2XPFBbRhiZLtj?=
 =?us-ascii?Q?xqLgsSmbiKPlrV6D3N3seia1OWL6wyibxIl9BWID0GxCLz/B49vWJAnVgI8j?=
 =?us-ascii?Q?ZK8mdifQA9aIQ9HNKrryXta6VYZInoAE9WndakroLZNtPdPuBGDwDVMhPXpn?=
 =?us-ascii?Q?5T9vqkhRz9akE7CZozKN0UaD/wGuPMLmbkGj1cfHCiiMQj5CKSfXzpSUIfV4?=
 =?us-ascii?Q?5zyQQQwpNyOKBH8YdRtmLNAdMWwOicAlOf0ZWkNBiqsKgHMYc/+DX3LoS815?=
 =?us-ascii?Q?owXbbUB2PJSI9XFbEsJVdu7N7ATO9dMmDG63Y1Cmox6vlNM7awMdyFZKjr77?=
 =?us-ascii?Q?uj9CHStCLcnh78W9opXcsT2jX0zmkm3VmMbOzOtM2oQ2JvxcesxCUBTG5RND?=
 =?us-ascii?Q?OLvPfi2IE2EDvdZpfkKUtN6PEqXl5sgwer1lk+vdIb1IFq93lfIZBPQ4CIOo?=
 =?us-ascii?Q?p2RH9VhSIdINm5DMcRFiOOZ6+F9y28WfVwAePmR2pKzJHUwKsQl8pusO2IV9?=
 =?us-ascii?Q?d39T1TbzeIQGp0dzl89oZaBEx5rP/x9g67P0Ups/dlwcRcHuwVpXgzfvPejx?=
 =?us-ascii?Q?SJMVZWJ9Bzwt7XZH+NCuytyV4EDgUsVwZbdKU+myEb92zpPjnK/cZqSN3Bv7?=
 =?us-ascii?Q?bKqxBTLeRX0Cf1AcA4258wsgXPMtIBfmLcnwELPxXV2ZbeU24tCpMRBg8vvA?=
 =?us-ascii?Q?1tDdFLoj8MNBAc57yB6P7TCLiqPahInf/PAPaa4Bu+syzd2zxx0ac9lY05P3?=
 =?us-ascii?Q?YOrcAEKafmzPMdOY8k/dN6mQ4pbdzA7/76lIiymnJ7BOLlZXiCQzOHWWXQxP?=
 =?us-ascii?Q?5RT3Fu9HK8CwV77B6YagrdU46xeOjDZ0PxgnJXIIZfcgjLVKJFA46QbYciGl?=
 =?us-ascii?Q?Ai84C88EAiE9GgLwOcGuCPWj/HCcMHI2yNdP6eatnljXEpqTKE+sMJ3OS7kY?=
 =?us-ascii?Q?E2gPLOuS0fWmTNQmAT4a0FGIZWhB/comFZt/WeatT3S0yxwE+Fr20j5kqclJ?=
 =?us-ascii?Q?+p3oOekBHj4wndlxyHxyd6ZeLAQWL8WDNMt+vVSBi6daX11q9DWGivgj97CY?=
 =?us-ascii?Q?GG+9yvByWr9LU59rDwqE+/fodqhqKSXYX77KOgP2zkzU7ik0yCzQ1Ha28EQi?=
 =?us-ascii?Q?WXq8OO6SgW/Hhhdkm6UKpAv5x5bhZ0cMF4F2dit7t7x8cKgQjvf8+w=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4172.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vu4bXjcflZqJSN8bYv0EFKrCG0+wrDDjuPzEr13Jg4PbbIQb0F2+ReH/MXAx?=
 =?us-ascii?Q?k5/RllrztvEZ/+DGQxlJKtbQgCA1Um+DgcvciE4CzP/7JWgJT+jknascVB9h?=
 =?us-ascii?Q?ovEQ6GCyR30lKV1i+dGAB80ou7nJcSvrBZWQLMkvizjlF1PoErHQRbwX1nSP?=
 =?us-ascii?Q?wxED+4G7xzLZtnMt5cIlK23hSo78Wztx1NKdNStxqbFG4WQHu7w6FucJaAjf?=
 =?us-ascii?Q?qfl5Ev/plUIi5gys11RfTH2rI2zNHhIXnSd5BBwKsjiolxcOQK5YY5V1DTjg?=
 =?us-ascii?Q?2jRTch9BDTh+w7t99tpIvdDvvWvcUcgVhOpo5bKEETxIzNgCQgi4weV5Aeg8?=
 =?us-ascii?Q?RTDUHvE59t8AJbA1NFpuHArBf4NggWojpW0/vCFbsh/OKvBp2nqC3GNHnJeQ?=
 =?us-ascii?Q?bgPufy7rfKHep30OWTtrAeyCWPUs0P/T6zWR7D8ph6SM1iJBakVjOKkLODFF?=
 =?us-ascii?Q?9kpzlE8+w0s7BO32vQCC//Zyj5pC4i+PwHibysR33jdcVccqaHyeRYm+1mLr?=
 =?us-ascii?Q?29KqAFA00OCKK8s5K6DLem/Q9//x5Wve+OFytc2uNlhqtuVwq4+Sh+W9aM8r?=
 =?us-ascii?Q?xus9TM5VQS2t7HQdB/z+xAiIO/AIVY1ULl1wuf9pcS7UCujrLxpbRphN2WqP?=
 =?us-ascii?Q?gVsByfDPpSMG8LMhZqecVN2N3iKCdqDFIiXmPY+9WJ21XXuQ7VfITR77e8uX?=
 =?us-ascii?Q?pnoAhxRSSnBLkMLHVmNU5f1YBjQ52l1VElrGAtk/EacDMDpXIJdvbJEF1AVq?=
 =?us-ascii?Q?lk6jexAvFDCRqenrGXPuyAgwk5ECsQQgo7mR5SENO7T0A6Ah4Qv29nUtHQr/?=
 =?us-ascii?Q?cgiwe5S5a9WuinuFu06Kut0M7XEwhsfXa2A0Z3jxxN+mW5et3FOnmRSce91Z?=
 =?us-ascii?Q?ChMMUUeHc56RWR5qxcWJM6hhMv4lBwgtk3jL6seCFcZVdGBcOyNWCsvGGNij?=
 =?us-ascii?Q?X8tlyYXWpB8lNbXAk+Z8F86vwm5N163vEY8VjzvJtsMAgHYFW0VLSGuFvMsO?=
 =?us-ascii?Q?/kDpDa3jACzBsBlI9iGeeZ6o+y9j4HrzVJ2D8YI49AYDk5mff1t6lOlQUhiw?=
 =?us-ascii?Q?06oE/aVYG1ZquJwxmNropwNB3jI9rHe5ClcmL5jgveBPTLJTLxRlHVWXoZrX?=
 =?us-ascii?Q?+THnbbVd9HF+QB9aHFBZQuI3Q82QmQVgZRMJ002DykstBgOZvrvr1OYf8o86?=
 =?us-ascii?Q?aalgkXkqhoKF5txL1tP4pcAkHkHNIKDYr1VM1JsByzLW0Q/Dn0w/qPmlbDBk?=
 =?us-ascii?Q?WBP9go8qidMD6+ytYyxRaU0xx5sgOvjmQ9OhRK0WGZ3ESAWCcTkCkd3Sfv9F?=
 =?us-ascii?Q?56zIoAAotzpRAEL/2iaeOYAq7eYR6cakjD9wcgo+9rL9oO/xAMGGpmFMc6zE?=
 =?us-ascii?Q?PAlHG1bTEaNixyr2Tem/qhLwleqd3NeZ9SSGHfGtHmjrUuBLnwbhS+GbLVll?=
 =?us-ascii?Q?t3Gm42StC1Ac3pbMjzrr7Jge4TXwScHFaOpHK/6F6agCGm/IDUFdKCIAIdYa?=
 =?us-ascii?Q?OWLN/0b8a6TRI1VnVc+1bG2NZxBdzBzhYZ+uW/5nlLeGgK7i24ZThz1dIILd?=
 =?us-ascii?Q?bz3RQZ0OBP3hca4/ynpfokyFS3YcBkZ78m6iDQh4?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a37938e5-9a8a-44fd-420b-08de29b0fb9e
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4172.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2025 10:22:04.9533
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qaayye95qb7vKYMh7RKqr1OpKk+32JkSM/fDw+29eg9ZBoyTzKefeAoK88QsfjMVbQ1bNmZ456yP2JYIQMAjiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8669
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git uprobe_mov
head:   a54768cce1f5e7bc78f6e0278b90acdb53f896fc
commit: a6c17d2dcf5977d023011428e3e1352752b70575 [3/7] emulate mov
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251122/202511221048.wcS5HafK-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251122/202511221048.wcS5HafK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511221048.wcS5HafK-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/uprobes.c:1439:36: warning: unused variable 'mov_xol_ops' [-Wunused-const-variable]
    1439 | static const struct uprobe_xol_ops mov_xol_ops = {
         |                                    ^~~~~~~~~~~
   1 warning generated.


vim +/mov_xol_ops +1439 arch/x86/kernel/uprobes.c

e7ed9d9bd0375c Yonghong Song 2017-11-30  1438  
a6c17d2dcf5977 Jiri Olsa     2025-10-31 @1439  static const struct uprobe_xol_ops mov_xol_ops = {
a6c17d2dcf5977 Jiri Olsa     2025-10-31  1440  	.emulate  = mov_emulate_op,
a6c17d2dcf5977 Jiri Olsa     2025-10-31  1441  };
a6c17d2dcf5977 Jiri Olsa     2025-10-31  1442  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

