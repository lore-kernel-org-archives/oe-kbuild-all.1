Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6483630274F
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 Dec 2025 04:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764823876; cv=fail; b=TvRAGe3cRqgkqfN+n2O1zc/OnZp58P+nyQC1cFjq2iDBxmdxnS56pBIS79W+6SPOZ7qmGoOmlXkcvlI5rLkyEPsjO9dNVzKiPQPMTO/ZGH5qjsgBRHQAqpLpLXhWAVIQhgPW2F7xZrxQJUivharlBFww9HDzoSkiNpX3wyyZPYM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764823876; c=relaxed/simple;
	bh=vUKBckZUlTN4OwXF4UR6suaGaTkLyOYTnd5lL972SxU=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=GIvJc8MUFkac6iVlemuCWZqqybZ2eLmd79t4Uu0ZVGtfFmqLURsvFZApLfo4j+6HJbNLT70NlsGAa7Kk0ZwLsbi/hb8AhZCniecUkyliayR2WGwQt+rmMV2aFoUT5Q8xi6DMI1If3E9bHJXEPcMa6hROUuJnME2IlcaYMh5uwPk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=er4iEfM5; arc=fail smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="er4iEfM5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764823874; x=1796359874;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=vUKBckZUlTN4OwXF4UR6suaGaTkLyOYTnd5lL972SxU=;
  b=er4iEfM5fEpDb46xXnPyR6kzw4pBMUIP2FD3VjB4U3NW7ngyKhwqcVdb
   Jzfd5hzXngcfjrLyVsQX5f3ehLRJjkIVlCTOvp+xBPNCWMA6bXdHw5KCy
   xPt2RG5AXwyGUlqFjO+Eh0Xt4CdUmaHNFv2Pf87WtxNMMUmQVsZ7JsL+/
   UE7X5aV9cYq6P2RC9q5P3ZWBUsUsPeksBshx7hNV+QN/wAWDFf+0raUpc
   yrWOFj9vk4bZib4BWM72SOBhGwjeg7PMeHImMIOfoGJKTtvXkrYMR7FFO
   hSx4IEo/GKIrp5nfQi+hhdWuLOvFJeVgmuKOFRBtCT3Ylt7Lb+t433LBc
   w==;
X-CSE-ConnectionGUID: HMSMOwu2S4KdMsustAIAdg==
X-CSE-MsgGUID: bhABPf3QQlWe9j5lXTGWMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="78186712"
X-IronPort-AV: E=Sophos;i="6.20,248,1758610800"; 
   d="scan'208";a="78186712"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2025 20:51:14 -0800
X-CSE-ConnectionGUID: xO6uf4tAQj++EwvF9iYylg==
X-CSE-MsgGUID: Kka1YxjvT1Kq4dVbotGnTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,248,1758610800"; 
   d="scan'208";a="194990337"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2025 20:51:14 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 3 Dec 2025 20:51:12 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 3 Dec 2025 20:51:12 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.21) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 3 Dec 2025 20:51:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FUoyuVLrOQonAKSDDrUUlalAiqO47ivM7yEImC4T3yJth1r/hW4qt3NLHQXs3JleV30LeHk+N2sl8C6a2/FSVWEdCuvvWrW9V2BtDRR7gcDSqvlEDeKcoxaexthnHyK5PX2rehz7nAYIXbQwOBbRwcYTzWQTrjzWllXB88BZ8sj/TCx4M/5drk6rZIrKU2+qrqEgNwEVuZDRCpRz32iHY0N7PcILB/xN2mIQPVCHx42ccIjw46ut8Di2VOcex9M6AS3s1vj/1jMHnewPRVzqZV0b7q5MnrymfUaQkx+Ngu2Jxh+1PtADQkGthcI0iTeXrmdOFM0yVD3ONMgEASSLSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gy9iDp0XdyLIzGB2gTJaL5fGTsNmYBoqgQLoBxDPJVI=;
 b=bIQLZ76qJ4a0cRlOQhvW9IfwiZ5CKgFul7dP5vP9iAvRd77SY8v8wsLlWzAw8nn+pkdPteHFGDQSyLxPx1ObeenvMGNGg7r6gtIqZRXPKogspBVk5+4YlvtkvXg9TK0GgSTaixo5a+ILV/tRh2r7jdgz+WSFQ3HVa6lF1b7Pd+DxCSK/9S+4a1Ri3u0RKGgRlcXUhrZmgJCwcpAWP+pCn4PpsAc4yU/NRLbsmQtKoDtVbCbnQAtnfWXt0FW9r81U0gsCM8Vg4dMLRqSSuHQ13dW0rmg7g7LQUq56pNN84J4Ccgz5RV0gc9kuW53iIqBCDfc6ats3Wnmqw+njUv6pag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by MW4PR11MB7163.namprd11.prod.outlook.com (2603:10b6:303:212::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Thu, 4 Dec
 2025 04:51:05 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.9388.003; Thu, 4 Dec 2025
 04:51:05 +0000
Date: Thu, 4 Dec 2025 12:50:58 +0800
From: Oliver Sang <oliver.sang@intel.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
CC: kernel test robot <lkp@intel.com>, <oe-kbuild-all@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <oliver.sang@intel.com>
Subject: Re: error[E0609]: no field `cpu` on type `&bindings::cpufreq_policy`
Message-ID: <aTETMp6lr75IPXBg@xsang-OptiPlex-9020>
References: <202512031219.3OgecL5W-lkp@intel.com>
 <vacix7xdfokw3m25ekthitv2f2bhiuicqq63ww22qn34mylfof@tddok7combvo>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <vacix7xdfokw3m25ekthitv2f2bhiuicqq63ww22qn34mylfof@tddok7combvo>
X-ClientProxiedBy: SG2PR04CA0216.apcprd04.prod.outlook.com
 (2603:1096:4:187::18) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|MW4PR11MB7163:EE_
X-MS-Office365-Filtering-Correlation-Id: 333ad5a6-eee4-466d-dd1f-08de32f0bb7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?qvV6ovR7dpn0PdUYZ3LmhNaIVEQLaEpF60fcxVGYxkAwFmR9bZlgohF+jwjk?=
 =?us-ascii?Q?fvJZOYupO2mBP9ZsTCjWMKkfkSgHA1XinRsQfd9ZB7S0rd9mXl0ntD/79Sll?=
 =?us-ascii?Q?gP3KRtXJRPbogqVnhOOqji0JBTnaxYQXsXHPYPAVf9jbQNPeqJGNrSvW5m6C?=
 =?us-ascii?Q?BC1GI3wv2cADGyIrfU+6FBaGiithXhaPBb18CozB8PeYs3Utr7DUrBL2B3Tv?=
 =?us-ascii?Q?q7aX3w4JaOTQIzhEFFeyYqPZB+Nm5/K8BYveHrwQ3PnYwr7woa8pph2ucr7s?=
 =?us-ascii?Q?EWEmWN/nnXCLG8s/WiypGR/B19eKVwd7A+azuUSlHqPWp68aWdg0SAmNfqkN?=
 =?us-ascii?Q?g9Lh33ecLTUsXLQ/FtcSWjINPA1ISd45fneldgx8YH7/vD3+c8nvjWXsO4Mx?=
 =?us-ascii?Q?Gc2WNATP/NjfgIqR83j8vbXtsvdvYEhcIgsnoT2/Lurbr9MATNKuO/siXXen?=
 =?us-ascii?Q?wBmvWw5L/t64LgeluafwAepqoQfmIBkXT5OSoHsdK0Y0mu0lpeOQXR5u2IIY?=
 =?us-ascii?Q?0/iANc9lSh4Qh3bsO7wPwq4v5nXLiLMB+smXeL+moSoUpaE+G8xmHGgJIvDM?=
 =?us-ascii?Q?G73u3Ue0qk4vOdDpM/MRzOwFYrJ/hqL4+ynUM5MH8MQhmdxgX7Jg+JPHMrrJ?=
 =?us-ascii?Q?arYP5mS6psYzy7WE7cQcHuzaI32uhQjFjO6L7z+/S8I2xsb64Xpx9RgUWaP6?=
 =?us-ascii?Q?5f/XJneo0EhtgRHOMyzstSUfLwSZ4z/xTBNfNEQxKTcJVyFKPxON+Y75kcYr?=
 =?us-ascii?Q?xXZwif7b8YTLCt/JvBxWWkqI11betdXBP9HfXb+HStrvNH3TWzIHIdeDnKMm?=
 =?us-ascii?Q?BJHSBkShuK9hr1xp4nKfZG0ZKExDtfDr9JaLneCW+OnJvDjENXabzUq3eG1c?=
 =?us-ascii?Q?tWrfk1VYShkm7Cu3/ksfeLHnn8KNqBpFc1kli1Qptw4LlkIuMG0xr1uKppd2?=
 =?us-ascii?Q?VtH0X1/5eUefGJOK77ARcsS20VUGdcoYnFwTt2+PVUQq8mjWmfHHfh1ZtMYo?=
 =?us-ascii?Q?7I0O+R+ZFTFnKgTsNhrhlhE7HQMOX7FYCunxIX/+eIHgDTbs+Vd7hqrIG+nM?=
 =?us-ascii?Q?odRI/SE/yaFdEjSEukj2+hhRaqlWVnS+xKZUcY++jEIfQMaCQ5eE33lTaqxl?=
 =?us-ascii?Q?GJVLGHVuyMcnvJmC28YgHW+/XdB8nxUaV41luJkOQS4jHtzxha9d95AvXtBc?=
 =?us-ascii?Q?lF0IM2HCEgqtvpMT6RXwXGVQ5h2bVRVF4hK0lJADXLnJ88rLAhjCwGM1djuK?=
 =?us-ascii?Q?7GOOmqGtThpkhwU9Js26u7igCGyfcL+Vrli5oNrDkyAqhsu8iskHiPI4GKKe?=
 =?us-ascii?Q?XwLZJvF4oKhWXHuTk3K/zEicRRauO4l1BxByCAg5zOqQIywglhXbHxkRNZB2?=
 =?us-ascii?Q?Hq/cQXWltgEOrkGdDCRI7x/7b9iefeV/Bb6N93ZbCJ7j+jnIDlzKcLQmxMmr?=
 =?us-ascii?Q?acVjNrq0HROAtjQG+9VNK7Qka9WgIl0vuP6OhAdopCmxHWYy0jn/kg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yF0lVzTXEKmHnp5j+inspL4qwt0BU22gKnXXh0PbPzrmQXH5j0y3I0wOB0UE?=
 =?us-ascii?Q?l2q8OTyxC17IXlEeskN9BWNQ8LBUPatQVDZg+QvwxYJK6WUM465N+x7S+llj?=
 =?us-ascii?Q?fZcCVM14T+lsG+cN3Mnv/C/2gwwGGwENdAFvoCdGYxRwyk89C55JlGqEgYpw?=
 =?us-ascii?Q?FPxv3QZ09XQfZDNXpp0WYU5WFAtq+I/nP7y+VGFFRLAnEWBiymSxKWmBtNkh?=
 =?us-ascii?Q?HE8Hsks5m3e/Ri4OJuLmtQHWT1jUlJOGd2COGxm62RVxy9t54Ulx933aI3TR?=
 =?us-ascii?Q?4pRyRlB4Kf+UwWVwi16uOCGo3tIGVdiQITMghLsySFcrbx4e+7t1VDigOlxW?=
 =?us-ascii?Q?uMMDaXnRaQw8czVotopF8OSFDJD97DvBxM4aKCqNiCmtkqVPdxDRIhWtM1R9?=
 =?us-ascii?Q?BHAaCHPwymaICPtGH99B5cwuUjPVWhHhB/eHY2n0aj5AANunxUGSoeiqCExX?=
 =?us-ascii?Q?/M9NWG+em3+CUQk76EI/ybR+/oJY76+fXQVhnnsR8xNiMdLIWfPWn7/Bl9Tw?=
 =?us-ascii?Q?0EQ5YOT1KVEo7Sfp5IUYd8VPTFSx4HINnmaXIUV4H2V97k/psJY0/hgxOV0I?=
 =?us-ascii?Q?jTBpsNBsASCgyhNl0gOd7a1h7Nl/3m/b4MMnINh65rg+7nAgrnRZRqcznS97?=
 =?us-ascii?Q?y65yVn5ZWowE9Aqm9h2oYjdCL6y7LorynzCXsakqBztjNfGOoZ1VlBylbQEi?=
 =?us-ascii?Q?3ek/Q5LQXfyfhJCoQVuDeh3Oi/6CTlz4EDFrw20nKo3RAD0r3VC+WYVBxAS6?=
 =?us-ascii?Q?qlVqwFESQySCaIfL8G7ymBWOvt8/Xuj2e5ruzICuTHpKtpEY5ZTB+yERVi5O?=
 =?us-ascii?Q?N7axHiY6m+QKXfcisrlK9NSwq7zIBmukYXuveqxkpzOAfYTw+Tei0LBzuVD9?=
 =?us-ascii?Q?fW8LHHWBJUz+7fAlypFFild2BbwtT/FRxkwW3y0hD/RpNrl3PoglDhOFdgkq?=
 =?us-ascii?Q?TwSbDJJvsbrf28xF40ePy6GjcSxD20qbxlYvXqoonCXoQ4pGVdLs2JBOntsY?=
 =?us-ascii?Q?NYgU5/Eui4E9lm+u7prdcTuQ3p4fOjAlMj11s+vnHG4TdskwCBLSahHFFPsP?=
 =?us-ascii?Q?l4ei1UvV+mBapQbk7ZNZZbgYSF0gBWdFAfes5mRBL2xCxDZxqTdn5kNAOlVK?=
 =?us-ascii?Q?/hf2ba8OOlTZWoe5QFQSdyjuAE8PBb7fGHcIrQtctCRQeofe1FqZQ14/QmgN?=
 =?us-ascii?Q?TIIXlrkvywIWEhv4S4xTakHvzDmcm+Fa1X0t9RCjF+izquuvEb5gx8nE2pX4?=
 =?us-ascii?Q?I/OVcUYPZ6SSXHto43AsrjJdXAK7TFNhW6atV2KaJyQINx4grJbRK5XzpgWy?=
 =?us-ascii?Q?IGAvRJQQ3SwutGcwXoNy4A98ACr2V/9Tw5QFLSW4DJpI8PU4WublT4Kveo2o?=
 =?us-ascii?Q?KSI9M+YG7sb+VKGNHNJY9tIydWCznWb0UZxpR/Vvy9S3EWFlupZedZLeqPx2?=
 =?us-ascii?Q?nnJVvD8hdDJcAfBcSKjvlbx3CeGPYBZusowyQ6WGW3pzCYKpylAOkrjrvo62?=
 =?us-ascii?Q?AIiFE72eW8xKCxMKndJV4wCbLh0l1aK5KDP15PUu7ZYCc7HT3wIXvYV4Mka4?=
 =?us-ascii?Q?42w7bqtUjv6DoT6cxVt57DsJAgyEa356R4zDzss135uLAtNX5XC8p3VQkWm7?=
 =?us-ascii?Q?0A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 333ad5a6-eee4-466d-dd1f-08de32f0bb7c
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 04:51:05.3446
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /BjVS/8BoM4d4gRUjIB5FOiyI/CjW7jILkMazqXtHRhzBDFomNA5WVijpL/0t6RGnbJaLfdMyVDEOrghSqZeeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7163
X-OriginatorOrg: intel.com

hi, Viresh,

On Wed, Dec 03, 2025 at 12:56:10PM +0530, Viresh Kumar wrote:
> On 03-12-25, 12:09, kernel test robot wrote:
> > Hi Viresh,
> > 
> > FYI, the error/warning still remains.
> > 
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> > head:   3f9f0252130e7dd60d41be0802bf58f6471c691d
> > commit: 6ebdd7c9317737123b260a24e2780018008f1295 rust: cpufreq: Extend abstractions for policy and driver ops
> > date:   7 months ago
> > config: arm-randconfig-r121-20251201 (https://download.01.org/0day-ci/archive/20251203/202512031219.3OgecL5W-lkp@intel.com/config)
> > compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project b3428bb966f1de8aa48375ffee0eba04ede133b7)
> > rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251203/202512031219.3OgecL5W-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202512031219.3OgecL5W-lkp@intel.com/
> > 
> > All errors (new ones prefixed by >>):
> > 
> > >> error[E0609]: no field `cpu` on type `&bindings::cpufreq_policy`
> >    --> rust/kernel/cpufreq.rs:462:23
> >    |
> >    462 |         self.as_ref().cpu
> >    |                       ^^^ unknown field
> 
> Is this still the case ? I wasn't able to reproduce the LKP setup, getting some
> failures. Can you provide: rust/bindings/bindings_generated.rs from the build
> folder ?

sorry for false positive. we confirmed this is an issue caused by a bug in
bindgen - https://github.com/rust-lang/rust-bindgen/issues/3264

after we upgrading to bindgen-0.72.1, the issue gone.

> 
> -- 
> viresh
> 
