Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1F1E368291
	for <oe-kbuild-all@lists.linux.dev>; Sat,  3 Oct 2026 14:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791038374; cv=fail; b=J9yIBXZo3RFCtQ8qIFwDSDS+jU3Lfgl+znyzXFH94zedLopNqt3opyOGFcLzChX0xyeQyU63FwrXj0tT6VTH+epddd9HZ5KyM8WpLprPtQqIpBUMqeQy80ZIDhaL2Crtn3hLKStjCPz8TK10zFYNOD4Tf64YHCts2sFWdg4s5kM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791038374; c=relaxed/simple;
	bh=Hh1sb8Kp/v7in1+auusAlOrZ2EEwTq3rRjF1G3wbXSk=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=Yin2iQFibHZaEPgzXAZ3mkdoLd41jAPRmaqHgiG/0nMkswg7dW/mUgGxYxn+bpR77Rw02gl7FjaJq51xWYLEdnWsazH0LqjXFdXrS1yE7AER9f03KvjF8U1U1FdF4NlV4hoQIkq0tDreyoc9mWw69r8Yuco+BbP/NSWHPb142Ws=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c7itMpnh; arc=fail smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c7itMpnh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791038372; x=1822574372;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Hh1sb8Kp/v7in1+auusAlOrZ2EEwTq3rRjF1G3wbXSk=;
  b=c7itMpnhJWj+c+EQS11IHv3iiSUDLxxwtVakuColXinFveiiywqZKEwH
   0KJ1xKmHsB9HlShEvmKQCo5i08DEhisWzGqkmV1gScwW0Kclagged85m/
   h4bgJFqGT7mMibgp489LRBB9yVhtVH8l76OlHcpoKedEC64Q2WCXIdNAC
   USPZmzjBmugxOFve7mzEBB+jo2qX2LjwIqGYFq8GMw3rUe7PjJ68/f5Vn
   my8ZjFtXnbpncWrDnd1tXXHiUTL2b4jeqQg6tgqL7TZa/JdCvdSPMT33I
   H1/2XWmxLMSYV1esiihD1wIBnzdBiIxmaCCpth3yUyPHrOVuKcZxkx0qk
   w==;
X-CSE-ConnectionGUID: uH7yiDzKT1W9MdRuItYZNQ==
X-CSE-MsgGUID: OOgjM6OzTRmNOf1tI0jVRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11924"; a="109264828"
X-IronPort-AV: E=Sophos;i="6.27,138,1787036400"; 
   d="scan'208";a="109264828"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2026 07:39:31 -0700
X-CSE-ConnectionGUID: 38q6LhPpTHK/Ttan7vZhuA==
X-CSE-MsgGUID: iWqP+UyjTqCIBC9BYLzPtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,138,1787036400"; 
   d="scan'208";a="279707981"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2026 07:39:30 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Sat, 3 Oct 2026 07:39:30 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Sat, 3 Oct 2026 07:39:30 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.30) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Sat, 3 Oct 2026 07:39:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S5HNEVI1NaGJcV1Rpq2R6+6T7woJafMo7r5Z7dHFrQjB/UCuapJ57mdLNfAW03W6NhepgIQMba2cVzbngnXh2NfNuOJiXVBOmqEjZSgoBSEIS1B5BJEn9JuLJ7LBsvmx44FlGLGeqcKQyp8ZfxPEW5RkdLSus3eJoPatbtPL1oFiCFPbwLQ/lsZ5OHFSpnHZlEfxMb3H5R66b4UlMQPEHXr0YOEtVwrFegMC/Xqwp1J5sLystnfbCi5KFpdz4zkB+a+Tf6aSrbAQbdqNJjG1pVPKVBMA9SombilXB5xws09Nq+rIjT72lA5oW7fQe/lanOaST0GqUW4B+HQRD0dsNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qJH/wPAA4rooVAFj23Gjip/0o1A15DTfGFsvXva54Ok=;
 b=prM0hXBM5CTXiwaF/18xVVgAv3srq6CBdTMhflZDmhGWJKs9XlVPwnFTcrW0DPKdIzgzvNK1gmaXE7S4oW0hXqVVmL8Fbo8ljCwnEzgkG3dxWapxWyhJ9irosf7k3cBAngBOBqaayhcy51g8FlijbAD+z1Ooupcihye1nPuaQJa2ybuI604oLmxnHLPqCV5Tmt20PKX/6iqD7T/cioolPUB4IGY2cZ12MWaWcxsRnGPqmb4LqUambMTfolcxzcQL+AUWGEMZrqW/OgkphH5sftOQ7NR95MyrrZ6y+218bnD1GpAhSRKrhsRnVNwMuNtAflx6q15jZIF3HudbMadGDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS6PR11MB362586.namprd11.prod.outlook.com (2603:10b6:8:4c4::14)
 by SJ1PR11MB6081.namprd11.prod.outlook.com (2603:10b6:a03:48c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Sat, 3 Oct
 2026 14:39:27 +0000
Received: from DS6PR11MB362586.namprd11.prod.outlook.com
 ([fe80::71a6:38f9:43ed:8f8a]) by DS6PR11MB362586.namprd11.prod.outlook.com
 ([fe80::71a6:38f9:43ed:8f8a%6]) with mapi id 15.21.0472.016; Sat, 3 Oct 2026
 14:39:26 +0000
Date: Sat, 3 Oct 2026 22:39:19 +0800
From: kernel test robot <lkp@intel.com>
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
CC: <oe-kbuild-all@lists.linux.dev>, 0day robot <lkp@intel.com>
Subject: drivers/clocksource/timer-mediatek.c:313:21: warning: variable
 'clk_bus' set but not used
Message-ID: <asETl3VQat3cjV30@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: PH7PR02CA0019.namprd02.prod.outlook.com
 (2603:10b6:510:33d::25) To DS6PR11MB362586.namprd11.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: 489aedfb-790d-47e4-597d-08df215c1ffc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|10067099003|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info: l3Wm0n028n6Q2iFl+eaRt9ki657bVNsCtH0taXJnPrrecjWhM4FCVXOjjrLh5dlrUKcFf6om5sNfUN89J/F95JbKFybWjWsiD6iVwAAtg48enBWVeswEzMsxw9VyaGOnPQZBUmVdAlUavp/3qG54s4anhAjOk7Y5VN4eqjvSQWSI+dvf4GL0hIvS7eiMcnVeVD5ZwM0G0/XG6j77Bt2I7Ku4iMoXGtEdMVJfMGHfW9zsSvD2XgM2sxpVhLJUTUgNsGwfa2/LkvZAInyYxSJn9rjeUYCthEnYkCba1373DMbApakjGHB/KYCCM9wxAnvm6ITUp66DeHZdqCtkt3J551yoFsRrq4SW+PJJHgEEI39qvVY5xzfWLpL5CwR+RNd0TyJBoUVArzDVXAbyHN4yRWxh+VVNYSjhslOQOtRTvbYqwPyw9d4jaPu9y1SY0dNwznHri6Iz7Vgmq3zZVqdrR3EJDHqZt5NpgV3ejeH+0cDp8RWHOEryUu4oiz/Joljs+DvudLmAaj0yd7GFesPFY5R2F98ZeHu4gghtM0TnKAUgPmea+9/jRl1u+OUf5kHIh2EAIXYCu+BWVITDto8PY0swG4BQGQ4FlEkPJf0V86C/U/f6oIPXAhM78zGaOXGo
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS6PR11MB362586.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(10067099003)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lY4Tt/v3paeFuL/0KUYIgp/5+dEbYeUZtE9hxPaUfTLSxXJvSGuNDqf9Kqlg?=
 =?us-ascii?Q?IqVWsw02qIvIqMhhL1jDhRVEnGGkmhxVPNhzcq4Koo65Z/Q+KTOnowGTSsUR?=
 =?us-ascii?Q?wAd5SXjfZmnlUpwJ/fgJYpg2e++jrsM8wA5GHU9YWL6VVJsCHglKQ1wuXlwd?=
 =?us-ascii?Q?+ISK1XbZEC64lSUlPUVwK7FGsr8lecNoIo/J2+PMugX5dIn+6MX5Yhr/e/oj?=
 =?us-ascii?Q?bM0aSdyosiS0gkNP73lPLJNAK+se9hSYJHjMIqrYLimlh1SusJVi010tCacm?=
 =?us-ascii?Q?/ZjFCG3owKgpOobVBcao8VHUmYhj5PM13RBwMDlipdvldWSIMxHVsufZT3/g?=
 =?us-ascii?Q?Kmj+g7CKi2E2Gj9OeZSM4xhx/FIv+frq0nMFMszWqInrfUPzcjrX+5OGPnUR?=
 =?us-ascii?Q?Yjng7BgIDXJwmMDYYGVaqCac5roxXozDJGa2eC+WvZVxJuG9iNEpMHqxGDK/?=
 =?us-ascii?Q?Ewold5YRkSReShzxuCy8N78GQxtFq4c3DGr6g6TMqP9FjuzVFj92xEIVRj8K?=
 =?us-ascii?Q?KYqvNm+z9hUtdRgDn/bQyXlRwRd1y+ps8unmxl83hfCicNsNLa83WmCIB++7?=
 =?us-ascii?Q?UdfMsW+cVycg3nJrXfDSeBgmvCzyNZ18FgR3mk130VZXsJ9HoCw13t+imsPe?=
 =?us-ascii?Q?CEIfhvFWcQFdnutyyKkiGy48KEXIJGjsfdO/d5d4MGEgZiU8zUJ81qdxCTt3?=
 =?us-ascii?Q?NTYNGJYqMalLjA7phDpcO4UnrEmg6C8ZdmpxYNSandaSXoOSqXgiHXkhlwta?=
 =?us-ascii?Q?pu8jw6xAx6eBlPPYQiJoLMTn1aVS4pCEETlsa/EoYQGW1XHb/+4st9MDyydE?=
 =?us-ascii?Q?KESWnFiayh+JbyjhcD81JEUSQmPM0PvmdOdE+A2o9xgRCW09ewhy2ciL719F?=
 =?us-ascii?Q?UJJS4opccAYxxiz8Q8pW7PXkGU2iRvrajMG4pSZ3YGCLjsXHucY0NGbcrvTY?=
 =?us-ascii?Q?Wtm1PacaHq1pXNW84tSKrgXzN5kLeStfYMGvjenvEL1cUY8Nsf5m6xQ/dgHi?=
 =?us-ascii?Q?mpKyNBlbGf4QWXOiJUukscswW3iLQ1lqwrehKblUfpAXdl7BgzDmeXyokwhW?=
 =?us-ascii?Q?300Iu9BozhigTz6c+CYYuon++hl99ctqK+UStMhflRpyH7COf/+YL694szFQ?=
 =?us-ascii?Q?laK+Va2X4r0TfaIRXv6JsnMHteaqp92S6ArnKsgv1Qf+WbHGSx1WLW4v9s0f?=
 =?us-ascii?Q?fgBI0fBcKszkKusVdpKp4xh8GuEJMgQ6Ce40Ac1VKV+xbqodeWVbFezSM2Dw?=
 =?us-ascii?Q?EL8v8u6LBYZ4rHZJZE7jPQkz65LGSP1qJuWb9jpqLyh9G52387g4qDuQK2SB?=
 =?us-ascii?Q?OcbZjMad+kAZSJAKJziWu/r/obsT7xLDpN5kT/BplrwjqzonRXYvsDSso41j?=
 =?us-ascii?Q?/9lPFAsdCGbrTaCtiETL+U+tTgQX2CWfNhX6XPGsEk1EA92BBQKQr6iaZLrl?=
 =?us-ascii?Q?Uung4AFIOSP2obL4th0gxaT0p3MXyiuBDh0cJadNHdq1wn+Z2Z/7htmR74/x?=
 =?us-ascii?Q?oNadA6Vy7Lhg6c4bGnY4dFm8A0JKnVR4taigOegFzDaCITf9DNR7L9QfbsLv?=
 =?us-ascii?Q?4meWzm50a71mVgJ1MNg5AgiA5q2HldYoRDx/eKXVnYxDnPPEoTDGqNfEzhEW?=
 =?us-ascii?Q?jkG4PxHElBnrlXoOYLi4KBLE3nLhwl0b4dQ1vPyxvmI5tW3fRMosRO4fcDDe?=
 =?us-ascii?Q?n84OVfZGC1iPu5DmCbh2zpxKtCWB3hZc0ryTPMcf3WonyaD2qCybLRrNJk48?=
 =?us-ascii?Q?8YNwzC6qRw=3D=3D?=
X-Exchange-RoutingPolicyChecked: vWPfACeVM2X+2JmTCI9+9BXsvyaw7vsgYftOLrVIrHyPxuqI84ZIozfHGPP2csXkFk9KPg984mIpaUH13YzYUUejWNq9HadQKvYjNkmLEAF6d4vZ9SDF2qDeXM5rihJAgkpkMTz7mdO+YDuouviNXBSK84iX4rxrPkEVhCPbaE+SiJsshZnTx1ZoniDZx7gfhSVkq/1kKG8gAUMwHI6dEvOE3YXafU2MPn55hVyZQVUZBRiNqq+RHkyVEDyvwVNBnBAs/71pCoateb19fNB3H5oRsNW6S0xNiBI85OhLdLIzmEKm2u+RkxsvlJiWXdEfENAfY32KcY7hZdXKnuGvKg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 489aedfb-790d-47e4-597d-08df215c1ffc
X-MS-Exchange-CrossTenant-AuthSource: DS6PR11MB362586.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2026 14:39:26.8101
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oDkmhBFoGIOBUNz5PdgVs+rBKuoqjs/KYm981VUnektTkrbGYiLp2KYwrVriBu2P5nTBflBXAQsOIigSff4vfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6081
X-OriginatorOrg: intel.com

tree:   https://github.com/intel-lab-lkp/linux/commits/Luca-Leonardo-Scorcia/clocksource-drivers-timer-mediatek-Fix-random-crash-at-boot/20261002-091926
head:   0c8c1bddeb603ee5834db94da982745e97c68119
commit: 0c8c1bddeb603ee5834db94da982745e97c68119 clocksource/drivers/timer-mediatek: Request and enable the bus clock
config: nios2-randconfig-1001-20261002 (https://download.01.org/0day-ci/archive/20261003/202610030158.tLq3nt4t-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261003/202610030158.tLq3nt4t-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610030158.tLq3nt4t-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/clocksource/timer-mediatek.c: In function 'mtk_gpt_init':
>> drivers/clocksource/timer-mediatek.c:313:21: warning: variable 'clk_bus' set but not used [-Wunused-but-set-variable]
     313 |         struct clk *clk_bus;
         |                     ^~~~~~~


vim +/clk_bus +313 drivers/clocksource/timer-mediatek.c

e3af677607d9dac drivers/clocksource/timer-mediatek.c Stanley Chu           2018-07-06  309  
0c8c1bddeb603ee drivers/clocksource/timer-mediatek.c Luca Leonardo Scorcia 2026-10-02  310  static int mtk_gpt_init(struct platform_device *pdev)
a0858f937960d24 drivers/clocksource/timer-mediatek.c Stanley Chu           2018-07-06  311  {
0c8c1bddeb603ee drivers/clocksource/timer-mediatek.c Luca Leonardo Scorcia 2026-10-02  312  	struct device_node *node = pdev->dev.of_node;
0c8c1bddeb603ee drivers/clocksource/timer-mediatek.c Luca Leonardo Scorcia 2026-10-02 @313  	struct clk *clk_bus;
a0858f937960d24 drivers/clocksource/timer-mediatek.c Stanley Chu           2018-07-06  314  	int ret;
ecb3530dd59ddd5 drivers/clocksource/mtk_timer.c      Matthias Brugger      2014-07-18  315  
0c8c1bddeb603ee drivers/clocksource/timer-mediatek.c Luca Leonardo Scorcia 2026-10-02  316  	clk_bus = devm_clk_get_optional_enabled(&pdev->dev, "bus");
0c8c1bddeb603ee drivers/clocksource/timer-mediatek.c Luca Leonardo Scorcia 2026-10-02  317  
a0858f937960d24 drivers/clocksource/timer-mediatek.c Stanley Chu           2018-07-06  318  	to.clkevt.features = CLOCK_EVT_FEAT_PERIODIC | CLOCK_EVT_FEAT_ONESHOT;
a0858f937960d24 drivers/clocksource/timer-mediatek.c Stanley Chu           2018-07-06  319  	to.clkevt.set_state_shutdown = mtk_gpt_clkevt_shutdown;
a0858f937960d24 drivers/clocksource/timer-mediatek.c Stanley Chu           2018-07-06  320  	to.clkevt.set_state_periodic = mtk_gpt_clkevt_set_periodic;
a0858f937960d24 drivers/clocksource/timer-mediatek.c Stanley Chu           2018-07-06  321  	to.clkevt.set_state_oneshot = mtk_gpt_clkevt_shutdown;
a0858f937960d24 drivers/clocksource/timer-mediatek.c Stanley Chu           2018-07-06  322  	to.clkevt.tick_resume = mtk_gpt_clkevt_shutdown;
a0858f937960d24 drivers/clocksource/timer-mediatek.c Stanley Chu           2018-07-06  323  	to.clkevt.set_next_event = mtk_gpt_clkevt_next_event;
75ac5cc2ee6b499 drivers/clocksource/timer-mediatek.c Evan Benn             2021-05-12  324  	to.clkevt.suspend = mtk_gpt_suspend;
75ac5cc2ee6b499 drivers/clocksource/timer-mediatek.c Evan Benn             2021-05-12  325  	to.clkevt.resume = mtk_gpt_resume;
a0858f937960d24 drivers/clocksource/timer-mediatek.c Stanley Chu           2018-07-06  326  	to.of_irq.handler = mtk_gpt_interrupt;
ecb3530dd59ddd5 drivers/clocksource/mtk_timer.c      Matthias Brugger      2014-07-18  327  
a0858f937960d24 drivers/clocksource/timer-mediatek.c Stanley Chu           2018-07-06  328  	ret = timer_of_init(node, &to);
a0858f937960d24 drivers/clocksource/timer-mediatek.c Stanley Chu           2018-07-06  329  	if (ret)
41d49e7939de5ec drivers/clocksource/timer-mediatek.c Fabien Parent         2019-09-19  330  		return ret;
ecb3530dd59ddd5 drivers/clocksource/mtk_timer.c      Matthias Brugger      2014-07-18  331  
ecb3530dd59ddd5 drivers/clocksource/mtk_timer.c      Matthias Brugger      2014-07-18  332  	/* Configure clock source */
a0858f937960d24 drivers/clocksource/timer-mediatek.c Stanley Chu           2018-07-06  333  	mtk_gpt_setup(&to, TIMER_CLK_SRC, GPT_CTRL_OP_FREERUN);
a0858f937960d24 drivers/clocksource/timer-mediatek.c Stanley Chu           2018-07-06  334  	clocksource_mmio_init(timer_of_base(&to) + GPT_CNT_REG(TIMER_CLK_SRC),
a0858f937960d24 drivers/clocksource/timer-mediatek.c Stanley Chu           2018-07-06  335  			      node->name, timer_of_rate(&to), 300, 32,
a0858f937960d24 drivers/clocksource/timer-mediatek.c Stanley Chu           2018-07-06  336  			      clocksource_mmio_readl_up);
a0858f937960d24 drivers/clocksource/timer-mediatek.c Stanley Chu           2018-07-06  337  	gpt_sched_reg = timer_of_base(&to) + GPT_CNT_REG(TIMER_CLK_SRC);
a0858f937960d24 drivers/clocksource/timer-mediatek.c Stanley Chu           2018-07-06  338  	sched_clock_register(mtk_gpt_read_sched_clock, 32, timer_of_rate(&to));
ecb3530dd59ddd5 drivers/clocksource/mtk_timer.c      Matthias Brugger      2014-07-18  339  
ecb3530dd59ddd5 drivers/clocksource/mtk_timer.c      Matthias Brugger      2014-07-18  340  	/* Configure clock event */
a0858f937960d24 drivers/clocksource/timer-mediatek.c Stanley Chu           2018-07-06  341  	mtk_gpt_setup(&to, TIMER_CLK_EVT, GPT_CTRL_OP_REPEAT);
a0858f937960d24 drivers/clocksource/timer-mediatek.c Stanley Chu           2018-07-06  342  	clockevents_config_and_register(&to.clkevt, timer_of_rate(&to),
a0858f937960d24 drivers/clocksource/timer-mediatek.c Stanley Chu           2018-07-06  343  					TIMER_SYNC_TICKS, 0xffffffff);
d4a19eb3b15a4ba drivers/clocksource/mtk_timer.c      Matthias Brugger      2015-02-19  344  
a0858f937960d24 drivers/clocksource/timer-mediatek.c Stanley Chu           2018-07-06  345  	mtk_gpt_enable_irq(&to, TIMER_CLK_EVT);
44a6e9864ca801e drivers/clocksource/timer-mediatek.c Luca Leonardo Scorcia 2026-10-02  346  	enable_irq(timer_of_irq(&to));
d4a19eb3b15a4ba drivers/clocksource/mtk_timer.c      Matthias Brugger      2015-02-19  347  
d64e24ce5fdddd7 drivers/clocksource/mtk_timer.c      Daniel Lezcano        2016-05-31  348  	return 0;
ecb3530dd59ddd5 drivers/clocksource/mtk_timer.c      Matthias Brugger      2014-07-18  349  }
322dca3aa6d9da7 drivers/clocksource/timer-mediatek.c Luca Leonardo Scorcia 2026-10-02  350  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

