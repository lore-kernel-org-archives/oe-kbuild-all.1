Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4EE53D47A3
	for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Aug 2026 12:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787488263; cv=fail; b=lMM7Q7hFqtQoZcjoT9uDNfqUsc1Fl5lnil/1U+v+eNmmqTIIARv4rttcwgPw5LVFUSpyUWi9UKi4Yy4BCe8PSPKva/VOmYJ1bgmhLwBb9F5lvSzegAy8uNIYjuBb3iAdcb4PgDYhpaZkM5Xq03zUPpd0te7tzeNyNub/apGgNZg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787488263; c=relaxed/simple;
	bh=zlKSjBDzHevlFpk4092l5dEcWzmg+MWxWUNw/iRSqC0=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=EsOkvDcpJzpLMGyh0erECy6dRYyhRMMNW9TEHFOrNxzqspl+r0jKNKiFsYC1v5b2zdTNIGfC1bp3dOLzfv+Q4AutiDis1AjMV427ZlW7uzmomIpQSfQ8h0GQTqgeyfnUgx2ArrNp/RORwbt02uTo/PBHvxbLoY/mvtxYw2XNCZc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BeVbOvKb; arc=fail smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BeVbOvKb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787488261; x=1819024261;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zlKSjBDzHevlFpk4092l5dEcWzmg+MWxWUNw/iRSqC0=;
  b=BeVbOvKbPWBKRqZeoHynvfVbTtTa7HHtyiq0LSfg5Q/S5oyB1Sf6i5hx
   OIMvjr3ROta5OQOYMUhvb9AMsVO+tkA9jECxw/NBdL338ij1MaYrswnTF
   XwE4vsOsblk29fhLPdXEdleEQLlh6fNaRe9bcBZRw7pNQKCf/K2gzi4HP
   7Q1tVsXk4PSpA2uf+5evTLZ2aElEe6PHU5acQKcTDijb0AM7YNsTz85CN
   YtPA7WvaqJH2+N9PtGteD74ckNayt0MkAxztN3GMsAc9LRYKogz3i/r0y
   FwMD/5H5z3kzcC/zCadt7QWfHNM2rXfQ23k8tTi5twRLb6YvLLNp8fRfm
   w==;
X-CSE-ConnectionGUID: IsehYRASSQy5b4ejLql6vg==
X-CSE-MsgGUID: 7iS7l/Q4S7Kvzm7vinr0Hg==
X-IronPort-AV: E=McAfee;i="6800,10657,11883"; a="87974927"
X-IronPort-AV: E=Sophos;i="6.25,238,1779174000"; 
   d="scan'208";a="87974927"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2026 05:31:00 -0700
X-CSE-ConnectionGUID: 0Jfd7wdpTXGbJX7r1hEdGg==
X-CSE-MsgGUID: KoaG+w81S5OLTJIs+0M+mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,238,1779174000"; 
   d="scan'208";a="264993631"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2026 05:31:00 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 23 Aug 2026 05:30:59 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Sun, 23 Aug 2026 05:30:59 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.40) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 23 Aug 2026 05:30:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yBDfxq0Dzh1MNTFEDD/267I8LPinuliQS60kZzrZ7ByInbZqDXNpgv7UnZpy/Mb5h25OoWtm51atDjLvNyLQ5xflRqOFekwAcmiNzkNHN16w6KSwDrHEjNd2b2f6OUUAD06ECinH7MEUhhSDFWN2Kp5Btz9f9r1DzRBNtQ420UENI+Az4etXi+MSsfXcnTj3cx0bBI9berSJsZl5edGgn1fSyXn4oeiCbp6FUopaM//zWZAwVGaq1sFxende5dYxh7fjkwNQqxgAsnYhJuqw16VffsNFjmpmJ0pSEdsET3zTKcqc7AbrFMAZvc3HvJgrDQc/HbsjyMV/u08xXBIUsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ikS7WkDPrwhhjMGyM9WSInXWxQqnhH7FDKEjONcf/q8=;
 b=hu7OP6q5GB+2Gsr7hLoYfGmvXxiY8XD9IWBDzgx7rnAu8C8A5auJ3Q3DUni/oIclqzByGXD4/4iiifvY5duU6JgK/TB1v3W6BZsSjL4RwknE2pHvrK6RtJ47FLD39B2brDDPPCHLDpwxhSNJw707HyQLI27/cBc0uVncO2m7stFQX9ZEWJkDv6Va2QFy45J1NylnVFcnTYqP9Evub6kC3yrjQG2oz9BrBaZMQqxyx/VD7uv+/Hzq/ti62ze0dCNhIhbntEizeL6ITU9rmR8kwnnCd4E2gJgA/OO4aoWQR0TrHCkw6Rd4+28zzLFGRWMYUO+ldqlK7GvjWQ+SfA1f+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB5214.namprd11.prod.outlook.com (2603:10b6:a03:2df::22)
 by LV8PR11MB8535.namprd11.prod.outlook.com (2603:10b6:408:1ed::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Sun, 23 Aug
 2026 12:30:55 +0000
Received: from SJ0PR11MB5214.namprd11.prod.outlook.com
 ([fe80::5926:3836:4212:8640]) by SJ0PR11MB5214.namprd11.prod.outlook.com
 ([fe80::5926:3836:4212:8640%4]) with mapi id 15.21.0339.012; Sun, 23 Aug 2026
 12:30:55 +0000
Date: Sun, 23 Aug 2026 20:30:47 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <djwong@kernel.org>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [djwong-xfs:llm-fixes-31 140/161] fs/xfs/scrub/repair.h:241:42:
 error: void value not ignored as it ought to be
Message-ID: <202608222048.n0TSPHun-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: KUZPR03CA0010.apcprd03.prod.outlook.com
 (2603:1096:d10:2a::12) To SJ0PR11MB5214.namprd11.prod.outlook.com
 (2603:10b6:a03:2df::22)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5214:EE_|LV8PR11MB8535:EE_
X-MS-Office365-Filtering-Correlation-Id: cc814fc4-7ff9-4b70-ead6-08df01126082
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|10067099003|56012099006|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info: jWq2m95FEorAXmArxJzy+U9FPuWWuxZ9jMys5iIHt9q0Ou/LstOlgRSvzGnW0PJwhR11mTSxJmpeOPNyL8Dac3/3SAkD+imPQ6XNIKICkvaL0969Tmm3YEvxSKCsAAHJcOAoGSDYhJCGyCbvl09KfnNA3PQBX5T7kKKG39Fn5gLOofuooBcW27+j7mGmWNZg2V8Vvg+6vyJhJj11jM3aiY3POyNT3uXC9KPSDFioSx7tNVsTgyh2VE0sF1kTUIv3mCpWMpF5Ey/lko4xsU5c9Ra3Y7o8nqIfZ/mjoGGHWFEgBsV0Z1t2fKcWC7EwW2CstKAQ4X/9wHaYn0etEJrJ4pwXFnpsKr6Q63SuRnCvzjC+NxCgHJ4JEFNVyq9lkKraNG1CoU2WOBFeeMdYm0V6kpPwDNkbbIkJrEk55/mJjwoFplVHBGgNmgTyTFWlZXrHk2pih6mWBr2FFW3FZXOVV/RS+TvTy3CJsLMYd7mnjFd0fkhAZKrF6h4Ay9iZtevEmHQcJDqbUYArar1174iBmjKVeAhoqxxODNT5b1W4wYZ/9uYL7ikOMpNR9k48CfCaA9lu0eCrYiPzt7ROuF5yiM1JEdNiVwp5upC3hES4ULM+6vw2KG9ykRxEAOQbo7K/3uW/0i4XKVsFcal/79I0hGec35KStvup4UXBCuqTGO0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5214.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(10067099003)(56012099006)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eyHaF2rtzh2krsGOTxk9xJhJk4Yxxahs80odFyl0pfBD26fvrq1bdJ7hMY1N?=
 =?us-ascii?Q?c6p5zlKQoWN5+v1YBOthdi1jiF5YWCZXrmZVeReeTTT1li4TMrm9tVxjPc0J?=
 =?us-ascii?Q?po9Ip0h3sU7eaILNTb7LVXreuXsQyzKFsEnH/vpWmx//68RxA8uoLLZ2JVOJ?=
 =?us-ascii?Q?2OpSkWvUpsnDsH0J0rKGIHqJEcu0YVNEij+GAFdKw4wHW7mS/pSBQgd1qzVq?=
 =?us-ascii?Q?J1b19Jau14PYMmgHMuIPS7y5gBujiz27wLDoLCXI+2fJ2l6uFg+SNtO7uYwV?=
 =?us-ascii?Q?+ndtV9PO6MEa8MeQ18n+eYSgzbU+5Vj6r66PFID8uxJWejeO1zQnz5Zr4dYj?=
 =?us-ascii?Q?CJhvaKs1SSZJyypZ+dizO4lXH7fd4dwHhvi8vatgYXYOMSdKx38WCGt3OqmZ?=
 =?us-ascii?Q?qrUodBcPAtuo9R1mAqLrXKU/Wv5DvZUk2JK9NCCxR6A8WnDiRA549I0fE/hZ?=
 =?us-ascii?Q?FTl3K3CUKfu6XeCzFGqtfZfY5V7a6K9PFvqt70fy3ne+mxIj4rikutP3K5bg?=
 =?us-ascii?Q?wDwKVkoPJrXCbxjI9FKONhu2QDHIavcpFclIJWRCtCWGIByDReJUjA4vBTsn?=
 =?us-ascii?Q?zqCwydkpXllV0djPxPu+4WZS27JPGVDauRDe5refdiF/36pD/1pxljgdCQtc?=
 =?us-ascii?Q?X7zN098jVp/6PreWrojV4iXEKLNBoQDzHvfPCvM2ZAVOCw+ohuN+DrCApOke?=
 =?us-ascii?Q?e2aCpj1p0bUbIsOdjbPJBD4quXluZ6gNjrHHXtpLGnRgWK+rgNuAKBn7dlEl?=
 =?us-ascii?Q?nIHjqwAzwBSj0uSKtsBVuVe3CpNdX0G8aVjJQ4sBxpH20rzRROZNTJIFKTTk?=
 =?us-ascii?Q?uSFrflqSePak4JlBQvzknK85cEb2rNvZSN2Kcj5YZIzrf2y4R8pLibzVKVYt?=
 =?us-ascii?Q?zGTuoZCsL9tYeK7dMI19YN7o18moYMK5BqfvIxje4gVeA03meCO58WA04Uua?=
 =?us-ascii?Q?ZbF7JKS1dU5GBGhsbiCneVr6GBgIEahr7lv4aNJ6D8cZ6Susf9Vu2qwUBVxA?=
 =?us-ascii?Q?WQv8Hq78efJaS7PbyWHB7mgej26E//kDP5mEc0H2ex2tICevY0iJiVawvlO5?=
 =?us-ascii?Q?AmuY2IgHRlXVDtaUoGP079Y0NiQACb2yxLnfn2xjKtPL4GK7NEJ3pIp3jKnA?=
 =?us-ascii?Q?+CYafYPcMXMIOWz8Y+wqRfW1l1J91ZSBBfCI64LPKvozJaC6ynpbFqcR4VAY?=
 =?us-ascii?Q?RqdlBFjrJ7q7Z8YzoS5sbnWpUFfK6NPBEjA+D7xsCAfqx2ePs1CTgCMrGb/w?=
 =?us-ascii?Q?KNg0hIJxW6Tal8LURsG0DxoYcWcfHxxPp6RvcAaYAoyeymKmqxGrwx0W/k0Q?=
 =?us-ascii?Q?bW6B7/es7kHA5Cbm3+rzoeOh1cR17GClVAGm3FSuVLbIUMZNTe80UBSBilm0?=
 =?us-ascii?Q?qZGyj0xLoIQ+AjxH5dBOo/ScdunUsdT4ZRkeksH9AYiOCzVXmskFWZBB9Qyf?=
 =?us-ascii?Q?sTQv3T+gIIyEHknfFUElLGGPOOq3vIrntS1s+j/40pZmLtTc6DvbYvjUwzJm?=
 =?us-ascii?Q?m/L8WSXxZbBCbvcTZFSmRUmlbr/wul7YTvcKlPPPuBYGerArHq2ZYDO3NpmT?=
 =?us-ascii?Q?WHflbK9gfbBoEtXCqoAQ7idrepx0bFt/oXDt5EN4VUUpx9yz23xfhZv4K3k+?=
 =?us-ascii?Q?O/259YH/ziPE/6o0AStiy3mm3ex9R4Q+zlXX26pFkcsidC+NTEr4EFEW0O3Q?=
 =?us-ascii?Q?5bSac2Skm9WjO47OoMO2xdPYxKyFmJe7QDqoagPfzifxiEWTJBUwnIXkNuZX?=
 =?us-ascii?Q?X0/tV3+meA=3D=3D?=
X-Exchange-RoutingPolicyChecked: eUgtYLER+/a0DdJp6FHr5px0eOcMz1O4rTykz5TgVVba60tmfS17tRZIzd4delP9BTTq0KPf1CwjFK6Jjnnkinsy6Pngr7IYufGLbfAzq29ELfTGGiCMpUoyisG4a22Ccd1dAPLTIvmK60GaLKFjaxPKIhBuIzF+fX2P4u7rCJWG/l7gh57I/haaw7Awdh5/TzcBnsd99tN6hlKZtIImaujmTqhSFxrxwvdCSekvAGCVU59f3Q6zi3mB/rj/E7HmkMqiHEE54fHFUTlci/4AIL9cAurVQk8h3es5SBm15UpHMLs86kGQU51DEfw6EOgiQpy7LoKvTHrW8OO3ushkow==
X-MS-Exchange-CrossTenant-Network-Message-Id: cc814fc4-7ff9-4b70-ead6-08df01126082
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5214.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2026 12:30:55.3020
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IjPMIAPA1cAdS/K/w7y7UwA0Rh6qEbykLelFbqVYSNdWFX21kkh3d3oMpgUHfJKBPJ2/TWjyZAQyCCqI+KZ3tw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8535
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git llm-fixes-31
head:   99720b43a50e52830dacd44219a5f40dc8cab503
commit: 2e4dfa7b0b3e7bcac4c245421cf37c544e03a21e [140/161] xfs: always report inode repair setup failures
config: nios2-randconfig-002-20260822 (https://download.01.org/0day-ci/archive/20260822/202608222048.n0TSPHun-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260822/202608222048.n0TSPHun-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608222048.n0TSPHun-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/xfs/scrub/inode.c:28:
   fs/xfs/scrub/inode.c: In function 'xchk_setup_inode':
>> fs/xfs/scrub/repair.h:241:42: error: void value not ignored as it ought to be
     241 | #define xrep_setup_inode(sc, imap)      ((void)0)
         |                                         ~^~~~~~~~
   fs/xfs/scrub/inode.c:215:24: note: in expansion of macro 'xrep_setup_inode'
     215 |                 return xrep_setup_inode(sc, &imap);
         |                        ^~~~~~~~~~~~~~~~


vim +241 fs/xfs/scrub/repair.h

4bdfd7d15747b1 Darrick J. Wong 2023-12-15  240  
2d295fe65776d1 Darrick J. Wong 2023-12-15 @241  #define xrep_setup_inode(sc, imap)	((void)0)
2d295fe65776d1 Darrick J. Wong 2023-12-15  242  

:::::: The code at line 241 was first introduced by commit
:::::: 2d295fe65776d15c06d53dbe3064f62e036e7c46 xfs: repair inode records

:::::: TO: Darrick J. Wong <djwong@kernel.org>
:::::: CC: Darrick J. Wong <djwong@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
