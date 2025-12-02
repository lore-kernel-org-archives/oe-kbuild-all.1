Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B76E422A4E5
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Dec 2025 02:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764641216; cv=fail; b=f1QZ88sWNZuGiapeMQcfy5lmuwnVf4QBBYEDZCrldYeHSXXFbN2+btGITPbWa62teHFbqvVwA4oWJorfioxqXinh9hWC0P2AdXWSfcnNFCUV+tCon3fKmDwHjlqaidSStcj9kAbpTACh2B9LzIR70X+RBK+4VpJZuSVR/CLzUNw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764641216; c=relaxed/simple;
	bh=XC32wUmYgzLx+bys0VUNSfZVgtBz8UH+GlmY2KFwD2E=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=GWQzfXJ/j/NwzJjfS2PHYfjbUlJeXilFgnj4E6jkf/ZZxK4zfxr0jQ3Axhtbh9tOEQhGbQYsb4f9cWo6NRdbvfUc/84wETOyqySWNj1almI/0q9NnMUZWCV84Z0ze9vA6UOGonWEc8oQdF/3JEMR6HD8sZJKXr6YuqiB7PcEvmw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gfiZXgM4; arc=fail smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gfiZXgM4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764641215; x=1796177215;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XC32wUmYgzLx+bys0VUNSfZVgtBz8UH+GlmY2KFwD2E=;
  b=gfiZXgM4hA0/7KTz+UhUkX/mcwGVPEygtMko3j7+nC47KXWRmuwHVWz7
   st8Cgv7VMf+sBHbILc5UoWalshY9jZwON5cninq6lvc4OgtuZhoaO1fLk
   Agi1zXKYAcKX9+e2fZEQTnFs9C/chxCCH/IzsV5Z+ELNmqFGGTju5PtSg
   m1A00KUfeW6q3ipuFKTCPV0ZrBxZVDXaSo5oZIAkMwvMKXgzVv3lOjqpC
   /KchQ/HlxYnwzSpECperSzgUKSup2NWzMfrUxZedbLP8QP2aotUUyzVGe
   pTZHP8BNVTx/9YKQNcOzePZfABPQwgOMHcHzwtUFSjRnH+TfWCSZHklqM
   g==;
X-CSE-ConnectionGUID: V1rRkgDqRQiFj0uHPQto2A==
X-CSE-MsgGUID: 41VUzGS9QmeS6tq6dwX8AQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="66634065"
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; 
   d="scan'208";a="66634065"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2025 18:06:55 -0800
X-CSE-ConnectionGUID: 6Mmd8O7DShaW0nJB3N13gA==
X-CSE-MsgGUID: pintKPQuRA6rGwjjGl8uww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; 
   d="scan'208";a="194071802"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2025 18:06:55 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 18:06:53 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 1 Dec 2025 18:06:53 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.35) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 18:06:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PSmAig+eo+1UMaFUt+/Uv6n7fOfnYzhLXGULkYK8iTxiHgOYiT90plzFh/fnMk3QAVYsMDt+TtDlVPpMdai7QM1JdlJ2bvYHPtwssdzu0VSvXB3H1mRT+J1RCCFbbe9BwcdqxPdfElZUNR4ktIFwZQBamXfjDhvQAwRZdqsNE+EYAgx7aOZN8iI9wts9g5poGn9C5jUElffZu6fMEqlHSpOuq0mZkIOQXsvKvn3TX2BSayu7lX8VJ4Ed8F50wgCzZNjoWl4bquMDyHGdgs48f2B3L+fQ98z82gDnNoUWdrGRxLsNuKXYhQinkoXxvZ3qJh1LBdnvOVRop1sFfCPTog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g/gZ4ScD5t2osCANypG8gtUANwz9XNG5NC9Oxmw7KYU=;
 b=FEXrFDjcK8kbBFSDeN7lNsyvicKB86qfbRgfxt8UOQI3rDMM0g+kcsWp26e3Rb9qgSQL0hKNNi65EC5RSrx8vxmcDNxCpZYxvjHK9HwFlVrENWgmDjfAAeB2sdXD5rggj0ENTcOQQg3FYDyLuChlrVCkpeOyNZKv05sE/3+Rp9Kqi3Mobk4xHBjyC8I+iNVVdPJaELaGcDlcPWd8wmxwARR4icI5JUm6CEk58dro0kuddeT/k1p9byKZgubkbW0TajMSJgMMajSUHHT80PSm0BzE802bD9xSr1PltyWq62od2UKsKutzB67iB6H0Tx4XsR6oJowTXlXzR7iCPR+08A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
 by MN2PR11MB4551.namprd11.prod.outlook.com (2603:10b6:208:269::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 02:06:51 +0000
Received: from MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9]) by MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9%5]) with mapi id 15.20.9366.012; Tue, 2 Dec 2025
 02:06:51 +0000
Date: Tue, 2 Dec 2025 10:06:42 +0800
From: kernel test robot <lkp@intel.com>
To: Sunday Adelodun <adelodunolaoluwa@yahoo.com>
CC: <oe-kbuild-all@lists.linux.dev>, Paolo Abeni <pabeni@redhat.com>
Subject: [linux-next:master 12308/13171] unix_connreset.c:17:10: fatal error:
 string.h: No such file or directory
Message-ID: <aS5JsmPZOw6fxTrk@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0167.apcprd04.prod.outlook.com (2603:1096:4::29)
 To MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB5963:EE_|MN2PR11MB4551:EE_
X-MS-Office365-Filtering-Correlation-Id: ec3734cf-1df9-4d2f-7d0c-08de3147758b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?zG7U4gR8YG14giUVXyu90ViJ2e8Bp4hdZQadb7E91B4HANfPwmFC0Dl8/pZJ?=
 =?us-ascii?Q?zL2AMSTbR7tLo0C/vWSn8LLqFAqG/0wFMvQ09lepQhWan6p7cj6rBbseFvFU?=
 =?us-ascii?Q?K3futjPjdRfLFv9JbNVBy6nfZ+Ah9MkjoEb+/ynuGFxHvh5TJR0WIRkilYCZ?=
 =?us-ascii?Q?nnXaUcbZ13RYj+K1tkFRfl6pLod2ENz/CGsDPFbgffSvKz+W0swNKrKGsLsX?=
 =?us-ascii?Q?im7mQTbgv48xY7FwGoNhJUHvSij6RroFFAy6OSceN3DEFtJ+One1LyyaOUm2?=
 =?us-ascii?Q?7PPKt2F3KuWRnWX0qa5RCBRgGxNkyZlKS4VtkTZVc4UMTn9tW9XSzx3SPWML?=
 =?us-ascii?Q?jfRFetFHMUj4walwn8LQRhIgkwpSSl0BTCdT3SO1VgZG7t/j7CT7phEfDiW5?=
 =?us-ascii?Q?r0/8Hp8bJ9Ezf0skhgfiqDRW+WarbVV7ABtq63ynknOp7KZNpvFTA+3HEcDA?=
 =?us-ascii?Q?Buwy13RFrQNmaCUEM69ldaMKORKutl0X691t0DpZSwYj5IsQgkMXrO4WoQUy?=
 =?us-ascii?Q?UfAsqTYOBMGxSapAhhaIxMFY02rrvVLWmH8vUlxZuNLxB+zMqtBmppjXMgdB?=
 =?us-ascii?Q?O6D6J62FL8aQutVqC2P8Py4Tbvu4NQzZDOEn+xZNfa14+V5hz8ogeiOCegTz?=
 =?us-ascii?Q?cQwIkqVRxd4vC/QgRmvstiK67yPauCKy47HF4PSRM2p7z++tKHDFHA6B6sjm?=
 =?us-ascii?Q?FA9pgLdWXGNlmtPAPtiWLCQZX5MvZkhAsnnVCw+9BFrAxrzprNorFm5CBGji?=
 =?us-ascii?Q?oHiSKk0KK0sOUY2uK6jBr1k2+YY/7h73f+OdiXcR3FZ0q8pOr5D6sw7+wC8r?=
 =?us-ascii?Q?oSIgc7VdYq7utNia4Fm6jYhSICUb2sBoUBJhVonDjROZYynbWIQdD6TtAzSA?=
 =?us-ascii?Q?4ikdMHMcw6Lf4n3vJAe9iZwOc04nOAhpF83N4ik0dI6InCpSKuLRwTeNkJoc?=
 =?us-ascii?Q?kZNh/W/XMb418MTuM07PnKi0FxIjmhZ7FBo5fcJaSP2QE3ii/C8GaPvgkErv?=
 =?us-ascii?Q?CTrIr36Jt/a86dxrjhQVGLTmX/pbNOLTGgMNIJbkHzhDupEGc7bxlSAOoRUr?=
 =?us-ascii?Q?yXkGlwYjIpuRKatxC8PrUbg97fmcYKnhnNsYC9rigKDGjAOxCQMEtR2qx04g?=
 =?us-ascii?Q?4H20LQefDNIN60LjDgZNyzUTcyd1eDdvwPIT9wJIHRIlf71HquOKOEXAzGaJ?=
 =?us-ascii?Q?AOqPeU1Au52H6nKPCBu3ALPUmRk/Q3v/yLOz/SQq6y2amTI8Y8m/FkysJDpX?=
 =?us-ascii?Q?BRsz5HlWklq9q6v4fqjl0oGo/sQu6pkAsAEPX+L9iD15dMTFYomrP1XAG+vH?=
 =?us-ascii?Q?jBCTgTWnD0um0kS/+X5fEw7/EnzcrxL0n0ajvcsIJNdHZkat38YD8p0DHUTS?=
 =?us-ascii?Q?h2eLW4VTQSV4KrhOBlpStaMV8NfbDPO54XoYJXGloLpfJImtnJS2dXUWRhMj?=
 =?us-ascii?Q?vx5EjVCx9evdYvfQ25W66U6KQpMINLUKJCv37LyBZqhSce9S5WmHeg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB5963.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0OCr2DbN6XE3QMj4LRViN6K5brtNPXGjgStFIFQhUlZzyNuR6N/Fae9kq1Zg?=
 =?us-ascii?Q?749wBFlTiwwZ/Chp667kVVNHPUCysbdrgiz6Or7lnYxT+/m+veECktVWlmA1?=
 =?us-ascii?Q?uocO+z+pm9FEKZeu+84coptpduVGr6SH2nFE0TOKVSSTFayV9Bcbd9Y/lfZo?=
 =?us-ascii?Q?Ud3Ftrjwhgoh8BO+c0eM1arbyo7n/57as+B4M7ZSuCWKX7WQGTcNnbeV0APT?=
 =?us-ascii?Q?sdX4TsrbghxitQLeUz8R3m/a8Z1Kt/y67q3hJ4xMFnP2WgMk0YWTovas+oWp?=
 =?us-ascii?Q?Jo2z1o991q961orSjGAJ6b3pkn5gUXDjWx/LIA42ylQHFzY2XgVw7417/r1o?=
 =?us-ascii?Q?+dnds/UqSoaKTZxC8IaBJ47HXN2SgCPCrymwENTtGoePfaCLB1Wb3EbrvDUH?=
 =?us-ascii?Q?Zt9gTW4psm1sSDbAcXIKZMN0pgUVkQncbywIf49cDaN1TGDMfaZQ858I/M2e?=
 =?us-ascii?Q?DYk4CqmnBvBHN9XdSjIw2HezoF5ATK/oi9hzehgtahg+2SaVuNo7wF3K2bpR?=
 =?us-ascii?Q?EmVmf9MClC63h0x4MiMeOtXP0S3afCqFfFfn0DRjQzKHHek5W/ZPN6cXAES4?=
 =?us-ascii?Q?V2rBDvokX/U3KCiQLm8G66lcJis8kstdUg80Mf5fiIR6BW4a53F018oF/yLD?=
 =?us-ascii?Q?GD60VWiDkbpY0W6Th8Z+yBcQ2AosxNUASIUSktfSsltC9ki5vxjtcStkdWCq?=
 =?us-ascii?Q?V54PZlFbji+rA8jtjk23sxZXH+5XL5CZuXcHiJfI1ChCwS36bDu9jQJPyK0q?=
 =?us-ascii?Q?juNBwEc3Fw4zLxfupLYZYivTfCYtBd5XgblrwlGxpo2eXOxP30o1VjZLDfEu?=
 =?us-ascii?Q?gkO9vkhczqM1jVZXu8mLlDfR4FF7/7utQr5EZ6iZN0QWEg6nYDZ5wDIiOIdY?=
 =?us-ascii?Q?h3ohS6u3ZsJfFxlAuernKGjFZxUye4VH5EsiG5ivbWjBv+/tQCQS761bALQb?=
 =?us-ascii?Q?qrSqDM03P4/cSrcOJVG16EMD6sM9JAjqLLUoqK7PLGyasJcwt4FYZeYQc3FJ?=
 =?us-ascii?Q?NTowBauXz96A29AHUZXOX+0DKURLxPXBtNPhkF/yEgLXa4gOFfpsmS4Qs3LA?=
 =?us-ascii?Q?4QYY2eMQAIorUBtuxR74LsZ98b2cg3xUXVxFEcYnKci7ORsK+yGAUJ9CJhVR?=
 =?us-ascii?Q?1mmnnoPjSEzeHkIzOqpLyQjVn7Qx5xyBCG4Wn8piNCMbvQlS3+cyD0JLhuA5?=
 =?us-ascii?Q?n9WI8yBiOwUpJAbA7xKx+KO+y7DPmgqQZ/E/c6px4FdYbRmpUKUeskLKIVoT?=
 =?us-ascii?Q?YIfg36194g/KNV/PlKb7ATMnaA9sF9ueMwLL/6MrOb+deAollRMwrKPvpj9C?=
 =?us-ascii?Q?A51GUp6Hr+arBYaJALQ1dWgih0FbULgOs4q9U2X4EXhdRpc7s1qEt9CDMFJi?=
 =?us-ascii?Q?3aVxzylM++e3gmYaVm2WOdGovA8/hWJ+z8mgZv4ORFeIOYUyvx46NbIuXZV5?=
 =?us-ascii?Q?H6DsyHESTYJSr/i5keA9sutlxxLy0yF+CLcjtleZVhxo3anQ7Y4FaAEn36mV?=
 =?us-ascii?Q?fAvr2wWe2tQ2dfSa51+zpYRoW9obnzRyXQ7zIyQNC1Ja65PMIvBBuDlb5+vW?=
 =?us-ascii?Q?sr/1lsALPEVQXW7ybxJ9KpEnQuEindUwoWysNV2IGGtQ1U18HuZoGamb1KTw?=
 =?us-ascii?Q?Rg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ec3734cf-1df9-4d2f-7d0c-08de3147758b
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB5963.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 02:06:51.8535
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3Wa6mP3vRHjS9ZIP9ORod5wzumCxNmglRGrrEUNazSo/P/Phc1PZPLImuhEIFN5tYOlqTh6jT3jHN6KWHPIgRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4551
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   95cb2fd6ce0ad61af54191fe5ef271d7177f9c3a
commit: 5c9c1e78de1e41b5321583139851797580c077c3 [12308/13171] selftests: af_unix: remove unused stdlib.h include
config: riscv-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251202/202512020931.Av3Qxemh-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251202/202512020931.Av3Qxemh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512020931.Av3Qxemh-lkp@intel.com/

Note: the linux-next/master HEAD 95cb2fd6ce0ad61af54191fe5ef271d7177f9c3a builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

>> unix_connreset.c:17:10: fatal error: string.h: No such file or directory
      17 | #include <string.h>
         |          ^~~~~~~~~~
   compilation terminated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

