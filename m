Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5C281B86D6
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Jul 2024 02:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722219661; cv=fail; b=Jo4AnfRy810WauHnhsAm9HflYzNQNuqP955R6BNWsXXyKXlAPmMmNTaGEhCsu3xqrmZBbLMBWc9IGR3awXfc8wrHSkBkWrmmhuFfGrMWh9r3cn4x6Vk4Zyu5fLfzzmzCwU+cOiwXfWHWnfTljWohKPMQIc7YPTgUy9mRVqEM1DI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722219661; c=relaxed/simple;
	bh=B0x3ZpDnJLqdP0Zjs2j1LnX2ld+6+20/j9sl1scopD8=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=bZr8Lw8GT1hbnPsQx5vSraHQVssyb23EixktVc3he5sm4LRCQbVWQGx6tt9YQdosKH1J2B4LUMlt7X3J4H6P7WDtM3zJ0tSlQPxt5+NWYmz+3qjCV/36B1fLdygC1Y+7fwnzu2doaviO09iS+ze/lWho4e2lclJGAtnZbB/DADs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QwIOAW5E; arc=fail smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QwIOAW5E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722219660; x=1753755660;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=B0x3ZpDnJLqdP0Zjs2j1LnX2ld+6+20/j9sl1scopD8=;
  b=QwIOAW5EhTf7zMi8YYewxZCBwxWFXroGWv9lAlNyKsHi9bFKP0eZxaeV
   rRZsTzRXiI6AOvVQqVIkGP4s+BC9MLUCO7eecAzj6y3HZ09nh35nsWQ/6
   6kRaFB2yWEsrppPPu7i6Xr5MqPABGoSaGFb6BjZ5TBDRWZZDSov3tFytu
   eFe2MnGZbkOfgbqX6oZM4u7g0zAhH1EZaCyQ0fCYLUUNUA5y6jUdHuNbp
   L3RHNy+4lQC1EYFivl9SdLT4N2yYq5eHnh0eC19Gjg6R+7B5n3IbpJll9
   p9lZ0Og1FVwYSAD01c+95CTgmxjtFhAJAttydnLFRzbN0jZwUXntTziIF
   g==;
X-CSE-ConnectionGUID: yPSp/NDvQcmOWR8DnLacrg==
X-CSE-MsgGUID: otGeHiv5QPeL0FIRY4lRrw==
X-IronPort-AV: E=McAfee;i="6700,10204,11147"; a="19744559"
X-IronPort-AV: E=Sophos;i="6.09,245,1716274800"; 
   d="scan'208";a="19744559"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2024 19:21:00 -0700
X-CSE-ConnectionGUID: Qrp9X/xnSnuwBMD5vvY+Tw==
X-CSE-MsgGUID: JIQnBw4xRxKisPHj6ZUssA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,245,1716274800"; 
   d="scan'208";a="53785784"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 28 Jul 2024 19:21:00 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 28 Jul 2024 19:20:58 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sun, 28 Jul 2024 19:20:58 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sun, 28 Jul 2024 19:20:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KPhH8sgTzZCrnwvXQ42egOlC1hkq7z+3KlMXy3H2N78IMH9aR902pxlmZY3M1QHpKlvl/fNMNQ/1vL6h60WgN0CcN/bebhWpe2fyyyUULY9ze/PxtNNUtbimGo+/W44/JR/xvD0oNaF0kPP+9bTNklV61WPcemNPDQPsbYyOVowFCXwDOUy5x78gV+E1SyF1XSp0g0J7Pw7elpYTWmvGaHVBpdvEwkcT+iXP0U0erjggPY95o6HoMv6T5yVIZw1AH9VHGA03+hZIg5SrBP4+upH3j87c2fbQfM8xE3UMsoQrBFPerxAB+8XcBXYUWpgcG1X/bDieoqQ46phyinWvNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r3pwM7Md/mNR+bt0a8yqpa5g6Qr9VuPE8Wl3FDOjEmk=;
 b=bazw+inxgEhyQ88scdh4QQIWd//HckP1lIiQBrcaNVQTAi/liKwNsY4XOCx/ccijFm6DiYxmqcGopBLBUEcpHYys8WQt85TOb/VwV/rFs+kPIskIl7lNmBThXhzNW+73Hvr91e9L0bNqpjUVXnOM4GqLV49nwlFrAHMfEZ1v+W2A/HRv/IskpE9ySIm0ObqSIr1xsVhk7NSHskesAk4GuGUFMvRgCodeZI+zIr4S346TT/BtAy7Da15A88bkcNHku/zFJoKOyP4Px9ufJHIvUGN0cEAex3E3PLgeIS/QDfJuH4lInPUStSI7NJXqpTjOkCLX+Ku730uSo3XDA+/Usw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6029.namprd11.prod.outlook.com (2603:10b6:510:1d0::7)
 by PH7PR11MB6006.namprd11.prod.outlook.com (2603:10b6:510:1e1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.27; Mon, 29 Jul
 2024 02:20:55 +0000
Received: from PH7PR11MB6029.namprd11.prod.outlook.com
 ([fe80::8ad2:f4da:864:424d]) by PH7PR11MB6029.namprd11.prod.outlook.com
 ([fe80::8ad2:f4da:864:424d%7]) with mapi id 15.20.7807.026; Mon, 29 Jul 2024
 02:20:55 +0000
Date: Mon, 29 Jul 2024 10:20:47 +0800
From: Philip Li <philip.li@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
CC: kernel test robot <lkp@intel.com>, David Finkel <davidf@vimeo.com>,
	<oe-kbuild-all@lists.linux.dev>, Linux Memory Management List
	<linux-mm@kvack.org>
Subject: Re: [akpm-mm:mm-unstable 36/78] test_memcontrol.c:201:6: warning:
 variable 'fd4_closed' is used uninitialized whenever 'if' condition is true
Message-ID: <Zqb8f4ldSvBgHd2h@rli9-mobl>
References: <ZqXB99KGKrzyePeL@rli9-mobl>
 <20240728131824.51628ab73f6318fe62e85742@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240728131824.51628ab73f6318fe62e85742@linux-foundation.org>
X-ClientProxiedBy: SG2PR04CA0167.apcprd04.prod.outlook.com (2603:1096:4::29)
 To PH7PR11MB6029.namprd11.prod.outlook.com (2603:10b6:510:1d0::7)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6029:EE_|PH7PR11MB6006:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c990d47-8643-45ed-2a66-08dcaf7513b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?MNZ+vFOzXgfS32wFrCGSV/tYx/XB+lwzyKEslWG61j4rUozPsVm0OgSoSO9K?=
 =?us-ascii?Q?Z5ziYr2G58Q/roLLr5lP8TBz7TOEKecBUazd8wkqym28wj9+ENuruekUFkzn?=
 =?us-ascii?Q?cuB4XQ5sOk/1h4lMVBtFgdPQZhPwantynEDEQCQapVLVYghBffaq9vqMl9zN?=
 =?us-ascii?Q?XJmujnTiai9AvprEjQ+4D15vya3dFOlYOrqrHw7/MbNmO5TTXFeZR4otCMRF?=
 =?us-ascii?Q?72FZ/fB5HpKNCpy3k0XRDcHGsKCvfSauNFGIDaPgwuJt31/7n5Z+k6xtuaAj?=
 =?us-ascii?Q?bIDKKoatvG//g2KzZNDDAtpQUkBuuy3JDav+ilsn99/WjTXeX3b2KOf7fjHd?=
 =?us-ascii?Q?GiPBIGEDzBVGtKyRzIDv+ECuVc8DGhxO8g36sExyl2b2FvXRlYNdbd5Jdad0?=
 =?us-ascii?Q?h/VBywy4pwF+TKU0CMEbTeep9CXhXsClnMki77D/mmHoNhN0VbycWtCisV1Q?=
 =?us-ascii?Q?2+N6hZzqYNRHnUZh7L5aRMMYrZdSWukubVcUSa/OQSc9Xub7Nfd8XpzDb57v?=
 =?us-ascii?Q?Een0+j1YinhP0MdkDpSEWj9f5UGtNsWv/384ySh4eOiK5u1cc8edLqd5ZTm5?=
 =?us-ascii?Q?+STlV8NT73zKT5nNX3z4aitH74ABgWwC6z3Ziw9nHaeWJ3Buq1Ucbrnypn24?=
 =?us-ascii?Q?Ih8J9iwDwDXCIMA+YoO0HKbB0pnflQxhw8plJdPZ8fdmLXf5910WApLCAsgA?=
 =?us-ascii?Q?J/k/kpG2ZLVEGezqm+wdZm7O1Phj4hnqwTK1bZgiDqFcxENZ0KhIh3+2YWi/?=
 =?us-ascii?Q?K2cS1UOBkdnNR/VJL6MlDG0YOfgosMTtZdGrefBLWeuzGGVOCvUjFZNmK3zG?=
 =?us-ascii?Q?9Il7GTE6i4wQkaTIhenSn5bnoJLA9E6lvnwcoX31feS3vDl8snMyVXPKQrWn?=
 =?us-ascii?Q?AaSokAybaCyVSXry4X8i7LdkJfAEMLhK8R+PzHFdFXr3nyvYtFV3X2QalxJx?=
 =?us-ascii?Q?O9vX3PyMsX/Zw6CVUGvvinitmpH5rnwIGIHFgaOr4q+GN19+VQda6wwYaEXl?=
 =?us-ascii?Q?LEy6CUmS46kzlXvrBR8LYVzNoxvlaoTF6d/0bymFnVkyRYI0U6U/1FrjI6Dt?=
 =?us-ascii?Q?J7ecHLmwbSALdcEF82OsgFp3iDDTKOxCRczUSMorazRy196DUpwGgjPeJ9tN?=
 =?us-ascii?Q?V47wy57qMnXKWvaWxoh9xMjBkKJI2t6G7LfKUcZ7H5bHATjjzCJB50Rf91zE?=
 =?us-ascii?Q?QAfKbzP0NpU5mOlefBy/TN/MjJ/ESFkgZkMOENGJFu0d2xwZ/9/Cs6HvB4KX?=
 =?us-ascii?Q?03tb2lnzu8B3vdwIiEyiOTzqK56lfI3yhynyQjlvySsG/x9gq9RzlDWj2tH5?=
 =?us-ascii?Q?gu3DbKuV3PFUqhYT+/WMdV+8?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6029.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8X8KA5/ytnedYp80xqqv74GxHErlydIqUT4WiXl0eDyPrMR9zZV0P4uhpmr2?=
 =?us-ascii?Q?LY4VpiMfBcWv7D0/cc/yLGeWyZ55NojHZFXCO85j6Die2bBKWXrWP2EJJtlQ?=
 =?us-ascii?Q?S5DSDjm5VIoKNrxktbv0XY3zqhHMRur0bitAXVyAiRIZpHAsEb73nGbYhQkq?=
 =?us-ascii?Q?rHKo51UZlKjmG7EzlNKtOys3vcnWaeVcUdlUAfk8QAV1r30XtAdzL7PflMJT?=
 =?us-ascii?Q?fhInZLu2pN2oNldy8LhnA9sSvC23fkvZzPJiZYNbiL3SHuOBXoplWaJQT4Zh?=
 =?us-ascii?Q?gwXphk+WV16tbsqgtBWZCRY6C/xtspzsgmNXXoVN19WN7KLlF2pxySM4YnXm?=
 =?us-ascii?Q?u3INUxMuANOz4Q0HkO/p8Qs9lCucM6Yz7dHUu7K3I2GcaegR6iSG/nduza7Z?=
 =?us-ascii?Q?S71EPUfn7LME4uSqdGe85wCdUWEqAk7YEHaxVNwcLtBk/DO0ETjKZxnnr5s6?=
 =?us-ascii?Q?ZebgTHU2Q6Mev3ltrifWK1xSRjZzUX2JcZ/Fqlwk0pDqVBLq1eYsd3FD98FG?=
 =?us-ascii?Q?1diBrhz8M7FRyP2pxJFT+FcNmF5C50bYC1LJP0itXSgKGy8ijK782hIb+xrz?=
 =?us-ascii?Q?Tr+3I8WrsqHAWJ8hRZor2bHNVVhsYuRBtdMXbt3Ca7cUU6uDFtChP9Is79g2?=
 =?us-ascii?Q?YQIiRh0+T1xZM6UHQ5l21643MmM3qKtis7XROuMBg62z7irHj8eJqs5FhnC3?=
 =?us-ascii?Q?pCnQYMsg3h4UDb3V3qqZStSCcVEw6adYbIqBZUTDjO6lIpaWVRzYVqfOqwxo?=
 =?us-ascii?Q?V74GOgR0Ex1lHNi0rqdOzduUuUUkL1SXj9DEXfObfh/pieZRz82oWHtDQemQ?=
 =?us-ascii?Q?bBgfBtGPud6+OQStzzCT50LKm/Ulebg037y7zeAyfVDTNa0jy3TlJ4DftEpa?=
 =?us-ascii?Q?6ldrpb+/MzeirmNSonBeM4HdXkwFCbjt+KtrdfqBcX0lUrWGkIliwheaUG5w?=
 =?us-ascii?Q?aJQD2Z9jdaw1XPws0o4dPmhZYjPDvSWjJvMSGhuTd4ErioJu5lqc+dVvXDrk?=
 =?us-ascii?Q?yXnrJHligo/3ytfkmIUs5yBj+pz5Lj7LIT30NHBeTmVZKVinxHessqAnaljV?=
 =?us-ascii?Q?KqHkUG/c23DWu4sGU5vLXgpcvIOuaSYcB6G9djXE/Vqoc63ppeHPXK+XTZNy?=
 =?us-ascii?Q?Jyt1ujjNeTcx5OfSnFhsgLS0ijceZLjKAoyvcusqPxNKqnPRfYLS7a3lDynk?=
 =?us-ascii?Q?QW4rN/UhY0hxZ8PGZMCn1o2tmLfzJCWj843OmsRjvfo2JJ6l6HVqA80K32tb?=
 =?us-ascii?Q?D1YVh7xvHAvJl30snmABugoFBOQvuz8Gpfg9PIO4PL14AnMUmevPR9Cj9oZx?=
 =?us-ascii?Q?1oLlNf86CmE6/QVTql/dZV1bVH/o5yjWf8/wXG0CAUsDcsGmF6omlNqr94hi?=
 =?us-ascii?Q?6pPVA4DubbogMbDcLaOu/vxEDf+VscyMow8AK3gEOrkboBskZ3BOfWMAnfyX?=
 =?us-ascii?Q?KrUEmbUd0oMlKGGCFQ2JL0mrA8XKLqCqAPvlXsLzTfGHoCtHBCh++kfJFqEO?=
 =?us-ascii?Q?k/GV/zzMcoK1czgPnIxOYVbl0UYWsjSNRBQ1j/6/wTGnGttOPLAjVVS3bUou?=
 =?us-ascii?Q?1QyidSzE9QjynCfHzYeWEAnXcZ8nW25U6ys6ihSO?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c990d47-8643-45ed-2a66-08dcaf7513b9
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6029.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2024 02:20:55.9090
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fbbgh0IO96PQWOL6zM+8G0iVJ4GXfXSg3UIoXZy1861SYHPwQE7THih4efCYpQS8zGT+hmF+tJfGHgK2qBr+IA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6006
X-OriginatorOrg: intel.com

On Sun, Jul 28, 2024 at 01:18:24PM -0700, Andrew Morton wrote:
> On Sun, 28 Jul 2024 11:58:47 +0800 kernel test robot <lkp@intel.com> wrote:
> 
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
> > head:   b39b3892d20a337489c55806f91af581474f3943
> > commit: f2db5cca8182337f4ad485ebfd532b1a2d1c223a [36/78] mm, memcg: cg2 memory{.swap,}.peak write tests
> > :::::: branch date: 2 days ago
> > :::::: commit date: 3 days ago
> > compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240727/202407272301.bBC2CidR-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/r/202407272301.bBC2CidR-lkp@intel.com/
> > 
> > All warnings (new ones prefixed by >>):
> > 
> > >> test_memcontrol.c:201:6: warning: variable 'fd4_closed' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
> 
> um,
> 
> 	bool fd2_closed = false, fd3_closed = false, fd4_closed = false;
> 
> fd4_closed cannot possibly be used uninitialized?

One possible flow is early peak_fd fails to open and go to cleanup, then
in cleanup side, the variable like fd4_closed is directly used.

+       if (peak_fd == -1)
+               goto cleanup;
+
+       bool fd2_closed = false, fd3_closed = false, fd4_closed = false;
+       int peak_fd2 = cg_open(memcg, "memory.peak", O_RDWR | O_APPEND | O_CLOEXEC);
+
 ...

 cleanup:
+       close(peak_fd);
+       if (!fd2_closed)
+               close(peak_fd2);
+       if (!fd3_closed)
+               close(peak_fd3);
+       if (!fd4_closed)
+               close(peak_fd4);

> 
