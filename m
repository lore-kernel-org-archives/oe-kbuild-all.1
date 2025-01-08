Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 296C91537C8
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Jan 2025 06:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736316980; cv=fail; b=A8aynLjcE+21k0PFrS1i7a9uPrtWewf7IBGdSxVXL3lWZM365Q3TTqT9rFT2E/85gYZG3Sh8rJ+qeN5oGYn+FzT/FvfyQ1oKNEVM1/KNeiMndHARvcpA/FIqiymdyZIJBm9hlfyHPwpqAiD9fQieBQtRyQ3io5BqzFGSsfY/nt8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736316980; c=relaxed/simple;
	bh=9T71D+l8m2/WE9d417C6h9QJcgG2JU+7gbLCpMjJEKc=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=PqLs9/s8IKS3RxNz6LxwmyunfhUkZoeK26CSMhCrMib/byPdK7wZ1olP1mOvsqIi306wjlPy6pP3qVBBB7uUMWQz3uzwviziulzSDWeYbQXsWJzIag6N6cXCyNz7kdlZIJLNMVWjmIPcjplJQ5Cgg52cdjzCmMEeHJQoH+c7GKk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jo9fyGn2; arc=fail smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jo9fyGn2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736316978; x=1767852978;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9T71D+l8m2/WE9d417C6h9QJcgG2JU+7gbLCpMjJEKc=;
  b=jo9fyGn2Puk5Hj/0ucjHRBU3mMPwOHaOm7yaYzk+f+5NAOnx9fLDcKiU
   /7px5Nsh+ekVcDdY3ose1Cf53URnEslysTQrAlj7en7K7FYftHWWZlJHN
   mFYR+OLD4ae2HaffT/krOBZT1Pwvo6QTiGGqdV/6GcyT34yGdNgCOKP1x
   bqWfNLGak3PVmF3ewnHeWSMxcBOH2G6H+zJXafPJwfOMzn2/LtxjaQVqy
   zqSnyDHksOX1Kfshq2HVlLUkouxHQuwjWryyzbpW8Jx/8GMTrivcH+PcA
   oKUEF93G0w8lnYnJAEc58MJ43ZoNE5znIafCU3tRTfQF2PZc3GcZpS7kH
   Q==;
X-CSE-ConnectionGUID: J6sbnz4uQb6Y8jv+NQupYQ==
X-CSE-MsgGUID: PqiixhFhSamRPeGq6Ohptg==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="40295902"
X-IronPort-AV: E=Sophos;i="6.12,297,1728975600"; 
   d="scan'208";a="40295902"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2025 22:16:17 -0800
X-CSE-ConnectionGUID: 06+jnl4rRwKpsNrHjvSoTA==
X-CSE-MsgGUID: mIQvRHUZSGmyDdfOgWTCaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="140325010"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 07 Jan 2025 22:16:16 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 7 Jan 2025 22:16:08 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 7 Jan 2025 22:16:08 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 7 Jan 2025 22:16:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LcXMpezh3XN1kz3LneaukTqKrGsXTnm2caILQznmzLZPO/str6OeGPQ/SM5ghvhvg9QSMgVfC5Hiuq0IWvclmC3DaWdJj8iVJB6KETDqMPMsHC2RM8jrjpQIRxukSYMl9s7Bv4oU4sOPGIXMn9LRNLDSTfmcjbgVd00cXxZx7ByFAqcN7VplK1fxtbc/hh3HOCkxfYNGzr37S9ANgllGLHxcV9wlANU0flcIpQCvSg+kP2F0atiwnLFOzC/9JlZH7t+2GuTZ3UV5G7DR7JBsNzhRaPGIMNid66ENbDgqrSz1P5rIYCpL5+u1GgLB2c9IGYiYfhXTDLsUdUQw1+0b6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9eylZoUiZ9fkumkBcwl2I2wry8EIKYB8Vpebhigaeww=;
 b=Nc+Gb0p6CcTB0w1TV3eetPTNVB/JVRDeqdwI6G9F/uzOJeGKeT8SH5lqPVgbHh76N6cXz8IPFVFuQqn+HiVoBJOj8GTfvnnZ/zk5Xu29XnChMhcovry3ST8e+coxgJxY33ZuipTF5ZDfsFyOSYj/+UL+NfYrQ0AC4Gav37T9mfGbZjY1EopfHF5HJrfcbH3Ciq8GtclQ5fyoz71jqdXXoOJBciWCxEThAXQk4EtxDx8/gdv6NyOiTdyf1hNIO4sVQ9OXj63ZPuHihcvi8gPvMzaZ+nKXxW8ieAlPEDEtXmHEKGXyv1bF4CcAa/l5XP8gfHY+hOcw90ZAYTTMPxi7nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
 by DM4PR11MB6240.namprd11.prod.outlook.com (2603:10b6:8:a6::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8335.11; Wed, 8 Jan 2025 06:15:48 +0000
Received: from DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e]) by DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e%6]) with mapi id 15.20.8335.010; Wed, 8 Jan 2025
 06:15:48 +0000
Date: Wed, 8 Jan 2025 14:15:40 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Bulwahn <lukas.bulwahn@redhat.com>
CC: <oe-kbuild-all@lists.linux.dev>, <devel@driverdev.osuosl.org>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>
Subject: [staging:staging-linus 11/11] (.text+0x4e8): multiple definition of
 `mite_dma_disarm'; drivers/comedi/drivers/mite.o:(.text+0x1c4): first
 defined here
Message-ID: <Z34YDLM4zmg4cMpU@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0163.apcprd04.prod.outlook.com (2603:1096:4::25)
 To DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5423:EE_|DM4PR11MB6240:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b5e5c42-3a47-489f-1c80-08dd2fabe4cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+EdDs6LEVovhWaN+kpUiF0cU0Jukj9W7NHA8scfrLr0YIoY1+rvsD68xEQ4N?=
 =?us-ascii?Q?qWGNpuNMthBrb5+7n+1MmObPdEBbPagTCfzqANzQhhX5GmoTieT2fgPtqAs0?=
 =?us-ascii?Q?ll/U8eHIf0wA6ACez1FQ8c93McFQuozTO1A5v2bHP05JiUFXF3oRo+h0S/Jg?=
 =?us-ascii?Q?+ZqvBE2G64ox/05lEh/nRDzfx3pTYODZ9ddhmsxwaHWg2jPEr0snXLmbq6Yy?=
 =?us-ascii?Q?iBG4Vmwnm1VBmx+1wDSc1pQE+pXJ0/mxtuIB5zNVDsQK2clIUkpFlj7Kbja4?=
 =?us-ascii?Q?Ke2HKQv9Y9r5CFKJw1CfIh7TZg9jXTAG0sxl+7u4JPqDGsy9e2g2eRWxxMnG?=
 =?us-ascii?Q?5/wh8EhAr0L87tNWrBo2qQGLuRDAn/fmxcTF9GhOqenAJmv0oe3ebbdl/6Wu?=
 =?us-ascii?Q?6Pphv///rEhLwN6FRbGmrhXAiHG4h+o0hN56Nx9jGfHblKKnV8LR2Lt/0qWY?=
 =?us-ascii?Q?510xhgdgFQArfF2wPbNGLW1nbAMFY33gixuHK61k1zBym5JZU7UqoKcHAZ+L?=
 =?us-ascii?Q?9OW12OO8ROra+e0oA5wRERu15Sq0f/sf6ICO1AzziZPJBe/bBwiYDR107f+J?=
 =?us-ascii?Q?5s7gm6axwtzp9+1Bc9Zkc12+V1uR/N1FdS1v9gBv3xxfpWHCk7De8RpiomT4?=
 =?us-ascii?Q?QiEXLu6G1OIqxFx/JL6Su447BSWi/uJl9IdZzWnrWAuWhbATfMBeTqfNh2rU?=
 =?us-ascii?Q?SluJ8S8Wcm+aRs25c8XVZ32TuhzV0ezUeMDnKAAute+/oNPsYaLmo8vRbUbJ?=
 =?us-ascii?Q?Kat4xONgdcICLMET2dunVNbq4Jc1vTcH7FBhg7JhadWSsIrDNu2N69X4RU5I?=
 =?us-ascii?Q?U2Lk0j5mhmyzAyAD3dyLUptJq4cqzzdhMpGMkmcZR8Le8fKXHBqkzw7sZQds?=
 =?us-ascii?Q?3ba7aF3KsFjOpXKwl4b3/vYzOwEU74Ewlz/Got5LHeLa4m2SXgGYiehbagAU?=
 =?us-ascii?Q?hfq1+FZq2XH+YiGhOZJHL115r2AmhlBpLUlWX67159AbLYEViPHPKLCWQTda?=
 =?us-ascii?Q?v4rWcHCzKcCJ2WBq9stHk6kU00p/fVlm1y1tnq0AcYakF1N+nbwSc0dwYKYr?=
 =?us-ascii?Q?JoJTHuQbGSq55mACP4q/TI6SA4yyj8C/Qa7tAGAVr7SrIdVf6hunqwE8wlyy?=
 =?us-ascii?Q?VgGxMlARW7D0n2aTB45qamNBbfwTbUjDS2aip87FMLy7OwU1zJ7NokB93BML?=
 =?us-ascii?Q?3Q2wxFoVDNetFrocrzuuVF5PlVWjFX4l5gIKLEhK2Basohg5Pvlxj9T/BtLk?=
 =?us-ascii?Q?zO5ds1Weie6C2u3265ySLEZqmKOpIG7+G7bmjlamDgNr+0MjB6OG7QKoB+tr?=
 =?us-ascii?Q?III3nMZjTt4WE3vH9fR5WAERgZqb65m2LRBnV/yKtLg0yw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5423.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?h0YAiUvjfp2J/gnz8C9fZWRo1T/w/o/u7ir8tivUsovztPUDSBUP9Kb6i3J2?=
 =?us-ascii?Q?jFbbp7aToOoBDUj7IXTzXSW04C/08/3kXfZtvTXlU6ic3+vG9Q+zjtFPSUs8?=
 =?us-ascii?Q?3/v7vhr+oV4C9e7/HM9Pq9x6iYde7bwH5m/y1P9nOmZlrEs0mFk1517dP7IY?=
 =?us-ascii?Q?Vs3ZAWFVLI1hhtQ+NwXkFjXKW3gE49h2quFYzR5qb1wTRPoY/jQTqDHiHbHW?=
 =?us-ascii?Q?/VgfFa0Bf7qvixZxT92kceErhddWV2Me0LuviU23ps9nh5PHWDpwZ0UYi3Ok?=
 =?us-ascii?Q?kQJjkfjlk9Ohl4IkATDajIs4U9dyuEdb9XfquMjlBo2lTIL16ux+6gDqsBWI?=
 =?us-ascii?Q?uvLyLdbhxDzXKCweApABvGh/RgILt5cKGdfhE7CrJAGxo9OD5YhLChU+K5K/?=
 =?us-ascii?Q?H9GO8zVG04DpaR9o6KpzRoUGaXJG8areSY9y+SidD7/jGgEJgd2sDqvCwqwe?=
 =?us-ascii?Q?IhXWUlJovBYf+gKaYK9wkrRDKfcpmWTDB6xovtm6RfPKgrlqQellh30znPux?=
 =?us-ascii?Q?yvb5114kiNo5+nU1QeCG0BikSIM4k/KPu5pFmRhYsnsB12bug6Z7gwPmrJ9Z?=
 =?us-ascii?Q?H9gYdd7atcAE1qk7xlpmTlOXccgcon2nNNGYxNY1oZyji9flXTzjsTB04LQU?=
 =?us-ascii?Q?mplWsTX2Rb9eQUNC2crYg47E1DZjwW9RFouE8Wv61BuSwsEmJpXAQGLxc9OA?=
 =?us-ascii?Q?XedVJa/tc/uZIl10/hIqU096NJZj1+Wb22amwc0zm/LLxyOy7A+7j+Dq1Pc6?=
 =?us-ascii?Q?HxbNMAVVXrAcrNdWmBwRyg411bec2joHgmyPotOEantqolzWXsLCvAzvA3tN?=
 =?us-ascii?Q?XXmy5BNQ9abmIUTew9AuEIcEpA1XRZUrIoEP/NXD6nWuamWZn20KZPCZQDS9?=
 =?us-ascii?Q?lC+T1zn+Ki1uo7jWgZHBJi3fIA7+xSMH2LCTlSjJqILdqFRjCtMZkgEuSwBe?=
 =?us-ascii?Q?BA4vD7UyCnejfyhQ2QXE7SW15LIIYBXPiEPXQ8LnxZmuOCyz9X7ojBnjGScs?=
 =?us-ascii?Q?f1B1CjJjDtzgG3ZAN1Jv4/nTnzvKxQtX2ANOSNNiUHiDVVk52GJO0xsG2gm4?=
 =?us-ascii?Q?DQoC5dcrMPAFkGqRtem+Wb2lAL5pUDxx9Swm+9bnjIN2m78Vcx+kn4mG6zpe?=
 =?us-ascii?Q?I/DEwKuBfth/+ud1THuo1NyTskv9VY9rKapAdepBVpzpPq3iEO15lA0HqGqw?=
 =?us-ascii?Q?CgjK9VVve3e7ZL9RjVnABkviQtFvvO2JCyLaud6mfjcVldFQK1pXAtF23ER4?=
 =?us-ascii?Q?8qlOgJ6hXCoAE3qMyWmmeOvKZA4oR3zMLJGT3kvhWf2gvs4WKkSCDZ1j+6sd?=
 =?us-ascii?Q?M/ySfg54YRVYl0UbIfSzlE8oaKwoaGf/vnOwLqsAzz0P/riNXfiZahT4wqMp?=
 =?us-ascii?Q?/luKTLZL7kv8NA3dB8sJ69BU7ExhPfRYAqovq9IIo3YJparZoJKAusT2rOCn?=
 =?us-ascii?Q?5MBSGpNWVDEU0TFy5KAQYIIRTpIW8Rlxki7Si5i4eYAEjJ8XvTw6nz7YrDS5?=
 =?us-ascii?Q?6O2MSDsXNHfC1rGnG84yuuRx0gbgMWRuw47HstQyvbbZhh0q2YKkjpAdmypu?=
 =?us-ascii?Q?G2EROXOVHwgJKT1qWtfSa4YRwJx/CscdgTz3NrwroAFIQCBdi7Ts7uO0Wtxx?=
 =?us-ascii?Q?oQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b5e5c42-3a47-489f-1c80-08dd2fabe4cd
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5423.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2025 06:15:48.2847
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tio40WGjxjnnKKM8xJdXoDkU6Uynf6p792zcdtaZFgq4kwE/ZbBUIJ/cfb8ziSgVdaSGIRRDTe9zvIpRqj4Bow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6240
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git staging-linus
head:   84b172cea4a23016dc80a44eaa7ff8b7c97b04b3
commit: 84b172cea4a23016dc80a44eaa7ff8b7c97b04b3 [11/11] staging: gpib: refer to correct config symbol in tnt4882 Makefile
:::::: branch date: 14 hours ago
:::::: commit date: 14 hours ago
config: parisc-allyesconfig (https://download.01.org/0day-ci/archive/20250108/202501081239.BAPhfAHJ-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250108/202501081239.BAPhfAHJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202501081239.BAPhfAHJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   hppa-linux-ld: drivers/staging/gpib/tnt4882/mite.o: in function `mite_dma_disarm':
>> (.text+0x4e8): multiple definition of `mite_dma_disarm'; drivers/comedi/drivers/mite.o:(.text+0x1c4): first defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

