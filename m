Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDF2038D
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Dec 2025 12:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764764221; cv=fail; b=LBrR3loXNQzZSK7+F2ZUuRoXHQZBrc4+lPvYwzJO6uD1lERTotcxFdrmaFUlZA5OHgC29OUGK8j2JxbwVJaqx9+1VE1FzL8iF5VV8MCjRt+k+4F5uId0V6wg3EO3mx2y3ymIWikEwuMRYC3FHH9+tq/yfp2QbeKy594x1b2OdNU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764764221; c=relaxed/simple;
	bh=aCa7Z4z5RS0EFyM5e9A7YEpc2O74fDlnkhSA0o6NDe0=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=Un0a2TW+5jz3A/eR7NwiCFGKTCKcrcdzwhoYLFjg0ZBNiPpMWxxaZRZj5hQDBtajlBUrmPVIYE58L8nHP7HBvB3zxKEaBBFZynNDwX16JsP6wQhdgYv6AFdvzxJy6uCjImyGT+WpWsS2E+mkrlzO9FImt+9oiCzFmPkqngqpseU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KSYMO4R0; arc=fail smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KSYMO4R0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764764219; x=1796300219;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aCa7Z4z5RS0EFyM5e9A7YEpc2O74fDlnkhSA0o6NDe0=;
  b=KSYMO4R08hNTz3JHPwK881pjlmTGyPvnJsJa42naSZDO/P1/AaQNIHW4
   lkZhGN1YhLFq2Ktz15frYvMjPUjxZbRJMD46PPsLZqjCfe881tn9g85Dk
   sUISSS68IGoCKyFiRmHrRcbw4VC3vUjiy8YNqErtDjFGYJFrkYWLQDvCv
   14lYNG51O4pUtdEvf5WKIgKsKVY4TpEWL6Ve7ouN41cVG5xL68QC7kwqt
   CPjmM/effssAm88IFfIg92uJa7khbpynN6vI3Jcdo+yf2hkZS1irxgpTc
   GKT6TziN9aXa6ULo6YcaGU8E3/EgWpirE8JJ0Sm4NxuZK/RBjlr60BIse
   A==;
X-CSE-ConnectionGUID: TsAj786MT82YIL6IGM/xuA==
X-CSE-MsgGUID: kgzQk6CoQSK1blTCdD0VeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="77377954"
X-IronPort-AV: E=Sophos;i="6.20,245,1758610800"; 
   d="scan'208";a="77377954"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2025 04:16:58 -0800
X-CSE-ConnectionGUID: NWtXnO10TSGMbPbJbgpQvQ==
X-CSE-MsgGUID: Ob7PA+K5T1qT480aeZNWCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,245,1758610800"; 
   d="scan'208";a="195455788"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2025 04:16:58 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 3 Dec 2025 04:16:57 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 3 Dec 2025 04:16:57 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.49) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 3 Dec 2025 04:16:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FQOgMOAf7lR1up4B2wjyRqJTcJC+WfleYClMNz2PTxvrwzGXGkaQNQkxEgfr1PfcgRiPoffVoDqqV21l0jFN2zIUAwO0BTReaHB+33rmMInXGU/AxMvoTbH48XgVw3jv6L3slPuzTkNxSh60mqdKijBBeul3xUVXWPhlpwrGWy206rSjriSX6GGPGtnzL1foHDfPJcGQqUsjnIKIriRDS3Ff5pdBKBUDeZ/kTp+mAwhZTaA0HsCW3AGnVThaeG46mJancxBpSohR2yMYSBvsSZyUfVPNQv1jpBWcU+4i6EAEqgULNHhXS8Ng3UQWUzrinzdIgNEycBtWKQ1s7Cd7Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fGN1L5tU6ezFJ2cH52rf8xUOlU9T65DQIt86wtw7AyQ=;
 b=B1pRkoUgdXbWiopPCarn3cFAh7sInxJRRphcv9hI0dndLpLGSKhYPDGKWVymuShu1rkeaNpPURk6tmtgrk9MPDVoqQeWR6UNTRNER0hzEV/BHpNj3i6p57+nn7ZTJhopHmOURe65aqW2DQOtyyFOoPRimy/KhxeYn+m1F/xfhPe75tYZQFBoUMm2lHBZ/LvyDdveHbCM0I50bh1X3jZzjavVsybRTTTM2LB7nJCW3qMAzbVU0G+m0YmVGui6vlF5QuH1Jmb4dnzXEYk5ju3qRBKPAG3KgMM+j+6vs7NCt7SwlPR6P4mWg+f0sw67ZiiQk94bd7Z5sRiO9UYdBkcR1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
 by PH3PPFF8B8D6872.namprd11.prod.outlook.com (2603:10b6:518:1::d61) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Wed, 3 Dec
 2025 12:16:54 +0000
Received: from MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9]) by MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9%5]) with mapi id 15.20.9366.012; Wed, 3 Dec 2025
 12:16:54 +0000
Date: Wed, 3 Dec 2025 20:16:46 +0800
From: kernel test robot <lkp@intel.com>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
CC: <oe-kbuild-all@lists.linux.dev>, "Gustavo A. R. Silva"
	<gustavo@embeddedor.com>, LKML <linux-kernel@vger.kernel.org>
Subject: [gustavoars:testing/wfamnae-next20251201 7/21]
 usr/include/linux/kvm.h:1581:57: error: invalid application of 'sizeof' to
 an incomplete type 'struct kvm_stats_desc_hdr'
Message-ID: <aTAqLmBwX8XmXhCj@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0165.apcprd04.prod.outlook.com (2603:1096:4::27)
 To MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB5963:EE_|PH3PPFF8B8D6872:EE_
X-MS-Office365-Filtering-Correlation-Id: b78692b4-12f2-432a-02d3-08de3265d8c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5rP6Ao+Mu91r5BNmUiA9+ypE/IpLDlbWxpoCdu9EQFPVNrrXs/WoQQ1kwALY?=
 =?us-ascii?Q?55lilq9upFZ/roYYx8l2VHFErjjm0IxUoSGYtIGE5iySGcjJOsU3GzOVq3YS?=
 =?us-ascii?Q?qaqHXMr/eBgYSQQz5DPrXYnreQhvK6ENQxd70MYSl1CgdXQ7dqkz0VIE8MYN?=
 =?us-ascii?Q?6rYga3J8ILAfg2QY0OgGRrHwkLSAK8ETRV/BDZZ/iIYeERaH4SD7EDL3uBKt?=
 =?us-ascii?Q?MY78DpCouJ4lvrFb7oa2v1CKIH/z6qMmuU9Zzmjl/w219/kJlpcTZ9G1L2nK?=
 =?us-ascii?Q?bQIbXfqPt0onAbslNTmKOnyui8bQzwnmMVOOOaKkwRvqsYuVq+ZFMwnOHFdB?=
 =?us-ascii?Q?WQCcog7Vi0zqjiG7zg7umW9J/yyyTdu5CAWHjUIwQ7Ia0oLPSwEBJXlgFn7T?=
 =?us-ascii?Q?pslu5n7EEATYOGNE+bmDAzMy/PO82/dTVZWDglhfJ/4ggZaPfMhnMxv4GL6K?=
 =?us-ascii?Q?nai4N2VVrgAmDMLWLr3JHHuqh9Tavo7u6/PAZsc5ewrLyzg+eZytGPnRyaE6?=
 =?us-ascii?Q?ZhM+X6dgqjosOuRix64cmErIgC7wH2p/m1t9IxZTOXXUGVmNT7/sapWfNz1F?=
 =?us-ascii?Q?HoeMvFfA6lmhuspqb/gGPw9jiKdwnS3w8czn8cqFUk2/gSeet9bLf4RA6EWf?=
 =?us-ascii?Q?0uh5eAqS+k6zlNjFy/yPSFRzWTl8O0g31ht3NAu3yFZZAt/W0yO4ebZYsVH+?=
 =?us-ascii?Q?S5Ek000y1nhqhuSPDrMbTM0F/zUPPjxFcxUkKjL6PveWBqeYGAiSdwtrAHWV?=
 =?us-ascii?Q?WavWIToZOPZOwSJ32pOe1mFZ+8KFO7st8aLctXeKLgffrcKNlVzpnyG42TK/?=
 =?us-ascii?Q?J3s1oF4Zl5y2l7LsNhyPsUfW8RFf0xhD0TokwNlBO5HqDhR+9hU06q+VTXh5?=
 =?us-ascii?Q?gOt7xmJyuEHWhjEf0/5Np5QLh8V48vN3yvpxqDUEXuoO8YiFLlRuOyhzAlEZ?=
 =?us-ascii?Q?Z3ZamUVJqWYHdo8ETsEGOSaVSF0RblaJezkilZEue2CHDd/xnxD+YOZOJNai?=
 =?us-ascii?Q?lOd/fWiSPbCRpddNHMt6yEjdoeMoL12Wk3bf6Ofnhn/haBPXGFo+pzJwQVPG?=
 =?us-ascii?Q?/hAikbQmTwHEf8/ZNZOckobb+hknHa+ckgO/1G3B+t/PaHahNFPKq93jHEUc?=
 =?us-ascii?Q?KZmfgBqtDeXXwnplt21zMR6GNXhWiFaMjg0ANpGrZpj2N9f7HxtaJB1te8Ua?=
 =?us-ascii?Q?xFMcVlTTwolA0eD8h6UCm8P5zfXJq9MXfbgOShULT9w4f47Nhl3QQqH2D2ug?=
 =?us-ascii?Q?P9dL6+SqPZPBdNMOdfMkrSOIp5gmXUJiwP/GS3hALs3Gx93jgmu38fytKoiX?=
 =?us-ascii?Q?sHEgexoZjRuqxfe0iruTaPDj0Cf7dQxPW63TZwYZ3baneGOz22aYFEP4n69g?=
 =?us-ascii?Q?dW/VFs0uRK8Qt21dNG4GULfQt6DeyBlL2aprZyCFDBi+sKZ98bN+8cs4BxTx?=
 =?us-ascii?Q?mvXLywV0Pt1S+BQ45OfQjdGzuP//5ZTDtK9VNy0uyXYHdMrbr9A2mw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB5963.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2FXY82ylq9PZq4vJRFUWEODZiSRWy56mPEWEpG4PrgLWi28HDpESt+razCdk?=
 =?us-ascii?Q?h3kz89iKUXpDuLAd5REzOXwR0dXTeCcLUOqFAhxf3M+NGT2DEBPfdlBYuSW3?=
 =?us-ascii?Q?uq9Vg4120isCE+4EVEzIZMoBOXMMWaZ9YNHJWuKAIiCiPQsGj1oHBElT6q65?=
 =?us-ascii?Q?510/LuHjoKyXL8GoJe0Tw25aLLdNy9ODdimw9l+tP/6Y58Hhrkbt40n2EeJk?=
 =?us-ascii?Q?sxJESdIKzibbcNBaJ0llvQzZcZs88s2Oc/8GGpWz+p+0eYU9lLOs1U6IJ2I0?=
 =?us-ascii?Q?ChWybad9GHw3xf3lsJjH9ZXn/CV1y7/zdjjnyANzGJ2YYiCGatgrh21zgNbf?=
 =?us-ascii?Q?uJcOB4oZ5SJwwDetZCL0ElcBTaaFCBv6qIkgwUKuWLRXbNPK8Schk3KnaFV7?=
 =?us-ascii?Q?+FtGblYHJiyqn8SReVuMUs/2luvU2s69WNv391KiDihzN0uSRhz2xWTQViNP?=
 =?us-ascii?Q?nRl2A/+K1Ej3na5kyaobC5cZVLl2Jcyguwl9JYIAgU5ODcFmJn8HNReoT9iO?=
 =?us-ascii?Q?6ejCbVKHciOd7f9nyhpbFc7r6k5rpQIBCXfkok9NIp2dulFAyDOiR0mVQ033?=
 =?us-ascii?Q?q8M9CZpT2TXOEcu4MpuCezGjaf8QQ9YDo1HU4BDth8b65zhJfPab1p8HVe2K?=
 =?us-ascii?Q?WTTEWvDIJUMdPQbRea4jaRbJ736bacpYGVJaw+gWazEFckjNEE6+6sSB+1Uh?=
 =?us-ascii?Q?YuZ4gZM1kMI5DeW894CnOQHcggM0TJvm+yk2TMJVHrnQE74h/y8A6fmI1/C4?=
 =?us-ascii?Q?I5E4aovLHzadc6w0ZQ5FoGmEOp3CS4iBYuCLYSVZKlVORNGLqQasHHScYgLD?=
 =?us-ascii?Q?cd8Ms6XusWRVKUHRyfaIW6sEsZCPoyqq+hqZSVP4uyfdGNfnuj90h9nSC6um?=
 =?us-ascii?Q?q4PjN7DEcY/Sy3BNWkKe6g9bjmOQ0fxTjlWT79JbufdS9kq78Gp46DSjBllS?=
 =?us-ascii?Q?ywFrk16Rcx2ozSCpUgTzVp+yWzJJ4nmc0NpKzcvCh7RWQ+lif8wV8iJlYvlL?=
 =?us-ascii?Q?2Eb1r6JL/mZUZjVpTif/Sl6QYIwT7GPwHLbDA5tgJaNuFA0FQiazOlzF2AXV?=
 =?us-ascii?Q?+K8AnhAbnig74FjbFSuf8wnS0AFt3/OUSJ6vN/3saX/h+QQ7O/VS9JJqZj8K?=
 =?us-ascii?Q?c3+tsEqG8A4WIQQlUUWUTzZHBqRkDiA4gEuSrLKf5aHYiUSj8eKeRd2k4/rT?=
 =?us-ascii?Q?1tnzzB5fM89RNGmrL2qI3KX9rRTaOXlwFC2m9WYCfqiOsx5JyXfnSBC/8nCj?=
 =?us-ascii?Q?45UFlu6IHFG9p2/A3gUU6BhncsTO6TIG4ZQBJHSHaIrKTekH+7Id1toVsqBi?=
 =?us-ascii?Q?S3olxKlsmQ4rxZ9QnMOK5ZfdBRnxxexepxuy+60xOIivxB78vCiamqQyZlJd?=
 =?us-ascii?Q?Toi8lRhtik8oJDgvBXHGxQbfaSMPVnbbrTwYXvlQzQWekOGblrKEI5sA1X/k?=
 =?us-ascii?Q?HY6Gpfgph8gD1JbAjvZ23bMn0iZyjGEwbeHXi2Xfq5cAdcTb7UYZ3hHBOZz3?=
 =?us-ascii?Q?xkfttiXw8QjGdHmFSbplqgCOuU92IIWlIuR+Bc2jbgDzrO/uKXvkIMYUQAXz?=
 =?us-ascii?Q?7hUpI16BmxmNFlzEJiyLIPPdXJ+s0F71LutUzSpDZu7EujPvfg4b9aImO0X+?=
 =?us-ascii?Q?qg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b78692b4-12f2-432a-02d3-08de3265d8c5
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB5963.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 12:16:54.5991
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WOHioiPkJjn6kes07u5CnW+AxT3hhH9hkZz35K8ndcJoUH5pWrMP1pVbECi56ehR7iiIb8oppbEd/ywFsKIe/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFF8B8D6872
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gustavoars/linux.git testing/wfamnae-next20251201
head:   2c162acfacfa32b76ad4176574a222a0e47f9df4
commit: 2eb7c0e83b5725b1318bcc4efe48fc6f34087c13 [7/21] KVM: Avoid a few dozen -Wflex-array-member-not-at-end warnings
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251202/202512021722.wkmvuDSK-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 5dd2b06d60d3eb9b07c7513358ad8b04386f79bc)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251202/202512021722.wkmvuDSK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512021722.wkmvuDSK-lkp@intel.com/

Note: the gustavoars/testing/wfamnae-next20251201 HEAD 2c162acfacfa32b76ad4176574a222a0e47f9df4 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   In file included from demand_paging_test.c:17:
   In file included from include/kvm_util.h:14:
>> usr/include/linux/kvm.h:1572:2: error: type name requires a specifier or qualifier
    1572 |         __struct_group(kvm_stats_desc_hdr, __hdr, /* no attrs */,
         |         ^
>> usr/include/linux/kvm.h:1572:58: error: expected identifier
    1572 |         __struct_group(kvm_stats_desc_hdr, __hdr, /* no attrs */,
         |                                                                 ^
>> usr/include/linux/kvm.h:1573:14: error: expected ')'
    1573 |                 __u32 flags;
         |                            ^
   usr/include/linux/kvm.h:1572:16: note: to match this '('
    1572 |         __struct_group(kvm_stats_desc_hdr, __hdr, /* no attrs */,
         |                       ^
   usr/include/linux/kvm.h:1578:2: error: type name requires a specifier or qualifier
    1578 |         );
         |         ^
>> usr/include/linux/kvm.h:1578:2: error: expected member name or ';' after declaration specifiers
>> usr/include/linux/kvm.h:1577:21: error: expected ';' at end of declaration list
    1577 |                 __u32 bucket_size;
         |                                   ^
>> usr/include/linux/kvm.h:1581:57: error: invalid application of 'sizeof' to an incomplete type 'struct kvm_stats_desc_hdr'
    1581 | _Static_assert(offsetof(struct kvm_stats_desc, name) == sizeof(struct kvm_stats_desc_hdr),
         |                                                         ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   usr/include/linux/kvm.h:1581:71: note: forward declaration of 'struct kvm_stats_desc_hdr'
    1581 | _Static_assert(offsetof(struct kvm_stats_desc, name) == sizeof(struct kvm_stats_desc_hdr),
         |                                                                       ^
   7 errors generated.
--
   In file included from kvm_binary_stats_test.c:17:
   In file included from include/kvm_util.h:14:
>> usr/include/linux/kvm.h:1572:2: error: type name requires a specifier or qualifier
    1572 |         __struct_group(kvm_stats_desc_hdr, __hdr, /* no attrs */,
         |         ^
>> usr/include/linux/kvm.h:1572:58: error: expected identifier
    1572 |         __struct_group(kvm_stats_desc_hdr, __hdr, /* no attrs */,
         |                                                                 ^
>> usr/include/linux/kvm.h:1573:14: error: expected ')'
    1573 |                 __u32 flags;
         |                            ^
   usr/include/linux/kvm.h:1572:16: note: to match this '('
    1572 |         __struct_group(kvm_stats_desc_hdr, __hdr, /* no attrs */,
         |                       ^
   usr/include/linux/kvm.h:1578:2: error: type name requires a specifier or qualifier
    1578 |         );
         |         ^
>> usr/include/linux/kvm.h:1578:2: error: expected member name or ';' after declaration specifiers
>> usr/include/linux/kvm.h:1577:21: error: expected ';' at end of declaration list
    1577 |                 __u32 bucket_size;
         |                                   ^
>> usr/include/linux/kvm.h:1581:57: error: invalid application of 'sizeof' to an incomplete type 'struct kvm_stats_desc_hdr'
    1581 | _Static_assert(offsetof(struct kvm_stats_desc, name) == sizeof(struct kvm_stats_desc_hdr),
         |                                                         ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   usr/include/linux/kvm.h:1581:71: note: forward declaration of 'struct kvm_stats_desc_hdr'
    1581 | _Static_assert(offsetof(struct kvm_stats_desc, name) == sizeof(struct kvm_stats_desc_hdr),
         |                                                                       ^
   kvm_binary_stats_test.c:77:17: error: no member named 'flags' in 'struct kvm_stats_desc'
      77 |                 type = pdesc->flags & KVM_STATS_TYPE_MASK;
         |                        ~~~~~  ^
   kvm_binary_stats_test.c:78:17: error: no member named 'flags' in 'struct kvm_stats_desc'
      78 |                 unit = pdesc->flags & KVM_STATS_UNIT_MASK;
         |                        ~~~~~  ^
   kvm_binary_stats_test.c:79:17: error: no member named 'flags' in 'struct kvm_stats_desc'
      79 |                 base = pdesc->flags & KVM_STATS_BASE_MASK;
         |                        ~~~~~  ^
   kvm_binary_stats_test.c:102:18: error: no member named 'flags' in 'struct kvm_stats_desc'
     102 |                 switch (pdesc->flags & KVM_STATS_UNIT_MASK) {
         |                         ~~~~~  ^
   kvm_binary_stats_test.c:126:18: error: no member named 'flags' in 'struct kvm_stats_desc'
     126 |                 switch (pdesc->flags & KVM_STATS_TYPE_MASK) {
         |                         ~~~~~  ^
   12 errors generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

