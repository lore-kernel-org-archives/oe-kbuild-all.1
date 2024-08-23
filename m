Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F6DC347A2
	for <oe-kbuild-all@lists.linux.dev>; Fri, 23 Aug 2024 04:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724385790; cv=fail; b=oDf1OwbuokgOcH6uJyZv8XTZSQnQ3Ldsm3McISyHD0x4CxWOQvLyjNJNu05dup/8l3lPpZoNgzWy0wDaD01BtkkTYgmh2a8dQ0gA2kbDotbrWZ3QEiylWIPDA7XStb03C/N5i5fmriMxQqkZHw3BdzQlNMG2vqvPj7bo3R3ElsY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724385790; c=relaxed/simple;
	bh=ubh4aUGTi32kiAnvhd3CRzowcFRyjYQgCApQXEmingU=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=YiFrKs/AcVQvwKpOzHY5XKxJkkKKolYWLXZRlqo3exXRTV425AxX2l0Syv0n3H29R0PJWB9frU/yfpLOzLI6jyL/TLfjfmBSwBr2yx22uPGpZuxyQAloZaKxh0cxaZ7PkhpHNFi/E9q30PZ2kFWX5QXVLg6lVOviL7kBpZlgu94=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=llz/c3Uc; arc=fail smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="llz/c3Uc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724385788; x=1755921788;
  h=date:from:to:cc:subject:message-id:in-reply-to:
   mime-version;
  bh=ubh4aUGTi32kiAnvhd3CRzowcFRyjYQgCApQXEmingU=;
  b=llz/c3Uc51yUSZfFDsVLd2EqPHzUeDDLiahXuCKlO02dimBVR21rL/KY
   HaT5sIUTKKl1CwI6zkpQkAhJC7NyFC9MHTNpn2tvZsBZXUopBRz3E56ea
   gWfQ9IUVOIsY/uKwiaKCtnBtTh5BGkpydbxMAPtn4nZAatDg7mHkM8Sfa
   NSAdN1prpEjs9gDIftB4lFwW1ETIkdkL1empKhWm9blWVsVxkzPH6eIj4
   X5xjYo9nzMGuM94x0D7Y/QUOBpOKzTOhKGEk0HkXZlfOkH8B1osygn0S8
   X4XkWwAWExuRxOMIE++Ezh1X4kEL1lJIXfBdki5q8GjQjjtFo5aFOSrv4
   g==;
X-CSE-ConnectionGUID: oScoERlfSQ+eEg10OAHhQQ==
X-CSE-MsgGUID: nimlpRsoSmS4v56JXMpXWQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="23010060"
X-IronPort-AV: E=Sophos;i="6.10,169,1719903600"; 
   d="scan'208";a="23010060"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2024 21:02:17 -0700
X-CSE-ConnectionGUID: 6CjIRenFSh+HFEkT+epZaw==
X-CSE-MsgGUID: X0ZsClItRN6tUxJ/kMmVbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,169,1719903600"; 
   d="scan'208";a="92453719"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 22 Aug 2024 21:02:17 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 22 Aug 2024 21:02:17 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 22 Aug 2024 21:02:17 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.42) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 22 Aug 2024 21:02:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N/kr24rsW9AyMhuwXOPJEmVadMDpDPCV0S3Nc026C+u++HzJT0AjOPRUQdRFE9bVR6qDcZETtfGptJy3s7xnySuMuV8qgOGR4VyWO4HnJOL4G8ZLJVlldnbicn5sCN3vEQJ47hjx0x/a3PRKV+9Ncg7H6+Hr8OlT3MisYCljFwXPMCPflyPBrUO69pJPJpxSbrKCEqs2oApNNrOOR++HcAlu2eOOQfzK4rGqNRdZJf0o6QzXIQLOIU5KzLMA5Sd14sJE/AjbB/wtAaX+m954CxpjaTp5J0pXNnAJpEqOJ+InrpeUql2YVZCVdPq5b/4g0rRGCi7zM8FWTWZl/yTG+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zeim+/fs3z9Hxlws+7S30fJRbz8+LJmUFrp1u+1A2cg=;
 b=EURDcqn3JVkC1lixwMgwfZZmCuDC/IP+RVoGI01Rbndz1weFmN+mRVnz11qWbm233/QfsQmgunaI6x77nqTgJJ3a0dItcOOCA7jqIVk8TajWH/B/mQFWevM9YGk8P5VWkynvvwlwxFTlhsFUoMcFj98tnZDcSPu1PQdOqFJUycZ/pbymfaxKDJVz0avZYYgecF69+Rl1Yxgt5eKbjIOnIPLIvE/8yCY9HSOUeKeb74QSHnZK3nE1abvahBHwQ8raokhHi9AN9BXabbs7U8wcbJv19nZDW7XA6tBC5ZXJ1n7gRn+L9SFsDpj1O2X9/ubwUplaikyRSORdxaDCOxXbXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
 by SJ0PR11MB5183.namprd11.prod.outlook.com (2603:10b6:a03:2d9::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.19; Fri, 23 Aug
 2024 04:01:57 +0000
Received: from DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e]) by DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e%5]) with mapi id 15.20.7897.014; Fri, 23 Aug 2024
 04:01:57 +0000
Date: Fri, 23 Aug 2024 12:01:48 +0800
From: kernel test robot <lkp@intel.com>
To: Usama Arif <usamaarif642@gmail.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: Re: [PATCH v4 3/6] mm: selftest to verify zero-filled pages are
 mapped to zeropage
Message-ID: <ZsgJrDSVpvwTe06y@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240819023145.2415299-4-usamaarif642@gmail.com>
X-ClientProxiedBy: SG2PR04CA0162.apcprd04.prod.outlook.com (2603:1096:4::24)
 To DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5423:EE_|SJ0PR11MB5183:EE_
X-MS-Office365-Filtering-Correlation-Id: 319dd8c4-b612-4c86-fb3f-08dcc32854e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?R372VAP0rcJvRWCW6bYtJqMnWhRz4/nOslKooatCCB5A9gSCO07aA5QHLcsY?=
 =?us-ascii?Q?VC/Bqb3MFGPANGXXpLV6xzpxt3BsQO2nV0YKrlxEPreJ9+bMJlZDdCR3AGpC?=
 =?us-ascii?Q?/0hkB85Jqzj/DedDUnhBLssAGPQVPW7O9nCkI3olw/QNXyqEJROxFnb5MBBz?=
 =?us-ascii?Q?8rDVSFKmRUzk97hsmML2ctgrJ4wNUxyphXs0z3no94JkokJx0zcuQzcOE6CP?=
 =?us-ascii?Q?USTvbZSV+/4u6r5e3e2RXe7jbmGs9duHen1fdAuf4Lhr+mkwO8RxE9AWPiqE?=
 =?us-ascii?Q?JFG6FImSPrHQdMX87+MBjfRenhea7qOKNnqbNZOq8N+gSLEjSFQ2eWNwmzTY?=
 =?us-ascii?Q?ny+43Wo4zHDTdqsosBMDDy37NS12golocnCv3FUcBj2uL9hFgNSIuuG4fILy?=
 =?us-ascii?Q?EWA+NbFKlII77M9KUwEvd6VSb7GPP9u7RvH1yIPhYJClxlolr7l0DHkpRMTj?=
 =?us-ascii?Q?NOxbrqQiLIu8TH4EPGKRtgYP5+9dmD7HwNzqgobD9SjvvjNNftC8SthR+3Vv?=
 =?us-ascii?Q?WWnIbbr1wPaixkBS86HGkyKjgbBGmwJW7gFKZQ4UoBogWePoPuGbGaddFrmo?=
 =?us-ascii?Q?SIPt3TOSWnvfcQ1Cd8XCTXYbfVn3B9rFaS3JkChwXZ4raxHGeBDIyF81uoWH?=
 =?us-ascii?Q?nzmVxKo6fezntcn6C6MNub35L/W8tRJUrk34rViZiG+anca6audy5HvjTe6c?=
 =?us-ascii?Q?U9iQNu+X5qlNMXO7WwlEFqi6+Oxep4jWvYeIAFXPgYR5FuNvNyU6K24PzjRQ?=
 =?us-ascii?Q?xYZQbcqkUzPgybLpYZT4Y14TIOH1UuuLRJB31EZOH6UKTwi3bT0ipZTPbbcZ?=
 =?us-ascii?Q?f+Y57BA8AJYZNfbfxWp3qsWa7wD6Z3oEAAeQc+15DqYcKkYZeEbOM9Dw5lAV?=
 =?us-ascii?Q?0VZUGqCHVy3We2GrgaDJKgMdBelsHQgErIyI4asz9f9m1SI8vY1b08ot+Zo7?=
 =?us-ascii?Q?09KM/98bvaeE85wBgVIqmUWt8T2d0TZtKz7UiXKmLFsGgaj2uPQcmdIUvgON?=
 =?us-ascii?Q?kmMVr09yRFV66aU3WUpg2SwQbqnDoNTx2INqJZkjLBVASVDB6PZxj7M08J/b?=
 =?us-ascii?Q?eqfwxuKJH0RYR3HvWCWnL453Eo+3/YxblVSmujdIR9Bkr7q1RxbD0iPeJ2DT?=
 =?us-ascii?Q?x5S3ydVpgWxmJwuTMFGnFlIPvH6OrTAByuaJoqgT931muNWKRh2n6wnnjezF?=
 =?us-ascii?Q?yu/BcJadlXzSLOLxDGQ5gBRD5T6e2zTPvuBC9fYswZ6bsz74J/3Fa1ljWC1L?=
 =?us-ascii?Q?UjgvKpa6mVmsKGeMKrEGxIpuMrw2NF4ZNrgY9O7wUCO4CXNaC0CyL77Lo2HT?=
 =?us-ascii?Q?l0C+Rr1ij6Z5b0xrH/iyvw1m?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5423.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DutsHUkdo8OVdFOjKZK0ZVvvTnwm8rPVv34Hhx60PZiFje6HoLtWf4P1riWE?=
 =?us-ascii?Q?HPKPN14Zugnx4KASZLqkLNi9Bup7KKwYnSqEMNrlAFqN877tl35Ekt5zCsNH?=
 =?us-ascii?Q?3y0DscDQxT4VCE8FvL6buV3dMHiQ10XSwF/aPXfQAvYVuX6iMHNOwbs8Bszy?=
 =?us-ascii?Q?efBaASty9LCfMyz/8NTBwgZboX1t/CI1buxgvR6XbzcixLdnbMz5MHoyDmrC?=
 =?us-ascii?Q?uxrpBG4NDxyosAJdiUDTaNE0yPrPm3ZmNcDEqv6NAAmG9d9OqpYGpV8oSiLs?=
 =?us-ascii?Q?WfTypb8Vz2dPVsKzZCFee8K3DLR7t8b6zo7QE8GFDxPROBH1/Sqp9F0I2Vor?=
 =?us-ascii?Q?zUDVTFSN+qGnHvn86y3xxRfLYrFXaRjFSpe7w+uJejeV3lTKlai/BzPZOu+r?=
 =?us-ascii?Q?beKEdAi1jBh0ngHMqsbcukNYhvQTIn8H3AHLQ52rTFnlA2AuVgKsc0QNkYRB?=
 =?us-ascii?Q?qL2a7ncWXHrDxildvBZlUmNftJhk+MT8f5akA2pdJa6tyTYqm881X384CRhe?=
 =?us-ascii?Q?uO9DMfsK7tImpsVu5QMJ1+SzgmRpxXEx0dJtNOiwVCUlZDf//np8wZcnVhJ+?=
 =?us-ascii?Q?WfBIH7KGco2J9asjPnTdaEwlKNjkgYh1UrNEDqWfw3o4M905WWSmAkJbjgtm?=
 =?us-ascii?Q?ERhDdqzBj78UkNrqb0mjfsTYyxB4DJmFd4PX0mL+mpzCebduZ1yklIl7By/A?=
 =?us-ascii?Q?I3V1cdaiK0pBdTNAOz1WzkblaH5eBwWAwq0/CGhq7vEHOGLwkcUoaRCe5TTN?=
 =?us-ascii?Q?ZgQRnvdM6wfOqT6BtCYB5a1hWen7whbdioEHVBvTGGq4iEj/1crsTX5x16DL?=
 =?us-ascii?Q?aQ3/IdNvUvoVg1A96NDK1rdkOuZf11TKqc1VZ2pd+8aEO3HIA+gLDbyEYyut?=
 =?us-ascii?Q?CFgnNjC7kp9r+yuuCcqGeJjDUbv2idPPGYtoSGs51zAONHcHTmTNo8BzHIE/?=
 =?us-ascii?Q?V9TnoZCqi9P4Ty8krN5pkZB/yAHh8EkhEMRxn/aqMM/GqxCuUTWmW5oLgiPO?=
 =?us-ascii?Q?P8Zg82TTpM75M7yJRWsnRHzbCbnL5MFnzsbE1TkmUt4ylcK0TCQSo4EUcyHe?=
 =?us-ascii?Q?uigpwN3GATmevSX/Vr0Aj3D23R0b1kisRk05r3DvKBFtJWkKYpPtnAHwfR97?=
 =?us-ascii?Q?krMBb5W9VYcBOLusMu0oFGZqC6njcTX9JkTXYWLaqAp2XBzDRhwdCiVSDfgb?=
 =?us-ascii?Q?DGrCuDsd9VLgoiffZ807c7UbOCl8OmuGBa2jxh2ZuHo3fEwE5nah21w4t9oU?=
 =?us-ascii?Q?1U2iD4ghjDWASWt3wbJCoXYpWMyrsJY8IsWq41sTovL41Y9SugmpKI9Edw9S?=
 =?us-ascii?Q?8rvzxt3TcyEc8Hl7+fj03/kYouYr4FBUTczUl0BbP9dmSJ2z7ATsKL3Mw//h?=
 =?us-ascii?Q?fBSO27WH1VaTxZotNbtWo88B9lfpMtmMF1R1JBAs+rInv6NtagAWnt7vji3a?=
 =?us-ascii?Q?+GaKai/pqdnGM8hkB2l/ZVhj0biixKoc5FFKyKgzXbyviam8ymD4dmYUGBW0?=
 =?us-ascii?Q?31p8yYM0WwbH3eW4kUIb1KOJRSJqozQ1+w0bLURWaT0jNxPOgZYUrNIsi+0m?=
 =?us-ascii?Q?Nf3bRDaU9UkKK6peHytrKSHkFZiUwzlJ/VrwnEB7KMtT6UT3TECkBVZePrkp?=
 =?us-ascii?Q?ZA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 319dd8c4-b612-4c86-fb3f-08dcc32854e7
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5423.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2024 04:01:57.3121
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FcQZdg0bj0Rhhv1vXusKbQWENC7rJmF5P2WQZ+saG2YCrCQckdJd8zc8+kNZME0pch4LK3dlGqmHBgB0hSCIfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5183
X-OriginatorOrg: intel.com

Hi Usama,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Usama-Arif/mm-free-zapped-tail-pages-when-splitting-isolated-thp/20240819-103336
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20240819023145.2415299-4-usamaarif642%40gmail.com
patch subject: [PATCH v4 3/6] mm: selftest to verify zero-filled pages are mapped to zeropage
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240821/202408211408.L2BFUig9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408211408.L2BFUig9-lkp@intel.com/

All errors (new ones prefixed by >>):

>> vm_util.c:175:15: error: conflicting types for 'rss_anon'; have 'long unsigned int(void)'
     175 | unsigned long rss_anon(void)
         |               ^~~~~~~~
   In file included from vm_util.c:11:
   vm_util.h:42:10: note: previous declaration of 'rss_anon' with type 'uint64_t(void)' {aka 'long long unsigned int(void)'}
      42 | uint64_t rss_anon(void);
         |          ^~~~~~~~


vim +175 tools/testing/selftests/mm/vm_util.c

642bc52aed9c99e tools/testing/selftests/vm/vm_util.c Muhammad Usama Anjum 2022-04-28  174  
10bf5ecc7e9d437 tools/testing/selftests/mm/vm_util.c Alexander Zhu        2024-08-19 @175  unsigned long rss_anon(void)
10bf5ecc7e9d437 tools/testing/selftests/mm/vm_util.c Alexander Zhu        2024-08-19  176  {
10bf5ecc7e9d437 tools/testing/selftests/mm/vm_util.c Alexander Zhu        2024-08-19  177  	unsigned long rss_anon = 0;
10bf5ecc7e9d437 tools/testing/selftests/mm/vm_util.c Alexander Zhu        2024-08-19  178  	FILE *fp;
10bf5ecc7e9d437 tools/testing/selftests/mm/vm_util.c Alexander Zhu        2024-08-19  179  	char buffer[MAX_LINE_LENGTH];
10bf5ecc7e9d437 tools/testing/selftests/mm/vm_util.c Alexander Zhu        2024-08-19  180  
10bf5ecc7e9d437 tools/testing/selftests/mm/vm_util.c Alexander Zhu        2024-08-19  181  	fp = fopen(STATUS_FILE_PATH, "r");
10bf5ecc7e9d437 tools/testing/selftests/mm/vm_util.c Alexander Zhu        2024-08-19  182  	if (!fp)
10bf5ecc7e9d437 tools/testing/selftests/mm/vm_util.c Alexander Zhu        2024-08-19  183  		ksft_exit_fail_msg("%s: Failed to open file %s\n", __func__, STATUS_FILE_PATH);
10bf5ecc7e9d437 tools/testing/selftests/mm/vm_util.c Alexander Zhu        2024-08-19  184  
10bf5ecc7e9d437 tools/testing/selftests/mm/vm_util.c Alexander Zhu        2024-08-19  185  	if (!check_for_pattern(fp, "RssAnon:", buffer, sizeof(buffer)))
10bf5ecc7e9d437 tools/testing/selftests/mm/vm_util.c Alexander Zhu        2024-08-19  186  		goto err_out;
10bf5ecc7e9d437 tools/testing/selftests/mm/vm_util.c Alexander Zhu        2024-08-19  187  
10bf5ecc7e9d437 tools/testing/selftests/mm/vm_util.c Alexander Zhu        2024-08-19  188  	if (sscanf(buffer, "RssAnon:%10lu kB", &rss_anon) != 1)
10bf5ecc7e9d437 tools/testing/selftests/mm/vm_util.c Alexander Zhu        2024-08-19  189  		ksft_exit_fail_msg("Reading status error\n");
10bf5ecc7e9d437 tools/testing/selftests/mm/vm_util.c Alexander Zhu        2024-08-19  190  
10bf5ecc7e9d437 tools/testing/selftests/mm/vm_util.c Alexander Zhu        2024-08-19  191  err_out:
10bf5ecc7e9d437 tools/testing/selftests/mm/vm_util.c Alexander Zhu        2024-08-19  192  	fclose(fp);
10bf5ecc7e9d437 tools/testing/selftests/mm/vm_util.c Alexander Zhu        2024-08-19  193  	return rss_anon;
10bf5ecc7e9d437 tools/testing/selftests/mm/vm_util.c Alexander Zhu        2024-08-19  194  }
10bf5ecc7e9d437 tools/testing/selftests/mm/vm_util.c Alexander Zhu        2024-08-19  195  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

