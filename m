Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA9A1BA50
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Apr 2024 03:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712718571; cv=fail; b=gc6TmA2OJERoS2qF+sKI57pMmf/D5+wLcVhZBqQLEZHIinn4RYGkSyb2U2EnMPHiAC7YxPGMoTOeO1b7OUbU0nnDW/xG1KNA/w/IiuCC1ykXKYNdqBxZOFmT2kFWdIfQM5S7tmeU7U6HM18QZ8XT1JDadeAn85zAz7go+ORQyfs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712718571; c=relaxed/simple;
	bh=9HxuzIThVLA0o+Oqiv9dqcIfFiiR3AXMDV8Q8ChWXC4=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=n8V2Lgnv10b+lVcTcRsbH5rmvfN9UuMVFvZfP48zg+FQO40ASb09+rUyMBVwVE6F9k3nMrW4hBq98SvCEy6GpI4ysX9dFe6qK/jbL/A4WwY7vVCdc8EP5PQ0W0rF0OnOt08S1vzrPyj1xBIn5TVjdd1Ab4YDtU87dI8GDE+nvFY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=igxY2viD; arc=fail smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="igxY2viD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712718569; x=1744254569;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=9HxuzIThVLA0o+Oqiv9dqcIfFiiR3AXMDV8Q8ChWXC4=;
  b=igxY2viDV6Y+ewbZf84QhcpQNTZ827ZhEXdmdFIC0Bm9tQHBd/DZLbPK
   KIAFokUAOYtwYgBrZljDhXOsQxdpgkfLGjx5I0w2icsDZrJgPwFC5/w6R
   PbpzNSxiOoSZDd+dWHQectZzlXQ4JSMQpxKOIcNanxyz/SyUUjNhUoaX1
   EsU+KrqOMlxnWL6QT8XvV4sZXB8fGtImJCzLLCSTXlubm1FE0uOrJFCMg
   Lqr4CPwL7sMYMdOwySxrdg5GX6M2da8YsS/gXflC+WOlrYN5rH1owdzlD
   ZUh851hb7j5A02IEvhSbCYI1umMdP7qmWk/M8l5a6VIxaKP0WCskhB2Wy
   A==;
X-CSE-ConnectionGUID: aCwr6mZ7Qain5tBPjxjO6A==
X-CSE-MsgGUID: iFJN/8tpSvGTCeoySmSZoA==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="25567612"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="25567612"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2024 20:09:28 -0700
X-CSE-ConnectionGUID: yCppby+mTj6Pa7NqTg2cYQ==
X-CSE-MsgGUID: NGAlSyW0SbK2WViL+0f1tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="20489304"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 09 Apr 2024 20:09:28 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 9 Apr 2024 20:09:27 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 9 Apr 2024 20:09:27 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 9 Apr 2024 20:09:27 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 9 Apr 2024 20:08:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lyTdb2g0013IxamAu5cCGwE2WeShdfLtvZzexYJuIrTuyinufOcfpHLphHI2DtqbSWaMLuILofPXiwqT/e2hr6hG1yEDrD44pp4NdOqQ6WFtZdFkJHKLKOsc3JPW0YMtQun9EA1BZ/tvLX33WhggXHT0hidRLoHpN+wsnbYWOmNPl2r4WTCnXIUkVcuSTNVqftvla0K+qAHuiVTTa4ZTeAZlZvJsEZaUqIRtH2mPU9vTIKjZjJExRoUFPraE6X5ObsQ1q2IHaWj+3CKmHCdx0rOFj/FxZgDcfjS/gTQUVMeh/cH8pqR1el6XDylJuEp0KINIXTY5htAs3eaVJ5SnPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jgFwUbxIEh5cjgLMcE0sXmHEQUe7anEKdDguYSUpZVg=;
 b=gKE7uz/CcDQw/gPuexSIABEI+Shq4rH0c9yNs55JfIOlKYKwS78/Q7JSaG0iEep/ybSLQkrWjxpMNS9r4/7dmNG7jNQwd7MOUqocBN4xdHVRalGXtIFxjskZkQ0mQWVxHXEj1M6zUXwMSB+hN/MoI2su3FHhCrvWLRVQ6sdNW1jFoe9CqNr5CMbWpbZGUvLXOfVku2YPCH/IeTWblas3IPHKBTePBP567n/5jzV1WHao1RhYBdowRGTW6K/8idw0/+L0Omt7wVbcO3gcMXb9SzSd5qAs3jE8KyRbb8jbZJsORzH6KKGvOmfZUxfs2kb/wQhqewQRB3xZPpTCBwTAYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB8393.namprd11.prod.outlook.com (2603:10b6:806:373::21)
 by SA1PR11MB6990.namprd11.prod.outlook.com (2603:10b6:806:2b9::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.18; Wed, 10 Apr
 2024 03:08:34 +0000
Received: from SA1PR11MB8393.namprd11.prod.outlook.com
 ([fe80::c0cf:689c:129c:4bcd]) by SA1PR11MB8393.namprd11.prod.outlook.com
 ([fe80::c0cf:689c:129c:4bcd%6]) with mapi id 15.20.7452.019; Wed, 10 Apr 2024
 03:08:30 +0000
Date: Wed, 10 Apr 2024 11:01:53 +0800
From: Yujie Liu <yujie.liu@intel.com>
To: Peter Xu <peterx@redhat.com>
CC: kernel test robot <lkp@intel.com>, <oe-kbuild-all@lists.linux.dev>, "Linux
 Memory Management List" <linux-mm@kvack.org>, Andrew Morton
	<akpm@linux-foundation.org>, Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [linux-next:master 3442/4242] WARNING: modpost: vmlinux: section
 mismatch in reference: (unknown)+0x1270 (section: __ex_table) -> .LASF0
 (section: .debug_str)
Message-ID: <ZhYBIW8yGiqLUI8v@yujie-X299>
References: <202404081248.FE1RbA1V-lkp@intel.com>
 <ZhQcC9B3SDKyYWtl@x1n>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZhQcC9B3SDKyYWtl@x1n>
X-ClientProxiedBy: SI2PR02CA0043.apcprd02.prod.outlook.com
 (2603:1096:4:196::12) To SA1PR11MB8393.namprd11.prod.outlook.com
 (2603:10b6:806:373::21)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB8393:EE_|SA1PR11MB6990:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: p6bAtt0P9qFRkCgvFhcmrkGvi+VDNiwEBWBh059WcySzcNRiQZrPieQJdqFGNF4/4EduXhuqD9QJ/PFyDikScOb8Tus7GiVX2GRjslWgzfaVB1o77l7lp2e7DoSAQrk5ZUIFlTjT1sZGKMyBXipYf79OxgKyM9g37ClxG+Lf51nQdZKq3ClQ+ZJdDnWn5tym5256uQBMjIDID6P4Ag0JZL+wKaqK/5kt+cCJGUn7SkaXsRIu0JzpTX+uiaMhbbQCEhrT9YDLuA47gvLpqgoyADCmCfFSf6v9iBZlKnHPN5At7ipdgTKxe/spMrQSyqNwg4f2ZrFWdRNETbD9rQY5EpbGwyBSEIalPGFNd3WLmJ4AucdFfrQvS0pXyaFjO5s0bdFPeymKCn2ZQZs00jPLGcCvKUntFODpJ7/5SGWRGax3zxUmPimKFAvzb1ED2ztfkTkvbMlGsOjOlzDihtyCRpiWDD/mmvZgzQrqg8hbDCWRUht11PAY07lBSerlupP+t+2vYadBfBfXgEdKAQX5eGU9fOnHfc9dY2lZbygW8WQ2QKhzpQKMv7BNxiIhwkWd9dMcF4ea6gUYJ4HV9HFh9j/uH7zQBf9Adc8LwuhF3U0NW5LuxfA2ZmZIUlpF6wQs
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB8393.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VISMcM5qv4c++cogxTa9Y2QQ778FGvV2aD/BIGro0DF0gcRcAVw3Nh3iWU2f?=
 =?us-ascii?Q?1WivP217AeJJs1cpoQDIHs3LyWl/ZUBGO9Cki8l1/OiPDCifSdl62SfYySPZ?=
 =?us-ascii?Q?7Gws8fAQ8hM/4ypUWtFvUlwZ9LuyP7Vi6X0lGCC8judFwQVj2tHMfb1c4gCP?=
 =?us-ascii?Q?hQpNVEaAGkTBZfm9NjUPz9IJy0IIhy/584GqJCbeFPOcyOXw6E/c/aAKe1Kz?=
 =?us-ascii?Q?sX50PwoDloih/SyCDWMQO46WgAJrDjUwWZzawPssWieFiufMKIECGthLln+3?=
 =?us-ascii?Q?Q3Ek01ZpF4ZCE5+lPsJ4Jk2wlHQcs22FPHzocI2v5pF118RDf7T+j0bbCMPQ?=
 =?us-ascii?Q?HBzwzbCrFKloXcB25j4T8Cmeu7HNttVP0A9KJK8eJjTp8gh6Si99hmSpguz7?=
 =?us-ascii?Q?U9Vjw5vNTcNbcDtnrAddMu1a5xo00Zq7xfwRLH2GZe9dnUg6qz0HN8nRqi8G?=
 =?us-ascii?Q?mlE0ks/axQr/jfkE9BOMNjfZEwQogs1B1SRWj9s16981Uh27WNifk15xV6z7?=
 =?us-ascii?Q?BkEiGikGIyL1bwX6f1ipO5EPQocmlWfAVWqmlr5gpACCzd8I+i7G/EVEtHh2?=
 =?us-ascii?Q?eTKbz5/ugba5FGkqML/jASOZ+h4mgjugA/EMeZzbNSeo/XVw+LgdXMjTLKen?=
 =?us-ascii?Q?1B38CwxJBOzyHyJKpSldacGSKh692k9GkFnqeJRmOk+g15fVEyJ4OSdX4dHc?=
 =?us-ascii?Q?4mDAx06BnN8l+hhXEEYCpG/V2ikFQ+ReWJZcy8fQt2xdIE9kuPq1S0h80ozB?=
 =?us-ascii?Q?ExEcMx9cQH+bEMbQrXdznKfvOSb4UhH7ZeZRPpV2X5az0oOrKZDnYpxEKA8S?=
 =?us-ascii?Q?d/Q0my6NuV8yCIPxEE1tLnukXonGRkq1q8o/83GFIy/qyyOhZWBEgGjzL2kN?=
 =?us-ascii?Q?Ut2MPd7Xn84wzw7ryGTM1h5zUP9AFfDsJoonl7Ruq3A9kBXONoLy4YBQaFA+?=
 =?us-ascii?Q?vn5Me6ym6FbmW1ObCs979l30p8QHHgQZ+anGH+Qs23lwR7AIW3bp4J58sMGF?=
 =?us-ascii?Q?fDLP7hSAb8ze/DnN3IBAfFV1xQMhOfNEAwFax2RlKS5vcWO6OF+gQ57XzSpD?=
 =?us-ascii?Q?ZYrTXnbyWfUx8qYeSCzsC8hewcoBdu0y3gD11+9uMOzMzRSt+6IPneR99nDj?=
 =?us-ascii?Q?VvgWiDRm3Iu/h5gCy/qX/iOPuCOKVoWQ0nWVT+IXnfEENz71HJy+hpuGPDRT?=
 =?us-ascii?Q?+McpGcxNifgdlaelpoRfcAL79S5MNbuFhUlV7bhudNofe4jGzNW3yLSZrE7X?=
 =?us-ascii?Q?Ia9c8Ar0GIqEVqp0mtJIrE9mpB6t41czYtzQgzu3ldiC3qM9I1W+IaqBYfbe?=
 =?us-ascii?Q?RUWeInbjnwbGzMRZ6YJl14jV4ya2jd2QxZUUgIhXJ/mtu+/3Yp2dHBTnIgXe?=
 =?us-ascii?Q?suEYV7gkn2qzJ2A3IuahFKCrj7MojcjjIpfEJsiZFZ3Ibn0lPbowJXAG/jEf?=
 =?us-ascii?Q?bwPA3Bge9AD0v9Oli+RdM+kCVMA84xDIaY3oPMHFPTwZky4L9ULbgoU+v+h+?=
 =?us-ascii?Q?rlo53XDGssiM0KZ19Fuz9akBidDov19Wmc8ac8kFELsq104DIUqUojgHyFTk?=
 =?us-ascii?Q?SWH48pbHd+0D6bD6cxj8F06P0OXsV2RuO/xw9ZEr?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8eecf7f3-71ce-41d9-1b67-08dc590b7f64
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8393.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2024 03:08:29.9592
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XANfZP1g38hMwLD3dihrTYFiybIJ0RV6a6Ea15He9fpabbDt92y6cbzfEFohPZoulOKPANtMVbanWCqBlAkQBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6990
X-OriginatorOrg: intel.com

On Mon, Apr 08, 2024 at 12:32:11PM -0400, Peter Xu wrote:
> On Mon, Apr 08, 2024 at 12:53:19PM +0800, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> > head:   8568bb2ccc278f344e6ac44af6ed010a90aa88dc
> > commit: e79da3a55e4e7b60b2790b3402a1a6c19829e9ce [3442/4242] mm/gup: merge pXd huge mapping checks
> > config: riscv-buildonly-randconfig-r001-20230517 (https://download.01.org/0day-ci/archive/20240408/202404081248.FE1RbA1V-lkp@intel.com/config)
> > compiler: riscv32-linux-gcc (GCC) 13.2.0
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240408/202404081248.FE1RbA1V-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202404081248.FE1RbA1V-lkp@intel.com/
> 
> [...]
> 
> > ERROR: modpost: __ex_table+0x1258 references non-executable section '.rodata.str1.4'
> > WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x1260 (section: __ex_table) -> .LASF3592 (section: .debug_str)
> > ERROR: modpost: __ex_table+0x1260 references non-executable section '.debug_str'
> > WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x1264 (section: __ex_table) -> .LC59 (section: .rodata.str1.4)
> > ERROR: modpost: __ex_table+0x1264 references non-executable section '.rodata.str1.4'
> > WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x126c (section: __ex_table) -> .Ldebug_ranges0 (section: .debug_ranges)
> > ERROR: modpost: __ex_table+0x126c references non-executable section '.debug_ranges'
> > >> WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x1270 (section: __ex_table) -> .LASF0 (section: .debug_str)
> > ERROR: modpost: __ex_table+0x1270 references non-executable section '.debug_str'
> > >> WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x1278 (section: __ex_table) -> .LASF2 (section: .debug_str)
> > ERROR: modpost: __ex_table+0x1278 references non-executable section '.debug_str'
> > WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x127c (section: __ex_table) -> .LASF0 (section: .debug_str)
> > ERROR: modpost: __ex_table+0x127c references non-executable section '.debug_str'
> > WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x1284 (section: __ex_table) -> .LASF6 (section: .debug_str)
> > ERROR: modpost: __ex_table+0x1284 references non-executable section '.debug_str'
> > WARNING: modpost: vmlinux: section mismatch in reference: (unknown)+0x1288 (section: __ex_table) -> .LASF7 (section: .debug_str)
> 
> [...]
> 
> Hmm, this doesn't look like relevant to the small commit e79da3a55e4e7b..
> I'd guess this is an irrelevant error with the randconfig which lacks some
> sheer luck.  I'll ignore this one as of now, but anyone can correct me
> otherwise..

Sorry for the false report. The bot wrongly parsed the modpost warnings
and triggered wrong bisections. We will fix this bug as soon as possible.

Thanks,
Yujie
