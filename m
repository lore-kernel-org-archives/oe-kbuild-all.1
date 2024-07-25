Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB34214F111
	for <oe-kbuild-all@lists.linux.dev>; Thu, 25 Jul 2024 06:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721888456; cv=fail; b=pZtNd5NB0y6obtCr6CYe6DVrAkPNtyMDOTRDqE0fvfEJechDjAQEGwdQL11OFpAIYjnhzTHHEUpvDxwRx86nZg+czgToTPUgOmbPI4cNjsX8zxii4zE+vApf59cme8koeSoeh7V+jzKn/1hUHXoqf8WsIycjWvleAlfK4gkGM/c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721888456; c=relaxed/simple;
	bh=do1UoK6DNvhfgVBZlc7o+lEKTbF91DJhPLaFvtBh2iQ=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=tEYU9aIrEvIMkVfwSTMs1XtIOBEegipIUhoiD8kqL6ShjZ4rLPqq+XpfqWGp8pV6IOrI2HPH6Q7r0eovV/y0k3XDNHCveJImrjeksXUL5bdCHkwiJqYHAn+XNF8GWfuIMuASjuGN3YK2B4MykPGBuzQNXAOxDbCnGN3PBY2pLpE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YMVVX14x; arc=fail smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YMVVX14x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721888455; x=1753424455;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=do1UoK6DNvhfgVBZlc7o+lEKTbF91DJhPLaFvtBh2iQ=;
  b=YMVVX14xAGsJtY0Cs8wEr17nRnirXeOd+3s2LRO91hQkb0gj9QgjzUbU
   ZN5Y/HnR6ZmN1xxU+we1pWbXqsl2bIezV4lb36GEdbLED3gLLMucGYoKc
   v3U4ziI5pzu3G021SjlAW1sACXPPF1aKN1fGRbVR3PymQo5zHHYvxZFeA
   xNwKCza05c2eVaXoVTYi36XeYZ9T8mz2gnIiTv6/aqC38bAxRX5FxxUkY
   mJfLm6a8lWbvFM6+he5RvMTOK3tV5DepIOJlTK6J3w/Tyma6jLQYCKPdO
   GBBu9G6cCA1jMNTuss2/zk+LBaRSO6r/7MeTs3BuU2qpwBlutOZ1pZSNq
   Q==;
X-CSE-ConnectionGUID: U3XKgvTAT7qep4QKa6CeDg==
X-CSE-MsgGUID: kuCrfyiWR/KTupiDFiWdFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11143"; a="23464575"
X-IronPort-AV: E=Sophos;i="6.09,235,1716274800"; 
   d="scan'208";a="23464575"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2024 23:20:54 -0700
X-CSE-ConnectionGUID: xIfI/fs+RfKgYb5Gn5xheA==
X-CSE-MsgGUID: dconHLjlQ+G56aswgHBYKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,235,1716274800"; 
   d="scan'208";a="83830439"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 24 Jul 2024 23:20:54 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 24 Jul 2024 23:20:53 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 24 Jul 2024 23:20:53 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 24 Jul 2024 23:20:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IEB8HNC9LSGcNLNGtuYQ2a7DxyVN7Z3h+chLvMKvSgkbzb1llWeF6wt3BmI5LiARpfcjqgG/N0En81KRXj39326XjHWxpBzwpTDl4Y6Tl45TGbP0pKtufysb7uKZtLHRJSHuId4dunCsanrMuHIjt2ZMONR+auKfaE+cUezdvK/Uc1J+gupSGyWMqHQvPbSHHkh40VBQSWDsMdmqXj4abnJH906MpAoVQm5azzktB4CByIJb5La1FFO9O4/lufYXN5+xARxkQPkj0UiI1keNAGEn39G4RftnZyX919jAQT/2BLeYW7zmibh4MeaqKB7lziLmLrH+C8odV7Wkju/Fpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N638omopX+ZHQL3OXlWJeaOekdMzwmrug6lZk2OeYPA=;
 b=Q8lCTn0RTwVv0e3iraBavnAEsFVVaU37aE5UBTs6jeWVyWbOKy3UntwaiYtIwRqBTTn45zlj02SmVA48KIoV9XELaN4EbRAtaeW+GW+VfLLcpES8dqXWiKt9WCPLTOa2MgUex6vE14gyBZ2v7GLPLaFJ1CJ4Dgau2cNiZbv6OOPQlJBmKM0aGaJEIgf/xjcMuZQsqBE+xMBSyP9xG1RBwKWBTmvtXC9t4Mj/UCsScVwOmbdhRtSHFaLcgs77m1lGYkRAMkTXIPG9hvY6DQ7b8P2LR95588dJyadELoQYQMdn3BI5orSwjRULwBpeK7Hgp9qedLYsQRDlEVwphjOVIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB6039.namprd11.prod.outlook.com (2603:10b6:8:76::6) by
 LV8PR11MB8678.namprd11.prod.outlook.com (2603:10b6:408:20b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.20; Thu, 25 Jul
 2024 06:20:45 +0000
Received: from DS7PR11MB6039.namprd11.prod.outlook.com
 ([fe80::3f0c:a44c:f6a2:d3a9]) by DS7PR11MB6039.namprd11.prod.outlook.com
 ([fe80::3f0c:a44c:f6a2:d3a9%3]) with mapi id 15.20.7784.020; Thu, 25 Jul 2024
 06:20:45 +0000
Date: Thu, 25 Jul 2024 14:20:36 +0800
From: kernel test robot <lkp@intel.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
CC: <oe-kbuild-all@lists.linux.dev>, Andrew Morton
	<akpm@linux-foundation.org>, Linux Memory Management List
	<linux-mm@kvack.org>, "Liam R. Howlett" <Liam.Howlett@oracle.com>
Subject: [akpm-mm:mm-unstable 19/30] tools/testing/shared/shared.h:
 linux/types.h is included more than once.
Message-ID: <ZqHutLSnvXwksCPO@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0167.apcprd04.prod.outlook.com (2603:1096:4::29)
 To DS7PR11MB6039.namprd11.prod.outlook.com (2603:10b6:8:76::6)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB6039:EE_|LV8PR11MB8678:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b5ac0d7-0f5e-4166-46a4-08dcac71eafd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?aoWTthWyGs7HAgcMk10bKkx/VhdO1l81fCtTRftwsrWp5R0H4uxCF6hrgbHd?=
 =?us-ascii?Q?GhQfpC5h9ZT8jzP6NcvXnbHGgmBrsvaFEzdPpaU8Tc/4Vh0qsjVhhh5GK8oq?=
 =?us-ascii?Q?WlFmsmwu8tol0TD5uSRpEvLYV3s3QscLxVDuGbgzAsKIcCiOLeSIZpKXv3eD?=
 =?us-ascii?Q?hhzNVFVTRbYsJceH06KqnMUnCVX88QIQBeZsidwI+UHZ074lgSIEfOuFxIzi?=
 =?us-ascii?Q?9+EwP2Af0j7dMq4sSIyAVxWaW/RN6C0BOWENFgnB8q+MSysnuBMIrYu55QTb?=
 =?us-ascii?Q?UsQLumacCwNUYtItVOM3mJ7vvIXYBzZcI7QoGijKgXqfJm4jvOO/JHM/1lxm?=
 =?us-ascii?Q?vno2fJBJurxDMFBERxvo89kqwLExPvC2GcTLKWiGzh0ojHNADH69MSIq37Co?=
 =?us-ascii?Q?ECef14SphitAgzcvT3NzOFpX4miJyJMzQmyhLsCYtBZ5cmUnSrrZxM1zFtH6?=
 =?us-ascii?Q?T/FPenUa7ovc3yUSIo5W+7xN+7+30J0G6wzznWHiNBPcVgOCXhZxOkZGfl/P?=
 =?us-ascii?Q?ZED1/iGJH49aMmHf4XeYAHjqX62qgrhtFxfVCDrT2V/XupdK7URFFmIVULyr?=
 =?us-ascii?Q?XgRyPSWBuhgtE6eJGHwD85VsYhItLf/CEnbHOYPrPUyfqGJlMpm45sflq0/U?=
 =?us-ascii?Q?0QKG0wcVj8chcfxQM90OT6j6IHakkFGiQ/Lil/ugNMItmyqfPRg5D5JF3JWB?=
 =?us-ascii?Q?zd9y8sJzTVGX14f8utSxqYNhynFn8embiz7VOBavOi091l6Co1CPBTOnC05B?=
 =?us-ascii?Q?Kw6AJdghtu+7WnmVavJ89oh+pCyrtNkPjLLRLN9u1BMoLBDttZUy5uh7Ms3t?=
 =?us-ascii?Q?VWtA9D07saLiPJ/UYPz9+6QkChsScUs+GE+1TMUrZPpmYyTMG4lbK5g9YETc?=
 =?us-ascii?Q?JPA7xJhNBQrMkfqH3+/KL/OTQK9nd3zfTo878TYK+ej++iqHWc1/Oi3HxNrf?=
 =?us-ascii?Q?6g8+vPdaQrBq5W/gWj8KJaUSXE6UACVDusLkGE1yR1FvNdTBqwx8osx7rmJG?=
 =?us-ascii?Q?LqcqE9kpzs9hTyP6r1XSsJdPdlNVDFoizhIVKfWCt0fsQ17fLSOnnHaREx1R?=
 =?us-ascii?Q?f/XI2HVd+wQeEQ4cxgzPDCitiKQrkmv/07C9kh79ilslFd3P1jnQ7wmdhRUE?=
 =?us-ascii?Q?kFL1tOobjCxToAtVM+e44lEO/tAM22Ro7rL/gy+mWnwBCo6oHCVpJXbY7lsq?=
 =?us-ascii?Q?hFj0gg6zwEHBG7tVfu+Y004+HsLsUP9EVou8h01H6UAkmkpjbh55U55i/oyr?=
 =?us-ascii?Q?0pXYpp2uOqCaZZo0vtXB1be0Q9Xk+4L3lS4XJu7moSuzr8RRwkxzFQgjlfHv?=
 =?us-ascii?Q?gmQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR11MB6039.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BrpUQ1qFN2CIVCb9J2eaOa/p6LNFydETuVHOstrbywv6WhSezTEp25eXk72H?=
 =?us-ascii?Q?N7iJFdjM3Kk0wiAenJTLCkI812RTUSVssxAx9I026j/mXMVUdWpdypfcgpUY?=
 =?us-ascii?Q?nu9qoQ8Xr8WMeHkCHrgzpRHovm+e2I30zerffugEsD33KeIGO3Sw51EFOHLM?=
 =?us-ascii?Q?kQm0qmyee7rW/CAAceYn1RuOTkbIVec4uMeoev1vpksg17hTmf0CjP1QN6e2?=
 =?us-ascii?Q?FkJKE63zRG4pHZs7wAWh38x5Y06Sacw/wEYU+s5f9/i1PZJuNlhcUHgYeg5F?=
 =?us-ascii?Q?P6VL9LV2tFKrMgwmtj38vztrIqNCaXnh023Z7PgRG/k6Lk9K6/sbcD6NcrIX?=
 =?us-ascii?Q?ptSXD2ZWtjAa49mAxCjLdd+0zmkbadX+1YHZpgNq8URow0h1w5Ljvswf8wfb?=
 =?us-ascii?Q?aEp3lXcCcdq4pi+Ofakpc5U9RB9KO6eoFqbxMAgxjkWV2wu8V5vgCSe8SQFe?=
 =?us-ascii?Q?pC/YdMq0jLwRXUd+0isQjloCL5ysa0MPOfFIZJuLDjdqx2mVsdYLNqzvY2vv?=
 =?us-ascii?Q?e99bbbdZJMqTnH5aOIMeBYZJ/VgNXVk5GPLIZD+eZxEX3k5iEE+07aTBoAv6?=
 =?us-ascii?Q?Z1ZX5+dEbVPG9RGzlrEkPxmnOIYgn4vphEgRd4re/nVjnxLbQBnHskrrJPES?=
 =?us-ascii?Q?X+OW6jh8635umZ4J5QbxkxkudQwqM7RR/hJC/2zWdL03DqJmmglX+FuCOcfm?=
 =?us-ascii?Q?3vMH514ReYpksLOKaDPNnbhfNnDrKSvZW2zkDn/fxc8M2cPCitibaJEre/3x?=
 =?us-ascii?Q?N3DPnMbA5CJSbw5SV9GdBTkc2LvbghWL3XW8SAMQ8ddHYY3q5pxaS7uYkpIf?=
 =?us-ascii?Q?hNfITbtau7jm6be0XVAFvJmrx+qswHdDdaXAdReQGeTujbHV1rXkOT7Uec+J?=
 =?us-ascii?Q?1Tr/1oyPS6LZUnZ5nSdBR7hGMnrC7Gj4Y0U/z1DfwJ8anXqdeqlDOT37ImWi?=
 =?us-ascii?Q?a9+Rm1A9qurOq2D/i2cnZMSjaBUuZnQDVEYnzJ57HtHDkVSb/vQPOr6SwoS5?=
 =?us-ascii?Q?sINrO6WOOhY0UL/DBaaalicGGWB5XrM1cwsE3aigQCQbomfxd8ncIumg3Bai?=
 =?us-ascii?Q?Qkf3YxkDTzEvcdcnLklbpKQG4R4jxoOhdenvabbaEXpEyTS/31yiQDa02G8/?=
 =?us-ascii?Q?bTR0VjCXFR3Kv76dOaz2J/z5o9Wk+gZdPYZkmgilb9Na+vc8aWj7srk1IoaB?=
 =?us-ascii?Q?xu3Dhr1T8hz9ylX7NQ1yjOPqK9FAgvKpfdPo94QBEWmNGc7M2PO6aEnJX45t?=
 =?us-ascii?Q?aHiOc/0eFWwEHnnlPUeu5a2L1l+X7tWDcZTHfrbz1rb64/lehkjx7rKNbwek?=
 =?us-ascii?Q?7zhWklu/mHcBouNt0Xei3MO8ifo9R3Y4q74qR3eF7HXq+1oEB5BVxHO4ABrw?=
 =?us-ascii?Q?XhQvaq6zlHS6eUuPWDFXKcrsc0TuFTm8OLcfG8/+RN2lbMi6U/1LtQcoh7fQ?=
 =?us-ascii?Q?tSOBclNHjYhBb7F0A04pUQuh1D+8DKcL+hP9Ecmm1DBG9KbRpES+PFF8aFoe?=
 =?us-ascii?Q?rjUuR6gNe3W+W+OeLksK/OlUBlAh82mVRqHKeCyoxPUXSkw+lvDG4vQtrCEY?=
 =?us-ascii?Q?hpRva2+CsdP6Lx+569v6LXsOdCRkUPv6kecVn9OD?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b5ac0d7-0f5e-4166-46a4-08dcac71eafd
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB6039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2024 06:20:45.6406
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3azexObypq8a044768smIkFavuoGfd3ZjtSc8qeFhws0XCYm176IVJUguknMDqWJWSSbylltd6eFj1NicX9sjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8678
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   d8492982371a2b1c9354de924b82c7b4f24210d6
commit: 04645ade70e31fd918bfe616e391ee74c325cbf9 [19/30] tools: separate out shared radix-tree components
:::::: branch date: 6 hours ago
:::::: commit date: 2 days ago
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407250430.jTMy1BCJ-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> tools/testing/shared/shared.h: linux/types.h is included more than once.

vim +3 tools/testing/shared/shared.h

     2	
   > 3	#include <linux/types.h>
     4	#include <linux/bug.h>
     5	#include <linux/kernel.h>
     6	#include <linux/bitops.h>
     7	
     8	#include <linux/gfp.h>
   > 9	#include <linux/types.h>
    10	#include <linux/rcupdate.h>
    11	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

