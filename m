Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAA39420469
	for <oe-kbuild-all@lists.linux.dev>; Sat,  3 Oct 2026 14:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791038688; cv=fail; b=I0HOhvmoUxkOJ1wb9L5wNLh5Umr5UTaU0A5ea/E+eXSPTaK33tdJHjZFoB86jdCTCi+hZzPrvtCH708+2r/5JsvtBjbLTMjXYpr0wwyaQbv8Me9u6vwBIq1ZK/OCnfI/h+0RLHg2Rjw0VISewzZTpFQ/js2RGZr1CHRDe2M6lpo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791038688; c=relaxed/simple;
	bh=2AcvnZ3puE0u7DorwUh4lgYIkS3ySWpUDD8+/FEbCB0=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=OZ7C7KjQdNTSD/wRkm26mco6SA1UqUFkCElKcVD731lwMjGEkQFZkb1DRvMlLjB8B/AWiUI6Nubv/NZVC4/l1truBXard3btRVfiyLvyMHVYYd8I2CeaxpyO+n14CG6pjZPAFzPBOG/jHCubF02F+dvaXaZx35meHdLDQQXuOMk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=na95o35p; arc=fail smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="na95o35p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791038686; x=1822574686;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2AcvnZ3puE0u7DorwUh4lgYIkS3ySWpUDD8+/FEbCB0=;
  b=na95o35p9Lty7iqtqBdjoetUzfimjvdjzkU2m50w4DTQBIDGv5YOPdRX
   bnnI5e9XU5euwt28MO3Bld7/O1xK377Ug4iL8L1NcJCIpNd1h8Rufj+/l
   Pq4nY3jBB7GQ8PVfE8ODVZ7PXb5rZpLtYa8TPCJ4d8o1IV13Q2IPVv3qI
   I3AL9NVzCnX4nAGAf0cX/uGNx9QudZLWSXfA5k+YSpufEnwKcbKjYJu1l
   uuf9fMT2lp3zDJ6i8ARl+9s+OfGTQ8Kfp21tYzaL1sbG88KhWne2DpnIi
   SZug9tY2Y3Pzqts2WUHrdZ21xO7UrjY+kA2OUC1gTjQHRX0LIHM3hMIw7
   Q==;
X-CSE-ConnectionGUID: InrK5IerRkyVhnjBYG4vTA==
X-CSE-MsgGUID: 1Q7Xw/lwQzCOq/u3FTm64A==
X-IronPort-AV: E=McAfee;i="6800,10657,11924"; a="91641587"
X-IronPort-AV: E=Sophos;i="6.27,138,1787036400"; 
   d="scan'208";a="91641587"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2026 07:44:46 -0700
X-CSE-ConnectionGUID: arzDZLxRQEOnUNc4O8T3UA==
X-CSE-MsgGUID: pjtLYZAFSia7s5yaVKTm7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,138,1787036400"; 
   d="scan'208";a="276006886"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2026 07:44:45 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Sat, 3 Oct 2026 07:44:44 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Sat, 3 Oct 2026 07:44:44 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.45) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Sat, 3 Oct 2026 07:44:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aQlX2R81DZQY4vZJwQ6aibX1hle6uf0fP7MmhA+mabXI5AoX3mTzlgQD2lts/qKUkpRrB2lAIrYQvBQmRc1qwYoAKVsP6Jp24E59VyUREfldml1xogwpEIZpYANDm1hr9ecPNWlHSrZBaj8RvFeQI3ieDKpIZReK3IjtoPX+LWG7W9F8RjeFoTAKd3yEbcMSbaqxRzJ3iCOhEuJFB5HgrgXu4+w/gVwtr97/zCFU5VOCNCTnpoq9wSdheyFRXw5G0snUONG65yes1A82EiHvFrtPJbUi8DVZMfLtIEKP1hkhBdFwQqefROKoRmt6mulHL3FN7rVisB4a1/njeClgnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dlfedccfIEq9RrDOmhjAu82RADkFFbMISgyCy3NYApE=;
 b=yyQ1XZxzos2Rm6OcGY21046yegMbPA9j9t76j13QN3ZDXH8rZVIdudST8DzXYCroMEVoLwsGjuDi5TbdTBuOjFyCc1JDw0FP+1ke95F5QhBtUJtipDuHdVQ81VEI6amJ0VZH+4WOAs1GLGr2PIZoEQyqdhHgditCAlifZnqBIMSbqmF+WK7zPMBnmqK7+bw7GJn9xnT0FiRwTLUC4JUDyQwr94KBHo9h9QDG8WPNk/TanMQxX24OIPlxCfqM1R4IZqmm056FshV7NuEVWICemUfd6LWRu0kY0XMsPFV7b5Lmo1ZRd2YOCjHdqLYjMaUQJ6VkIZgy59CtyVy//j7Gvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS6PR11MB362586.namprd11.prod.outlook.com (2603:10b6:8:4c4::14)
 by SJ1PR11MB6081.namprd11.prod.outlook.com (2603:10b6:a03:48c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Sat, 3 Oct
 2026 14:43:15 +0000
Received: from DS6PR11MB362586.namprd11.prod.outlook.com
 ([fe80::71a6:38f9:43ed:8f8a]) by DS6PR11MB362586.namprd11.prod.outlook.com
 ([fe80::71a6:38f9:43ed:8f8a%6]) with mapi id 15.21.0472.016; Sat, 3 Oct 2026
 14:43:15 +0000
Date: Sat, 3 Oct 2026 22:43:09 +0800
From: kernel test robot <lkp@intel.com>
To: Eduard Zingerman <eddyz87@gmail.com>
CC: <oe-kbuild-all@lists.linux.dev>, 0day robot <lkp@intel.com>
Subject: kernel/bpf/verifier.c:15657:undefined reference to `__umoddi3'
Message-ID: <asEUfedqaH/PzY3g@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SJ0PR13CA0016.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::21) To DS6PR11MB362586.namprd11.prod.outlook.com
 (2603:10b6:8:4c4::14)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS6PR11MB362586:EE_|SJ1PR11MB6081:EE_
X-MS-Office365-Filtering-Correlation-Id: ae8fa2f4-f567-4140-c50e-08df215ca82b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|10067099003|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info: xpVg3kSA21WVq7yHnpL4R1qjHLOQno+IqRNbaW0k+CMdUeJzA3ypXPwqYQaLnw1rXr/WddmX2X27BKQmVTenb3F2eJiMYWmexZzuOX0bfciKhvnDp9UzTZJ98cUTV0d8no74uUZLLNgXIZY0h+Q27bR/N87SAGco2kH0tQOQ1oyMtlQgn05r6PjFXyb/PGXlJfTJAPZB9eA94mE6vcGgUHix6RiU/Vqk9uPPH5ow1O1yqbmxgOc2TJqCGPI3WreGcH7NHcSGUp+golFAczXWkXOpHTDhHk1GoA0ATmiOcp99FOQvaauA9i1482QnmFS7JY5jmGwOUYpxqyjsuLp3Jfqp1euBSStpKQlTcq811D2F58pSe3Y80p42kqaqjnquInlH63vCQvYmlbR9V/u+G582eyyUoAsPBlRVVJMM7HVE3rPD6ju+9zD3+A2eOn0aENt9BHCmplx3HXTNC/I6vHQyJQI9QvX/LR7+wiVW8l1vqA363K4SOhUziI41vFq5VMwh4vzWLkCZbghPREUEYC/VZCF2LvYNvDJe/jBZ3jGRj4vveTyrp6Jjiu48p+XJZJqRrd5D1AxD8GCLH/fTy6RYMRrM/b3kWr21dMyGfqFnrEOqvBmrazjIn+YlZlFY
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS6PR11MB362586.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(10067099003)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sh3OA01CU1jj2jVMg+Vd0NcF+ptqLUoCxWQILSZRuF7jm9kywdtcrxwHveCc?=
 =?us-ascii?Q?vwRcDhUD+s6JTrgFKaUK6eHWrtT7HgYPj2mocRFLVxfhGlv37NO9NrkGyP6z?=
 =?us-ascii?Q?64y06DMENmDjZZHtdrhxnW+2Qdiu3rlQ8a3q7nyyt3tos6vvu1PvngT/L0cr?=
 =?us-ascii?Q?Q+yAlVPspdLXh0J3k3FvZqt/fb6OjQoxvBHdaLHbnWdRKR34yO/K5KTB9GCn?=
 =?us-ascii?Q?Gifuzm7EtXw9CQXP2KAFtqJupNaeu5IG7JSP48CqJ5eV8jR/ok9QeYgz5QRL?=
 =?us-ascii?Q?hCzn/9HP0YoYkMfhw6LXox/rUruzMtua/GR48MBRKQlNe7HnS59cvALqR/Sk?=
 =?us-ascii?Q?BSkzAHIZonCLp3Vq8cswlj9Srzxb23mPimuDc+UN8fHUGQW6KKed3Prze/zx?=
 =?us-ascii?Q?Qfy9ufd4OIFx9VFYT9LSyydbM21vTCmTAux2v9vlV7Xnzulq6yq7kSiq6efn?=
 =?us-ascii?Q?txjtwTw1y0iH93hGMr1l7HlEbQBMdZS/OB7qS8n9o/KU0nTOeMvqpyYQtpUX?=
 =?us-ascii?Q?Hnu4Ra74Ib+B3+hgmg1jHtp4ZowfU8VrrcA4fvHG2wmfOPTwEbpWscPKxO/s?=
 =?us-ascii?Q?SaXvaOF/6FRDJycZL+FI7Q+OPR+O+4GG/bAdhSJapPxzByFxzaPjsjFQ4hVJ?=
 =?us-ascii?Q?s8zfAMzu6ipB7bGuWyQR8lPcdF6P/L2YfVLovk9rscZWak8hIIwALyMMoGf6?=
 =?us-ascii?Q?mIZ+pnA+QzvmXKZRMkH2/SsquAc8CQals6T9P65cQD1o4c+SZ4auz+kyh/77?=
 =?us-ascii?Q?MBJ8t5c2C5/5YFZv5PR5+G0RcfP9rbkMv/Abl6nKzCDXEfxT9RVS9w10D5va?=
 =?us-ascii?Q?csrqWpEKb2/VwwjUAZSpnUcbaoi1dgnVibMwBMTvc7L9iFqFal8pI0/E1Vyt?=
 =?us-ascii?Q?vFo/f4Mh/lcfqUVbBkbPPjrZAbt2Vga42P+f11vgfAZaryLtgXf/lQcpzJFP?=
 =?us-ascii?Q?wl7RgFSz1jY5U+b73r+tB5e2tTjyPhZj6y9lJYKUM/XS5k35fNzIimRoZGwQ?=
 =?us-ascii?Q?2FzBtQMsYSK4iA5BhoPXmuh55dnSOOob7RDIVVwo4UVjaCLNgc/na1/iyrak?=
 =?us-ascii?Q?p7yWd66ouIFWP/2p2DqW3XY6omgkzxVGOXGkngKUfUKrbSHMlBxWH0kCuhRL?=
 =?us-ascii?Q?r0FDbJaGjpnz24CK9g+Ux6Mvt5fDRskss0Qv3gdVy0ou9H7v2RwOpuQprq9G?=
 =?us-ascii?Q?haM2DN7GrrPWkkYZ5L4B0p3MbhLijSWF16vmu7oLtNjD19qNIvHZDwwQThsy?=
 =?us-ascii?Q?dU056CxvMJiCoY1Gq5uc/W8/nKVvBRSQ80Uh3YXvSBpU9obclrwnoxg6Utkn?=
 =?us-ascii?Q?oPnR6l7aE3rbMbzSXyCjrS8bRk/A3K5pdAVX6v4Y8as9huj2AcBuZCS3tvzE?=
 =?us-ascii?Q?3OZb8SADydbtana9OsdB/EUDRsKqUDI15rslvznSg1CnwDDkusf3a326FXhQ?=
 =?us-ascii?Q?1iY/LVxUaZl2U0FY5TOAQUordctL7WWaw8eCjroMQQY+D0H8Mr6Gt/yTCvz2?=
 =?us-ascii?Q?BLLFjwg6Vzat5gPHN/EVv4BLVhN9yPi1gY3Om/FogBFNc8O+S3rfyjV/TE/I?=
 =?us-ascii?Q?AIHukV+cJJClneHJx16Dt2tFLlZ0AKHN6I1P0oNEuM0tuk/4PaQBO1HuSSts?=
 =?us-ascii?Q?gH+dhbAi67gm84QW1ThwoKSFcywbdcTf6Mv57cdmwklY7rtC6MZSD2WZi0jy?=
 =?us-ascii?Q?sDPJ/F1M5fc5FzejNFIuzmZN/NPer5G1ozz70vfhikmq0+AX1ASI4Qu5CdlB?=
 =?us-ascii?Q?AzbMneikvw=3D=3D?=
X-Exchange-RoutingPolicyChecked: 2rNDjkz5fQgiTJE++ucxdb6eRvn2K4ObUjLtx4iZacKf9YoQPepu5y4xl7oSHkkXdxss5PTKy34eABBpXV+NTXWeUmhh62O0q6SQY1+o3eJuXvEoHxkZSHxd1sqON1wkcga+IfpRCjdp9yTpl/oteXtlHiSWOS+25lpgKShaS3cV4MAUOxNaS3gOOMjbFQlECCsqVUA20uIdNXX0SbErv2Bp+iWOAbncOqJ8OEvsQuHTTEnQeQ/3iHWbX7k25zd9SHCFS2J1UaoccCoCa11wL/tQIi2Rj+zN4FkiDb+sI5tfyvVnXx21wLt8auTBy8JOPgWp9N/ZwwUZ7sRqV9Nk9w==
X-MS-Exchange-CrossTenant-Network-Message-Id: ae8fa2f4-f567-4140-c50e-08df215ca82b
X-MS-Exchange-CrossTenant-AuthSource: DS6PR11MB362586.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2026 14:43:15.3049
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GBkwiCrDODJ85U5pd6IEPLtd+/zBkB+pinMNnik5BJWBD1jZ5Omea8Eo9CooWdnDrJhwMfWosg1Hx4T8yg+3rQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6081
X-OriginatorOrg: intel.com

tree:   https://github.com/intel-lab-lkp/linux/commits/Eduard-Zingerman/bpf-track-may_write-flags-in-liveness/20260926-071959
head:   588faaac20422c91861700e863668674da9cc06f
commit: d4a6f606bf5cbb4d84b533905e932f4a79fe17e3 bpf: representation for intervals with steps
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20261001/202610011511.kp41YMdn-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261001/202610011511.kp41YMdn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610011511.kp41YMdn-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: kernel/bpf/verifier.o: in function `scalar_step_lsh':
>> kernel/bpf/verifier.c:15657:(.text+0x14102): undefined reference to `__umoddi3'
   ld: kernel/bpf/verifier.o: in function `scalar_step_mul':
   kernel/bpf/verifier.c:15646:(.text+0x15376): undefined reference to `__umoddi3'


vim +15657 kernel/bpf/verifier.c

d4a6f606bf5cbb Eduard Zingerman 2026-09-26  15650  
d4a6f606bf5cbb Eduard Zingerman 2026-09-26  15651  static void scalar_step_lsh(struct bpf_reg_state *dst_reg, struct bpf_reg_state *src_reg)
d4a6f606bf5cbb Eduard Zingerman 2026-09-26  15652  {
d4a6f606bf5cbb Eduard Zingerman 2026-09-26  15653  	u64 amount = src_reg->var_off.value;
d4a6f606bf5cbb Eduard Zingerman 2026-09-26  15654  
d4a6f606bf5cbb Eduard Zingerman 2026-09-26  15655  	if (tnum_is_const(src_reg->var_off) && amount < 64 &&
d4a6f606bf5cbb Eduard Zingerman 2026-09-26  15656  	    !check_mul_overflow(dst_reg->step, 1ull << amount, &dst_reg->step))
d4a6f606bf5cbb Eduard Zingerman 2026-09-26 @15657  		dst_reg->base = (dst_reg->base * (1ull << amount)) % dst_reg->step;
d4a6f606bf5cbb Eduard Zingerman 2026-09-26  15658  	else
d4a6f606bf5cbb Eduard Zingerman 2026-09-26  15659  		reg_step_reset(dst_reg);
d4a6f606bf5cbb Eduard Zingerman 2026-09-26  15660  }
d4a6f606bf5cbb Eduard Zingerman 2026-09-26  15661  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

