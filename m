Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB3CF238D42
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Dec 2025 02:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764728731; cv=fail; b=Uml0FOMkThk6YP5HuwBa4KTAHBvXADKO+yNGNsiJmN5V76Sk1S31iP3zDAX7btRzt1zkflci4jljMrfbGeDCtpTztC0QnyaftMMdqX5kCCDoztDjeRzmCSZFQd3sLSOb/0GjmfQj16/UcOR3mRLkHZq8NUwX77ABg7h8PZUi/sE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764728731; c=relaxed/simple;
	bh=g0VS+eQKpgakVnFlrNz7rPvI5OF9hBlSiHMcKCjHhKE=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=c2xTybZaC6zsUK7d3+v8j06xfKYaLmxswphcz82Y/8/E3GazOJrt/NE6gzhUjCyiJjbs31Q7UaTttq3F4jeQsSpO7jhtDvysaFxWeqPTxNE22IbpETMZcjFHXeJlffCZQX+O7QwOZ8GAyY4PsaJ50142FU+UN33+h7eQ+EuG+bE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eWkdskOo; arc=fail smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eWkdskOo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764728730; x=1796264730;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=g0VS+eQKpgakVnFlrNz7rPvI5OF9hBlSiHMcKCjHhKE=;
  b=eWkdskOoeV28wgz9F6rfnMExpmZo5A/GdJzlmQ7VcOxG4r9kncC7vD4t
   oVX/QDaMY2EP4xpnuKepvN5bkDWdMmRWgAFkDslIgXm8Zgafbhas5MI6D
   sJtiKjv7DR71NGhpyfAUoVAGNE2J43PD2XhQOcSKj6DxySXQLPjhIbbPr
   tuUAxmi6YyE7LefHivMWUHGJrtq1siFABux4pGFZTOj3j1VsQnjR696HI
   Fb/DKzNCV2Pif/IwIePQEXHo5QILeXbIDFS3iBD5XQ4phCdCibfM1IANL
   7F/d9Sk9Ms8Aph/4YdvYO1pN64bfQQ6QZMkByh5l/X6kyd2wgkiIck3Dv
   w==;
X-CSE-ConnectionGUID: LiVn+H7kQ1CIzYqDgOwHOg==
X-CSE-MsgGUID: fi2oX1XARhS0hMaPBFPNcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="66880250"
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; 
   d="scan'208";a="66880250"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 18:25:30 -0800
X-CSE-ConnectionGUID: 8zkniz5ERi2W1YJzf3d/KA==
X-CSE-MsgGUID: vb7E5W3qQV2CDywH8TQ/wA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; 
   d="scan'208";a="193833458"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 18:25:29 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 18:25:29 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 2 Dec 2025 18:25:29 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.64)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 18:25:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fk3RoC8hqfsuCikksSNSx0B877fdx77IWS3ODOGKKIsUG2jA5gZ6lyCCgEiYZaI0cs1qZslxC6FVAf6GcAF+Vo0EyrJNhgrZacnfnHiHHF3wHNA3cuEvtjl0MUMJCpkxyGjVKyLQc7Rx+Kv4rYw/YJHuWBmhHR+tBVXotAwQeKh+qQPJyIhrl4jo9IJwH0IA5gf66jwhOYReC9m//UHdfS36N/xTMWfVBYYHYf0zUFRF4Fm4I0Z9z6msccXyoXWQs3ejvijVjRfqfC95VUqNdqDrH61vy1GIxRZ1eXzHGVnhwRe3rkc8AdOgXyfcWiQWVmQgJ0MCikWxKYjHQwolpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wNpVrXwBo/Nk9k+9p1YnwMUP+y1fCHyfmeHuaeOG6sI=;
 b=M9oMPYHeZEkGPzJzyDpQ2bNJkm2sLmF09GYboyfVPjhwt8Dbnwv/PRm66GbGtdmzm2HWCN+QGY9GJDbrJ3NuuNF1vvlBtdv1vdQdEMiSnvFq7f6mO2pVEKv2bxztTFregYr7YFuS2ZdHwXByXp9c9Nwu/U40ApIhUu59XJ4yVus2OaBFV6fec/YY7EW8Bj575MfVrO0FMK0Ff0I4uUQRoQ+BMdDCVx5APBVGAEOybxPJwd0+H7bRF3CE9r8sy3PJYzhNMQULlG5afNXQ66lnXuOV34m60J88Sci3jFVSGc5vMT3AsiRS4OuGwwM6ofJz6t2Vagzfr4rUlTicpnMY1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
 by DM3PPF1CEB6B7EF.namprd11.prod.outlook.com (2603:10b6:f:fc00::f10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Wed, 3 Dec
 2025 02:25:27 +0000
Received: from MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9]) by MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9%5]) with mapi id 15.20.9366.012; Wed, 3 Dec 2025
 02:25:26 +0000
Date: Wed, 3 Dec 2025 10:25:17 +0800
From: kernel test robot <lkp@intel.com>
To: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
CC: <oe-kbuild-all@lists.linux.dev>, 0day robot <lkp@intel.com>, Uma Shankar
	<uma.shankar@intel.com>
Subject: drivers/gpu/drm/i915/display/intel_plane.c:367:41: error: 'struct
 drm_plane_state' has no member named 'color_pipeline'
Message-ID: <aS+fjfhmvkUgiMp1@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0161.apcprd04.prod.outlook.com (2603:1096:4::23)
 To MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB5963:EE_|DM3PPF1CEB6B7EF:EE_
X-MS-Office365-Filtering-Correlation-Id: c3eae364-91bf-473d-4920-08de3213386e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?u9quZHWd9r/CNLXlZKPHZGTeRs1ITFpsGA2TjWXnGhbqV38fzqnKCNmRj7GD?=
 =?us-ascii?Q?AFuuw9reFUcQsfQNi8ocitzNLXN9IoIS7MNhX++GwqVFcCnswogvI8xmKgWh?=
 =?us-ascii?Q?3uj0PlXmz6tz3WilgVobbiIk2L1fgByJmxLWfB39flzHeRx82SXWHNER8Bz7?=
 =?us-ascii?Q?sgjgmqx+mRCuDwJx1nzQd/YqEh9dpXlTsZHa3EIF0mq/APFy+PUspzCz1NeS?=
 =?us-ascii?Q?ME5rtUgewiBPrLvPppMEUZoRMBMgVZR/xKioC+26dyh+VM+fSts5+cn5I/aA?=
 =?us-ascii?Q?oRsC7i0n4DKTIYqDiQMN75PT2ZRGEhwDH8Jt1pStThYYfQAJxTRQN8nfJOfp?=
 =?us-ascii?Q?pS4/RqPsqw180Uk47EyvAxEDjtaHCUck/pO2lO6U6RQkrAxpzNb4+R1Zgplh?=
 =?us-ascii?Q?OpCXwpAo1QdAwTOJ2SKqS/zmkt/YPWf+Wl2SqVdnzLnfL6QgJMGAWhPNPfT0?=
 =?us-ascii?Q?YqEazK8w5EHig1gN9Z/pcYyV6NVIGjUGfM1ThMq2mB5cLWGNjpPdiOIJI5KI?=
 =?us-ascii?Q?r+qRDA5LmMpczHDxM/7b1J6jdzsWC+/2SHO1QxEXCPFcJG/QhMvbBZ4k/k+F?=
 =?us-ascii?Q?vmAJV64LMjC3vKY083o5Zee7K6P8W8mofLWr1kN2Bn/8/B9NFzhEAl3T7RyV?=
 =?us-ascii?Q?EOGlJgarOErewz7AVOu8eafq4OEdKrJT4FWzMTtBFwQl6MfYmidV74LIhcaO?=
 =?us-ascii?Q?q+Cegof7vxJPJ7CzlvyeDkxkdslt6rYc95gdFv4KQ1C+W9zDOP7fp+55bPX8?=
 =?us-ascii?Q?0SQnYV7c/COvN/VbD82DL/HY+gtrWbYH58h0WZjnkZN1fSBq7kFzJ2UYWyDR?=
 =?us-ascii?Q?bScUx5WlQdJhKYBk8ttIVht/cl4qpkaXVLs0UmaF4KUWIE5lPdhywfqlKS8Z?=
 =?us-ascii?Q?DE+HfnYHLTH6dFdGTEpdkhwsPK2lxw5KxSgl++cMraYGDpOpuo5kQYGgOTx/?=
 =?us-ascii?Q?gHslqwHjRda0olLAstr6EaYCBRIwreT8lJf+5kMGgDmuQpBm+dfcJa8VuFMj?=
 =?us-ascii?Q?FTIqMuJpyEMkbYJWEaEum2b7zXE9Ap+HeFmpzZ3qj5f1ob2+BFmA2dQO5NL+?=
 =?us-ascii?Q?RXS8Uj8ADf13XhOxEh/G1Iba4pZ8pJ1nZ/g42zSNBQW6UkQTCzbHtomiN0a/?=
 =?us-ascii?Q?Ql2b4xGFPAyOqQjIZgJhSjJIKz/Log89sLUx+yEaREc+z0cvVeygIehGI+Hc?=
 =?us-ascii?Q?BCUBm8QkLa7XLFhzmkit9w+S/ffQoNUxhJQ8yAmNmS5OtLSWTFNjhgj8JazA?=
 =?us-ascii?Q?D58O6JnsMJAK67RFt0Tx6nGQE0KwstvKlyyeGNytKDJvtRb2c7MguR/gDmDB?=
 =?us-ascii?Q?U1Z5yfWErDMiuGTyFCsEXzEsRiEciNo3tzXkxZTHA0yGgabRpf3+E6UoheMt?=
 =?us-ascii?Q?ZCcFZ27l5zzIGDRu49g5xJ18Ml7YNkToDT4ffAt4zWgwC/ntpZQ7N+ARQyMJ?=
 =?us-ascii?Q?khQWmGd1dgAXmuME2jFN/Hm6g9JZ3N0JPN0eOUlontNWjbjY/SXqQQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB5963.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0CTw2nXTcosRTKarypx3rs6+aaGF9NA/TT6NxLYsHD4akoRvcghZWkefgnnC?=
 =?us-ascii?Q?oHuE5BJvhSyUzagcG9nh6aonqOC1AJvNKBlgcmLz0I9L1A/mFaBymMRh0fBI?=
 =?us-ascii?Q?XzFNmu+WbhFV8sWkPHZHLplpsQ28IGn6f/VaS97obSL1B7lIn1LUMNTo1JlE?=
 =?us-ascii?Q?WbXxZkVbDCWr5Xu0v7F3Kc5gqLlRsaLQP10cTL84Gr01fLo7CCe9A/ZmtBS4?=
 =?us-ascii?Q?SC2pVkbTJCJ7hE+Xo6fgOeQFlzpJJL6egjHXf1140KOks46QUxkYA270NoVn?=
 =?us-ascii?Q?koaHTfVCICkGkN66BwugKz9mQEzHZhUs5Fk2jEE4KnybmGVqs4ey9vdroT+V?=
 =?us-ascii?Q?Gegvr90aZN7fR2MIZb9EJPHJhV5gj4lr59TVImp+JZ8NR/PVqkJEgzWLkX2m?=
 =?us-ascii?Q?PXRqUO4jpoqyPsw4Q61oWDmqCsfzR6xinUgmZY7ADvK4QUPAFpyLN5uYwznw?=
 =?us-ascii?Q?GvmFW4QSGVtpd9LAT5h614m35MC4aMim38wGfzhTeEOE2fn6fxIbhEkGFAon?=
 =?us-ascii?Q?u34IiTzf8urrB1SjmxUwH5JgZv6sRxbO94jMcVk30mVi6Zfp5STXpyzW2bQZ?=
 =?us-ascii?Q?djPPFPyqkcaZbnzI9DikPqp4Q8RTuIgvZhNzxz7gnQqxhHOa3VU9QQpPO3MX?=
 =?us-ascii?Q?yWThnCptS/Z0gmSAGF72VuNyzR3zHLmqBGp2WfYHzskRPXfWK/S/i6WMKF0I?=
 =?us-ascii?Q?MHPUM+cgqBfUo9dG8jSYOW2XNnP13NMMe9IrZhwsNyAGJHxzmtU28taSiR+C?=
 =?us-ascii?Q?6ZER7XBy7IEs9XcLL7Koz9A9bf81c5BSpbeHZotJF/dFgkRKIbiymeADUDLy?=
 =?us-ascii?Q?YI6TDionoGZDAvcsG88uWmNbYgH+jQXd6RXrnim/aF9XqpiPAbSHonCXRV/u?=
 =?us-ascii?Q?uZWvC9f93YGL1kpFDFSJHo3WZmklTzhsVBKWflWRBRaEzyoPrzJ4WLsZavOY?=
 =?us-ascii?Q?zpuuIKrFEyb2ivU45FUqyQJGOQun+SM2JrSYJkCeNQMkb1nVs/evUDPbQWtu?=
 =?us-ascii?Q?P2hpzpTycJ3cQ/fVCsKlc+wiDBkaVW6cyEMK6Ud12s+nIiY9+LxbSf+fGSqR?=
 =?us-ascii?Q?fXwc9nrIFkZeYPKEFxbJiXeZWF4cz3XTK9zhbPGIkkkDWDB7JQW0W82xObn0?=
 =?us-ascii?Q?FMphBL280SYh1W9EBWop6yGFExlXND9kaGiozl07ZFtt6kkqqeOVpOKsZHMm?=
 =?us-ascii?Q?rUHL58bRFCtt1o89lbsd598faGf96yuRIuPpcFFJJc574X7eO6YvYE2nGy/E?=
 =?us-ascii?Q?qnKcyFrU/1GwqpKIq7+vXNptc/wC+2tw/hQc3heEeTAvHOmCUw8Ef5oFE1u1?=
 =?us-ascii?Q?ZokazcnSHprddqfCRPpdmE/CDY5ulRrEEkB+AiXC+9YkXXWuJgMtvQ9+ZW1c?=
 =?us-ascii?Q?+Qi10v5qbMe2lZsbwG0vVUwFfHg5iX0WIFhRvW90Ffhx70O/w0HKShyLikk1?=
 =?us-ascii?Q?E4k2Z7eJa9MULmr8ma/CRxTN+zGZ6uHT4db5hRNK65s0MQNeH88WTF4B3HfJ?=
 =?us-ascii?Q?aWawM94ThoLynMq+/d2dV9L9w5xGP0nCuI1MB26SRC0HBbDy2BVnNjEuZ5jX?=
 =?us-ascii?Q?foiUmmIQxLjyBvvKjPEy8m/QNzeMOTcJpMp3S14saYsBU0xuc/OKUVSYLrT/?=
 =?us-ascii?Q?eA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c3eae364-91bf-473d-4920-08de3213386e
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB5963.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 02:25:26.8853
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0v3Vv8qYsVjF1wo/7R+nVlFUFJBAsJhoh3QcY4TcTiMB1yj4GoSiOpIjtmopiaWbQMeOlYp1Gr65RlENUMbyXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF1CEB6B7EF
X-OriginatorOrg: intel.com

tree:   https://github.com/intel-lab-lkp/linux/commits/Uma-Shankar/drm-i915-display-Add-identifiers-for-driver-specific-blocks/20251201-150245
head:   a475844eaf5f5246fea92d8289f2c8555f2c0c7e
commit: 48efaffc43c79a3f7b5fb6145876b14fe11b5ef3 drm/i915/color: Add framework to program CSC
date:   32 hours ago
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20251202/202512021600.Mshrv4gu-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251202/202512021600.Mshrv4gu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512021600.Mshrv4gu-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/i915/display/intel_colorop.h:9,
                    from drivers/gpu/drm/i915/display/intel_plane.c:52:
   drivers/gpu/drm/i915/display/intel_display_types.h:1993:28: error: field 'base' has incomplete type
    1993 |         struct drm_colorop base;
         |                            ^~~~
   drivers/gpu/drm/i915/display/intel_plane.c: In function 'intel_plane_color_copy_uapi_to_hw_state':
>> drivers/gpu/drm/i915/display/intel_plane.c:367:41: error: 'struct drm_plane_state' has no member named 'color_pipeline'
     367 |         iter_colorop = plane_state->uapi.color_pipeline;
         |                                         ^
>> drivers/gpu/drm/i915/display/intel_plane.c:370:17: error: implicit declaration of function 'for_each_new_colorop_in_state'; did you mean 'for_each_new_crtc_in_state'? [-Wimplicit-function-declaration]
     370 |                 for_each_new_colorop_in_state(state, colorop, new_colorop_state, i) {
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                 for_each_new_crtc_in_state
>> drivers/gpu/drm/i915/display/intel_plane.c:370:84: error: expected ';' before '{' token
     370 |                 for_each_new_colorop_in_state(state, colorop, new_colorop_state, i) {
         |                                                                                    ^~
         |                                                                                    ;
>> drivers/gpu/drm/i915/display/intel_plane.c:360:35: warning: unused variable 'blob' [-Wunused-variable]
     360 |         struct drm_property_blob *blob;
         |                                   ^~~~
>> drivers/gpu/drm/i915/display/intel_plane.c:359:31: warning: unused variable 'intel_colorop' [-Wunused-variable]
     359 |         struct intel_colorop *intel_colorop;
         |                               ^~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_plane.c: At top level:
>> drivers/gpu/drm/i915/display/intel_plane.c:341:1: warning: 'intel_plane_colorop_replace_blob' defined but not used [-Wunused-function]
     341 | intel_plane_colorop_replace_blob(struct intel_plane_state *plane_state,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +367 drivers/gpu/drm/i915/display/intel_plane.c

6f60de67d7e4ae drivers/gpu/drm/i915/display/intel_atomic_plane.c Vinod Govindapillai   2025-02-28  339  
48efaffc43c79a drivers/gpu/drm/i915/display/intel_plane.c        Chaitanya Kumar Borah 2025-12-01  340  static bool
48efaffc43c79a drivers/gpu/drm/i915/display/intel_plane.c        Chaitanya Kumar Borah 2025-12-01 @341  intel_plane_colorop_replace_blob(struct intel_plane_state *plane_state,
48efaffc43c79a drivers/gpu/drm/i915/display/intel_plane.c        Chaitanya Kumar Borah 2025-12-01  342  				 struct intel_colorop *intel_colorop,
48efaffc43c79a drivers/gpu/drm/i915/display/intel_plane.c        Chaitanya Kumar Borah 2025-12-01  343  				 struct drm_property_blob *blob)
48efaffc43c79a drivers/gpu/drm/i915/display/intel_plane.c        Chaitanya Kumar Borah 2025-12-01  344  {
48efaffc43c79a drivers/gpu/drm/i915/display/intel_plane.c        Chaitanya Kumar Borah 2025-12-01  345  	if (intel_colorop->id == INTEL_PLANE_CB_CSC)
48efaffc43c79a drivers/gpu/drm/i915/display/intel_plane.c        Chaitanya Kumar Borah 2025-12-01  346  		return drm_property_replace_blob(&plane_state->hw.ctm, blob);
48efaffc43c79a drivers/gpu/drm/i915/display/intel_plane.c        Chaitanya Kumar Borah 2025-12-01  347  
48efaffc43c79a drivers/gpu/drm/i915/display/intel_plane.c        Chaitanya Kumar Borah 2025-12-01  348  	return false;
48efaffc43c79a drivers/gpu/drm/i915/display/intel_plane.c        Chaitanya Kumar Borah 2025-12-01  349  }
48efaffc43c79a drivers/gpu/drm/i915/display/intel_plane.c        Chaitanya Kumar Borah 2025-12-01  350  
48efaffc43c79a drivers/gpu/drm/i915/display/intel_plane.c        Chaitanya Kumar Borah 2025-12-01  351  static void
48efaffc43c79a drivers/gpu/drm/i915/display/intel_plane.c        Chaitanya Kumar Borah 2025-12-01  352  intel_plane_color_copy_uapi_to_hw_state(struct intel_plane_state *plane_state,
48efaffc43c79a drivers/gpu/drm/i915/display/intel_plane.c        Chaitanya Kumar Borah 2025-12-01  353  					const struct intel_plane_state *from_plane_state,
48efaffc43c79a drivers/gpu/drm/i915/display/intel_plane.c        Chaitanya Kumar Borah 2025-12-01  354  					struct intel_crtc *crtc)
48efaffc43c79a drivers/gpu/drm/i915/display/intel_plane.c        Chaitanya Kumar Borah 2025-12-01  355  {
48efaffc43c79a drivers/gpu/drm/i915/display/intel_plane.c        Chaitanya Kumar Borah 2025-12-01  356  	struct drm_colorop *iter_colorop, *colorop;
48efaffc43c79a drivers/gpu/drm/i915/display/intel_plane.c        Chaitanya Kumar Borah 2025-12-01  357  	struct drm_colorop_state *new_colorop_state;
48efaffc43c79a drivers/gpu/drm/i915/display/intel_plane.c        Chaitanya Kumar Borah 2025-12-01  358  	struct drm_atomic_state *state = plane_state->uapi.state;
48efaffc43c79a drivers/gpu/drm/i915/display/intel_plane.c        Chaitanya Kumar Borah 2025-12-01 @359  	struct intel_colorop *intel_colorop;
48efaffc43c79a drivers/gpu/drm/i915/display/intel_plane.c        Chaitanya Kumar Borah 2025-12-01 @360  	struct drm_property_blob *blob;
48efaffc43c79a drivers/gpu/drm/i915/display/intel_plane.c        Chaitanya Kumar Borah 2025-12-01  361  	int i = 0;
48efaffc43c79a drivers/gpu/drm/i915/display/intel_plane.c        Chaitanya Kumar Borah 2025-12-01  362  	struct intel_atomic_state *intel_atomic_state = to_intel_atomic_state(state);
48efaffc43c79a drivers/gpu/drm/i915/display/intel_plane.c        Chaitanya Kumar Borah 2025-12-01  363  	struct intel_crtc_state *new_crtc_state = intel_atomic_state ?
48efaffc43c79a drivers/gpu/drm/i915/display/intel_plane.c        Chaitanya Kumar Borah 2025-12-01  364  		intel_atomic_get_new_crtc_state(intel_atomic_state, crtc) : NULL;
48efaffc43c79a drivers/gpu/drm/i915/display/intel_plane.c        Chaitanya Kumar Borah 2025-12-01  365  	bool changed = false;
48efaffc43c79a drivers/gpu/drm/i915/display/intel_plane.c        Chaitanya Kumar Borah 2025-12-01  366  
48efaffc43c79a drivers/gpu/drm/i915/display/intel_plane.c        Chaitanya Kumar Borah 2025-12-01 @367  	iter_colorop = plane_state->uapi.color_pipeline;
48efaffc43c79a drivers/gpu/drm/i915/display/intel_plane.c        Chaitanya Kumar Borah 2025-12-01  368  
48efaffc43c79a drivers/gpu/drm/i915/display/intel_plane.c        Chaitanya Kumar Borah 2025-12-01  369  	while (iter_colorop) {
48efaffc43c79a drivers/gpu/drm/i915/display/intel_plane.c        Chaitanya Kumar Borah 2025-12-01 @370  		for_each_new_colorop_in_state(state, colorop, new_colorop_state, i) {
48efaffc43c79a drivers/gpu/drm/i915/display/intel_plane.c        Chaitanya Kumar Borah 2025-12-01  371  			if (new_colorop_state->colorop == iter_colorop) {
48efaffc43c79a drivers/gpu/drm/i915/display/intel_plane.c        Chaitanya Kumar Borah 2025-12-01  372  				blob = new_colorop_state->bypass ? NULL : new_colorop_state->data;
48efaffc43c79a drivers/gpu/drm/i915/display/intel_plane.c        Chaitanya Kumar Borah 2025-12-01  373  				intel_colorop = to_intel_colorop(colorop);
48efaffc43c79a drivers/gpu/drm/i915/display/intel_plane.c        Chaitanya Kumar Borah 2025-12-01  374  				changed |= intel_plane_colorop_replace_blob(plane_state,
48efaffc43c79a drivers/gpu/drm/i915/display/intel_plane.c        Chaitanya Kumar Borah 2025-12-01  375  									    intel_colorop,
48efaffc43c79a drivers/gpu/drm/i915/display/intel_plane.c        Chaitanya Kumar Borah 2025-12-01  376  									    blob);
48efaffc43c79a drivers/gpu/drm/i915/display/intel_plane.c        Chaitanya Kumar Borah 2025-12-01  377  			}
48efaffc43c79a drivers/gpu/drm/i915/display/intel_plane.c        Chaitanya Kumar Borah 2025-12-01  378  		}
48efaffc43c79a drivers/gpu/drm/i915/display/intel_plane.c        Chaitanya Kumar Borah 2025-12-01  379  		iter_colorop = iter_colorop->next;
48efaffc43c79a drivers/gpu/drm/i915/display/intel_plane.c        Chaitanya Kumar Borah 2025-12-01  380  	}
48efaffc43c79a drivers/gpu/drm/i915/display/intel_plane.c        Chaitanya Kumar Borah 2025-12-01  381  
48efaffc43c79a drivers/gpu/drm/i915/display/intel_plane.c        Chaitanya Kumar Borah 2025-12-01  382  	if (new_crtc_state && changed)
48efaffc43c79a drivers/gpu/drm/i915/display/intel_plane.c        Chaitanya Kumar Borah 2025-12-01  383  		new_crtc_state->plane_color_changed = true;
48efaffc43c79a drivers/gpu/drm/i915/display/intel_plane.c        Chaitanya Kumar Borah 2025-12-01  384  }
48efaffc43c79a drivers/gpu/drm/i915/display/intel_plane.c        Chaitanya Kumar Borah 2025-12-01  385  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

