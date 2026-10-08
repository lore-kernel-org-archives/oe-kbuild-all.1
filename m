Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB63349B5C6
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 Oct 2026 12:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791462972; cv=fail; b=DFBDf3SU9PukPcbHheHs1bOD32lA1qqjmEq/JHE2aC4ZoXiTjqrRmTxQqVGrf24vjmjaEOlrJ1zbFTeF024UNBWfWenWcW3/kU1X4M2A3IZUjPYHPw1/Td/w6Yvmii+o45694Rw7lKvO1Y/SAbZ13ogu3a7BvLGCRuI3Chkl10k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791462972; c=relaxed/simple;
	bh=Jp7tXQQ/oamqMtsGS2CtU18fVwcGaTbw58GeW+0BTtI=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=PPlwywQow3+uOIfqLzn4/Zsg21fRQELuuXxgctF150zvtHMoUW2Sgi4FNbmGdK4Zk7GRarXDLPSFqsIp5dCAm/92VjLxAs5Y6jYqubHZgBAbGpsxiP4HvI3GPkXhsbKjsVJIgLmPyYzkbVl/jmoFhaIi4OqgTHg/pMRAEhNXPaU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b1+f+S9L; arc=fail smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b1+f+S9L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791462970; x=1822998970;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Jp7tXQQ/oamqMtsGS2CtU18fVwcGaTbw58GeW+0BTtI=;
  b=b1+f+S9LWibipS5Adt6irlYeFTZO9p45Hg5dPPuV63EG7JaJMdAfzonc
   jijj0+FZqAaby4dQDnLvDQPm3ybg4+6lubqSNTkR4PKGfFpvKJKjkL0cQ
   OqSCNKZtzK0M8bu/ba8FLls1j9JYyc0eJdjx/LjBl326VAhRwUW7WWQh0
   Aln+KkP+3p2l18lymcSzrNmScA5T1Yo1jkohEMNfzfaytlYt/QYb4e9n8
   DsMc6jMmnukQuYJQf6WfT9stQ5qKgI53S4Tobad2EOMxAyPWK/+DMBsh+
   Q4v38U9LSKTQNe+8FKj+Y+O1I8rvX7GdFF2kKKBwNxjul8hbvr4tS18VC
   g==;
X-CSE-ConnectionGUID: lWpRLoZsRNqWB++vjg3VAA==
X-CSE-MsgGUID: f2Y98cMURk+E9yBt7CakTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="238846"
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="238846"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 05:36:10 -0700
X-CSE-ConnectionGUID: 2al+G6SKTNOJgMernAoRWg==
X-CSE-MsgGUID: 0izEa5dfSMaQhR+ToE3qgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="137777"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 05:36:09 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 8 Oct 2026 05:36:09 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 8 Oct 2026 05:36:09 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.10) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 8 Oct 2026 05:36:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CZbSGXAqtY3i8Nqs/+Aww6vEvmZN9JTUxfOb9bWgtkclXdWNvl3FR+6v83cOtHXoswf7PU2bgITNS/1tiqGfrFqWi9/FYYsX06KqDEM8dPIGwvjGxdGM0cuGnxiL90GZEhv/Rtvwe4ZajQgRvarMqqvk386aURWXx5M7TeQNYr5vQzfFT7nvOB4/099qvaP8MNGPpPnBxWrSz1VPZyATINQa/h8el39+t7j8/ePKVaBvPHF7VK+H9QI50yuC7N44kF4cEaoiEfOdhSVn6UuG+wjK9Xw1tpEhVPStE6RoDis5demasQF+/KPnWLpwcQcq1+Vu4mtZoloBEFpGjiqStQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n66IPc2+s8T5UCb5C0dxpx5lPJ0nv6OiULXBmo0yDrU=;
 b=oPfdd+rQNoboxtA2qu26dMn0+CwsKKfuhKx4TWUepUjzsOnLpKdtfl1CSeaaSr0AGuOkTbUW0jR2fQtukrBMZiJrH2j62tqrQ1nHjAeGqhiFcBIDrkRYEmbNj4HSz0AiJ5BSwNYSzTw86s8f4W7kVfCX02SFRE+O9vtLbTHLFRE0LqORnCa4HI4AyKySGknKA7KwfAiUM5zqUzl0ExhBhvV6gYE3LMSRORVit6ewVWOPVfthu+bIDnMRkvMhJ//pgcbOVGk/Qfbrvpvz/cGXkXCVwYYF49fx0jFV81dvCWL3daj3XgaQ6igDcJMdiFTaGTt5tPwyUqEq3AfhmfyP2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS6PR11MB362586.namprd11.prod.outlook.com (2603:10b6:8:4c4::14)
 by MW4PR11MB7102.namprd11.prod.outlook.com (2603:10b6:303:22b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.16; Thu, 8 Oct
 2026 12:36:06 +0000
Received: from DS6PR11MB362586.namprd11.prod.outlook.com
 ([fe80::71a6:38f9:43ed:8f8a]) by DS6PR11MB362586.namprd11.prod.outlook.com
 ([fe80::71a6:38f9:43ed:8f8a%6]) with mapi id 15.21.0496.015; Thu, 8 Oct 2026
 12:36:06 +0000
Date: Thu, 8 Oct 2026 20:35:58 +0800
From: kernel test robot <lkp@intel.com>
To: Jay Wang <wanjay@amazon.com>
CC: <oe-kbuild-all@lists.linux.dev>, 0day robot <lkp@intel.com>
Subject: Error: failed to load BTF from vmlinux.unstripped: No data available
Message-ID: <aseOLpw1sbbJbS2c@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: TPYP295CA0040.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:7::12) To DS6PR11MB362586.namprd11.prod.outlook.com
 (2603:10b6:8:4c4::14)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS6PR11MB362586:EE_|MW4PR11MB7102:EE_
X-MS-Office365-Filtering-Correlation-Id: e7ffee8e-ef62-49fa-47e3-08df2538b901
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|10067099003|56012099006|6133799003|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info: TzgSETlegfphOMA18fKxvphjW7j6y8WrCijwyqCS0Sn5DtsoB2cLrcabhluvZFOS0JlSWX/+Wtue6Wl49WumtC5uKxeHiLg8AJ3evkoq2DGNS8247y6O7DVaXlCXh96a5KBZ8+0PVmd0LWcFeOlARNB5r0AVK1vOqHNALyCQ/gGtPd+hxQFTS1ZXargtCHWASGIQnl9o6jpS/zUAlvtSoQcTGNhFTkBqkPMdNKfhTiIDhLyIL6nWtLuhoBYDhyNZRqBHhyGvYLJc7urV6+P5bz4MwzTHQTwmr0UM/liJQR/s1OQeza/DfDzqMH5NW7F0CcVkVczG+Q/x9iQt46iW29C9gYaUao8z85BuLsTns63Boiu6/jiuvFVQRwc27HsazZl291CVGWBdQXt19hiBL8C0FKZyzJ/gsnw5kfTmHycEWy/81R1TpL0MKqfMSk5x9uBMSOjQnBL3ZvyaA3A3V6dBdALh4NvESHUCi6nhJraw4UdTesQKlMJG6jh+f7tBJeyY7cjUbNPS4CoYfQxOLRmGP0fDi2wi4yhmfYATU59b+xrxsY4lAvBdLkAkoQI9kcVbZBSZE6O2nnQOlbROP/dob0Y3+9AJf1g5Gwfw/l3uyf75Hg5NdoREmFE0flKZ
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS6PR11MB362586.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(10067099003)(56012099006)(6133799003)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?w45FZtBXOLSmSsEubX5NyWdk9KFqqFUnI4S9XVr7INvQMYf6yJwMMZ8ZVbC6?=
 =?us-ascii?Q?43niUAcLtOKMd7T3O2BdQfLukW6aTjTstVCkScQuAEyQ98SM/gFw5oojT0QI?=
 =?us-ascii?Q?6fa5UOfErHt3NgGsFLj48EiTToqJJiXzjqqJP10Lb9gr98g29x1W1TOt9CAb?=
 =?us-ascii?Q?q+S5RZUPcqQc0IGIwbfIC+QgdkBWEdBVlgrj9akhVcE7vMTdeL1SE19Zh90n?=
 =?us-ascii?Q?+XfQ4vQlwXMXtDx4YjjNGt/A36TY3OHszY+Lj1k4rzhP68ok2hhwB6uU3Cwr?=
 =?us-ascii?Q?551HIq2EayqEJht0TxuHNKkyc7yNKnAQeUGCkdfOGsuifInClJdxUi1ILmS2?=
 =?us-ascii?Q?nxby3xH+lu86S1qlj3EP3dq5hpApkboi5+XvZ3G/k2YrPW9SixhMrdHG8J4y?=
 =?us-ascii?Q?Hz65KgPzpc0EDSTUe3fRTdOTZX2Tnk3NbQFhmtRg5b6cOyqPOxdy+So4F+9N?=
 =?us-ascii?Q?02Vv2ehVL69ZO2iEekksjD/qEqLOgcgKOWbeWg/ZY4eOMSQnDSKaZRRG9b48?=
 =?us-ascii?Q?JFta1Z4eKRttGHTv3YoBN81XdA3j/lO8U9wGOA9n6eC/7W6kqsboKnPJcUy0?=
 =?us-ascii?Q?nKjaNzYJk5H/7QE2rgi/71egfnU9cEgFSZsDZu5WWsqWwJ98uGPlkCqNmzjy?=
 =?us-ascii?Q?wPPi2pHVDB1NPrTMgknwmv0lD07t4he/wXQMFXS1s0VC4fKsUWdz3jFxcta0?=
 =?us-ascii?Q?seAkbv+15iKM213crc5Hph0XI1vG7m9t0Xik1R5xvbsSmWjC9+g3KRBUXUKj?=
 =?us-ascii?Q?hXHgPyEEyNhoZYEpTfu5WfwiUf6sk4GwQsfoI6KJWuQPMpGrw9UhkX8wZcQL?=
 =?us-ascii?Q?/cL4MTd00hsqDaWkB4oQWIVA74DCO9syChlSG2OSyQCzNTq7f71VKcbD2mcd?=
 =?us-ascii?Q?eGLt9Aq1bdkDx9X/f3C0lvJBIo3R3Uq0T4Pe8Jebmrlz1pnTnWaDIHgF3pxh?=
 =?us-ascii?Q?ah9g+gOgxpUvzcFtmC2ocZ9sDlqRu7SKk7shXWvSZkVUfr7nxExJo8UkEM1H?=
 =?us-ascii?Q?s9SPw9zMK3YlbuwlyAEXN9MsjRbghqyjjoYbPcR/oDqKyrt72f2YuapHJnCf?=
 =?us-ascii?Q?UTj/UQi1UnW9XTolWDWeyLxS+LppRVHcKPXn5vuIs23pxSrXVzSHQrqtR30C?=
 =?us-ascii?Q?Y0pOIDz/VTYOk6D99Fr+UBg5BQTnsBU1ZcSST2+78/zvLtdCViQNVTT0z6XU?=
 =?us-ascii?Q?xSfOs15CffleV6OuoFJIV/T39T87IR7QsrtelUdRTSIcV5YHZVTNhAi3UFfz?=
 =?us-ascii?Q?CwyiST8DRVf6fiVEvqABws8nb8JNTHLOoaZNvL3uaMB3C4iSYkS7aBH4OV7j?=
 =?us-ascii?Q?XTdCKJfhKjjwLf6kdyTGEd23AJwe7cVGcSefYnjWp+UDeS/953GLenBySa5m?=
 =?us-ascii?Q?PpBT0TrcIU59F5ka5ChwRE6mjYUj8u+gLqEwPWjh+DY6dlhdDSDIvq7LCKUh?=
 =?us-ascii?Q?+aHsLm9L1ojs8lRUlv2ygmxgnj9E+qFNbFGH722W00j119wb5pI/fcasguP6?=
 =?us-ascii?Q?8NPX5y0cmxiESKafAug4rO9+LAwI0kX0zpoHbN/KNQyWxEleU/3iQodHZ+dr?=
 =?us-ascii?Q?yY8KLBfQPb0JHVL1Qt2jM/zYD30NXR2BljHZ6lGJNFUFuMEi3dpubmqgXX7R?=
 =?us-ascii?Q?1czQy6j3aJ4JiMVQF853GOFgVs8XorF94TPfKfjLQ3xfjxgXsZ0JFRbb77Nh?=
 =?us-ascii?Q?lLezAeEOn+47NmSDDm5nlcekrvwU+gKUhXcwMwslxXhHmkoyJB8/XDiTCNqD?=
 =?us-ascii?Q?dpXATrnaXw=3D=3D?=
X-Exchange-RoutingPolicyChecked: uVZ7J3aS1Owi4gh1dtWT1Ji1CtCpSQ3ACQML3AGyE6UoOm9DpSnr7byDNc9CHsgukTEaT5ALSVaTvRm4vSlMIpF8+VkZW3iycb7YtUdX3upwkHM0mQyScfcNnxiwXrsp6PexEXFEnrjBOoGf6ARfXhXxUXBn+EqcRHXPTaPtkpLp7QCaeeiLA7LrgEHzT3UhG4ej2H2nF+THXfc/a5N42r118fEpGMSH3x0imUINrPeWORq3inNDg0ehlpeCu0Z7rTP76CgEZ/WHldFaJR2eniPcp08f4us3/X6/vDAbbnxNbECX738wzyXLhynpay7Sl2YlIaW3qOQNSA9Dv+hwag==
X-MS-Exchange-CrossTenant-Network-Message-Id: e7ffee8e-ef62-49fa-47e3-08df2538b901
X-MS-Exchange-CrossTenant-AuthSource: DS6PR11MB362586.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 12:36:06.5458
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iMENWTAbjZNgAwvyRtcWq57gkmbNtEFlhjKgsQ/iFeBfrk855gGnLAw3Q92u1oh5gw2YQVV29LyfN/uPgWQj1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7102
X-OriginatorOrg: intel.com

tree:   https://github.com/intel-lab-lkp/linux/commits/Jay-Wang/bpf-pass-the-vmlinux-BTF-to-btf_parse_module-and-let-it-adopt-the-data/20261001-225203
head:   cd8e398af7bb2a5c3d30c3409db280b73d23047d
commit: 974f6536dd081d120bd276dcd1ff24e304cc9d32 tools, samples: take the vmlinux BTF from vmlinux.unstripped first
config: s390-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20261007/202610071800.1GjXnbR9-lkp@intel.com/config)
compiler: s390x-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261007/202610071800.1GjXnbR9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610071800.1GjXnbR9-lkp@intel.com/

All errors (new ones prefixed by >>):

   libbpf: failed to find '.BTF' ELF section in vmlinux.unstripped
>> Error: failed to load BTF from vmlinux.unstripped: No data available

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

