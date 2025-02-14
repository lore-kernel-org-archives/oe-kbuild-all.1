Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C182014830C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Feb 2025 03:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739503473; cv=fail; b=qmMaEHxw8O4vxBEB9O2VhwP6uX/5e2RzTYebirhDkB7QXqbpI1xbIjuseDJKmS2xXCPSnzGHhyRJmFnoID1FeMRXXcrIAY8dCzXUiq/3mUYR4X0+zJjD+dol3lo0O+afix98zmO45sjt4zc4omi+rOudgg9b5tE7EbMaM4dHLas=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739503473; c=relaxed/simple;
	bh=3kTrLi5DEs/lJMSnOc2CzT4SNWNhGA17aVMRnMNOGQU=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=h/H3mY8eLqfiMgo+FKU5zITySmTjqi1QayM/Uez9ZMJ+uNG5YXnyMNTEnfxYFADW6YqzvMNhIRd0QFeeQ16diIR20nrlvwTuI4os9aM2/Ivy0sMUCJZOk3CamoKggwyQUkFO2GasvYUsTh5SydAYiEq5UWb5kbfVsick+XGqEwI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G32OGcMf; arc=fail smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G32OGcMf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739503472; x=1771039472;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=3kTrLi5DEs/lJMSnOc2CzT4SNWNhGA17aVMRnMNOGQU=;
  b=G32OGcMf5BUtJj6ml8XkP7j5ncXpvWwnB77otLf78VIO7MrWnh92rE5l
   D+EGzEjEgSDwrFzg1jqdFZuJFf6t7t30ARfGGsH1xtclP6zo45ZuN97Z3
   lN4brj/spo2Cc1wBKHyzdhfMGWTEos1TytEjPLVH31BAZEJv54wmpYd2Q
   jj9TkQ0ZWxLjp4kM/0ac+zXMaMaAFMXB0BamdmaBQzJsVYby51NsxC2kV
   Y0Co3PZR6gsa079Xg97pzzrEOK2HSTFwwCkip88dAdqhcgTobTPKN8Uhv
   t+wuGih9pwf+uR6Kp9hoQk31oAWOL00fSK132z+W9oY2HavIOS9B5aad2
   w==;
X-CSE-ConnectionGUID: RRj2r55NQp29B1s/nBxv8A==
X-CSE-MsgGUID: M6xNas1MQKuUXF898LpJDQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="62704020"
X-IronPort-AV: E=Sophos;i="6.13,284,1732608000"; 
   d="scan'208";a="62704020"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2025 19:24:32 -0800
X-CSE-ConnectionGUID: s9+toI6bS0aM4FYduo/llg==
X-CSE-MsgGUID: F8zFPGsnQGuz789V/lWf+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="144273127"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2025 19:24:21 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Thu, 13 Feb 2025 19:24:19 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 13 Feb 2025 19:24:19 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 13 Feb 2025 19:24:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=akKSW2Ki9658bfbCSN1VT5hvJhi0oUvMtX0psJNDeteNbNKsxl+4aOhqjZC/854VBJPP9vguHiddhzHqFeF0ZIzXzbHEK4XGfxdYEEekDs5/g5wkwjp40YBsNUyeu9KoyOxRilddg1D0kzwDq+hhJH2IHn+3xxUakxXzfB1oxRObgnqEfXNsWSz6ayzJXcKrl86YtLWXtzebdIg8clw/6Slcovo9nCh8nXsH2m27hKrgqRYeirS/Ose51sdm19EnyX4GpRKq2jari59xkeOdSgcIW5RUFuSMiyw/3+V/dLGFMKSuyTN0wT7o9CG5lP4IOOq1nkGnjExci5sk5ehWyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OjsGZMXS3gy/SkIh+OrEJDfxzpuhbfumV2IZbVqU1RA=;
 b=ElfVls/NG1VzUMboDDAGdD2OmSTJZVtYO5yie75qT6wCOheDBbcBO15B0T4UW2HAGZUBXMjgsgD5zWRimtsYVdAMze2rBRuECdMUnCnxBuhSyRj0iB78kpoMftbZm1Et5Zv1EY2cnDcM1osWkdYgC3EWtE67HE2ekJRylbg3NkJSdUZGmC0DadgNCfHrBX0Rpkg73rLFTfeUJyhJqp4WJ+TdfskNfAk06TWyZzxYOAFoM2Ph5ssPjOZMC5FzkmQ6bGIGawfjI+iuOyqo8f8cABl3ePm/i90EG6Hj6mNObwajN3vrvsggjmPAAW+dRnAlwdRn1sHVRORkwB0IpCD6XA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
 by SJ0PR11MB5867.namprd11.prod.outlook.com (2603:10b6:a03:42a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.24; Fri, 14 Feb
 2025 03:24:17 +0000
Received: from DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e]) by DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e%6]) with mapi id 15.20.8445.013; Fri, 14 Feb 2025
 03:24:16 +0000
Date: Fri, 14 Feb 2025 11:24:09 +0800
From: Philip Li <philip.li@intel.com>
To: Steven Rostedt <rostedt@goodmis.org>
CC: kernel test robot <lkp@intel.com>, <oe-kbuild-all@lists.linux.dev>
Subject: Re: [rostedt-trace:pmem-on-reserve-mem-fail 2/10]
 kernel/trace/ring_buffer.c:1943:34: warning: variable 'bmeta' set but not
 used
Message-ID: <Z663WSipAftBvIAx@rli9-mobl>
References: <202502120851.VulVvSyg-lkp@intel.com>
 <20250211195421.69854975@gandalf.local.home>
 <Z61hYOLmsekGHJfk@rli9-mobl>
 <20250213114231.256e9845@gandalf.local.home>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250213114231.256e9845@gandalf.local.home>
X-ClientProxiedBy: SG2PR04CA0172.apcprd04.prod.outlook.com (2603:1096:4::34)
 To DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5423:EE_|SJ0PR11MB5867:EE_
X-MS-Office365-Filtering-Correlation-Id: 330f493a-b619-44d7-5bdf-08dd4ca70fb3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?irAATgtLfqQlU3tBTnIje9nWK+nAIvWYAKqvrhPQ/wXXqHI2CJ7RnPFeSWtV?=
 =?us-ascii?Q?M6Q1TzL8Ekv6CL8Sb4lb/R4iW3otH9+NKT0CupYY8qNraZ1RI9ftMZKNjLot?=
 =?us-ascii?Q?V1FOXQIL9oXtwcb0k7UpSM2WvYSqyC+K86rzcL55/EM3JUNClUBH8d1ETqNI?=
 =?us-ascii?Q?+XBQ6MgARoDm5zssyFh/wJbUJmxhXKwh3W9LbQ3kWtu5U4YIZOthryE9Bn37?=
 =?us-ascii?Q?sg5AX1v1Pl6TNx+aZSZxBrpv4G0AUNCzpZeRo1nT7CR5+QEZJiTnlIwKa4fQ?=
 =?us-ascii?Q?06OXLAGXX7siyBe7mvJ9L9TjO0I1Ws2vOxV/BeYo62jy0584E9vbQjGszidE?=
 =?us-ascii?Q?HPCBHUv0DTHx29ElF0KY27ZhA7QYPfShUtyHAFsE9BcgQx9rTB5iBN38pn4G?=
 =?us-ascii?Q?NdjH+yfocB0oV1IVstHrvmVihpcUlaIOtYoPHzi1ioMKF+Te71VLeURCufTS?=
 =?us-ascii?Q?zEIA3e2TTtPw9PfnOKZYn4g5VR+4IINgBPH04wrZUpLnJR4k448Rfn/fk3bw?=
 =?us-ascii?Q?Jds/qRI5PQeWJcIC3IeAQSCwGZf2+aM0PuXIcmlBVMXiLxYvUEjBUxQ6xwIt?=
 =?us-ascii?Q?YfM6UwFiOOYMEBguGduVR71ftbs86O2Jyd2BnQWn8cycEiCHlAd8WzazkCyq?=
 =?us-ascii?Q?YAlNujGZ6CF8R3pG0JspAyTqw5HICaH3DobpGL0uL/GGoJZnznOV+btwyX6n?=
 =?us-ascii?Q?5PK2O27MNjlAQ2/gkQ1wKuFRiEGkly4aHjXZETk6MeWStkMNyLEqcPT41S33?=
 =?us-ascii?Q?IL4PnvnA9Miz2xb7jboBx33x2C36ZLQ5bH2tJZSd4YiQtl9vuZ3hoFpxx/A+?=
 =?us-ascii?Q?uMMMNruklt5zNHoTvYtt9sJ06yIhWIteyXoHW4jYwTneTYesreRt0dHxIc5n?=
 =?us-ascii?Q?Pt00dmFe3uDb5bR/oZ57/XEQMjO1AL2xoINT/Zpoj6BaspCydI+rpaEkkEuA?=
 =?us-ascii?Q?eNtSTXOHOQlV1oZHudSgi1ncZIiNP/c/cs+yXnFe1RLYBgaJEsT8pSGrYi/j?=
 =?us-ascii?Q?/iR54imawmLvIKDzlx/4WRzNGxqYtq5gE+tIXZFB4lOfHn1vjn3JRDMP+NjP?=
 =?us-ascii?Q?IGYw6nXccha11frtAWh/iw8ry9eBZRrpuIk3aKFMTN9tWKB7tPH/xyQ/sbmQ?=
 =?us-ascii?Q?wxJrms49V90LclNKkQcbvQ2Fn53smu7kwwac7WZKCyRJ/FIftOp1wapc5bp7?=
 =?us-ascii?Q?bJ9fFBUhiJxphUTnVnhScjoiqRbK24LcFa3W2sckt1PwKLjUyRT4rM76Ya14?=
 =?us-ascii?Q?ObXTGKeXmJB2AUt2sGvtUFeyXwmb0N2dxEp/+I5LwE6t3Rt9XoKABPIXBDMC?=
 =?us-ascii?Q?lJmhedDxqYh94EpLQXQ9J5gW2sS0oUia2VjS9Ua6nXUrKzvmG52i96aKz8QO?=
 =?us-ascii?Q?tK6e5LgAeLmr9N85V5A697Kt80aNyCgvmH/0WJsaXvx+jdSvWA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5423.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fshHItRBITn5pzGXJgdHWopvjFoTlMBsUb4TcIyE2qPS6d4EQb/NxkPA7sPL?=
 =?us-ascii?Q?dkVnQzMmNMEmV+Vj0TQ8Nlk3MY5E/q2J7pzJ4GhYPbWLBbaaABBdeP8LO1q3?=
 =?us-ascii?Q?uvRsO+EhJR1+VjUnL9szoYFdHHzgAh9HxirDVl/N/1+Gf+1aZKuYnHXVyGhM?=
 =?us-ascii?Q?rA1iGOrEUBDKvH709ezlndnDBNaieW6FQpev/M9vlazdpoNcBzdTaSaR0YVZ?=
 =?us-ascii?Q?16PBhMll0Ii7AFehR2fmgkTrIO+v7p0mtbddbKKK8Nn0hDGQkjyK5Rb5uBgq?=
 =?us-ascii?Q?MpFOC8DsEN3IIRDR/7YbWX12+NprkcIrp81YJoXlnAPet3AP362FoDoDKXGN?=
 =?us-ascii?Q?iNTYMagghjL/cI1xSrg/Q2HWO5c16jJA7l5gZ6Zh4d1jopILF/v8Z4WrkDXS?=
 =?us-ascii?Q?9PBgRRZ4IAFzdi8LB/W2WOuFFLXWzif2FVoVWjlXjZ5UlXDWmMyjCIb3gSOO?=
 =?us-ascii?Q?Xv1tHVPFiZIrteB+JyhfLA2Xwh+pmtx8sqoW8zbNzPB3HklQTshWD9ISv8Zc?=
 =?us-ascii?Q?GdUNOV8fG/5L0zjkkVLGwMDiRUIQkRRZ6oZLqV6EFOpNQ2YrHDrSbcizuMXp?=
 =?us-ascii?Q?Q9Db9KtH5JhNlFOK1U1LJ+i0TOK6J7cKfky1wuHz/WhEsuzIut4fbT4YuIva?=
 =?us-ascii?Q?/serjEnWypP1UnHxDyuQImnetauzz9ET4WQhblrAxXqug7ov97AHREVso4+p?=
 =?us-ascii?Q?hx+c5ZKWhbbDT2reU0ykdgeCIgMxKRDYgLxqm/Jh7iwVOYVbS/ZV5IE6Hctm?=
 =?us-ascii?Q?CwuVSwpOIRw62Ebj+1ay6KatVOZwTWYoU2LwRI8VVMIkSqg08BpCBVO5CWy+?=
 =?us-ascii?Q?NDTINY5/gcatILtP7a88jjGYdW0yB9iRbSvGHCudesNcgoV8awK56yIOJopY?=
 =?us-ascii?Q?dNWtdSRFq+HAkw9yd7Hhj9yvFz0Ph/ZDXzRfh3SpdYe2L9T2A512VL6IM2Xw?=
 =?us-ascii?Q?mb2l3bhG0w7aGI9zyZ1x0oAxLnyZqFf9SQQZWUQWlZ7JRf8Gpl1lP9eP36t0?=
 =?us-ascii?Q?c0RE7/oJIZg2ollXPegph6Mg+iXJU+RWhadlxTp5E4WTextok98wXiN8IqdO?=
 =?us-ascii?Q?49jaMjVgeT7ywXyDCywmQys0oRcR4rDCi+3jCp0Cbgt7Ut8d4h1TZ2pWDl10?=
 =?us-ascii?Q?s/Gbk34Y2WdDGC4p66svcYSmpLkIvPviJr7rr9NC4QClX68EaZsZX1P9AF17?=
 =?us-ascii?Q?q26Nv3RFClEAh86kWfKd7CYJ6mHIqbukIoeWnXiIthaFazb1iKfnnqbiWGhF?=
 =?us-ascii?Q?K9sxtXtxs3Tbig1h8Oq4MW+3UtffAjCz/TRJKpgTvnOMs0qlvFYNiAtlDh34?=
 =?us-ascii?Q?Uv41zhjA96mmsp8xZgcbxtq1w5M04AW+t6+h41YgXNAfw7o0SHl1TufcJuMf?=
 =?us-ascii?Q?ltIqKDfNFK7BlVr+dPlrkf+JSg5fXIBxEoSvxpl4h7nR28QYCPS5tsS3FJY/?=
 =?us-ascii?Q?5tmTt/L3aJ57dlBL0/U1I9gGuOx535zkNHY7Tk0hgVYWW1W2TRd1fv0lT/+V?=
 =?us-ascii?Q?J5gT9+z2fBmPE/qQ5SF92kxDxlI9w+QLFfGYvOvgZJWAGoy/NBZm2+0oJp8k?=
 =?us-ascii?Q?B1078+S46iS1ls6REzezhRJV9ilOhoAlq3tD2EBD?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 330f493a-b619-44d7-5bdf-08dd4ca70fb3
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5423.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2025 03:24:16.6745
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Joxr0x0V3yrVYmVa4bNUnz4L+5eJx7x70ofscpQBg2LWqtZyhQCy1aQnNsUc/su5KsIXyPImalm+41G55ON+kg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5867
X-OriginatorOrg: intel.com

On Thu, Feb 13, 2025 at 11:42:31AM -0500, Steven Rostedt wrote:
> On Thu, 13 Feb 2025 11:05:04 +0800
> Philip Li <philip.li@intel.com> wrote:
> 
> > Thanks Steve, by default, if the branch is named like below, it will be
> > ignored.
> > 
> > 	.*experimental.*
> > 	.*dont-build
> > 
> > If you prefer any customized branch name or pattern, you can also share
> > with us, e.g. ".*-wip". We can configure the bot per your needs.
> 
> No need. If I knew about that, I would have used it.
> 
> Actually, you can just remove my personal tree altogether. All my real
> tracing code goes to:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git
> 
> But I only push stuff to:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-trace.git/
> 
> That I want to share with someone and not something heading toward mainline
> (at least not in that state).
> 
> So, you can just remove the rostedt/linux-trace.git tree from being tested.

Got it, thanks for the info, I will remove this repo.

BTW: the 0day bot records 2 other repos from your side, do we need keep
them or also remove?

https://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-ktest.git
https://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-kconfig.git

> 
> Thanks,
> 
> -- Steve
