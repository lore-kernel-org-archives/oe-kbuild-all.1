Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C19B52A1B2
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Jun 2025 01:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749431350; cv=fail; b=r57zRrON8ijxbsYe8715PKYAcBhkSU11fRzbWgRsfbxHtEsIuZReZzJ5AdFTEkuFMkt381HkLhIKIqxxhvKxSSVMVUV0hqlMVVF31YXYt/lWI9nRbRVf/omGee5Ca//nhBmIx3yJR5guOJXa7l2s+G1ufkFn/zRcpQ2Wr0bdwQQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749431350; c=relaxed/simple;
	bh=F4hs4lXfVEMpeyv/xP+k3I+9ceaIA4//C5qjQd6bnx4=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=d5qf3BCHzUSnoPY0zveYWcMny21xEe9v7Db0KyXMy8SGwVKmc0hXwL/QV8zDeCFTCSZH4VIh4BMk6svolAFF/PEI+AJ5N1ZiCxi+mYapeFQRVHJRm8+tcCk0uTYX6S6NVje0yjCYKdzXBFc/izWx9bcxU6m81Hd3fz3k/ztJRH0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q2iOn8Ut; arc=fail smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q2iOn8Ut"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749431349; x=1780967349;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=F4hs4lXfVEMpeyv/xP+k3I+9ceaIA4//C5qjQd6bnx4=;
  b=Q2iOn8UtBnoDkGsoqs8buJda+KApHtITA3JGNYTIXJyPgvcjZs9vmJ8a
   J+5oqQHOSiSR07mKakFgLddOJ5KQdGzQdYDes4nyohLajZs8IaXGEBV/K
   5GNSzN3KxYrP6jpjxgEszwxy93xLODU8egZX/GOw0Q18hKHeQdgWiXqn2
   UPDb8rB6QlbkFBHKcxEByCvCoJizpt6ZxhsdzWARr3ycDeVXRZEoqSTau
   6aBpjCR/ETH2G2nckHDPBVrRz6m8lpnYsvQUaZaKk/XEvS4DoQOgUt1YA
   OdVIrt53duJVp1NCPbywL75dySUgX0ETVAkl+3TPo5HBw7dJKbVaPnREt
   w==;
X-CSE-ConnectionGUID: vF9gmGZsQxewxp7PbTFB0A==
X-CSE-MsgGUID: cUkMjoX5TD+4IP8mahd/Cw==
X-IronPort-AV: E=McAfee;i="6800,10657,11458"; a="62117252"
X-IronPort-AV: E=Sophos;i="6.16,221,1744095600"; 
   d="scan'208";a="62117252"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2025 18:09:08 -0700
X-CSE-ConnectionGUID: VzWuoFxNSiCqxTp1t0UeLw==
X-CSE-MsgGUID: CE3QRly1SFKjj1wLlyGd9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,221,1744095600"; 
   d="scan'208";a="146717348"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2025 18:09:08 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Sun, 8 Jun 2025 18:09:07 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Sun, 8 Jun 2025 18:09:07 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.54)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Sun, 8 Jun 2025 18:09:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=apahvs0LV2VIsDHwKGfzKDSgWKthVvN5ZP0peDvodZqOIFuIuStXUPIHjKnURPhJnDAbO8gmljcINQPYUJ1d12sg5dT7NXDpqRTJYV/v/3g6rUNGyCJtm6TpUvKvNlkmMLFMht22CtARup5+0wOQPdFb00Ukypo0/7MZv6+TQkqIZGhK8K6dNg78lkAKc1ePD5AKI87Hb19D3BR3vgejvYOg16VsNUf4fEyHA9bIZ/u2jiasDuDdbBIgsdGILZubCHX6jIgYcYiMHJ9XqDfhRHIrTksB0h0riasumjhpV0BlQk/Vdo0sx4QqTANsYAqKz8a2M5gljhlhk0ata4ikdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nO4t3DqkU/m/nvU8YcAo6sPc0z1d4YPwsXRvE/poX4Q=;
 b=iPfVsTCZRTe7+CJp4U2K8gxq0+v3Jphn4gRNQDPNDzJOAOntR+LTyoihYrtt3J1FUGqJxxPEDUxVT5xQIODL+3eJzSvUBPw0bxri3k7iUKon+ZITENf3WYW8hno7VjOI6EWAbrIqXz59nZXsZwPU1J07k+7fCCIR5KFvYdL49HzNvniDsztXVp4bKmOA62za+X2i+egrmlh1H+1yLUT5qbdxTVmura2J0Q7XcPRmV1gSalLTjkmPptWEoXLSgQty/F1VvCpoK/v/JdxMrg40k0I7veLJcFmDf27Z9arn/vwCKqhBMh7259N7zEuNSbE4eugcjOdt+GPOiJL7kYLi8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5674.namprd11.prod.outlook.com (2603:10b6:510:ec::10)
 by SA1PR11MB6711.namprd11.prod.outlook.com (2603:10b6:806:25b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.29; Mon, 9 Jun
 2025 01:09:03 +0000
Received: from PH0PR11MB5674.namprd11.prod.outlook.com
 ([fe80::77d3:dfb2:3bd:e02a]) by PH0PR11MB5674.namprd11.prod.outlook.com
 ([fe80::77d3:dfb2:3bd:e02a%4]) with mapi id 15.20.8813.024; Mon, 9 Jun 2025
 01:09:03 +0000
Date: Mon, 9 Jun 2025 09:08:54 +0800
From: kernel test robot <lkp@intel.com>
To: Tal Zussman <tz2294@columbia.edu>
CC: <oe-kbuild-all@lists.linux.dev>, Andrew Morton
	<akpm@linux-foundation.org>, Linux Memory Management List
	<linux-mm@kvack.org>
Subject: [akpm-mm:mm-nonmm-unstable 29/32]
 include/linux/compiler_types.h:565:39: error: call to
 '__compiletime_assert___COUNTER__' declared with attribute error:
 BUILD_BUG_ON failed: FIX_KMAP_SLOTS > PTRS_PER_PTE
Message-ID: <aEY0JhnfnoFGlbOm@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0162.apcprd04.prod.outlook.com (2603:1096:4::24)
 To PH0PR11MB5674.namprd11.prod.outlook.com (2603:10b6:510:ec::10)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5674:EE_|SA1PR11MB6711:EE_
X-MS-Office365-Filtering-Correlation-Id: 81ad1a5c-cc08-47e1-c268-08dda6f23939
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rzqI6JaxlR4SqC8BPcHRHP9Tx5WV6iNFwyLAG0MBIWL3vq8U50iD7wyBE2pJ?=
 =?us-ascii?Q?pwqIwewWn1hVse85gnQSEZcukqyT9oI7E6E4Yq9I60IkNj1D5A7q5kKMeo1Z?=
 =?us-ascii?Q?U+qNa/oGpc6FM/yFE8ZCn68M5PaC1kdrTyQOLvOvZXFCfDOic8yTPSeAKAel?=
 =?us-ascii?Q?SF+fqYgdHR6cftJ3g5DrkO3mN8l/E+D7GVEIjYquKDjQbWtsdfVwYJJBiQxp?=
 =?us-ascii?Q?bGTOoM9VrM/HpcpvQzQfWdoDBiCK8eIRWNxUmUF6V66cFpsRsL+q6Kg+r0d0?=
 =?us-ascii?Q?FVWOzihP5Nw/FxU4v3BHZJ9ToFFqmia1+c9cbjpEE0eTjfR5x5AHG8PIUpeE?=
 =?us-ascii?Q?3pA0kC3b+EgMO17t12yfgu6cPJKZkE7uA0oK1Q7/jitRHl1oU03PLl9MWj22?=
 =?us-ascii?Q?/+6W3faTXE4/KfHn9oR+dAd65pC3ZxAO6QB1v+qZ6gnruilEBF9raC35JU+J?=
 =?us-ascii?Q?g6EuIt6tl+twKoQ4qJhFqIaKmH+szvBRvXtWR8GhZrSC7gqwDT+2mrn/W+WD?=
 =?us-ascii?Q?DZ3U2xIJQU3YDXc6o6GSh3HR1/m3vWt0otTNsGmv/Y6lMAKjqTjlLZEkLVnR?=
 =?us-ascii?Q?cm0wwq4OsoK0Jbcu9sWcHwtsFXe6K2MtWjNuWe97zRispcV1GbHGGc/CxIt+?=
 =?us-ascii?Q?kJipfetQSXkMTh1R409ff30FK56Nehme6nzt3RkD0F8Gn67UxMtytpc0l2dG?=
 =?us-ascii?Q?98S5THAEZ7wm4NmlMBwEnewLUkKaC+3WhCal18uB6fjDn5z4upDdr8PN3ayD?=
 =?us-ascii?Q?EHw//xeIp2Gdr6uclWwTmoWEfpVPpSqKEaJhLovO20hG1b03MjbqhDt+kwNZ?=
 =?us-ascii?Q?PjRYYC0eD+H05MWFibSoBBPjCu+uQNr+dWy4V62ISOEbkUnDmDDEAmAJpjql?=
 =?us-ascii?Q?AuSmcjL8y+HRlHrU6CvtT+x6P99fzRPjoqCr9ViVcEY1Oc723p9iwjzBmqHa?=
 =?us-ascii?Q?MOaimzisQ3Uzijpx2aCgvChbBJzIq2W/9lUDh27UFacejiO4H8dXG2r0McXh?=
 =?us-ascii?Q?Doavzcm7erLkZFbi7ggGGhpLjdd5i0QOo/zzpLJ+4zbUMGAWhAWod1HJrt9k?=
 =?us-ascii?Q?e/OBNIwnnub0WrO9W2B7DRoa6y41o9/z3uSiVG3Wy8AfLYwbp/aY4bw9E2pe?=
 =?us-ascii?Q?rVDk+o3cTIUIjKTJmUT2O0EvlX/uFMbOhdm19vwxDEK0Xw5O93WHFv/x5ev4?=
 =?us-ascii?Q?Us0893CTLAjTN2aN7JvPi6+25G4nUeB35tbKMk+D12fLbN8kjQRKVrMaNDxv?=
 =?us-ascii?Q?Ce+9kkKybF/XvrP9CtXJjxQbbjI2FcVNqyaOFHuduuVKGNZsFlP1wFRLZjoV?=
 =?us-ascii?Q?IKWjhqwSZDOsakq4zzagkOQbX+NHhmd9RFu/SdwLAf8vJqEAwGBv/Gx3bLLx?=
 =?us-ascii?Q?f7fQg8WC9x81G3mOPOQtdLuvtPor?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5674.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7ow2XheCRNo3RFP3gCUWMQNjHoe5tz1fVTha4Ia+gDIDQIJ/h3e/ilQS1wuD?=
 =?us-ascii?Q?zhzcZk7Lcwxj8qJw9RPjVrNN2sqSYf+yTOk5fPpNYw1R1aQsMufFG0gDZ3r5?=
 =?us-ascii?Q?bbRwaatr4SZx95JEEHOfUys52vXyKxFhHX5j9G3tQRtPqRB1bnAhQp9nL4h8?=
 =?us-ascii?Q?g0yIPUbmXF2/6Mle776KmYCLwdfcll5jEY/Rr5Uh9w0AKpMClut5ak6pp1SO?=
 =?us-ascii?Q?3pnrxMVYBtCAW1aM3EPPt3ZAyVp4ntxAtMGd4SSTnlatkYJZ+c//JIt4B0Rq?=
 =?us-ascii?Q?byPAJ67iBz3ytXwi9y+7xMI7WfuhVfPd3ty0HfYznlg+WMt85QfQrPvapPPW?=
 =?us-ascii?Q?ijGvgqrdS5eQqMBgmwO1gSbC+oAoLWt+ts5ur0lhNEKqq0Do21pd6QwoNvYq?=
 =?us-ascii?Q?SME1nqZI9eh1AFbJ4IHiIsyIIxEsO6R3KMCoUyYzIT6JQdE3rAmBO2mcvF6H?=
 =?us-ascii?Q?rQnVEtL2mLWBGLkPu2sl6UDPNjaOwWRqgFh7suYm4+R7oVQozRK7a4HZLewT?=
 =?us-ascii?Q?afOeYa+nDAZmSNwFUZ9wnwsDhqJdip+/RBVTUtt+TlV0CJYzc7qewrzAH7Hk?=
 =?us-ascii?Q?ufhsS47I777ZPeDOlntXYS9PrK4uRxGBhoVsVqKCG0b8Rl3eHDKvJbbIGJbV?=
 =?us-ascii?Q?nMZXUC9T/Gq2oD9lTHr2lN/liNtrNcBf3D04jNsbV/ToWHWM+CpGgoLpZPbj?=
 =?us-ascii?Q?SiBMxq6IqP5jEA9MQFNPu5SEjJjhHi73qp5i4Cpwe230yTkTxH1kjSBJ2C2N?=
 =?us-ascii?Q?mgyk98WhJR04d0yy3a1juNOo5HBMVRco/484ztErUG8QLPJlzZ2Jq8GBNVhW?=
 =?us-ascii?Q?PBWTPZozTGFcMAys0AZKuzbGK65p9wG74iX5wi4lruK/8/FfoN6IOlgrZzyx?=
 =?us-ascii?Q?KtdwIjYEDAq9SrDn3SBoqftDbp9Ht1JMwEUGv5AKvO2Kft835KxcSBpRffNV?=
 =?us-ascii?Q?uR++cxH3VKQsASFBMsIRiyc2d5uaRnO/IntUGUTpW40kFrWQ8JHiQCmeUfdK?=
 =?us-ascii?Q?14q+8PFZuZm3PWNUUEFug4w7dYZxJnOcvgP1LZbPncaWkl0a2WgbP2cRW4GS?=
 =?us-ascii?Q?Ohyskp4NWVOnpIyES3HsWQ03qhuQGzd+MXAL3VByS4iXBaMdRDsSiuMzSB9X?=
 =?us-ascii?Q?XV/5PB2Nxb+afKwwOEO2soO7vzDLDIqZPuwKIUgUZZ+VJB70UiUYFUFJmHc7?=
 =?us-ascii?Q?otEVCHRDYyyt5fKv1Empb5NtalcWAHXoKs/MTGwbHEVcTaJ/Fck0JOVimRvD?=
 =?us-ascii?Q?aiv+WC+O/aIjRWjcq4DT94wgQyFLLunpbexzNm4SZu0KSB0fvmdRMJFx1NWz?=
 =?us-ascii?Q?zG/XfKk0ekSxG7EXdeJMs8KlbTeI8o0hqakc0oFG7yPU1vofy4oAF6UU9V62?=
 =?us-ascii?Q?Foa5UWZVlp4r52DXVaCAq50ff6X2vVBvLc8lq0Yl/xgcEvhnj6NPYQDOmQjP?=
 =?us-ascii?Q?jrY0lcXOPV+UXiYG7nP40X+TqIGdJzLx39Nxe59CoY1IlWiAzi5k+H+zkyfb?=
 =?us-ascii?Q?vu1fX7/J1Q37+Y+x8bwM2XOBYrRFwN2rOL99yvbX7HiwIM39RiqYp3fuxagI?=
 =?us-ascii?Q?rMaXbV2HuigpU33dHYg8rF3AQJG7yikU+ExcCkQa?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 81ad1a5c-cc08-47e1-c268-08dda6f23939
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5674.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 01:09:03.5064
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kL3hjoqaqQSRyh0nPG1yeUSrT0ru4lR+HrB6Kb4xHuNGDCDPGC0GDQkq4U9xztJC0+ZUdXQZ05HQa5NoAFG2eA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6711
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
head:   8172857ac52869c411762ce86802d127b0bb7546
commit: 54594582aa30a31c2596575729000f0a60b0a648 [29/32] compiler_types: remove unnecessary indirection in compiletime_assert()
:::::: branch date: 17 hours ago
:::::: commit date: 17 hours ago
config: arc-randconfig-002-20250609 (https://download.01.org/0day-ci/archive/20250609/202506090419.A0G5I2FK-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250609/202506090419.A0G5I2FK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202506090419.A0G5I2FK-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   arch/arc/mm/highmem.c: In function 'kmap_init':
>> include/linux/compiler_types.h:565:39: error: call to '__compiletime_assert___COUNTER__' declared with attribute error: BUILD_BUG_ON failed: FIX_KMAP_SLOTS > PTRS_PER_PTE
     565 |  __compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                       ^
   include/linux/compiler_types.h:549:4: note: in definition of macro '__compiletime_assert'
     549 |    prefix ## suffix();    \
         |    ^~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:2: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |  BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |  ^~~~~~~~~~~~~~~~
   arch/arc/mm/highmem.c:69:2: note: in expansion of macro 'BUILD_BUG_ON'
      69 |  BUILD_BUG_ON(FIX_KMAP_SLOTS > PTRS_PER_PTE);
         |  ^~~~~~~~~~~~


vim +/__compiletime_assert___COUNTER__ +565 include/linux/compiler_types.h

eb5c2d4b45e3d2 Will Deacon 2020-07-21  554  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  555  /**
eb5c2d4b45e3d2 Will Deacon 2020-07-21  556   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  557   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2 Will Deacon 2020-07-21  558   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  559   *
eb5c2d4b45e3d2 Will Deacon 2020-07-21  560   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  561   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  562   * compiler has support to do so.
eb5c2d4b45e3d2 Will Deacon 2020-07-21  563   */
eb5c2d4b45e3d2 Will Deacon 2020-07-21  564  #define compiletime_assert(condition, msg) \
54594582aa30a3 Tal Zussman 2025-06-07 @565  	__compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  566  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

