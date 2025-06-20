Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5D3530E852
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Jun 2025 02:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750386178; cv=fail; b=RZO+IKB6adXhBpr4nFBAtea6w1Z1Yoocdp0AnspWQDyEZjRhMs10eRoII+L+JsIY5YKOUeua/mgBPMilYm+PYIslJ3vsDI+snmm8Kgal2K454W+2NjUcdFHO72veE9mYWreRdJZqdnqV6chOQKF7hUrhOBcwmTdUxUOZ9vA++QM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750386178; c=relaxed/simple;
	bh=X4kFAzUfnFo5lpA1HItdNAwZjVMUVZxreGfzrcfzkEs=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=eutWb6mpuqufz0FSM9SXcOMRn10+Ni5RcH43nRD8S12xR3tqwf59aCykgDoQYyOtkCtwrMFyAJpbI5VbQ/dRkwstlJyA3F++wweicER/sboRlVyh7w17zUd/NWSC6oZJDGlfLkVEQq+sKqtGl+bZk8upmbHqUb6VSb8az9ZCIrY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H4tGm+nQ; arc=fail smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H4tGm+nQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750386176; x=1781922176;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=X4kFAzUfnFo5lpA1HItdNAwZjVMUVZxreGfzrcfzkEs=;
  b=H4tGm+nQu5GZamxdoA60bh0daOTiHDtl1HI2KikOznA+1jxWihIfqfZD
   fZff29tWEDZU4JhiSIjXZeMYW5ebZQDnBDcsfBo5pMmSfP6r9A18IJyH0
   aXfPbuCrCVNGhZi/B3wNXAqYn8+fjXjRWwoaBLAOM0bztSAcWu9OXBaD7
   PLdGlLx0F1C8CHs/hT1Xsmb7QWYBzs56ZfEehpT9X6l79N3dFswrvVDw8
   +fWQQh5RoEUylTRIpdFPCRNBcwM+n0Y33+BRE8ZzvH/lxCpSfqr2cJs31
   SVoyOFHW8kn9f4EP0sLgUOaQuBmo/QezzdbI2oFBVSPeCWEqB0ikr9o8e
   w==;
X-CSE-ConnectionGUID: MHlsZZRSTaiz9jTdgKLrkw==
X-CSE-MsgGUID: h+tCz9mrQI6jGJPIRkvuug==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="63331731"
X-IronPort-AV: E=Sophos;i="6.16,250,1744095600"; 
   d="scan'208";a="63331731"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 19:22:55 -0700
X-CSE-ConnectionGUID: uwpg/8hvREmaIsxROG6jqg==
X-CSE-MsgGUID: 1RpiGnCyS5KGyyCzfttSaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,250,1744095600"; 
   d="scan'208";a="150919944"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 19:22:55 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 19 Jun 2025 19:22:54 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 19 Jun 2025 19:22:54 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.43)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 19 Jun 2025 19:22:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zNKtplMOpTQXo9Dfeuqhyij1UvbRXQeInUFCftsNlPNK2910/3R0jJ1VBeKwk0BgH2LqOVnM1vYCiYr4/hShdnSqMpVMdsgzNoctgwpKEj8S+ipwnpn5US6N8v2B2cpo8/ShXw6XTe5eUkDoVjSXNaFjzx3rNJP7NuYp5UStxFEvAx3IL6pQQUR4oVTDcehMY9S3hXPK6R5MuZUU4Y0mbLI3sXFoeBLxk+cIJZ3jF6s12hGthPplCw3XCqus1ynTjw387XrSrhTuk6suRHjvfoLVq/wi5cu97sLn5VQyL0VVjvVfHb0nArRMl7Y4JP4tc91IH2RP8RV6p7e26OtPUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nXmAv3oi89HoQDtIj5HvKWWi82xrvXcN9AvMKu3F+c4=;
 b=NJi4uTyfQZ4/BJ20lfWS0oVFjCPEKVOAsTIJNQYwuzHQ176mEpKIMDKttQmT69YErVYs8yR6+55MOTxzQjhkMh4iIWAC/fyfZyMCDTa1xIMMR03CyR4Fbmn1PDE2RsjiZ4B1SvKy2PAnoGBGeOq0wpiQFFyrSPC+YJnh6ENYpyFzocwBCdkCiZITiE6cIHFzPDsRvbTXGLoU/j6N6yQhmtuuOPjdUIfV1GwCt7xh7hzL3hqxPjc2ryhQJ/cHwUYXQus7zD36Kq0MK3n36M6/76Wv25Hp4TnzPr71UgzAfWRwzV7rQVgv0dutc8gwluEgJDJ7fuXfB4zfDEggxCQuyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5674.namprd11.prod.outlook.com (2603:10b6:510:ec::10)
 by PH7PR11MB8570.namprd11.prod.outlook.com (2603:10b6:510:2ff::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.38; Fri, 20 Jun
 2025 02:22:52 +0000
Received: from PH0PR11MB5674.namprd11.prod.outlook.com
 ([fe80::77d3:dfb2:3bd:e02a]) by PH0PR11MB5674.namprd11.prod.outlook.com
 ([fe80::77d3:dfb2:3bd:e02a%4]) with mapi id 15.20.8857.019; Fri, 20 Jun 2025
 02:22:52 +0000
Date: Fri, 20 Jun 2025 10:22:43 +0800
From: Philip Li <philip.li@intel.com>
To: "Zhijian Li (Fujitsu)" <lizhijian@fujitsu.com>
CC: kernel test robot <lkp@intel.com>, "oe-kbuild-all@lists.linux.dev"
	<oe-kbuild-all@lists.linux.dev>
Subject: Re: [PATCH RFC] mm: memory-tiering: Fix PGPROMOTE_CANDIDATE
 accounting
Message-ID: <aFTF87VnF/kj3A5p@rli9-mobl>
References: <20250619075245.3272384-1-lizhijian@fujitsu.com>
 <202506200524.r3rTtqLQ-lkp@intel.com>
 <2fd61ee3-2028-4a15-a574-f5f480f00bd9@fujitsu.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <2fd61ee3-2028-4a15-a574-f5f480f00bd9@fujitsu.com>
X-ClientProxiedBy: SG2PR04CA0159.apcprd04.prod.outlook.com (2603:1096:4::21)
 To PH0PR11MB5674.namprd11.prod.outlook.com (2603:10b6:510:ec::10)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5674:EE_|PH7PR11MB8570:EE_
X-MS-Office365-Filtering-Correlation-Id: b51fcd8d-9cbd-4c92-9e45-08ddafa15ba8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ltcF6pHqqzSG8K0ZimkXG+Ta4wz+0uK56IOM6svsVF5iN1lfFsfTo9jxnwpa?=
 =?us-ascii?Q?Bk1SMFPAftF8vtHsBNRWfR02ZSjrLHiWPgr/aCp9TpCRqAwjOnYXvF9Vt/++?=
 =?us-ascii?Q?Wukr5q2gVp5Ytti8Sd4il39Y910Z6PDpk627svmNEEeeIFe/ugRJ6ICHAmyC?=
 =?us-ascii?Q?fky5iqHdbstUgRGLfLFva6c6AbXTOl5KDmM7Grz+7DOvDvK8qKPqOPqHjI1T?=
 =?us-ascii?Q?ifU02vVpK8frtEZUvLkuLN8V0dkboactSi/ZL18AtpECNp3Y+uVeA1/hG+tD?=
 =?us-ascii?Q?WYK1QdUDB/GQZvfrOQ/Evy9mWPgjPovJILPAy2u5Nu2ctL/vYzHy4DKBI/5f?=
 =?us-ascii?Q?UhdaS6EwGNUyZC6KmsHxbKpNs2D60JPzYKOgBmh/soLEb+U51DwKvBWPM39j?=
 =?us-ascii?Q?f/LskTGpGO/m3f//jgVn2qM8lk2C5NYh0dG8Hx/i4u0GKUpmgIhfZr9WkeS0?=
 =?us-ascii?Q?yRZGvEigBqodU0Wq7jII12il3eK5YaitEh2MLoPDRb8IRsw4Ok399muLVJ2e?=
 =?us-ascii?Q?LG1XG2P+fBF9jd8GffQqLb1m0cueWCu+KvFjopU4yrRVJSruUQ5t5tLGZZaK?=
 =?us-ascii?Q?t1M9h6CDHl26f0HmX6zvw2/zwVffvrsRJIuzvhTGVjY6aOreKmCRfHeIKxeA?=
 =?us-ascii?Q?0QoKshWwP7zpAiNBx/7R/iF/H+wcFBz/P2ODyyWhmfoqzJVfy1YFW+UUgOyl?=
 =?us-ascii?Q?uewbAArwSKLpiEuzVdSJ97PhxMekXWGYWa82n9oVfZswTv+f6tR3EYapbk4N?=
 =?us-ascii?Q?kE6XXv0DQcFDWJEgqgKKBAiix8cbp57KmaAWwDrHnzcwHPWTvBjDK4Q2mRpn?=
 =?us-ascii?Q?yJumBAfAOKDvEf9WiwnjwejacjiHxdlVNn28IGFyRDfdIql5jryqCDpOyx+k?=
 =?us-ascii?Q?3QAs1Q5eBMEehvlUsl6dp1M9zHGvuKUN0yFSKaIbIrdf2+zd9ji9RADbFwjz?=
 =?us-ascii?Q?EQ7jSe1exsV0TGO5w0t26SS8vxobGSJFugkaiwRFCl4omGVr+SN3CqLQcAqk?=
 =?us-ascii?Q?xr+Pq48EFU1wI3pInYLs6iy8fKf6yjcfMmaw66DC248AG1d+sYER1BCSJJze?=
 =?us-ascii?Q?xCfgc/rbvJl7yYwUgaPb2c2AkGgaLLl41zYIeMhVSIBk5YLFyJ5GeTEzhqGO?=
 =?us-ascii?Q?27mvlNj2ETjz5KTEm8jj3IemWkXKOLBq+EtZ1Ip4UoT5BVEcNHOqiLvzeRZi?=
 =?us-ascii?Q?r00qYSGpHvV221j68C5Am8/KdJZuDuWxhPiHFz46f1G2ZfpJObmmSsmzKDUq?=
 =?us-ascii?Q?P2Uu4ibYqqHxKi4mQ0wnmcqEw9Y14zdg4Y5yRmGxfynNMd7THGJXImcwZugZ?=
 =?us-ascii?Q?ulcRWhlOsy5x4v/o+GiNMGQB9L3+6wHaFee3PQ+oIj6m1EOzj/sBuDmA7c1Z?=
 =?us-ascii?Q?7NWv/jfE1uILx7qYSLmpsXoy1o5R?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5674.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+FsacNpl0Vkd4gtDfhYRPk07x4r35+iDkwanRetghM5v0mojsdt+VqDhvXNX?=
 =?us-ascii?Q?HAUJ8JxQ3vUZTQoKvvXr2Y1YyJ7b0euHOK+8U/ZOKGnDYUAVeOWyHRDTSeT6?=
 =?us-ascii?Q?6NDtPyArh79J6jAp61PCbX3zx/tPDIGxEnJmoutP9uBmrtkKDbi6OS60p/uB?=
 =?us-ascii?Q?Y3IeEYQXSVqnA4ZvymIF7rGLZeMBZI5sI14ax563Y6e4otvy205lOXDr4mEW?=
 =?us-ascii?Q?8+GnpQKVJyQR8CnMnldk0l1/j5FeZvGODywbI6/2LZRBspT33iL/xS2z2sgk?=
 =?us-ascii?Q?GY80UnadqjJlYej23GEuY3ygcz6is0EMnGk1e20ONcVb2qdU+V3NJCR4fI3Q?=
 =?us-ascii?Q?7zh3echHSGh20IgxKI8OB/3wp0vtjbVrh6OJGGW/69bsFeoxvOJ0rKgL/W2I?=
 =?us-ascii?Q?AsTqowQNFc4uuKMNR9hD4JEg6u/3w7rTrjYjIioiURE3hLTF6sEyn3ZXI9Ng?=
 =?us-ascii?Q?my/LoAnBALHiHqbOX+FgWtGD1njmjsymEnI9l+w8OQx086kVKvdk4X6FjAXs?=
 =?us-ascii?Q?WJH9en0fwPNAYcAyA8yCOA9wSGSKVwr65M8RL0ISvhVNGJcM7KIvNtcTwPGz?=
 =?us-ascii?Q?GOt3QrJSzIZFX4buqyKHfLZiird9doiRXbgXVdLj1tnYoTRVFaW0VKhY+QVs?=
 =?us-ascii?Q?Mn6Pt3uT0ncnu6iqgUchHjNQ3xzrqWlF6uS1BlIFP4K1ou6t34l7MZSJA+6r?=
 =?us-ascii?Q?BEfh4+A6Ai70bqpU90Yff6yiGlFiEsS08lPp9abkZM2N9Ncz1MIiC0NqxpjI?=
 =?us-ascii?Q?dUv0Ej2Lh22huazl2faMuy8S318HNDbVWNCocxvD3Xgs3bheZJy+l7ip5xU7?=
 =?us-ascii?Q?Mzij96elJ2zlUT6OClDBxDQR80s8zgvgqzU+Ovv/vL/ItWdJhsAhhXGiyAq4?=
 =?us-ascii?Q?FrNwy5JgtZ1rsqdhVI+wtTAgb9yLED7ZGjIeVUqPxqpuv/NFglSAx0Wh+ORV?=
 =?us-ascii?Q?vZ3nvQDrfOq2e1sKC93JQDVNXHLzfa/n7kughA2EJgZ/WJlXNOJNoy8T3b/s?=
 =?us-ascii?Q?LKpF3SVR54GdqvhpDQ8mW46K0m4V2aLxgYaov7SiphrAXxLaTnx6OOiVAp4B?=
 =?us-ascii?Q?BROX29JUtyRxir+qkIxPUrA/qKBZHPQF0ugxP2fgmpHCaEm5vwpP6SHdZuye?=
 =?us-ascii?Q?NCqJxH4OzQXXacUHBTVgvpH6gQhb+cwu5sq5FOLlAIJdVni1sqy/TJiR9GFK?=
 =?us-ascii?Q?UfYYGgYs7ATORC6F8gPpYNtROCbdp4ck3Vzals51bCHuq87Z7s4PZSpOsgj0?=
 =?us-ascii?Q?kbP0yyWKZmJSHgVpt7xGV96qmm9PocvstPV/Q75yueDdd/6gR4Zb+hqjMs7a?=
 =?us-ascii?Q?/6hW6QvBTk1lZNDCW6W5cR6A+aYLL+SIMoe55stPL4ysTV9kjf6RUoe9CyG2?=
 =?us-ascii?Q?BwmIv8JisC/aa/hHV+6rZP4DU1QrQxAFHIhCQQB+CHZnJ0fV7aiJAv7Vj2AM?=
 =?us-ascii?Q?mNFnCTtymWfrTwhT1vxqW6WfcFp8lLw4oooHxWR9bb6bpNF5SbTC/mPeHs3Y?=
 =?us-ascii?Q?M/YSo4buEdijMU6My+Wmv6/xAR0fnl+Te22lb5PUyMjkCXgvl2siye/NxAGK?=
 =?us-ascii?Q?lLe7g0USejo4i8ZArIn0wqo8tWIsCOb3vUWWiG7e?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b51fcd8d-9cbd-4c92-9e45-08ddafa15ba8
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5674.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2025 02:22:52.1984
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XbeKK6HELt5D3mfjsp/mBhDbplitx9VMYzqMrvyNROsNBiFnSYuXiMIWy3k0z0TApMtZsCL0SxBWbfXpifk28w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8570
X-OriginatorOrg: intel.com

On Fri, Jun 20, 2025 at 02:04:46AM +0000, Zhijian Li (Fujitsu) wrote:
> Thanks for the report. I will update it.

hi Zhijian, you are welcome :)

> 
> 
> 
> On 20/06/2025 06:06, kernel test robot wrote:
> > Hi Li,
> > 
> > [This is a private test report for your RFC patch.]
> > kernel test robot noticed the following build errors:
> > 
> > [auto build test ERROR on akpm-mm/mm-everything]
> > 
> > url:    https://github.com/intel-lab-lkp/linux/commits/Li-Zhijian/mm-memory-tiering-Fix-PGPROMOTE_CANDIDATE-accounting/20250619-155351
> > base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
> > patch link:    https://lore.kernel.org/r/20250619075245.3272384-1-lizhijian%40fujitsu.com
> > patch subject: [PATCH RFC] mm: memory-tiering: Fix PGPROMOTE_CANDIDATE accounting
> > config: x86_64-buildonly-randconfig-005-20250620 (https://download.01.org/0day-ci/archive/20250620/202506200524.r3rTtqLQ-lkp@intel.com/config)
> > compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250620/202506200524.r3rTtqLQ-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202506200524.r3rTtqLQ-lkp@intel.com/
> > 
> > All errors (new ones prefixed by >>):
> > 
> >     kernel/sched/fair.c: In function 'should_numa_migrate_memory':
> >>> kernel/sched/fair.c:1945:17: error: expected ',' or ';' before 'pgdat'
> >      1945 |                 pgdat = NODE_DATA(dst_nid);
> >           |                 ^~~~~
> > 
> > 
> > vim +1945 kernel/sched/fair.c
> > 
> > c959924b0dc53b Ying Huang        2022-07-13  1921
> > 8c9ae56dc73b5a Kefeng Wang       2023-09-21  1922  bool should_numa_migrate_memory(struct task_struct *p, struct folio *folio,
> > 10f39042711ba2 Rik van Riel      2014-01-27  1923  				int src_nid, int dst_cpu)
> > 10f39042711ba2 Rik van Riel      2014-01-27  1924  {
> > cb361d8cdef699 Jann Horn         2019-07-16  1925  	struct numa_group *ng = deref_curr_numa_group(p);
> > 10f39042711ba2 Rik van Riel      2014-01-27  1926  	int dst_nid = cpu_to_node(dst_cpu);
> > 10f39042711ba2 Rik van Riel      2014-01-27  1927  	int last_cpupid, this_cpupid;
> > 10f39042711ba2 Rik van Riel      2014-01-27  1928
> > 3fb43636876d98 Byungchul Park    2024-02-19  1929  	/*
> > 3fb43636876d98 Byungchul Park    2024-02-19  1930  	 * Cannot migrate to memoryless nodes.
> > 3fb43636876d98 Byungchul Park    2024-02-19  1931  	 */
> > 3fb43636876d98 Byungchul Park    2024-02-19  1932  	if (!node_state(dst_nid, N_MEMORY))
> > 3fb43636876d98 Byungchul Park    2024-02-19  1933  		return false;
> > 3fb43636876d98 Byungchul Park    2024-02-19  1934
> > 33024536bafd91 Ying Huang        2022-07-13  1935  	/*
> > 33024536bafd91 Ying Huang        2022-07-13  1936  	 * The pages in slow memory node should be migrated according
> > 33024536bafd91 Ying Huang        2022-07-13  1937  	 * to hot/cold instead of private/shared.
> > 33024536bafd91 Ying Huang        2022-07-13  1938  	 */
> > 2a28713a67fd28 Zi Yan            2024-07-24  1939  	if (folio_use_access_time(folio)) {
> > 33024536bafd91 Ying Huang        2022-07-13  1940  		struct pglist_data *pgdat;
> > c959924b0dc53b Ying Huang        2022-07-13  1941  		unsigned long rate_limit;
> > c959924b0dc53b Ying Huang        2022-07-13  1942  		unsigned int latency, th, def_th;
> > 675e22ff5b390e Li Zhijian        2025-06-19  1943  		long nr = folio_nr_pages(folio)
> > 33024536bafd91 Ying Huang        2022-07-13  1944
> > 33024536bafd91 Ying Huang        2022-07-13 @1945  		pgdat = NODE_DATA(dst_nid);
> > c959924b0dc53b Ying Huang        2022-07-13  1946  		if (pgdat_free_space_enough(pgdat)) {
> > c959924b0dc53b Ying Huang        2022-07-13  1947  			/* workload changed, reset hot threshold */
> > c959924b0dc53b Ying Huang        2022-07-13  1948  			pgdat->nbp_threshold = 0;
> > 675e22ff5b390e Li Zhijian        2025-06-19  1949  			mod_node_page_state(pgdat, PGPROMOTE_CANDIDATE, nr);
> > 33024536bafd91 Ying Huang        2022-07-13  1950  			return true;
> > c959924b0dc53b Ying Huang        2022-07-13  1951  		}
> > 33024536bafd91 Ying Huang        2022-07-13  1952
> > c959924b0dc53b Ying Huang        2022-07-13  1953  		def_th = sysctl_numa_balancing_hot_threshold;
> > c959924b0dc53b Ying Huang        2022-07-13  1954  		rate_limit = sysctl_numa_balancing_promote_rate_limit << \
> > c959924b0dc53b Ying Huang        2022-07-13  1955  			(20 - PAGE_SHIFT);
> > c959924b0dc53b Ying Huang        2022-07-13  1956  		numa_promotion_adjust_threshold(pgdat, rate_limit, def_th);
> > c959924b0dc53b Ying Huang        2022-07-13  1957
> > c959924b0dc53b Ying Huang        2022-07-13  1958  		th = pgdat->nbp_threshold ? : def_th;
> > 8c9ae56dc73b5a Kefeng Wang       2023-09-21  1959  		latency = numa_hint_fault_latency(folio);
> > 33024536bafd91 Ying Huang        2022-07-13  1960  		if (latency >= th)
> > 33024536bafd91 Ying Huang        2022-07-13  1961  			return false;
> > 33024536bafd91 Ying Huang        2022-07-13  1962
> > 675e22ff5b390e Li Zhijian        2025-06-19  1963  		return !numa_promotion_rate_limit(pgdat, rate_limit, nr);
> > 33024536bafd91 Ying Huang        2022-07-13  1964  	}
> > 33024536bafd91 Ying Huang        2022-07-13  1965
> > 10f39042711ba2 Rik van Riel      2014-01-27  1966  	this_cpupid = cpu_pid_to_cpupid(dst_cpu, current->pid);
> > 1b143cc77f2074 Kefeng Wang       2023-10-18  1967  	last_cpupid = folio_xchg_last_cpupid(folio, this_cpupid);
> > 37355bdc5a1298 Mel Gorman        2018-10-01  1968
> > 33024536bafd91 Ying Huang        2022-07-13  1969  	if (!(sysctl_numa_balancing_mode & NUMA_BALANCING_MEMORY_TIERING) &&
> > 33024536bafd91 Ying Huang        2022-07-13  1970  	    !node_is_toptier(src_nid) && !cpupid_valid(last_cpupid))
> > 33024536bafd91 Ying Huang        2022-07-13  1971  		return false;
> > 33024536bafd91 Ying Huang        2022-07-13  1972
> > 37355bdc5a1298 Mel Gorman        2018-10-01  1973  	/*
> > 37355bdc5a1298 Mel Gorman        2018-10-01  1974  	 * Allow first faults or private faults to migrate immediately early in
> > 37355bdc5a1298 Mel Gorman        2018-10-01  1975  	 * the lifetime of a task. The magic number 4 is based on waiting for
> > 37355bdc5a1298 Mel Gorman        2018-10-01  1976  	 * two full passes of the "multi-stage node selection" test that is
> > 37355bdc5a1298 Mel Gorman        2018-10-01  1977  	 * executed below.
> > 37355bdc5a1298 Mel Gorman        2018-10-01  1978  	 */
> > 98fa15f34cb379 Anshuman Khandual 2019-03-05  1979  	if ((p->numa_preferred_nid == NUMA_NO_NODE || p->numa_scan_seq <= 4) &&
> > 37355bdc5a1298 Mel Gorman        2018-10-01  1980  	    (cpupid_pid_unset(last_cpupid) || cpupid_match_pid(p, last_cpupid)))
> > 37355bdc5a1298 Mel Gorman        2018-10-01  1981  		return true;
> > 10f39042711ba2 Rik van Riel      2014-01-27  1982
> > 10f39042711ba2 Rik van Riel      2014-01-27  1983  	/*
> > 10f39042711ba2 Rik van Riel      2014-01-27  1984  	 * Multi-stage node selection is used in conjunction with a periodic
> > 10f39042711ba2 Rik van Riel      2014-01-27  1985  	 * migration fault to build a temporal task<->page relation. By using
> > 10f39042711ba2 Rik van Riel      2014-01-27  1986  	 * a two-stage filter we remove short/unlikely relations.
> > 10f39042711ba2 Rik van Riel      2014-01-27  1987  	 *
> > 10f39042711ba2 Rik van Riel      2014-01-27  1988  	 * Using P(p) ~ n_p / n_t as per frequentist probability, we can equate
> > 10f39042711ba2 Rik van Riel      2014-01-27  1989  	 * a task's usage of a particular page (n_p) per total usage of this
> > 10f39042711ba2 Rik van Riel      2014-01-27  1990  	 * page (n_t) (in a given time-span) to a probability.
> > 10f39042711ba2 Rik van Riel      2014-01-27  1991  	 *
> > 10f39042711ba2 Rik van Riel      2014-01-27  1992  	 * Our periodic faults will sample this probability and getting the
> > 10f39042711ba2 Rik van Riel      2014-01-27  1993  	 * same result twice in a row, given these samples are fully
> > 10f39042711ba2 Rik van Riel      2014-01-27  1994  	 * independent, is then given by P(n)^2, provided our sample period
> > 10f39042711ba2 Rik van Riel      2014-01-27  1995  	 * is sufficiently short compared to the usage pattern.
> > 10f39042711ba2 Rik van Riel      2014-01-27  1996  	 *
> > 10f39042711ba2 Rik van Riel      2014-01-27  1997  	 * This quadric squishes small probabilities, making it less likely we
> > 10f39042711ba2 Rik van Riel      2014-01-27  1998  	 * act on an unlikely task<->page relation.
> > 10f39042711ba2 Rik van Riel      2014-01-27  1999  	 */
> > 10f39042711ba2 Rik van Riel      2014-01-27  2000  	if (!cpupid_pid_unset(last_cpupid) &&
> > 10f39042711ba2 Rik van Riel      2014-01-27  2001  				cpupid_to_nid(last_cpupid) != dst_nid)
> > 10f39042711ba2 Rik van Riel      2014-01-27  2002  		return false;
> > 10f39042711ba2 Rik van Riel      2014-01-27  2003
> > 10f39042711ba2 Rik van Riel      2014-01-27  2004  	/* Always allow migrate on private faults */
> > 10f39042711ba2 Rik van Riel      2014-01-27  2005  	if (cpupid_match_pid(p, last_cpupid))
> > 10f39042711ba2 Rik van Riel      2014-01-27  2006  		return true;
> > 10f39042711ba2 Rik van Riel      2014-01-27  2007
> > 10f39042711ba2 Rik van Riel      2014-01-27  2008  	/* A shared fault, but p->numa_group has not been set up yet. */
> > 10f39042711ba2 Rik van Riel      2014-01-27  2009  	if (!ng)
> > 10f39042711ba2 Rik van Riel      2014-01-27  2010  		return true;
> > 10f39042711ba2 Rik van Riel      2014-01-27  2011
> > 10f39042711ba2 Rik van Riel      2014-01-27  2012  	/*
> > 4142c3ebb685bb Rik van Riel      2016-01-25  2013  	 * Destination node is much more heavily used than the source
> > 4142c3ebb685bb Rik van Riel      2016-01-25  2014  	 * node? Allow migration.
> > 10f39042711ba2 Rik van Riel      2014-01-27  2015  	 */
> > 4142c3ebb685bb Rik van Riel      2016-01-25  2016  	if (group_faults_cpu(ng, dst_nid) > group_faults_cpu(ng, src_nid) *
> > 4142c3ebb685bb Rik van Riel      2016-01-25  2017  					ACTIVE_NODE_FRACTION)
> > 10f39042711ba2 Rik van Riel      2014-01-27  2018  		return true;
> > 10f39042711ba2 Rik van Riel      2014-01-27  2019
> > 10f39042711ba2 Rik van Riel      2014-01-27  2020  	/*
> > 4142c3ebb685bb Rik van Riel      2016-01-25  2021  	 * Distribute memory according to CPU & memory use on each node,
> > 4142c3ebb685bb Rik van Riel      2016-01-25  2022  	 * with 3/4 hysteresis to avoid unnecessary memory migrations:
> > 4142c3ebb685bb Rik van Riel      2016-01-25  2023  	 *
> > 4142c3ebb685bb Rik van Riel      2016-01-25  2024  	 * faults_cpu(dst)   3   faults_cpu(src)
> > 4142c3ebb685bb Rik van Riel      2016-01-25  2025  	 * --------------- * - > ---------------
> > 4142c3ebb685bb Rik van Riel      2016-01-25  2026  	 * faults_mem(dst)   4   faults_mem(src)
> > 10f39042711ba2 Rik van Riel      2014-01-27  2027  	 */
> > 4142c3ebb685bb Rik van Riel      2016-01-25  2028  	return group_faults_cpu(ng, dst_nid) * group_faults(p, src_nid) * 3 >
> > 4142c3ebb685bb Rik van Riel      2016-01-25  2029  	       group_faults_cpu(ng, src_nid) * group_faults(p, dst_nid) * 4;
> > 10f39042711ba2 Rik van Riel      2014-01-27  2030  }
> > 10f39042711ba2 Rik van Riel      2014-01-27  2031
> > 
