Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A357E2874ED
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Nov 2025 14:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763823436; cv=fail; b=Xq6pH5QpjKuw06LhLHyFdozNmBYArXpsdZ3I2uQ6tE9PnFxNtXALBWgNJLmkN680xTrypTjFfqA0TtrdscSow1RzefQX9M33uenGmsceJ4aJ1ppb2LMviQuiaKJ2pqbXWJt9hR/YqlSndkMHIj5mJ21kxpzt8XuUDKMdVuUz3uE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763823436; c=relaxed/simple;
	bh=ndKo1OiS/c+E8rDjvYDRt78fT8lSbl2J5n6sYWrXeYg=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=bP/RTeeE0czUBFGVfvh34XYKRUPjP/aWugGm6z/jOeDp30HwSqRiexphDRZPqCXJ6tf5O35TPlMRbOEJl8v+nX3AtLSOeCikm2JlLwVqlui0L0D2SQh/nAyubLUR26ylerxr9JTzIRTJoSBOdUGi5d/FKvCgPNPFnqmCl+fpEzQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l/3ri5Ez; arc=fail smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l/3ri5Ez"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763823435; x=1795359435;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ndKo1OiS/c+E8rDjvYDRt78fT8lSbl2J5n6sYWrXeYg=;
  b=l/3ri5EzAT3bvNCnsKwZlcm0Edkcu0lHWyTAtYLLjrK8oD/dgX2JO36x
   A2xJDdCYHzHH8UtdgVU0+S24MG+qODkKBjNfJ8eCs562qIU8apr7RAEcS
   PnAU6S9GC3iAGhfPjL93Ae8lSsWZuqpbSFmbpK4WJFO71LH7vrqssp1MA
   gf7yuyXIjHZOSULCZvwuLLl7m/Bc8ycYAkz73Nchg50QcqREmF4NAncDP
   5dgVDSIowhtEA/rjq6e5zsrOH2xuno3kYjOsqWXWzhDVgZVV9WYJ4A5Xa
   P3XQY1bgBng/g72OodV71RRNacOOX8dEwwS3wqyLpfXTE7VuOIXJf23Ny
   w==;
X-CSE-ConnectionGUID: i7DVkZ8BSgq89LbMFRdnLg==
X-CSE-MsgGUID: zeFfDBYRS0GU4MG9Jqd2Hg==
X-IronPort-AV: E=McAfee;i="6800,10657,11621"; a="77364519"
X-IronPort-AV: E=Sophos;i="6.20,218,1758610800"; 
   d="scan'208";a="77364519"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2025 06:57:14 -0800
X-CSE-ConnectionGUID: 7dEKnEi5SWCfApu2NNIAdA==
X-CSE-MsgGUID: qWBwiNumRpCRts4eLf/ltQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,218,1758610800"; 
   d="scan'208";a="191962256"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2025 06:57:14 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 22 Nov 2025 06:57:13 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sat, 22 Nov 2025 06:57:13 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.59) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 22 Nov 2025 06:57:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rMzoYKpkOZh4PjF6HSJJegj8ZAkxo9zvJuXRT8xx6KlsgKlgJnVo+ZU4lWC7RiAG5kJlCKVDcgDQSskNe8nsbTSh7MuSf1rLINwetnpV9tRT+24fCuyp7MZDUR2mgurZJc8tz1do23KL5YAcnF/MYdoyOu3E6PVl0aK/1xkBG1nCohCZvTSBYzMEv+XcHmFvz8lDTpn6cMggqJsNDpXDkD8Ka0ZcW0KxELYQ4H/2mRtWQ+1rzx1OWxvq7kv0XBbS3HnIeTbVoERk14WrSX4xX8hn0vfeZjYMlUV0JnZX3e5C3vXNW/4FTBjGO57CAtHcfyyZq7ZmM63KTiG8TCFN/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pchyAVjwyHKlJ7fAov6wDrnF46SEiCqrhmnm4BYP6bo=;
 b=iHWxzUjYe8S1KQNs3lRv1BcuUEQtUs3hYOUqPuYR2Uio6VBmpVptMnZ6YcYONAozIdyjD8mMPeIuN29Po6AxkPTYOojEGxHU0OdQF7OU1wXJRJ6IDse6fWeVdeTKGnEtJADLAf7EJc5I7M2yhlIzSp4+2/5X1at6/fFTrgmkZDUZ2ZbpMTdWitMwyByG25RQaNKwuURFTbMiPVHYtFyvnPmdDydP14S5pcsSytYao93MKUABNI+wnAtTrBjl4y1ABVBuzAmsgpBxUw2GkcC0swMis7RJwMZTnehK6CA7/vqD3OshFipMM1LjlNjRKRJas7mkp2j2O5zvAh9GgJ35eA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4165.namprd11.prod.outlook.com (2603:10b6:a03:18c::26)
 by CH3PR11MB8545.namprd11.prod.outlook.com (2603:10b6:610:1bc::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Sat, 22 Nov
 2025 14:57:11 +0000
Received: from BY5PR11MB4165.namprd11.prod.outlook.com
 ([fe80::3876:1eb1:8e84:84e7]) by BY5PR11MB4165.namprd11.prod.outlook.com
 ([fe80::3876:1eb1:8e84:84e7%6]) with mapi id 15.20.9343.011; Sat, 22 Nov 2025
 14:57:11 +0000
Date: Sat, 22 Nov 2025 22:57:04 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [jolsa-perf:uprobe_mov 6/7] arch/x86/kernel/uprobes.c:1496:36:
 warning: unused variable 'opt_xol_ops'
Message-ID: <aSHPQGHri9rVVihM@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0174.apcprd04.prod.outlook.com (2603:1096:4::36)
 To BY5PR11MB4165.namprd11.prod.outlook.com (2603:10b6:a03:18c::26)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4165:EE_|CH3PR11MB8545:EE_
X-MS-Office365-Filtering-Correlation-Id: 61f5f572-f68f-4e0c-278d-08de29d76a8a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?LIRVPtYGCigAHMFTAlhqEvNmfc9x7uvn6fOkT7HfxcxmDP2POqRZ3TycI0nq?=
 =?us-ascii?Q?+zJb5AXtBCaEsaRcqCo7kqlzMZZrpeKJwdWvc8Q65kWco/h1m4S1fkjSBYf5?=
 =?us-ascii?Q?1QMNyqd9KuGZjnP/PFYjaO7gF4CZ4ITt7CplVbNjWvedKoxbueuoZJTD02Ob?=
 =?us-ascii?Q?nq0lsXTooKMf7cVIt1M2pDpRazlX+IB+kG9rvrZpu1AbZxj1SCoCuAA7rJXW?=
 =?us-ascii?Q?Z8liV/iSGS0EHasAOSVFsM2YOpZe7caO0Q+fF1ivXlvZIYzmOiQghk4zJyU3?=
 =?us-ascii?Q?ue/Aaf3uNDOJhIX6bVeUSRpnmrfRjkHNjPm24hxCJE7v3buM5gBGchuXVCLR?=
 =?us-ascii?Q?9b0a0ykhTIWMOFi0HFcDhOSX6Rq0GgE+uvlyJXJfGtSLx2wVX/1F++WU0Hjk?=
 =?us-ascii?Q?9JwEQG+jw4W4BVega+AUC/UrBaM7OJbZoMmoVB90xp0WIcSafS0pOBVTlxOT?=
 =?us-ascii?Q?3gDnCAnVbzwAWY/eHn29M3CJM2r71sB8MEYNssxNK0fxZXpuAjN4RtMhVc9R?=
 =?us-ascii?Q?TeTrrv+DEjlPQjtuCkXaB2HgwdhsO4ImRaq7SejviMwkiHflgAyv3/TJRdrp?=
 =?us-ascii?Q?TN2D2lV/dwdmSerrYfMFL+ykk8dCFgg00lmwKnKEaoKN7wdkW9Bz9M2torVl?=
 =?us-ascii?Q?40yLMdFSzvPqSZvL8MMi3thZW6Gog8t+O9iso6frjQVXQGiXik/pBKc+vxoU?=
 =?us-ascii?Q?oPRvw08kq/H6yjpMBHfSeUscTvkh3n71JVHv3hNipgNBpsk9NkWe0JoKct+P?=
 =?us-ascii?Q?sI680GZqDq+rW24weGfDTUTv4gwjuwuX0Kc74u5TVCT7Ua6IRCOXra3CDcHs?=
 =?us-ascii?Q?2Q6cKRjSF926zgfpx5812++jQIv1RXqFwKXvI+mHKgfZS5vw9xk37H6VbLe+?=
 =?us-ascii?Q?LdLNq4gn32oSU0r+ALttUR28c1qRDQEw2gnDmYqH79eMirDNzjt5Kau45f1P?=
 =?us-ascii?Q?DHYncf6bhuEVhjkAu7pQQgv+R+FHHBOlHAtnO1ZQliJOkZP6OoqZ0Sdb1CSV?=
 =?us-ascii?Q?rpWVVG1uIiPmnEXECX8IhgB5hZ8zqKOToedaDKoGUppBcQ20jLNMnR4rEzmS?=
 =?us-ascii?Q?+43Uh5GD7AsalbfD+kIp4qpsptkE/LHfdhJzLJnvk9OvcKG63H4zzGuudPTS?=
 =?us-ascii?Q?B2MIdwZ11moB5b4Ngyqn6Mif08UwgJNj6BrcBl2y1DNNg8t8sLdBJOWFPGLT?=
 =?us-ascii?Q?Rf4vN6Lhl6GxY7zOPcU4a6QckWigwHHGHcJegaCpMqmJr21nPJzZIk/BLk2/?=
 =?us-ascii?Q?koevyBhJWq5AXgIsHXs/T7lI1mJimrnQZzxXzA0D8KnBHdzGnSmsMRQjNQ54?=
 =?us-ascii?Q?/zjyhgis4J4cdqRZO+MvYQdWyLlLc8II5Jb/tCi5DeMkSePCTrUn8Gq9PIME?=
 =?us-ascii?Q?p/y06/2kh3hr+LftGwHMzN6PP7ZecC8qJAl3uBiA8A7g41r0WJpIpkjGmFmV?=
 =?us-ascii?Q?7m0+qfMU5YLqjOIHWcJuqylDgKDKMll7qc8rP1aDjQL4IfbCwB/+9g=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4165.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RkTSDAn/16+g50l1h0zuROYVOU/khRMheI7E8oT1Y00sigRfWeiFn0E5o9+1?=
 =?us-ascii?Q?4vnGbF65thlCy5X2LcRpBJxUgvz6tMuTtucJ1g0Zkk/HMYgQu6E5G1h4Og7u?=
 =?us-ascii?Q?/Yo4/kvF5bs1x6aRuVTjsKxP7J3/EA5OdUnw5v458B8qsUj0UG2kK5ho/6xt?=
 =?us-ascii?Q?P3YJlQA/KwSa8TBwanLzQnLADroylRF3RTeIYXvmiruVC5feqcnGjHS4k+h6?=
 =?us-ascii?Q?p8tRKcv1t9Iewxm4LD+lz/WgLVE79aAeh26PPdoe2vwxaD1J2k1nT+gAhziV?=
 =?us-ascii?Q?2hJXiUoNOo3oxbLsL8Ck/k2HFl0agQREfSmOXd6/XzEp60pIRV0ZyvY++Lly?=
 =?us-ascii?Q?mDkmtcbgybqyzJH5S2OCyNyWI87n3qF5JKkgjQrWD1+bahxOPjAlrE2FHERC?=
 =?us-ascii?Q?c5W3GHd/jOLN+KhQnmLuYHlK1lVJOFbaHeJz8wwkuXQaM00LQJRIYY44k60/?=
 =?us-ascii?Q?6AwQAz3wS1VVi7EWJOwASIHF+f5RSb2N7LIBJ4NHTrUCTZbqUB1erF/Fl3Sv?=
 =?us-ascii?Q?BAwRofAh6xAUZFdFBHeRtw4RFFKX6kYel5Lc3elgxkrdmOdIvmDD7NTHTuPc?=
 =?us-ascii?Q?bxhjwjPKSnqzDiDMEtEBNp/KOkJISRIz4nVlIl8EZEoQqrI7SAnRGrLn4FOs?=
 =?us-ascii?Q?P+Rk9mwVu1qCVSByQjm+8i/OmJpccHfRMewud4FxO9YHSrVRk2hl534yDNgw?=
 =?us-ascii?Q?ivwMC2J4aMg2zEHGN8yvW/PtmdQgyO3eEn6BXjUHwLhsTUQ++dcuvDDNdiuQ?=
 =?us-ascii?Q?FCR15+J31jBhrCtcPqBU1sV+p2l+l6a41QYsmC72T7D3s7pve1ziAjllFswN?=
 =?us-ascii?Q?I/btxvQ6iV6DhK90jb8ZPIe93Yunpt3lhaciZqB4cIswjQM19YU/LHZoqSoi?=
 =?us-ascii?Q?7LRLk7Gapn7RGOTlZNS35gGkyy2OkTW/teb1w8Xstsecn/BSr1xL2NfpQYvQ?=
 =?us-ascii?Q?p6yi+4Nwg0cu5nc+H9llUweut1rzI2qXcFK+LItUA22nV41WWf0+zXYTByi2?=
 =?us-ascii?Q?2BUSOu+JnRtVLuEP6qAd2uxJVny10LBQaIO6EZZmH4Ts73dJ2KHKtxAA9FMI?=
 =?us-ascii?Q?IkqO7MUJYRmb8RqMXEs9LS3uG21F+5qFradvJ/TUJS6uyNvQLyee2sYtsljZ?=
 =?us-ascii?Q?19TehMtAchpbWlO6Tw4L0aSHWQ5b0JYuhN95E0WRTZqReJZB7pauLSs5LsNN?=
 =?us-ascii?Q?Xk+nFXbie64RFQYgOkBUCJMMLE2b7xNiNtYZjVchBkQcDgZynx8FPsVlc1wv?=
 =?us-ascii?Q?uLHzm+O4l75f/unLli2eKXFdVnHxdJCPfsffFIqT+9O2PEDNeDYVqI+3XuRG?=
 =?us-ascii?Q?v/nCRJfR4BW6yuhEecKFFORZ6rCmKp9STXuw88jcCbCwrsyUDo5N6ONvtrqI?=
 =?us-ascii?Q?mZ0yKViyH4ERUSUnbDl1rzR6/HKtpkCheTL64I2rymvzOY3cQTuV2zZplptk?=
 =?us-ascii?Q?yz2vnb+xceJ018vJWgMVdusp83XBgYPiNJfDOxSaiEHkEzYAtgoiD9XZXt0J?=
 =?us-ascii?Q?KzzPaSJXlbk42sGolaQ9emZizF0QgAoeeOXs33mMpmdwwWqa4BuEYaNfkZHs?=
 =?us-ascii?Q?jALeaVfKeqoqDpIzEoHp0QOVwLyxBeeWIFZxvBvaMUov+gdxWNEFm6irVBNt?=
 =?us-ascii?Q?sA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 61f5f572-f68f-4e0c-278d-08de29d76a8a
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4165.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2025 14:57:11.7658
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uTjoOl3fZ5TxY33lUgJzqfDuOc06u0gJdOC+CX/E6Eyup7onEZ0YRUrauFe9PONX7ignsShDn3JwH/pJDpOYsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8545
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git uprobe_mov
head:   a54768cce1f5e7bc78f6e0278b90acdb53f896fc
commit: 9f17ca62d1b3abb147d790291196f02fe3723367 [6/7] opt
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251122/202511221532.SZLHW3DG-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251122/202511221532.SZLHW3DG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511221532.SZLHW3DG-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/x86/kernel/uprobes.c:1488:36: warning: unused variable 'mov_xol_ops' [-Wunused-const-variable]
    1488 | static const struct uprobe_xol_ops mov_xol_ops = {
         |                                    ^~~~~~~~~~~
   arch/x86/kernel/uprobes.c:1492:36: warning: unused variable 'sub_xol_ops' [-Wunused-const-variable]
    1492 | static const struct uprobe_xol_ops sub_xol_ops = {
         |                                    ^~~~~~~~~~~
>> arch/x86/kernel/uprobes.c:1496:36: warning: unused variable 'opt_xol_ops' [-Wunused-const-variable]
    1496 | static const struct uprobe_xol_ops opt_xol_ops = {
         |                                    ^~~~~~~~~~~
   3 warnings generated.


vim +/opt_xol_ops +1496 arch/x86/kernel/uprobes.c

8161bb24402c28 Jiri Olsa 2025-11-01  1495  
9f17ca62d1b3ab Jiri Olsa 2025-11-01 @1496  static const struct uprobe_xol_ops opt_xol_ops = {
9f17ca62d1b3ab Jiri Olsa 2025-11-01  1497  	.emulate  = optimized_emulate,
9f17ca62d1b3ab Jiri Olsa 2025-11-01  1498  };
9f17ca62d1b3ab Jiri Olsa 2025-11-01  1499  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

