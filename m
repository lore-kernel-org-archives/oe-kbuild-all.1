Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BC1B178399
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 Aug 2024 06:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722925721; cv=fail; b=dfKd1TLNhTUZc4KgsEvBRXLfvSh30BQZ1Jx0B+oXrfI463tTghQbGTHtUynyxZmYH/+Y0oUDSoNce2FNdW48dgt6Lum1y+xCcbJq+GoOupAzB2LCvxg16e5PJwuzc+L8uLXBBaMl292oSGTAY/bDIMSWJjRkEDdZKuMiLFTtYj4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722925721; c=relaxed/simple;
	bh=XlSomYJmaUK//6cktS0BP70bF94F4DJRLS0kBYu8V5Q=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=oy416N3/Jm8ranpoYllTBlLcXkMH+PClJtEhw+3cp8srpdlSh2EygS287pRvkAtlkqx1JnT6vIgKaqQ8UI33gwVkCU35FOyw1coJYV12hBHzwiCTxIpX3eIGA96GlMrjgEBvbqL/QSE6ciJ7TsNm2oXBPlpLZnAE1B8ipCaK2RI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d+NJEwex; arc=fail smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d+NJEwex"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722925720; x=1754461720;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XlSomYJmaUK//6cktS0BP70bF94F4DJRLS0kBYu8V5Q=;
  b=d+NJEwextCJgGNdPnPOMNj3FiSgZ94sz+8omN72t21KA4ZmdM9ZPWRb8
   GQKhVOloI4Y8YoCDCn8Ruh9nZuIoQ8Tlfr7Usm5fpZWrclHFc8uQ2nT0C
   wnvv5ObJBx5MjWYgtuAiaR14CSfuf8yI+cMNslB8dQx4Zpx+seqhQpeQO
   oOGxHjLBw+WzbFeteEIzi62KcHLpysCTU8FXzTMMLeEmBatdIygGnX2Yz
   KaXSygRxbGgHCpoQpF0e2DgXZfdq2nIz5P6nRZ0+g8KwG/eCIYdGDvTxt
   A4YiYirwtz0yHS241Pk2K2McmK8E9lXNf1mbzqdS1057jeMFpMnT1UjD2
   Q==;
X-CSE-ConnectionGUID: QRqic4L0Q7asyMnY6idHVA==
X-CSE-MsgGUID: U8Sho9bbTZahiKhfNwXVmw==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="32303516"
X-IronPort-AV: E=Sophos;i="6.09,267,1716274800"; 
   d="scan'208";a="32303516"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2024 23:28:37 -0700
X-CSE-ConnectionGUID: DzhzUunDRoGCsxqKb30i+A==
X-CSE-MsgGUID: YPD/LXHRST6t2iWb3HFBtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,266,1716274800"; 
   d="scan'208";a="60769360"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 05 Aug 2024 23:28:34 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 5 Aug 2024 23:28:33 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 5 Aug 2024 23:28:33 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 5 Aug 2024 23:28:33 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 5 Aug 2024 23:28:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tqvBo1U6G5qKclTFArUjy6vE1obCy8xqvxMtfl4L+g7l4azS+cVCsGi8FvQCjf9aFfzzI9j52+SNm6xUDzEE4mPaHZdBMZJQfocjU+XDGMZxRzu3yE6C74mTuMBNmmNHLFKRBQ+/JZVv5KVGdp8lROYx4F6jUwAWT+pV5fCW/1jlNJ8SpgPGioyOcFDd3oe87baL3qfHQeUzBxSYoZdbhv6U1x2/YONRg/dSfVdoHKrQ6nQCJhwmsuMG7NH1kARGgF0K0M9WutOYlZ5r5+noSsMuagflxLVwSrhKKXKAjZj2xkyTrjI6MRYHDLVwNemYQbmfW5g7ObXIAGGiNcpl5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tCl+/ytTSJJ/yArBygH7QQr+gpRh0pM4cbi7YphXmz8=;
 b=hWR85wM+91xIC17t5clqC+/JGU5y1zbvRGI8sxnnwVHMsouO0PzBdK++gIC2i8nEGgskbmiMprgNVKDhHupXKf5Z8Ah09VyhvqeB1A9PhfnZNCosd7mqOZ2p8oWG9hENVBhxXXAlucCJgS12KSyjYVKQbKSAxN6KSK/dB0kraHzFtY9X9rSzQZ7MYGtKB2ZJAqLcEZLtPiZ/Jb6JqIioK3GjkzmcybfjMemZjMqM1XZhAbptR9gXqRVpbRlapEJUdW3T1Wv/T/4V1OYAW+eUiz68HLC2sFDxg0ND+B+EEADiC/7KcUTub0Gs+MBHvbK8gBjAO7f3r1NQKXXkVcg3uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
 by SJ0PR11MB7153.namprd11.prod.outlook.com (2603:10b6:a03:48d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26; Tue, 6 Aug
 2024 06:28:30 +0000
Received: from DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e]) by DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e%5]) with mapi id 15.20.7828.023; Tue, 6 Aug 2024
 06:28:30 +0000
Date: Tue, 6 Aug 2024 14:28:22 +0800
From: kernel test robot <lkp@intel.com>
To: <kernel@openeuler.org>, ZhangPeng <zhangpeng362@huawei.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [openeuler:OLK-6.6 12699/13217]
 arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: ethernet@23000000: Unevaluated
 properties are not allowed ('dma-coherent', 'phy-handle', 'phy-mode',
 'power-domains', 'rx-fifo-depth', 'rx-queues-config', 'snps,mtl-rx-config',
 'snps,mtl-tx-config', 'snps,pbl', '...
Message-ID: <ZrHChhDBRwHvb7Mq@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0152.apcprd04.prod.outlook.com (2603:1096:4::14)
 To DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5423:EE_|SJ0PR11MB7153:EE_
X-MS-Office365-Filtering-Correlation-Id: 46979fd4-447f-4989-2648-08dcb5e0fce2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|220923002;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?l7XpeyenELykx9rJc7CGIxLpweccBrtuSR6RsMNpZhsv+FEn2cYa9dUYI6u0?=
 =?us-ascii?Q?e9PH8HnaoDUuWmHwP/OYvELndpXVwxOeJ/JfCRpNKxVnesWHQh2ktxv0eC2k?=
 =?us-ascii?Q?QPhzeh0SrlxfgCMOHZQGFawURN+dqLLTIIPtRgaevwJkx/yq45dqbDxIyjuC?=
 =?us-ascii?Q?6u65mM1YJvqxkBJIcC5u0GUmP/qnWN2GY651TPu5U1e4CthUspBUUNqKzCko?=
 =?us-ascii?Q?t3IjLD8tSAm/kEP5Z3mIAS3zmVZkwHwayy14yOFmkl4TPqLgsDqW10LydATi?=
 =?us-ascii?Q?4phMRzV+lv0CW0mVI4HEuImkvonI2ZGVV+uZHGH8V+gn9uOJjDZaMIOgRr2i?=
 =?us-ascii?Q?gIEWe+IUzsQhPZ88JkeuI5TH5hLfAw5OvI+olrcSXayK6eCQa9eXsOggYoRi?=
 =?us-ascii?Q?8ERdF9H1EvEa1m2ABUWhybs3hgNRHpQrtQ3dEiVRoe//etb56obRh6+SxC9o?=
 =?us-ascii?Q?scrFeB9sdFltLCU+RlAUanFUOfcv35QDP71c1ZGZzu4dy49masurAAMYKO5B?=
 =?us-ascii?Q?+HK+vBKdrU8c8Ke1gt/z1fMPhCaqygNzDfMUBg+6Z8qgLNKqn0Oe6U0xojeM?=
 =?us-ascii?Q?AREVvNQoPx9KkjPAHp7QdAhKg/lna2viZNkwz0K5b1T2Za5xrBW7jo0FxIPL?=
 =?us-ascii?Q?s7nhSaMpXMJoaitE4lS7LwqvzmuuLm6v9ZfwNgBOs/kPAIigzll/PtqUQfC4?=
 =?us-ascii?Q?jSS1jSOgFh3hLTWT2YBqy0af4OGJRAZEOXugrL9ES0jSlH7POxH9tMf0pA1S?=
 =?us-ascii?Q?P4+/nUYR56VySY16L+kZCzJSzRb78jB+mGRL8NNp8EpixkQuezOoqm4TCXhO?=
 =?us-ascii?Q?bogIFReC3R1I4FBgGxNFij4EgnfVk/RYWOFUCSkDSnj3hapB4lhUH8IaQO2y?=
 =?us-ascii?Q?YzPuJLh8U97Acqy+0IeWg3R8DZ19I7ffyZkVdPiMNB3UU5snTO8QBtPOOuCX?=
 =?us-ascii?Q?oixVZEoV0xijPpmQKtS9VHLefs3+w2T24ygdmsh0p2uXOCjq08skQb9N66vb?=
 =?us-ascii?Q?FwnBox/p1y+rlHo4kLrDh+jqWAzKCqUFEclhzOw/uh/nvn2EnwgnsLS4AEM1?=
 =?us-ascii?Q?8fidFP+HAo1nOXVIl67bHItxcbfF0ndbBXta2la4AjEBcaa54JTG1fW98vtj?=
 =?us-ascii?Q?KUlNJ3WczUhbK1nPNvGwm+KgYoCUzzraTPwYpFj1OqBAnKaCy21BLC2yXfr5?=
 =?us-ascii?Q?5DEKE0tE8+F0aPj67pO+VstTPOU2X2p4BfrZ9EuKI+u+rFzY52uVMFNfPM5u?=
 =?us-ascii?Q?av0a6zDhnSiOcFWaA6XDJhnjPWpX6IAInq0YKG+8BMILlJ+x2HYvVTj2RMM1?=
 =?us-ascii?Q?12AyZwfHC04kQB6HiJ+dFQrnKc7bQMbRJnzF+uGEFwd33+bNUItJ6lC6AKcs?=
 =?us-ascii?Q?/yMZmHs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5423.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(220923002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fh8hzTLhUKsM2K80OwQuAX9FlOMj6qUUT7a9j7eHE+tzY+dM4IPCv2KzXGi3?=
 =?us-ascii?Q?74AsEHFKFMDBoaXHDPCsj0GpLXHS7cpkfUNRAJIoy2jEnYmknFYWzlcvnp6V?=
 =?us-ascii?Q?kgvyXOQ8wdAZd2Eu1+REFR9cmBHd/zN3nQztwqi8q8jOt4hzNiv2jHR5W8Fr?=
 =?us-ascii?Q?w1DwQCyBcHh0cnBIdGPUEp7Fd0dhwXKuxuJ8Xa6sFQezz2k8xAXKJ2oxb8l2?=
 =?us-ascii?Q?uQR7W/Mf32k35vB5sGj7nnLIbC4iUlA4I2JH7N6wMEUbzF19iTC/w+YQdf0L?=
 =?us-ascii?Q?NRGp+/HN77f4sFFPZTL8TpkSgAo6AZTqvc3sPlW2zrWX3hXxysQNcYI+lDEk?=
 =?us-ascii?Q?OAGTg1RB96+YVRIE1zGDMdGyKZB2uMBngbkP0b4I86gv2hCAIRew6ihKwEeb?=
 =?us-ascii?Q?C/JPsAeR9iAuxYX4mYg/sqAFWXezHVKvnKIKaAXGKZSuCLaox92cO2Y6kPII?=
 =?us-ascii?Q?cCNqhL+B3Hc/PdxLWfnu8ASvpejoBDqL2k52JDz5e/GoaNAQAiYbfMPcd6JU?=
 =?us-ascii?Q?x8TLNTpcJ6gv2HoGCrFvPibeoEmtumDo/Y+fueoHviG421dULEcMkb0MGRgO?=
 =?us-ascii?Q?lgTf5munySFlBvR+LLhiRbilvZu6OyB0BWE7PJ7WdamwKBg2OaO/8Hx6dFiL?=
 =?us-ascii?Q?FNZlfJrbJPVHRHagsv+fpfBirnsdoW1nMZcjiT69H6pfxZ1lEWZ7zZam07bu?=
 =?us-ascii?Q?fXfOABnPmGiHgUtwYnvvOcEYbloHGVk/zB/96JGJnUMGlq9VJZuslaYFuRwg?=
 =?us-ascii?Q?bo5bniS1nlv7hS5HspmVPiqwAz12LKojwzoVPxJIi9jKyP4ycr3iE08lEXBI?=
 =?us-ascii?Q?kIsXcBVSsEnPQCJosy0NUeQH8EdZwp94gtdBi8bZOB2dDT0W89Ndq6pV5W0Z?=
 =?us-ascii?Q?k7fdU8yOx9TsJihEk02vjEUpX3017s0IzTKV8zgzPtsHulrUEIxdicnFoXEu?=
 =?us-ascii?Q?wfh+3CU+p8/TqbUjdTpRWWLXgW/xWbYkK/RCukHmiVEeFXKprpEWatDXJEmb?=
 =?us-ascii?Q?cdw/xmYHhMJDtDAKPLSpjxXDS6+FDSo4GQP2nYSNLnE+C+ViXhyRyuNi5CH6?=
 =?us-ascii?Q?BRAnn9UhOQF2ItGzw6/nbS90D+G6FB+KkoYhdVxk6I6FgClzXW6tW5tiLCBG?=
 =?us-ascii?Q?8/gWh07yT3aOzZUHn6CXqqljX/2XlR/lzWMYMPm3oq+uCoTmocepGTthBU2k?=
 =?us-ascii?Q?luExWymuN+xJgzX8inBXBzt2rsQNTLfPAzcqgYIhXnY43S/rHqlrUxw7jQgx?=
 =?us-ascii?Q?Ms+B+0vAJpjJRvAORLPTdy34bnAodSKOQ79xt7llghpq0DFKabD00SmnQras?=
 =?us-ascii?Q?PUTBWk9br/KP/F6/aDfXsx2H/6/isYWCC8LPD5wxSze3mZ4lqJJIvtul3JJI?=
 =?us-ascii?Q?FFDvhPbdVtrTErTLoQN1XyYmQzRPUrPKQp7EaMi+eMon0PLgcZHDIEL06hgO?=
 =?us-ascii?Q?+tINNxeYSJvYlawAmIBcknF1nEc7hgIT7fmkwKeluyJAltOY0gZ0nAP5cSA+?=
 =?us-ascii?Q?Z9WpgOvq69YVpA/QyqE+QWEto0UsSUTLbmOrncoaL33PfUHFYFzmroE2JONx?=
 =?us-ascii?Q?/u+usBgwCguLXizTstxSCohwHpC+GVZCku4whK0j?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 46979fd4-447f-4989-2648-08dcb5e0fce2
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5423.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2024 06:28:30.3055
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7GLfbOpE8x9Y4YIfjFKa6L1ISzThS92Whcn8m8RJg4q5u5uUKZdYNwu8E6rYjzGAFY6uz+3qJx+Hx8YaTROZQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB7153
X-OriginatorOrg: intel.com

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   d59a335bf0dd2aac9debe211a0a07fbeaf605fed
commit: 79effa9d33aed236955bd5d6ea9588b16958803b [12699/13217] arm64: dts: qcom: sa8775p: mark ethernet devices as DMA-coherent
:::::: branch date: 5 hours ago
:::::: commit date: 2 days ago
config: arm64-randconfig-051-20240805 (https://download.01.org/0day-ci/archive/20240806/202408060203.7OzdIHxS-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 423aec6573df4424f90555468128e17073ddc69e)
dtschema version: 2024.6.dev8+gf13c181
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240806/202408060203.7OzdIHxS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408060203.7OzdIHxS-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: ethernet@23000000: rx-queues-config:queue0:snps,priority: [1] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: ethernet@23000000: rx-queues-config:queue3:snps,priority: [12] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: ethernet@23000000: snps,pbl: [32] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: ethernet@23000000: snps,pbl: [32] is not one of [1, 2, 4, 8, 16, 32]
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
>> arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: ethernet@23000000: Unevaluated properties are not allowed ('dma-coherent', 'phy-handle', 'phy-mode', 'power-domains', 'rx-fifo-depth', 'rx-queues-config', 'snps,mtl-rx-config', 'snps,mtl-tx-config', 'snps,pbl', 'snps,ps-speed', 'snps,tso', 'tx-fifo-depth', 'tx-queues-config' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: ethernet@23040000: rx-queues-config:queue0:snps,priority: [1] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: ethernet@23040000: rx-queues-config:queue3:snps,priority: [12] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: ethernet@23040000: snps,pbl: [32] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: ethernet@23040000: snps,pbl: [32] is not one of [1, 2, 4, 8, 16, 32]
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
>> arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: ethernet@23040000: Unevaluated properties are not allowed ('dma-coherent', 'mdio', 'phy-handle', 'phy-mode', 'power-domains', 'rx-fifo-depth', 'rx-queues-config', 'snps,mtl-rx-config', 'snps,mtl-tx-config', 'snps,pbl', 'snps,ps-speed', 'snps,tso', 'tx-fifo-depth', 'tx-queues-config' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

