Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C100115ECD7
	for <oe-kbuild-all@lists.linux.dev>; Wed,  9 Jul 2025 01:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752024172; cv=fail; b=DadaoXVGoGhd+3c8C1UqURO0CL80V4Iqw0L/VE1Eb5TGiqjYjLjh7zzEkEMePpCd+y4XrPxExFOFvCt3qcgD+QsXftivEFgOtDzqOzGX+Xboa3YbXnHvGX+crEGNi0kA5dUo1sbs7/gkg8emeixbkW1lU3UpYgL04eH8VmDNDVw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752024172; c=relaxed/simple;
	bh=HfBxUTeLVFD8C0khehKeGjmLnk++MHFMZuptbypecoM=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=EDwBu1TVFp0ajiJ4gC/yvHv3xG8R8MkYjyrcTYbNtCwA0gi8No6ymqBGMFC6u3EY5spNTx4ReR+MZ3nCRs2o7tEjlUY8QjHH1tpQIWVTSluJ4+Nu3gBo8UIzRbE7LRnqWDkgW5bwvpwHDA3nzMZy497ja3cIihsyhe/vEJoyb3Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aRXIH+bq; arc=fail smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aRXIH+bq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752024170; x=1783560170;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HfBxUTeLVFD8C0khehKeGjmLnk++MHFMZuptbypecoM=;
  b=aRXIH+bq4ANuF3i2/27wmWVLwQN7Fxatw7ZdOPbJMQrh2fKHAk6ym/MM
   AUdq1xX+Wl9NHNfghBon2BhGCuGz8TxA32AbRM8O7TisRQoB8ODS43eVa
   UX7HQtaSO8Y0SutOLojd3L6fzselPR/ALWRLag7qbxngnxPqnmjC7hf4R
   fCbM1TQ53Bvone2W/h0I97usjrNXPUoxGBjuu2VqIK2+ZveCuYLU5pMZ5
   zhJOr70wjrxuy6GpIhv43NRljsGzdIapFAStIJwb5xc6lyABlhmxIBAHf
   1WqtIJMw4No8Xg0vcQep8eVaPrjbIyOX4Lkr8cTiOyxoQ0xu/+JPHoZyx
   Q==;
X-CSE-ConnectionGUID: sOYG5tWuSOaLE4CW5LC5HQ==
X-CSE-MsgGUID: GbUpa9w6TXmoVT3bf26v6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="79711821"
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; 
   d="gz'50?scan'50,208,50";a="79711821"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2025 18:22:46 -0700
X-CSE-ConnectionGUID: 7+yIaNTaQc2BFUkHg9u3aQ==
X-CSE-MsgGUID: RP3QnDt+S72tomR4qYG7Zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; 
   d="gz'50?scan'50,208,50";a="159903036"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2025 18:22:43 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 8 Jul 2025 18:22:42 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 8 Jul 2025 18:22:42 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.81) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 8 Jul 2025 18:22:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PkRpsQFm5PgnN79fJ30/L21vnbnUfHxO8t9mvun87QQHfc+pflQUuOlQGvWy08h4KijOPBoMZ0fp6tWrhs8K5vaIDWANQLmDtFlRsZkDGUKcEBnO0COkvOX3trFoJhaZkN6NLErc++AVaQ+t1zRtAlgkXGjuN00TocPmkOunTKkDXy6N63x2OGsc1o68lKLdfZU8bZPSOZBTMuTii7+TVMwpPkzqd6QO+xMO7y4VUDHlrNnR+JOGyQLziRVHU+uHi2xBzBpMcsKSbXK7IfaoVyH+QrbD+QTcYzRSGaCUSLPL54wnTfhihjSKKx+pTAF1j+sWbLi14OdAY7I8HEy5Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/sqx7DuqN8eMhTPW+CGNsYkBRv0dmfii7TPiZ+aQSiY=;
 b=hYg66LUsQ/xViz3eIWSjSrTVUgH9E8OyBk9FU30tbJCQuG2PBpRNqARRet5wd+h9+I2EOuN5zEzod5piXdS/mc+4/WuhQ1cGUC5Esct7Gc8I+6sa7M1hreO0V0b/4XOEnYM7Eo2lCcTFMYxEZ1bHwyxNWO4i0rHWxtIVqRIuoHU58I6klKah00xM/bgsgr0JWRgOE3BNygSkEyPIwXkW0wYkphEPNjcTfxekCyd6KFwEGoVle2pNIeJV69HZKf0QN5PlQJN5A/VnLdjaCtzEFdeHrMpnRfQ17uvVcgiM48tRWQW/24GgDD1Y22ToOgAIwlUCqNDDGj8k/wsFvLNZ+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5674.namprd11.prod.outlook.com (2603:10b6:510:ec::10)
 by CH0PR11MB5313.namprd11.prod.outlook.com (2603:10b6:610:bc::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.23; Wed, 9 Jul
 2025 01:22:36 +0000
Received: from PH0PR11MB5674.namprd11.prod.outlook.com
 ([fe80::77d3:dfb2:3bd:e02a]) by PH0PR11MB5674.namprd11.prod.outlook.com
 ([fe80::77d3:dfb2:3bd:e02a%6]) with mapi id 15.20.8901.021; Wed, 9 Jul 2025
 01:22:36 +0000
Date: Wed, 9 Jul 2025 09:22:29 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [norov:fnb 12/23] arch/loongarch/kvm/interrupt.c:86:49: error:
 'INIT_IPI' undeclared; did you mean 'INT_IPI'?
Message-ID: <aG3EVW5EZTVG7HB4@rli9-mobl>
Content-Type: multipart/mixed; boundary="VCzJzWPFilP82Z69"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0163.apcprd04.prod.outlook.com (2603:1096:4::25)
 To PH0PR11MB5674.namprd11.prod.outlook.com (2603:10b6:510:ec::10)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5674:EE_|CH0PR11MB5313:EE_
X-MS-Office365-Filtering-Correlation-Id: 08d74818-42d6-4dea-488b-08ddbe871663
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|4053099003;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Tuy1C7FzgezLxUbUkUPzaIo1POQ4fS0nbLxu6HhmdbDLia6HgRvew7DlN5pB?=
 =?us-ascii?Q?sJMPKN6WJx6maJMz5KOdUYScqhwdz8Jam6iuvuYbCwC5USCYkLXSWx1QOEwJ?=
 =?us-ascii?Q?Z6wE+GtiL5Ll/MtL2lkX1CyfuI2EikVbpO/w5MEDoulzwHsY6h41Wmmb6Nxy?=
 =?us-ascii?Q?+SJv/DpFb6g95o7tvtFcoCwxnSbBHZWfO/S5X2Cm092o+g7w5do6EtS7OYSa?=
 =?us-ascii?Q?BbW5J4MNA3/X7NgamM2VYcKj019m6zhtd160FNFWiPSqPtBsLpscLki8crIa?=
 =?us-ascii?Q?yrDV/3DCy3oZWilmx7vWo9IHDV7vkqSw9nvHn/bVq7xTGhevdA7p2aVdgbY8?=
 =?us-ascii?Q?ZBBflWBNgAR9MQvcuApAKYcNYRRiLFhD01IS0H2FO7uunDyCWc7YPByJH4Rd?=
 =?us-ascii?Q?obH4jwSHFv91gNQex+qPo+ugeIzS6C95Uz9cV1VVF5gcES/KoZo4dXSofCJX?=
 =?us-ascii?Q?ekvzqtb1wt4Jbxot04twI0aQPo5UmrNH4xEFrjiheXj2u8MGrv2Acv/hTKKJ?=
 =?us-ascii?Q?JFLJ2FVH0p46nAM0BEbJA6Rx997QPnOAuOczVcExB4dgDXwHgp47ia+WrOs+?=
 =?us-ascii?Q?hgEx7r8K/k2iUDnukC+NLlpR2edKNPTOLVnc+fLwHMbshYY3Q5Di3oE9JTD6?=
 =?us-ascii?Q?I7D8kUbweNk0t4rYWPPBW/PduyJe+HtkifMEzvSbEz1qHuHdPitEsRfoUUnu?=
 =?us-ascii?Q?ltNfzt+XCpTaW55hnEr8uJaIParwwZ454YEpaxJ7bPNgD1E79YXVYYKdddRa?=
 =?us-ascii?Q?iqYUgb1SbHcvXwCl/6ATj1pAAxf+K7mkiQMlUS6EriasXEPWlcmdoFLyCgB3?=
 =?us-ascii?Q?+miGB7N7xsaF1AN1VVMpjQhEGPnzrcdrNn4WKQtPSs31vjI8PVjLi/PKg3ji?=
 =?us-ascii?Q?SPGeSQHBoK6mZ0wcdDVclURP2oJ0Th+TBjiurfElCKKKfMxrhcQRhilhjeqC?=
 =?us-ascii?Q?IFK4jUZrWFsCXo++4bCQSvwmOdmc8u6ntnU8/LvGdq4RQDJv/BX4pREAJthD?=
 =?us-ascii?Q?HKxBrspRNvnT137dljxRu2sLSlbeqNqpDJKGXZYO/SV7kwiM7TG/kQRMK1J/?=
 =?us-ascii?Q?NugtjCMGDUBHYRq7ludEQFO8QM+dnTdJMEk+s90AxBDtk17Fxrl+dygW2xEn?=
 =?us-ascii?Q?GJa9no5AWbuNwOQmcXDJXm39T3bdKHZpVBNbQO9bm3lUmUiPdb97GjdnNVru?=
 =?us-ascii?Q?3X11dMWs4coIfciwEMlZF/+FV4yldZhL7OVoMeZc8ZUBcYsfhqz0mqoa8oxw?=
 =?us-ascii?Q?ZrP2LW8PHC6Tl76l2k0LvjumkIncRo2nadIQ7KB1HWwi9b3SumsoiMaDNhXv?=
 =?us-ascii?Q?lQecorY1IQ+sDNX9Dcxe5PkQNQq8zSMk1zlY8IE+VkwcsCtbqPpyJZ2LOCL4?=
 =?us-ascii?Q?ns1Yln22PEn5USP4pXNehmBHa2EK?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5674.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(4053099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4NqaZxH835u3ZRrqjbL42e7o1GfG2cSYY9RsMN3iTrOxzPV45FrxkpV111NA?=
 =?us-ascii?Q?ZBnZRMXH9CcXRJY48WMySFLw6uAU0+jHss89sPecW8pStKZa3k0lfITH1MKl?=
 =?us-ascii?Q?mr0l5ORL7bCuo1T6GUK+FMJ/x62CAGipyICycio1Du7hKB9+HhtiK5+weA4l?=
 =?us-ascii?Q?t5wx3+pLuGi9cEd+VQ0xAod/zM0EdQ7uVxkRe7NwUoc1S5bWZWB7GyHiz+ih?=
 =?us-ascii?Q?O4U2PakJH7CboMeUIDn+kbzCnNKoy1bvrd+lgNwt0aDGlMJmLwbTmN3km7vX?=
 =?us-ascii?Q?mdeg5LfupUmYEIkHgqQ2v3XbtGAySrSCBaafa8XeASD+YFUOrVcLFfZkgJKI?=
 =?us-ascii?Q?7nWnrUAVzQBR/W/QaExCi/zYKjS3YKBBlmxbDSVsfEYHI9+pkY1fJnJVwg8r?=
 =?us-ascii?Q?TUicyupqbmX33hXQgzSIYgM6NmVhPxbBcZi/6zzHXGIaXk2BPmDIzLxlaatj?=
 =?us-ascii?Q?/WTg/biWG8M1ur7RpOkv9Wo3j5dplsdOqMvkv+NkfDCZgl3d53E6N7S01PNX?=
 =?us-ascii?Q?WRsO00D0KhzJ/rrvWicPWlvyfHn7rBMVPJSXaT1WumjyzkQmbTtlPj9tWz32?=
 =?us-ascii?Q?d+zKpM1W8vatiN3mz6XNI+BsiMts+zGnhgkwKE9zT/xorau+nFFWyukTrGXG?=
 =?us-ascii?Q?YOxKIDopajOlrSSfEasia/LjrYZeDQl9O8WkAR+sP0AbUz3CsxHbupmsFI27?=
 =?us-ascii?Q?8P1W+yGgm/LLvfihNUXi4AYWmFPQEoOBmxt0gDVl3bRzodeg4KkTyVc7rF6j?=
 =?us-ascii?Q?yBLXv+K+q9hWme8HARHXeFjsUKGIjWcbLutQdUZKWO7IijpKFWHGFQ4LqoOv?=
 =?us-ascii?Q?/xjU4iJ/X2+9EdJD5cRe9Za9dmrFXP622Vw1uuPvSKJCuaK6eqVl3H7rzGpU?=
 =?us-ascii?Q?wQF2TUtNei27v0OkpwyCejMPvUx2IWIJ2v6CuaBL51duP4ni4cpSTlTR0k8M?=
 =?us-ascii?Q?HPjekxYChRl5cU9IGdxocCVK9nIOLnWagtrTJ6VMsyiSj7b1rKXgP5gV/Z1/?=
 =?us-ascii?Q?7MHK4nwrqV9oUNbwRK01NAqdOWA3sxzgvByeVi4REHD6KnmRYRPGYeFRNJsf?=
 =?us-ascii?Q?rw+zqii82R0WoY9AWo5RPa67jvcMTBQMWUsRtUIPyxoiu60a04psEsKoJhJl?=
 =?us-ascii?Q?xDq7A9JrBKF80m+3PTpZGac9qye7HONn35T5Qq7R8uDwQj6jrFRk6pAyOoyi?=
 =?us-ascii?Q?iETglM1tIqsQ7+Cf0EYrZIiAhX9x2TG4f7GndzKmhU4bDzFRGlihnSzo8ppM?=
 =?us-ascii?Q?z05oXUOaL9dx5DQRloy2+pl+OuVeMR1oYdWzscGird1ubV3rJJdnMQtcy1/k?=
 =?us-ascii?Q?sb7iGghALIjQi258zJwe1/9DxmfYVCCDQWT0qWT3DnhqM+qyb9L+0JbV6ULX?=
 =?us-ascii?Q?oQUB+0zR/yF8Xs7gTWzF6cXUisiN75nlI7h+VrlVwC0jJRzX7d0PZ3Gs3N7x?=
 =?us-ascii?Q?WlHyom5AUltRjBfbOKAILcJ0URJdvbvg991uLfOGnV9kWQK6IE1f+RJ7WQh2?=
 =?us-ascii?Q?vDr8it+d168b3uUMJfK3WJgp1KvZXEgZesrY4kmSXxpiEzOaeuOgDeAp+QnK?=
 =?us-ascii?Q?zy9TXByBQDhnC6VJ1vj9AxWcZqhj8pIbQv9tBuXr?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 08d74818-42d6-4dea-488b-08ddbe871663
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5674.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2025 01:22:36.6928
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZrHbhutjJsWoEIVi2FfxGdnEh8/HlWYN+PCKu2x1gdmgaSYKZsS8ipWtV2JoM+OmjY4SlpssnB1zej6JtwAd0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5313
X-OriginatorOrg: intel.com

--VCzJzWPFilP82Z69
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

tree:   https://github.com/norov/linux fnb
head:   4741f1d18daecd30fdbc9100bad18fb68e387d9d
commit: a97b3898486eedbf3913d281407275ce676df4d6 [12/23] loongarch: simplify kvm_deliver_intr()
:::::: branch date: 19 hours ago
:::::: commit date: 21 hours ago
config: loongarch-randconfig-r053-20250708 (attached as .config)
compiler: loongarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (attached as reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507082330.7MI68yX1-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/bitmap.h:11,
                    from include/linux/cpumask.h:12,
                    from arch/loongarch/include/asm/processor.h:9,
                    from arch/loongarch/include/asm/thread_info.h:15,
                    from include/linux/thread_info.h:60,
                    from include/asm-generic/current.h:6,
                    from ./arch/loongarch/include/generated/asm/current.h:1,
                    from include/linux/sched.h:12,
                    from include/linux/uaccess.h:9,
                    from arch/loongarch/include/asm/kvm_csr.h:9,
                    from arch/loongarch/kvm/interrupt.c:8:
   arch/loongarch/kvm/interrupt.c: In function 'kvm_deliver_intr':
>> arch/loongarch/kvm/interrupt.c:86:49: error: 'INIT_IPI' undeclared (first use in this function); did you mean 'INT_IPI'?
      86 |         for_each_set_bit(priority, pending_clr, INIT_IPI + 1)
         |                                                 ^~~~~~~~
   include/linux/find.h:586:56: note: in definition of macro 'for_each_set_bit'
     586 |         for ((bit) = 0; (bit) = find_next_bit((addr), (size), (bit)), (bit) < (size); (bit)++)
         |                                                        ^~~~
   arch/loongarch/kvm/interrupt.c:86:49: note: each undeclared identifier is reported only once for each function it appears in
      86 |         for_each_set_bit(priority, pending_clr, INIT_IPI + 1)
         |                                                 ^~~~~~~~
   include/linux/find.h:586:56: note: in definition of macro 'for_each_set_bit'
     586 |         for ((bit) = 0; (bit) = find_next_bit((addr), (size), (bit)), (bit) < (size); (bit)++)
         |                                                        ^~~~
   include/linux/find.h:586:69: warning: left-hand operand of comma expression has no effect [-Wunused-value]
     586 |         for ((bit) = 0; (bit) = find_next_bit((addr), (size), (bit)), (bit) < (size); (bit)++)
         |                                                                     ^
   arch/loongarch/kvm/interrupt.c:86:9: note: in expansion of macro 'for_each_set_bit'
      86 |         for_each_set_bit(priority, pending_clr, INIT_IPI + 1)
         |         ^~~~~~~~~~~~~~~~
   include/linux/find.h:586:69: warning: left-hand operand of comma expression has no effect [-Wunused-value]
     586 |         for ((bit) = 0; (bit) = find_next_bit((addr), (size), (bit)), (bit) < (size); (bit)++)
         |                                                                     ^
   arch/loongarch/kvm/interrupt.c:89:9: note: in expansion of macro 'for_each_set_bit'
      89 |         for_each_set_bit(priority, pending, INIT_IPI + 1)
         |         ^~~~~~~~~~~~~~~~


vim +86 arch/loongarch/kvm/interrupt.c

f45ad5b8aa9335b Tianrui Zhao 2023-10-02  @8  #include <asm/kvm_csr.h>
f45ad5b8aa9335b Tianrui Zhao 2023-10-02   9  #include <asm/kvm_vcpu.h>
f45ad5b8aa9335b Tianrui Zhao 2023-10-02  10  
f45ad5b8aa9335b Tianrui Zhao 2023-10-02  11  static unsigned int priority_to_irq[EXCCODE_INT_NUM] = {
f45ad5b8aa9335b Tianrui Zhao 2023-10-02  12  	[INT_TI]	= CPU_TIMER,
f45ad5b8aa9335b Tianrui Zhao 2023-10-02  13  	[INT_IPI]	= CPU_IPI,
f45ad5b8aa9335b Tianrui Zhao 2023-10-02  14  	[INT_SWI0]	= CPU_SIP0,
f45ad5b8aa9335b Tianrui Zhao 2023-10-02  15  	[INT_SWI1]	= CPU_SIP1,
f45ad5b8aa9335b Tianrui Zhao 2023-10-02  16  	[INT_HWI0]	= CPU_IP0,
f45ad5b8aa9335b Tianrui Zhao 2023-10-02  17  	[INT_HWI1]	= CPU_IP1,
f45ad5b8aa9335b Tianrui Zhao 2023-10-02  18  	[INT_HWI2]	= CPU_IP2,
f45ad5b8aa9335b Tianrui Zhao 2023-10-02  19  	[INT_HWI3]	= CPU_IP3,
f45ad5b8aa9335b Tianrui Zhao 2023-10-02  20  	[INT_HWI4]	= CPU_IP4,
f45ad5b8aa9335b Tianrui Zhao 2023-10-02  21  	[INT_HWI5]	= CPU_IP5,
f45ad5b8aa9335b Tianrui Zhao 2023-10-02  22  	[INT_HWI6]	= CPU_IP6,
f45ad5b8aa9335b Tianrui Zhao 2023-10-02  23  	[INT_HWI7]	= CPU_IP7,
f45ad5b8aa9335b Tianrui Zhao 2023-10-02  24  };
f45ad5b8aa9335b Tianrui Zhao 2023-10-02  25  
f45ad5b8aa9335b Tianrui Zhao 2023-10-02  26  static int kvm_irq_deliver(struct kvm_vcpu *vcpu, unsigned int priority)
f45ad5b8aa9335b Tianrui Zhao 2023-10-02  27  {
f45ad5b8aa9335b Tianrui Zhao 2023-10-02  28  	unsigned int irq = 0;
f45ad5b8aa9335b Tianrui Zhao 2023-10-02  29  
f45ad5b8aa9335b Tianrui Zhao 2023-10-02  30  	clear_bit(priority, &vcpu->arch.irq_pending);
f45ad5b8aa9335b Tianrui Zhao 2023-10-02  31  	if (priority < EXCCODE_INT_NUM)
f45ad5b8aa9335b Tianrui Zhao 2023-10-02  32  		irq = priority_to_irq[priority];
f45ad5b8aa9335b Tianrui Zhao 2023-10-02  33  
f45ad5b8aa9335b Tianrui Zhao 2023-10-02  34  	switch (priority) {
f45ad5b8aa9335b Tianrui Zhao 2023-10-02  35  	case INT_TI:
f45ad5b8aa9335b Tianrui Zhao 2023-10-02  36  	case INT_IPI:
f45ad5b8aa9335b Tianrui Zhao 2023-10-02  37  	case INT_SWI0:
f45ad5b8aa9335b Tianrui Zhao 2023-10-02  38  	case INT_SWI1:
f45ad5b8aa9335b Tianrui Zhao 2023-10-02  39  		set_gcsr_estat(irq);
f45ad5b8aa9335b Tianrui Zhao 2023-10-02  40  		break;
f45ad5b8aa9335b Tianrui Zhao 2023-10-02  41  
f45ad5b8aa9335b Tianrui Zhao 2023-10-02  42  	case INT_HWI0 ... INT_HWI7:
f45ad5b8aa9335b Tianrui Zhao 2023-10-02  43  		set_csr_gintc(irq);
f45ad5b8aa9335b Tianrui Zhao 2023-10-02  44  		break;
f45ad5b8aa9335b Tianrui Zhao 2023-10-02  45  
f45ad5b8aa9335b Tianrui Zhao 2023-10-02  46  	default:
f45ad5b8aa9335b Tianrui Zhao 2023-10-02  47  		break;
f45ad5b8aa9335b Tianrui Zhao 2023-10-02  48  	}
f45ad5b8aa9335b Tianrui Zhao 2023-10-02  49  
f45ad5b8aa9335b Tianrui Zhao 2023-10-02  50  	return 1;
f45ad5b8aa9335b Tianrui Zhao 2023-10-02  51  }
f45ad5b8aa9335b Tianrui Zhao 2023-10-02  52  
f45ad5b8aa9335b Tianrui Zhao 2023-10-02  53  static int kvm_irq_clear(struct kvm_vcpu *vcpu, unsigned int priority)
f45ad5b8aa9335b Tianrui Zhao 2023-10-02  54  {
f45ad5b8aa9335b Tianrui Zhao 2023-10-02  55  	unsigned int irq = 0;
f45ad5b8aa9335b Tianrui Zhao 2023-10-02  56  
f45ad5b8aa9335b Tianrui Zhao 2023-10-02  57  	clear_bit(priority, &vcpu->arch.irq_clear);
f45ad5b8aa9335b Tianrui Zhao 2023-10-02  58  	if (priority < EXCCODE_INT_NUM)
f45ad5b8aa9335b Tianrui Zhao 2023-10-02  59  		irq = priority_to_irq[priority];
f45ad5b8aa9335b Tianrui Zhao 2023-10-02  60  
f45ad5b8aa9335b Tianrui Zhao 2023-10-02  61  	switch (priority) {
f45ad5b8aa9335b Tianrui Zhao 2023-10-02  62  	case INT_TI:
f45ad5b8aa9335b Tianrui Zhao 2023-10-02  63  	case INT_IPI:
f45ad5b8aa9335b Tianrui Zhao 2023-10-02  64  	case INT_SWI0:
f45ad5b8aa9335b Tianrui Zhao 2023-10-02  65  	case INT_SWI1:
f45ad5b8aa9335b Tianrui Zhao 2023-10-02  66  		clear_gcsr_estat(irq);
f45ad5b8aa9335b Tianrui Zhao 2023-10-02  67  		break;
f45ad5b8aa9335b Tianrui Zhao 2023-10-02  68  
f45ad5b8aa9335b Tianrui Zhao 2023-10-02  69  	case INT_HWI0 ... INT_HWI7:
f45ad5b8aa9335b Tianrui Zhao 2023-10-02  70  		clear_csr_gintc(irq);
f45ad5b8aa9335b Tianrui Zhao 2023-10-02  71  		break;
f45ad5b8aa9335b Tianrui Zhao 2023-10-02  72  
f45ad5b8aa9335b Tianrui Zhao 2023-10-02  73  	default:
f45ad5b8aa9335b Tianrui Zhao 2023-10-02  74  		break;
f45ad5b8aa9335b Tianrui Zhao 2023-10-02  75  	}
f45ad5b8aa9335b Tianrui Zhao 2023-10-02  76  
f45ad5b8aa9335b Tianrui Zhao 2023-10-02  77  	return 1;
f45ad5b8aa9335b Tianrui Zhao 2023-10-02  78  }
f45ad5b8aa9335b Tianrui Zhao 2023-10-02  79  
f45ad5b8aa9335b Tianrui Zhao 2023-10-02  80  void kvm_deliver_intr(struct kvm_vcpu *vcpu)
f45ad5b8aa9335b Tianrui Zhao 2023-10-02  81  {
f45ad5b8aa9335b Tianrui Zhao 2023-10-02  82  	unsigned int priority;
f45ad5b8aa9335b Tianrui Zhao 2023-10-02  83  	unsigned long *pending = &vcpu->arch.irq_pending;
f45ad5b8aa9335b Tianrui Zhao 2023-10-02  84  	unsigned long *pending_clr = &vcpu->arch.irq_clear;
f45ad5b8aa9335b Tianrui Zhao 2023-10-02  85  
a97b3898486eedb Yury Norov   2025-07-07 @86  	for_each_set_bit(priority, pending_clr, INIT_IPI + 1)
f45ad5b8aa9335b Tianrui Zhao 2023-10-02  87  		kvm_irq_clear(vcpu, priority);
f45ad5b8aa9335b Tianrui Zhao 2023-10-02  88  
a97b3898486eedb Yury Norov   2025-07-07  89  	for_each_set_bit(priority, pending, INIT_IPI + 1)
f45ad5b8aa9335b Tianrui Zhao 2023-10-02  90  			kvm_irq_deliver(vcpu, priority);
f45ad5b8aa9335b Tianrui Zhao 2023-10-02  91  }
f45ad5b8aa9335b Tianrui Zhao 2023-10-02  92  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

--VCzJzWPFilP82Z69
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
15Ltev4HFuc23F/kAgA=

--VCzJzWPFilP82Z69
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: attachment; filename="reproduce"

reproduce (this is a W=1 build):
        git clone https://github.com/intel/lkp-tests.git ~/lkp-tests
        # https://github.com/norov/linux/commit/a97b3898486eedbf3913d281407275ce676df4d6
        git remote add norov https://github.com/norov/linux
        git fetch --no-tags norov fnb
        git checkout a97b3898486eedbf3913d281407275ce676df4d6
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-15.1.0 ~/lkp-tests/kbuild/make.cross W=1 O=build_dir ARCH=loongarch olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-15.1.0 ~/lkp-tests/kbuild/make.cross W=1 O=build_dir ARCH=loongarch SHELL=/bin/bash arch/loongarch/kvm/

--VCzJzWPFilP82Z69--
