Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36BC81BD9F7
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Oct 2024 02:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730340529; cv=fail; b=l0LPIVvSjKCGPcdD5AD+ngxabfj6YLYUfGLLgNynITodsBhMOW26oH5CCsjZjUaXpuZ73/Fq0cjOEvMoyfqdCpZgT08AI7wGQ279ua3fsaHjJfavj51ro5RwNoBVCreqk+xdcWHKP3R2rdLrwmPCC8/pCThGx/ydBsuUYosTA14=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730340529; c=relaxed/simple;
	bh=wqpXdwhcpuFmTlmTDUBYepErqz1+Xr9i5jAgtBtoW+U=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=HWDq2f831WLAcQkTfucSnoG2Kg6787dS4jU3y0h2sBFiZEeS8N1nuoyyyVWbrZj85muwwP+KoMN/Oj3Iel0anhbjMb1xSVTU6R5o0zvVGbQIbew/99EsnUrBnXJkPSm0BY3OMDKbUov386BU9jp1ZK06xgQ/MBsmbiHzvrfQV/8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E4Bknf94; arc=fail smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E4Bknf94"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730340527; x=1761876527;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=wqpXdwhcpuFmTlmTDUBYepErqz1+Xr9i5jAgtBtoW+U=;
  b=E4Bknf94EyBzo7OVyylEZPASNqa5Hy1jGC7Jl3QPAKmTbS5RSed3y3YA
   JVDKHWzL+PJIt7ATWK4kEl0htQan6wA+vYRNq8v1HhfYwZakFyIQ3E9Db
   5I3KHJI8lPDEy4mk7wkPaKC4MRIfT6cHSneU9O3iPTzHYsyoD5v6jmsld
   liz6fk58MlPC8hodaZw89G0ZqJD0wZj1uAqBH81RjgG7Hbk6Ap/18tc9+
   NSz3FidYao+aiQdq+hWdyM1mfrcOSWrL34vm203uXn/wFQZX/BcZEtDdf
   8OHwTCYvIXxTfQjzEdxMAmD/fgNMXjJpzxacXWuMVdX5b2N6FZ8khE+NT
   w==;
X-CSE-ConnectionGUID: +FM/t9yDTQiHae554YWDyw==
X-CSE-MsgGUID: WkZZ1IDJR2+TVgclzk9BTg==
X-IronPort-AV: E=McAfee;i="6700,10204,11241"; a="29483445"
X-IronPort-AV: E=Sophos;i="6.11,246,1725346800"; 
   d="scan'208";a="29483445"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2024 19:08:46 -0700
X-CSE-ConnectionGUID: 81yqaO9sSWSEY65UDJvwwQ==
X-CSE-MsgGUID: gnBHLPZuRH6SgQ58uJ9qGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,246,1725346800"; 
   d="scan'208";a="87050421"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 30 Oct 2024 19:08:45 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 30 Oct 2024 19:08:45 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 30 Oct 2024 19:08:45 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.44) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 30 Oct 2024 19:08:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vi3zSmnoDrbyBcCDnD6GK/BgKtaNLsxRoEyPtDpvA/VGVcR77FNbzFii2Wh1uk9gbg4xurZTg1vicH4V4KAPfp6dfa3KwI37kPqp841P4+NRmdOyuVztb/QLPRDRtPkAHNEgFzlAbGGt1YrpAb0UTOO8nW5lZlGk6XRdE0RDCUTOEL/gg88ZlsNS4K80Zsx4KD2eMLjejCkEh941lPgSw3SaN0gvpPGOlw42g+6FQTl++d/AS20iDewm0eKBnTBolP0I6mQdrdg7qtVw8AjM3v+pjZ7y4+E0iFLBkTdkNZoJNuL0Ae5lBsh5mhZOrvodz/YxkvR9ouGSMOajSSV1zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gEo2PlctFJT9NrjEjEPwgK73ozxEagtIRxY9gbB78VQ=;
 b=AiPPpIQJxZs03gBOwMCIJ2O5vSO2BxIczU/CuJC6iXhKJRFDMlF5Qv9oKl+VTbqiZRSrMAR/MBLrn0A5wAhKNQqAjE7ZOkt6tsbj7HakC4LzCs65RTGeS0SuFWlyXfZHrrHQ7hhWrxY8FnpTu01uXpUmMWNrDE6crd/nW+mbK2z49JKsTmt/UJsCtWyQ5iaApQj//dFwZ5A/YlwL4Euh88m3tCpqLxgq/eFY6Q0OiyNnF9nLmUg6/yw6TFl36EeHpBjvvEKZVJgNwYjgN1yx37mqI89YzgDbVQMlUAj3Bcfl/Tl6gle71tNJKTts55w/AMzEOQZRPW5WGO/lihCe/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by DS0PR11MB6325.namprd11.prod.outlook.com (2603:10b6:8:cf::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.32; Thu, 31 Oct
 2024 02:08:41 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.8093.025; Thu, 31 Oct 2024
 02:08:41 +0000
Date: Thu, 31 Oct 2024 10:08:33 +0800
From: Oliver Sang <oliver.sang@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
CC: kernel test robot <lkp@intel.com>, <oe-kbuild-all@lists.linux.dev>,
	<oliver.sang@intel.com>
Subject: Re: [paulmckrcu:dev.2024.10.27b 30/35]
 include/linux/rcupdate_wait.h:73:43: error: 'struct task_struct' has no
 member named 'rcu_node_entry'
Message-ID: <ZyLmoeIdoxGBCgCg@xsang-OptiPlex-9020>
References: <202410291131.mflSojdy-lkp@intel.com>
 <78daba3e-56b0-4081-a4ba-7e71936a387a@paulmck-laptop>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <78daba3e-56b0-4081-a4ba-7e71936a387a@paulmck-laptop>
X-ClientProxiedBy: SG2PR03CA0119.apcprd03.prod.outlook.com
 (2603:1096:4:91::23) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|DS0PR11MB6325:EE_
X-MS-Office365-Filtering-Correlation-Id: cb47549a-8cd7-4d33-b789-08dcf950f0cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?CbM1XJyGPvAvwByXtHmmvWBaYYSqbmdBSst8AX9SmCb3FHaOZyexrKmRuYzE?=
 =?us-ascii?Q?k/vqGwlSvp8+mXNZV1Ga6K8ecuJTIw1Gy39COr/XJwLHwXjGIf4CD/79u8es?=
 =?us-ascii?Q?LClrGJZ5Y28g6bZBIcOFS6OfsP/9QezR3A5YwsjOZO9VtEyGHMPJvp82b+gx?=
 =?us-ascii?Q?ztVMBwyMafAecG3QQ9jaMyh8pEG3Jo7qK/XYBSRB/4glPzkU/SzlaUVqsidU?=
 =?us-ascii?Q?Fg+V6RkuUmNxlJQoorNLOG3G2lqP/XYxyxt6TPVSiD7mclpXr5S0mDnl+KRf?=
 =?us-ascii?Q?9IVePuznzEaN428wBj/stAJD+4FiaJPMgeZSYhfZOyypF2QqrNs/gBaJ7qzX?=
 =?us-ascii?Q?SDqvAu7bz5ltuyR9XOrk1Ksaf+ihYLNht7GNEjrDQRVrcxaYNQXTbQTelrsk?=
 =?us-ascii?Q?A9SPJ61lPOw62N5+XIyxKZfL4ksC/hjv6tuZ41BC/OlR6JAgcF15wxjT7L45?=
 =?us-ascii?Q?gAJldqa9kKw3Jbg9KYcRILWA5tqiwNIpse5CGzVpRVk4cniJj7/+mJgDcKe9?=
 =?us-ascii?Q?GCPH2Ezn/rUMcl45cCdhnj6amdKVkcMW3n9pPUCm/wweLeiDPoXl3okXZgjr?=
 =?us-ascii?Q?DPAPl7z7OAs2jaB47mUUAfuAuAWhwY3BKMJ8ugSkkX+KH6pv+/tHMRo7OEVK?=
 =?us-ascii?Q?OEuuvA4sqMCTFdfa3Qv8i8+ZRh0Ja+IO2Dy2AfaWLrp8w9buCzxucF+lza1/?=
 =?us-ascii?Q?yDoOEOK2kdrrmX/i2s+qT93IWhk/Wy5k5kozkKM1+cT+sm+5+hi3Dza7uXhX?=
 =?us-ascii?Q?0bqGf8PYlCmU/lWiXuApRhAgZ08uvqqweKqYYLD5AM3ZZpUS5LkfJccS5OUU?=
 =?us-ascii?Q?UoVVLAbEoZ/8FDSOVkGEZRUWcpSQ3lzoTZfkdd1zKSnhOWMum95Pgcbb/c2t?=
 =?us-ascii?Q?lyrcD6KLsK2nnJONMDoyt+kaDUK4mrDuSOtqDesH/KdKVgrJMeGh+bUlEUdP?=
 =?us-ascii?Q?Aiu07H/z5Y04+0zl6ONAzVIDh/qK7NHCLLrd0CpCKIOmNaG3VCKSA9Q1p0uh?=
 =?us-ascii?Q?W6+9eOjyL3Sk+5F2W7qJV0iQIKM3ESR/ZCkdTACF4iqwnq0l0QN16+LlaIMa?=
 =?us-ascii?Q?f6pNO4RVaHlTW8Gw2uaBy3A81EW6AnVaK1mQiO/LpaYE3K4Ulr54RyyB3HM2?=
 =?us-ascii?Q?VAFaNh7Ap4961fXayCtM0coR+lJYSTCIgR5h+YW0V8PHfBqJjuP+Hzgl3LL3?=
 =?us-ascii?Q?JqhnVY0pY773nG4Vn7IgJIKQMVU3Q3ApYIOS1e5d6/2YStUUje5j5tsrsLb3?=
 =?us-ascii?Q?+3ryOvzY1VlCl4AB6UjTXnWu1xlMgKVQpTNP1lkEDg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Hw1NcsI+R6waIqFAVUgy6ATo1WK06ukEOZwAull8otUDQn9gBIF+aSYjtT+v?=
 =?us-ascii?Q?qlS6u3WBNqyKu035mMrGCIerdp49i4Y0k7MEba+wkasraf/IfN+dNjPbicpq?=
 =?us-ascii?Q?k4Qbu3e5XK7WYZKZZpVELbddB6NcLMjimYK6lc9dxNOJaB4XuFFXccXOoKRE?=
 =?us-ascii?Q?0PpQq9xK1RmhgVfNmzwzl2laDbIi4iCGaBSnwSWnZ6+mVW/tL0bXd/LP0r39?=
 =?us-ascii?Q?q7E7hpnbXh0ZnzbmsUZwqnWbJQcymx0UfNuYqtPU3TdMxO0OcyFHyGyrf7Yt?=
 =?us-ascii?Q?Ig9JW0dWkgCfwDBzEPWdJ8zTYH3RW6i6FitcQSfQ4FUSRjKMOHRCi2Fjjew5?=
 =?us-ascii?Q?XJmUHAghP8LRoV+ukR9DJGsh1T8xwhg3fR3JY6qDOBSs/MMtHekp8X61bMmh?=
 =?us-ascii?Q?tN3alost3bn8AL5ohLYQS9pYX50XCbrPIed8jhbsPO5IZi06596bLGwZA34M?=
 =?us-ascii?Q?twPP09tFL27sc1yR+rCzVVQDOPOZLnHahHAhBKYZxfUVwK/IEANTy13HE8qH?=
 =?us-ascii?Q?US8ShyWT2t3AL4xsrbRoKC+CW8mHmjdmVxH204te1u2drDilBQS8pC1ijT8v?=
 =?us-ascii?Q?DGIYBxMDkf+5cRGGslJi3LuFoGa68BxDUW0rXd4ZpV7sz0O5xR1VxhUIEPYi?=
 =?us-ascii?Q?Ku+XX3rwJ51CsK8k5sHMEpDphc7JVEVpebmIkdejyWI1bvVqB1gjvAsfP+0d?=
 =?us-ascii?Q?RofEH6gOg0H/RYZgsadwR0OCtFH0Stsv+5w/UQ50QJIiIw0MZtpovvJGdWmg?=
 =?us-ascii?Q?05ZTUuCgQvV1SuVN4iMycq1oD8p33B/42txmZWy0pwcmChNz9SG58hvX1Bbg?=
 =?us-ascii?Q?CYTjhhstD1wAJTCQAS5D/TBv0dUeoQVCc+MPdcHJqREH5gPu57mfQXwXOTT6?=
 =?us-ascii?Q?ktwnX+CIkg2PeYcVU1npnkR3cPoFrCU+r2CzB9PD3YFE4xXRTJ6Cgt/lDzvF?=
 =?us-ascii?Q?UeH6Gv9gtqbk3T46pMWhvtvQBAlWr8MEMqHm00GUwJerqD/D8nQlxlPfFoq0?=
 =?us-ascii?Q?pO0RLwh/+6AYI6j3m51kgJcPSi5hZW/qbfQr1KNBZQfn/2Kpvn1u2hRyYHTz?=
 =?us-ascii?Q?x3ufngjltnnhw/ofHJx89ufYaN1qQ09Cvq/N+CdqCAE1Ir9UKDCqObyf7Jus?=
 =?us-ascii?Q?kldnVIquYAh/W05YFXVhOojnpZkPKskr15IOfImRMk9xHA5L4wukggzwAbda?=
 =?us-ascii?Q?LgUEmJm5OtMIzzh0Q9/C7f28uwJl90tzd2p7ImnfDxRKbsApudZWobcqpqgd?=
 =?us-ascii?Q?yW/Spji2O5/wkhxcOS6UM45THybRZo3HWEi1gn3nyHBgYMsi0tLI+0PeCB02?=
 =?us-ascii?Q?narnQ7JN10Qf2eCWm8ojOUHiyuVNiIUrp3KQPKEsYtvClP7792rux60FMcRt?=
 =?us-ascii?Q?sHnnZ+KRy+gpCBryBII4nRlWvFkBjCl4Wi8KqfPkqlM1tQfpoX42p2GuQHp9?=
 =?us-ascii?Q?lGwSqIFDw/8+HvnMxbYLcrKStELWIKuoI4Y9Kb1/zimw4lPOKHiYWb1wWUkM?=
 =?us-ascii?Q?dQ+G8D4b9JERwvOjhZSoPioT8p4D5gBKsNg++1hA6DRwX4mPPKGR3Dp4VyrR?=
 =?us-ascii?Q?7vj0PJEyLE++8tHNOFU9Qa2fcYSqDzMaECHsaTZnlIxPJx7EK2RCfL4qcY9f?=
 =?us-ascii?Q?Ng=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cb47549a-8cd7-4d33-b789-08dcf950f0cd
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2024 02:08:41.5801
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8yYQGKwKS6nBYiJm9J9gQwR6V2xyf1JLG30TPwOBvLIeqIS9VW1Ln5hfIEWXWnzIzE2BcU0GTMUIdiBi/ouQ3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6325
X-OriginatorOrg: intel.com

hi, Paul,

On Tue, Oct 29, 2024 at 06:40:59AM -0700, Paul E. McKenney wrote:
> On Tue, Oct 29, 2024 at 11:19:40AM +0800, kernel test robot wrote:
> > tree:   https://github.com/paulmckrcu/linux dev.2024.10.27b
> > head:   452a4107123b99087cd0bed226f61436ca9fdd24
> > commit: 0074845ef7cfbfe41a72bf5561edc18b90b67504 [30/35] rcutorture: Check preemption for failing reader
> > config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20241029/202410291131.mflSojdy-lkp@intel.com/config)
> > compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241029/202410291131.mflSojdy-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202410291131.mflSojdy-lkp@intel.com/
> > 
> > All errors (new ones prefixed by >>):
> > 
> >    In file included from mm/filemap.c:48:
> >    include/linux/rcupdate_wait.h: In function 'has_rcu_reader_blocked':
> > >> include/linux/rcupdate_wait.h:73:43: error: 'struct task_struct' has no member named 'rcu_node_entry'
> >       73 |                 return list_empty(&current->rcu_node_entry);
> >          |                                           ^~
> > 
> > 
> > vim +73 include/linux/rcupdate_wait.h
> > 
> >     67	
> >     68	// Has the current task blocked within its current RCU read-side
> >     69	// critical section?
> >     70	static inline bool has_rcu_reader_blocked(void)
> >     71	{
> >     72		if (IS_ENABLED(CONFIG_PREEMPT_RCU))
> >   > 73			return list_empty(&current->rcu_node_entry);
> >     74		else
> >     75			return false;
> >     76	}
> >     77	
> 
> Ah, yes, ->rcu_nod_entry is not always defined.  Good catch, thank you!
> 
> Does the diff shown below fix things for you?

yes, it works.

below just in case you want it, if not necessary, please just ignore. thanks

Tested-by: kernel test robot <oliver.sang@intel.com>

> 
> 							Thanx, Paul
> 
> ------------------------------------------------------------------------
> 
> diff --git a/include/linux/rcupdate_wait.h b/include/linux/rcupdate_wait.h
> index 5cfe7586a9f62..c51235d23ebdb 100644
> --- a/include/linux/rcupdate_wait.h
> +++ b/include/linux/rcupdate_wait.h
> @@ -69,10 +69,11 @@ static inline void cond_resched_rcu(void)
>  // critical section?
>  static inline bool has_rcu_reader_blocked(void)
>  {
> -	if (IS_ENABLED(CONFIG_PREEMPT_RCU))
> -		return list_empty(&current->rcu_node_entry);
> -	else
> -		return false;
> +#ifdef CONFIG_PREEMPT_RCU
> +	return list_empty(&current->rcu_node_entry);
> +#else
> +	return false;
> +#endif
>  }
>  
>  #endif /* _LINUX_SCHED_RCUPDATE_WAIT_H */
> 
