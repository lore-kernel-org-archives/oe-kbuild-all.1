Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A97912F5A5
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Dec 2025 02:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764641132; cv=fail; b=Jjc5+nO3SQ5DqQB39wQkm9pRXrqtsL9iEX0TNhUTJh/2pSxeCaBhbOqQ5ouTlUIol4oWsmrEJBERSN2MpP/C0+QJoIbUGOn4erKnwPhrJfH+WhnP6du9wQa0cPR7FitAN0FU3qYqddXLXVohQIKn3mby59rWWw92nnTrPEPi6O0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764641132; c=relaxed/simple;
	bh=id1rUlni0LhMVEkWnRZFyI5/C4NDkBTq33wojtcD+O4=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=PLmPD678SbZXnhzEoFvOfwy8CVpab0JWE+dMp5r+sQJMscXN+7Fm0xIBdW1iPK6jZGvtzBLvZ63rdGxBQ0B0vynLmDUz4zvpOSRHzQHsy2yt5znqtEGemGldbOTiEKmHTpCKVBrw5EeZJ6aBAUgSnfLthAGM525mWvGtapFTOO8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=htVpqqg6; arc=fail smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="htVpqqg6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764641130; x=1796177130;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=id1rUlni0LhMVEkWnRZFyI5/C4NDkBTq33wojtcD+O4=;
  b=htVpqqg6GG0uiPWrj3SyruImXRSLz7sPLPYmulGglNNBPNuH58LgYfu+
   eGx3JxprCqOEA0YSXi7lx3IFe7t/aad3E3yvrf4VtL2gG934o3gGrDdx9
   AbiCjDkTnbhunytub1eRddk5KDver9lMblRI5yb1KA1Dti/dRpK1S9s6l
   N9JS3kRPKDcIrX2HZEsnf0e60JRfWoSuBeZW3KKR6Nr2p1FWygzspB8tl
   UM2yKuFu7DshwnJSNAFLr1JnysGQjPg2RlLg3R1qk5U9kHotJfIpzKiBy
   Ep5vHOaedkG4im7i9l7mbhpX3yvKKFCshNIUy5C4bO7sMXK8lpfO0CQDq
   g==;
X-CSE-ConnectionGUID: +ml9Mc7sQvWR0jrsyJG+ow==
X-CSE-MsgGUID: qAcqoVEaRQKG6x72jV5KUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="65784339"
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; 
   d="scan'208";a="65784339"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2025 18:05:24 -0800
X-CSE-ConnectionGUID: 1KBX244bRuqSwHSloLnoSg==
X-CSE-MsgGUID: Nns5sn3SR4Ct4ExV0yHA3A==
X-Ironport-Invalid-End-Of-Message: True
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; 
   d="scan'208";a="224935346"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2025 18:05:23 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 18:05:22 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 1 Dec 2025 18:05:22 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.51) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 18:05:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d+r7WugjmJGzj5MOFYmpiHZ2iamwc+Zw26MhCDmdx1P0VFZFQss3IgU0sV474h7HgEcbmCVt/lg0fb/cnrjbVg6KITxBLkPZdLdUOFNaIklyjOpaFRnVLDfA6CCVB2KfTWtGG18nJyajCknwtEHvWFBKcHbHn66UOvEM2pfwHMAq2PX3zqNtQDZBvxg6ttNsxI1Oz7Wgcm8/LhW6kQT5gy3fh899ILdboY5si82uF9jKYdO2puzvjqgevxuMI1W5Bd77l1F5pV7mMAhrv/fSinQvRahBB3zZ7xtVjs30gB0JlkB6iDTyh+Z7ThQV8vBA51YDHvkO5+5qFSe7HaC3tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5d23azx1mXZDOQH4zlHM4P/D92DaMO9ao6MOVxhpqR8=;
 b=p5Sh2L+fA4JNZvuKquxtZJBnCgp4ouTUzmq53IafNGIzVfn/ZBgHQv+4YhKYLglTx/gWIZhSxz+k0rWz3bNISY+le7KjQ6MBqTqK1VyCz5BqumH0BAlleld+JsbHYyCGkxh1Dcff9fgBG4mabnNSOSSyt8tZkapnVfNWLGiK0CKQHJdzr7NllpVJ4uzwtT+L1ZXksyxuY5l4N/C8Z4PT5/MIdtPXbn6qLwRUjlHFCcJ3qL4GwGEu6XRv+HTtcv8xj4w647TsU3PBWH3roW3NOg4IEz2PM0gjwWhaBgnl2S3kB6xIQzBI2syouiNjPVgGj5UnmAWR/kVU6NN/HX72hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
 by SA2PR11MB5129.namprd11.prod.outlook.com (2603:10b6:806:11f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 02:05:20 +0000
Received: from MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9]) by MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9%5]) with mapi id 15.20.9366.012; Tue, 2 Dec 2025
 02:05:20 +0000
Date: Tue, 2 Dec 2025 10:05:08 +0800
From: kernel test robot <lkp@intel.com>
To: Koichiro Den <den@valinux.co.jp>
CC: <oe-kbuild-all@lists.linux.dev>, 0day robot <lkp@intel.com>
Subject: drivers/ntb/ntb_transport_core.c:1286:40: warning: variable
 'qp_count' set but not used
Message-ID: <aS5JVAZswsNY0upw@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0153.apcprd04.prod.outlook.com (2603:1096:4::15)
 To MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB5963:EE_|SA2PR11MB5129:EE_
X-MS-Office365-Filtering-Correlation-Id: c0d2fe6f-3c92-42c2-535c-08de31473ed4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cF6wzCIEw4qcWq3fahyek0rqeDMCwjTdal2L69xwGBDTs6toD2PdlY+QVp7Y?=
 =?us-ascii?Q?TdJUDCz7LQJP9IVd66tWpnCiGOQy0A7VxB0OtMlJ/afdayXoVDJgjngJxBoU?=
 =?us-ascii?Q?dhLaWEC7vfG3y1PAFIr/4p9j1TBGR0dOZ6AJq7p6fgZyZkXCMLDnHKFMqbhs?=
 =?us-ascii?Q?3zzmTvzl/VGDZzg9x738Grm3+5VNWZdqadTGpTjhAn1CoNX6nTqxeul0KZAq?=
 =?us-ascii?Q?sNADZD6YFwDjIaFM+DukMk4MAUMNTZV7mCTkTbz13eUcCfM2w/n4yBLJQz78?=
 =?us-ascii?Q?nLhR7/abv2dfjTZdFKtkzrkUif9sIeCHkv+cokc2QwBhay8Ew1iJU1MMX0qG?=
 =?us-ascii?Q?fm+6yoKzufwea/YulW9t4OnAttDR4vfKIaBqLsdQ3/O6mmj+jdgdcyVgurK6?=
 =?us-ascii?Q?mnuTEbDKMGOmOrfD2VpLVlcFljNhw0yAwnFEgck90ra4aeRRcMMZIFQbPKGL?=
 =?us-ascii?Q?aKaUn2NQq7T+07qed3whwUZXfTAmqnFFv0Pbj7Qsooq7YiJyR7iGLp05ikrd?=
 =?us-ascii?Q?y2+1qL2Ujke/iCFGiThRpg/m7FYzzc6YdpycHWG6zWtqmaXq4WoIdygHdTB0?=
 =?us-ascii?Q?J1k6V8VB/QvKJmAxyUdTEy0klVnDjyxAVIojebCCUO1KGgumGTKn8gIQZYzy?=
 =?us-ascii?Q?a52vbLKVaePtnasuK7+UFAhX4C3kCuZ1J4Zc6vhvKiK+Sw5NDgCNRQSzqsJw?=
 =?us-ascii?Q?yE7RKpG1X30L2ZvLR/+QVmjvnYA56lx+mXrXv0Tbj74i8EoUiTUseACiOEHe?=
 =?us-ascii?Q?kqbTaCHcVIqVhl06CxHuH3dXqvN0HL7BI+ESf3pI4zvaEtlzA5HtfijdXdMs?=
 =?us-ascii?Q?xbFWiaGYLV+lPAhS49OND8URz6OM8IqxAz4RzmHqnaWJVNxyKznH24rsQd2W?=
 =?us-ascii?Q?r7KAxnxcDV1Zy32IaRihCi8HCJHt681ES1yOJ92c0meGqO2tTIYIJH/ovxMG?=
 =?us-ascii?Q?EVedxwpDX/xcs3D1js9RPSp0FOZJfdu2YMOlG2paiU0HEJFHlncOMOSXeamL?=
 =?us-ascii?Q?PlZo7JsTYZnaQcze+VVtAIFwcel92JpEw0kJE8aMmm5itDwd31cw+sUtGKsd?=
 =?us-ascii?Q?h3DQrngd6sxw//fyxLWHWj4n8wvXSMXV379qkAiNUV/ipXShBcbHg+fYn9W4?=
 =?us-ascii?Q?ZmEqNXF+mPvB8l+k8lKkx1q6F440/adoFVl+w+MiE1zQdTb9Ug2bL02FIoOk?=
 =?us-ascii?Q?BDeZFZtA14NWKzECN0q1hc9RPlBQzpf/5v3mkeg8x5wWaBaNtEzIq4rOeZjm?=
 =?us-ascii?Q?eS3mgQDDt0H63QDKIAGKUHaOUPoFlZiSuZYXUKns7OSn9kbXBxCDxrL692Ds?=
 =?us-ascii?Q?NjmIlCKmGr+mTkjVIpm8nWsOi4UJ+mqL4ef7iId7OaONOca9Nl3PyLpyx8H6?=
 =?us-ascii?Q?VwvwuZ8pEZ3ZxzWaMdohud++fKplI+QmX1KEYVlmC/u86LcpkCHIs4byY1e0?=
 =?us-ascii?Q?GxyiwGv7pRP/e3j+fEgxNzGg+Z93wWiXKzvaeTTJ5UOnqA7RmYpsfA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB5963.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jyhKa7Sa+1K+RTRvPtqyftDs3nEppjOwNGQEUgM3XXnKslBUFUDzKv0Qfla0?=
 =?us-ascii?Q?hLSSR2hQOyJ8UzJV0OOWW6Mm+70yNEIq28DE9PdmYk5gIEGLmuUsgWplNU47?=
 =?us-ascii?Q?Q2TjlBMA7eW/Ch4mJSfhXqeW+egaldI18lZyaBtX/zO5Wb9tnS4D649D6Rnh?=
 =?us-ascii?Q?uHPLHBOiZK0QTUTechfpCUh90226QcLotTtPncCv0+CYTekSHiyo+Bg0awO9?=
 =?us-ascii?Q?IhKkZ8gkhlAPaMlntxkUuTRFF1yPek/aj9yoSfGfBDjXG+GRJiArdx1rvE2E?=
 =?us-ascii?Q?pfBP6UcCmK49MLSAAzGo71CnW19InUXnbQOe2t3OuhZhB33LyQ/lNvUv2DM4?=
 =?us-ascii?Q?ThLgH5ZW+zy2kf8Fev4bfFUH1ss/WXT1C472UdbDe2q2Xot7mwNvyPgyASTC?=
 =?us-ascii?Q?+I3lbsYoyBY4wUCqVCp33hmtWHxYw/G2ONdq9/JeqWYpFBjQTNrjaN07IgRL?=
 =?us-ascii?Q?UyuxKmjtu8Vdys9haHIPP30b3Glt26ZHVaH+nX4B0npc7l9pTsWbYTMRO5z+?=
 =?us-ascii?Q?9viBjFTl0cC0MlSQbgGdJWJG+ymZG5gwavWjG1O9Rbil5L3bqFeYRZZilTMW?=
 =?us-ascii?Q?bXj2X1qBuLe3DW5E+ZmLWrEoyYBTkmPDqC50eSAS17zXibjXm5M95mya2Ixu?=
 =?us-ascii?Q?VqWwhDR8Zi4A5vz0rJN7adlKP4dW68wgU8lZxkU/amUlWEJcjEFi1pLFc4UU?=
 =?us-ascii?Q?3zI2pODBXIvCf/krVITbYJWrUN1D6ok7w3yUwnC6UHabmIqZ9UEZ6BtuJWam?=
 =?us-ascii?Q?InboZYeUaNxYgOc1PVIjMoHInozshqZ45mfP0nDHFQm4ECe+40+rwsAT4dFS?=
 =?us-ascii?Q?kMwDLjtRlaEIytONPaqXYWNQX9qBF3ptkxCKlXBySCqQ37Q8IHqJO4omNjWb?=
 =?us-ascii?Q?Ny2vVS68/GRmvfw0GvQORkt2F/tv7CPzqhFxP84DwfULFAVEDdWPzaR0xuvv?=
 =?us-ascii?Q?IaErAFi5hGLs3h1H0WZBWb8MtA87YAiJNz7UF/LPTVKazWwSsTeBuNBzbsvE?=
 =?us-ascii?Q?QQdD6wDsMhw+hTNTIZ7NRJyh/bt7e40lq0xLocDETNxIHo39rL1UbwOv+Q7u?=
 =?us-ascii?Q?BVN4jPk77M+lwv0NHceWNTUNR4HNW55ouEdvdq/HYQcLWd6nRnruruJ7WHQ3?=
 =?us-ascii?Q?di064HNb2QtQ3jHnX9+rxhN9gHZkt3KtHKxlvWjEyeUi1/U9WERcWumFtRNp?=
 =?us-ascii?Q?hJkoU0j+4sfFpu9HtNWbTXlzoZJJpQwVXNYLUU6fjOOHVP2Pssz+Dbd0m/JJ?=
 =?us-ascii?Q?zphMers8ki1xnlX7M98/2ckT77P8nggWLF5WqcHbvf4VsfRpy7MFlGSgtX2q?=
 =?us-ascii?Q?JbZ/mnX0Y046pX3+5LgRbaVLxMmPSWP1QUa+Ax9nMb7gNsaNTAy17z2rCS/V?=
 =?us-ascii?Q?8toZCsAyxPrVBFE7nby7GXr1XCQ3hdCAttWMWpMQRiVsBVOrh5FFoO431Psq?=
 =?us-ascii?Q?T34H4nwQTq/gIKq6/bOH+j/Az96/E/iGSBtn2L5Ary0zv5m38moH4v0nIs7s?=
 =?us-ascii?Q?883m5n0R6ohpX7+U4GTlW1pQLG6HAWGu9mRgKa8fvewBXRcdHj6QwcVy8PNl?=
 =?us-ascii?Q?ViuHTRm+18mvj+ZqgWXNdtYoau8GJVJGyigdYSNehY4koh+AOAwzsORWQkaY?=
 =?us-ascii?Q?uQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c0d2fe6f-3c92-42c2-535c-08de31473ed4
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB5963.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 02:05:20.2172
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zqdnosc7U1/jlm6pKZoUrBJSII3+n9wgSiVQk48WFpn7X40FjqSsivi6j0KdCBFXZRlwgwKO5/6UWdEpAJghrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5129
X-OriginatorOrg: intel.com

tree:   https://github.com/intel-lab-lkp/linux/commits/Koichiro-Den/PCI-endpoint-pci-epf-vntb-Use-array_index_nospec-on-mws_size-access/20251130-001424
head:   87cdc4c7eaef841a607491db40b8d66c37ec2459
commit: 2c52b6a2a63cec47e6569a2c2c5d0ac8950e6b91 NTB: ntb_transport: Introduce remote eDMA backed transport mode
date:   2 days ago
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20251202/202512020039.WSRSzQXV-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251202/202512020039.WSRSzQXV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512020039.WSRSzQXV-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/ntb/ntb_transport_core.c: In function 'ntb_transport_init_queue':
>> drivers/ntb/ntb_transport_core.c:1286:40: warning: variable 'qp_count' set but not used [-Wunused-but-set-variable]
    1286 |         unsigned int mw_num, mw_count, qp_count;
         |                                        ^~~~~~~~
>> drivers/ntb/ntb_transport_core.c:1286:30: warning: variable 'mw_count' set but not used [-Wunused-but-set-variable]
    1286 |         unsigned int mw_num, mw_count, qp_count;
         |                              ^~~~~~~~
>> drivers/ntb/ntb_transport_core.c:1286:22: warning: variable 'mw_num' set but not used [-Wunused-but-set-variable]
    1286 |         unsigned int mw_num, mw_count, qp_count;
         |                      ^~~~~~
   drivers/ntb/ntb_transport_core.c: At top level:
>> drivers/ntb/ntb_transport_core.c:1367:47: warning: 'edma_backend_ops' defined but not used [-Wunused-const-variable=]
    1367 | static const struct ntb_transport_backend_ops edma_backend_ops;
         |                                               ^~~~~~~~~~~~~~~~


vim +/qp_count +1286 drivers/ntb/ntb_transport_core.c

fce8a7bb5b4bfb drivers/ntb/ntb_transport.c      Jon Mason    2012-11-16  1281  
e26a5843f7f501 drivers/ntb/ntb_transport.c      Allen Hubbe  2015-04-09  1282  static int ntb_transport_init_queue(struct ntb_transport_ctx *nt,
fce8a7bb5b4bfb drivers/ntb/ntb_transport.c      Jon Mason    2012-11-16  1283  				    unsigned int qp_num)
fce8a7bb5b4bfb drivers/ntb/ntb_transport.c      Jon Mason    2012-11-16  1284  {
fce8a7bb5b4bfb drivers/ntb/ntb_transport.c      Jon Mason    2012-11-16  1285  	struct ntb_transport_qp *qp;
e26a5843f7f501 drivers/ntb/ntb_transport.c      Allen Hubbe  2015-04-09 @1286  	unsigned int mw_num, mw_count, qp_count;
948d3a65b6d164 drivers/ntb/ntb_transport.c      Jon Mason    2013-04-18  1287  
e26a5843f7f501 drivers/ntb/ntb_transport.c      Allen Hubbe  2015-04-09  1288  	mw_count = nt->mw_count;
e26a5843f7f501 drivers/ntb/ntb_transport.c      Allen Hubbe  2015-04-09  1289  	qp_count = nt->qp_count;
e26a5843f7f501 drivers/ntb/ntb_transport.c      Allen Hubbe  2015-04-09  1290  
e26a5843f7f501 drivers/ntb/ntb_transport.c      Allen Hubbe  2015-04-09  1291  	mw_num = QP_TO_MW(nt, qp_num);
fce8a7bb5b4bfb drivers/ntb/ntb_transport.c      Jon Mason    2012-11-16  1292  
e26a5843f7f501 drivers/ntb/ntb_transport.c      Allen Hubbe  2015-04-09  1293  	qp = &nt->qp_vec[qp_num];
fce8a7bb5b4bfb drivers/ntb/ntb_transport.c      Jon Mason    2012-11-16  1294  	qp->qp_num = qp_num;
fce8a7bb5b4bfb drivers/ntb/ntb_transport.c      Jon Mason    2012-11-16  1295  	qp->transport = nt;
fce8a7bb5b4bfb drivers/ntb/ntb_transport.c      Jon Mason    2012-11-16  1296  	qp->ndev = nt->ndev;
e26a5843f7f501 drivers/ntb/ntb_transport.c      Allen Hubbe  2015-04-09  1297  	qp->client_ready = false;
fce8a7bb5b4bfb drivers/ntb/ntb_transport.c      Jon Mason    2012-11-16  1298  	qp->event_handler = NULL;
cc79bd2738c2d4 drivers/ntb/ntb_transport.c      Dave Jiang   2023-08-22  1299  	ntb_qp_link_context_reset(qp);
fce8a7bb5b4bfb drivers/ntb/ntb_transport.c      Jon Mason    2012-11-16  1300  
c8650fd03d320e drivers/ntb/ntb_transport.c      Dave Jiang   2015-07-13  1301  	if (nt->debugfs_node_dir) {
2d1987992b40a8 drivers/ntb/ntb_transport.c      Koichiro Den 2025-11-30  1302  		char debugfs_name[8];
fce8a7bb5b4bfb drivers/ntb/ntb_transport.c      Jon Mason    2012-11-16  1303  
2d1987992b40a8 drivers/ntb/ntb_transport.c      Koichiro Den 2025-11-30  1304  		snprintf(debugfs_name, sizeof(debugfs_name), "qp%d", qp_num);
fce8a7bb5b4bfb drivers/ntb/ntb_transport.c      Jon Mason    2012-11-16  1305  		qp->debugfs_dir = debugfs_create_dir(debugfs_name,
c8650fd03d320e drivers/ntb/ntb_transport.c      Dave Jiang   2015-07-13  1306  						     nt->debugfs_node_dir);
fce8a7bb5b4bfb drivers/ntb/ntb_transport.c      Jon Mason    2012-11-16  1307  
fce8a7bb5b4bfb drivers/ntb/ntb_transport.c      Jon Mason    2012-11-16  1308  		qp->debugfs_stats = debugfs_create_file("stats", S_IRUSR,
fce8a7bb5b4bfb drivers/ntb/ntb_transport.c      Jon Mason    2012-11-16  1309  							qp->debugfs_dir, qp,
2d1987992b40a8 drivers/ntb/ntb_transport.c      Koichiro Den 2025-11-30  1310  							&ntb_qp_debugfs_stats_fops);
e26a5843f7f501 drivers/ntb/ntb_transport.c      Allen Hubbe  2015-04-09  1311  	} else {
e26a5843f7f501 drivers/ntb/ntb_transport.c      Allen Hubbe  2015-04-09  1312  		qp->debugfs_dir = NULL;
e26a5843f7f501 drivers/ntb/ntb_transport.c      Allen Hubbe  2015-04-09  1313  		qp->debugfs_stats = NULL;
fce8a7bb5b4bfb drivers/ntb/ntb_transport.c      Jon Mason    2012-11-16  1314  	}
fce8a7bb5b4bfb drivers/ntb/ntb_transport.c      Jon Mason    2012-11-16  1315  
fce8a7bb5b4bfb drivers/ntb/ntb_transport.c      Jon Mason    2012-11-16  1316  	INIT_DELAYED_WORK(&qp->link_work, ntb_qp_link_work);
fca4d5188c1123 drivers/ntb/ntb_transport.c      Jon Mason    2013-09-09  1317  	INIT_WORK(&qp->link_cleanup, ntb_qp_link_cleanup_work);
fce8a7bb5b4bfb drivers/ntb/ntb_transport.c      Jon Mason    2012-11-16  1318  
da2e5ae56164b8 drivers/ntb/ntb_transport.c      Allen Hubbe  2015-07-13  1319  	spin_lock_init(&qp->ntb_rx_q_lock);
fce8a7bb5b4bfb drivers/ntb/ntb_transport.c      Jon Mason    2012-11-16  1320  	spin_lock_init(&qp->ntb_tx_free_q_lock);
fce8a7bb5b4bfb drivers/ntb/ntb_transport.c      Jon Mason    2012-11-16  1321  
da2e5ae56164b8 drivers/ntb/ntb_transport.c      Allen Hubbe  2015-07-13  1322  	INIT_LIST_HEAD(&qp->rx_post_q);
fce8a7bb5b4bfb drivers/ntb/ntb_transport.c      Jon Mason    2012-11-16  1323  	INIT_LIST_HEAD(&qp->rx_pend_q);
fce8a7bb5b4bfb drivers/ntb/ntb_transport.c      Jon Mason    2012-11-16  1324  	INIT_LIST_HEAD(&qp->rx_free_q);
fce8a7bb5b4bfb drivers/ntb/ntb_transport.c      Jon Mason    2012-11-16  1325  	INIT_LIST_HEAD(&qp->tx_free_q);
282a2feeb9bfb1 drivers/ntb/ntb_transport.c      Jon Mason    2013-02-12  1326  
e26a5843f7f501 drivers/ntb/ntb_transport.c      Allen Hubbe  2015-04-09  1327  	tasklet_init(&qp->rxc_db_work, ntb_transport_rxc_db,
e26a5843f7f501 drivers/ntb/ntb_transport.c      Allen Hubbe  2015-04-09  1328  		     (unsigned long)qp);
e26a5843f7f501 drivers/ntb/ntb_transport.c      Allen Hubbe  2015-04-09  1329  
282a2feeb9bfb1 drivers/ntb/ntb_transport.c      Jon Mason    2013-02-12  1330  	return 0;
fce8a7bb5b4bfb drivers/ntb/ntb_transport.c      Jon Mason    2012-11-16  1331  }
fce8a7bb5b4bfb drivers/ntb/ntb_transport.c      Jon Mason    2012-11-16  1332  
5c2671d8c2c274 drivers/ntb/ntb_transport.c      Koichiro Den 2025-11-30  1333  static unsigned int ntb_transport_default_tx_free_entry(struct ntb_transport_qp *qp)
5c2671d8c2c274 drivers/ntb/ntb_transport.c      Koichiro Den 2025-11-30  1334  {
5c2671d8c2c274 drivers/ntb/ntb_transport.c      Koichiro Den 2025-11-30  1335  	unsigned int head = qp->tx_index;
5c2671d8c2c274 drivers/ntb/ntb_transport.c      Koichiro Den 2025-11-30  1336  	unsigned int tail = qp->remote_rx_info->entry;
5c2671d8c2c274 drivers/ntb/ntb_transport.c      Koichiro Den 2025-11-30  1337  
5c2671d8c2c274 drivers/ntb/ntb_transport.c      Koichiro Den 2025-11-30  1338  	return tail >= head ? tail - head : qp->tx_max_entry + tail - head;
5c2671d8c2c274 drivers/ntb/ntb_transport.c      Koichiro Den 2025-11-30  1339  }
5c2671d8c2c274 drivers/ntb/ntb_transport.c      Koichiro Den 2025-11-30  1340  
5c2671d8c2c274 drivers/ntb/ntb_transport.c      Koichiro Den 2025-11-30  1341  static int ntb_transport_default_rx_enqueue(struct ntb_transport_qp *qp,
5c2671d8c2c274 drivers/ntb/ntb_transport.c      Koichiro Den 2025-11-30  1342  					    struct ntb_queue_entry *entry)
5c2671d8c2c274 drivers/ntb/ntb_transport.c      Koichiro Den 2025-11-30  1343  {
5c2671d8c2c274 drivers/ntb/ntb_transport.c      Koichiro Den 2025-11-30  1344  	ntb_list_add(&qp->ntb_rx_q_lock, &entry->entry, &qp->rx_pend_q);
5c2671d8c2c274 drivers/ntb/ntb_transport.c      Koichiro Den 2025-11-30  1345  
5c2671d8c2c274 drivers/ntb/ntb_transport.c      Koichiro Den 2025-11-30  1346  	if (qp->active)
5c2671d8c2c274 drivers/ntb/ntb_transport.c      Koichiro Den 2025-11-30  1347  		tasklet_schedule(&qp->rxc_db_work);
5c2671d8c2c274 drivers/ntb/ntb_transport.c      Koichiro Den 2025-11-30  1348  
5c2671d8c2c274 drivers/ntb/ntb_transport.c      Koichiro Den 2025-11-30  1349  	return 0;
5c2671d8c2c274 drivers/ntb/ntb_transport.c      Koichiro Den 2025-11-30  1350  }
5c2671d8c2c274 drivers/ntb/ntb_transport.c      Koichiro Den 2025-11-30  1351  
5c2671d8c2c274 drivers/ntb/ntb_transport.c      Koichiro Den 2025-11-30  1352  static void ntb_transport_default_rx_poll(struct ntb_transport_qp *qp);
5c2671d8c2c274 drivers/ntb/ntb_transport.c      Koichiro Den 2025-11-30  1353  static int ntb_transport_default_tx_enqueue(struct ntb_transport_qp *qp,
5c2671d8c2c274 drivers/ntb/ntb_transport.c      Koichiro Den 2025-11-30  1354  					    struct ntb_queue_entry *entry,
5c2671d8c2c274 drivers/ntb/ntb_transport.c      Koichiro Den 2025-11-30  1355  					    void *cb, void *data, unsigned int len,
5c2671d8c2c274 drivers/ntb/ntb_transport.c      Koichiro Den 2025-11-30  1356  					    unsigned int flags);
5c2671d8c2c274 drivers/ntb/ntb_transport.c      Koichiro Den 2025-11-30  1357  
5c2671d8c2c274 drivers/ntb/ntb_transport.c      Koichiro Den 2025-11-30  1358  static const struct ntb_transport_backend_ops default_backend_ops = {
5c2671d8c2c274 drivers/ntb/ntb_transport.c      Koichiro Den 2025-11-30  1359  	.setup_qp_mw = ntb_transport_default_setup_qp_mw,
5c2671d8c2c274 drivers/ntb/ntb_transport.c      Koichiro Den 2025-11-30  1360  	.tx_free_entry = ntb_transport_default_tx_free_entry,
5c2671d8c2c274 drivers/ntb/ntb_transport.c      Koichiro Den 2025-11-30  1361  	.tx_enqueue = ntb_transport_default_tx_enqueue,
5c2671d8c2c274 drivers/ntb/ntb_transport.c      Koichiro Den 2025-11-30  1362  	.rx_enqueue = ntb_transport_default_rx_enqueue,
5c2671d8c2c274 drivers/ntb/ntb_transport.c      Koichiro Den 2025-11-30  1363  	.rx_poll = ntb_transport_default_rx_poll,
5c2671d8c2c274 drivers/ntb/ntb_transport.c      Koichiro Den 2025-11-30  1364  	.debugfs_stats_show = ntb_transport_default_debugfs_stats_show,
5c2671d8c2c274 drivers/ntb/ntb_transport.c      Koichiro Den 2025-11-30  1365  };
5c2671d8c2c274 drivers/ntb/ntb_transport.c      Koichiro Den 2025-11-30  1366  
2c52b6a2a63cec drivers/ntb/ntb_transport_core.c Koichiro Den 2025-11-30 @1367  static const struct ntb_transport_backend_ops edma_backend_ops;
2c52b6a2a63cec drivers/ntb/ntb_transport_core.c Koichiro Den 2025-11-30  1368  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

