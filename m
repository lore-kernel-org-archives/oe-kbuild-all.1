Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F1373D47D7
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Mar 2026 13:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773926849; cv=fail; b=fAKFWgNRiZJ4S4+7HO89rWWyc7LryQUCkRIjW2xMO7RY2jPJvNs4DCpWWmyMbrOkLV+4uG7YUZPbRCaHqprr/+5wmVKwgPWE/TYbPzuoJk7toNj8wgEHAYDGZfSv41B+SCQ5p1ByXzsvQWyMIAXJlHfnb4tFiN7qBGI3U1gcasI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773926849; c=relaxed/simple;
	bh=wHkW1c99TIC8OUNFLZYPZLG1UJyI6x0kk2kMNLn3U1g=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=B0XM0/Pxln4oJik0GpfbciyeSr1It8gJ1zudla56RCcAMkO8nLn8HOniEwSxcDYibqMz2lLzZu0TFG4zAdiZppNen+OSO9Pf2Sav3AMv3e9PJeDN1hMo7mX2s0jqhJugzRsiqgIMNcwYcvKf1a0JQM8DuugjzS8GMHcS1ipREto=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Cr5a7Y9i; arc=fail smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Cr5a7Y9i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773926847; x=1805462847;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wHkW1c99TIC8OUNFLZYPZLG1UJyI6x0kk2kMNLn3U1g=;
  b=Cr5a7Y9itg9XTeckt11oMRO7+P6u11Vk3lt/ZCccbfo2rgQa7Q981PVX
   XNT3Ywv2bVjwJ0gXDEolJsP0DEOlI4o0hmk5ZDzWYdXL4teB16biasyMQ
   Ehd6Imds/BD7pCtahI2yZyydpyZau3+04ZsaSqTeJ71/iU5ljb9TaMrIV
   BebChpIDy0v3BHvZa6MqhL39WxGX3jlds8HVfRIVGWan3/+LFeJk6VHNN
   q4q7yVKo42p6pwUsHRdZ2LW6p6rXLTw3O3T0K4xl7TuE0feLGdDiAWlNo
   ILmOzs+LeB6HrIqUF6A62hXd+CYjC377vDx8af1GIWJLLWOtBBzkqv8h1
   g==;
X-CSE-ConnectionGUID: 8x2VG1DRQZGDAwS3QhTkrA==
X-CSE-MsgGUID: PZ1TOrbuT0SoWA75/x+toA==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="86472669"
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; 
   d="scan'208";a="86472669"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 06:27:25 -0700
X-CSE-ConnectionGUID: Z2v5sKlNQ86XI7Ad1PpRWQ==
X-CSE-MsgGUID: 5MG60kLMTW+fogq62gHMIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; 
   d="scan'208";a="227902121"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 06:27:22 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 19 Mar 2026 06:27:21 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 19 Mar 2026 06:27:21 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.33) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 19 Mar 2026 06:27:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ahltyPz0c/rYdkGGODBroc2BxyzaNhV6tB8Yw/2kMIKDMzOLGCShjI7Jmc5H2YQ+0x/6YKi8KChfdOx4Sir5kwnyyrR61J1msDEhgCRiH//Q6yElgLxGWUcd1GKhAaj1xQm7oS7S4VFpgcPpgiRFqGqhKnMvlefFLfamxyICfnl828INtCj6KXakXPrr2Seyl2EM1Zj4cwAS5o7HSTGbqsTPXD8rUAFkAVGMwjGsUpnnzxmA69pr5oZDi0+g7g+ioki2lnlOIYMu8soM9hR/KvWKzLbv/kmM6s1wnV+YQbUi0fA+EaR9pPE8rsDx9uDd+BAGPMTXL+Ef9widcWQfEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oBYXYRp2aO6j0YiCe85/+NPugumI+sHWo1Rhz3u/nPc=;
 b=PoPF39u2xuyLnjQOsxQZODaH4MXmpUbvYOwE9yxr8Om8hfZe0K5Mq7wDlAtSNBZ/0qMYT6bhocrxlmYS4ywg0/BOCpznR+JUNAClaISAl42JH5AVXcRvEMS/T5by5CYNmT6SRY9mWXctL22Tcf7tr3FlTsccPxy7AFxXNrZfMuHwWhCaNkMwCLul/IeXvEJJnssQ3DHaZmKS3Pas2A1qVFZsioRHN7N/ZKIznr5mh01u5RiYwUsizJCowKXhTWywhqbec5ouhgpuZFRHkl+fcR0TgSYjERuslDu/MvRjVrStgsmibxFglUqUwA3KJ5VrlU0XVYmRAXbhaN9cqZjqdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2808.namprd11.prod.outlook.com (2603:10b6:a02:c8::26)
 by SJ0PR11MB5772.namprd11.prod.outlook.com (2603:10b6:a03:422::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.9; Thu, 19 Mar
 2026 13:27:14 +0000
Received: from BYAPR11MB2808.namprd11.prod.outlook.com
 ([fe80::defa:788:da96:2f9a]) by BYAPR11MB2808.namprd11.prod.outlook.com
 ([fe80::defa:788:da96:2f9a%4]) with mapi id 15.20.9745.007; Thu, 19 Mar 2026
 13:27:14 +0000
Date: Thu, 19 Mar 2026 21:27:06 +0800
From: kernel test robot <lkp@intel.com>
To: <aubrey.li@linux.intel.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [anolis-intel-cloud:intel-6.6-turbostat-20251202-ANBZ29699 244/244]
 diff: tools/arch/x86/include/asm/amd/ibs.h: No such file or directory
Message-ID: <abv5qmphhp5z+zUy@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0162.apcprd04.prod.outlook.com (2603:1096:4::24)
 To BYAPR11MB2808.namprd11.prod.outlook.com (2603:10b6:a02:c8::26)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2808:EE_|SJ0PR11MB5772:EE_
X-MS-Office365-Filtering-Correlation-Id: bcc78108-fbab-4a42-6207-08de85bb3bd3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 8+jfrneUbXZKqzuhleTJy+erDqLdzr4x+yZj0wMVRlhyK3MFSjc8lr21is8J00Pku3eX1C0TydopsH06KUQ8Ss4O8LR4R1kx9ar/+GSBjUheLLRmvY5FJqmfS43p1ausM7nDpbw1l1QCg9YW/pOfTsipfV7ZhewWXR3AU1E9DYsZiT82td8YaJKfsd0P2Ix0e4hzto03MVNSu0CYr99s95A2ugNIq3bjvzfOmdu4LGRU24Urncl5Epob2MhTS7ym2tNg+cawJQbRClIMiUeI5+NYmuFvTtQleNPWRfgidrNMEyaOaTyrhOiSz/7BUe9NSBjJY7LrEA8+am/0ltNlRhVwJuAyjOMs6QKO7REUMD5ObcuP/HAuw2rqQm18B1j+Rs1nbJkWTze0lIJKW2hRTMluZG/wGRE8pA9chuK/dlghyAcyojUaPZHg7P71jk9QUEFXurM18d6nYbXaHAaTqvNpjqp9WbcCPS/ZL29bnFHeH6NSnTF5TT3jZcH1WJ3Gb0N0oEUKqvBQ2vctyG308CWzjV6M+3rfentLm76g/Wc592LynrprlWCCJXIELNaUIgUmpNhnZwv4XM7EkX2ZmtHuMtjDfTkbhEuIFqIIzkEwcQaZdcre/kgDLnAWLjlsyjKn7UWQIQ6JV8oMX3oMmWI5oSIMmdsug60WrrPXJeL6xsT6Vtk9+DWVqr7OfppI
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB2808.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?L9NQXT2e9tTxmPy8MRad41VfUTMWN9e5dxxwHhcvofZvM2UbM/U90saWY2SO?=
 =?us-ascii?Q?LZ7bTyIOkFPXf5VvYXcIXnqJXpQvUErG/WXccxgS7oOIypaYv/3xNOCk8fNE?=
 =?us-ascii?Q?5cltwqdLRftKFWMg20Z8/GoTfcJWW4D+dk9AuIHdYNnR5axM8VxNXTAAvlBP?=
 =?us-ascii?Q?xO7vnoCG/CQ0REp76JzrnvVol0v+SFBa9IwadVft06l7TfUtEQYcvd0ceRKH?=
 =?us-ascii?Q?BP62D7tfD7rnlpGD0FwSPE6h13+1WGwM6TuBgUMWu0M5ilRbhFD7HyDvlK1r?=
 =?us-ascii?Q?mbZkC7d5KeLY8L88VpxjqgqID2zcemHWmhAUvk0wKrJCW8aeJ+sdQ7IP7636?=
 =?us-ascii?Q?KChuDUodUv5KFrF3kVEkETfkqoM708CEXXc4VBAy5JRWv2pW0mLbGZ+ypyl9?=
 =?us-ascii?Q?hIlu855532L6LB/ACq5NWQXKYBI2kt3MITuFXnTQzVxMOkYEeDkFmAK+dvhL?=
 =?us-ascii?Q?HWfKws1OGcJ0v09VYWvx+Fx8hqzra37kS7B2OjbEf5XL4Y6eAAIwJQBB3CeH?=
 =?us-ascii?Q?9QVserH9fvtiAZqHXi8JLNj5pgFXgcfnIoqdXuBpYYya9mFZblOhEk1FqT22?=
 =?us-ascii?Q?HdkhYM04nbklR2ZEon4UwQJE88puDCTSxmxB4IVHdkiiJzdTLPHWvkIALidF?=
 =?us-ascii?Q?TeomIXhPMRBOFbIC7s4QhJGP59kFDjBJvb7/gvQsdsekz28QdIxgQh8mug5A?=
 =?us-ascii?Q?iE1njZa0s34whovnO0smpRYdg56N5KieitXhVpTAYJL7XQ88SFbA9gL7JBUZ?=
 =?us-ascii?Q?Zh8xWT1M1m7ID6RNwVy0qn63pb3dkqawmuUSs+XuQkp+Kn23AM0mySU6rfjJ?=
 =?us-ascii?Q?zkXDb+9HSBdSsagNgiUl4bIi8+yVDwiD4PJSKCO2PNb4EChDYT6epYboSKZU?=
 =?us-ascii?Q?h/1WIsTu+i0jktWRQ4Nov1bOUEmV6UOnikaj3XKC2DN6/GZbHWTQbUUWH9bW?=
 =?us-ascii?Q?MV5Q7S2hTyQbFmf1ACrqpkzirtLoODey2OTsMtM+SUcodd7aYZFBh684DXwT?=
 =?us-ascii?Q?dDhGz3IIyi7eNTLAixDCevngvumkwRzn4je1NSM+yQKZ10sFrPPdCe5VmvSr?=
 =?us-ascii?Q?xRZ4UojsfFHJqvGaa0EQ6PjvrcxpwC3xyOl3OzVxXzCc0HJlf1ygd61Hot2f?=
 =?us-ascii?Q?yN1+QFaFCY2H9w972r+l6hIB5eWBoGeqD+4mU4QapwRgRvrFRzG2ID9uxtex?=
 =?us-ascii?Q?dZ288tiuM8jsuJlmHKJjFozhPP+Y0idsUqpHv1QqxPKh0TwZuEPUC1mf/iJS?=
 =?us-ascii?Q?KR6IBTcMR1TCP+ub0a8SjTypExZk51Jg3pxszs4TriVSKsDqXidj8eO2CJrN?=
 =?us-ascii?Q?O/2e4oAcETEAqvgKrjYUn2BBuVWENfoeXLneUqn2cg1jd8Za1vCwjX9TLXWY?=
 =?us-ascii?Q?8Hncv7Ytp0qbkdyfkgWShA1qQKjjBMQ9sKSJxwP+6gyUwmTlB5BCUCzfDKyT?=
 =?us-ascii?Q?57CYFwA7LoaVrVSEnyxUYDJRUeyExV+6FlqjBS8zr5bS5O4B8cUVL4ytNSr2?=
 =?us-ascii?Q?Ic/SrUQP8Rm3UDLan5Wq2hdViqk2GZBNNUNJTnot0VT8K1r/U6pSOeEu+LdL?=
 =?us-ascii?Q?kaES4lpzYN4ZfMrs2ubtc/Mx2gRtatpkMs+G7sbENOtRReYibIlJWAQRMoH3?=
 =?us-ascii?Q?I83OIsWEGrSGNgIO10RyPV3DdAXbg8ZOlgIHRUBKP4t0SfJNouCpQJeMmdQa?=
 =?us-ascii?Q?kPGs0VqUj+50uYMykxrqLIo1h7FyCNSJWIeyFHrulTq7E+EUnexGRx7ukJQ4?=
 =?us-ascii?Q?ww237T7JtA=3D=3D?=
X-Exchange-RoutingPolicyChecked: NAoPFJgK8UofmHXPZMTXTTEmPnCzlGIC56M9MALd2T1sOeJYbDCsHDlV6PCFrZWwg9KH9dra6PlbPe9JwNuXLad5mlMs7D/b9KjanxbBEJ3pQMyAiUIN5aB54nlWVedlW/I+wW6Rd37dyLq3uU39Xh/QiiU4OoM1AY4tlF0Q5JzKHRgxhWSkqPOrur6xwBgAjIF/0UxR1Usu7xwjxy/KF19vJXtOrVgMhYeTGPKMqfp/jTu4M0RCHlsO9vqYmatw5iNuzzcvEPxt2kMsUh5e31S0cAoeRu9LD2vDA6VK7n9ArK1fOF7Mshf1IeXQULui31OdOfgSv9P2a1zP7KWcpQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: bcc78108-fbab-4a42-6207-08de85bb3bd3
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2808.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 13:27:14.3740
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lVBleGhvKRGxwsjNSgrBqG13OG9oZjo3njijM+TKOrIO/uUJA3xH4LoyAUROe/GAI1Oc4HnaTwFvDAfJQOyLwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5772
X-OriginatorOrg: intel.com

Hi Ingo,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git intel-6.6-turbostat-20251202-ANBZ29699
head:   620dcaf654cffcc62ad2b00dc312eb49a59a4471
commit: 0028489c58bea4559be1ef503b566d40157b5d02 [244/244] x86/platform/amd: Move the <asm/amd-ibs.h> header to <asm/amd/ibs.h>
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260319/202603190825.StD85oMs-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260319/202603190825.StD85oMs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603190825.StD85oMs-lkp@intel.com/

All errors (new ones prefixed by >>):

>> diff: tools/arch/x86/include/asm/amd/ibs.h: No such file or directory

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

