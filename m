Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E91522F5A36
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Apr 2026 05:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775713056; cv=fail; b=D7EFG1iYLUATP7riKBthDc5sbeUunndWdAzzofsEhEqGN14Ii33m6YG9nDuhM66VFX/SKJSKHPJTgjwq44RX7xvaxu/tshA93z0Xn5NZN+N8uwuy7dxdAy7bL9u99unKn2zdW0WPCBVAR6GhYvSlsAMsom35OBi8stAYvrkzQP8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775713056; c=relaxed/simple;
	bh=iexDWjo6BYyjdhKSQXeEP7SRpy1aPYVv7FkARZedxsI=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=u9BtmN6ybUXEyjPRFXPlIN9Sbtky+zG+OzdrFyZ4Vo11VRff9xLbXncKhYlzZaNQ0vS2tt2yPo3RsSECoYN3K0LeFwrLvxG9x/0SG87dvlwDqXa/puv1iF69e88pbl2MRfkNlCp0xyJGiQe68Ji147gb8n5WbOTy4snsEYttutU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a9gsx7/x; arc=fail smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a9gsx7/x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775713055; x=1807249055;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iexDWjo6BYyjdhKSQXeEP7SRpy1aPYVv7FkARZedxsI=;
  b=a9gsx7/xfwp8aDdKb+YKZP9lVrywd829jUrleEzJCTmCJN/YfLyyZaFX
   itREJHPFy8CfOc4Cb86litGXpK3krNTKAVZOUajbxVQyTNE469Uz+sloG
   8YRfsveuk3mfV7nubm45MDl97tGJogfYQWbk7xDVUeXvN6G/t+PRso/1q
   r0+l5p770C3EPYMzcMX0lNmSoXltatkhdDhb3IseG03S/FoQfHWQC8l70
   29TISSWMKWwbV9zZ+vintpRDEhaMgg7Ix0Scf5tJ4nB18/E8zZJTbn/iX
   TXmyFm9/7DZNAJ/SUirw6GpuZxLy3ObwowUGmYv0HD2iCUYFpndr1FoVY
   g==;
X-CSE-ConnectionGUID: 4kQeLngZTd+Lpk0GHJsu4Q==
X-CSE-MsgGUID: HvzRZFNER0Kz62kHPG/WHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="76727382"
X-IronPort-AV: E=Sophos;i="6.23,169,1770624000"; 
   d="scan'208";a="76727382"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2026 22:37:34 -0700
X-CSE-ConnectionGUID: tAbKJFfgRqauchKrFiDdpQ==
X-CSE-MsgGUID: r260VlAuQrOXIwYCJewCkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,169,1770624000"; 
   d="scan'208";a="225498400"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2026 22:37:34 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 8 Apr 2026 22:37:33 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 8 Apr 2026 22:37:33 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.32) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 8 Apr 2026 22:37:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m/eaX1aWqMoSaBdP38PhL4Z+A2tFogMLaG/w/sXeVNRluaMUcnpj/VAu9DEN5/TR2+LcAZbYP3atz9oFil2Uf6ogrYmbPa/EiGsm8S5Jfnu1DsaUVSuS3P2pDnBZCIfnXWuO3Q+HjnqXrQRzO963IZ5qn2qJ4PAhQyNnD0rgWj01KO2UJUif8CTYZay1eWIrjbf5s1Z3h/CGAhfMw5jHyxV1gvDY/RsNUkqgpcip5Ri5MFyAx6Osb5NsQA2AGPwgww+sNTagGX+euVnoo5EmMNMHP+QnNHO4RNf67KDW0NIMWS6ETvHbMrhNJJAqqR9gPjFEZJf/wldPB/55nQiVww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eKtnLZfX9meNkmIvVkXwHgJ3HqXL54pUys64A0XGZuA=;
 b=bxM6/+Uk0UF6TQz0mLD2lOmEEdrW2D/nFPORlw6blDNO2ogK6AAm91G7G5RcTJAy3JlCt+2VTsED5krcY+q1YSwX2+Yl7B/hrj0gtp/bJ136rd2By/YrxUMT+qxf1FLPhCeu+eJcadmsg57K57XXlHTJP27nDsDlnu5CTaccnfWmorYYxmyyWQApMobXyc+kjpPaKUE2UnrDwarPI/kQ+NK/41ilrwssUFIGz+Qr9BzzmK989OaH1rcqjRDgi0zX+GJ6v+KrrFiOEUuYTnKMZw9v5x3Fbtgy0y1IcqmosZVoBGFyRKc48tkVKVJUAFM8qwo46u/cNqyqZnGq/YXHdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2808.namprd11.prod.outlook.com (2603:10b6:a02:c8::26)
 by SA1PR11MB5827.namprd11.prod.outlook.com (2603:10b6:806:236::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Thu, 9 Apr
 2026 05:37:25 +0000
Received: from BYAPR11MB2808.namprd11.prod.outlook.com
 ([fe80::defa:788:da96:2f9a]) by BYAPR11MB2808.namprd11.prod.outlook.com
 ([fe80::defa:788:da96:2f9a%4]) with mapi id 15.20.9769.020; Thu, 9 Apr 2026
 05:37:25 +0000
Date: Thu, 9 Apr 2026 13:37:16 +0800
From: kernel test robot <lkp@intel.com>
To: David Woodhouse <dwmw@amazon.co.uk>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [dwmw2:arm-disable-exits 5/7] arm64/vgic_group_v2.c:28:17: warning:
 'shared_rev' defined but not used
Message-ID: <adc7DLX8LUjrdHse@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0156.apcprd04.prod.outlook.com (2603:1096:4::18)
 To BYAPR11MB2808.namprd11.prod.outlook.com (2603:10b6:a02:c8::26)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2808:EE_|SA1PR11MB5827:EE_
X-MS-Office365-Filtering-Correlation-Id: d07c0bc7-3465-4c8d-ba2e-08de95fa1476
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: /Ra0hDmv/xl7lITSR89UYem/iRVyfvrlWfMrI67W8Ag0UGqHgf1/SRiHApOlxtmwfGEUE3dE0Meg+RnfCcafS4OvTIqsRZqQLmXUVkKo7L09XGg76FaYh5e+v5gG/SJMOZNz1wo8LpcNTp96aKwUsBYdTuyQDD1i1CNj/5K1AgTw4r4LCsmQQYJ7WKbOna6d3mzUJI0pT85njCVJWB5QKfR3RuvunfsI2qs/AgLPgM0NJmAO7oHCOks3+XNTxngHmdtcFIRTSz21OpzKO+RQeTeOSo6+A/LKjb7PBw8wvYLf4lcZ3C/OWXGK1I82mBKF6v/3hiYSkvwx85NOAM25LnTZt7CnNitzI0a89deewlilhzQ4LYVAflpjW46KDPHqqA+2vV71kdHpgFM2zBw7ZvEmSNFHemU5bZWxmAW88nwD3BwnLsOtUuQLdvGkTvW9bW3QQhom1T3PvJgmMvfI7VTjUemLprKS+7SlMsPaKjpqqnQvDRJMw7+cTuTWa4kQuDCYhAiss5srzn08hx5ozDY2T9jI6RjLN2LNcutMP29lEryPeOzss6pZRSGo46sqB8tlFRio/nczg0IfQEhQ+0NqNmtRQNZPYhUXWKmX/ZgahA5rIgM36tNkbqF6ldfLonB31QXzHb6hvB+u78F0o/4ONiGHG9gILShBYUXlHt1YxW9adKKkhC6gDoEvKia1pOPC0iLF18S8SopjO+eBVw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB2808.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nX3ToJhIJwYQLkSuu00buJQ1DZEvrMA9DGXqdAPJRAR+WWBC+2OjzuL4zgt5?=
 =?us-ascii?Q?FKdB+5+ugGSwAoEGoO6vD0h1Iqcipc7QGZITCvo4QWoiI27gldZ73RKTe6Ze?=
 =?us-ascii?Q?d5wEvGa/t3u/LjERSJsWYdxFj2H7YPKdbEEZ7xwpArUGadche4QQs1efpeNz?=
 =?us-ascii?Q?rw5HAyc9QLYqCeZztaaDpzk9JkHOBCmPrvp1SF5hxBnmjGSDD0holKJcPUwf?=
 =?us-ascii?Q?2BtbJXgcWcgUmYLe99xW8ajMX/FqS8ZHyzuFMUKhJAPFBnQ0abSYACyYXOHa?=
 =?us-ascii?Q?rVeNOlSZtEMLNLDl+zyUGsoarBygINM6BvSW6QiZ5pj+1iFyGY4pgTvHa/wP?=
 =?us-ascii?Q?iFdiljsZKA+6t4z9PIl6VW40gblZincB3VOY+IHioFhkzBFy3I12UPMj+DiP?=
 =?us-ascii?Q?B2vvXIiIVR7J1RWU3q2LYprL8gzKvFvgSrRae9MjmmBbmH4EvIsGiEjr+Osu?=
 =?us-ascii?Q?kawW6cUNxfNaNt0uOBqmXTKDGxBhZSMkp44pLjFsw57Ie8FhSReE+fxKuRZR?=
 =?us-ascii?Q?4C9jgcxdEOIMSU+ORKkkyMq1Nq62ctCxKWR3lez/Eat1J9QG+M354HC6Xltx?=
 =?us-ascii?Q?vKF4LTxY9SU7bVXLJ4YuI57Ha6DaXuqFZVQkUcCmYHzv35fNghdiVODtKCPC?=
 =?us-ascii?Q?xdohWQh8ONUb273afkkVlhQnir4WG/VqP53w0d61qqEZnHqZUQSRmY75QBi5?=
 =?us-ascii?Q?tn29VMPFh3QVTr01KJFlkhon4gXt62E6kgElm6iRHEChjy0sgxNOel7kMHH5?=
 =?us-ascii?Q?9Izyz95bydcBOjg698MMy5iGWqi1hr0otorMJ5u/CuxzQ+mjysR062hEXtA5?=
 =?us-ascii?Q?J1mw3+wECFtdCdU1AOX+3UpUekFFiVD8hCEtkJOIG+qCWos8UKWTk/3B5F/t?=
 =?us-ascii?Q?Z1ipuEvsk810mkV3Ky0hVG16MdG+h3PgQbA471ybAntP/g9tGEtFA03QJ0qu?=
 =?us-ascii?Q?AggUu+auYMTfV9l+VtUB9XX2wArhRrmoIJRpzZjyIJ7DQFvCIsQLtirxm0Np?=
 =?us-ascii?Q?YLH14VQ/6rT2LtnvAsxo/Bl2I/82NNP+UBdo3UU/P0MJ3UvHtq/nXVU5wu7R?=
 =?us-ascii?Q?Kj0Zua5ZrBiY5kfQQcR1DS9aV7o8kAf1efVb3Y/Ulawrlg4wnQH1jFwENlgW?=
 =?us-ascii?Q?QenJyumpeCOxt0ZkSVAUbkPYe3zuQe+izMilmXSTqzGASRpXE1YKI1tcQQZp?=
 =?us-ascii?Q?XoRd1HdiuUYKtoZ/Qv7qr7YU0bqgC3r/8MkPiu0vZzA0/A1QR+3HVlfwoPRK?=
 =?us-ascii?Q?3INuoIKoatQ/YSj7aGWIjQl6vKK6MyF2EgdbqQQ4NnHaElYfvv6PznfqS4SM?=
 =?us-ascii?Q?QN+UuDSnFFKNEg2saKFWaLm2vsuUGRnPsNQzurIUhz91B8V/JNsW0r10Us6V?=
 =?us-ascii?Q?RJOK+g3mixyucDsbX+LMSRQYpKX63hHybMUokPYibJN0rolHQmVp2ZVheL0w?=
 =?us-ascii?Q?mVV5lnbLFozxBZw4oW6qBIgicj1xCpmgiNEnU6al+qMw/zR3IjY6NnlshfUu?=
 =?us-ascii?Q?pRWSbjgmnwwBqCiBDaH1cCSRSKbrZhSap2lZDbDEaLVouDgfGmPkTE04paJ9?=
 =?us-ascii?Q?Kj0293gY701IoSkZrgy1glyC3BMeaOPXOH5eM6ktbBEpSquEc4p2LdvT/4LE?=
 =?us-ascii?Q?dwcX/mEPyugy7/egM8Onfy/p5WVN1/mKf0MVarft9TY79XeAZ+DARDUEUryk?=
 =?us-ascii?Q?/3B1JEitjuA7z1TxwDAy9uy8ZZC6QHitTaaT8OeOOcJjud6TTYruIm/vT3jT?=
 =?us-ascii?Q?JUeOytArGQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: f4N0q5EeIvwiOwX1D7G3HgmeRh4aki/e2dXd7wXFNfuW1gdyU0ysU/AKMFJIhk6FA57EhFimkw4iWdthe9Ska6CoPFO1YBEJh0PUztu+xITvRvRQ5HajrQY5sdThja617XhVqU8pfZgpJFPlBahX3BsEKCCAcw5tsgouxFw/MCEdKydd53NLfnp+H09tyEyMn6ZDmkh0WIaOYAZTIKNJ66Jv7sW0ha83F8yQr5VfMIds2+s43YXLDP4Zc4pvIUFug/swIeKpGdjGhOfNwjq6F8rGhGhfLymxFuWL9rwGp8LpwEa4NN0R74xGie6FWeAbdI5aL48IEwrzvx85UIqNeA==
X-MS-Exchange-CrossTenant-Network-Message-Id: d07c0bc7-3465-4c8d-ba2e-08de95fa1476
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2808.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 05:37:25.3016
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u/zYWEpCoeVz4+S5zjx563SwpgnTTqZwypQjGD3TWJ287g8kaBzzGCRx+1WG1Uc0W0whwG4j8s8NlsMSWe5GFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5827
X-OriginatorOrg: intel.com

tree:   git://git.infradead.org/users/dwmw2/linux arm-disable-exits
head:   9a4463f0b113629ce8431de476af332b2ff3ea98
commit: aef9e327c1a62db78d5b4018724bac2bc9fc975c [5/7] KVM: arm64: selftests: Add GICv2 IGROUPR writability test
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260409/202604090604.MJojGxpN-lkp@intel.com/config)
compiler: aarch64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260409/202604090604.MJojGxpN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604090604.MJojGxpN-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arm64/vgic_group_v2.c:28:17: warning: 'shared_rev' defined but not used [-Wunused-variable]
      28 | static uint64_t shared_rev;
         |                 ^~~~~~~~~~
   cc1: note: unrecognized command-line option '-Wno-gnu-variable-sized-type-not-at-end' may have been intended to silence earlier diagnostics

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

