Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99D261917FB
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 Oct 2025 00:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760489691; cv=fail; b=h1dIrdSSV0qr74aEUBu2YMwf4UGcRtASkvugnzzBbS2LDaZAwmlwzHmW48g9zIDfgJcbncElA6heZcfDyw2QweDqtQkj0MgAnrJrnmy3LY+XQUzP44d/kqKeB7ujpu44t251mLe09T/oC8Hy3zJblY70wAH2bXvXTyGwvXGqRuY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760489691; c=relaxed/simple;
	bh=tUhxc4+FJEfH+Wz8L0nqug1MalqENLXAwPJGXA+BfL4=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=pDBPjdfCVLkCNgndIWmbzJEmfhKynH4G7PhaNePCJv19vZ2IgoE2tcTGQfvrbsfGC4KXp8uasm3iOkx/Ru7kAzf89dAZy5eohfhhaUqaI5l5ELkMKveKQoJUPidgssev34/Lvu0HiN4LsXJ0FVL5XxemgmUY5/qDjuoKkmM7cC0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gsRHTwsH; arc=fail smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gsRHTwsH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760489690; x=1792025690;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tUhxc4+FJEfH+Wz8L0nqug1MalqENLXAwPJGXA+BfL4=;
  b=gsRHTwsHTOJjeQJMv263Lf3HhGQgYZ7UdhCigJtzP1PlWbMbSb2BhpDn
   tyYvp+Kc8hkDlTA12nTNnS6MCH9JJ5Dwyxf10f1ZkIiaIFu3zfKE3qUG1
   x6157kpxplm4bpLmGnFEgK1cC2DML1aUlgEQO2nDzwKjIPoKFXHUtabUl
   Zpuv8oEqPvyF367qUk3RB1vLdSUbP/o6SlZqsi53JZ587OJTvbz7A51Ub
   HjZRhICIcw5n11EVLbOXNk/0U0FK2ZZgJ6NHx1pR17+ENGjpfwQLPLHEU
   8KT44SBwhDZ22MIRSwJxAy219hfZ1uLy5yt9HmaT5vkpC0iOMqsTOxzk0
   w==;
X-CSE-ConnectionGUID: F+/UFwr4QIi/DWoAh44umw==
X-CSE-MsgGUID: GKR1DBk8R7SzSCQhnnKbTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="66518415"
X-IronPort-AV: E=Sophos;i="6.19,229,1754982000"; 
   d="scan'208";a="66518415"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2025 17:54:47 -0700
X-CSE-ConnectionGUID: 8Nn2T5RjSs6bCCD0iW7dNw==
X-CSE-MsgGUID: emR37CLARsiVZtNa6ICw/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,229,1754982000"; 
   d="scan'208";a="212636714"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2025 17:54:46 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 14 Oct 2025 17:54:45 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 14 Oct 2025 17:54:45 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.14) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 14 Oct 2025 17:54:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cieMHeYmKJlcjpnSMk7f70+MJrUOrjZ55LbF0G4NBPVn2uUvEyCgJjbqk9qdb6FSOJ9YyTEv2X+H0cu2EylOfcVIImaEPzLAde72AyCUk32panLM4vgxm+/BVWISPWFstCBLS97cgLkZr1DMWKl0XuOt/U72dxWhHWwTpQfGWmE9HqSsbk4rFsuky9tjV9Q+oEZFAL0viN+ll7cYns8oxMWaxIdE4nFB8pIfDAzWJIDHoZayyKL8PfSbZivdFpUiTb+H5K1dRhY3I2PrZkFgDG8qHauHui660eckexs00+46MhX5kLjZe4OLnSaOEPbfZH8m7In13+Q9QICEqgbtkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eBJ/2v4oF7wOZFGAo9015zTMAT3dBEKf/cx1evPMJUo=;
 b=zSTbbYYWvCnLaSgzrXJOdUFuH9dApJFz+XCsWvy67vqWEILmnsWv5pmcImG9IXOjkQDpAmx81MasE0cukVDapkdgMJsWp7mx1jGV3wto/LcAEhusOJejlfGFDq3Rfd1/NFRBHxtfxpC3BFyisotNTR0KYQF/sUTxMOgYfoNGnu8z65UWbWwahOgh/T54nJhdNrLxHnr848141pkHGxtQz72I0yazZQoqhCk8N3tLvOLQA8Kde2Db1Gxv4gCD3gCLRPSAqClvOIlA4gTMHpSjmKA62lgXorpbAr5R8074gUTqgQFEF4AemR1DlhHsh7ujswq1r64UNKAfjHcuO3h4CQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4165.namprd11.prod.outlook.com (2603:10b6:a03:18c::26)
 by SA0PR11MB4670.namprd11.prod.outlook.com (2603:10b6:806:9a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.11; Wed, 15 Oct
 2025 00:54:43 +0000
Received: from BY5PR11MB4165.namprd11.prod.outlook.com
 ([fe80::d9f7:7a66:b261:8891]) by BY5PR11MB4165.namprd11.prod.outlook.com
 ([fe80::d9f7:7a66:b261:8891%7]) with mapi id 15.20.9203.009; Wed, 15 Oct 2025
 00:54:43 +0000
Date: Wed, 15 Oct 2025 08:54:36 +0800
From: kernel test robot <lkp@intel.com>
To: <cros-kernel-buildreports@googlegroups.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [android-common:android14-kiwi-6.1 1/1] lib/radix-tree.c:1596:2:
 error: call to '__compiletime_assert_291' declared with 'error' attribute:
 BUILD_BUG_ON failed: RADIX_TREE_MAX_TAGS + __GFP_BITS_SHIFT > 32
Message-ID: <aO7wzJCK/7+o7/hd@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0160.apcprd04.prod.outlook.com (2603:1096:4::22)
 To BY5PR11MB4165.namprd11.prod.outlook.com (2603:10b6:a03:18c::26)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4165:EE_|SA0PR11MB4670:EE_
X-MS-Office365-Filtering-Correlation-Id: cee6a55f-72c0-4444-73ed-08de0b856d8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?K8jmAGzENIOtdd+p26Hg5x3yL0y1VxlIEhmZdJctEhWf1FAHeCXO5k9M3Ic/?=
 =?us-ascii?Q?TKUPtaW6DU51zpW6ueu3ni6yB4Bn9ZsSmy/WUUlF5M5TvmeF2u+kIpUCW6Sd?=
 =?us-ascii?Q?alXC2HlA/fLJLIvt8jxNGWVdcq3Kj8P/Eevh+bXJpTkgW1n94Cg028f6X45R?=
 =?us-ascii?Q?UxZfAUNKey7BqmW6wU1usBgg9wncyI9Z7Z64KzKZqdWpZUYqr1RntdVjbwOT?=
 =?us-ascii?Q?j6sRHJeguUUOMDuSJDdYMrzjwvQyOTbpyo/9HC9OvH3UN97I+kGueSQgXjhP?=
 =?us-ascii?Q?MSDxX16ckVksyGBh4t+U/QRuO6HwSV9stB3+0sdV65mwAk7W4kgE3emVtnGo?=
 =?us-ascii?Q?VN3Cm0vQ0t9nibswXUrGCUjy3K+axAnuFKHfCZ/yZLM4hOU0b3LujZz+ATk2?=
 =?us-ascii?Q?PW4HWLxZ6LzuBBPtMOS43dpoGErkJZyQwa19PYOxUOy3vQeE3qRNchSi9FAB?=
 =?us-ascii?Q?tLq84Xos1veL2oo1lhLRjM1Lm9fmdBAlNYhtdt6nBj8fxd+ojf0TSNHn53xO?=
 =?us-ascii?Q?gEzV9B5gycAppdPZqUvrq1hKIC9ABQnPIaEaqzh4a0yAkumXPzR/LD7Pst4J?=
 =?us-ascii?Q?hd76XEfA47mpDyPFxy+EVS7PFoiDxtpoZDOKtjUiJk2fS6UgzsV/1d3Hdl9P?=
 =?us-ascii?Q?hHEvDI/BX194Jn0buu7uZERxXTP72fW1x0DvE23iiSpx0u7kCkejJhXPBhQb?=
 =?us-ascii?Q?4sXEwgt9eaj2MHim5xS84HQXiJjm+6vgMoxNR7yHkilCDdlPfI4xLMOAWmk/?=
 =?us-ascii?Q?fF3xdyp1IHEmAjEAJhUCsOyLVIb805v3ulbOS/cHpNAFu9zb8bGDsprwS3J3?=
 =?us-ascii?Q?xQvz5uf3hIAspZ4q67yiZ03KIsyeC60VcRSPV5VE5h+UggxewjH7jEOBvVcV?=
 =?us-ascii?Q?IcPmfiUKpDmTsn3UGvyw9NZTWjVjragxav1WRlO2H9gjuwoBO46oCvQ/Vsob?=
 =?us-ascii?Q?vwlbWYNWdFmpYpfknX785/+iAALoO/4NMqoXSl8kygZLHP6Bd2VO/9oy4yDa?=
 =?us-ascii?Q?nuTJzkNzl2EzMvaUwa/bhJIjDZLBeobcHC4uEtYAWDUsbPz5knMTqUa1Hj7E?=
 =?us-ascii?Q?6ULF8wtdTH/4gK73DhYGga+jdKCNQ7VQoT/FD5PC8m2ERbvvcqrXxpHM+rr2?=
 =?us-ascii?Q?PL5aOhU8ZVXHG4LWc0yC/6cIu3P4CHMBE9fawsb+g45o3kgxYnFs3bP1ToBw?=
 =?us-ascii?Q?0PkbWF+raxgoshHRcVPcpklaLZgfd/LJZJl0D2wDkFyc8hRicGrPFBl1Wpmz?=
 =?us-ascii?Q?MvqK1ZhG+XQ+UsAAyrDy/IyDfiBmTiEo3YejhtJybyxHCV2g8o6l+lKHWqtw?=
 =?us-ascii?Q?767o4RO5SvQYw89sFZ8bMPwa3xPyK5JLWL2AVmXZzTtdbS6tYS75Nm8AyU/e?=
 =?us-ascii?Q?pFxgCgMh4CcQdTX22nxCsZTBzz4wB2ca/lVA8amXVubmqRWZnf4OUqOID9Pc?=
 =?us-ascii?Q?wcAdG//7PCY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4165.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NoIZ7ezJQqzMOuu6oYY8cRox+5j8xBNdwMEHggAkWlW2bf2AbJERYL85ms+l?=
 =?us-ascii?Q?4XPNRWgtuWLZ4DgwfJCLxwFEfUpa1is6xebR5bD11b/eptf8ALGCPPfzRyou?=
 =?us-ascii?Q?6hvLPQYtc0reFmT9Q4OeuogpfcSJWwmKRumi+OFahzVij+4SnG8pjNjWhRJd?=
 =?us-ascii?Q?2m6kKeSW2tnd4AZJTefY7kD9LF++oD4PWlfvddY20Xd1kuiCobhYp0BDhh9l?=
 =?us-ascii?Q?RFVNFD8jg7Ob866A8ug7aoPjDn4YW5tJnGsjK4xF8J1hJjb3AV2suekPCCsi?=
 =?us-ascii?Q?0HGsy/RHz2/VFxDEjHVsjKfQCkJD7PUqat0PepzmtZ/VNvKY0lUg+Qh8ORw1?=
 =?us-ascii?Q?yiCxpqeMo/wns8N6JjvR2Rx1APZBL0zScCKdfQk8Kkf/9f8/HA+Co/Oo+CBB?=
 =?us-ascii?Q?TXOD0O1IYV84pnwQfd8NLZvnWvaGPHMNbrvg//tW91vaDbm/hp6HuoPthDt2?=
 =?us-ascii?Q?RoDMHH+bA6azS1HosvvcFDcbOCES9B0MoBkhnxfBja2+HuxnPIEP0ANq72XY?=
 =?us-ascii?Q?jPk6BLYURHJKQL9WAE1xtnQvizxFI5c6LSP0hDx/pDRn1KZDcleAcYbn4+Kd?=
 =?us-ascii?Q?UPyGwpVl0NkDR4zzg4SStq+IYQVjQAqkrYpVhhdcNSErwLI4dGGfUUDja0At?=
 =?us-ascii?Q?vUig2jM+lrN3+t/I9VIBoLfRAUWwxZGGhaA5n/MxvwY/0hsklpRoy0Uwr8Jc?=
 =?us-ascii?Q?Q18Wyr0cgcmoWPhqKhwAhxpCpOSY+JQyqbwu3t1o9oTvzf5macI0ommYvo9v?=
 =?us-ascii?Q?EuUt6IIhqJH2tplgO4zeNsE6alztquqeJD2wV9k1BMh+b0qQRF3bM5iNTK5m?=
 =?us-ascii?Q?MRCMa5/RoRRVvKDFEeSyMqt6JYzuotSYYRygI/jA38yzzvl3hEWM06oHWK0Y?=
 =?us-ascii?Q?bDv6/vUmt+9v0ay0hoXIKGODqAYMdL21+fuWgBjlYR/KONW/1A/3WlrGPcjx?=
 =?us-ascii?Q?D+4kDI2Dl8sw0SOr6kf4mwVbk1gHhM7DWGLM60d5cerhv+zfjXxmOIkk7j1w?=
 =?us-ascii?Q?2Efxxw6ND8GQDup2ge+px91V1ce3FpFkT7EtTR5v1gAMDdiPKJgGDm1MA2q1?=
 =?us-ascii?Q?ZkOx74Ipwd/4rMzsHHyoAguJyDepUHJPDYSGKFdRDd0Bc20GOqeinGrg0ND9?=
 =?us-ascii?Q?UEoKUTIOnME6QTHn0Zlceqo5q17aSnWCIoZnIDERT0HiLHLOfLli62AD2z3F?=
 =?us-ascii?Q?6VUcvhFZq41/86mKlCDRvSNAVhHDsqGDLCvd3XpDdL1o/gcr5utirrVGSpEV?=
 =?us-ascii?Q?Ahx+hFLo74q0dbUd0bDylhr5CgadbPua7znQUi5RrKEm3q6xshvB2mk4LX5I?=
 =?us-ascii?Q?h+X6tN+bbSPrOYTwbvq1Xvwdc+P959Z/eqquebdiJgjaPO+CHel34LlqgWA5?=
 =?us-ascii?Q?2nmiPNjZDUjWJhetDH23ewhQey/6/KIYKvYXauZ+Z++hZ47Uv5xJQuXIdYHg?=
 =?us-ascii?Q?x2w+fGU2/B0d5d/AjoFThchdFCrsltanCUiC2ymyzGDNb6d6kWC9DE6l+vjA?=
 =?us-ascii?Q?UsAjrmQifB7CQrPGDEdS56DHuGPNKORTc33qhqPKV8l/p66cb2OkQRfy8cvB?=
 =?us-ascii?Q?+nm7zPZt/7zYplh7FFSuSyC1Pmbi071tm+gHPiCP?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cee6a55f-72c0-4444-73ed-08de0b856d8b
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4165.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2025 00:54:43.2891
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mPIUWsg/XBMAmcf4HOWow9wP9vgvi3TMTIpAdweeNTeuD7xJm1DNbNTPS17fAk/OgCHiuOJtvoXMT6VYOq9E4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4670
X-OriginatorOrg: intel.com

Hi Vaibhav,

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   81ec2c6aa54df228239e034cb4fd6686f5e1e257
commit: 345e3e5b6400f9ee03b8fad705e399b05d46ef1a [1/1] ANDROID: mm: Fix gfp bit position of __GFP_NO_INIT_ON_ALLOC
:::::: branch date: 24 hours ago
:::::: commit date: 1 year, 1 month ago
config: x86_64-randconfig-161-20251014 (https://download.01.org/0day-ci/archive/20251014/202510141325.DmOdAIyF-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251014/202510141325.DmOdAIyF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202510141325.DmOdAIyF-lkp@intel.com/

All errors (new ones prefixed by >>):

   lib/radix-tree.c:288:6: warning: no previous prototype for function 'radix_tree_node_rcu_free' [-Wmissing-prototypes]
     288 | void radix_tree_node_rcu_free(struct rcu_head *head)
         |      ^
   lib/radix-tree.c:288:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     288 | void radix_tree_node_rcu_free(struct rcu_head *head)
         | ^
         | static 
>> lib/radix-tree.c:1596:2: error: call to '__compiletime_assert_291' declared with 'error' attribute: BUILD_BUG_ON failed: RADIX_TREE_MAX_TAGS + __GFP_BITS_SHIFT > 32
    1596 |         BUILD_BUG_ON(RADIX_TREE_MAX_TAGS + __GFP_BITS_SHIFT > 32);
         |         ^
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   include/linux/compiler_types.h:375:2: note: expanded from macro 'compiletime_assert'
     375 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:363:2: note: expanded from macro '_compiletime_assert'
     363 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:356:4: note: expanded from macro '__compiletime_assert'
     356 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:159:1: note: expanded from here
     159 | __compiletime_assert_291
         | ^
   1 warning and 1 error generated.


vim +1596 lib/radix-tree.c

^1da177e4c3f41 Linus Torvalds            2005-04-16  1591  
^1da177e4c3f41 Linus Torvalds            2005-04-16  1592  void __init radix_tree_init(void)
^1da177e4c3f41 Linus Torvalds            2005-04-16  1593  {
d544abd5ff7d8b Sebastian Andrzej Siewior 2016-11-03  1594  	int ret;
7e7844226f1053 Michal Hocko              2017-05-03  1595  
7e7844226f1053 Michal Hocko              2017-05-03 @1596  	BUILD_BUG_ON(RADIX_TREE_MAX_TAGS + __GFP_BITS_SHIFT > 32);

:::::: The code at line 1596 was first introduced by commit
:::::: 7e7844226f1053236b6f6d5d122a06509fb14fd9 lockdep: allow to disable reclaim lockup detection

:::::: TO: Michal Hocko <mhocko@suse.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

