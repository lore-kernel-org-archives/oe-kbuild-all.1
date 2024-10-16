Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9E6C17D378
	for <oe-kbuild-all@lists.linux.dev>; Wed, 16 Oct 2024 09:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729069881; cv=fail; b=raAIH1SmOGYwTH+7QLIxdRID6QXcf5jaZfno4iKFue10gj+VpnB1DPFJwaEOhQFM3spluEwrEWJFWsDJM89vXvfPY38w3rXPWL2zMOvt3wrc/bsQlTlkfWyuwgGHJOpimBFOnjdZ3FVmPkVBe7HCfvDQ8FY441hMRb4LwORV2dY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729069881; c=relaxed/simple;
	bh=0Rq/PJVdwZ50QfdDN6e2fN0qzdTRE1wc5BB216WK3lA=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=moOwqLuAo7x+Ors2OWlMGNl7eE0lFN4CT3q6XQPbiAos9DyRjNJL7BPsj7BbaWJX7+kW3kw4AJpX6OnflU1ZFvZrXWAKN4+MnVqNggl/dryETJQbHpNmJOdkKH4zQy4XO7fZQbEYYwLjszt9Du4FySV4vLj0+99lnQFxqtWrZVg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CalWA7va; arc=fail smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CalWA7va"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729069880; x=1760605880;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0Rq/PJVdwZ50QfdDN6e2fN0qzdTRE1wc5BB216WK3lA=;
  b=CalWA7vaEMuvW7LeYgerenjur88dvZgNGI/ql55KgD7vJHHdsrAa7eoT
   Vp/jMsBBd49qYcG/SUDyH5FLXr9OOFCtIZ5z1vObUG2G3BHvLu3so8ebL
   jmN+MTHjq7bdJ7mnItNpOv+JV9CGJKJ9H5k2KI1p1LeeQOB6JFlRm84yP
   /7gNJ12FbwfKScV/0kexoOOneYz9rXPaOHnKrN47DVMDP5je7JpzdrS7P
   hwBF99GnkJ8wnAxL5u/r+cvSyAL3/8FIKwjES1r6afO0d5Pl7uGy+xe0t
   dyv6SeWVkv12LcUOdfOOfnzXShG7W879tHszUFtJj3cNaAnSYo+NnwRXK
   Q==;
X-CSE-ConnectionGUID: DxB1gEt4QbyGQqVlgSFYOg==
X-CSE-MsgGUID: YZaDuSIoTAOdkRW8tnuU/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="32425925"
X-IronPort-AV: E=Sophos;i="6.11,207,1725346800"; 
   d="scan'208";a="32425925"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2024 02:11:19 -0700
X-CSE-ConnectionGUID: AF05GHdUR72KE5gp/NviIA==
X-CSE-MsgGUID: JAaIdA2iTA2OWCdWJyGdGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,207,1725346800"; 
   d="scan'208";a="78190590"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 16 Oct 2024 02:11:19 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 16 Oct 2024 02:11:18 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 16 Oct 2024 02:11:18 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 16 Oct 2024 02:11:18 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 16 Oct 2024 02:11:18 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 16 Oct 2024 02:11:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uk6Obpw3PDtmY20OSVCaEvEcirgFSqsVsgchCdbRTmCtfFDl1OX3EGFVn1DVJTCAKBhMtW+sHJ37PUlfEvAbKs1oefB3JBhVD2XaRRE2NnKdSSgGG+fZA7fQ7LGw7xDW00iDXTzt7kLDcatO/qhVZwt1Z0xdoiwA+h1xhCFZefASq2VNQXf//y8jgs7y/j/lsG4guNmVaANo7kKpVWHP0U3KhJ3LazJdn5uGTXDCFfHitU+/pMe0d+w8ByRDtqi4C6vcrpKLbpVLPyPhJV/DsZIDcA8rmDdWTcedTSqxflk//DYXv+Mmvm/myO0ZhEsq42cBtN9FyNyFO9tfMiAwQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1RcO2KygzQAishknVyl7CB2Nffd2hhFyRhQP8EEVWOU=;
 b=A9fDvMyOK0GYwQ18jIdIubJj+z/tI3wKOd9jTEOlUxlbB/KSENQa6j9e9K62sWI17nvz1EG/GSH0ahRq9Vs/l69LdP/JUEtPNXRCsBGnynWAhKbRTNY1UgrgD9q4ayI+YdphOgZoS4obemaDt3xjWnNoh76bv8BiJe2ngEe3rD874wZJpYJ+3c2UrLX8kPP0hFuvCodINFsSAjqxylayrbHuC9ShvsgyRhp7nRSKo/Bq4mm23VnnH8sDVKVmdAck9j31rmepE93BxYNC663m2oQu3efpd6oITAGqDNx47i08Ue/h2xXNUz5RuI0gL8BnoKseQUv2qbPw8K0kfBUOtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
 by MW6PR11MB8312.namprd11.prod.outlook.com (2603:10b6:303:242::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.23; Wed, 16 Oct
 2024 09:11:15 +0000
Received: from DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e]) by DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e%3]) with mapi id 15.20.8069.016; Wed, 16 Oct 2024
 09:11:15 +0000
Date: Wed, 16 Oct 2024 17:11:06 +0800
From: kernel test robot <lkp@intel.com>
To: Yunsheng Lin <linyunsheng@huawei.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [linyunsheng:net-pp-inflight-fix_v3 3/3]
 arch/riscv/include/asm/atomic.h:138:1: sparse: sparse: constant integer
 operation overflow
Message-ID: <Zw+DKkUfFXzR+Dlj@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0161.apcprd04.prod.outlook.com (2603:1096:4::23)
 To DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5423:EE_|MW6PR11MB8312:EE_
X-MS-Office365-Filtering-Correlation-Id: 88fb402e-9a31-4e0c-b8c7-08dcedc27c5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?l/o1lfLHRxZ+maZ49lJVzTyoL/3kqbr5Mt2kA3Vk1/2KvKciW0Aq0CQrfale?=
 =?us-ascii?Q?6WsTQ96n+931VJkeKsLZxRen/x+MvYNkDqyGiai9LH782/J8zTdQ3AayeBT8?=
 =?us-ascii?Q?Y9v52VbmRU3JhvEe0YjB99GCDCIT+8LQyCaGBZY8Bd3tf5t7yyXE3TEGlpoI?=
 =?us-ascii?Q?QHrC1n3fY7MwlJFi5Cn5iCNS82frAP6OSwBxx1efQrPPV3gx8fFBp7TVcOOA?=
 =?us-ascii?Q?2d9tt+Vro9iH4bJRI3uqU/fwqdCNeK20JBXmt3WBekDLgeN5BH4AxJ4fIB7V?=
 =?us-ascii?Q?qSfQArJf4Jx5Wx5e2tnQIiWLifk0SidlwP/OHulVoKQeK1/YruaCceBINCU+?=
 =?us-ascii?Q?266AXC34w7oOMeRyw9026mp+nPQ9qmqmNdFwCxSqmLU1vqsCCE2w/9Kn0zMh?=
 =?us-ascii?Q?clezll3++ETUFQd8dvft61hHD0+C/pgl8Cz6fhUOxU7wyk7iYhk+8a9tsYKI?=
 =?us-ascii?Q?tfLBVcb8OlgPL5Vv7+A152KjpcCTxpk5eF8MZmaSh5v49ikBzBd/3Co7Td0J?=
 =?us-ascii?Q?f2A/IEmEfO0VeDntdRY+ojk19i1boTgRNn/sTDmKxF17O7kx/S/9GP2rnD4s?=
 =?us-ascii?Q?BGJ/ruvuc8FzlNg87BKqMew0NjtPuhFRdE72NyRbtrP8XfGTVR+3qoBPfyDJ?=
 =?us-ascii?Q?VddXSZU5D3+ERUFU2kua+i2nygIZIS7yqGwkNQDtZVJdBayCv+orIKwbpv6O?=
 =?us-ascii?Q?n3Q9z9tX518+davrTyqGnxL+ocg/Cl+Nmg3oi/T3P5uZKurAe/pxUYdqSGoU?=
 =?us-ascii?Q?UUKnoFq7QOJkKyvJWGc979RS/soK629xWOIozIOTLLyyYofp0RQGBr7Ba3gV?=
 =?us-ascii?Q?5MMJtt8jxwITK3CY2ZBmcK+mbDebS9rR5jFe7wjhzQfmMR61ALYJajKtji48?=
 =?us-ascii?Q?wjM83QeZjYlFSHma/L/d5CpWVaMCUsEygmPR9RkbQc6HNnd5oq1Q3suSkBxl?=
 =?us-ascii?Q?JW1JEoPUqZk1G9oA2K5wVDfKNRtT625Aru2PwEoahCHi68zZEmicGVeL7JZj?=
 =?us-ascii?Q?MXzRVUuOgzCbwXPHI+dWg/fjKn0fqbKI5V9ScK98pA9DORzvbPOyexpgOfv9?=
 =?us-ascii?Q?/l/+xqS2aUx4gzxu41CLf40maaOHS4XukdFiXloDij6HO+jDdZsUuzqUAaLe?=
 =?us-ascii?Q?Ta6yPgVsqeMmG30mPvwep5uZuU0PQ35U+q5VslCHmng3ToP02bidhBi984WT?=
 =?us-ascii?Q?JzU6EcmuNs1kALV6MelA5WDJOM/YTMlvaYy3mYzzPn1WC22sZSy+VsOOHs4?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5423.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Px2j6NaqjNChcr4oc0vYRx8x5Smmv19gX37jYhlFE22fgxUt1FzBgCOlnJSU?=
 =?us-ascii?Q?ZhpkA22lFnJ/2Yjhfkwp4vMKLxICdXmd3vnnUDlsHrXwPqD36RpbTg8WvVT8?=
 =?us-ascii?Q?qK4Mk80pKxDuBBr1VDWMhUAnRflkNmgT0cMMxG5QHVlX8vPoLAri9bR4KnN1?=
 =?us-ascii?Q?dwKZIvT1L0Z+/1gmPH06NiCf7HbQeGxly0ItDcAUQHhCKoFOgYL01tkMg84g?=
 =?us-ascii?Q?TDICafnc1l24PoYwk2/d3nvITLlx80kl6cUTrut/B4kcszWTr5HWi9UcdxsK?=
 =?us-ascii?Q?AzpzagERXVFY6vTk0vpXrjugS8KEFveFjiqDp5ZJg/498hEk/c1c5HQImzxH?=
 =?us-ascii?Q?+rTEA1QPgc50QagVVIibg8nK66u0ZoIeREtD6vwDpKcdj0W0XI5w0/iY6pCb?=
 =?us-ascii?Q?NnCK1CkHHPgw4Xb0exUV9zAd+lSoaOFDkTK0Amb1wyDG/WpjmZMUmPVYESFz?=
 =?us-ascii?Q?hzMyTRM3lYGnONMAc6vrYZk96+7pX1DJnRG0y9PRiD0hKgSAYXi2WUU4+kj4?=
 =?us-ascii?Q?DkZ99Xs4iH6HTWywO42fkjM2GG0fEJ9gw2/A7ER3hiaiUJXMq8ZcLBz9Ywnd?=
 =?us-ascii?Q?WgYjU6pnQt6tVyFQkQOb7Q5R4gMvyornqmzGar8YObSNdfEKiRgNX27PWwzC?=
 =?us-ascii?Q?xjcD+p6Evq2dJrCVY/svgIFQDEgaQDrRmjAyVW1azSw5FSLbF2nzUypEjKy7?=
 =?us-ascii?Q?fyURwiGle2fwB4LWeIjcXH/m6aWBaHXhgONa22hUTPLtNtK+uv3sHME5+gyN?=
 =?us-ascii?Q?4737ZXXtYtDLp6CNnz4mgefNknYNGDPBGuSzQqziMo0n3ouqXFu5pVPblnAY?=
 =?us-ascii?Q?+ZD5xKGcoC6b8atzjnT8sp+vOat9xFTQ710KqET62PuZGjHWkKBK4NdnKteG?=
 =?us-ascii?Q?jSsTW4lw+w21WiNGIODL8XYnlKjtbF/TAm1SFUrCsuO6zhm+5duJNGU3RX2T?=
 =?us-ascii?Q?/drV4X+cpPYV+LH/zgfRx6WWRn/G5qg0zc+rhGw02tpwlH5NUrQbU687rodU?=
 =?us-ascii?Q?QcPioTqeZNhDuTfLE3yqpI1LAo0+QQXf8oqmF+yQZaJUhNRrDoLOfRCcCUSr?=
 =?us-ascii?Q?EZCSvMIbbTh0+LJtPGHZSi4v7k/eOrIoV1jPt/U4lncU5Vie0JaEhkgoM7S/?=
 =?us-ascii?Q?9BPdyQS8YdNVSXo8LYdHaoybj1jV2Gq9PwjWbxgT5PkX9u1HN3WQ4N+qgdLT?=
 =?us-ascii?Q?l9yag7GuEM/x/L712P0j81pC4B46z1IAwWiDB6hPy3/uI9glhFKKiX5T69Ks?=
 =?us-ascii?Q?lmNQZFIGeyKho3plHcrQ3aGi+2M6D/7cmD/cFpBYtk3J4wTzvgbMddf/cQ3B?=
 =?us-ascii?Q?3dYyTy43VcOdztthRXP/MzwHSVWyWIuDi6jE5lspoZvTlA/e2UgSZBBIrxy7?=
 =?us-ascii?Q?HabA3YLrwWxEoI191Li+8VWiVNzFxR372yETTYKu00QHFRlvd3953keQKayR?=
 =?us-ascii?Q?onHbNXcikywejDSoAB2EoW3AYXp6ca4BbUe8TI4ueQwvgwg5L+r8KR9guXJ1?=
 =?us-ascii?Q?ekrrfeVIFhp9Mi52v+VgxcTdiamIAwOV0iDRjjMWm92hMWHluUD3dujDRO9a?=
 =?us-ascii?Q?S8uUrf0+P+HypNYNh79vm6AC/y+lpef5c+WsknvJ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 88fb402e-9a31-4e0c-b8c7-08dcedc27c5e
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5423.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2024 09:11:14.9177
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gX3KdBEQNVMi6xriO4tuSUx9A2ZbGLC1Qs37AIQMe9zSiBvKdTVlS6zbpZ7GxOKX1TjSxSzj3b95W60ljq4fyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8312
X-OriginatorOrg: intel.com

tree:   https://github.com/gestionlin/linux.git net-pp-inflight-fix_v3
head:   bd72d37cdf0449e8175e573706b55a1b5186287a
commit: bd72d37cdf0449e8175e573706b55a1b5186287a [3/3] page_pool: fix IOMMU crash when driver has already unbound
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: riscv-randconfig-r131-20241009 (https://download.01.org/0day-ci/archive/20241009/202410091907.z1sjq363-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20241009/202410091907.z1sjq363-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202410091907.z1sjq363-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   net/core/page_pool.c: note: in included file (through include/linux/atomic.h, include/linux/cpumask.h, arch/riscv/include/asm/processor.h, ...):
>> arch/riscv/include/asm/atomic.h:138:1: sparse: sparse: constant integer operation overflow
>> arch/riscv/include/asm/atomic.h:138:1: sparse: sparse: constant integer operation overflow

vim +138 arch/riscv/include/asm/atomic.h

fab957c11efe2f Palmer Dabbelt 2017-07-10  136  
5ce6c1f3535fa8 Andrea Parri   2018-03-09  137  ATOMIC_OPS(add, add, +,  i)
5ce6c1f3535fa8 Andrea Parri   2018-03-09 @138  ATOMIC_OPS(sub, add, +, -i)
fab957c11efe2f Palmer Dabbelt 2017-07-10  139  

:::::: The code at line 138 was first introduced by commit
:::::: 5ce6c1f3535fa8d2134468547377b7b737042834 riscv/atomic: Strengthen implementations with fences

:::::: TO: Andrea Parri <parri.andrea@gmail.com>
:::::: CC: Palmer Dabbelt <palmer@sifive.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

