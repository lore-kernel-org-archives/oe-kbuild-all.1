Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02D7F2DB7BE
	for <oe-kbuild-all@lists.linux.dev>; Sun, 27 Sep 2026 08:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790499025; cv=fail; b=Vock/lG+SIauQM3u2CITrFVPoJGVv26hoSTL4Bf1BCClW57dhcl1gfNrttnxJr4QLSMsfc9rrgpS3Qbx8mkN78ZWwYSeYpLvzHNpfTXDkxZ0l0vfImKX6CE1SabnPyCPvVvQJHghUgm913plAsSSazN21ANN0We+lTcv+CxViBs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790499025; c=relaxed/simple;
	bh=Ah+3Fv7ZdyQxn22vJyU1x0LpvUZkB4mJLS6qDMfaGaw=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=IAoR5culQw8w2tHNK/HJnqV9Dh2ftrQhPUOgRa08rKPs+z4rSS/cgAbKCwHNCUZirg6z0K5uuSUD0Haqv3Ut4wO53GlNDV8eiCoLKyfvgozc030HqS5RIk9JzwFQc3BanR4KMY3Iqnl00rrEFfJ5s8msz/Jw0WDst4cei8cJX1g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i3FGmZRr; arc=fail smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i3FGmZRr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790499024; x=1822035024;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ah+3Fv7ZdyQxn22vJyU1x0LpvUZkB4mJLS6qDMfaGaw=;
  b=i3FGmZRrYG+2xA29RDPC1snaR4Uv4gQFjUUR425guoEtBGTbvclMozT8
   g8k1CdCRPOaasYf3aO3/oYXgIBAmgADxGi1+J+CbTQ0X4pVJ5CiNAa1tA
   rtm4DbL8B/2Up2va7BzU+2uMFpqlbnMaUs4yZpKW/q1pc9oBQRr/Ao/UW
   wYc8bM36GwhBurnlCgQW0ZoZKOZl+Jjjuh6bLEOx294LC7tGf5CmiRYOV
   cTziAD3iGGAGpaKpBfcBifa2AvqeHzofxX4d5W6+idPBEoWGc6MJ18+gG
   rmS40pTNJTvCOPE0VFmewJSCQ3vsVwwvev40sIYVcNnyPuQx2QX1uPAOw
   g==;
X-CSE-ConnectionGUID: 235GJnByT+Ot5TPZpVPOCg==
X-CSE-MsgGUID: D/1N8X4dQdeYm1kAG0ZcUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11917"; a="93717253"
X-IronPort-AV: E=Sophos;i="6.27,126,1787036400"; 
   d="scan'208";a="93717253"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2026 01:50:23 -0700
X-CSE-ConnectionGUID: 7UX4+u7KSLC0XTUXeGxaIw==
X-CSE-MsgGUID: PZ4b8pyeQsGQq0qXqWUArw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,126,1787036400"; 
   d="scan'208";a="271233804"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2026 01:50:23 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Sun, 27 Sep 2026 01:50:22 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Sun, 27 Sep 2026 01:50:22 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.50) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Sun, 27 Sep 2026 01:50:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gMSr9+OLE19tgeedowT91B8kZNqiPuL2FqC+MGNMjlDwcsMBOvhijmp05tSV7SpG/zozautN2fiIqK1JSSNabTNywDyB7gAqgpScrMYKrHEW/LyrODtXvbWu2cWyGNLjvj2/9seiwKvpdUuaJ5VHGjh4E/qsMafOgISCN3ZKp6YM+82XW0JjCzKNGltmOD/RszXSGpile5Q1xZjHsS1xpsCzzm4RTUeFzdZ4sN5Z0gxAL/qeJVZ830aFOjUzlF6mMSy0drKmSehDbBcrkD5fJXIcRB4R5vm83wLHrTW7O0J1+WNh87sfIJSyCK7NMn05zkp16TCPFkuejHd/TdK3sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nsq1VO7tNfnJs8oq/wukWvtJD4LPSEfggjsMNtIWgBM=;
 b=yk9j3GVbRqAEc88ql48iHu7hJ5/gjXAnalsoD3UpstF/0PCDdiIrcDTW2mlsINf4/+xLoHB5mqXhYuOTRQoLvViWs4b/mcBwO6bZpucidrGFH6OvKw2WghjB/xGbXMiz97pBkiRI0NRz6yyDTAn1yugMeXhnCNwaRdIo0gc6Nil13zqh9nVK0fCgQrHiImaZmCS5ht530fWktsHH5qvtoUsCLX07WLfQ3OJC4Hm/VDu79hVf0LEwb+beO2tIVev87bIIZVFRk2LhIE3wGn5tkNZxSWZZ4F8hYarZf7ZSQRNk3ST7byGlPjdb/MMlXvGbXvo2a8ih5ieqi6A6qudUkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS6PR11MB362586.namprd11.prod.outlook.com (2603:10b6:8:4c4::14)
 by SJ2PR11MB8472.namprd11.prod.outlook.com (2603:10b6:a03:574::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Sun, 27 Sep
 2026 08:50:16 +0000
Received: from DS6PR11MB362586.namprd11.prod.outlook.com
 ([fe80::71a6:38f9:43ed:8f8a]) by DS6PR11MB362586.namprd11.prod.outlook.com
 ([fe80::71a6:38f9:43ed:8f8a%6]) with mapi id 15.21.0451.022; Sun, 27 Sep 2026
 08:50:16 +0000
Date: Sun, 27 Sep 2026 16:50:10 +0800
From: kernel test robot <lkp@intel.com>
To: <cros-kernel-buildreports@googlegroups.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [android-common:android12-kiwi-5.10 284/284] userfaultfd.c:374:13:
 warning: 'uffd_test_ctx_clear' defined but not used
Message-ID: <arjYwpo0wEOuGdZn@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: BY1P220CA0024.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5c3::9) To DS6PR11MB362586.namprd11.prod.outlook.com
 (2603:10b6:8:4c4::14)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS6PR11MB362586:EE_|SJ2PR11MB8472:EE_
X-MS-Office365-Filtering-Correlation-Id: 286a850f-e00f-42b5-644d-08df1c7459da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|18002099003|10067099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: RlHWLbq0M9flR+CTzaQhekcDM78btLHMO9UvX9aB/SgwqL4TcMhN16PE8R3DkNLMP5VcfhiXpF7iik7ORaJ4Wo5HE/pETMNSDnBAyhF7gkVo5LR9g3MEyzN7kmtCbQ5CesIwLWuOfY2yD3eq6FDf2scDNY1QtgJtHjMZk1YwGXXXF+YCByFckcxtS9dgFY8ZGZ7G9POJK0dsRIswqfX/Tk7wYh7OJgzak3dMab3jm13BGXPrgVdcH0/E5KwmbF5TEp8QxwaEUvrtmEkQ2S0iR6bPmQN47WRqfJfeSYeq8lp7wCxd2bNb7DYQrrSCguBXBDS2HYr8pbahiGgfWYyddFpvepAtkw6WIBfVo3GWdpvW0c7tA5kHC4SJAUYiEzPRV8Z9zphm0hrtyhzliHuUYpkHRjp2E8do7d8IL/0ijQMoGvaaNUdQuyNQeiDqfWL7qs9CxHu4dcK6RpqQpeSmH6WleN6ui0A8kZXkjqsAf8nc0JFsWMx7Py0o+olIgWKZr3zC5VIvHcOaLsPitNxpaQXF8meXi60lOFM6/5EwGTxPiJF99zanmTYBhX0STlQ/wX9lqCoiTCllwXuxEClJEqmRxhx/PLZlDestB+Th/WGw8nlGWqbrqvBf7aEu1vwd
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS6PR11MB362586.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(18002099003)(10067099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wG/Yxammm1kOPtJSulSkTGJcxNdBjL3KiFsfr57l9hbQdCGaT6ySuNbX2ZmS?=
 =?us-ascii?Q?2MYypL5WplQ7p1C/VHhezAJdgVI7KIAWjPL8HIBu1Fu2Q266awR+HkzVIzcM?=
 =?us-ascii?Q?wXH3yFImkhUw3u7jn2XGc/pyPVUwS6+gEOklA8GvW2kxCd/1OtwaPoABQJMm?=
 =?us-ascii?Q?A/74Qt1Zt7uKj0O6zA+wg3lIHwa5+gXbeMHCve0qYHNKxUUm0wXcDTsN+ud5?=
 =?us-ascii?Q?1JGGgE56h8lgk7Oy56aPRXTCiGmzDa/JtyG2D1Lc5aJmOWb04rI0g066qsVq?=
 =?us-ascii?Q?CfW2qayxmufg/+850dlC8Ls5tHjCWFU399GqSFewXIhUsQYQtU8svmgfewwZ?=
 =?us-ascii?Q?rdmoIuDUPkPEd5NG32R+nlpN49dB0U6AxPPmTdgI753fBdxtASqR8aZr4GHD?=
 =?us-ascii?Q?MSyrhZUPzCHEXXWFAYJ8Gyx2TOrM8nSw2iLwPP5NtPNq2CZRswaBAA1SEYMa?=
 =?us-ascii?Q?kl/Wp1hn9jFi0jUaw1FaPKbkHjfiU6AbMlP2hftcO8j50dpymMSaVrGBu+4G?=
 =?us-ascii?Q?vOLe3Uz2J9+/ZZk/P6MHSa2OQMqBvQREZeB8tC0ss5XKmLDvqeS8LTHn5o6J?=
 =?us-ascii?Q?f+NWqHGrMw20dtZr64pj31u7/w8qNGGQdfI8tqrj0LtpUvZPbAd9aciQ1ro3?=
 =?us-ascii?Q?mFqkY4vHG7glnk8aqfouaCbQ2FsaDmEQ6hSzE0cMDID8VUG1+cxB49CpRPkQ?=
 =?us-ascii?Q?aF8hkAFWe9LJaurKEQF+wkriPnj28EmEgnW9mxQWN1jchB1/pNA9SFWpOSiM?=
 =?us-ascii?Q?gxxh5M9jGnuloH9UNkF+O79GJEKPCAWM/sAVQfsmglNwJRK+/HL1AEmDpNgc?=
 =?us-ascii?Q?D8gwRpuPUX/+l3u+k9u70PslZgdE7FxYbcClJJMqmSAbg1Kly9KRUiI/ZUxl?=
 =?us-ascii?Q?33YlfeXUl9NUq5znbYTiSKltL7c0ppudlsUs6+g2FcGng+KZjZFHaGV71VPP?=
 =?us-ascii?Q?P4AexAbevKFR/zU8Y3UuxIHDB0ZRJazTWgqY52ODh6vTuzlAyS4Vm2owEZPT?=
 =?us-ascii?Q?52wo1DjiswwYLqBHMEQpcCADv/SCpwWBn4tkNmhBcusN9YcbSY0nkTi9A3Gx?=
 =?us-ascii?Q?hKY+2giqSnuxZ8z1VHdDThDhMoz0kU+8LvHYC9MOqk89zpC0IMojP61clN5u?=
 =?us-ascii?Q?66lU7NH/kKPboA7HLg5dTl3KjeAlNGAdTyAnNQWb5/FnHZd3z3SttkGNmoxt?=
 =?us-ascii?Q?pTz9qFXdbOpMgvpCR6x58FdNWwrCW+OJiPzaqM+6z44946Yo8o2Y6TiFWbn9?=
 =?us-ascii?Q?+lwoSj+08/aSPbcVIYYM2pYoHbhfdzm4j/rgNIx1jZwjsPIHa/Jpst1lTtqL?=
 =?us-ascii?Q?PO6YDnMtDe1pP6hSQcB4e/F734tf3g+Zr65wrfCTYG0XFu7rkwgJz9NQ+tZV?=
 =?us-ascii?Q?SW383O1mrjwzObWZCpCNmvoJ+WW/PkgOVepeJcA8OCzFAIZZdiOhT4rhWafn?=
 =?us-ascii?Q?2fVPwuoy2KER50MAqAbFDKRneTvAZAPfVd5JfGtINlUR+SaYTh8N7BDzkcPK?=
 =?us-ascii?Q?ZBDMFNg4YAVhIxr7ep45C5OqiEaUQVBN3Pm9RRdMjWthpEjpHfVxbjvRM6zd?=
 =?us-ascii?Q?ZjGfK7pn6GmUTigrrN4JjT+8FwpNrBpJ62xl7PxzKvw8B7NMU3KYwqCueTWQ?=
 =?us-ascii?Q?9P3tQ6vclqqIMcpuvMWslw9xlAxNQ6VBkyVWjRLMmZ8lODnQWB7ecbkqCegI?=
 =?us-ascii?Q?uFkg+1X9k5kZBqQu10njv/DwHlO2E2Qa5D7kjj1m6es6rMFmVJbBYkZ6t1on?=
 =?us-ascii?Q?HsAQHdJ+Tw=3D=3D?=
X-Exchange-RoutingPolicyChecked: lqfgP1jQpqKfIPjhpt9rLl618u4+aJ48mrsmJ4dWHwhgxFn7WMoD9QciPLreQ+jbZ+0crYKVc9sRctnZ4m1rSssTZKcT0t01T4PuAbuF178NbMFrTqOi0het9/Wb4rvgRvQYsK+T41Fx4OCbvTRyQ1RHrbf3dTied3/tQhrjDu+2Zqqb3UgL+XR9k40IHIJ9+geViGszlKvHa6fqYEDs9SnNOyE1uorg7BKR5jm0IBeD1el+c+EQ7ky86/rl3IwWPfoXs+TDzs7XriJTiNqhY6ZH+8UMzfUtyceBdVaiYjpNnjd4jA3ma6Omhq+3QdW/Goa3VxDPobRBuGGFuE0agg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 286a850f-e00f-42b5-644d-08df1c7459da
X-MS-Exchange-CrossTenant-AuthSource: DS6PR11MB362586.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2026 08:50:16.0175
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4mXoFiVvTU+scC0v3q/Z53wPBS89rd8JpEh0OSaWiPIIb3R9H7g1jD61hX3uAFZun6vkWOG9ZIFVq7L81owUxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8472
X-OriginatorOrg: intel.com

Hi Axel,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android12-kiwi-5.10
head:   9b45a047ff0f19af584920a93cd8020b8538a5c3
commit: c2c081d009b3f82013b4c3fdcd6104340fef2201 [284/284] BACKPORT: FROMGIT: userfaultfd/selftests: reinitialize test context in each test
:::::: branch date: 2 days ago
:::::: commit date: 5 years ago
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260927/202609271024.F2KgGL4a-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260927/202609271024.F2KgGL4a-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609271024.F2KgGL4a-lkp@intel.com/

All warnings (new ones prefixed by >>):

         |                 ^~~~
   userfaultfd.c:976:25: note: in expansion of macro 'err'
     976 |                         err("UFFDIO_ZEROPAGE error: %"PRId64,
         |                         ^~~
   userfaultfd.c:979:47: error: expected ')' before 'PRId64'
     979 |                 err("UFFDIO_ZEROPAGE error: %"PRId64,
         |                                               ^~~~~~
   userfaultfd.c:146:43: note: in definition of macro '_err'
     146 |                 fprintf(stderr, "ERROR: " fmt, ##__VA_ARGS__);  \
         |                                           ^~~
   userfaultfd.c:979:17: note: in expansion of macro 'err'
     979 |                 err("UFFDIO_ZEROPAGE error: %"PRId64,
         |                 ^~~
   userfaultfd.c:979:47: note: 'PRId64' is defined in header '<inttypes.h>'; this is probably fixable by adding '#include <inttypes.h>'
     979 |                 err("UFFDIO_ZEROPAGE error: %"PRId64,
         |                                               ^~~~~~
   userfaultfd.c:146:43: note: in definition of macro '_err'
     146 |                 fprintf(stderr, "ERROR: " fmt, ##__VA_ARGS__);  \
         |                                           ^~~
   userfaultfd.c:979:17: note: in expansion of macro 'err'
     979 |                 err("UFFDIO_ZEROPAGE error: %"PRId64,
         |                 ^~~
   userfaultfd.c:146:24: note: to match this '('
     146 |                 fprintf(stderr, "ERROR: " fmt, ##__VA_ARGS__);  \
         |                        ^
   userfaultfd.c:153:17: note: in expansion of macro '_err'
     153 |                 _err(fmt, ##__VA_ARGS__);       \
         |                 ^~~~
   userfaultfd.c:979:17: note: in expansion of macro 'err'
     979 |                 err("UFFDIO_ZEROPAGE error: %"PRId64,
         |                 ^~~
   userfaultfd.c:146:33: warning: spurious trailing '%' in format [-Wformat=]
     146 |                 fprintf(stderr, "ERROR: " fmt, ##__VA_ARGS__);  \
         |                                 ^~~~~~~~~
   userfaultfd.c:153:17: note: in expansion of macro '_err'
     153 |                 _err(fmt, ##__VA_ARGS__);       \
         |                 ^~~~
   userfaultfd.c:979:17: note: in expansion of macro 'err'
     979 |                 err("UFFDIO_ZEROPAGE error: %"PRId64,
         |                 ^~~
   userfaultfd.c: In function '__uffdio_zeropage':
   userfaultfd.c:1003:55: error: expected ')' before 'PRId64'
    1003 |                         err("UFFDIO_ZEROPAGE error: %"PRId64, (int64_t)res);
         |                                                       ^~~~~~
   userfaultfd.c:146:43: note: in definition of macro '_err'
     146 |                 fprintf(stderr, "ERROR: " fmt, ##__VA_ARGS__);  \
         |                                           ^~~
   userfaultfd.c:1003:25: note: in expansion of macro 'err'
    1003 |                         err("UFFDIO_ZEROPAGE error: %"PRId64, (int64_t)res);
         |                         ^~~
   userfaultfd.c:1003:55: note: 'PRId64' is defined in header '<inttypes.h>'; this is probably fixable by adding '#include <inttypes.h>'
    1003 |                         err("UFFDIO_ZEROPAGE error: %"PRId64, (int64_t)res);
         |                                                       ^~~~~~
   userfaultfd.c:146:43: note: in definition of macro '_err'
     146 |                 fprintf(stderr, "ERROR: " fmt, ##__VA_ARGS__);  \
         |                                           ^~~
   userfaultfd.c:1003:25: note: in expansion of macro 'err'
    1003 |                         err("UFFDIO_ZEROPAGE error: %"PRId64, (int64_t)res);
         |                         ^~~
   userfaultfd.c:146:24: note: to match this '('
     146 |                 fprintf(stderr, "ERROR: " fmt, ##__VA_ARGS__);  \
         |                        ^
   userfaultfd.c:153:17: note: in expansion of macro '_err'
     153 |                 _err(fmt, ##__VA_ARGS__);       \
         |                 ^~~~
   userfaultfd.c:1003:25: note: in expansion of macro 'err'
    1003 |                         err("UFFDIO_ZEROPAGE error: %"PRId64, (int64_t)res);
         |                         ^~~
   userfaultfd.c:146:33: warning: spurious trailing '%' in format [-Wformat=]
     146 |                 fprintf(stderr, "ERROR: " fmt, ##__VA_ARGS__);  \
         |                                 ^~~~~~~~~
   userfaultfd.c:153:17: note: in expansion of macro '_err'
     153 |                 _err(fmt, ##__VA_ARGS__);       \
         |                 ^~~~
   userfaultfd.c:1003:25: note: in expansion of macro 'err'
    1003 |                         err("UFFDIO_ZEROPAGE error: %"PRId64, (int64_t)res);
         |                         ^~~
   userfaultfd.c: In function 'userfaultfd_zeropage_test':
   userfaultfd.c:1037:9: error: implicit declaration of function 'uffd_test_ctx_init'; did you mean 'uffd_test_ctx_clear'? [-Wimplicit-function-declaration]
    1037 |         uffd_test_ctx_init(0);
         |         ^~~~~~~~~~~~~~~~~~
         |         uffd_test_ctx_clear
   userfaultfd.c: In function 'userfaultfd_minor_test':
   userfaultfd.c:1180:9: error: unknown type name 'uint8_t'
    1180 |         uint8_t expected_byte;
         |         ^~~~~~~
   userfaultfd.c:1180:9: note: 'uint8_t' is defined in header '<stdint.h>'; this is probably fixable by adding '#include <stdint.h>'
   userfaultfd.c:1184:9: error: unknown type name 'uint64_t'
    1184 |         uint64_t features = UFFD_FEATURE_MINOR_HUGETLBFS;
         |         ^~~~~~~~
   userfaultfd.c:1184:9: note: 'uint64_t' is defined in header '<stdint.h>'; this is probably fixable by adding '#include <stdint.h>'
   userfaultfd.c:1192:9: error: implicit declaration of function 'uffd_test_ctx_init_ext'; did you mean 'uffd_test_ctx_clear'? [-Wimplicit-function-declaration]
    1192 |         uffd_test_ctx_init_ext(&features);
         |         ^~~~~~~~~~~~~~~~~~~~~~
         |         uffd_test_ctx_clear
   userfaultfd.c:1216:58: error: 'uint8_t' undeclared (first use in this function)
    1216 |                 memset(area_dst + (p * page_size), p % ((uint8_t)-1),
         |                                                          ^~~~~~~
   userfaultfd.c:1216:58: note: 'uint8_t' is defined in header '<stdint.h>'; this is probably fixable by adding '#include <stdint.h>'
   userfaultfd.c: At top level:
>> userfaultfd.c:374:13: warning: 'uffd_test_ctx_clear' defined but not used [-Wunused-function]
     374 | static void uffd_test_ctx_clear(void)
         |             ^~~~~~~~~~~~~~~~~~~

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

