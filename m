Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E23E1FAA
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 May 2024 01:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716774832; cv=fail; b=ms3LZFZNdIBAwowZdjdowyclPlsuo95Pi+bnnixYGCAmLVAdLtP875tv5f/3GFDoElxvguk27cUqdUmeXvUcSbXnJi9XQZyByPmsrUqnaZ7KDtnM+eQ+Hwm3j+DT03pdqON08ZJ/u5x6Arq1ok69aVUFC5f9tpiD1budkDmQe7Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716774832; c=relaxed/simple;
	bh=vviUKoqpddypk4up6Lekvami1cy7OAGNCrhWvr3wMvA=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=lP1dKuTyFsue4ThInSAkvonr47PqvSmID3/uVjW5mllPZwgx2tE8utrIVfEM8wGYEQ2j9hmKgQ3CifGJMxAFl2t3mL0JCyX6hc23KOyqAeqcN4eAY6kMNYJMgOtDJWojBe6HdpEb4IyIRNcRYMwVujS/OqEqOTkiAJ0l+LTqAXo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EyXLw50y; arc=fail smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EyXLw50y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716774830; x=1748310830;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vviUKoqpddypk4up6Lekvami1cy7OAGNCrhWvr3wMvA=;
  b=EyXLw50y4JRpC9laO1iqT8acLhlsDBKotTDFEkKu2mVqA8vW+LpFoZ4k
   6ik1aMnzeH01ueYYRoqom3HEGf1iVww8+bSdccl8FkaqavDC1XpOz6uu2
   wCPJOhBY/WlN15mOHVn1ySl2hwr3T9FPCj+oZoxg+XxBy6ZUsGU7SiBa7
   naGWHU/wSBuLR1KUHkcW+89uVQn3E/NMOwaK0T0+6kBAyPp6/k8N0WqSi
   lyxVEZPdGMw6L0DZfcPoYzqdGmjOcegWKzJ7691iCeEBfAmHBVkr8dFB3
   v9+C3EyMueduHUDvkKIlHBN7Sdmurnw9Ipa8R1AFwzSwGRkRSZ3rFSXBV
   g==;
X-CSE-ConnectionGUID: 3HYKG6d9TN63AsZaXAb9xg==
X-CSE-MsgGUID: hqj39u8XT7Wr0yOI3PSx1Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11084"; a="13190781"
X-IronPort-AV: E=Sophos;i="6.08,191,1712646000"; 
   d="scan'208";a="13190781"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2024 18:53:50 -0700
X-CSE-ConnectionGUID: cEFV8zzyR5aXeNuAukJ8dw==
X-CSE-MsgGUID: E0rvrCyySHyIB/P2BvoMog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,191,1712646000"; 
   d="scan'208";a="39160201"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 26 May 2024 18:53:49 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 26 May 2024 18:53:48 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 26 May 2024 18:53:47 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sun, 26 May 2024 18:53:47 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sun, 26 May 2024 18:53:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AAI3014co1ui+v6KSkWyizWWNdJ+PVlJciDRdU97OoFGKCuE865KGwIa57+TCgMGyQuv7BIQgXfRr7Ew6mG4fBhAQPv1Hj5KRPcfUdrB99C+7GKUMrnaiSp82p0oBLmADzfmNdLnU/dP1KA2YEKUZTtUI/uobx9B0T45G5l8/tRDCovoychwcecez5Lq/w6Cy/YuDQNK02pFLt/WiGU/D8qCIoRlOEq5CcrdKeJKtwGl0MRxIuMErtWVhmKBrQPvx/4uRGJr8DX5Dqdfu8E0/GRVxS2arhuX1pkTmmiinJyTDQOw34E3+GbchCOY3oZMo46y1UzsnXCe5QSzi8qavg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wi7IJnDGfdcdfQZdhEYiUPIIdo27AwATMcRd/6fyLIM=;
 b=mkd8UGA4ilZZ6CWLBsDD9JQnxrqj1VViKHUfGYnEbqHwcsC6K3okHI8PEYfXDohDNop+AP6xQxxg0bIoGL1Ma1YymmWz3hEmYZ0RcqAERS68RcxNhNZG07aVofOqp5djNZjwSHvteAkTbKn34io+2frK5IUS+nZqIjb1xp/HZSX1wd1MwDxp7LSvBmulCUXqSlTpmjpvwCmjeka5Y9zeqh2htELzkV876t4Kgklef/Gu3tYdYRlMFLfIjBv87crqyBEuzLi9TthlyufHmA0xMK57OkebH+OgxolHPgjTjwwFT68aID4FllHALm++EgKaKKYwIwcJdMJqThY6YWd06A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB8393.namprd11.prod.outlook.com (2603:10b6:806:373::21)
 by SA3PR11MB8119.namprd11.prod.outlook.com (2603:10b6:806:2f2::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.22; Mon, 27 May
 2024 01:53:46 +0000
Received: from SA1PR11MB8393.namprd11.prod.outlook.com
 ([fe80::1835:328e:6bb5:3a45]) by SA1PR11MB8393.namprd11.prod.outlook.com
 ([fe80::1835:328e:6bb5:3a45%6]) with mapi id 15.20.7611.016; Mon, 27 May 2024
 01:53:45 +0000
Date: Mon, 27 May 2024 09:45:27 +0800
From: kernel test robot <yujie.liu@intel.com>
To: Aradhya Bhatia <a-bhatia1@ti.com>
CC: <oe-kbuild-all@lists.linux.dev>, <vigneshr@ti.com>, <nm@ti.com>, "Praneeth
 Bajjuri" <praneeth@ti.com>
Subject: [ti:ti-rt-linux-6.6.y-cicd 31/55] dtbs_check:
 Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml: oldi-txes:
 Missing additionalProperties/unevaluatedProperties constraint
Message-ID: <202405251034.LVi793WD-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI1PR02CA0019.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::15) To SA1PR11MB8393.namprd11.prod.outlook.com
 (2603:10b6:806:373::21)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB8393:EE_|SA3PR11MB8119:EE_
X-MS-Office365-Filtering-Correlation-Id: 0885b18f-3076-404e-1c39-08dc7defd832
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?hC7MdEEA6wc0RECOKNBCR1odnkom2Wx2QgXBBIPcv2fy4DNO5qkMXobq8ECb?=
 =?us-ascii?Q?+ESwp/oQUQGNRuPej1/I0fVIUk6K+brh3Xzv9KsAlYW9cLxcQMmtvfItGGGt?=
 =?us-ascii?Q?OlaAEMAHzhpAark3h/CaCq6wgnJIVlheN1EtkXBLB49PN/eApabmqzVxBAOO?=
 =?us-ascii?Q?nN1VK0G8FwntdeGDDLVcWqFn1IYL1C8IJBMeSAvH3S5ksF9esIXggye7JgoJ?=
 =?us-ascii?Q?PdQf2txo93zclvPmjw6Hx7CFYGcSZLWBWuNCheW0IP4EKosJ93e/TMHyOiHT?=
 =?us-ascii?Q?D2N6VR4VXrGmV5udstGOY1KhOP5IfIUZI7ocmnARfjhRS3OBWqGByCFi3qhD?=
 =?us-ascii?Q?/3F7WwyRmmCRayUWpKVkESMTrO5RAm9LsN0T0PzQwzDIA+u9B3DCgFOryAF7?=
 =?us-ascii?Q?h9lNkZShTxwTND4CFvJNM1ID9es2TMNLNPhmAEueJ8/aX8z5DM8N6Inrb0ju?=
 =?us-ascii?Q?TJ/OZtAqLnEU0QQQ1/CohhrUtmDOIPdRDaPvFMPp7d7VSuUGmEAhnBbqJHIZ?=
 =?us-ascii?Q?mmq3atHO0la0A2mwA3bQanMV60/LnVsm/FcWuJPOIElQXiQtNrvrgUcOG2IT?=
 =?us-ascii?Q?YF5SU/gZeLUgYYJV/0BAcXZMD2fWDFRI73d/J69f6zfomt5b4vI/KIFy0UB2?=
 =?us-ascii?Q?eFr1PVHoPVR/Fma4kroNYnj8tYMhsq6w+BwhpyzO/vvXjQw/EAD5mWpOZ8FC?=
 =?us-ascii?Q?JhmTOyI9LlPdYwfsHPcZ1sP32NcmPxBTQjVXFE4imPD81uCLrmYiyZoZyLpm?=
 =?us-ascii?Q?95PYYSEZ7Rl7RCmDlGt6NCy/h996XYzIaeConuIzCFMm69O8/7XyQaz1BJGr?=
 =?us-ascii?Q?Kcrw+0CbMEBq6pyjzs6em39BvHFLiFHcIyckONSzrJhfhbqcbhuCG1n/PTU9?=
 =?us-ascii?Q?jIAUXXWPbXeDWmxGHZAj+biEO1b+1QquvCsSJFp7lAoR/a11yQ/5cq6Sik7x?=
 =?us-ascii?Q?xc8Go/bFE0UtdWCJYJIwns0eE6LUbBY9q7PCyhBREGBgpdbJG3GO4ykM2W6a?=
 =?us-ascii?Q?XivznMT9eHItyYtTXf6VwKJZWRQeRK8Zs7TbVbr0S625NB/7xoskzfkS6qwc?=
 =?us-ascii?Q?ImCjx3u5PZ2Fnli+T3LPqh5p+wpv59fr/hquSrIzTE1jymet4HYY9ZAlPopr?=
 =?us-ascii?Q?0S2tk2UlMawAVk3KqUTk2VGlOLLWTZj1HiBwJaXnwVfT4f9xPLt3h4agGKFT?=
 =?us-ascii?Q?VKrIqNL3I6Vf7SGK8DFKMz/c6pRDiKMSVQu1OkKwCP2Cj0piRBmJNWuOn38?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB8393.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(1800799015);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?m0U8FY1MlKKYfccX/sCosrMco+JtljsZzL3n1hmh5q8/Qgr5qR9fQJb/2Clv?=
 =?us-ascii?Q?Dv/Oq6bw3ZcnK/N8FJpm4I4R5TvQcqlQkjXCb81AiwTYOx1BlDXF0pEpEodC?=
 =?us-ascii?Q?YbVjcyEoEAq1pwHKuZ5Ei+g8GKQ2pZnE80FBan80pr3P+nL1va200FgMNrSw?=
 =?us-ascii?Q?bcDGH3JfpQeYS6nqgWGZcEFq72bt2zPnaTFaLeKhpEEsuZwy51u1KjWLnnfA?=
 =?us-ascii?Q?qjwuLRYIhPUUAL8Z6i+PgQDqGEM2I7z73Ot9UnVW8irM6CLl3mxcjwmoLaeM?=
 =?us-ascii?Q?JnllJ7k8qHMcLJ2hVmBbaaY9Y1ZN93mSJvduTogTPUTPDM50Ugtg2QUmiM9O?=
 =?us-ascii?Q?TkpOfE1m6Pi2ztV7KCiGKH/4yMgFO6vFwXo2wstHZhX4jGu8UNluEMWrlg8c?=
 =?us-ascii?Q?NpQuLOhu8u6HKQnqfOhAMslx1x29uCxoYn9nuljfUu8U44ZQOwXBft8fgqu7?=
 =?us-ascii?Q?jYvAzwu6okxx7mek+HgkojiUgMLYAUAt23v/DX5u3A76JSGFQNtfJ+lhBT38?=
 =?us-ascii?Q?R6l1OlRi97DRSX0klAQafNx+ZywkYaw+yXirS4khf6h7NSau5J4ts5OXHV16?=
 =?us-ascii?Q?yqMx5LV+5fIXaDpi6mi4AvbSnMm8EzOtMMmAq9RPJVLRB1PWGMt14FP4FSvX?=
 =?us-ascii?Q?xvibSM+4BJ4mg5GHH6OODHVgvgjr4emDndMAR8yhU2QbRjVR3MZSkOyME7Y3?=
 =?us-ascii?Q?4AdojudI4EPMxmc4dKJhLVimbhpjp1nWTZFPBfaaEj0+tqms+r8M+3xSR/1G?=
 =?us-ascii?Q?HeaOO3fL8OfO28eMoRCS2Lkf4nz6+JOXJ9Xmk6IyuYKIzrFEU3ZMllkGksVx?=
 =?us-ascii?Q?MzxWCDKoqA+n2DH3ZoZf1tDp07+4T+dr4R73dJugZ9X63/XPx6YPnSIs/5gn?=
 =?us-ascii?Q?FOH8jCpJL/euGG0tb2fLBVeYz5gNtPIEVrI5XTj0rdc8H/15iQif6VytNL+M?=
 =?us-ascii?Q?zCXm2aE/TVGHTdqoa4bofWYMBl6UJemTY7mPNVnc/gA1f96iRI7DDNtwUgox?=
 =?us-ascii?Q?JLLIat9Gb9LjKA76xaNhZoLZMJkB9Q+fytAyWmeRdaVm/4zVy7dZMkZsy1sy?=
 =?us-ascii?Q?WGM9KblxEwWPiPJgW7/gGxOPZuPtirl8LSgYSU+NukNT0mGJcOQ7EFE3dssC?=
 =?us-ascii?Q?SHYwSdCFs0IsJWi3xOCg9zXnG/S49DrNTjGQD7p1gZI3pMm4HDuJABb5q8Mt?=
 =?us-ascii?Q?0rPgGRkfaIPpscGJ4eJPmxtXG35LzlRvGaG44SYNZNVjOXOmn57z2/H2nviq?=
 =?us-ascii?Q?m7QsZjyQVnaajAwHnfNT0jKmtQXcJXGihrhxGSFdz28Ef2E6OqsXDi0+99PU?=
 =?us-ascii?Q?NbeJIoiqGULYPHZELSPrPpmIJ8gAVrfyWcvpU43kvRNr5qzi35SflU1UrfpD?=
 =?us-ascii?Q?cGLKyCVSjAiPbcf+m9oQyucwM2Kh8CEAVi3qrdLcw+f0R4l57252ykg9LNDr?=
 =?us-ascii?Q?V/z+MAmhDCvnngzqEwmxFQnbNwFqWG9fULSkx+tybxzbS0r6Q1RWwd5xB0Hi?=
 =?us-ascii?Q?//IaCgy9sJrrefnxdxo0dZWp88kk67plJ85EFo9nWqchdsJ5otopN9P5xpNl?=
 =?us-ascii?Q?ljJ938tNkSVytYi5ouJ/yyikyGtIVWz6HhMUaUH9?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0885b18f-3076-404e-1c39-08dc7defd832
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8393.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2024 01:53:45.8380
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1TV1VFRLmNMCy5YYrB3BHY1jSCvntNWJY0uAJ8dVLAVhlE9WZXWkysohmkZF60jS8H+RTLhb0cg8IYQ/CvdjeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8119
X-OriginatorOrg: intel.com

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.6.y-cicd
head:   01e1dc239f2d2e61c92f01e905c6bffffc482084
commit: 3b549896c49187c3e33f2c569350d41d7d3f8918 [31/55] dt-bindings: display: ti,am65x-dss: Add OLDI properties for AM625 DSS
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 7aa382fd7257d9bd4f7fc50bb7078a3c26a1628c)
dtschema version: 2024.5.dev4+ga5bbb3e
reproduce: (https://download.01.org/0day-ci/archive/20240525/202405251034.LVi793WD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <yujie.liu@intel.com>
| Closes: https://lore.kernel.org/r/202405251034.LVi793WD-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml: oldi-txes: Missing additionalProperties/unevaluatedProperties constraint

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

