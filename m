Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A843F4B5AE
	for <oe-kbuild-all@lists.linux.dev>; Mon, 12 Aug 2024 14:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723474318; cv=fail; b=IZn25Xdo18UKLfny6kaKrMqWY9gRSJ10o9g7L42avQ0pyvpEbKRJ6P3Qyfbn9ruoJj3CriP+JfO/NLe/kSt7sAhC7e+G0JMLdjB5Y2fBpKT1CYW4vlOLiIN9fxXx+Ab2uHlHYok3KMSDriOUPU/njTqxgZzYsxUQrhexf2E3J/Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723474318; c=relaxed/simple;
	bh=2NFiyBrwfYuOi9c+C7GeBGEGgmehsx5zL33VCLDIeYQ=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=NGKID2zndItpwX5qppqM467rUZ29AZeAEvzQKZot5CABaKrTkgJTtuTdtQjpSMsdI9r6w3Gswl+2Z/3CX0nVbXVUCLbbszc06TZnid1gXM07Tog2E1LaoRxWbI1Ii7oCZ68eTt3pl+kTgY732mcDGvB9wBRJWvCJwXlU3MIltsQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SOsMnT21; arc=fail smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SOsMnT21"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723474317; x=1755010317;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2NFiyBrwfYuOi9c+C7GeBGEGgmehsx5zL33VCLDIeYQ=;
  b=SOsMnT21x8bKlUmv29Jz5tIuZXgrWIW5ACZqMRsUShX28Ju0huig5wx1
   8S+GX5U9J5dKBru+c+HyuXezkfsmvVtr+WO84JXSnfJE6hP6OBxDcdt1X
   NJwOmCWlcT9wtpjpqZ+J8GlAML7dXJKa3ywZzhJR4Lj0aBJ6Fky621Bhm
   LdieV86rURJge7ZMIWnAsL0jX6GcDjsOaS/r5ul0ali2iD76qC4++p4aX
   rbVkm0jqcdwT8LKuvzlywKFTvAlE2HpnIGmDHsU4cIlo2BkI0stg1CLel
   BjAiAvwy99YY62mETCDG/1g7lkTZQeN3zBiFFfNps2Ar9SE20jT6ASEsI
   g==;
X-CSE-ConnectionGUID: fV5Z/xYuQpKQv52E2kW3QA==
X-CSE-MsgGUID: LDP0gvkHTaqf5qgtf3Ib4Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="21396153"
X-IronPort-AV: E=Sophos;i="6.09,283,1716274800"; 
   d="scan'208";a="21396153"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2024 07:51:56 -0700
X-CSE-ConnectionGUID: su95ySRjTe+at95a0xmhRg==
X-CSE-MsgGUID: x3l2l1XGRaC6Lap176oyCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,283,1716274800"; 
   d="scan'208";a="88923190"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 12 Aug 2024 07:51:56 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 12 Aug 2024 07:51:55 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 12 Aug 2024 07:51:55 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 12 Aug 2024 07:51:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aCzvvhJrCEkHaFtpNgVFCnrMVcDsedgxeQZJlWYbAKjE8N7VsoG9I4GS+zn+TBrrMiSnUqJ67H9///mScH64YjSIlsSEpJuwDdXFRJ8zIdJKomEwswOFfAPJREnGSwrvD5zTvmAI/rIRjiBpgwDwrU+0VzQ+a5ATTeQo8lN4zmNHlsMwe8c2zt61SIWhExyh6wDdTKh5elxRNZdhE+XnmRn+kcNsFDbkp1yONp038FVqgwAVN2kAWC3pxqB/c7HUcfBzzWk2lU3ibblRygqXojwKjnMf4rXGqpcYbcuviFzyok3vg1GoN6Rcd+TXYpUFWl5MzNtDScsOAvDirJ5s4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u3tOZvKqjvQjSvPSv/d5mp5e7ihKaoaKy8tlvcUr7+c=;
 b=awsqNR1AJejtY0iNzgFAt+8e4pmdvxvPas7qIL2OZjUA9mi/P/1D6sDu3fHsvFIO9mnn8/S8C360EXkaNbkZE3zzAAW1sUaT8qnbGhRtiSQ6JKj56mPp9B8YKidz/5YG70ek6NnfTG1PGH2bu+rKE/iJpYOqaXyxQMvn3wI8xF9B9oXKLCs64MODqhIFcjyBGAo4PfaLbPWpPSMQYioYYgJAvmdEEJdoHtCJt9BsOTAtvih8AD8rY0up/JeTQefxUjPgAOK0T6/6DzN0/BWNDEtLAiTi71mABKXDOYngWIBjwsspzhTnVvuZGqcU0Zhi7I1BPYrnqI8JrQ5yfZKFCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
 by SA1PR11MB5803.namprd11.prod.outlook.com (2603:10b6:806:23e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.31; Mon, 12 Aug
 2024 14:51:52 +0000
Received: from DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e]) by DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e%5]) with mapi id 15.20.7828.031; Mon, 12 Aug 2024
 14:51:52 +0000
Date: Mon, 12 Aug 2024 22:51:46 +0800
From: kernel test robot <lkp@intel.com>
To: Dongjin Kim <tobetter@gmail.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [tobetter:odroid-6.6.y 30/78]
 arch/arm64/boot/dts/amlogic/meson64_odroidn2_plus.dtb: ethernet@ff3f0000:
 amlogic,tx-delay-ns: [2] is not of type 'integer'
Message-ID: <ZrohgpHnS0wB2dkS@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0169.apcprd04.prod.outlook.com (2603:1096:4::31)
 To DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5423:EE_|SA1PR11MB5803:EE_
X-MS-Office365-Filtering-Correlation-Id: 761b5303-f81b-408d-b2ad-08dcbade4d60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|220923002;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Uqj6O8dhL6bPB4g1fvpFqfm7R+Hs+Dd3eYXW8lF3TGj4yvAMIrlxNL0cTMsz?=
 =?us-ascii?Q?1sgBsB1sWVBEEvvPXC1a+CU59lPah6nfkgiR8pfaQbaQLzOUQfp6oUNI3nYp?=
 =?us-ascii?Q?HtiCgvG1VMlhfIfip5dnlqeJAYNdXyx2Idl+8lZFHBG3YS5VPOjKfyBv3UyK?=
 =?us-ascii?Q?Hm6todC6BU0vx7Em5h0Pz+WhaCIbs7d6eRhdaFoR22H8t6IubsCMIqTkFeiP?=
 =?us-ascii?Q?rGGar7xwC9XDTDxSFGOnmhPzWNK9IM1dwQ4wKUtXefU7P3v5s3QJ6Zch62pM?=
 =?us-ascii?Q?NiFIELwCT+sftxYTPPYBe46k9xu2Sk//T3YQJnIJGS2CMiE4+LmNZY/+OKrU?=
 =?us-ascii?Q?NIUxkUzVJJg/VThcA+mLTD5WrJ9YhX619e2etiOStUdleTPTdOMYPhkXbOPu?=
 =?us-ascii?Q?i9W2mst1xjL8PsjOQoyZGFKStK8wwJOkEIuHf0k6rWZYz9E0uuN6c1ysOkq3?=
 =?us-ascii?Q?RXB5C4jRs23eqd0+UBHCafVpxHOLLofAb0OjYt9XbO26J8MW047xRSR5W9q5?=
 =?us-ascii?Q?MncYLHOE3CG1e/s8PjnRGla5m4C8gy5iM4wKNqpJ0nLCrKOy39U47rCa/u06?=
 =?us-ascii?Q?260s2nCmhzn3kRO9c07eGOddjNeGodgC14aNBeQKM6RQPOYFvwawmL23aFqg?=
 =?us-ascii?Q?E8W9FdkbPnWQaxQepYuQ5+pb2RYsjFHULGoOwn/7lyW5iKN88XIKR2kxZtJq?=
 =?us-ascii?Q?1liQG5TBfioTNFvlfjdABE4C525Lr7lAD8rA+6ysZJTBO+R88GlgA4rJKxl8?=
 =?us-ascii?Q?qlf70YkEnpWnidsKPtJuopn0zXrQ2UApeJwCggd9KcYsH/bpd140wfHok5jd?=
 =?us-ascii?Q?1ILBdcwkg/JptH2aQSAdXu7EdDYOvJebr/WqzlG8GH38dSlIhRQ6JOn30Icl?=
 =?us-ascii?Q?s9+vWdhZU7tro9fNkniIJAJ5EsZA564euY8K8a2xardXDX/rGRz9rCvvb8GG?=
 =?us-ascii?Q?xP6sikqummgA9yOBgAUVZ82HELDjxXIAABCW8C7A1QeHMxpZnMghKchL9oYg?=
 =?us-ascii?Q?hmRc2lhrTcEeK8a+Dv2rgmI90pH70WS8tujJk5y5XysfKdd32mxkKdqdhKCU?=
 =?us-ascii?Q?WwO0BNoZ1sGDFZNktweZd+vguH+q/zFRFx3YwGlepXOfOVwaaADhHg8jT1Ci?=
 =?us-ascii?Q?LMBDtyPtVTgm+e62PEzis6dceegR3wuVOZu8ufIcOFP3d6dHiASsZL7vLGiJ?=
 =?us-ascii?Q?JXX6t4QKHugz1komAKN/3VS1kt/HARiSy7LtmRmRZJxYUkCec31QlsDSg0XX?=
 =?us-ascii?Q?8bAVUMtPjby66h6nqcbN730QaUuVbajevIMvJIIm3LTAtqOIMcGrH6TCDrs2?=
 =?us-ascii?Q?Enk2tuURKk9QMuFVCNi9pKRWsUoVKF4B6HPdz4d0XjmBfbNdwrQL8MlzkAQC?=
 =?us-ascii?Q?2XaN03E=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5423.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(220923002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?q1x1ka9/gEaCribiEisXL6t+wLClCPjItQ/EKUFI3SbpE78woAV6y1NwgGkt?=
 =?us-ascii?Q?WpJB3XFLuUDhmj8kJcc5GWom0oOUh0mk43jO5UVwN+9s+Mb15x+K0NGbJ7l/?=
 =?us-ascii?Q?JgHi/MKcel7djRt+Nq5HBS7RNReb6n0oYOO7aJ5CSy6qNbtU7YUt7DL8N05s?=
 =?us-ascii?Q?b8+vWGuCwVYWNzEs+O0m2wi/6wWMgh6cwr08fk2ubZaOM5aJU8pBGaN1asRJ?=
 =?us-ascii?Q?yf0JcncqbD2gUi/bINK8tukXT9EphhPdgYIZdMe79H8lNqxT+Z37kQ5ISkxG?=
 =?us-ascii?Q?+frgzKnU3iCPAbzdLODIxtYfbfN5NrIlA1boYJ0WQRo5tWov644UAbCyI2pY?=
 =?us-ascii?Q?WwTifqxXEd8yD9yx743qzqLpTTMS83ZNgQF2GM2QQszhOs9snwV0mpsE99Tx?=
 =?us-ascii?Q?D1iRuPtTKKEF6Ifadxj27L172y3xTuUicjCqb2UsVJ7VbHfzNO583Hn8Ou36?=
 =?us-ascii?Q?TSmzgmRJaPZzWw3wX7ZgANEgOWyfgTRN79ShIfTtqQHfXrB0z8w2ZaO+2MFt?=
 =?us-ascii?Q?Cyor64rBr10eYVQrA2pKt1tz/jSCszQcPCKO7OHgMk50IySlrVT0pAuA1eld?=
 =?us-ascii?Q?Irqu16RiIz7W9SXgFfc6FYAIaplas2eqe5Q9kBeepnC3teADP+cf0sNt63XZ?=
 =?us-ascii?Q?SCQATR+E78W+FNLhlcR2dQu/XjBbHH4YEB8is7ZG/UfWvttE+rCd2VTgVvX3?=
 =?us-ascii?Q?OkpyXNaGubxiF+e4DLL2F9PtMeQcdDXA5T3Wa/CLCwzhSots77YZHdIJQ/A6?=
 =?us-ascii?Q?SLUEGM4bGLTb1pMrYtHJDvOOyjR3B2yeOJiBAH9Xwb0Le/+GQF9Au+MG21yU?=
 =?us-ascii?Q?P1HSq0Azp+pKoSPEGd7ZjJcRl4MBxPimVv/uOv32qgyf4g5zSFPuIIkMYbkm?=
 =?us-ascii?Q?Py5KCCPElbETSLHCxWVJKAWChxiMl0CXpn/e2D1O1DRQPlXye738SJGMIlxB?=
 =?us-ascii?Q?AxwcMJpaBQkblE2OCFOhoilFzDL4FgF15pv4xdoKL1kzr7tditdvjHL1XE5L?=
 =?us-ascii?Q?++5rzJsYJ5WcbbPFv170yBQ9bDS1xLKHagrRWuHe5RVW78iF4zbkjLxDAjqU?=
 =?us-ascii?Q?1aHjEfm81kgi9+USSpNApMVcr/JGZ0epaGkStnUzXkwk3jn/cS9U3gnFCjw6?=
 =?us-ascii?Q?4ybWIclObrCLfZRMbKwDGGbp1O7xo5bz3TfCJTxZP20yEo844E/rRxC/HeFW?=
 =?us-ascii?Q?JZ1HsJuf8Z4XN9DvAeOKlg40/jXFSBiOW5MVVNTJCDb7WEmSItr43b1iNDTO?=
 =?us-ascii?Q?RWEF0rRi6oLlo66nKDjEO47XE0ENiRu8y0eFU/E6YjLSWujW1zQdqXhG62W/?=
 =?us-ascii?Q?Z86OgGKk+xJvHPKhMVtj4vUHJnLDwDVdGPThYiwRks4LND14qPZc1V1iFSMx?=
 =?us-ascii?Q?g091a1C38yoGvsk8bltygEVZkJpFJpz9kI9gFGxfOBddQxSXLRKvUKE9euaZ?=
 =?us-ascii?Q?L+SVrdt3VNUnZvG0AAsNhXrhQo9TnYjeMEwN6CltcWO9UcQGUHBxSwYvVWKP?=
 =?us-ascii?Q?SyM8ftAF6npwDH4/2c3gvUtQ7hNA/ipH/Ndr0DhwwXnUeQRtclM0i/2rCaT7?=
 =?us-ascii?Q?sVTToFjdUjtNWG5tlw64NsRt7YKvht6y8X414e9F?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 761b5303-f81b-408d-b2ad-08dcbade4d60
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5423.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2024 14:51:52.6446
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TtFP2fMdQhl/Wf7KLDMgvI/L7POWuMWDWA50KihzflbBASAUE9TJqb6k3ypiQQ0H3BGm9mhPGWF+7h8o/JKEdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5803
X-OriginatorOrg: intel.com

tree:   https://github.com/tobetter/linux odroid-6.6.y
head:   db2e15a776d1205387db09cc4cd4b3d97c5de1d3
commit: 81da8950b9cca078a3a6d8c255e143871e7cf164 [30/78] ODROID-N2PLUS: arm64/dts: add 'meson64_odroidn2_plus.dts' for compability
:::::: branch date: 4 days ago
:::::: commit date: 5 months ago
config: arm64-randconfig-051-20240808 (https://download.01.org/0day-ci/archive/20240812/202408120044.elPsEMrr-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.6.dev10+ge5d88ac
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240812/202408120044.elPsEMrr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408120044.elPsEMrr-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:266.33-1540.7: Warning (unit_address_vs_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtsi:154.23-158.5: Warning (unit_address_vs_reg): /thermal-zones/cpu-thermal/trips/trip-point@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtsi:159.23-163.5: Warning (unit_address_vs_reg): /thermal-zones/cpu-thermal/trips/trip-point@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:266.33-1540.7: Warning (simple_bus_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: missing or empty reg/ranges property
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2_plus.dtb: ethernet@ff3f0000: amlogic,tx-delay-ns: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/amlogic,meson-dwmac.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2_plus.dtb: ethernet@ff3f0000: Unevaluated properties are not allowed ('amlogic,tx-delay-ns' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/amlogic,meson-dwmac.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2_plus.dtb: /soc/bus@ff600000/bus@42000/clock-controller@0: failed to match any schema with compatible: ['amlogic,g12a-audio-clkc']
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2_plus.dtb: audio-controller@300: compatible: ['amlogic,g12a-tdmin', 'amlogic,axg-tdmin'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-formatters.yaml#
   arch/arm64/boot/dts/amlogic/meson64_odroidn2_plus.dtb: audio-controller@340: compatible: ['amlogic,g12a-tdmin', 'amlogic,axg-tdmin'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-formatters.yaml#
   arch/arm64/boot/dts/amlogic/meson64_odroidn2_plus.dtb: audio-controller@380: compatible: ['amlogic,g12a-tdmin', 'amlogic,axg-tdmin'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-formatters.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2_plus.dtb: audio-controller@3c0: compatible: ['amlogic,g12a-tdmin', 'amlogic,axg-tdmin'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-formatters.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2_plus.dtb: /soc/bus@ff600000/bus@42000/audio-controller@744: failed to match any schema with compatible: ['amlogic,g12a-tohdmitx']
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2_plus.dtb: sys-ctrl@0: '#address-cells', '#size-cells', 'ranges' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/amlogic/amlogic,meson-gx-hhi-sysctrl.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2_plus.dtb: thermal-zones: cpu-thermal:trips: 'trip-point@0', 'trip-point@1' do not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-_]{0,63}$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2_plus.dtb: thermal-zones: cpu-thermal:cooling-maps: 'fan_cooling_map0', 'fan_cooling_map1' do not match any of the regexes: '^map[-a-zA-Z0-9]*$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2_plus.dtb: audio-controller-0: clock-names:0: 'sclk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2_plus.dtb: audio-controller-0: clock-names:1: 'lrclk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2_plus.dtb: audio-controller-0: clock-names:2: 'mclk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
   arch/arm64/boot/dts/amlogic/meson64_odroidn2_plus.dtb: audio-controller-1: clock-names:0: 'sclk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
   arch/arm64/boot/dts/amlogic/meson64_odroidn2_plus.dtb: audio-controller-1: clock-names:1: 'lrclk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
   arch/arm64/boot/dts/amlogic/meson64_odroidn2_plus.dtb: audio-controller-1: clock-names:2: 'mclk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2_plus.dtb: audio-controller-1: Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
   arch/arm64/boot/dts/amlogic/meson64_odroidn2_plus.dtb: audio-controller-2: clock-names:0: 'sclk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
   arch/arm64/boot/dts/amlogic/meson64_odroidn2_plus.dtb: audio-controller-2: clock-names:1: 'lrclk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
   arch/arm64/boot/dts/amlogic/meson64_odroidn2_plus.dtb: audio-controller-2: clock-names:2: 'mclk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
   arch/arm64/boot/dts/amlogic/meson64_odroidn2_plus.dtb: audio-controller-2: Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2_plus.dtb: /gpio-fan: failed to match any schema with compatible: ['gpio-fan']
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2_plus.dtb: sound: Unevaluated properties are not allowed ('assigned-clock-parents', 'assigned-clock-rates', 'assigned-clocks' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-sound-card.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2_plus.dtb: sound: 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'#clock-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2_plus.dtb: /odroid-reboot: failed to match any schema with compatible: ['odroid,reboot']
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2_plus.dtb: /pwmgpio: failed to match any schema with compatible: ['pwm-gpio']
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2_plus.dtb: pwm-fan: 'cooling-max-state', 'cooling-min-state' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/hwmon/pwm-fan.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

