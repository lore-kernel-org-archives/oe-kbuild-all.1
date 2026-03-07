Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D946117A2F6
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Mar 2026 03:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772855951; cv=fail; b=TC/u0arjEfF5yHTnV3k4lxPSw/NmzHgBVPkRvDyuHaPhB/bllXvZyk5ePDty2OQwhNudWbB3vaFOzYqfLgaE5G5N1qxzVc2J7VaMZJm56BMaPbg41ChJbGAqurSQUwpwFMu//WM7MJ7d7qpiK7JhJCFj3dBUNM48+JjEEOcyHBs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772855951; c=relaxed/simple;
	bh=S4FRX3/acihDea2E9UK/WBAnBeo1zcaJm6pSvCvkhL4=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=ZLYlwlGwTd9cdlS+jvIH+VFRgYimKvbpHB1QKL+lj/WUH2jUoq8N0w2JnywDZpM1zYQzs7yHKeCCvw59O6zA9uLrdk9lcSvXqN3R1GMIAheHnPJNFN4n9r50aYLlguPFcI/+JseeNzXZgZYjkUlh1I1DuT+CWSZoKmCQadvV2bY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ajWEj6xT; arc=fail smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ajWEj6xT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772855949; x=1804391949;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=S4FRX3/acihDea2E9UK/WBAnBeo1zcaJm6pSvCvkhL4=;
  b=ajWEj6xT+/B9LxKWwTGs1r0pJW8DqK5vtvW3BoagXP+3rVgfoiLDI0g9
   H/nKXnDbS1tkmWLb3gIRC5ZS6BrDM3jSsGsHnIZ4JEyOvT9uRuqBClpph
   DV+vAGF8omMazSUWQcekFRv25JrjS2qREhLvJfFqtjKWFIucBQWNcG+uh
   qvHpwGMivZ3CtY6kufq11YM42dPGspqvycgMezUyf01//WS0+/3uDKzHk
   ZQJMx+ShnZzb8LjefoQT2VNMlutJAyRoZ9LMYNvER4UKv15lP4zweA+sZ
   p2XXVakaVzEOGUgP/SpRZOFipZHVNuWeKfc5BA8e7A1LjU5RIyt/8EQjH
   g==;
X-CSE-ConnectionGUID: TeGOLrl1SUSUpNOAaMxzTw==
X-CSE-MsgGUID: H0zFT/8YTo+XCrcowNwIDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11721"; a="77567596"
X-IronPort-AV: E=Sophos;i="6.23,106,1770624000"; 
   d="scan'208";a="77567596"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2026 19:59:09 -0800
X-CSE-ConnectionGUID: WEQNgYgmTsSk67RYXIzbIQ==
X-CSE-MsgGUID: xfDyz+C7RFuzK/k1Zges7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,106,1770624000"; 
   d="scan'208";a="249662422"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2026 19:59:08 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 6 Mar 2026 19:59:07 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 6 Mar 2026 19:59:07 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.24) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 6 Mar 2026 19:59:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ytx1r1znbdGX/gsw3yd3yWDEyzNUTAvslE61+MfaPXhyu8vtOKr9Mp4GE5tU7cZjmGnmgUeUXGanTwH19JctD0FUCURUnpEVa0wjPKjQwEylyQ3VR3bX+lHKBKIqAvA6P54J5DL55WRLBG4tTk+WE+lj6gBOL4GdrE7lIOIDdqUHH1buKS5WP9TCvm3Ejy6QxF8Imip9643n2i9mbZMuaIzOA+T7FOIP8MFaZy0QhfyAzzFK3B9tiHqOt7cmHzjxEsIl746NJwwgiyWb4prXB8oS9/YiWiFz1I0FH3+HnpfkLVyYi8r+HIkwL1XdwJEcUaxC9uzmXVzwlUdWtN6z3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X1XMPZF12FeFcFwm5uuhK2rANXtt8WxANdUVS6o9BAo=;
 b=v8w/e9I3VhmA+SSPjKZFzwjB2H3BXIhaaK8M91ra8VIO0XRj3jUrB/iZennVEHZJZ2RNOXPYO06tVBclzxdAacw5hnwIUEjkkE2qh+opEB7gEJ9Ur2k25o29/P0VFyyyIW8FmRjjeBX9ja6t27dk84NLRSu7F/r5wFAgwJHcJ5uvsLs1J36UC5kh20NajUDOwLVY8akKWJaas9Wv+rPjFzCSt8ZQ04/bpC8nOlkXT1+0wqKw31XVCjxaA1kig0xc+DdIRMXziRtlEwQhvMNmmy2AccUvAZ7TZKJZlrZ5w/MXofBaJbaii4Mmrk40w8brJGwcX2Z+wqFHgf/nX3zbZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7710.namprd11.prod.outlook.com (2603:10b6:510:298::9)
 by MW4PR11MB6983.namprd11.prod.outlook.com (2603:10b6:303:226::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Sat, 7 Mar
 2026 03:59:04 +0000
Received: from PH0PR11MB7710.namprd11.prod.outlook.com
 ([fe80::dc6:ac78:d884:137b]) by PH0PR11MB7710.namprd11.prod.outlook.com
 ([fe80::dc6:ac78:d884:137b%5]) with mapi id 15.20.9700.003; Sat, 7 Mar 2026
 03:59:04 +0000
Date: Sat, 7 Mar 2026 11:58:49 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [thomas-weissschuh:b4/kbuild-vmlinux-h 2/6] getdelays.c:209:15:
 error: invalid use of undefined type 'struct __kernel_timespec'
Message-ID: <aauiecyHQZebPNLE@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0155.apcprd04.prod.outlook.com (2603:1096:4::17)
 To PH0PR11MB7710.namprd11.prod.outlook.com (2603:10b6:510:298::9)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7710:EE_|MW4PR11MB6983:EE_
X-MS-Office365-Filtering-Correlation-Id: cfc50686-990d-46af-8f8c-08de7bfddf2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: lM9RZAIsa4xgdi4yjSPrigqU//PF2RU0thYHMIGqbyvY2veey9CY+zVmkvDhfOdYucSoCBqT3af1BJ2Fy/6WB8ABiGYAW4jjQTrrbF4qoss5nZ/UFkDBjUWJAh+EWGcWJwH5jkRwTWIceDUahfb1u3EqeVZiwH23gycLULK8dojsP8D2aKOMab/BDuPHcqSBhCImWCsRwY+5qiGVELRDf9utllo8NVvimn1ogAa9I5HPTabVDUkkktyMeMJ7k6G+XmiOEZiZPA6uqG23A2YI1sdSaeO0BuB0IOH+hLhnIUk8CAAALPglGLLIlzGEes9+Ke7Ts196nUdqcIkItx+H6HoTwkD4AXzcY+Ys0hRxvaTnrI5EIj5DRrYNv+f0gjB6YrGf30RgKU30R6NC36Ue7XZ9j7kSpWiL225GUyLURCgqT6etvnnxD1qOyUkwoel3gKnVnpb/NZs33kdZoXunYi+68zbrq1dGz6VvhhkJJOFlRmPAJ9PVWe48GgZvsZXBMvSSEY7UXATdDRWqUSt3VyoQvXcbJYuH828XPxMdJoVrI7MeCSy4YdB0PNXihTAXJvfmmL3Y3zKC+zsMLmWHaC5VP6fH1+wYxCPjkp3ukOafIETnSsLy9Hx/J3weNSYZ8SyogUBdykpMdxMRO98uQ8igZe+JK57rzdrG1/bPb2iJmLh4007kAKZjpcWNbBB1MyNIoFfM2v31ast6zB4Epg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB7710.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?b28L9Cj6a4NwhSsQh4qQGjs1QFr2GaAcrfI3uqZJXVT04g83gDQAhmFslVA9?=
 =?us-ascii?Q?wylTsQ/YIQRQcgbyPPKJPRg3afuQMGhM+I6ct99LudiYS5Gqs7GpI8BpEta5?=
 =?us-ascii?Q?H2Y65gkZQI2HSEMWCWpNVNztfdbAUSnTe2f1m5RbJAQ9qvEkETgP3Z7L85EF?=
 =?us-ascii?Q?asIsEVChA3OkQYPu8Fh9cRPCCrgDBERqg5PvMvPfci61tyNUoIvF/8Xi4RoR?=
 =?us-ascii?Q?i6yBo8+ZsF4pTUFwnYs+8jvR5mQN8pTn3UardO7QQQRyj9yb2MjAMEWO2Cfa?=
 =?us-ascii?Q?ha0lCHR1IjdSxr9gCgE6fLwiQMA+fDH05qU85+Uz+Ao1OOcKGu169LUHjBGo?=
 =?us-ascii?Q?hSX3pBv0MCE3hFDR7hs6YtCks+mN/FkLc+VV8BWcrYMdRmhLRNbhz8Wsu27k?=
 =?us-ascii?Q?DFom6nkfUmqCQ6VQpfinbluRl0NxRQfGl514gcYyooiuONw0HHayFm43a+85?=
 =?us-ascii?Q?JW338h1qeq6vZ+Nrjx5T9bS+wYuIrW4kw2od1pbWwtAY+PrvC2++LcuD7pTh?=
 =?us-ascii?Q?NBDtheg9nAeJ2Y683v8FbfvUzczd0kfrwwCqu4ZSJqOnoP+ySZv8kxJ4NT4k?=
 =?us-ascii?Q?qqtspuI3BYbyA4ul+vBW6AzADyzk6bdTsj2VbaGWiDcx4OduqmDz2+MFRdnd?=
 =?us-ascii?Q?8BhPsK/bZV4BJ3L34A4/DMBjIF1+kNZZtyzKvfLva8mPoPVlJALM7pvUtKYZ?=
 =?us-ascii?Q?5kh3zyTyhyD33HE7D48hzbqHe3lsRiV7Rq+FsFJ9o06+moBc+hbE8puLooL/?=
 =?us-ascii?Q?sABAUKQ5IqrEYtDzzBbphsu9Yc2/Y7TtZ020IAUNQPHMHQGdiQBVu8eOxak2?=
 =?us-ascii?Q?tQIneskTrv6Yq0xqFEf7L14fhHF+H8F4Cvhi0D7sYEaCKg6VzQvz9tHKo1ul?=
 =?us-ascii?Q?o8Tj/Hpp1QP4XsKa8OG/gmSrL8hO+CtpWfm4hVMnaY6Uu2LyQg7EMta0QJ6J?=
 =?us-ascii?Q?RM6O/sXWhZ5r7CDRpW6nFyZb7jSBO5j3o3+HvFtM36YQlRgIuXvCWNOmw5pU?=
 =?us-ascii?Q?Oc6bBoyc0DSKgOgmyC+yhqKvYXlMqx9lALyCynQbwzodZUbsFwMH1tYetZrD?=
 =?us-ascii?Q?wCYsFABKq5UldSIJVvccWBHq4rjWRVlDdDi2yP1vwQOjcp5jjrP7t12pja25?=
 =?us-ascii?Q?1EYSeMC80w/wgRXDn1bD/ZD5TOI7eWWGu8YgWkUmPG3qiXvxBuUGsVTWTNWs?=
 =?us-ascii?Q?3cVcxpQzSOVtD4YD1Mg/CHXTurTVoBw/epwYmkzLYFC4CWnZUj0vOSVv6Hfs?=
 =?us-ascii?Q?bcMyAwGoonD6shu2ZBO0bm8TmgaIEZF5oG5BhqHiQpUoVawQEaU44sSrw0Q/?=
 =?us-ascii?Q?x/S2hzbN/vc6imFEAss7G+NIm3SQHlprM8O7S+lbTInpb58LrZbSqShSHHsC?=
 =?us-ascii?Q?EqwkcDWOU+anQ4klDm0R2kyzpberjVjiRULTbQO11nXv1BwYCNaYB8yCNjQT?=
 =?us-ascii?Q?fYQWLMYglWm3fBugdjtfz6/T/Z7ftpETuG3uGwHCkRVcH6+NbxTNcXK/gLWV?=
 =?us-ascii?Q?d4tgh9o54x9XUnqRABFXq9sIWVVG5btXU3848kWOSh3oIA3dQHWyyL6/socX?=
 =?us-ascii?Q?xR6iUbc1ZgTK+Jwy/H5hjKCkKcctnw7qUL93clAJAE+qYumL3NZeszqcyOUC?=
 =?us-ascii?Q?4FVkVCjEy5s/i1a1hlvs0W2kcbml4IZhra+xK6c58k9pM9TwfzRHehGvNCW8?=
 =?us-ascii?Q?KDWENn9ps99Zwo7Dc9owX0qShWuhFLw77lpgNhJtOuN0w2bO0N+OyVikvirR?=
 =?us-ascii?Q?qPhNhVYf1g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cfc50686-990d-46af-8f8c-08de7bfddf2f
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7710.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2026 03:59:04.3681
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PSmDok7RA75kKgpt6ypXsL0FEFysluSP0Zm3DlGuq+zg9r08ee/ZVpCtZdbdQxUJjG10+1koWTI9v5q+SUAM0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6983
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/kbuild-vmlinux-h
head:   8004855a92a2320932629e08adcf6e3048ff774c
commit: dc4d07a89d0af09d050c7954444aebe6c8b2c028 [2/6] bpftool
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260306/202603062103.Z5fecwZD-lkp@intel.com/config)
compiler: aarch64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260306/202603062103.Z5fecwZD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603062103.Z5fecwZD-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> getdelays.c:202:43: warning: 'struct __kernel_timespec' declared inside parameter list will not be visible outside of this definition or declaration
     202 | static const char *format_timespec(struct __kernel_timespec *ts)
         |                                           ^~~~~~~~~~~~~~~~~
   getdelays.c: In function 'format_timespec':
>> getdelays.c:209:15: error: invalid use of undefined type 'struct __kernel_timespec'
     209 |         if (ts->tv_sec == 0 && ts->tv_nsec == 0)
         |               ^~
   getdelays.c:209:34: error: invalid use of undefined type 'struct __kernel_timespec'
     209 |         if (ts->tv_sec == 0 && ts->tv_nsec == 0)
         |                                  ^~
   getdelays.c:212:22: error: invalid use of undefined type 'struct __kernel_timespec'
     212 |         time_sec = ts->tv_sec;
         |                      ^~
   getdelays.c: In function 'print_delayacct':
>> getdelays.c:258:55: error: 'struct taskstats' has no member named 'cpu_delay_max'; did you mean 'cpu_delay_total'?
     258 |                                 delay_ms((double)(t)->cpu_delay_max), \
         |                                                       ^~~~~~~~~~~~~
   getdelays.c:196:22: note: in definition of macro 'delay_ms'
     196 | #define delay_ms(t) (t / 1000000ULL)
         |                      ^
   getdelays.c:344:9: note: in expansion of macro 'PRINT_CPU_DELAY'
     344 |         PRINT_CPU_DELAY(t->version, t);
         |         ^~~~~~~~~~~~~~~
>> getdelays.c:259:55: error: 'struct taskstats' has no member named 'cpu_delay_min'; did you mean 'cpu_delay_total'?
     259 |                                 delay_ms((double)(t)->cpu_delay_min), \
         |                                                       ^~~~~~~~~~~~~
   getdelays.c:196:22: note: in definition of macro 'delay_ms'
     196 | #define delay_ms(t) (t / 1000000ULL)
         |                      ^
   getdelays.c:344:9: note: in expansion of macro 'PRINT_CPU_DELAY'
     344 |         PRINT_CPU_DELAY(t->version, t);
         |         ^~~~~~~~~~~~~~~
>> getdelays.c:260:53: error: 'struct taskstats' has no member named 'cpu_delay_max_ts'
     260 |                                 format_timespec(&(t)->cpu_delay_max_ts)); \
         |                                                     ^~
   getdelays.c:344:9: note: in expansion of macro 'PRINT_CPU_DELAY'
     344 |         PRINT_CPU_DELAY(t->version, t);
         |         ^~~~~~~~~~~~~~~
   getdelays.c:271:55: error: 'struct taskstats' has no member named 'cpu_delay_max'; did you mean 'cpu_delay_total'?
     271 |                                 delay_ms((double)(t)->cpu_delay_max), \
         |                                                       ^~~~~~~~~~~~~
   getdelays.c:196:22: note: in definition of macro 'delay_ms'
     196 | #define delay_ms(t) (t / 1000000ULL)
         |                      ^
   getdelays.c:344:9: note: in expansion of macro 'PRINT_CPU_DELAY'
     344 |         PRINT_CPU_DELAY(t->version, t);
         |         ^~~~~~~~~~~~~~~
   getdelays.c:272:55: error: 'struct taskstats' has no member named 'cpu_delay_min'; did you mean 'cpu_delay_total'?
     272 |                                 delay_ms((double)(t)->cpu_delay_min)); \
         |                                                       ^~~~~~~~~~~~~
   getdelays.c:196:22: note: in definition of macro 'delay_ms'
     196 | #define delay_ms(t) (t / 1000000ULL)
         |                      ^
   getdelays.c:344:9: note: in expansion of macro 'PRINT_CPU_DELAY'
     344 |         PRINT_CPU_DELAY(t->version, t);
         |         ^~~~~~~~~~~~~~~
>> getdelays.c:350:25: error: 'struct taskstats' has no member named 'blkio_delay_max'; did you mean 'blkio_delay_total'?
     350 |                         blkio_delay_max, blkio_delay_min, blkio_delay_max_ts);
         |                         ^~~~~~~~~~~~~~~
   getdelays.c:196:22: note: in definition of macro 'delay_ms'
     196 | #define delay_ms(t) (t / 1000000ULL)
         |                      ^
   getdelays.c:348:17: note: in expansion of macro 'PRINT_FILED_DELAY_WITH_TS'
     348 |                 PRINT_FILED_DELAY_WITH_TS("IO", t->version, t,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~
>> getdelays.c:350:42: error: 'struct taskstats' has no member named 'blkio_delay_min'; did you mean 'blkio_delay_total'?
     350 |                         blkio_delay_max, blkio_delay_min, blkio_delay_max_ts);
         |                                          ^~~~~~~~~~~~~~~
   getdelays.c:196:22: note: in definition of macro 'delay_ms'
     196 | #define delay_ms(t) (t / 1000000ULL)
         |                      ^
   getdelays.c:348:17: note: in expansion of macro 'PRINT_FILED_DELAY_WITH_TS'
     348 |                 PRINT_FILED_DELAY_WITH_TS("IO", t->version, t,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~
>> getdelays.c:350:59: error: 'struct taskstats' has no member named 'blkio_delay_max_ts'; did you mean 'blkio_delay_total'?
     350 |                         blkio_delay_max, blkio_delay_min, blkio_delay_max_ts);
         |                                                           ^~~~~~~~~~~~~~~~~~
   getdelays.c:319:55: note: in definition of macro 'PRINT_FILED_DELAY_WITH_TS'
     319 |                                 format_timespec(&(t)->max_ts)); \
         |                                                       ^~~~~~
>> getdelays.c:350:25: error: 'struct taskstats' has no member named 'blkio_delay_max'; did you mean 'blkio_delay_total'?
     350 |                         blkio_delay_max, blkio_delay_min, blkio_delay_max_ts);
         |                         ^~~~~~~~~~~~~~~
   getdelays.c:196:22: note: in definition of macro 'delay_ms'
     196 | #define delay_ms(t) (t / 1000000ULL)
         |                      ^
   getdelays.c:348:17: note: in expansion of macro 'PRINT_FILED_DELAY_WITH_TS'
     348 |                 PRINT_FILED_DELAY_WITH_TS("IO", t->version, t,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~
>> getdelays.c:350:42: error: 'struct taskstats' has no member named 'blkio_delay_min'; did you mean 'blkio_delay_total'?
     350 |                         blkio_delay_max, blkio_delay_min, blkio_delay_max_ts);
         |                                          ^~~~~~~~~~~~~~~
   getdelays.c:196:22: note: in definition of macro 'delay_ms'
     196 | #define delay_ms(t) (t / 1000000ULL)
         |                      ^
   getdelays.c:348:17: note: in expansion of macro 'PRINT_FILED_DELAY_WITH_TS'
     348 |                 PRINT_FILED_DELAY_WITH_TS("IO", t->version, t,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~
>> getdelays.c:354:25: error: 'struct taskstats' has no member named 'swapin_delay_max'; did you mean 'swapin_delay_total'?
     354 |                         swapin_delay_max, swapin_delay_min, swapin_delay_max_ts);
         |                         ^~~~~~~~~~~~~~~~
   getdelays.c:196:22: note: in definition of macro 'delay_ms'
     196 | #define delay_ms(t) (t / 1000000ULL)
         |                      ^
   getdelays.c:352:17: note: in expansion of macro 'PRINT_FILED_DELAY_WITH_TS'
     352 |                 PRINT_FILED_DELAY_WITH_TS("SWAP", t->version, t,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~
>> getdelays.c:354:43: error: 'struct taskstats' has no member named 'swapin_delay_min'; did you mean 'swapin_delay_total'?
     354 |                         swapin_delay_max, swapin_delay_min, swapin_delay_max_ts);
         |                                           ^~~~~~~~~~~~~~~~
   getdelays.c:196:22: note: in definition of macro 'delay_ms'
     196 | #define delay_ms(t) (t / 1000000ULL)
         |                      ^
   getdelays.c:352:17: note: in expansion of macro 'PRINT_FILED_DELAY_WITH_TS'
     352 |                 PRINT_FILED_DELAY_WITH_TS("SWAP", t->version, t,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~
>> getdelays.c:354:61: error: 'struct taskstats' has no member named 'swapin_delay_max_ts'; did you mean 'swapin_delay_total'?
     354 |                         swapin_delay_max, swapin_delay_min, swapin_delay_max_ts);
         |                                                             ^~~~~~~~~~~~~~~~~~~
   getdelays.c:319:55: note: in definition of macro 'PRINT_FILED_DELAY_WITH_TS'
     319 |                                 format_timespec(&(t)->max_ts)); \
         |                                                       ^~~~~~
>> getdelays.c:354:25: error: 'struct taskstats' has no member named 'swapin_delay_max'; did you mean 'swapin_delay_total'?
     354 |                         swapin_delay_max, swapin_delay_min, swapin_delay_max_ts);
         |                         ^~~~~~~~~~~~~~~~
   getdelays.c:196:22: note: in definition of macro 'delay_ms'
     196 | #define delay_ms(t) (t / 1000000ULL)
         |                      ^
   getdelays.c:352:17: note: in expansion of macro 'PRINT_FILED_DELAY_WITH_TS'
     352 |                 PRINT_FILED_DELAY_WITH_TS("SWAP", t->version, t,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~
>> getdelays.c:354:43: error: 'struct taskstats' has no member named 'swapin_delay_min'; did you mean 'swapin_delay_total'?
     354 |                         swapin_delay_max, swapin_delay_min, swapin_delay_max_ts);
         |                                           ^~~~~~~~~~~~~~~~
   getdelays.c:196:22: note: in definition of macro 'delay_ms'
     196 | #define delay_ms(t) (t / 1000000ULL)
         |                      ^
   getdelays.c:352:17: note: in expansion of macro 'PRINT_FILED_DELAY_WITH_TS'
     352 |                 PRINT_FILED_DELAY_WITH_TS("SWAP", t->version, t,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~
>> getdelays.c:358:25: error: 'struct taskstats' has no member named 'freepages_delay_max'; did you mean 'freepages_delay_total'?
     358 |                         freepages_delay_max, freepages_delay_min, freepages_delay_max_ts);
         |                         ^~~~~~~~~~~~~~~~~~~
   getdelays.c:196:22: note: in definition of macro 'delay_ms'
     196 | #define delay_ms(t) (t / 1000000ULL)
         |                      ^
   getdelays.c:356:17: note: in expansion of macro 'PRINT_FILED_DELAY_WITH_TS'
     356 |                 PRINT_FILED_DELAY_WITH_TS("RECLAIM", t->version, t,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~
>> getdelays.c:358:46: error: 'struct taskstats' has no member named 'freepages_delay_min'; did you mean 'freepages_delay_total'?
     358 |                         freepages_delay_max, freepages_delay_min, freepages_delay_max_ts);
         |                                              ^~~~~~~~~~~~~~~~~~~
   getdelays.c:196:22: note: in definition of macro 'delay_ms'
     196 | #define delay_ms(t) (t / 1000000ULL)
         |                      ^
   getdelays.c:356:17: note: in expansion of macro 'PRINT_FILED_DELAY_WITH_TS'
     356 |                 PRINT_FILED_DELAY_WITH_TS("RECLAIM", t->version, t,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~
>> getdelays.c:358:67: error: 'struct taskstats' has no member named 'freepages_delay_max_ts'; did you mean 'freepages_delay_total'?
     358 |                         freepages_delay_max, freepages_delay_min, freepages_delay_max_ts);
         |                                                                   ^~~~~~~~~~~~~~~~~~~~~~
   getdelays.c:319:55: note: in definition of macro 'PRINT_FILED_DELAY_WITH_TS'
     319 |                                 format_timespec(&(t)->max_ts)); \
         |                                                       ^~~~~~
>> getdelays.c:358:25: error: 'struct taskstats' has no member named 'freepages_delay_max'; did you mean 'freepages_delay_total'?
     358 |                         freepages_delay_max, freepages_delay_min, freepages_delay_max_ts);
         |                         ^~~~~~~~~~~~~~~~~~~
   getdelays.c:196:22: note: in definition of macro 'delay_ms'
     196 | #define delay_ms(t) (t / 1000000ULL)
         |                      ^
   getdelays.c:356:17: note: in expansion of macro 'PRINT_FILED_DELAY_WITH_TS'
     356 |                 PRINT_FILED_DELAY_WITH_TS("RECLAIM", t->version, t,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~
>> getdelays.c:358:46: error: 'struct taskstats' has no member named 'freepages_delay_min'; did you mean 'freepages_delay_total'?
     358 |                         freepages_delay_max, freepages_delay_min, freepages_delay_max_ts);
         |                                              ^~~~~~~~~~~~~~~~~~~
   getdelays.c:196:22: note: in definition of macro 'delay_ms'
     196 | #define delay_ms(t) (t / 1000000ULL)
         |                      ^
   getdelays.c:356:17: note: in expansion of macro 'PRINT_FILED_DELAY_WITH_TS'
     356 |                 PRINT_FILED_DELAY_WITH_TS("RECLAIM", t->version, t,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~
   getdelays.c:362:25: error: 'struct taskstats' has no member named 'thrashing_delay_max'; did you mean 'thrashing_delay_total'?
     362 |                         thrashing_delay_max, thrashing_delay_min, thrashing_delay_max_ts);
         |                         ^~~~~~~~~~~~~~~~~~~
   getdelays.c:196:22: note: in definition of macro 'delay_ms'
     196 | #define delay_ms(t) (t / 1000000ULL)
         |                      ^
   getdelays.c:360:17: note: in expansion of macro 'PRINT_FILED_DELAY_WITH_TS'
     360 |                 PRINT_FILED_DELAY_WITH_TS("THRASHING", t->version, t,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~
   getdelays.c:362:46: error: 'struct taskstats' has no member named 'thrashing_delay_min'; did you mean 'thrashing_delay_total'?
     362 |                         thrashing_delay_max, thrashing_delay_min, thrashing_delay_max_ts);
         |                                              ^~~~~~~~~~~~~~~~~~~
   getdelays.c:196:22: note: in definition of macro 'delay_ms'
     196 | #define delay_ms(t) (t / 1000000ULL)
         |                      ^
   getdelays.c:360:17: note: in expansion of macro 'PRINT_FILED_DELAY_WITH_TS'
     360 |                 PRINT_FILED_DELAY_WITH_TS("THRASHING", t->version, t,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~
   getdelays.c:362:67: error: 'struct taskstats' has no member named 'thrashing_delay_max_ts'; did you mean 'thrashing_delay_total'?
     362 |                         thrashing_delay_max, thrashing_delay_min, thrashing_delay_max_ts);
         |                                                                   ^~~~~~~~~~~~~~~~~~~~~~
   getdelays.c:319:55: note: in definition of macro 'PRINT_FILED_DELAY_WITH_TS'
     319 |                                 format_timespec(&(t)->max_ts)); \
         |                                                       ^~~~~~
   getdelays.c:362:25: error: 'struct taskstats' has no member named 'thrashing_delay_max'; did you mean 'thrashing_delay_total'?
     362 |                         thrashing_delay_max, thrashing_delay_min, thrashing_delay_max_ts);
         |                         ^~~~~~~~~~~~~~~~~~~
   getdelays.c:196:22: note: in definition of macro 'delay_ms'
     196 | #define delay_ms(t) (t / 1000000ULL)
         |                      ^
   getdelays.c:360:17: note: in expansion of macro 'PRINT_FILED_DELAY_WITH_TS'
     360 |                 PRINT_FILED_DELAY_WITH_TS("THRASHING", t->version, t,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~
   getdelays.c:362:46: error: 'struct taskstats' has no member named 'thrashing_delay_min'; did you mean 'thrashing_delay_total'?
     362 |                         thrashing_delay_max, thrashing_delay_min, thrashing_delay_max_ts);
         |                                              ^~~~~~~~~~~~~~~~~~~
   getdelays.c:196:22: note: in definition of macro 'delay_ms'
     196 | #define delay_ms(t) (t / 1000000ULL)
         |                      ^
   getdelays.c:360:17: note: in expansion of macro 'PRINT_FILED_DELAY_WITH_TS'
     360 |                 PRINT_FILED_DELAY_WITH_TS("THRASHING", t->version, t,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~
   getdelays.c:367:33: error: 'struct taskstats' has no member named 'compact_delay_max'; did you mean 'compact_delay_total'?
     367 |                                 compact_delay_max, compact_delay_min, compact_delay_max_ts);
         |                                 ^~~~~~~~~~~~~~~~~
   getdelays.c:196:22: note: in definition of macro 'delay_ms'
     196 | #define delay_ms(t) (t / 1000000ULL)
         |                      ^
   getdelays.c:365:25: note: in expansion of macro 'PRINT_FILED_DELAY_WITH_TS'
     365 |                         PRINT_FILED_DELAY_WITH_TS("COMPACT", t->version, t,
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~
   getdelays.c:367:52: error: 'struct taskstats' has no member named 'compact_delay_min'; did you mean 'compact_delay_total'?
     367 |                                 compact_delay_max, compact_delay_min, compact_delay_max_ts);
         |                                                    ^~~~~~~~~~~~~~~~~
   getdelays.c:196:22: note: in definition of macro 'delay_ms'
     196 | #define delay_ms(t) (t / 1000000ULL)
         |                      ^
   getdelays.c:365:25: note: in expansion of macro 'PRINT_FILED_DELAY_WITH_TS'
     365 |                         PRINT_FILED_DELAY_WITH_TS("COMPACT", t->version, t,
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~
   getdelays.c:367:71: error: 'struct taskstats' has no member named 'compact_delay_max_ts'; did you mean 'compact_delay_total'?
     367 |                                 compact_delay_max, compact_delay_min, compact_delay_max_ts);
         |                                                                       ^~~~~~~~~~~~~~~~~~~~
   getdelays.c:319:55: note: in definition of macro 'PRINT_FILED_DELAY_WITH_TS'
     319 |                                 format_timespec(&(t)->max_ts)); \
         |                                                       ^~~~~~
   getdelays.c:367:33: error: 'struct taskstats' has no member named 'compact_delay_max'; did you mean 'compact_delay_total'?
     367 |                                 compact_delay_max, compact_delay_min, compact_delay_max_ts);
         |                                 ^~~~~~~~~~~~~~~~~
   getdelays.c:196:22: note: in definition of macro 'delay_ms'
     196 | #define delay_ms(t) (t / 1000000ULL)
         |                      ^
   getdelays.c:365:25: note: in expansion of macro 'PRINT_FILED_DELAY_WITH_TS'
     365 |                         PRINT_FILED_DELAY_WITH_TS("COMPACT", t->version, t,
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~
   getdelays.c:367:52: error: 'struct taskstats' has no member named 'compact_delay_min'; did you mean 'compact_delay_total'?
     367 |                                 compact_delay_max, compact_delay_min, compact_delay_max_ts);
         |                                                    ^~~~~~~~~~~~~~~~~
   getdelays.c:196:22: note: in definition of macro 'delay_ms'
     196 | #define delay_ms(t) (t / 1000000ULL)
         |                      ^
   getdelays.c:365:25: note: in expansion of macro 'PRINT_FILED_DELAY_WITH_TS'
     365 |                         PRINT_FILED_DELAY_WITH_TS("COMPACT", t->version, t,
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~
   getdelays.c:373:33: error: 'struct taskstats' has no member named 'wpcopy_delay_max'; did you mean 'wpcopy_delay_total'?
     373 |                                 wpcopy_delay_max, wpcopy_delay_min, wpcopy_delay_max_ts);
         |                                 ^~~~~~~~~~~~~~~~
   getdelays.c:196:22: note: in definition of macro 'delay_ms'
     196 | #define delay_ms(t) (t / 1000000ULL)
         |                      ^
   getdelays.c:371:25: note: in expansion of macro 'PRINT_FILED_DELAY_WITH_TS'
     371 |                         PRINT_FILED_DELAY_WITH_TS("WPCOPY", t->version, t,
--
>> cc1: warning: arch/arm64/include/generated: No such file or directory [-Wmissing-include-dirs]
>> cc1: warning: arch/arm64/include/generated/uapi: No such file or directory [-Wmissing-include-dirs]
>> cc1: warning: include/generated/uapi: No such file or directory [-Wmissing-include-dirs]
   In file included from include/linux/types.h:5,
                    from include/linux/io.h:10,
                    from include/linux/libnvdimm.h:10,
                    from ../../../drivers/nvdimm/core.c:5:
>> include/uapi/linux/types.h:5:10: fatal error: asm/types.h: No such file or directory
       5 | #include <asm/types.h>
         |          ^~~~~~~~~~~~~
   compilation terminated.
--
>> cc1: warning: arch/arm64/include/generated: No such file or directory [-Wmissing-include-dirs]
>> cc1: warning: arch/arm64/include/generated/uapi: No such file or directory [-Wmissing-include-dirs]
>> cc1: warning: include/generated/uapi: No such file or directory [-Wmissing-include-dirs]
   In file included from include/linux/stat.h:6,
                    from include/linux/fs_dirent.h:5,
                    from include/linux/fs/super_types.h:5,
                    from include/linux/fs/super.h:5,
                    from include/linux/fs.h:5,
                    from include/linux/highmem.h:5,
                    from ../../../drivers/nvdimm/btt.c:6:
>> arch/arm64/include/asm/stat.h:8:10: fatal error: uapi/asm/stat.h: No such file or directory
       8 | #include <uapi/asm/stat.h>
         |          ^~~~~~~~~~~~~~~~~
   compilation terminated.
..

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

