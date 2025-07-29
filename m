Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE6FA2AF1C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Jul 2025 08:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753778520; cv=fail; b=Ukkpy2LoWjP6b8scu2we5g97bMwt21KkSJIiwWY8oVTeZBJQIkT0X8FGiZmbD4SN7DZlTjtC8ElnnhauxeKGJO9+f1WGVMSCd+12ij2p6rwTpStIgzvxCOt58Su0zbHTgSdupl7IRcaiSfCQLYoZ3OBj2YrbZskSN3Kq19RolKY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753778520; c=relaxed/simple;
	bh=2J2QsFKHjL9cQDwLTTtZOKyZskf0byVLSiOAwPRBCe0=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=OLy1R6PT1fVpMBiBglIsBv768a52P0lqer/GvTze1dza9qhvSDKGSc3pV9vlgu7T3MkkK3BhcDSpR1M3d7hf0Tdo48DcxJwa7t+vFYKsqXTi9jbcKWomoNBL49x64xTVmqDq/ijIbYIwyaOKg0xXvhsh0s4zJ2KgHoisMxFdKkA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i0JQ0Fkn; arc=fail smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i0JQ0Fkn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753778518; x=1785314518;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=2J2QsFKHjL9cQDwLTTtZOKyZskf0byVLSiOAwPRBCe0=;
  b=i0JQ0FknvopCTfsemUUVsBLmC4HXPipkRdIpU4+QBiKAKn7mfJy+OpWR
   fIvMlFjGij938bJ3n0wYpIs+0XxvlVsi9aQC1sz/azY91Oxm8RYl7rLc9
   fdgMSP7DHRSFBKXc3NUVGoV+LOn8vlzWlzXJOcmUf+zHw37gNcIV1YG/1
   mkp1FXy1stOgMnt3DamXP4q//LOMnXLiR9IEXBNX6hYLhAtNFqksgQj4V
   vI8kjSo88LycWNUMXfNnZnj9NqmikkQRFMEg0tS52AQhSAPnRIZVkRuDx
   EELeV+j0bM3bSrVF8XhSop+0iRuyR/NYkEg5Cn4OEIpZ4lmhHGcoTuQWM
   Q==;
X-CSE-ConnectionGUID: QHZ7Uo0fTUefk18HZqF+dg==
X-CSE-MsgGUID: f2rLxSeZQIKwqAJfPEX3Fw==
X-IronPort-AV: E=McAfee;i="6800,10657,11505"; a="55247395"
X-IronPort-AV: E=Sophos;i="6.16,348,1744095600"; 
   d="scan'208";a="55247395"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2025 01:41:57 -0700
X-CSE-ConnectionGUID: jn2WgmS3S8+Rc0kruO+gRg==
X-CSE-MsgGUID: 3RcEekiXR+CPAAsC6l5fnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,348,1744095600"; 
   d="scan'208";a="162214678"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2025 01:41:57 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 29 Jul 2025 01:41:56 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Tue, 29 Jul 2025 01:41:56 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.71) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 29 Jul 2025 01:41:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WkWf90Az7fDaYUs+kw/MDU0DW15SCijo3IV/lo9Nz/DZVdH4fGIEyGkIhwA/UqQ+X8C+6d44jcnlrf7HyTZ4V7NDzMt/ClZ9pfDcXZXGpmTg9s/FJJ6FgNgpJyvva8+PSovlCeD+3XUp+OcVxO73I646RlrUXQf+rsG4i1w04OCZU2sfXNVnnUZeeVTwCeyehwV5Ki52/o64WR/JtE38aDlefcydL3DPVDc4WDEdjotgBhu23yi66WtESofqJklbq1sv84TdlKzJkz45vG3o9/vqpEIV11SXH5BVFJThnVruqi6h4tr2JRwx0THluL4s8ovnVxseL73oO2r3eTqP3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zX0XoywI1cltDvTa2gP910LnjAJeExhXwOqFLfX4nfo=;
 b=PxPukljIEcKTBD2HizRd1aXz3p5hbSR/Ktd0ZqfTZEwpw4UwWQhjgiimvoIAy73SRypETksdErWM66cCIrIRE4NiWjpdKC73P11fKKUVBCzalAAF4bXh9txYwg8gc1BK3sopnejNsnOTtu6lO1n9rvIEGXSEQ7Y74T96ZZtRwM0b4SEaWoHRBOVzA1l6c0R4cBcxtw5jC+nLk2UQIgzWofAsaflWZ89XATLQeYDQWPKAGmqdz2tWDdgQFz7/zYXaFqylUOkB96aaya62jOgVL6SpP6MHyBk1NGnTGrBfb4Ni9+lvY9CKjnPPfSADwxFlj6nKJVyZSefg1I/OI8FDOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5674.namprd11.prod.outlook.com (2603:10b6:510:ec::10)
 by IA0PR11MB7211.namprd11.prod.outlook.com (2603:10b6:208:43f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.11; Tue, 29 Jul
 2025 08:41:41 +0000
Received: from PH0PR11MB5674.namprd11.prod.outlook.com
 ([fe80::77d3:dfb2:3bd:e02a]) by PH0PR11MB5674.namprd11.prod.outlook.com
 ([fe80::77d3:dfb2:3bd:e02a%3]) with mapi id 15.20.8989.010; Tue, 29 Jul 2025
 08:41:41 +0000
Date: Tue, 29 Jul 2025 16:41:33 +0800
From: Philip Li <philip.li@intel.com>
To: kernel test robot <lkp@intel.com>
CC: Kees Cook <kees@kernel.org>, <oe-kbuild-all@lists.linux.dev>
Subject: Re: [linux-next:master 12341/12680] arch/x86/kernel/setup.c:971:
 undefined reference to `efi_memblock_x86_reserve_range'
Message-ID: <aIiJPbLZAKRJBZ1a@rli9-mobl>
References: <202507291023.HBuEiQHk-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <202507291023.HBuEiQHk-lkp@intel.com>
X-ClientProxiedBy: SG2PR04CA0157.apcprd04.prod.outlook.com (2603:1096:4::19)
 To PH0PR11MB5674.namprd11.prod.outlook.com (2603:10b6:510:ec::10)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5674:EE_|IA0PR11MB7211:EE_
X-MS-Office365-Filtering-Correlation-Id: 4791477f-4069-42b0-4c4e-08ddce7bbd2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?mwkiV8P1NuTqcPcpMXriB9LRgEtDJI/OeVt2dJI4K0ZIpKeyUsyWeHBJKBL5?=
 =?us-ascii?Q?GKsGc4mp0cAe1qeIApAZXBFXF5/kwqaMVFF/QBSZZ1KpicYKq2uhu8GHlt6I?=
 =?us-ascii?Q?7hiFE/4AbA6qXHckg1IdVe2xUgKzfoduH53DwJupE/wHHfyJ4xRpPqZZtJlh?=
 =?us-ascii?Q?9tq6F6yzB9Rhn8cW8QV1yi+EMR4lAkQHOg5hftyQbNmZCCFIriWkRLJC+BnN?=
 =?us-ascii?Q?o/zUlMVLDDKA1kAQzAvbBHvroAUmtYf5Fhjcc5tWVrnGeH2a2QEmdIdZ9g7d?=
 =?us-ascii?Q?Jvv3HyPcxDpBUF9Xgi3FpJdvOvloK/mvVF/eVMR70H3gdm8QIvOPkfdBKFpb?=
 =?us-ascii?Q?SpaH0yhid01X3sIq9HhP+Y8l3hHTC+8NJJ3mqPvBqv0c8ss9q1II/yS3IE1i?=
 =?us-ascii?Q?SKQ3cZwXcmyyXBr7sdQX9VVZU4oXCm6IibOZNIbG+ht3oMP0HLyKciBYBZMb?=
 =?us-ascii?Q?4kAY0oJelLobELUWv8CGFKR+yLhCSwrcYT3kRSQJ41aHg2g0mhlGd3sbr3Xo?=
 =?us-ascii?Q?gmfiV09wAWODnkVLnJLigvBl6CMaTYQD/p1cUqKv0q0GILXruRAETnbgyZA/?=
 =?us-ascii?Q?NofUMTa0ABmJ5psdkz5wBOdbnwxNCqY1sc3wnI15BZDD0DwOXs35Hu46uYWM?=
 =?us-ascii?Q?QEPY82VsijXwyfKFq/+srtNMXL+8kzVz+71nrvQPjxWizgfylI8z5w/ZPwyQ?=
 =?us-ascii?Q?voaC7cCztIEGaLkwzIxz/JDhpZmT2UmKOvcwMZBtzBsYPEYuVeksKpYPua0a?=
 =?us-ascii?Q?l/7sbJu11OgakqPP81qaq1dEi8XGyEAuTM2sS/QnaWTKb6KejGLAMCH3kyYX?=
 =?us-ascii?Q?koN+jmRN/uYqDHG1ScoufbxwRYQ4pzz+HROlBeF/HVSyjsTP8Wae4JbgKhpz?=
 =?us-ascii?Q?6BPcf2pEJiVxHyUVx+DdnM8pGFKv6s6LAxZy/fkCdsF3LlyJmYqGfqlr0zzn?=
 =?us-ascii?Q?+NN7pFYRzSzay+r2rG9Ls6ql8ZhyneUkMOLdwbAYFjMWNt9gJdJ/60+O7xen?=
 =?us-ascii?Q?orLGs24aB0SPyChCT6uYdebAyBUqPxEf2RSMcvAo8QMhtfn4cbELiPy5W51K?=
 =?us-ascii?Q?xJb/YrMn9cGXyDrgMGgWB/fbVzrHEfkZ1U09ybqZu4v+731HUV5efQ8aj+06?=
 =?us-ascii?Q?6fa24jJ6IHSEJExmPAQa1yxFqsb/GTmxEhK4Y1c6XvLTQ0S8WSt19MZGYEgd?=
 =?us-ascii?Q?ZXolldFjuS2/tq1LEvhz/qDeBUGIml6E4Xy3AuD4bfZVgIYdfrIERUUW2ofN?=
 =?us-ascii?Q?7snAG+3ELdoNVF5/D1dv+YkiZQzHS2Yv1uA6KKe/Hc/zcUGWMKMuqbkHyfWh?=
 =?us-ascii?Q?9rP6OwhICQ9mUMC9NPdb1O3BYQT+6dHYusbJjT9NmvWA0PiEe4mOk28GbwWD?=
 =?us-ascii?Q?wo2NKcAtmAC5EkWiSuq1tmr/YxUV?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5674.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wbg3aqmCGKl66sRVrmSG7A0gUceB7bJXmVKo5exK7FyDTAnF6NfMSxBXH9i5?=
 =?us-ascii?Q?8zp2mSsynYavrwU0DIfd0RrNdj9nzM4S192Ka/sOOpNDHQTj+GmwWPmTndMU?=
 =?us-ascii?Q?mc2PZuqGS7AXUk9qfW1UL1rF9S9rX6u5L+MFaDx0tNf98aTGw7RfMRCjojx0?=
 =?us-ascii?Q?N52BupBc//ZLx0kU6llw8T3t5Hv+6BCpFy8KDeE4WHKeFUyb2R5O411ASRGd?=
 =?us-ascii?Q?cS+w3UB0IFqAn3YCPANDTr566uCHxCQKcruTywvBqmAiYLrf//icerfRAWgP?=
 =?us-ascii?Q?u+gjvLdLB/DaUo//re5U3muDrWDG2HSLYq/FP7UB1JfWlDrn8ocLoZhMGEj3?=
 =?us-ascii?Q?1tZ0mvlPI4pvF8hBXTi2EHlmZhrQvshFeMFXYfH+VQiVafS0xIOijEDVPRvJ?=
 =?us-ascii?Q?MmjT+8UVXmQnqIIkZAtvaVDO8HHRTJXcsYDNPKx8C+FPOh4yG7BTmXTE6zEp?=
 =?us-ascii?Q?u5facKhALNklCDwgjKV/Gsr5fsGp+NEoGfRb2jjhdi5UfQgAmpD10hvYYR3U?=
 =?us-ascii?Q?KbRNp77aJFd1RWF6ilbFA2ilD2W41uuvN2d9WqYYJhKaAP3a0hXR2Kf+s+2T?=
 =?us-ascii?Q?tqjQI6o4ojXOA6MbkmjMyhdCHnfPrKLO2jv6iaYt3kbrmtsTbVyEtYYD8x1j?=
 =?us-ascii?Q?KH/Iviq/GOdgcoqa79pAQC55RzRSBeZP1gWO1Y6lg8HyTBQro0hXWJ2Dv4II?=
 =?us-ascii?Q?vGe36D/Ez4xFojin0kyUArlDMsjJP4ptp/pUldmy7Ztn0y/pvl9tZw5//AmA?=
 =?us-ascii?Q?OzzdMXTFrstlyyGnYrXdmZimFMSat8wflNLFTfhvXiEXvxuxHg/2uDRe5Lvu?=
 =?us-ascii?Q?cjANipXwU8nXayx6CDvczaRNB9drCm6Rs0BRIJyyxvkXEpe/cocjJ6zMQIsz?=
 =?us-ascii?Q?eCh4Yopz2TC/U450vW1s/lJjN2YYyaMQakIa5Uu8WA1YTrufb8v40xMKx4MP?=
 =?us-ascii?Q?+0SqyL0OGZUhXxi0T345n9xIU5GYMkzFpbNL0u8j4bxmceD53B6MfjNW1mMm?=
 =?us-ascii?Q?aAxoqPG1N4ZIJB9Rc3o0MYjp2ODR6+IFeOGoS0ndpfswYUvx2unf9s2kI2Mx?=
 =?us-ascii?Q?42pEBr2XgQxu/SpV9aM7/jLaNBe7Ea69Y1vgII10hbxiGLTfCYwRlaMXIyrO?=
 =?us-ascii?Q?J2fSevGVPcEDFIAB3v4U3DVIA4MhtPcNazVSqnUInfyqibcGR5A7W6OnTz2G?=
 =?us-ascii?Q?g3HjYljkLXK6+EtsBixIOdIaHCQA/ysMkOjKky3w4sYE573oi3QLAp4zch8n?=
 =?us-ascii?Q?BkpxlB0ohyfKOlTLnYq9OOqqvRK8AmogIieBJpzYJGurj5fJR6mq07Crl1aE?=
 =?us-ascii?Q?PoHLuYONEzerqQUbjlN93kjonAjJ5I+ediaey42ERxJ1TiXVaZ6hcwmrKdyW?=
 =?us-ascii?Q?JIOJPX3O+FJFHRzPM6+PX4pvdOT4jNXCC+pLG6D/CrWj4wpx8Y20jcLy4iVe?=
 =?us-ascii?Q?EMd0K7KlGzRe51VLBJ3/N4uvzchYeRqtavGE8ZUB62g03gmaNJYjHbEvcSud?=
 =?us-ascii?Q?YydEu/DgzdQCWdB45nLSF6p+u2Rq+7+dgsd281V/s4gnzXHfh+7uSOsDKvf2?=
 =?us-ascii?Q?2nv/A61i1JXOC79MofT3CG+gUVGFaOo90ybwpUwR?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4791477f-4069-42b0-4c4e-08ddce7bbd2a
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5674.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2025 08:41:41.1270
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BAi7NvMWhe3h8Cv7IQfBQ1ufpby0uKhfyaskClVxeDx+gaTvZ8CC82+RQdQFbUf3YBRx2JWR4jM3Z2YNlCRD3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7211
X-OriginatorOrg: intel.com

On Tue, Jul 29, 2025 at 10:34:56AM +0200, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   54efec8782214652b331c50646013f8526570e8d
> commit: aff3dec740a27106fa0d302c7af107362e4080cc [12341/12680] init.h: Disable sanitizer coverage for __init and __head
> config: x86_64-randconfig-2005-20250721 (https://download.01.org/0day-ci/archive/20250729/202507291023.HBuEiQHk-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250729/202507291023.HBuEiQHk-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202507291023.HBuEiQHk-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):

Kindly ignore the report, it should be the same case as [1], we will further
disable certain patterns and this bad commit. Sorry for the noise.

[1] https://lore.kernel.org/oe-kbuild-all/202507270258.neWuiXLd-lkp@intel.com/

> 
>    ld: arch/x86/kernel/setup.o: in function `setup_arch':
> >> arch/x86/kernel/setup.c:971: undefined reference to `efi_memblock_x86_reserve_range'
> >> ld: arch/x86/kernel/setup.c:987: undefined reference to `efi_init'
>    ld: arch/x86/kernel/cpu/mshyperv.o: in function `ms_hyperv_init_platform':
> >> arch/x86/kernel/cpu/mshyperv.c:494: undefined reference to `isolation_type_snp'
> >> ld: arch/x86/kernel/cpu/mshyperv.c:496: undefined reference to `isolation_type_tdx'
>    ld: drivers/acpi/osl.o: in function `acpi_os_get_root_pointer':
> >> drivers/acpi/osl.c:210: undefined reference to `efi'
> >> ld: drivers/acpi/osl.c:210: undefined reference to `efi'
> >> ld: drivers/acpi/osl.c:210: undefined reference to `efi'
>    ld: drivers/acpi/osl.c:212: undefined reference to `efi'
>    ld: drivers/acpi/osl.c:212: undefined reference to `efi'
>    ld: drivers/acpi/osl.o:drivers/acpi/osl.c:212: more undefined references to `efi' follow
> 
> 
> vim +971 arch/x86/kernel/setup.c
> 
> 4faa0e5d6d79fc arch/x86/kernel/setup.c    Julian Stecklina          2024-03-28   917  
> 4faa0e5d6d79fc arch/x86/kernel/setup.c    Julian Stecklina          2024-03-28   918  	strscpy(command_line, boot_command_line, COMMAND_LINE_SIZE);
> 4faa0e5d6d79fc arch/x86/kernel/setup.c    Julian Stecklina          2024-03-28   919  	*cmdline_p = command_line;
> 4faa0e5d6d79fc arch/x86/kernel/setup.c    Julian Stecklina          2024-03-28   920  
> 9863c90f682fba arch/x86/kernel/setup.c    Alok Kataria              2010-08-23   921  	/*
> 9863c90f682fba arch/x86/kernel/setup.c    Alok Kataria              2010-08-23   922  	 * If we have OLPC OFW, we might end up relocating the fixmap due to
> 9863c90f682fba arch/x86/kernel/setup.c    Alok Kataria              2010-08-23   923  	 * reserve_top(), so do this before touching the ioremap area.
> 9863c90f682fba arch/x86/kernel/setup.c    Alok Kataria              2010-08-23   924  	 */
> fd699c76552bbf arch/x86/kernel/setup.c    Andres Salomon            2010-06-18   925  	olpc_ofw_detect();
> fd699c76552bbf arch/x86/kernel/setup.c    Andres Salomon            2010-06-18   926  
> 433f8924fa8e55 arch/x86/kernel/setup.c    Thomas Gleixner           2017-08-28   927  	idt_setup_early_traps();
> 9e882c9282512c arch/x86/kernel/setup.c    Jeremy Fitzhardinge       2008-07-21   928  	early_cpu_init();
> 8990cac6e5ea7f arch/x86/kernel/setup.c    Pavel Tatashin            2018-07-19   929  	jump_label_init();
> a945c8345ec0de arch/x86/kernel/setup.c    Peter Zijlstra            2020-08-18   930  	static_call_init();
> 1a98fd14f44cfa arch/x86/kernel/setup.c    Jeremy Fitzhardinge       2008-06-29   931  	early_ioremap_init();
> 1a98fd14f44cfa arch/x86/kernel/setup.c    Jeremy Fitzhardinge       2008-06-29   932  
> fd699c76552bbf arch/x86/kernel/setup.c    Andres Salomon            2010-06-18   933  	setup_olpc_ofw_pgd();
> fd699c76552bbf arch/x86/kernel/setup.c    Andres Salomon            2010-06-18   934  
> d45dd0a9b27ee8 arch/x86/kernel/setup.c    Mike Rapoport (Microsoft  2025-02-14   935) 	parse_boot_params();
> 7465252ea0121c arch/x86/kernel/setup_32.c Yinghai Lu                2008-06-23   936  
> 42bbdb43b16d23 arch/x86/kernel/setup.c    Thomas Gleixner           2009-08-20   937  	x86_init.oem.arch_setup();
> 2215e69d2cf502 arch/x86/kernel/setup_32.c Ying Huang                2008-01-30   938  
> 8aa83e6395ce04 arch/x86/kernel/setup.c    Juergen Gross             2021-09-20   939  	/*
> 8aa83e6395ce04 arch/x86/kernel/setup.c    Juergen Gross             2021-09-20   940  	 * Do some memory reservations *before* memory is added to memblock, so
> 8aa83e6395ce04 arch/x86/kernel/setup.c    Juergen Gross             2021-09-20   941  	 * memblock allocations won't overwrite it.
> 8aa83e6395ce04 arch/x86/kernel/setup.c    Juergen Gross             2021-09-20   942  	 *
> 8aa83e6395ce04 arch/x86/kernel/setup.c    Juergen Gross             2021-09-20   943  	 * After this point, everything still needed from the boot loader or
> 8aa83e6395ce04 arch/x86/kernel/setup.c    Juergen Gross             2021-09-20   944  	 * firmware or kernel text should be early reserved or marked not RAM in
> 8aa83e6395ce04 arch/x86/kernel/setup.c    Juergen Gross             2021-09-20   945  	 * e820. All other memory is free game.
> 8aa83e6395ce04 arch/x86/kernel/setup.c    Juergen Gross             2021-09-20   946  	 *
> 8aa83e6395ce04 arch/x86/kernel/setup.c    Juergen Gross             2021-09-20   947  	 * This call needs to happen before e820__memory_setup() which calls the
> 8aa83e6395ce04 arch/x86/kernel/setup.c    Juergen Gross             2021-09-20   948  	 * xen_memory_setup() on Xen dom0 which relies on the fact that those
> 8aa83e6395ce04 arch/x86/kernel/setup.c    Juergen Gross             2021-09-20   949  	 * early reservations have happened already.
> 8aa83e6395ce04 arch/x86/kernel/setup.c    Juergen Gross             2021-09-20   950  	 */
> 8aa83e6395ce04 arch/x86/kernel/setup.c    Juergen Gross             2021-09-20   951  	early_reserve_memory();
> 8aa83e6395ce04 arch/x86/kernel/setup.c    Juergen Gross             2021-09-20   952  
> 419afdf53cca79 arch/x86/kernel/setup.c    Bjorn Helgaas             2010-10-26   953  	iomem_resource.end = (1ULL << boot_cpu_data.x86_phys_bits) - 1;
> 103e206309639b arch/x86/kernel/setup.c    Ingo Molnar               2017-01-28   954  	e820__memory_setup();
> 28bb22379513ca arch/x86/kernel/setup.c    Yinghai Lu                2008-06-30   955  	parse_setup_data();
> 28bb22379513ca arch/x86/kernel/setup.c    Yinghai Lu                2008-06-30   956  
> ^1da177e4c3f41 arch/i386/kernel/setup.c   Linus Torvalds            2005-04-16   957  	copy_edd();
> ^1da177e4c3f41 arch/i386/kernel/setup.c   Linus Torvalds            2005-04-16   958  
> 30120d72a41e0e arch/x86/kernel/setup.c    Kefeng Wang               2021-07-07   959  	setup_initial_init_mm(_text, _etext, _edata, (void *)_brk_end);
> fe3d197f84319d arch/x86/kernel/setup.c    Dave Hansen               2014-11-14   960  
> fbe6183998546f arch/x86/kernel/setup.c    Borislav Petkov           2021-12-13   961  	/*
> fbe6183998546f arch/x86/kernel/setup.c    Borislav Petkov           2021-12-13   962  	 * x86_configure_nx() is called before parse_early_param() to detect
> fbe6183998546f arch/x86/kernel/setup.c    Borislav Petkov           2021-12-13   963  	 * whether hardware doesn't support NX (so that the early EHCI debug
> 76ea0025a214cd arch/x86/kernel/setup.c    Borislav Petkov           2022-01-27   964  	 * console setup can safely call set_fixmap()).
> fbe6183998546f arch/x86/kernel/setup.c    Borislav Petkov           2021-12-13   965  	 */
> fbe6183998546f arch/x86/kernel/setup.c    Borislav Petkov           2021-12-13   966  	x86_configure_nx();
> fbe6183998546f arch/x86/kernel/setup.c    Borislav Petkov           2021-12-13   967  
> fbe6183998546f arch/x86/kernel/setup.c    Borislav Petkov           2021-12-13   968  	parse_early_param();
> fbe6183998546f arch/x86/kernel/setup.c    Borislav Petkov           2021-12-13   969  
> 2f5b3514c33fec arch/x86/kernel/setup.c    Mike Rapoport             2021-12-13   970  	if (efi_enabled(EFI_BOOT))
> 2f5b3514c33fec arch/x86/kernel/setup.c    Mike Rapoport             2021-12-13  @971  		efi_memblock_x86_reserve_range();
> 2f5b3514c33fec arch/x86/kernel/setup.c    Mike Rapoport             2021-12-13   972  
> 4b0f3b81eb33ef arch/x86/kernel/setup.c    Kees Cook                 2009-11-13   973  	x86_report_nx();
> 0ad5bce7409d68 arch/x86/kernel/setup.c    Jeremy Fitzhardinge       2008-09-11   974  
> bef4f379e953af arch/x86/kernel/setup.c    Thomas Gleixner           2023-08-08   975  	apic_setup_apic_calls();
> bef4f379e953af arch/x86/kernel/setup.c    Thomas Gleixner           2023-08-08   976  
> 3c999f14266526 arch/x86/kernel/setup_32.c Yinghai Lu                2008-06-20   977  	if (acpi_mps_check()) {
> 3eb11edc1321e1 arch/x86/kernel/setup_32.c Ingo Molnar               2008-06-23   978  #ifdef CONFIG_X86_LOCAL_APIC
> 49062454a3eb4a arch/x86/kernel/setup.c    Thomas Gleixner           2023-08-08   979  		apic_is_disabled = true;
> 3eb11edc1321e1 arch/x86/kernel/setup_32.c Ingo Molnar               2008-06-23   980  #endif
> 988781dc3e1d92 arch/x86/kernel/setup.c    Yinghai Lu                2008-07-21   981  		setup_clear_cpu_cap(X86_FEATURE_APIC);
> 3c999f14266526 arch/x86/kernel/setup_32.c Yinghai Lu                2008-06-20   982  	}
> 3c999f14266526 arch/x86/kernel/setup_32.c Yinghai Lu                2008-06-20   983  
> 9641bdafd8571e arch/x86/kernel/setup.c    Ingo Molnar               2017-01-28   984  	e820__finish_early_params();
> 1a3f239ddf9208 arch/i386/kernel/setup.c   Rusty Russell             2006-09-26   985  
> 83e68189745ad9 arch/x86/kernel/setup.c    Matt Fleming              2012-11-14   986  	if (efi_enabled(EFI_BOOT))
> ff0c0874905fb3 arch/x86/kernel/setup.c    Brian Maly                2009-03-03  @987  		efi_init();
> ff0c0874905fb3 arch/x86/kernel/setup.c    Brian Maly                2009-03-03   988  
> 9338c2233b97f9 arch/x86/kernel/setup.c    Ross Lagerwall            2023-06-05   989  	reserve_ibft_region();
> 0f4a1e80989aca arch/x86/kernel/setup.c    Kevin Loughlin            2024-03-13   990  	x86_init.resources.dmi_setup();
> 2216d199b1430d arch/x86/kernel/setup.c    Yinghai Lu                2008-09-22   991  
> 88b094fb8d4fe4 arch/x86/kernel/setup.c    Alok Kataria              2008-10-27   992  	/*
> 88b094fb8d4fe4 arch/x86/kernel/setup.c    Alok Kataria              2008-10-27   993  	 * VMware detection requires dmi to be available, so this
> 0fca08122eaf5c arch/x86/kernel/setup.c    Robert Richter            2019-03-28   994  	 * needs to be done after dmi_setup(), for the boot CPU.
> 29055dc7428746 arch/x86/kernel/setup.c    Juergen Gross             2023-05-02   995  	 * For some guest types (Xen PV, SEV-SNP, TDX) it is required to be
> 29055dc7428746 arch/x86/kernel/setup.c    Juergen Gross             2023-05-02   996  	 * called before cache_bp_init() for setting up MTRR state.
> 88b094fb8d4fe4 arch/x86/kernel/setup.c    Alok Kataria              2008-10-27   997  	 */
> 2d826404f0bdca arch/x86/kernel/setup.c    Thomas Gleixner           2009-08-20   998  	init_hypervisor_platform();
> 88b094fb8d4fe4 arch/x86/kernel/setup.c    Alok Kataria              2008-10-27   999  
> cf7a63ef4e0203 arch/x86/kernel/setup.c    Pavel Tatashin            2018-07-19  1000  	tsc_early_init();
> f7cf5a5b8c0e59 arch/x86/kernel/setup.c    Thomas Gleixner           2009-08-19  1001  	x86_init.resources.probe_roms();
> 41c094fd3ca54f arch/x86/kernel/setup_32.c Yinghai Lu                2008-06-16  1002  
> 297fb82ebaad50 arch/x86/kernel/setup.c    Mike Rapoport (Microsoft  2025-02-14  1003) 	/*
> 297fb82ebaad50 arch/x86/kernel/setup.c    Mike Rapoport (Microsoft  2025-02-14  1004) 	 * Add resources for kernel text and data to the iomem_resource.
> 297fb82ebaad50 arch/x86/kernel/setup.c    Mike Rapoport (Microsoft  2025-02-14  1005) 	 * Do it after parse_early_param, so it can be debugged.
> 297fb82ebaad50 arch/x86/kernel/setup.c    Mike Rapoport (Microsoft  2025-02-14  1006) 	 */
> 297fb82ebaad50 arch/x86/kernel/setup.c    Mike Rapoport (Microsoft  2025-02-14  1007) 	setup_kernel_resources();
> 4046d6e81f33b7 arch/x86/kernel/setup.c    Linus Torvalds            2016-04-14  1008  
> b422a3091748c3 arch/x86/kernel/setup.c    Yinghai Lu                2013-01-24  1009  	e820_add_kernel_range();
> 1b5576e69a5fe1 arch/x86/kernel/setup.c    Yinghai Lu                2010-01-22  1010  	trim_bios_range();
> 76934ed4b33b65 arch/x86/kernel/setup_32.c Yinghai Lu                2008-06-25  1011  #ifdef CONFIG_X86_32
> cc9f7a0ccf000d arch/x86/kernel/setup_32.c Yinghai Lu                2008-06-16  1012  	if (ppro_with_ram_bug()) {
> 09821ff1d50a1e arch/x86/kernel/setup.c    Ingo Molnar               2017-01-28  1013  		e820__range_update(0x70000000ULL, 0x40000ULL, E820_TYPE_RAM,
> 09821ff1d50a1e arch/x86/kernel/setup.c    Ingo Molnar               2017-01-28  1014  				  E820_TYPE_RESERVED);
> f9748fa0458510 arch/x86/kernel/setup.c    Ingo Molnar               2017-01-28  1015  		e820__update_table(e820_table);
> cc9f7a0ccf000d arch/x86/kernel/setup_32.c Yinghai Lu                2008-06-16  1016  		printk(KERN_INFO "fixed physical RAM map:\n");
> be0c3f0fcade7a arch/x86/kernel/setup.c    Ingo Molnar               2017-01-28  1017  		e820__print_table("bad_ppro");
> cc9f7a0ccf000d arch/x86/kernel/setup_32.c Yinghai Lu                2008-06-16  1018  	}
> 76934ed4b33b65 arch/x86/kernel/setup_32.c Yinghai Lu                2008-06-25  1019  #else
> 76934ed4b33b65 arch/x86/kernel/setup_32.c Yinghai Lu                2008-06-25  1020  	early_gart_iommu_check();
> 76934ed4b33b65 arch/x86/kernel/setup_32.c Yinghai Lu                2008-06-25  1021  #endif
> cc9f7a0ccf000d arch/x86/kernel/setup_32.c Yinghai Lu                2008-06-16  1022  
> 7b2a0a6c4866ca arch/x86/kernel/setup_32.c Yinghai Lu                2008-06-03  1023  	/*
> 7b2a0a6c4866ca arch/x86/kernel/setup_32.c Yinghai Lu                2008-06-03  1024  	 * partially used pages are not usable - thus
> 7b2a0a6c4866ca arch/x86/kernel/setup_32.c Yinghai Lu                2008-06-03  1025  	 * we are rounding upwards:
> 7b2a0a6c4866ca arch/x86/kernel/setup_32.c Yinghai Lu                2008-06-03  1026  	 */
> 0c6fc11ac343c8 arch/x86/kernel/setup.c    Ingo Molnar               2017-01-28  1027  	max_pfn = e820__end_of_ram_pfn();
> 7b2a0a6c4866ca arch/x86/kernel/setup_32.c Yinghai Lu                2008-06-03  1028  
> 093af8d7f0ba3c arch/x86/kernel/setup_32.c Yinghai Lu                2008-01-30  1029  	/* update e820 for memory not covered by WB MTRRs */
> 0b9a6a8bedbfb3 arch/x86/kernel/setup.c    Juergen Gross             2022-11-02  1030  	cache_bp_init();
> 2dc807b37b7b8c arch/x86/kernel/setup.c    Yinghai Lu                2008-07-08  1031  	if (mtrr_trim_uncached_memory(max_pfn))
> 0c6fc11ac343c8 arch/x86/kernel/setup.c    Ingo Molnar               2017-01-28  1032  		max_pfn = e820__end_of_ram_pfn();
> 76c324182bbd29 arch/x86/kernel/setup_32.c Yinghai Lu                2008-03-23  1033  
> 8dd3303001976a arch/x86/kernel/setup.c    Igor Mammedov             2015-12-04  1034  	max_possible_pfn = max_pfn;
> 8dd3303001976a arch/x86/kernel/setup.c    Igor Mammedov             2015-12-04  1035  
> c7d2361f7524f3 arch/x86/kernel/setup.c    Thomas Garnier            2016-08-09  1036  	/*
> c7d2361f7524f3 arch/x86/kernel/setup.c    Thomas Garnier            2016-08-09  1037  	 * Define random base addresses for memory sections after max_pfn is
> c7d2361f7524f3 arch/x86/kernel/setup.c    Thomas Garnier            2016-08-09  1038  	 * defined and before each memory section base is used.
> c7d2361f7524f3 arch/x86/kernel/setup.c    Thomas Garnier            2016-08-09  1039  	 */
> c7d2361f7524f3 arch/x86/kernel/setup.c    Thomas Garnier            2016-08-09  1040  	kernel_randomize_memory();
> c7d2361f7524f3 arch/x86/kernel/setup.c    Thomas Garnier            2016-08-09  1041  
> 
> :::::: The code at line 971 was first introduced by commit
> :::::: 2f5b3514c33fecad4003ce0f22ca9691492d310b x86/boot: Move EFI range reservation after cmdline parsing
> 
> :::::: TO: Mike Rapoport <rppt@kernel.org>
> :::::: CC: Borislav Petkov <bp@suse.de>
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
> 
