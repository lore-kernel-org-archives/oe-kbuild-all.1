Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B315239085
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Dec 2025 04:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764736632; cv=fail; b=FPR+trRM6FGQDB4fmJ+i7V0+oFztmuYOapK4a+2zIUHW7Fa/piWoKoU3dgY4PAWdsP6nErZMl+/mQKOYexfLHYsdRqTFSlo+vwmVlLZF3cG/6YQS5twegOqK8NDR2Hxojl1qcpn78bxVPodr4J5fb5I1ssAozHffTAu7YJNCxR8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764736632; c=relaxed/simple;
	bh=Hk2Sp9/D4WIer4UEedY6w0I6Utvo/vHfwMRn7uMAgYk=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=lXPxPOZdEzzPlcH8qYdF0cn6EKoRPEZWSYYU7OPhbu8T3RIgUSoGpyedwePzDtRpACt1b4VjbJ5hqA3yXd7otY8Ssfax98MYsKSn169nvP7MqVilKwKht35YoMD08mepsmolfh8IUSZ9ivewaEY5ydl13K4LmouqpUeuopxOYtM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iUKyiV93; arc=fail smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iUKyiV93"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764736630; x=1796272630;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Hk2Sp9/D4WIer4UEedY6w0I6Utvo/vHfwMRn7uMAgYk=;
  b=iUKyiV93QLswFYkaNonSdmpQ9EmhWWrkUMR0nvlB+j6xFaeUyA85ZzA0
   wYzdGgYl9OMLrawQgSa6uTPMvQk/IiKneawtLSYvoZEB9w/7yupkICecc
   XKi8CZyeKy4iW0YhdqPS3JLlJwIwm0SdQg7bVNzIbEI4Cf0WBlpjeDyJO
   Pm00aRkD6hyp2NgMna5PBc0svr9tcpkrl+hQ76Ij/Dt11yCmQcr6DUJf/
   OZOmmiaS4JFfZ77ocPd8KBTNNRCyd6SnCBcjajMKA9GGU7yO/hdyxpUeF
   d+N4KuXEJKYysn/DDXIqZ+hdZhujygACNzOXq2T9uiucjh4aA8YDJMCir
   g==;
X-CSE-ConnectionGUID: WsBoUDTMSYuP2Vpkk5kzvg==
X-CSE-MsgGUID: VBWWimviSA+Nw9xBf/ZfKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="66610328"
X-IronPort-AV: E=Sophos;i="6.20,245,1758610800"; 
   d="scan'208";a="66610328"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 20:37:09 -0800
X-CSE-ConnectionGUID: uaKNHGT5RTuLgm1Jb/MbWA==
X-CSE-MsgGUID: CEejr5p7QMu2H8bodMfGQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,245,1758610800"; 
   d="scan'208";a="199049034"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 20:37:09 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 20:37:08 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 2 Dec 2025 20:37:08 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.59) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 20:37:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BX08Mh/LWV5Xq3gCrEifgsOcUhRxy3fy0+OaOavcRWYn1fQdQfVzaOtuSbPyrnJtC4grTqoisfWqImIucRhsAPA+x+Mdfx2HxgzptFI/4hKLLI2Zwl7IC9QoQ4L7dF81IDNhT3x+AoIbHiFpSqAq4aRM8w0xNTVeIRgTzmFdXjRlbEra+KgvX4oPhnKruF1TXsaQeWvmk2bj/tlKlX6q9Y9wktr49/PkzIF5fu8Zz+1NAlS4s222qieqPUauKXqwAirag8MUb69XdQmkts3sHRr6j3uRT98PQ+oQGCC47TB0CKQITr3zEfpK44TGKsH4SWcHl62GHPKJn/cKhJwJWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q3jNNDU179f6oCvlutkHsnRBatXAUz+CMOV8BKg7GVA=;
 b=Gmfdvju+wrn7zG0dVBnCLXIE1sVLnJYZUEXfkrDJ1BytfjnRp20doDUkbVcuOr/loXd5k6bm2puaxwpojwJ9/ImFXILaF62OdSbgo+APj3QM6KPQV9UxoSfFO8RJjfoWzk4u5ND8zyYGS4An0wYZ9q2FveAFGkxVG2ZwKnrPMXbYiLEUCBgQgxzQFGkiJQKPLF84uxnbEG4sFcXtsSDrpY6ilRcB3AKzTLpljIq8TKvDflZ91ELaJt7eFAmV3qTluZWoGE+hUnNNYaPOZOg0pRxHrltpR+OQ8YLR/MgRs9MzPiY2WoAafqq8JXp3TE0mnp1YhwxX/KXVPMK0qoD3rA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
 by SA1PR11MB8317.namprd11.prod.outlook.com (2603:10b6:806:38d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Wed, 3 Dec
 2025 04:37:07 +0000
Received: from MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9]) by MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9%5]) with mapi id 15.20.9366.012; Wed, 3 Dec 2025
 04:37:07 +0000
Date: Wed, 3 Dec 2025 12:36:58 +0800
From: kernel test robot <lkp@intel.com>
To: <cros-kernel-buildreports@googlegroups.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [android-common:android14-kiwi-6.1 36/36] map_hugetlb.c:79:18:
 error: call to undeclared function 'default_huge_page_size'; ISO C99 and
 later do not support implicit function declarations
Message-ID: <aS++asMbguVgbUxv@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0153.apcprd04.prod.outlook.com (2603:1096:4::15)
 To MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB5963:EE_|SA1PR11MB8317:EE_
X-MS-Office365-Filtering-Correlation-Id: f81695cd-c824-41b1-c66f-08de32259d60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?8D5B4Rkl5Tnjyqp7Exyuo6sIvBc835xAQ7MrU46eiPydjvsXhywCKQQgGHL4?=
 =?us-ascii?Q?AqNno/WBR0zIqekSyuXTZlsXlB3GoeHEmW5pmEksXzlNa7RizrUWE81ACjwX?=
 =?us-ascii?Q?u22cMFNWZTXrSsLRKeUilAVk1UstKwsq1J0VR9nP9ORKcSlp8xZxAw+aGtWI?=
 =?us-ascii?Q?WZnr41E2D1H1eSauMPsXDqKVwFVNlpj6zsCQmBkfCFW2ZEDDziDZwXq3wVz+?=
 =?us-ascii?Q?YJ0iKp16s4YDOPUTpzDaO1PAUJ+uQJEkg5skKRw6ojYOL3BXwi1cqARN9fSG?=
 =?us-ascii?Q?BjfPZsorCSO7Q23ngqM90vlUZ9tJWGg6oaUWO1YhcJXjybH9CROdE4DEVFf3?=
 =?us-ascii?Q?JGiMSIeNf1dIYycVGD+xzsUlMZYiuYf6StGb1ni8S0eBnIdTrg+852bI54TT?=
 =?us-ascii?Q?WdVN35LrfNa6OpVGmmdZGKYVNrn4R6orpZsAKzqiwszJLZuJ2Mg6ItE4KgHo?=
 =?us-ascii?Q?exVrPFCmsEbGfUbu7RQ3B7M01kg2GUqfYQuMpaMV9tq0lwLW5iS7kCZ/JgqR?=
 =?us-ascii?Q?gkU8I6uw4abtyTQ8nPJTqXILNwfHrTucCaTyR3QZVIRry2VKt5kOOXcQWumH?=
 =?us-ascii?Q?SH8tPjmqhkuD+II5zEPFw+Fqi9/dnvRRQ3bFdSDY5DYca3VSNCHDyA/1XLUe?=
 =?us-ascii?Q?2HZkCTUiTUVHKEAHXXahgnQdV8HSRT+Y56sDSuqO5B3kZLfTVAl7xY0/JUNj?=
 =?us-ascii?Q?dXrjbG8gc/6Zj3/FznkyYCtYuc3fX772cStMu0fVaPgBuPYUy1+/RJBDpZ5b?=
 =?us-ascii?Q?YdZ8sZ6AWXau7+WTFBsFKcgICEPzr5M5AxqQEj9fycWhh+sxDqWeZ++NxSZO?=
 =?us-ascii?Q?Y/2z4JGGYr+oQW9ItJClwEmqoSKLfQf8hoRp1pNGp1mUYR8bKJpdLrD3thNN?=
 =?us-ascii?Q?pD0AaYqnyoJ9vzJmfPQZadJCzlsibHVFzSd+rrBpaA6FFdX+sadPXhfUnR39?=
 =?us-ascii?Q?9F16lcW7/qg2vzlFoWXnosyLwpp5sZJlbYql9J2wJLUV+ViQ5dqbAR1WWHXE?=
 =?us-ascii?Q?adHPotShWVZb9CUK1V1OSXfClZyHjb42KBQcijMSEPJeZE+kPv8Tk976bQcO?=
 =?us-ascii?Q?VJivs7wyXAJ4bpSHEExuHrBO8P9Lz+G44LkZkS3jOd6C1Hr12gr2pwxLOyMw?=
 =?us-ascii?Q?J4/Vo6Zd0UI252wZFIo0q+nSu10GOZ7mfU9w109Jd7wR/Uhnpt7CbjCe6yA+?=
 =?us-ascii?Q?LBpBYN/cNvNG34/p3MfZHUvJHmxdnyGjQoeFsVE0bQV/Xaf9VxOplSU9c18s?=
 =?us-ascii?Q?jJO+Z6L3GcAimYWGXzB92fc+ffCcGH1cExlsiL4TPDH5XiXGq4evF9Ay2i+u?=
 =?us-ascii?Q?IIEtScL2yWwLMDvmWlPNzWXqdaG6Xqj+TFcRl00vEP3TIYpV+DNqrnLLs1Z5?=
 =?us-ascii?Q?BvM5foTgP/70ifudCR25lsFKPyf5lClKnCveneovKXxWNB6t9KJIow77XFz8?=
 =?us-ascii?Q?mNiBb2x9n0lLCZA6HCrX0CiNmpwpoyb0WEajS87DROvxvhBNaqjhrg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB5963.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2kRzb+ZwLgiVQF04fso3um7m6H4lwzvoR6yFhA6KylPA3mNT4U7YNpJARWaV?=
 =?us-ascii?Q?uUKPmsq0zYG4rRRk9iEyWSmD9l76kViI+nhsPyXKZl3I94icwhYwcURSEgb6?=
 =?us-ascii?Q?mlNS4G4x8Z3zlng5glKSj2EbsKApdC9rKcjn1yz66jcwsTJ5E37UYVQLyFEI?=
 =?us-ascii?Q?zj0sdyLcvw0L8LaXBL/oKpcIbfgJqX5tjG8zkTertiEv1WEWh6dJKM5lWgRj?=
 =?us-ascii?Q?HvvVsuvwg/473T6mFa40HwiL9OZYyw/CGpG61S9OC+aFf7m01nY4sda445vD?=
 =?us-ascii?Q?KZuGhXHzI6AdXn/lTFkJ2IE7z1Lt4ml2+EJ1LK6P0hiRTWZ4IQp6f34qP11O?=
 =?us-ascii?Q?QOvi88hWVoEc+CaoFA8d1iWAmsR5TVdUaqUiOxR6xo77jcJldc9IgQjYZHjR?=
 =?us-ascii?Q?B8hWdn7XTV98HBtSsHKIeQQ03N0+p2NXbEhBelGiqkKjrOPT2yKHbETG4/N7?=
 =?us-ascii?Q?wb89o21i8cA/FR+vXE3le+ceJgHh1BsoSogPV4wEvrxH5zoGSxTQiXNGE1+c?=
 =?us-ascii?Q?Zkqe7qetBYpcH7PF4gBuUFvVw+dVXJTIMPNw71AtcMf176IgYrUeK9bnQ/i8?=
 =?us-ascii?Q?1qMaSrDybm3i8UyrPtTWchlZGZiDBRNbq9X3jNEvJdyffnaw2gLEdmfekd8s?=
 =?us-ascii?Q?ti9d/3xb8hNaUPdXx9tgirqyNaNXE837LoEkKpWeeHX57qgkMOcXm9E//oS4?=
 =?us-ascii?Q?PJuNKEjqKRb8+RalmOrbPPPwwhF4B50pzn2KpHWzQJaY8a5WK05fc2hPXNV3?=
 =?us-ascii?Q?w9JxeQw9vT352S7Aw1DxABI5fVjL4esMiKQjATkCysZ94hf7CSXWejkojdKu?=
 =?us-ascii?Q?85KrgzRASN5auku+YVZkKUpPWumnu+UuGdS470+E21ftu95/pxP/eS8xkzt3?=
 =?us-ascii?Q?+Wv3qdS5Z2sFL6E362jZvHbX+FCciiqp/FZdtOnKMCLPmsUaUacQGJezLFto?=
 =?us-ascii?Q?9jwd6EDZYI6sWAlzTayFn09cKlTQgjfDu0sstDbHKFzCncQ+URvKSHIub1VL?=
 =?us-ascii?Q?mZ0WTU3fTLjZACNOO2rFyz7MQ5oqDbc5bJBY6PxLTqvhTE4x2e16qcSZF6W3?=
 =?us-ascii?Q?wnGFYl4IVJDlJJ/eOukEsvFADXXxwouFBLvfrWbVHS3jRT+J3ftL91Zyjyfk?=
 =?us-ascii?Q?cz+S18ATtddIHTkfL51j7yaP8dB5zt7VhLZtub6WwJD27JpVyVheAeqlc6jB?=
 =?us-ascii?Q?glwMtNuQhWlnGHZky8Wq7ldfvuAGqBoRDq/QcWIj0yn5jI88Qfy/7FOGCpaJ?=
 =?us-ascii?Q?nDmfBcqGlGAk5q39LlAwH7LO0y+PrCOnyDr6ftlJMxxkiE3M1K3Xz4tKfVbL?=
 =?us-ascii?Q?vCKQn2LQvoPsa8K2Hsfk/KqosZTNJuzdC1xabD7o9AM/Ava/tevEmBKqNQy3?=
 =?us-ascii?Q?NIryJsKhOg4IQgHSLqZ9SJz4gYd+d25NvYiyAPND8/fuEf/BStHik7msjywl?=
 =?us-ascii?Q?SiM4iCX7mGp0vZe7rG5gNuDCmAf4uAF6MdOorfaJVC/w374KE7Wkb7T0NiZN?=
 =?us-ascii?Q?p4F1uT/9O3PHZwe83/ficRVZNZLr9Cf4a0BvgLt8aYZZiotW9MNNc/XhFWOC?=
 =?us-ascii?Q?BTva6eRtUoTMFZYoLtUNgtsCipiFhWoGNFvx75ZDVevR4RuAZedYLi1PffAX?=
 =?us-ascii?Q?2Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f81695cd-c824-41b1-c66f-08de32259d60
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB5963.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 04:37:06.9799
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 38L18a0PyiVOWQe5ncS4QsbGbtO349wF+DI3i2oQOt56N7+WV/6fvaHNrmEdnUi8vsffuweOhrNZlakoorHCng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8317
X-OriginatorOrg: intel.com

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   81ab94df653806720116e45346cbfcbf5e63df44
commit: a584c7734a4dd050451fcdd65c66317e15660e81 [36/36] selftests: mm: fix map_hugetlb failure on 64K page size systems
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251202/202512021558.rAIf9zoH-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251202/202512021558.rAIf9zoH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512021558.rAIf9zoH-lkp@intel.com/

All errors (new ones prefixed by >>):

>> map_hugetlb.c:79:18: error: call to undeclared function 'default_huge_page_size'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      79 |         hugepage_size = default_huge_page_size();
         |                         ^
   1 error generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

