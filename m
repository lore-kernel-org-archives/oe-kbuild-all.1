Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E5FEDDA9
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Nov 2024 02:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730947907; cv=fail; b=sES9Ip3ulCfu5A0BTX7fjRxriHcmcLNayhwqZdEARC80VGV50AoydfCC6LC2a9pKELdIEB/WBJ0UgYPwyFcdqDx+0DNZ32ccanjqrfbbIAYELhe5PB5AfKyJU7LXH+/kBlZvYe/TS8zrXap/XPF2StwsHmnKMoqdVCMYsMfPk3I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730947907; c=relaxed/simple;
	bh=TZb3L0Jp9xORkRfZC5FaTmECcPsdoPWSi2UEEA3zUh8=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=RmmSm/n4o+susRFjdzlh+rg6aU7h84vnToTeBszbHjdhB29gKbQqOveNbDkvzFi7LE0yRHDGWHbrUNxFXBNyD8lLpOGTkcmP3HvodOZfMT+P23gjmGkV8xUP5XLR3kF4+cqKunmegRThi0J63P7GlLg7FJjIK+jOADmO3YgHDgg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I/ftvvKN; arc=fail smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I/ftvvKN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730947905; x=1762483905;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TZb3L0Jp9xORkRfZC5FaTmECcPsdoPWSi2UEEA3zUh8=;
  b=I/ftvvKNQzZ6cICRiObvq3SJNkGzDNGG5XGUJ4GLcdcxLqJKADyFmntE
   J5VLNlwGssftcRZirSyKMK0fBNv7PODBywp3PKCosKlngjgobUvGcJPEM
   2IS4ggqNWLbuSO7Q0UMAhHxMN+rvRrfCrBZ2dYyJuoT9lV7YHtDZULVb6
   5IwszrsDK+eXQn1icOtYtlrD59hufjMQ1dqDSDMeikvywbelMpDuAjm1r
   VqbDCOK+KHhK4pmIvFLYUd8imFqCSso7h508EN7DxPGRbvnCMvRZ7yY9h
   iEY1Qp9a/l15v4rt1IbiteqaifZ33G8ekkTJdCwnox0J4U1xIbWP9QQZe
   Q==;
X-CSE-ConnectionGUID: xm4QhXSBQ8SaleJC/WYsgw==
X-CSE-MsgGUID: YVPd0nvnReqRvJT/kOW1FA==
X-IronPort-AV: E=McAfee;i="6700,10204,11248"; a="30877408"
X-IronPort-AV: E=Sophos;i="6.11,264,1725346800"; 
   d="scan'208";a="30877408"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 18:51:45 -0800
X-CSE-ConnectionGUID: kz6/k8BpSViKeEN8LicGyA==
X-CSE-MsgGUID: XGk8L+2/QialpbzlFv5W7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,264,1725346800"; 
   d="scan'208";a="115691328"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 06 Nov 2024 18:51:20 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 6 Nov 2024 18:51:20 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 6 Nov 2024 18:51:20 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.171)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 6 Nov 2024 18:51:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UdR822HvqMu0y0YqPdSBsOzk+RojtI0j8+4tUPjo6mu+0rhZECN22ZeVFJYIFPzGu7hr16gLoGLmFrqe7sjtBIqe3Ye0iLc0sImOJ6FJoEGNgeZlTLSH8yRUat7R11VJdVQUknJJHMuGbqZyvOrKft3FSSabbWzlXL70T5J749RuFxkkVeTgTrpRPQx5LUSXBi77+ZFJbBpnFhcYm8SPbYcUWbO0YvCCddsPVCIa9AU04Q3vKEGbWHX8STruhMGOOtYBWSLLYyCBmgmaeKRwPwysGTD53AjO6K5jhJhOdup5E3k/G/iq8hL1x8PsxIrhi1YX1yWTp4lgf5NuHvNRqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Y4uw417Zo0+6O1ytL9Z4HYoYAbNe7hNLRFM1OJBghU=;
 b=MLcR/L5AyyGy5qDveZ52qepAU29YypJ/upEYY/01eHF7PF3F+UxSxYVE8nUI00s0vXQSxgsfHlT8hAik5xk3HIO0c3UMxSjqmgufiewL1kW8rQe+XPsN9++bGjZui7rKPA/GLjNpMHtjSSAK58aWVo/dV34NUIfFy4gt+VGy1lTLTc80uJ/KIFuKlsknrh9ZOOEQkizAxOm9d3MYrsAnBBKT7UI3LRq3Ams6ERnq3nFrNcUDwLW8KyHh+kd9ghc4B7QE53bEUP2ObavPy6lEwJcR0u2ofq0baZpSRmOXwLT/+M0JP6SAWtpszcPBVrjPLIQH6clOIsZp4osymd6Oww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
 by SA2PR11MB4923.namprd11.prod.outlook.com (2603:10b6:806:fa::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Thu, 7 Nov
 2024 02:51:17 +0000
Received: from DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e]) by DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e%6]) with mapi id 15.20.8137.018; Thu, 7 Nov 2024
 02:51:17 +0000
Date: Thu, 7 Nov 2024 10:51:09 +0800
From: kernel test robot <lkp@intel.com>
To: <cros-kernel-buildreports@googlegroups.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [android-common:android15-6.6-partner_predev 81/81]
 arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: ethernet@23040000: Unevaluated
 properties are not allowed ('mdio', 'phy-handle', 'phy-mode',
 'power-domains', 'rx-fifo-depth', 'rx-queues-config', 'snps,mtl-rx-config',
 'snps,mtl-tx-config', 'snps,pbl', 'snps,ps-...
Message-ID: <ZywrHUEKasSDzgRy@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0159.apcprd04.prod.outlook.com (2603:1096:4::21)
 To DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5423:EE_|SA2PR11MB4923:EE_
X-MS-Office365-Filtering-Correlation-Id: 9172f8d6-2eae-49d3-fe3d-08dcfed70d05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|220923002;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?slvCuWmPvfRHCFUkNcVXpZYzfmGLlYzplRirSUagKiBVJZUeqjn5nDJnTZQm?=
 =?us-ascii?Q?zvppnww/cCHiJzuUUF1vA9fMfOGeGoJBkyGDpmqv9EcqEGmP2nuFcVkdGqcC?=
 =?us-ascii?Q?uvtu3gY5rkyrKUzs7t92pMhhhqT9NIp7gKte+25mSRi3SqdFPE7CLN+E3s0c?=
 =?us-ascii?Q?wDzn9oC2IQnj/G4/QaN84y6GdU0eV8COjvOdDMkeHYct0HPB1u07yQ6D7K0c?=
 =?us-ascii?Q?D9w+LayYZTuWVuBlo+0HnZel/fpiugArfrQrQqyYoDKzoxWB2d0Ee/CL1s1P?=
 =?us-ascii?Q?B03+mAUrscQPoU3yIfZckazxRet9WPNhh13iELn2QbpChAEypSBoVKDp1KXi?=
 =?us-ascii?Q?MayzyGvaGnjFIzmEk7/wLq9fVxo6xuGxJHFmTX2cIs7gdEbOhm4EWnr0YbT4?=
 =?us-ascii?Q?dCkFFqyl65kmCMFEOIfQl0MI2KBW5IKtZLYWdISOtWLXnRAmChiGd/kKKpFQ?=
 =?us-ascii?Q?R63Oq22wm5ghXqDLiIhtiuywY75PE2RbHRDdXRzmEfkP0mPRx3mIxySK/K5a?=
 =?us-ascii?Q?IYWy2OVy4chnQmHHxHSrlMknMEmMbWzpwN+vwuCh0blbUy1a4jGhA9SCdG2S?=
 =?us-ascii?Q?+uO2S8vG4LiJloJnGdDHpA3MKepK97PGSG6yjvENUVBBOAwsAu1GV97pTaAi?=
 =?us-ascii?Q?oL0damEusFKBu+hkkZ3Ylo33ZwAlxiWDdsUNacHeNQ+1MY9P4JLMxiS4+A1j?=
 =?us-ascii?Q?IXzD+JRJL6KypnvHfR9JWt8yXxIf2X6vhRGs3o1f2WHJooLu5664DdeDkkcg?=
 =?us-ascii?Q?0DTwoemIoFepxgBbgS4T1klAFG6PTMX9HFPShzfdnu6D8WcifSwleuHOku40?=
 =?us-ascii?Q?OMqwtG3TExID7EQvxoh9isIuacfMZGWwDB0KwjoA9r2NENunLqLaNVco2Snp?=
 =?us-ascii?Q?14sDbqknupnx1dI4Mdc5irWKkUXLqOhbs9zUxF1WcowJYGYePve6SKZVJk1w?=
 =?us-ascii?Q?Fb8+Ow0N47QWXgttxKU5Z3Q6ZIO28Nmc2W45R/ntCsB0cTsOf64vG/zc4Ctr?=
 =?us-ascii?Q?gpu4jKi/pvvuR8ZWHF1sg8ajZay6fKWdyi+mIpAxZOyV9XT8EBJjdEwvDusD?=
 =?us-ascii?Q?eZP2ftzAc7Mkm/EoscDxzXardWxvOmbjiM7wffUkoJkz1/tOwtkKBly8TDiU?=
 =?us-ascii?Q?hb11cpQ2M5XIIjb2+5mjnHOw2YlFk8nX3YrxUrjK4a+vdHG6j7UGyhShpmFQ?=
 =?us-ascii?Q?zWrlJvjOOxVp5iFDo/s/CM5t///LjQ0U5rEgrLySYohIMhVY3DhbecBJG9UY?=
 =?us-ascii?Q?VBR2g6gXh/dgGcP1GPfab9zQGM7jA9vBQXBWmFYQJEa6TLUQRQkopJRsUGzn?=
 =?us-ascii?Q?12QUtrirgOmV7bKB1HCkDsLc?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5423.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(220923002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sr+Xwho2qyW4+cwxJePOv0zS6gOhYujnWqLLBXaVyTQBf57Rk/cSUb+hVUuk?=
 =?us-ascii?Q?0J+J878CNzUp6fVet8XcLyMbe8qe3wKvm1xVgqaz4wggoMGXyHEcR9GvhrO8?=
 =?us-ascii?Q?oDlEgxHfJnQZMpCMlBy/HUnGZcQrgBzvEoP9HkGpYZuZFlCmh9FZL0c0SWjY?=
 =?us-ascii?Q?sUhigU+nBc632YCgQqfQbFJQyaYDYJSzlx3CPAYba6Z9HlCOCG7+n6/8A5Ik?=
 =?us-ascii?Q?9QFQGmrqtNzAccjCUynMOdTdWybFHCHNSR79pB3foA+tflP9UL5OJ6yJk8uN?=
 =?us-ascii?Q?19xl5OGtAM3+z81+qg54EKoCaqZw3rSWEgCxX4sVrRBApvKeJ8j6C+4C9wOK?=
 =?us-ascii?Q?FCP1xdOO90WvJ07OxmVXy09R1l/V+mBRFcOIIWxO36OUFX/nExQxLtvdN1+x?=
 =?us-ascii?Q?NAC6sCoGdQ1JSlpmUyKYIsNEdbjPSIfarW2qYN1v0Skc4UfKqyNyaXaQBV2r?=
 =?us-ascii?Q?LDbLQOhm2OKwzYp8BdOjJUN3Yl3g746tyfhKC8YA4c1vZT9tyokrMDhXSjyJ?=
 =?us-ascii?Q?nyvCaZGoYZg6/iGU1jRtF516ri3DbMC6G86sx5y5bj9TyzGTHUlSkyGJ+Cxc?=
 =?us-ascii?Q?DQ7S1PhhXVv+fFaEGGdgfrh2vL6i2a6Z4gXhJq9AUqwnmGrjSmDirwyh0mIm?=
 =?us-ascii?Q?7VO9o2i6ik7IVLCvGOvRQ/ZMInvivWKnmHEEEihqgfZg+XbN9KZfd2Kvh8v6?=
 =?us-ascii?Q?/7geoB5mKpDlOje5QISgFPU73efwVUb5NwrzOxinCpdVV0g1VjD8ivdOih0u?=
 =?us-ascii?Q?SORlI9L0BjJHhwsVGVsLoAM9O4ibNJxRTT6PbQCXSG0c0A00ASPnSU2PoSQw?=
 =?us-ascii?Q?bFMadMrKTpLLtMKP+xL+8BdUNxUYZCzY856IbZialxynM4lkg9vw6cHq/04g?=
 =?us-ascii?Q?KfZu2NS0sMkG+RB2fDWbrc5TzgilH1eOwchaIwVRjYidGrtd2NLORnY2Bkb+?=
 =?us-ascii?Q?iDow73n0bjQsJBNHLiCc4EvqBg7EjFH7fObq8gNIsWo0HMtBxWIoW4O7vJd1?=
 =?us-ascii?Q?MKa2l32afma2Q2ULQi5E5FCEjaaYCiRVJkOwqRR9YE6NO+Ra9gCzlKnoWuIX?=
 =?us-ascii?Q?18VE1sWeXVKBRLwgCrT25DNpBLNO9EjXRFqmN3o7m4p78jzLhyWT3vEwJW/h?=
 =?us-ascii?Q?jC898WkhwFgeNwD6SzKBI84PjeBeZ2Oa3c6BdqMDfQomscCPIkvb1cWn0RAE?=
 =?us-ascii?Q?SsegZ7jCpPvQ9K2qheCZAizFmcqBgILDrv5USN4p2/vwdW23VDD2HVQjhuu7?=
 =?us-ascii?Q?IgSTLEdoN/KBn7lZ3tnBdhGs6ShkuSgjEQgvFE5qkHb883a5/lqDPBVuoezX?=
 =?us-ascii?Q?7eM/rs3UXnB4HuXEI9ookb3dnQHS84sZmaLqOpi+wjz2lYlwiWBrAtmnHWsM?=
 =?us-ascii?Q?XTLthaa/WZOHBqECsbPtZFl/JadJGzqIzfOQpeP2jHbPK13DyxYWXUT+65fj?=
 =?us-ascii?Q?QtZIjH31C7RhwhdJH/qYvwmoKyEtqhaECAwtSQyDVYxcw8Z1ap4/yq+eU0Gg?=
 =?us-ascii?Q?udbk4X02QoYmt+8ppg62NOlpqv1aY8mjjahnVyl3Ms0AxQp5vQ2irgddO8P+?=
 =?us-ascii?Q?wgOe2Bv6CN0jgEChNLwz6cRE3BVJsP291OJAu1/bc6ZbHf+2lNx6EgXM+AV5?=
 =?us-ascii?Q?uA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9172f8d6-2eae-49d3-fe3d-08dcfed70d05
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5423.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2024 02:51:17.2465
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q1p1wDmRSal2LWEe8ovZiDMIq1UrE7Dn+I9S/rHBzrEdfLSy3rt/bT4gPMgpuGwt/11F4KBPh705HIyAyp4ncw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4923
X-OriginatorOrg: intel.com

tree:   https://android.googlesource.com/kernel/common android15-6.6-partner_predev
head:   4f78c3d7bcf25a6712f168ec3e669c779412364f
commit: 120ab6c06f69b39e54c949542fa85fd49ff51278 [81/81] arm64: dts: qcom: sa8775p-ride: enable ethernet0
:::::: branch date: 7 days ago
:::::: commit date: 1 year, 4 months ago
config: arm64-randconfig-051-20241031 (https://download.01.org/0day-ci/archive/20241107/202411070207.6gluS0i7-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 639a7ac648f1e50ccd2556e17d401c04f9cce625)
dtschema version: 2024.10.dev6+g12c3cd5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241107/202411070207.6gluS0i7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202411070207.6gluS0i7-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: ethernet@23040000: rx-queues-config:queue0:snps,priority: [1] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: ethernet@23040000: rx-queues-config:queue3:snps,priority: [12] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: ethernet@23040000: snps,pbl: [32] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: ethernet@23040000: snps,pbl: [32] is not one of [1, 2, 4, 8, 16, 32]
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
>> arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: ethernet@23040000: Unevaluated properties are not allowed ('mdio', 'phy-handle', 'phy-mode', 'power-domains', 'rx-fifo-depth', 'rx-queues-config', 'snps,mtl-rx-config', 'snps,mtl-tx-config', 'snps,pbl', 'snps,ps-speed', 'snps,tso', 'tx-fifo-depth', 'tx-queues-config' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

