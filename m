Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9341B28F1
	for <oe-kbuild-all@lists.linux.dev>; Sun, 28 Jul 2024 03:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722139155; cv=fail; b=ljFVoKJ5IU5dqccJSorQR0YHdwHtztJ3VyDAkEWKDfxTY27Hl4r8dTnsbNoiGz2JSPdWVNKnZfUlLA5GapLIiTJMPHqLXctrUHBBF7eIjnX0pbqEqwA61RegFj2XJeye4ukCNBcZacy6phD2EpKaYxQ6oMiArelTesrSZGipzrI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722139155; c=relaxed/simple;
	bh=LyW2NHHv8P0uIC8AFpI2EGwvxEW6FVaDSQAX86YoCxI=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=CiTMidbjcRH9TlCDIQWM6eMTEpi9FfQlYZhyEQodvS9g0HVBkL2I14FMwV354MMsEd9QRPFj7L5RBFNLeFGa7gqWHkcrhRNheLowlqZzdFhmiOjOmXTt+bH+DKVPxEOoHBIcYeuOJVkXtmkUDOi7PH7g6sEX3podBtDIbl3DO3o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DsvP79jw; arc=fail smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DsvP79jw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722139152; x=1753675152;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LyW2NHHv8P0uIC8AFpI2EGwvxEW6FVaDSQAX86YoCxI=;
  b=DsvP79jwxsuPZC9/LACKz9zcFvOJfQ83r8BqCUTGnCTMwMlGMmNCtWn3
   tTppQ+4uyS0wM3FCIe6bC4XYRgA6np8Hap4TJF4lvzz49QtbD+iCKiWWR
   GnCF6cgH5BGSBAcbalJh8O527AnHdLTfKzsYQ/rtaJgIEmkOY9DrO6mfF
   mHPt8id+/5GEbWlPubbTyqyMtuiIQYyUhecFa4HEMnKl4GKmcWEhI5Cei
   Ol4Ir0fIxCt04q3g0uorySc9zEPl0NLMIHuD7brOIUWCXmmof3ITN674r
   7qlyBBZ+4QMcpsuLrCPPd1wkac8vrv1A39CEciK9RMlnv9W0L84D9dZ/s
   w==;
X-CSE-ConnectionGUID: TaD99hljRcGyl6gKGJckeQ==
X-CSE-MsgGUID: je9WmsbpSN66W+hZshCXpA==
X-IronPort-AV: E=McAfee;i="6700,10204,11146"; a="42424929"
X-IronPort-AV: E=Sophos;i="6.09,243,1716274800"; 
   d="scan'208";a="42424929"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2024 20:59:10 -0700
X-CSE-ConnectionGUID: jW4mbPoIS4SQ9RTwL1Jj0Q==
X-CSE-MsgGUID: KeVfjhqIRZKl63cBPe4RsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,243,1716274800"; 
   d="scan'208";a="53298068"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 27 Jul 2024 20:59:09 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sat, 27 Jul 2024 20:59:08 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sat, 27 Jul 2024 20:59:08 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sat, 27 Jul 2024 20:59:08 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sat, 27 Jul 2024 20:59:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y6RvbM8Wi2k5iG6njZOLTsGY+0Xp/5kNCWWpLtYkUK/izXu55Pfdm0oM7L5MPXo7EQ8fWJMkwfvqnRFIxtHUsSzqFtowEa7I7lHHfUc+PufHnnbx2qkMeElpFJgHoCtpMAEXeOmfjP2vy+Vp+BaxGKrWYpBdhpjhkPGRHnEniX9/Vgs5zaHeBi77I/QQ9N/JPTTjnScbBRiJVwnCg8qcmu5kRNsCzrNVAmEmAddKpmIn4YV7a+19PdOFkndkgnGhfBk0nqHfZM/AqeRZ1DrfDmGdc+MwIDMYiWt2sleBf6kymyVrWgUEQ0HWCDYEDWgPMAgMoICXviqKXmGohL7SOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MGcxUcyEc8Q78aIwsOUewSABfIFk0Y1lopzTza7EfWM=;
 b=eDeIjVl1yFE7NA3HW/Z+W8dpk8aGtgfZAVVCYv3FIvjdNrMATZope3oLtvsOJRtsEjiqI9HK2F46aoJv6KxSU2mV3OKERZd4VVfYgJTJ+o/SxqVaoDdiLUS6Xky8OsZ5ECCo88zptbS0PIvnhGdgeqnhWI8XUq78t3UY0O0Qfmuqf8zsC1NfEI6NHQYSXk/bT0PF4eB0sRur35bOby2lWWwnntmQ50XhGqsCzb3p/RKPpV233djMYDnOV5LPvRh8thrMCcttU2PaCoIXL6m3tDoc7OXBsryC2zhZ0HgWsFEO5hsT+Ew/4MdBlfo1iMazLqnDt3U5lXB477XqHdJsQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB6039.namprd11.prod.outlook.com (2603:10b6:8:76::6) by
 CO1PR11MB4770.namprd11.prod.outlook.com (2603:10b6:303:94::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7807.24; Sun, 28 Jul 2024 03:58:59 +0000
Received: from DS7PR11MB6039.namprd11.prod.outlook.com
 ([fe80::3f0c:a44c:f6a2:d3a9]) by DS7PR11MB6039.namprd11.prod.outlook.com
 ([fe80::3f0c:a44c:f6a2:d3a9%3]) with mapi id 15.20.7807.026; Sun, 28 Jul 2024
 03:58:57 +0000
Date: Sun, 28 Jul 2024 11:58:47 +0800
From: kernel test robot <lkp@intel.com>
To: David Finkel <davidf@vimeo.com>
CC: <oe-kbuild-all@lists.linux.dev>, Andrew Morton
	<akpm@linux-foundation.org>, Linux Memory Management List
	<linux-mm@kvack.org>
Subject: [akpm-mm:mm-unstable 36/78] test_memcontrol.c:201:6: warning:
 variable 'fd4_closed' is used uninitialized whenever 'if' condition is true
Message-ID: <ZqXB99KGKrzyePeL@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0159.apcprd04.prod.outlook.com (2603:1096:4::21)
 To DS7PR11MB6039.namprd11.prod.outlook.com (2603:10b6:8:76::6)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB6039:EE_|CO1PR11MB4770:EE_
X-MS-Office365-Filtering-Correlation-Id: cadf6761-97df-46e9-c614-08dcaeb999e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?brFlIqrfnOh33IsPKbdEXnVWbKOw/8st4iuKrZ60WhfUF8ImAfqaFGWpRtei?=
 =?us-ascii?Q?weo98mXuEhRhoO7fOgIidcra7ASqaRKE8fgTipTvLkOas0PYFOoHufezoDPo?=
 =?us-ascii?Q?VntkHgkMaDeNOJCdy+LTsILYgOFmx+t+cIJ3ZLFJ6n7JJWJ/foZYzZlvIKx4?=
 =?us-ascii?Q?cb4wOFvC0oRybjKq0P2D1TYRFkgAmkXwiLZOOKx/5G8wgZwtNuFULyuW+XMo?=
 =?us-ascii?Q?hSCOaek2XYaLyCxF0rXE0mBrXzhOXE4SplWYWByq5I6lwNrNTCi5FS/CPuhG?=
 =?us-ascii?Q?ctckMO9QZrbjmYu/4EClcz5fDcmpgWR8FXl46evfKKbMMjbW2kJufJOxSdXa?=
 =?us-ascii?Q?OK365Rb4iw7XupK4i0eOysUfllBljUFkegJ0UfjRCIxlLEitzDXDwC8TKqAq?=
 =?us-ascii?Q?2Q+GXwFaSGCytACJSEhzQynx2uSj+7aWR/rr+uTohBGuruV65lVQZccv9uis?=
 =?us-ascii?Q?aqS1T3DuQcUOyTwfOQpUqNd2vL6+T5tt2VLJHN1WLeLTM8H38rsypaAkQaau?=
 =?us-ascii?Q?KbzyxHyEKVWUIQgpkuQpB0l1vfWuoXptUShT+vSxkWv0NrZjQVSQzhigEgu1?=
 =?us-ascii?Q?gzjVqGcDONmtQyDnlZvgZNmewLBq1he0RDe/Bwq2tAruaPnutEb9OuamhFDI?=
 =?us-ascii?Q?ys1tMWGFdIhRfq/xqDregphqM2cZnFIoQy8B+AZAg3rt6mksB1BmhhaftlzA?=
 =?us-ascii?Q?8Vf0HScKpyJy3zDIjCwpHjnExGb7pkiGXfF5PECd0SPd+ryPl18a1txWQcpF?=
 =?us-ascii?Q?Nsw+cd2MZSoNObnH1cPKekFp1GQ09OGVFsXkabFaFAj51LyJkaK2REe+bXGS?=
 =?us-ascii?Q?x1nSfpW1A8LIZqFMu0qSeijk2T1MTpefbLhONyAVKBKv7K4M58OMLVoQgGbR?=
 =?us-ascii?Q?v4y4jjzI7Gb/6QeqjqOYmBTkg7RetjZeac8oJ/A2Up/BiEA06OZ2Pmm3awNv?=
 =?us-ascii?Q?F6S9DtnOzGk2/tAQ3zpZI8h/AmFuBw5KHRuwHmvkBRqyP45jvoH9DmoVZJXS?=
 =?us-ascii?Q?S1nDA7XNHbvBBgR4POX2u50lF/r2pquXeZxrXtzYMemJD/JuuqUu+JcXQol2?=
 =?us-ascii?Q?nhIWewkRK/Wq7zq8FDIWlNs8JS2sTbf3O4oZykc5LSvX7zRh64tmvrG5Ue1P?=
 =?us-ascii?Q?aQlzjnL8FZ6+vmxP9AwA7w9aUx70gglRA9k0zewBk2duGPpZrN+1vq70TsLm?=
 =?us-ascii?Q?uyDq/ZlFbpDZ0EG3PEKQaLspAnz8KczgqDFqwDtzbI0lndyknlskJDrNXGfQ?=
 =?us-ascii?Q?p01Ev0xohouiVgm3ZnkWPwPiOXVnfwtHJ2vcEQ2ePh4aETNBYJLQDHRRGyE+?=
 =?us-ascii?Q?hm5xuhkLrCJWXBr565xAW7I+?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR11MB6039.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?B5MfiaXR3M7bK91VxuoQMUpgkWVjujNyyVDehmxVCAGY1LSkAa16cL+21nBK?=
 =?us-ascii?Q?3QIXokS51h4R17XwsGiXlHLvWDYOHD7Uze4rLP974pSFk2uwrx1vfkZJlqQL?=
 =?us-ascii?Q?O/WNx2o1wGLV5pg7Ow3z5jM5NkeaeR4vrrlAmD3PmI9iTvIiUI2r1P/CKCiP?=
 =?us-ascii?Q?Sd5yajXiPEgh4ny/WxJ9yYDvXp9alRRxmnn7j3oyuMBDjh0+rxT6iijBVECW?=
 =?us-ascii?Q?yY0Vyypv2eZB+BFep/tBLKVQ3DXahnfh/ktq+zLL+H2aRNpMEBX7BUsxXoSS?=
 =?us-ascii?Q?2MqQG0fApBfjBZ4OrQV3CK/0MDk+ujSA+QIKlDrB61/G7oO70MPl/uc7yXn4?=
 =?us-ascii?Q?e5aoH5x1zXUAScqf/1wB92aelTsQheDEWBKYsV7j0e+AEc2mq3oY1ATG5hiu?=
 =?us-ascii?Q?hJRMW6s7Wm7f4dXCGXF0xhvGdvNhBP6y7TZPXKss6p8J11Evq7DI8zw+LMEh?=
 =?us-ascii?Q?0egIlQR60j+8Zs1q/8/KesGsTQB0DW1jsAGaTSO0j4JjubXetM96r1MmbUlR?=
 =?us-ascii?Q?HnvrYY6UCjh2S7gpzP7e9Ovs3uYIlw7otnYwzesG6PfIfGjc9v2Rq2wcx1uC?=
 =?us-ascii?Q?zcB/hcOU7bL9murDbtdu35aNr8eXwugWD+1aekU3ZW3YD0cjAOd4sfz8P2TG?=
 =?us-ascii?Q?saTh5OJqhq0VZ0WLiglqLqgxA49CEf9Gg+o7b4LekRTzj0r6wdgaqvvh5hNt?=
 =?us-ascii?Q?R/7zgTUEsSpGFrciARBc62QhCAACrjlgfNxYJq4Se3fVX/oc4/M57/eZ9UGh?=
 =?us-ascii?Q?fmPtefRetX7spVN8gbwuPyCGARtGpfRsaa5mVjqA8ilRhfft5vAwKEDUAjl2?=
 =?us-ascii?Q?DiHFq1RseL325K9QYhQRbwlsfeCQBoclORHW+pc9pGCt7WUD3RcAMiw0VPTT?=
 =?us-ascii?Q?xeGFv6i1E4q+QYWQn+suzw8fYk0FPj1oMOhRNVyZfwXJPRAd7D0yvAVNIzrp?=
 =?us-ascii?Q?FgJpby0tJMdPzEWY2D+PQXIr2TJ1txYST65bRa5CmEh7tbYgjCTOPXMkHn45?=
 =?us-ascii?Q?CT+lziKuSY52ZRGXmJ8BBfqUXJ/erxkvdNnizb+M2b3ll4vDyutYORh8dxA2?=
 =?us-ascii?Q?H1C6wK4H1bjujvIlP49Vxa0tmWNB07K3Km7a3NDFTWszhMCJexVoP6XrxtmQ?=
 =?us-ascii?Q?+1LbD3/jBlwHkG8L1j/GqzVBDJW2EvNIr8jFNOXMUHrevZU6Rzu7E8DFVWWZ?=
 =?us-ascii?Q?9ujZYKpX4Iu08VGpjGEwIA67EqV2+HpWZl9fMeYBsWUcoI/VtOFRqs8v7GRV?=
 =?us-ascii?Q?8X5vm4NGhNZD60KLtxfGPXAN9j+SxAdCYyr42Sr6btKDGZEKDpiZ+3gmSA2u?=
 =?us-ascii?Q?yZq+NuH9GOxbHcjJLGTy6ODryrMVsqlaIhwGzQd0vhzroJhHXGc2QWY3+NnB?=
 =?us-ascii?Q?pFRXK5yqx4D8Q9IZ+zoUS85ItXt6tOmN+ZcXA1iqqsJxriKqcKEDDLZv1u/9?=
 =?us-ascii?Q?i4GB1KHzou1aUdc+YjbCHxCjZ+RMmkceVH1I/5hpl0iGaoM2eGsTKkMn2/TI?=
 =?us-ascii?Q?Y08emRRnMwwxEH981w9+TuEhK3A/WyM/1sPEMVjLhzd0Hpp42M9H80Is8nk3?=
 =?us-ascii?Q?pdEPf6xnSy7vLbAvvjz8CP//teLl+hSrEOIJrhU0?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cadf6761-97df-46e9-c614-08dcaeb999e1
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB6039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2024 03:58:57.4103
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cvxunuWuPAPgHa/yYXIetIxwgMw1TivfuxnvCmqWjsASU2mbU2VLPg9ha5rccE75Orm2vWpJ70e2z5wffMNLsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4770
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   b39b3892d20a337489c55806f91af581474f3943
commit: f2db5cca8182337f4ad485ebfd532b1a2d1c223a [36/78] mm, memcg: cg2 memory{.swap,}.peak write tests
:::::: branch date: 2 days ago
:::::: commit date: 3 days ago
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240727/202407272301.bBC2CidR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407272301.bBC2CidR-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> test_memcontrol.c:201:6: warning: variable 'fd4_closed' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     201 |         if (peak_fd == -1)
         |             ^~~~~~~~~~~~~
   test_memcontrol.c:283:7: note: uninitialized use occurs here
     283 |         if (!fd4_closed)
         |              ^~~~~~~~~~
   test_memcontrol.c:201:2: note: remove the 'if' if its condition is always false
     201 |         if (peak_fd == -1)
         |         ^~~~~~~~~~~~~~~~~~
     202 |                 goto cleanup;
         |                 ~~~~~~~~~~~~
   test_memcontrol.c:191:6: warning: variable 'fd4_closed' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     191 |         if (peak < MB(50))
         |             ^~~~~~~~~~~~~
   test_memcontrol.c:283:7: note: uninitialized use occurs here
     283 |         if (!fd4_closed)
         |              ^~~~~~~~~~
   test_memcontrol.c:191:2: note: remove the 'if' if its condition is always false
     191 |         if (peak < MB(50))
         |         ^~~~~~~~~~~~~~~~~~
     192 |                 goto cleanup;
         |                 ~~~~~~~~~~~~
   test_memcontrol.c:187:6: warning: variable 'fd4_closed' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     187 |         if (cg_run(memcg, alloc_anon_50M_check, NULL))
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   test_memcontrol.c:283:7: note: uninitialized use occurs here
     283 |         if (!fd4_closed)
         |              ^~~~~~~~~~
   test_memcontrol.c:187:2: note: remove the 'if' if its condition is always false
     187 |         if (cg_run(memcg, alloc_anon_50M_check, NULL))
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     188 |                 goto cleanup;
         |                 ~~~~~~~~~~~~
   test_memcontrol.c:184:6: warning: variable 'fd4_closed' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     184 |         if (peak != 0)
         |             ^~~~~~~~~
   test_memcontrol.c:283:7: note: uninitialized use occurs here
     283 |         if (!fd4_closed)
         |              ^~~~~~~~~~
   test_memcontrol.c:184:2: note: remove the 'if' if its condition is always false
     184 |         if (peak != 0)
         |         ^~~~~~~~~~~~~~
     185 |                 goto cleanup;
         |                 ~~~~~~~~~~~~
   test_memcontrol.c:180:6: warning: variable 'fd4_closed' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     180 |         if (current != 0)
         |             ^~~~~~~~~~~~
   test_memcontrol.c:283:7: note: uninitialized use occurs here
     283 |         if (!fd4_closed)
         |              ^~~~~~~~~~
   test_memcontrol.c:180:2: note: remove the 'if' if its condition is always false
     180 |         if (current != 0)
         |         ^~~~~~~~~~~~~~~~~
     181 |                 goto cleanup;
         |                 ~~~~~~~~~~~~
   test_memcontrol.c:176:6: warning: variable 'fd4_closed' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     176 |         if (cg_create(memcg))
         |             ^~~~~~~~~~~~~~~~
   test_memcontrol.c:283:7: note: uninitialized use occurs here
     283 |         if (!fd4_closed)
         |              ^~~~~~~~~~
   test_memcontrol.c:176:2: note: remove the 'if' if its condition is always false
     176 |         if (cg_create(memcg))
         |         ^~~~~~~~~~~~~~~~~~~~~
     177 |                 goto cleanup;
         |                 ~~~~~~~~~~~~
   test_memcontrol.c:173:6: warning: variable 'fd4_closed' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     173 |         if (!memcg)
         |             ^~~~~~
   test_memcontrol.c:283:7: note: uninitialized use occurs here
     283 |         if (!fd4_closed)
         |              ^~~~~~~~~~
   test_memcontrol.c:173:2: note: remove the 'if' if its condition is always false
     173 |         if (!memcg)
         |         ^~~~~~~~~~~
     174 |                 goto cleanup;
         |                 ~~~~~~~~~~~~
   test_memcontrol.c:204:2: note: variable 'fd4_closed' is declared here
     204 |         bool fd2_closed = false, fd3_closed = false, fd4_closed = false;
         |         ^
   /opt/cross/clang-617a15a9ea/lib/clang/18/include/stdbool.h:20:14: note: expanded from macro 'bool'
      20 | #define bool _Bool
         |              ^
>> test_memcontrol.c:201:6: warning: variable 'fd3_closed' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     201 |         if (peak_fd == -1)
         |             ^~~~~~~~~~~~~
   test_memcontrol.c:281:7: note: uninitialized use occurs here
     281 |         if (!fd3_closed)
         |              ^~~~~~~~~~
   test_memcontrol.c:201:2: note: remove the 'if' if its condition is always false
     201 |         if (peak_fd == -1)
         |         ^~~~~~~~~~~~~~~~~~
     202 |                 goto cleanup;
         |                 ~~~~~~~~~~~~
   test_memcontrol.c:191:6: warning: variable 'fd3_closed' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     191 |         if (peak < MB(50))
         |             ^~~~~~~~~~~~~
   test_memcontrol.c:281:7: note: uninitialized use occurs here
     281 |         if (!fd3_closed)
         |              ^~~~~~~~~~
   test_memcontrol.c:191:2: note: remove the 'if' if its condition is always false
     191 |         if (peak < MB(50))
         |         ^~~~~~~~~~~~~~~~~~
     192 |                 goto cleanup;
         |                 ~~~~~~~~~~~~
   test_memcontrol.c:187:6: warning: variable 'fd3_closed' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     187 |         if (cg_run(memcg, alloc_anon_50M_check, NULL))
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   test_memcontrol.c:281:7: note: uninitialized use occurs here
     281 |         if (!fd3_closed)
         |              ^~~~~~~~~~
   test_memcontrol.c:187:2: note: remove the 'if' if its condition is always false
     187 |         if (cg_run(memcg, alloc_anon_50M_check, NULL))
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     188 |                 goto cleanup;
         |                 ~~~~~~~~~~~~
   test_memcontrol.c:184:6: warning: variable 'fd3_closed' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     184 |         if (peak != 0)
         |             ^~~~~~~~~
   test_memcontrol.c:281:7: note: uninitialized use occurs here
     281 |         if (!fd3_closed)
         |              ^~~~~~~~~~
   test_memcontrol.c:184:2: note: remove the 'if' if its condition is always false
     184 |         if (peak != 0)
         |         ^~~~~~~~~~~~~~
     185 |                 goto cleanup;
         |                 ~~~~~~~~~~~~
   test_memcontrol.c:180:6: warning: variable 'fd3_closed' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     180 |         if (current != 0)
         |             ^~~~~~~~~~~~
   test_memcontrol.c:281:7: note: uninitialized use occurs here
     281 |         if (!fd3_closed)
         |              ^~~~~~~~~~
   test_memcontrol.c:180:2: note: remove the 'if' if its condition is always false
     180 |         if (current != 0)
         |         ^~~~~~~~~~~~~~~~~
     181 |                 goto cleanup;
         |                 ~~~~~~~~~~~~
   test_memcontrol.c:176:6: warning: variable 'fd3_closed' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     176 |         if (cg_create(memcg))
         |             ^~~~~~~~~~~~~~~~
   test_memcontrol.c:281:7: note: uninitialized use occurs here
     281 |         if (!fd3_closed)
         |              ^~~~~~~~~~
   test_memcontrol.c:176:2: note: remove the 'if' if its condition is always false
     176 |         if (cg_create(memcg))
         |         ^~~~~~~~~~~~~~~~~~~~~
     177 |                 goto cleanup;
         |                 ~~~~~~~~~~~~
   test_memcontrol.c:173:6: warning: variable 'fd3_closed' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     173 |         if (!memcg)
         |             ^~~~~~
   test_memcontrol.c:281:7: note: uninitialized use occurs here
     281 |         if (!fd3_closed)
         |              ^~~~~~~~~~
   test_memcontrol.c:173:2: note: remove the 'if' if its condition is always false
     173 |         if (!memcg)
         |         ^~~~~~~~~~~
     174 |                 goto cleanup;
         |                 ~~~~~~~~~~~~
   test_memcontrol.c:204:2: note: variable 'fd3_closed' is declared here
     204 |         bool fd2_closed = false, fd3_closed = false, fd4_closed = false;
         |         ^
   /opt/cross/clang-617a15a9ea/lib/clang/18/include/stdbool.h:20:14: note: expanded from macro 'bool'
      20 | #define bool _Bool
         |              ^
>> test_memcontrol.c:191:6: warning: variable 'peak_fd' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     191 |         if (peak < MB(50))
         |             ^~~~~~~~~~~~~
   test_memcontrol.c:278:8: note: uninitialized use occurs here
     278 |         close(peak_fd);
         |               ^~~~~~~
   test_memcontrol.c:191:2: note: remove the 'if' if its condition is always false
     191 |         if (peak < MB(50))
         |         ^~~~~~~~~~~~~~~~~~
     192 |                 goto cleanup;
         |                 ~~~~~~~~~~~~
   test_memcontrol.c:187:6: warning: variable 'peak_fd' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     187 |         if (cg_run(memcg, alloc_anon_50M_check, NULL))
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   test_memcontrol.c:278:8: note: uninitialized use occurs here
     278 |         close(peak_fd);
         |               ^~~~~~~
   test_memcontrol.c:187:2: note: remove the 'if' if its condition is always false
     187 |         if (cg_run(memcg, alloc_anon_50M_check, NULL))
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     188 |                 goto cleanup;
         |                 ~~~~~~~~~~~~
   test_memcontrol.c:184:6: warning: variable 'peak_fd' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     184 |         if (peak != 0)
         |             ^~~~~~~~~
   test_memcontrol.c:278:8: note: uninitialized use occurs here
     278 |         close(peak_fd);
         |               ^~~~~~~
   test_memcontrol.c:184:2: note: remove the 'if' if its condition is always false
     184 |         if (peak != 0)
         |         ^~~~~~~~~~~~~~
     185 |                 goto cleanup;
         |                 ~~~~~~~~~~~~
   test_memcontrol.c:180:6: warning: variable 'peak_fd' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     180 |         if (current != 0)
         |             ^~~~~~~~~~~~
   test_memcontrol.c:278:8: note: uninitialized use occurs here
     278 |         close(peak_fd);
         |               ^~~~~~~
   test_memcontrol.c:180:2: note: remove the 'if' if its condition is always false
     180 |         if (current != 0)
         |         ^~~~~~~~~~~~~~~~~
     181 |                 goto cleanup;
         |                 ~~~~~~~~~~~~
   test_memcontrol.c:176:6: warning: variable 'peak_fd' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     176 |         if (cg_create(memcg))
         |             ^~~~~~~~~~~~~~~~
   test_memcontrol.c:278:8: note: uninitialized use occurs here
     278 |         close(peak_fd);
         |               ^~~~~~~
   test_memcontrol.c:176:2: note: remove the 'if' if its condition is always false
     176 |         if (cg_create(memcg))
         |         ^~~~~~~~~~~~~~~~~~~~~
     177 |                 goto cleanup;
         |                 ~~~~~~~~~~~~
   test_memcontrol.c:173:6: warning: variable 'peak_fd' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     173 |         if (!memcg)
         |             ^~~~~~
   test_memcontrol.c:278:8: note: uninitialized use occurs here
     278 |         close(peak_fd);
         |               ^~~~~~~
   test_memcontrol.c:173:2: note: remove the 'if' if its condition is always false
     173 |         if (!memcg)
         |         ^~~~~~~~~~~
     174 |                 goto cleanup;
         |                 ~~~~~~~~~~~~
   test_memcontrol.c:199:2: note: variable 'peak_fd' is declared here
     199 |         int peak_fd = cg_open(memcg, "memory.peak", O_RDWR | O_APPEND | O_CLOEXEC);
         |         ^
>> test_memcontrol.c:201:6: warning: variable 'fd2_closed' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     201 |         if (peak_fd == -1)
         |             ^~~~~~~~~~~~~
   test_memcontrol.c:279:7: note: uninitialized use occurs here
     279 |         if (!fd2_closed)
         |              ^~~~~~~~~~
   test_memcontrol.c:201:2: note: remove the 'if' if its condition is always false
     201 |         if (peak_fd == -1)
         |         ^~~~~~~~~~~~~~~~~~
     202 |                 goto cleanup;
         |                 ~~~~~~~~~~~~
   test_memcontrol.c:191:6: warning: variable 'fd2_closed' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     191 |         if (peak < MB(50))
         |             ^~~~~~~~~~~~~
   test_memcontrol.c:279:7: note: uninitialized use occurs here
     279 |         if (!fd2_closed)
         |              ^~~~~~~~~~
   test_memcontrol.c:191:2: note: remove the 'if' if its condition is always false
     191 |         if (peak < MB(50))
         |         ^~~~~~~~~~~~~~~~~~
     192 |                 goto cleanup;
         |                 ~~~~~~~~~~~~
   test_memcontrol.c:187:6: warning: variable 'fd2_closed' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     187 |         if (cg_run(memcg, alloc_anon_50M_check, NULL))
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   test_memcontrol.c:279:7: note: uninitialized use occurs here
     279 |         if (!fd2_closed)
         |              ^~~~~~~~~~
   test_memcontrol.c:187:2: note: remove the 'if' if its condition is always false
     187 |         if (cg_run(memcg, alloc_anon_50M_check, NULL))
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     188 |                 goto cleanup;
         |                 ~~~~~~~~~~~~
   test_memcontrol.c:184:6: warning: variable 'fd2_closed' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     184 |         if (peak != 0)
         |             ^~~~~~~~~
   test_memcontrol.c:279:7: note: uninitialized use occurs here
     279 |         if (!fd2_closed)
         |              ^~~~~~~~~~
   test_memcontrol.c:184:2: note: remove the 'if' if its condition is always false
     184 |         if (peak != 0)
         |         ^~~~~~~~~~~~~~
     185 |                 goto cleanup;
         |                 ~~~~~~~~~~~~
   test_memcontrol.c:180:6: warning: variable 'fd2_closed' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     180 |         if (current != 0)
         |             ^~~~~~~~~~~~
   test_memcontrol.c:279:7: note: uninitialized use occurs here
     279 |         if (!fd2_closed)
         |              ^~~~~~~~~~
   test_memcontrol.c:180:2: note: remove the 'if' if its condition is always false
     180 |         if (current != 0)
         |         ^~~~~~~~~~~~~~~~~
     181 |                 goto cleanup;
         |                 ~~~~~~~~~~~~
   test_memcontrol.c:176:6: warning: variable 'fd2_closed' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     176 |         if (cg_create(memcg))
         |             ^~~~~~~~~~~~~~~~
   test_memcontrol.c:279:7: note: uninitialized use occurs here
     279 |         if (!fd2_closed)
         |              ^~~~~~~~~~
   test_memcontrol.c:176:2: note: remove the 'if' if its condition is always false
     176 |         if (cg_create(memcg))
         |         ^~~~~~~~~~~~~~~~~~~~~
     177 |                 goto cleanup;
         |                 ~~~~~~~~~~~~
   test_memcontrol.c:173:6: warning: variable 'fd2_closed' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     173 |         if (!memcg)
         |             ^~~~~~
   test_memcontrol.c:279:7: note: uninitialized use occurs here
     279 |         if (!fd2_closed)
         |              ^~~~~~~~~~
   test_memcontrol.c:173:2: note: remove the 'if' if its condition is always false
     173 |         if (!memcg)
         |         ^~~~~~~~~~~
     174 |                 goto cleanup;
         |                 ~~~~~~~~~~~~
   test_memcontrol.c:204:2: note: variable 'fd2_closed' is declared here
     204 |         bool fd2_closed = false, fd3_closed = false, fd4_closed = false;
         |         ^
   /opt/cross/clang-617a15a9ea/lib/clang/18/include/stdbool.h:20:14: note: expanded from macro 'bool'
      20 | #define bool _Bool
         |              ^
>> test_memcontrol.c:934:6: warning: variable 'swap_peak_fd' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     934 |         if (cg_read_long(memcg, "memory.swap.current")) {
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   test_memcontrol.c:1083:12: note: uninitialized use occurs here
    1083 |         if (close(swap_peak_fd))
         |                   ^~~~~~~~~~~~
   test_memcontrol.c:934:2: note: remove the 'if' if its condition is always false
     934 |         if (cg_read_long(memcg, "memory.swap.current")) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     935 |                 ret = KSFT_SKIP;
         |                 ~~~~~~~~~~~~~~~~
     936 |                 goto cleanup;
         |                 ~~~~~~~~~~~~~
     937 |         }
         |         ~
   test_memcontrol.c:931:6: warning: variable 'swap_peak_fd' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     931 |         if (cg_create(memcg))
         |             ^~~~~~~~~~~~~~~~
   test_memcontrol.c:1083:12: note: uninitialized use occurs here
    1083 |         if (close(swap_peak_fd))
         |                   ^~~~~~~~~~~~
   test_memcontrol.c:931:2: note: remove the 'if' if its condition is always false
     931 |         if (cg_create(memcg))
         |         ^~~~~~~~~~~~~~~~~~~~~
     932 |                 goto cleanup;
         |                 ~~~~~~~~~~~~
   test_memcontrol.c:928:6: warning: variable 'swap_peak_fd' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     928 |         if (!memcg)
         |             ^~~~~~
   test_memcontrol.c:1083:12: note: uninitialized use occurs here
    1083 |         if (close(swap_peak_fd))
         |                   ^~~~~~~~~~~~
   test_memcontrol.c:928:2: note: remove the 'if' if its condition is always false
     928 |         if (!memcg)
         |         ^~~~~~~~~~~
     929 |                 goto cleanup;
         |                 ~~~~~~~~~~~~
   test_memcontrol.c:939:2: note: variable 'swap_peak_fd' is declared here
     939 |         int swap_peak_fd = cg_open(memcg, "memory.swap.peak",
         |         ^
>> test_memcontrol.c:942:6: warning: variable 'mem_peak_fd' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     942 |         if (swap_peak_fd == -1)
         |             ^~~~~~~~~~~~~~~~~~
   test_memcontrol.c:1081:12: note: uninitialized use occurs here
    1081 |         if (close(mem_peak_fd))
         |                   ^~~~~~~~~~~
   test_memcontrol.c:942:2: note: remove the 'if' if its condition is always false
     942 |         if (swap_peak_fd == -1)
         |         ^~~~~~~~~~~~~~~~~~~~~~~
     943 |                 goto cleanup;
         |                 ~~~~~~~~~~~~
   test_memcontrol.c:934:6: warning: variable 'mem_peak_fd' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     934 |         if (cg_read_long(memcg, "memory.swap.current")) {
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   test_memcontrol.c:1081:12: note: uninitialized use occurs here
    1081 |         if (close(mem_peak_fd))
         |                   ^~~~~~~~~~~
   test_memcontrol.c:934:2: note: remove the 'if' if its condition is always false
     934 |         if (cg_read_long(memcg, "memory.swap.current")) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     935 |                 ret = KSFT_SKIP;
         |                 ~~~~~~~~~~~~~~~~
     936 |                 goto cleanup;
         |                 ~~~~~~~~~~~~~
     937 |         }
         |         ~
   test_memcontrol.c:931:6: warning: variable 'mem_peak_fd' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     931 |         if (cg_create(memcg))
         |             ^~~~~~~~~~~~~~~~
   test_memcontrol.c:1081:12: note: uninitialized use occurs here
    1081 |         if (close(mem_peak_fd))
         |                   ^~~~~~~~~~~
   test_memcontrol.c:931:2: note: remove the 'if' if its condition is always false
     931 |         if (cg_create(memcg))
         |         ^~~~~~~~~~~~~~~~~~~~~
     932 |                 goto cleanup;
         |                 ~~~~~~~~~~~~
   test_memcontrol.c:928:6: warning: variable 'mem_peak_fd' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     928 |         if (!memcg)
         |             ^~~~~~
   test_memcontrol.c:1081:12: note: uninitialized use occurs here
    1081 |         if (close(mem_peak_fd))
         |                   ^~~~~~~~~~~
   test_memcontrol.c:928:2: note: remove the 'if' if its condition is always false
     928 |         if (!memcg)
         |         ^~~~~~~~~~~
     929 |                 goto cleanup;
         |                 ~~~~~~~~~~~~
   test_memcontrol.c:945:2: note: variable 'mem_peak_fd' is declared here
     945 |         int mem_peak_fd = cg_open(memcg, "memory.peak", O_RDWR | O_APPEND | O_CLOEXEC);
         |         ^
   34 warnings generated.


vim +201 tools/testing/selftests/cgroup/test_memcontrol.c

84092dbcf90176 Roman Gushchin 2018-05-11  160  
84092dbcf90176 Roman Gushchin 2018-05-11  161  /*
84092dbcf90176 Roman Gushchin 2018-05-11  162   * This test create a memory cgroup, allocates
84092dbcf90176 Roman Gushchin 2018-05-11  163   * some anonymous memory and some pagecache
f2db5cca818233 David Finkel   2024-07-24  164   * and checks memory.current, memory.peak, and some memory.stat values.
84092dbcf90176 Roman Gushchin 2018-05-11  165   */
f2db5cca818233 David Finkel   2024-07-24  166  static int test_memcg_current_peak(const char *root)
84092dbcf90176 Roman Gushchin 2018-05-11  167  {
84092dbcf90176 Roman Gushchin 2018-05-11  168  	int ret = KSFT_FAIL;
f2db5cca818233 David Finkel   2024-07-24  169  	long current, peak, peak_reset;
84092dbcf90176 Roman Gushchin 2018-05-11  170  	char *memcg;
84092dbcf90176 Roman Gushchin 2018-05-11  171  
84092dbcf90176 Roman Gushchin 2018-05-11  172  	memcg = cg_name(root, "memcg_test");
84092dbcf90176 Roman Gushchin 2018-05-11  173  	if (!memcg)
84092dbcf90176 Roman Gushchin 2018-05-11  174  		goto cleanup;
84092dbcf90176 Roman Gushchin 2018-05-11  175  
84092dbcf90176 Roman Gushchin 2018-05-11  176  	if (cg_create(memcg))
84092dbcf90176 Roman Gushchin 2018-05-11  177  		goto cleanup;
84092dbcf90176 Roman Gushchin 2018-05-11  178  
84092dbcf90176 Roman Gushchin 2018-05-11  179  	current = cg_read_long(memcg, "memory.current");
84092dbcf90176 Roman Gushchin 2018-05-11  180  	if (current != 0)
84092dbcf90176 Roman Gushchin 2018-05-11  181  		goto cleanup;
84092dbcf90176 Roman Gushchin 2018-05-11  182  
f2db5cca818233 David Finkel   2024-07-24  183  	peak = cg_read_long(memcg, "memory.peak");
f2db5cca818233 David Finkel   2024-07-24  184  	if (peak != 0)
f2db5cca818233 David Finkel   2024-07-24  185  		goto cleanup;
f2db5cca818233 David Finkel   2024-07-24  186  
84092dbcf90176 Roman Gushchin 2018-05-11  187  	if (cg_run(memcg, alloc_anon_50M_check, NULL))
84092dbcf90176 Roman Gushchin 2018-05-11  188  		goto cleanup;
84092dbcf90176 Roman Gushchin 2018-05-11  189  
f2db5cca818233 David Finkel   2024-07-24  190  	peak = cg_read_long(memcg, "memory.peak");
f2db5cca818233 David Finkel   2024-07-24  191  	if (peak < MB(50))
f2db5cca818233 David Finkel   2024-07-24  192  		goto cleanup;
f2db5cca818233 David Finkel   2024-07-24  193  
f2db5cca818233 David Finkel   2024-07-24  194  	/*
f2db5cca818233 David Finkel   2024-07-24  195  	 * We'll open a few FDs for the same memory.peak file to exercise the free-path
f2db5cca818233 David Finkel   2024-07-24  196  	 * We need at least three to be closed in a different order than writes occurred to test
f2db5cca818233 David Finkel   2024-07-24  197  	 * the linked-list handling.
f2db5cca818233 David Finkel   2024-07-24  198  	 */
f2db5cca818233 David Finkel   2024-07-24  199  	int peak_fd = cg_open(memcg, "memory.peak", O_RDWR | O_APPEND | O_CLOEXEC);
f2db5cca818233 David Finkel   2024-07-24  200  
f2db5cca818233 David Finkel   2024-07-24 @201  	if (peak_fd == -1)
f2db5cca818233 David Finkel   2024-07-24  202  		goto cleanup;
f2db5cca818233 David Finkel   2024-07-24  203  
f2db5cca818233 David Finkel   2024-07-24  204  	bool fd2_closed = false, fd3_closed = false, fd4_closed = false;
f2db5cca818233 David Finkel   2024-07-24  205  	int peak_fd2 = cg_open(memcg, "memory.peak", O_RDWR | O_APPEND | O_CLOEXEC);
f2db5cca818233 David Finkel   2024-07-24  206  
f2db5cca818233 David Finkel   2024-07-24  207  	if (peak_fd2 == -1)
f2db5cca818233 David Finkel   2024-07-24  208  		goto cleanup;
f2db5cca818233 David Finkel   2024-07-24  209  
f2db5cca818233 David Finkel   2024-07-24  210  	int peak_fd3 = cg_open(memcg, "memory.peak", O_RDWR | O_APPEND | O_CLOEXEC);
f2db5cca818233 David Finkel   2024-07-24  211  
f2db5cca818233 David Finkel   2024-07-24  212  	if (peak_fd3 == -1)
f2db5cca818233 David Finkel   2024-07-24  213  		goto cleanup;
f2db5cca818233 David Finkel   2024-07-24  214  
f2db5cca818233 David Finkel   2024-07-24  215  	static const char reset_string[] = "reset\n";
f2db5cca818233 David Finkel   2024-07-24  216  
f2db5cca818233 David Finkel   2024-07-24  217  	peak_reset = write(peak_fd, reset_string, sizeof(reset_string));
f2db5cca818233 David Finkel   2024-07-24  218  	if (peak_reset != sizeof(reset_string))
f2db5cca818233 David Finkel   2024-07-24  219  		goto cleanup;
f2db5cca818233 David Finkel   2024-07-24  220  
f2db5cca818233 David Finkel   2024-07-24  221  	peak_reset = write(peak_fd2, reset_string, sizeof(reset_string));
f2db5cca818233 David Finkel   2024-07-24  222  	if (peak_reset != sizeof(reset_string))
f2db5cca818233 David Finkel   2024-07-24  223  		goto cleanup;
f2db5cca818233 David Finkel   2024-07-24  224  
f2db5cca818233 David Finkel   2024-07-24  225  	peak_reset = write(peak_fd3, reset_string, sizeof(reset_string));
f2db5cca818233 David Finkel   2024-07-24  226  	if (peak_reset != sizeof(reset_string))
f2db5cca818233 David Finkel   2024-07-24  227  		goto cleanup;
f2db5cca818233 David Finkel   2024-07-24  228  
f2db5cca818233 David Finkel   2024-07-24  229  	/* Make sure a completely independent read isn't affected by our  FD-local reset above*/
f2db5cca818233 David Finkel   2024-07-24  230  	peak = cg_read_long(memcg, "memory.peak");
f2db5cca818233 David Finkel   2024-07-24  231  	if (peak < MB(50))
f2db5cca818233 David Finkel   2024-07-24  232  		goto cleanup;
f2db5cca818233 David Finkel   2024-07-24  233  
f2db5cca818233 David Finkel   2024-07-24  234  	fd2_closed = true;
f2db5cca818233 David Finkel   2024-07-24  235  	if (close(peak_fd2))
f2db5cca818233 David Finkel   2024-07-24  236  		goto cleanup;
f2db5cca818233 David Finkel   2024-07-24  237  
f2db5cca818233 David Finkel   2024-07-24  238  	int peak_fd4 = cg_open(memcg, "memory.peak", O_RDWR | O_APPEND | O_CLOEXEC);
f2db5cca818233 David Finkel   2024-07-24  239  
f2db5cca818233 David Finkel   2024-07-24  240  	if (peak_fd4 == -1)
f2db5cca818233 David Finkel   2024-07-24  241  		goto cleanup;
f2db5cca818233 David Finkel   2024-07-24  242  
f2db5cca818233 David Finkel   2024-07-24  243  	peak_reset = write(peak_fd4, reset_string, sizeof(reset_string));
f2db5cca818233 David Finkel   2024-07-24  244  	if (peak_reset != sizeof(reset_string))
f2db5cca818233 David Finkel   2024-07-24  245  		goto cleanup;
f2db5cca818233 David Finkel   2024-07-24  246  
f2db5cca818233 David Finkel   2024-07-24  247  	peak = cg_read_long_fd(peak_fd);
f2db5cca818233 David Finkel   2024-07-24  248  	if (peak > MB(30) || peak < 0)
f2db5cca818233 David Finkel   2024-07-24  249  		goto cleanup;
f2db5cca818233 David Finkel   2024-07-24  250  
84092dbcf90176 Roman Gushchin 2018-05-11  251  	if (cg_run(memcg, alloc_pagecache_50M_check, NULL))
84092dbcf90176 Roman Gushchin 2018-05-11  252  		goto cleanup;
84092dbcf90176 Roman Gushchin 2018-05-11  253  
f2db5cca818233 David Finkel   2024-07-24  254  	peak = cg_read_long(memcg, "memory.peak");
f2db5cca818233 David Finkel   2024-07-24  255  	if (peak < MB(50))
f2db5cca818233 David Finkel   2024-07-24  256  		goto cleanup;
f2db5cca818233 David Finkel   2024-07-24  257  
f2db5cca818233 David Finkel   2024-07-24  258  	/* Make sure everything is back to normal */
f2db5cca818233 David Finkel   2024-07-24  259  	peak = cg_read_long_fd(peak_fd);
f2db5cca818233 David Finkel   2024-07-24  260  	if (peak < MB(50))
f2db5cca818233 David Finkel   2024-07-24  261  		goto cleanup;
f2db5cca818233 David Finkel   2024-07-24  262  
f2db5cca818233 David Finkel   2024-07-24  263  	peak = cg_read_long_fd(peak_fd4);
f2db5cca818233 David Finkel   2024-07-24  264  	if (peak < MB(50))
f2db5cca818233 David Finkel   2024-07-24  265  		goto cleanup;
f2db5cca818233 David Finkel   2024-07-24  266  
f2db5cca818233 David Finkel   2024-07-24  267  	fd3_closed = true;
f2db5cca818233 David Finkel   2024-07-24  268  	if (close(peak_fd3))
f2db5cca818233 David Finkel   2024-07-24  269  		goto cleanup;
f2db5cca818233 David Finkel   2024-07-24  270  
f2db5cca818233 David Finkel   2024-07-24  271  	fd4_closed = true;
f2db5cca818233 David Finkel   2024-07-24  272  	if (close(peak_fd4))
f2db5cca818233 David Finkel   2024-07-24  273  		goto cleanup;
f2db5cca818233 David Finkel   2024-07-24  274  
84092dbcf90176 Roman Gushchin 2018-05-11  275  	ret = KSFT_PASS;
84092dbcf90176 Roman Gushchin 2018-05-11  276  
84092dbcf90176 Roman Gushchin 2018-05-11  277  cleanup:
f2db5cca818233 David Finkel   2024-07-24  278  	close(peak_fd);
f2db5cca818233 David Finkel   2024-07-24  279  	if (!fd2_closed)
f2db5cca818233 David Finkel   2024-07-24  280  		close(peak_fd2);
f2db5cca818233 David Finkel   2024-07-24  281  	if (!fd3_closed)
f2db5cca818233 David Finkel   2024-07-24  282  		close(peak_fd3);
f2db5cca818233 David Finkel   2024-07-24  283  	if (!fd4_closed)
f2db5cca818233 David Finkel   2024-07-24  284  		close(peak_fd4);
84092dbcf90176 Roman Gushchin 2018-05-11  285  	cg_destroy(memcg);
84092dbcf90176 Roman Gushchin 2018-05-11  286  	free(memcg);
84092dbcf90176 Roman Gushchin 2018-05-11  287  
84092dbcf90176 Roman Gushchin 2018-05-11  288  	return ret;
84092dbcf90176 Roman Gushchin 2018-05-11  289  }
84092dbcf90176 Roman Gushchin 2018-05-11  290  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

