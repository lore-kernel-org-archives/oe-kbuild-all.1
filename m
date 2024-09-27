Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2B76175A6
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Sep 2024 14:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727445614; cv=fail; b=LZ1YuRH98bR5cEvzTBzHGLGs64d/QVmgU0Y4AzEpMGPGSC/DophKJd3wiBZNmS75EmLLcZ6alGDZkvzwdHps6Mo2M4nR6KW9ZgYfBKn8MwnKIiQe1tKQQJx6FiV6wySmh4HVXtU1KQcIAAsrrWPf/peNrg04qfMHPyWb1puh2T0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727445614; c=relaxed/simple;
	bh=/wwT5wTW7UrBLkvzCemgf3HaH/nj8CQA7g7iYkqsGyo=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=YQDC8Vgver2o05Y5BNuzWG6aeLCjYEmvC/I1kmUUHV0u6g0KMijh69hsLpJQFmqRYqDqNbo/5uBGFSkab5N68NWka7tE1UaQOJRTFlbhOJ0v/FpVmdqS5iYFnEobbUALpwPaPxmBKZa+WqyoGUQ0cO/qJ+ll3kBsAZYnvfJuFV0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I2g2L+Sr; arc=fail smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I2g2L+Sr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727445613; x=1758981613;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/wwT5wTW7UrBLkvzCemgf3HaH/nj8CQA7g7iYkqsGyo=;
  b=I2g2L+Sr9hJmghpLW4cSVKSeC0iZJDnRRFXDZ/0RRfOEd5lTWP7CVBig
   AR83+9ve3X7XVtpjo3MSk9F7hIxsru1K+Q730XD6hgqOQ9xjTe+Y1Kq6I
   lCV8jgLIGwUdovfsckyr3yITD+u/34jZB9u5Vj2jwVP+3Oa6N6AhU+NvV
   WAGk+zw+/vzmEsdhVElMdEmMBSNzM7FtlS5jtLJJxnhyg7lTKzFxETLC4
   KsXQUW3HHO77XGiiZPbTehjTMiOLfTnycAxC60oC2PZ4f16H12QAZgEvc
   tbinSeLydqg7zRzEzTslsuNMZmOce7x/0r87tW9Ubvca344HqtDI0fId5
   A==;
X-CSE-ConnectionGUID: tFZC0t/IRRCBpVdYTuofig==
X-CSE-MsgGUID: b+0YtvxLTdOcGZr7gRjAcQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="52003751"
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; 
   d="scan'208";a="52003751"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2024 07:00:12 -0700
X-CSE-ConnectionGUID: 6tM762FLRymMCcgsKISQSw==
X-CSE-MsgGUID: dke0v++VQA2mlSSPXiaDtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; 
   d="scan'208";a="77374125"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 27 Sep 2024 07:00:12 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 27 Sep 2024 07:00:11 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 27 Sep 2024 07:00:11 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 27 Sep 2024 07:00:11 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.43) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 27 Sep 2024 07:00:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D6KdIbDfI7IV/W3brxzB4F43uA/2fTzr8NNhFtHvFs+Giltle5O+vFClCYwPtoaVUBNdnpxNOMETYKbnTzcXkW/f9p8hj13aPhrBUEynajCh77RQDAQ/dzvMuGutBYIMPp6wuxcx4Bntu/1wVUoJEZB66ZCVlmPgofLhDYwazVxrX5XW5UqvPzWOt3Vb4pqVRGYp2ZdcJYQsMaQSh2IylCnXKS5iw8HNbR3HIewc9aEdmnuW9qMOaJIbLedNo4mcGpmg9TGcxBSvg0SZGuDoS0nGYwyNfG9dFZN37kLVWp+idcKOm4VUfV0sBnI3FlYQDkXNXH+aDCfj3+xK7Oxopg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h1P+ocyoqhJpdvmJNP57KmogRoUk3evobCVMki3f0Yg=;
 b=vWe+ulzXs8LedZ3lsoTd2scNgtS/ZRtEwNMM3COUsufonQ153oY5kawER/x9bDPIUw+3RCj0iOKx9rNZBZ1l2UThm1hh/fbD+8AoZiAVl4RyQK7X9GaQA67/wWYg21eJdcB739GliTv5CKs5OqU0kZ3KLfbayP/JYPz3T7mNDp2O1x4Jxp1goVrN+18kBgpe5B1yEQbsdfNwptE0RHJV7bxBhAr5r/7oQ2ltS49vYu5f7eAZPA8ZmrCoj+kMLmXHBGk85aHM/4K+rnfBycqo620SctMqZG2T0F+WFmCYXZwyLWMLMIaxBRiE4htotenrZS3tGj87CFOxUXZ+bOReHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
 by PH7PR11MB7075.namprd11.prod.outlook.com (2603:10b6:510:20e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.32; Fri, 27 Sep
 2024 14:00:08 +0000
Received: from DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e]) by DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e%3]) with mapi id 15.20.7982.022; Fri, 27 Sep 2024
 14:00:08 +0000
Date: Fri, 27 Sep 2024 22:00:00 +0800
From: kernel test robot <lkp@intel.com>
To: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [cip:linux-4.19.y-cip-rt 160/30000] kernel/sched/swork.c:110:
 warning: Function parameter or member 'sev' not described in 'swork_queue'
Message-ID: <Zva6YEWy+l762hZN@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0156.apcprd04.prod.outlook.com (2603:1096:4::18)
 To DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5423:EE_|PH7PR11MB7075:EE_
X-MS-Office365-Filtering-Correlation-Id: 3725d96a-ac81-41b2-2331-08dcdefcb1ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?CMhpuQHVU31+QbzzfKeNgMdZqtPee6xmaFFKKJkmvDRx8pIMgoTHtV9d7yVQ?=
 =?us-ascii?Q?YXXcuu0KgHjKeub1aIgOU48L6XXKFys7tB5/an4LHXbfimAbOKy5XruSwZFq?=
 =?us-ascii?Q?4t+sYBSsOg3dtZcqIkrv9iWuyfEWdAtUZA7iOGY9sE4q1eZyVJwF+s6+eDDW?=
 =?us-ascii?Q?U2rm3q3qsBDtUXQl43j6JpPgWXIEznUuJRNP7BidtC3bTHmK45jX57ndmHhl?=
 =?us-ascii?Q?cVBoFCKdGR4GV7KfpGHNHOsV6O5Zpdksb6RPYAoEKdePEG2N74qW2wJO/1Ma?=
 =?us-ascii?Q?C1pNFZI7t4KPOC5xtpoKF8Z+D77hBJT35E9LnEN32E3g9gCJMruKXu48UZNs?=
 =?us-ascii?Q?pWyNpKWOwPeCjp4vxqq3FGYvA/LM73iiLsCWebcjjVQYyzlb64r8ArX2jZ9c?=
 =?us-ascii?Q?8iyZe4r386qF0JctvhS0iheDoY4ZErEKhr7/C8bl43I++DEG8FCMkaEvA6kX?=
 =?us-ascii?Q?CZmVLhI+0yOSsplyoAmS/Jg4Ic/lEbycohZxiVoMxvEOzRoEuy/C+dG4vmEc?=
 =?us-ascii?Q?oTc3/OCR6bcrdoekPtYfwzvnve3N3u1ZgS42KZ64AsJB4SQwER7Gi6lOY3Yv?=
 =?us-ascii?Q?cQ3rxX/nVjETGL8e4ObBVoQxlJeQRwZQCAu5M+A5qRKrd5DWeYMmqzTKcNCI?=
 =?us-ascii?Q?xoBzasRxWyC/5tBMp20uBDlMhVTHwCDoYRFB2j6TNe7QubFu42BXGIDFdFBx?=
 =?us-ascii?Q?oGUBpSRuDloEmEuQw7Sfl+1pjrazNeZ3ne41zTL7KmQyVBdPGTnCxPc18R/S?=
 =?us-ascii?Q?8Gwt/JMJTCjs8+N+ZahPemOJ3heSWax0GTRGyHWVZ+Dzlmlqe183gxTkOH62?=
 =?us-ascii?Q?x0U160EFAC4rk+n7RyuuL0gLMeE66rkEuaZ2Hrcw2unKVZci3W1egLCR4JO1?=
 =?us-ascii?Q?nYeNj737BE52j3PhwXge8jZouHIt791diayVs84zvnEwFZAGTiHVdSlqbYp5?=
 =?us-ascii?Q?61/Tu7joOMORBikw3yNfYwTzP4FbhzI2WPSib+a3bW1WYZB7oecavFna8+WS?=
 =?us-ascii?Q?fPuy160EfQaZ1u63m6Gb25ifMmHhJBW0DFiSpeaFKcmEUGDT5E+b3Pun5LvC?=
 =?us-ascii?Q?96wRnNUyoT+UvrUzWUleo+t8S6fcFiT1jYyKnltvbL/655qM1xz9cJmeBUff?=
 =?us-ascii?Q?069Ygq9NKR0HK/h2P1LdTcSOa+SXNmoQ79Ax8usjEFGszpwQoFvxwQUe9bA+?=
 =?us-ascii?Q?/EoL9A9w0s29PQcaf9UpcEQsiEGT2t8VlntLGfEw892Bh3YaC+MXSz+Uj2tI?=
 =?us-ascii?Q?/WcF35lO0M4nbpYniKBwwUGREJfY9Czq10bQEBKlzPPq5IhXkqZdrwb+wCYS?=
 =?us-ascii?Q?S2Ky5aChLjfJwwWJr+Sr0jHi?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5423.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PzdCWkORiDFk66x5gRHbsb7RwhbWPT1J0wGD+3k4ito/jPTB9SVW3CNQMmaX?=
 =?us-ascii?Q?U735Jpqjho0nkNPzcvtnyHTfqY8Wm0Jcg+9kBh8uDUJcdokHdIEN9Ud/cmpO?=
 =?us-ascii?Q?o5h/W3DbO1EVYSQkKUj7Tnza7niHSWVSG1GMgfrXFZ0IVPTKURxfxiR7j88R?=
 =?us-ascii?Q?6+UFHMloFdKOgQXcxV3DDJQemPRCgXsNagHp0BZ4NCg69SC5DNegvSoFEbFB?=
 =?us-ascii?Q?C93z1CBMJr+VuBXD2KcWyZTUQCnrneV95k/ZcBC+88pMp6eI4l+pooL5UMhL?=
 =?us-ascii?Q?xMKsBCMfuUueQdqXCttFgfOBHieVBQ61tZGielDOjR21uUB3r7cegiRTvtf/?=
 =?us-ascii?Q?00xLUBCdgIX1pLqGR4XVbE5WCLusWyLZYU0oeTZSgNOpvuILoHi+aiL8e6tY?=
 =?us-ascii?Q?JH0AGETMZ2pTZVLoTudFWZ0DVH0z8ATBw0Xq+/DgoiqjFiLQGcmM2sc4g/CI?=
 =?us-ascii?Q?qZSjAS4pSyv0Kz9EKM4Oo9UA0FK3clCFLr+eIsrvc9OW/n3hxGXH4VREbSVW?=
 =?us-ascii?Q?9SU/vbw6qa9wIK4Lz3ETO94viBs2gMzAy9orFc+gaBwAwN5IMvwUy864jfOZ?=
 =?us-ascii?Q?3xtnPXdEWr0EuoriO7h92RlA3Ja2a7279Mqdoecwkzps3H0lM7rgpMOqXPFd?=
 =?us-ascii?Q?gKHcPL52RJWQ9G+WGeE3JGIfxVitC8Kwd2qGcWfnG57A/VjU+Lx6rOKCPXWt?=
 =?us-ascii?Q?YKh82rzf3q3qi/aEWBnTeLwCEWI61phIX6W8dYPM61naOwsni4spz+y8SLGs?=
 =?us-ascii?Q?PynB2p2eY5xblbXpIKJYia/K5SPxK3P2hhY9BnLR6ORh82aEy9Q9v+U0GZN+?=
 =?us-ascii?Q?Y3DKzC0gVcrUxWXPAhZSk36aITHYogcog2iJVcE9z2tLcDrN0hLi/qNhrMkf?=
 =?us-ascii?Q?td1X2yQ+OxNmP9L/GtEbScaLu7kk3cVqu2iPaNAKwp5JecsLnR8FVzrBEjXO?=
 =?us-ascii?Q?7Eulr5lUAkI9ngnq3wzhYadGoMsrOn5fXlcSBweHI3i5cBILV5NzgsPxD/3g?=
 =?us-ascii?Q?DVwSPrHonvMU8bdw9+m08KfP3W7QuTNPr9r8cvMEcjFMRx2qTq+5LJPT6VUH?=
 =?us-ascii?Q?2HFfpSYCI5CmMBVbIbBdZo8YJwPfwtd/LDSornFliL0pTtmSVC0zepdXywu0?=
 =?us-ascii?Q?xh0noOzFMzWDXGdtKWtQweInD1ciWtmKmgFLTBuRgDvx0EjLQVWiEnltCyBj?=
 =?us-ascii?Q?1mUgZ6/MnlmKpoVH0YY5Kq7JHrl1WpAwxgFG29nuLXaC1o+GyR5TUtacxbNS?=
 =?us-ascii?Q?s49dMUotRELimBP8aybOprrASi9feMGkkB5QuJ2NC7aLrN15vINzLma5oTyS?=
 =?us-ascii?Q?3s6jrztsqduq3DOIpbx/Uwunh2qYDGjAn/NelW4/B6PUvo5bV7A+TOkoH0a1?=
 =?us-ascii?Q?1hY61mEzHOMwHq13ec+wf0J08U9SOaU22f7E3wrYMPO/Sb801v29kVSENMK0?=
 =?us-ascii?Q?t+Jr4Q2XZlQGi2zoLQJ5cDubr8E3mAy0f1I/pBJvuWn9AZtzRvas8IEdLC+l?=
 =?us-ascii?Q?jK0ZKQXKJI32HCe0DTg6DRKakqUHZzfjhtiVcOXnt5yeloL1bt0+aKYaJV+v?=
 =?us-ascii?Q?30bJ3J49DWG2R4z0S6DqwJeE2C2aw+CJI5OsLVdK?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3725d96a-ac81-41b2-2331-08dcdefcb1ee
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5423.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2024 14:00:08.1098
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sXEsPKzbq74tV7e/w0zMD8FrWbqURF4IvU46ZbOOtrjETPHJC/aQJgW3PvEzVBwHRUx3jeXpqoXXQkEoXqd4Fw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7075
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-4.19.y-cip-rt
head:   f0b0dc3daffc9639872f52dc74ce62bd887d3088
commit: 3283bcfcd3ee79fba657e1d228b923ec23f66b76 [160/30000] work-simple: Simple work queue implemenation
:::::: branch date: 2 days ago
:::::: commit date: 6 years ago
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20240926/202409262318.QYVJHW2d-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240926/202409262318.QYVJHW2d-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202409262318.QYVJHW2d-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/sched/swork.c:110: warning: Function parameter or member 'sev' not described in 'swork_queue'


vim +110 kernel/sched/swork.c

3283bcfcd3ee79 Daniel Wagner 2014-07-11  101  
3283bcfcd3ee79 Daniel Wagner 2014-07-11  102  /**
3283bcfcd3ee79 Daniel Wagner 2014-07-11  103   * swork_queue - queue swork
3283bcfcd3ee79 Daniel Wagner 2014-07-11  104   *
3283bcfcd3ee79 Daniel Wagner 2014-07-11  105   * Returns %false if @work was already on a queue, %true otherwise.
3283bcfcd3ee79 Daniel Wagner 2014-07-11  106   *
3283bcfcd3ee79 Daniel Wagner 2014-07-11  107   * The work is queued and processed on a random CPU
3283bcfcd3ee79 Daniel Wagner 2014-07-11  108   */
3283bcfcd3ee79 Daniel Wagner 2014-07-11  109  bool swork_queue(struct swork_event *sev)
3283bcfcd3ee79 Daniel Wagner 2014-07-11 @110  {
3283bcfcd3ee79 Daniel Wagner 2014-07-11  111  	unsigned long flags;
3283bcfcd3ee79 Daniel Wagner 2014-07-11  112  
3283bcfcd3ee79 Daniel Wagner 2014-07-11  113  	if (test_and_set_bit(SWORK_EVENT_PENDING, &sev->flags))
3283bcfcd3ee79 Daniel Wagner 2014-07-11  114  		return false;
3283bcfcd3ee79 Daniel Wagner 2014-07-11  115  
3283bcfcd3ee79 Daniel Wagner 2014-07-11  116  	raw_spin_lock_irqsave(&glob_worker->lock, flags);
3283bcfcd3ee79 Daniel Wagner 2014-07-11  117  	list_add_tail(&sev->item, &glob_worker->events);
3283bcfcd3ee79 Daniel Wagner 2014-07-11  118  	raw_spin_unlock_irqrestore(&glob_worker->lock, flags);
3283bcfcd3ee79 Daniel Wagner 2014-07-11  119  
3283bcfcd3ee79 Daniel Wagner 2014-07-11  120  	swake_up_one(&glob_worker->wq);
3283bcfcd3ee79 Daniel Wagner 2014-07-11  121  	return true;
3283bcfcd3ee79 Daniel Wagner 2014-07-11  122  }
3283bcfcd3ee79 Daniel Wagner 2014-07-11  123  EXPORT_SYMBOL_GPL(swork_queue);
3283bcfcd3ee79 Daniel Wagner 2014-07-11  124  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

