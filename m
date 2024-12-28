Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 350F6433C0
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Dec 2024 10:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735383333; cv=fail; b=Hje+zQ/d9e8LpkF2WdkPx9zKwlXHJ+RCVPtaYc8O5jk/njYLhI9vfzeRJj05abewQh73yzbNWmoytTxAcWlVsYhOYeNiuod0Ucs54sfV1L3Jqfm/bonO4DTD9bkRWsySUAgAJsKXuGlzQEqoajtJUGY8WjXbmMwvhxubS75Vw7w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735383333; c=relaxed/simple;
	bh=DICCgFauRm1Jl8w0/GxT5YhfBPYXgTTcdCnaSesS9eM=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=M0JFrG/edkFamPOooMkZ6ywexLg9MDh5xGuDNwILRLdacyvipX74E3f8d7z0ZoT8OSB1dMo5HtZZ6yXDc/ICLBcqx/q+ajmNLvST73EJM93xnDTqQPQPPqpt5rLMUL4SMK1uOSLc3938246g+Xp5DosKD7M0D477F4sYqnzNUjU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XEWxb5Da; arc=fail smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XEWxb5Da"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735383331; x=1766919331;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=DICCgFauRm1Jl8w0/GxT5YhfBPYXgTTcdCnaSesS9eM=;
  b=XEWxb5Dadu3f1alYkgkCKz6VKBKCkhVaIzv0aQrz8Cm5r+E9wmi97XUq
   IvXseLAPG+nZDX9LfkWOJh3jT6WfOfs6FOZI7+yUN6j72v8O0u9mfGjUk
   x5nVbCiy+vtBjtkuy9Kyn9orqVvE01s6IIoiwB6FsqUzq2ujpJPpDgNS3
   L3lWO0ZLxgd4SPJIAxfroQICMmNYsmy4qdpRBvsPr60GFtB0XXIULmUaO
   ZdxONzs8R/0W2Iw4ioTOtD9PIWSSfbo7yz5rw4sERNLWhQ1OYr/jLN10D
   qpgJF16bzn4tj/5gVSDZklq5yDaTbkCfe+XfwiqO3v+19U+xsWgcYIlS1
   w==;
X-CSE-ConnectionGUID: PlRf1+I9SoG1NFxV73ZHbA==
X-CSE-MsgGUID: 6hViPWBbTymiEL3GepXI3w==
X-IronPort-AV: E=McAfee;i="6700,10204,11298"; a="47171006"
X-IronPort-AV: E=Sophos;i="6.12,272,1728975600"; 
   d="scan'208";a="47171006"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2024 02:55:31 -0800
X-CSE-ConnectionGUID: H6vp9xZcQiC/xPtxBjUZ8w==
X-CSE-MsgGUID: EybC8KMfSNGQ0zK7sP+Caw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="100180447"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 28 Dec 2024 02:55:31 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Sat, 28 Dec 2024 02:55:30 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Sat, 28 Dec 2024 02:55:30 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sat, 28 Dec 2024 02:55:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y3Csmhb3b6wrycRm891/BfzJP6XIb66naV0SDul4sjgdgUx8x44NyUopuGtESfZcd0nt8yMVX12kL8zRwja33mAOrzs28gsuj366NoS17d8NldhVK94aj47y+zZIXhgZAXzXho60OI0yssVYm9dDzf/oe4YtgHvIte7vyblmJiu5naJjBpHPVnLofdmAUF34HXuwkwxUxT2dm6bCdihTo90pPoed9Mfr6nLzxiOFFfTEsffDRvoXSsYLb7Li/wWg0Q9nkBwqFZghG6K5FE+63bp83j7T5TZzUM7bfyDPTZkCPXhY1q2Is0CW+CZ6VkubPmFiL3GTRMe5WUFH7onvIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GoS8MgXh2UOhTc5xC42Fw45FXm8qsI9sDLgd3exFztI=;
 b=cU2m2s2zS1PsetLgJM9rKy6C9o09oJ1wottAW/KJ9+vMF3wBFAbyeeoCX8r88P+g5A5UtvNGTh40BZvMeZfyHrQ2gJ6g0Jrgkn5uo9pjVTBYDc7IofqZNQhYor/ybMivUaPhRn2ZFswSIOon5m6UjIWniNQNl5glSGv1ScmYWgv3LvcjmZi6LIjlrRo6z7DQMtouj9D917wVYK27O7tdoQe9KvXvTLYU723ndwxt520gBiOAsMqXyLAKOFz3FVcqo9ACNbHVvQmr5kzHBtb9tesxycp2jKGe0zSXHAnngHYFkJHTZdfp1MI7cl1WumAd08b2o0njt9ZdUP9BZ9gD0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
 by SJ1PR11MB6251.namprd11.prod.outlook.com (2603:10b6:a03:458::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.17; Sat, 28 Dec
 2024 10:55:09 +0000
Received: from DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e]) by DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e%7]) with mapi id 15.20.8293.000; Sat, 28 Dec 2024
 10:55:07 +0000
Date: Sat, 28 Dec 2024 18:54:57 +0800
From: Philip Li <philip.li@intel.com>
To: kernel test robot <lkp@intel.com>
CC: Krzysztof Kozlowski <krzk@kernel.org>, <oe-kbuild-all@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>
Subject: Re: drivers/memory/emif.c:70: warning: Function parameter or struct
 member 'lpmode' not described in 'emif_data'
Message-ID: <Z2/ZAVLdUD4hyryn@rli9-mobl>
References: <202412281715.ZOR40f8d-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <202412281715.ZOR40f8d-lkp@intel.com>
X-ClientProxiedBy: SG2PR04CA0151.apcprd04.prod.outlook.com (2603:1096:4::13)
 To DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5423:EE_|SJ1PR11MB6251:EE_
X-MS-Office365-Filtering-Correlation-Id: 9824058e-5435-4434-2128-08dd272e179a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?6GPDHOQylhhLbJbdZ0rUeN9ScFwgQqaoYWvseqzL5KYoEdNZ5DKyeiLBWjUT?=
 =?us-ascii?Q?lP3SpnOzcVaBq2aTTvOP5ARlaz/SjMzJoHYQm1uPMO8qomQnbWXv0NmwKvs+?=
 =?us-ascii?Q?Uk3kXp+ECP2b1mNlxzbS5vf1qL7xFdeJgsQxsyUCKyGXRg1aZypCT2UFfX7P?=
 =?us-ascii?Q?72Jge0cK64yZSiNtLxCnAho1XHOE6fDTiWmu0K/6NcUNxI7x1AJ7rPOz6d93?=
 =?us-ascii?Q?h1acvne/VKkxkjKWUiPB78jBGaKHYsgt6CWe5LptrFTUnOt+F25owwtKaQbL?=
 =?us-ascii?Q?kv2c7DfVBLxJbiZQUX/F9q/4qoLoM5Tqyg7BFOyB49vehoTNrM7HtJbsawEt?=
 =?us-ascii?Q?f27mXDlS0jpfDVRPicOOEH+Qq/MjdhUQr0GozlYaxBmPlzuymll4LL7ROD37?=
 =?us-ascii?Q?GPgP2TMQZho0onZ16QTjxgDyFN/bkslWIp8s/tV6VJo2x3Wj/Ve1A+bwqsA4?=
 =?us-ascii?Q?vz82oYV+ly+kYYcA/1BleA5tr5ucy/JZ00F+6tCzVksr9InYSZFZgV+2vYAL?=
 =?us-ascii?Q?/Ed1rV2uj6/Je0+mxqqCxyxNNcDbvw13yyG0LP8lv1jI6erRV7oajAEk/FVI?=
 =?us-ascii?Q?RUt7STlXMYUWDqxoC2rNjGlZYPSPMAE4araChlSK2c8xsLPv3OfLZwad+LxP?=
 =?us-ascii?Q?WNhO9KBfPvWEi9FR04vy8/wXc+mJee10Jd8ePe5UKTDde6Wmc9eGdXME8JSY?=
 =?us-ascii?Q?kryUWofPPJ1IXD/o+VNEkBY3fxAlurYGsS5imhePnF3Wmhjnu4SLfvgdNYpC?=
 =?us-ascii?Q?7kvGt9XCD89OTHd9ubSDE1IGx9CyCdzAa8e0ufb3dYJR8hn3PXnCO9sImgkM?=
 =?us-ascii?Q?yxBcQaXCinj2PrJIT1Ue4Ai/YIPEHlNwEE43xphLRidjHa3LXI8EtrbwxnmZ?=
 =?us-ascii?Q?jBLdRBns/It5IVB5kSqIxMFo6f7dj1gEXfbwDd4u4IJKSDkjm1EPOMPrZ1IG?=
 =?us-ascii?Q?1ZwsT+tPT/WJ+Hh2fJ9P8cqhZ7B/4DSOKq7tvbVcMvEcWDUWC9ipPhglifjn?=
 =?us-ascii?Q?3/RcdokQq+ARDKE7d9xQTmyjIN6q4yaCDrgU8gkOETPlyrc8FyFPvPaoekfz?=
 =?us-ascii?Q?yV8EnaRhJAgkgn4uJnQXV9mWtV3JS8MVn46/Pdjoz+5lGgrI9TNkW/J0rBtK?=
 =?us-ascii?Q?9jm9WgkLYbuw1rFEJ+RXNBO5n3UZhvGd3GbevwgQ/6gGcOBm+EuskJb913fg?=
 =?us-ascii?Q?0ILSKEF6vz79rAs4a+f/35WwHYIYXQgxU4ZexiiFgGNOQoCoAkFItCCSmnF9?=
 =?us-ascii?Q?Bic8tZ2ttG1DQV6IY7If8obcCfaLzB8YMw7DC1YjlHDXB3ScBbQZSHh7NImr?=
 =?us-ascii?Q?Cp1D9AK4Q29mqLTu/J0C1xjFhBmYdBPhC35pqaYxs+TPMA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5423.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NVT5eywj/4Uwwhb0TSYBUkWw4/ktPBs43QGDQEUhRhZDtgDOw1MTzRsuN4l9?=
 =?us-ascii?Q?bGVlhJyU2WbB13hxvJDIGAiVGT5qjxwnrFu35x4Pf0ElzOnt7/tTMzx1LcXi?=
 =?us-ascii?Q?B7CkAVW6HnhpMsZuY/tOEgryULtk44ugfVQCZJ+wMJzkbGMD4v9iTSo+lZNn?=
 =?us-ascii?Q?7A5KaY1SkIgLHzMrJoDzM6cvMPp6db7IOg3ttK8uRth1hG5nH1y/lwvcOjUN?=
 =?us-ascii?Q?Pd3Hxa8DRrLUW6nSvcZVI10WD2hkenCw9Ff8/gDBod+CF8oz1XQ0x8aGnrq3?=
 =?us-ascii?Q?Hm340OfpnEOVeTKSe4omioMdBKphNgnOVw/iGBq0z1b/YPI5y+CbXQhlQMO+?=
 =?us-ascii?Q?ztYgDmmiUeoly6MovQCW6+xk30pj/px7k9C7mgH1Sk7VKfAo+vypKQz8mhfD?=
 =?us-ascii?Q?G2zRm/kxyMCtGPIj0n4jB0tpQO12Gx9K5tQkWg245sAWfU46QZEuZIjobhWb?=
 =?us-ascii?Q?9mrviOO4ijNDD1XMqTZMIXeSXnHfLxhCh5mlaw6dPhBtZSrkEfFkXbVV7VOe?=
 =?us-ascii?Q?cYl5Bsa3NcIznKPvLe2HQHqz0RtZwSERclxkeXtG7LUO7o6jHc5mpy/qEYwy?=
 =?us-ascii?Q?HWOglDWBzAlwOOKeqOtYsAeAlE80lTyF8Mvs6DC6i62mb4dVsERHTAhXC6Hr?=
 =?us-ascii?Q?qA6bHRhGAZgF4qbPDpWb1yi+3gy26Qw5Gef1cxfoas338RVExM62avsYsYaF?=
 =?us-ascii?Q?EY4hlpTAY+4ttmiEh/X+CIRv6Ex30jPw2/mxJJ4tZ8pw9At5rPKNxTe1yFFZ?=
 =?us-ascii?Q?LQJH8ggxaX+JsClqM0crLhpiRgU802AvQiBUHITqaiCpoz7/VezBct8L9C4n?=
 =?us-ascii?Q?0yjZrJgexujrt917StTHfr4txs6OXmhhJ0diGXmDNjbPX/KTKs95UGtBSmcN?=
 =?us-ascii?Q?9XQT4VdtE9oM0ERVcB6Fp6c1ZP54UNqALf3B/V7UTubtjA/Jjh7RucAXrHZK?=
 =?us-ascii?Q?nUDC2hVVTlfXVPjUeGYhP3GV12loA0Kom6e8c0aWxzj7M+5OsQjaQKp3GU56?=
 =?us-ascii?Q?9a6HxERtmnZ8cPseaSemR31BfVqXEQ/GeqGmycGrsWL9iRT4g8pKqNrWIQfB?=
 =?us-ascii?Q?NyYlCBEAP1QC7f/QmnVIliDf0neyZ3GebjfyNkqGV1lzNC7+gUzV+IWyN3LP?=
 =?us-ascii?Q?zTE1OYHcvJ7ej9DxTN8YwcEsF55qmuMyT0gRkuzqgaIyFa2RzRMVFZKoG8S5?=
 =?us-ascii?Q?uS3Sry+7XUPTMNdbRFEbCwWrpegVuSdL6wl6E9ejtqcboL1JiQhPK3hKWNZK?=
 =?us-ascii?Q?M2nBYgfM4lU4Dv6R9EgEb65BP7Rg8X0ycpteTZxv4/5Ky2TYuWtZV/r/OIVa?=
 =?us-ascii?Q?PceCfVH6CWV0UZwXSCj9nDTwZ8zFhYgbiv3wpNzoELHXpFjopa69jiEwn/74?=
 =?us-ascii?Q?GLPCzTXaO2yvrnev61nlPxaO//3VyinnRgbqp0NdeTvVD85c+iz4Qb9MscFu?=
 =?us-ascii?Q?P38Mhzxm2j9ZxHHlfR2O4bi/pHCll2CLuCSjHJJi39d35zr09Mc39/IMi29T?=
 =?us-ascii?Q?A/PvWnSdW9DGp3aOhc+/+v/A2nvh6zX4+UXy5jQfoloZtSKWhZNwYipBtnBU?=
 =?us-ascii?Q?WX1Mmy8ZDvDTqDENM3uxsGWtBzew5dbby3eBjaHp?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9824058e-5435-4434-2128-08dd272e179a
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5423.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Dec 2024 10:55:07.7598
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EnOlstcSJJ07q7zf0LWHSyTeoC0fCXOdZzaN5mlJ/ZNhMCC6/zp5jXbH61ptnmBj1bLL+HvNyqetH6J+US8F9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6251
X-OriginatorOrg: intel.com

On Sat, Dec 28, 2024 at 05:55:47PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   fd0584d220fe285dc45be43eede55df89ad6a3d9
> commit: ea0c0ad6b6eb36726088991d97a55b99cae456d0 memory: Enable compile testing for most of the drivers
> date:   4 years, 4 months ago
> config: sparc-randconfig-001-20241212 (https://download.01.org/0day-ci/archive/20241228/202412281715.ZOR40f8d-lkp@intel.com/config)
> compiler: sparc-linux-gcc (GCC) 12.4.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241228/202412281715.ZOR40f8d-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202412281715.ZOR40f8d-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):

Sorry, please ignore this report, it is not the actual cause.

> 
> >> drivers/memory/emif.c:70: warning: Function parameter or struct member 'lpmode' not described in 'emif_data'
>    drivers/memory/emif.c:70: warning: Function parameter or struct member 'irq_state' not described in 'emif_data'
>    drivers/memory/emif.c:70: warning: Function parameter or struct member 'addressing' not described in 'emif_data'
> 
> 
> vim +70 drivers/memory/emif.c
> 
> 7ec944538dde3d Aneesh V 2012-04-27  30  
> 7ec944538dde3d Aneesh V 2012-04-27  31  /**
> 7ec944538dde3d Aneesh V 2012-04-27  32   * struct emif_data - Per device static data for driver's use
> 7ec944538dde3d Aneesh V 2012-04-27  33   * @duplicate:			Whether the DDR devices attached to this EMIF
> 7ec944538dde3d Aneesh V 2012-04-27  34   *				instance are exactly same as that on EMIF1. In
> 7ec944538dde3d Aneesh V 2012-04-27  35   *				this case we can save some memory and processing
> 7ec944538dde3d Aneesh V 2012-04-27  36   * @temperature_level:		Maximum temperature of LPDDR2 devices attached
> 7ec944538dde3d Aneesh V 2012-04-27  37   *				to this EMIF - read from MR4 register. If there
> 7ec944538dde3d Aneesh V 2012-04-27  38   *				are two devices attached to this EMIF, this
> 7ec944538dde3d Aneesh V 2012-04-27  39   *				value is the maximum of the two temperature
> 7ec944538dde3d Aneesh V 2012-04-27  40   *				levels.
> 7ec944538dde3d Aneesh V 2012-04-27  41   * @node:			node in the device list
> 7ec944538dde3d Aneesh V 2012-04-27  42   * @base:			base address of memory-mapped IO registers.
> 7ec944538dde3d Aneesh V 2012-04-27  43   * @dev:			device pointer.
> a93de288aad3b0 Aneesh V 2012-04-27  44   * @addressing			table with addressing information from the spec
> a93de288aad3b0 Aneesh V 2012-04-27  45   * @regs_cache:			An array of 'struct emif_regs' that stores
> a93de288aad3b0 Aneesh V 2012-04-27  46   *				calculated register values for different
> a93de288aad3b0 Aneesh V 2012-04-27  47   *				frequencies, to avoid re-calculating them on
> a93de288aad3b0 Aneesh V 2012-04-27  48   *				each DVFS transition.
> a93de288aad3b0 Aneesh V 2012-04-27  49   * @curr_regs:			The set of register values used in the last
> a93de288aad3b0 Aneesh V 2012-04-27  50   *				frequency change (i.e. corresponding to the
> a93de288aad3b0 Aneesh V 2012-04-27  51   *				frequency in effect at the moment)
> 7ec944538dde3d Aneesh V 2012-04-27  52   * @plat_data:			Pointer to saved platform data.
> aac10aaa8cc65a Aneesh V 2012-04-27  53   * @debugfs_root:		dentry to the root folder for EMIF in debugfs
> e6b42eb6a66c18 Aneesh V 2012-08-17  54   * @np_ddr:			Pointer to ddr device tree node
> 7ec944538dde3d Aneesh V 2012-04-27  55   */
> 7ec944538dde3d Aneesh V 2012-04-27  56  struct emif_data {
> 7ec944538dde3d Aneesh V 2012-04-27  57  	u8				duplicate;
> 7ec944538dde3d Aneesh V 2012-04-27  58  	u8				temperature_level;
> a93de288aad3b0 Aneesh V 2012-04-27  59  	u8				lpmode;
> 7ec944538dde3d Aneesh V 2012-04-27  60  	struct list_head		node;
> a93de288aad3b0 Aneesh V 2012-04-27  61  	unsigned long			irq_state;
> 7ec944538dde3d Aneesh V 2012-04-27  62  	void __iomem			*base;
> 7ec944538dde3d Aneesh V 2012-04-27  63  	struct device			*dev;
> a93de288aad3b0 Aneesh V 2012-04-27  64  	const struct lpddr2_addressing	*addressing;
> a93de288aad3b0 Aneesh V 2012-04-27  65  	struct emif_regs		*regs_cache[EMIF_MAX_NUM_FREQUENCIES];
> a93de288aad3b0 Aneesh V 2012-04-27  66  	struct emif_regs		*curr_regs;
> 7ec944538dde3d Aneesh V 2012-04-27  67  	struct emif_platform_data	*plat_data;
> aac10aaa8cc65a Aneesh V 2012-04-27  68  	struct dentry			*debugfs_root;
> e6b42eb6a66c18 Aneesh V 2012-08-17  69  	struct device_node		*np_ddr;
> 7ec944538dde3d Aneesh V 2012-04-27 @70  };
> 7ec944538dde3d Aneesh V 2012-04-27  71  
> 
> :::::: The code at line 70 was first introduced by commit
> :::::: 7ec944538dde3d7f490bd4d2619051789db5c3c3 memory: emif: add basic infrastructure for EMIF driver
> 
> :::::: TO: Aneesh V <aneesh@ti.com>
> :::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
> 
