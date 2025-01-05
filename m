Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F321184F
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Jan 2025 05:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736055398; cv=fail; b=H19isfHK22jYWObLXxES2YxQ448F0UnTC6VqYsoYill7h6+CyCQuCl1R3+04OGHyvBq27gf2p9FDeJMEVaJ6oiKMpuZ52lreEhA4J1/dUUaN821Dp9S6tuJ49y9oyb6eTzj0gHeTeUxPtoGHr00TQlTgX89sB70nTqhw2+m81io=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736055398; c=relaxed/simple;
	bh=mRYpfIBB404YYyG3buexUTfczf0Su70t/rIh4bqPvws=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=eTOSOd+qKsYHH3KxeyZJF51b4UfTGNni9fE3itqugl0c9UffcEe/IABVk4ItTuvju12qKsYsLXAi4CXU6GmR+c+92lKix7/mtxCn1vMMY/ghzS+QXjPKT8tgOaJNcIOdVBnpU94hQe9e4hATGCjuaM90P9pyazSE+G8jeT3f2FY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ev6WjN5u; arc=fail smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ev6WjN5u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736055396; x=1767591396;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mRYpfIBB404YYyG3buexUTfczf0Su70t/rIh4bqPvws=;
  b=Ev6WjN5uhry8sZCDkqf61xX/GE2COTv1N1EvPQ0bVSUJVnM3rP461x3E
   L/IIhhPtU008Nl5plMNv+9KN7BnP58sUd7K9qq2baM+SOZjZNqGcNV8gL
   f7anY+uUaOfhyQ9Ba//5X24QRHgydKFlMHWcFTOvwi8Gy8pj08wRwPmXH
   I4hlz2dvjJCr6whx9jRH0LzzuUKijnJ4viPxYx01LiT6nDJrFKlocJ2I3
   5Ej+4mn8i5xh+wTXDkr7w/9xIzNOuV7AHeUXt/ratrDhtlgMsXg3gKTxm
   OLqnQVeyTmhLOMRvkQiOS4Ej92lKi6oSdrxHidDDL4gYQV+2arTavlDeN
   w==;
X-CSE-ConnectionGUID: HqbLaTCiQomT3m6ox2j9lw==
X-CSE-MsgGUID: PFaWt7JhTFG9stXoZm+mcA==
X-IronPort-AV: E=McAfee;i="6700,10204,11305"; a="35938190"
X-IronPort-AV: E=Sophos;i="6.12,290,1728975600"; 
   d="scan'208";a="35938190"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2025 21:36:36 -0800
X-CSE-ConnectionGUID: hR2u99P/TD6Womf1DTIzxQ==
X-CSE-MsgGUID: VBLoZyT8RX+5TCCd+rFX7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="106176317"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 04 Jan 2025 21:36:35 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Sat, 4 Jan 2025 21:36:35 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Sat, 4 Jan 2025 21:36:35 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sat, 4 Jan 2025 21:36:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rNaFkCTBwJAEfqPP+mWj+kBVR8SwPoD5U/CcGkKpnL+0zUdcXXl45BLvkwuCzcCjthS1uWLAPCdS9hC325CLrOjB9gc6y7OJO1eILBGMqyad4tVAWlWSZpZLpH3TjPTfpBOHfnytKmOBKBNDvo7IMmhhr/Ae3Dw4YMQs5LSpiVAqSJA1GETVfWVSDwWyRIqOlP30YpmXasCyHszR3aWwm38vrmv2iRKs7B5omKUDA58oDNfHzUpOdQm4U+js50dToIzOMJr0qGmkO03k+T9YoloEkkXQeReeRBVu/cMayEHfm40+RtgyV7PVYhtru6TGtnfSSbmfqF4xNdt7t4HfPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n7Vpolw0X+y5Rmct7E4js3vbdQOQ7puRX90jfVYC+aQ=;
 b=YrH3ixk23DErgERXDzvY2ZKb2d7KScNKddO6IhWmmVpPnYGZrl4N+90P2opkcHI58ni5/hZ6nl+t+3CRRZ+S0cWBppAUjVSIjSHrfbPWVsWbIRL4hlheMmRoqdoJozL+GcHthDB4fyPNSh8BTm1wVFb0S1qc1yzkGzLe06q7q4XELhKn9aVIqI3S37IgtldhBwQajQz6hlrWOET3nuA6N6K+2c1YxjBIwQRCRiHMJ/kk/dMtXX549pRnUnmzdXvEP39hZbLWP+RPRFSGsENZvJ6tG+q+mzrPun4dDaB4xk1dutpbOU1QMFQQ/coNNnm3Xii9cEOkpoot9F2Psi5JKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
 by IA1PR11MB6515.namprd11.prod.outlook.com (2603:10b6:208:3a1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.13; Sun, 5 Jan
 2025 05:36:28 +0000
Received: from DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e]) by DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e%6]) with mapi id 15.20.8314.015; Sun, 5 Jan 2025
 05:36:28 +0000
Date: Sun, 5 Jan 2025 13:36:19 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>
CC: <oe-kbuild-all@lists.linux.dev>, <linux-kernel@vger.kernel.org>, Tejun Heo
	<tj@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>, Mark Brown
	<broonie@kernel.org>
Subject: hotplug.bpf.c:15:42: warning: declaration of 'struct scx_exit_info'
 will not be visible outside of this function
Message-ID: <Z3oaU3QY0L8xKnNg@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0174.apcprd04.prod.outlook.com (2603:1096:4::36)
 To DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5423:EE_|IA1PR11MB6515:EE_
X-MS-Office365-Filtering-Correlation-Id: 5dc7a7bf-0bae-406f-0239-08dd2d4ae6d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?PMWTxLjBygIRq2SUJDqvwrnOLiQ+F7poSTraEE7iqJjI1CzfkeShsRq/9Iig?=
 =?us-ascii?Q?8wqjyTn3RTBx1mtj56mc5CBcGJQNry1BPXz2qe38Vquhy1Zjl6zA2uilrToN?=
 =?us-ascii?Q?ampa9whlLSE7oPZDHIw0sX9lJr4eMNX2n81tS0sHryuGoGxNDQrHMQAfi+Ol?=
 =?us-ascii?Q?2sam1ZuOY4Rb6oy9NKSYqUDPO1Rfg9MFqus/DW5yAvhmqEdZmqK/4ovUjZ73?=
 =?us-ascii?Q?8W3rdg1KYQWB1IAO18b6PL+QCL60CZfr953EBL4nxaQtO8/Fd4IZEMblvVw/?=
 =?us-ascii?Q?FAJDrxXrcfJPjpNRBk+YH80/U51Vn68/MdF53youYnwBMuqKBYwfL5PfZ6+r?=
 =?us-ascii?Q?mgVtuZGN8518LHg/ocRZWYpE+Wk9oosuigdMYU2a+nows4sMdBGfiaSbBo4K?=
 =?us-ascii?Q?/ph9DVTM2PATXBeq2h5Q1MqzBs1196ZfKx6Hp33E9gF5sZZex5GGuSzgBiw7?=
 =?us-ascii?Q?WPFOQgK4EfYrwNdPx7SeMkWlFBMDs6JRQk2cv3P28SGEAXtHJ03Gw0RjvQdk?=
 =?us-ascii?Q?1tHx0xEE9YAjHNpuK5nyjzlLxS9NB/gMgyKI61ABz25P251b6SOUT+QwKg5k?=
 =?us-ascii?Q?Z+/mAJ9hXO3dAGl7HRtrFBgBYO4yPFsZl9NwJkZyC83oT63O4ltMZP+TdE4O?=
 =?us-ascii?Q?hMD1tlU2BamfzE67OaK7PD1IxXhhb9wTS/EAvXwUodfX2HSLZxZ/zl4r8mha?=
 =?us-ascii?Q?hmhTTW+gvM4QgtQdKHqRW3rD4cpKywRvFHN0AGgFxDybQAjsbVEGXu9nC8Jj?=
 =?us-ascii?Q?MY1DJuAfbij4xgysrsO7YFBpOT4kTp/zR0hXyXc/wMarGPaSTAaCaywvizr0?=
 =?us-ascii?Q?RqZtg4RJihzn7MLadFZqrVCbSNo238rIQRb2cOzSba/ju3W1XF7byIqZh9EH?=
 =?us-ascii?Q?tP1kHZ+yMZDJRirraT2TYsZcVbrGhjmHM8t+ehlGi9Ro22GUNx1TFLqPDNWJ?=
 =?us-ascii?Q?s7FJZtYwCOTebLuXoWhjgXlwgbX36JsM+U1afFWEiLOnGF0IkHPPwvFbDyPu?=
 =?us-ascii?Q?3IYlpavbrCGXtlyG/pPibOpEBk68vGH1JDyz8vn95pHjXnGI9iUqsbDP1p+E?=
 =?us-ascii?Q?TcgLeIMju4hhNrd47irqILDAd8JYdB5DpfgM8jLEe9B/dAvgxTo1CMgB/mbo?=
 =?us-ascii?Q?cFMiJQodPybRXAlJYgBYMc0LNmkPIxlO+0TsW8fA0V4zPClNTr4d6lFYjBtE?=
 =?us-ascii?Q?lOvEV3J8z1elwJYCVYNMQFdMspJv2obVP4iUzXTo0MPQJfGW9JgPhh6WzFNU?=
 =?us-ascii?Q?DCy9urCWTl8BBMOWFcfCMuN1wXb6xiEJw2sXTipO1mnrkM7b/75Z/ePUfPEe?=
 =?us-ascii?Q?czFUVp9KKp127Ia0lFsLGrSrI0IBbkGkn4fbTJvRn5eJCA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5423.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EF/2tYsjjim7Q17Wna95sL80B65smMmbs4+anVBqxuy2pWnL7YY5zmEmCJLh?=
 =?us-ascii?Q?rn1FPeTjmx4VbpTboXsKEQ0Xy+O8WENnFqa8kCukMnBIb50DIsWNw4WMcioP?=
 =?us-ascii?Q?wzQD8MNw0zZPtJCfEpjh6Ps3tlgiWSzBd9NmDyaFU8mpEg380b6/m7T8zkxQ?=
 =?us-ascii?Q?l43PPAdYcvXPV/0YPvUsCG9etv9qOsnyBhpRPdNOfQYYXtP8AboiqBXObtN8?=
 =?us-ascii?Q?xdg1kbo41a6JN2MXAREkrg4LmZJ9j90akdZVEUkBoIjSL1dQKrTC355U1xPJ?=
 =?us-ascii?Q?mShr1HCMvt/cJd0+yPsYxyGMw9FFwSdovypJs6uhZIFFhyZn+z0/4aC4Iq9u?=
 =?us-ascii?Q?X2/YGy6EHxr5APu0ir5+McVwevXkJcE0R6zDO+E6Tr9+7V2L3kw+zqel1PSv?=
 =?us-ascii?Q?0dqqiSaqhUKAAflW1iH9cJIrPpjbazp45wlDagJ2r7rJBzK5YBrUZWt6UQmn?=
 =?us-ascii?Q?Y3xzTVaPqeNDIsUURs6k347QzhKJQEkAj8tDNjddsX2k+w9SARTpWinJT2IL?=
 =?us-ascii?Q?SnOD7PJhmwLK5L9+IGNeUu68Bh4dYBMA/RFBpi46GFiTU7j89k/jTDvb7O3Z?=
 =?us-ascii?Q?j6y/J+LRBsLnutem29a+0Y81ogDTqQsmuanqQFRCGUem/ieR0zs+glKhXqhX?=
 =?us-ascii?Q?Rk+LA5WN1myZNeQqLOd6QBjZ/zIloXH4asGziGLIiUrJQktPR3yTCrWxyXkh?=
 =?us-ascii?Q?EqJxVr8mWwq2VQSEGHGHXy2Bu4ieQ1ZtaqCeC631pXmScV8FYTu9GBcGP3l3?=
 =?us-ascii?Q?qwpNdjX8aj0f3soVDZee1ufTaSnQsBxR/Y1E62izRfddsyQ4Fj/7vTPZCOxA?=
 =?us-ascii?Q?tfMGN2awvYU2BhO0eME8WoxjIFJ7+iciC8eq05/EEViiqwDOOoKAk/pclbpP?=
 =?us-ascii?Q?3wkxFM74PDPsYFHQ+7F0bxzq/gtY8OgYenH9cIis2sQ/7amLmdHzmIYzaJba?=
 =?us-ascii?Q?IVu4aV2o09U/BeF3QBesQCpTPlQGUI6unjK/sGsot3Hs0BCYooI1+TTxOwPt?=
 =?us-ascii?Q?G+0eHJzsA9cWcBjj5mAyZv8fdM6toRDKOovgjFLW3MMsao+OA3c3zLaTJ9sS?=
 =?us-ascii?Q?HPwoUhwN4d/VUQg25AjwvXDmwkx6BgvLKPmi5W43YYaTgLLG46RnObdxW/i5?=
 =?us-ascii?Q?Hnh5jjlzsgDqVScnKtAJzBM6jA26EDcjiHJd5BUzIGkCpPO71CQv2rSBJ6Tw?=
 =?us-ascii?Q?mnVyGU+vmmfQ0JVUGAnkdp+dHlRnu56TnBnxwCR/HCfxjKZjEHgmSdLjrhmn?=
 =?us-ascii?Q?ADsgY+prjq1zkzWEylQn4bA2tdpUL64w5CBetJjQuKszXXX5E07sQPj3omUi?=
 =?us-ascii?Q?Kj03830Uo4erP7Imn1co7Z8pBIGyXNpChIrhVI8Yj69qimzffB/AWnkqIJFK?=
 =?us-ascii?Q?5KSaOZ1hwcZCvdPqijkc6LHpaZQjcKJBpTC48cu7APXbG/yrbFfZ5Dn0HWmj?=
 =?us-ascii?Q?lrRiE7Eba9Bg5X7MwqWYGtClb0VTLkeGldjQiL2ZCQSYbrN4peiCDIIyQVpO?=
 =?us-ascii?Q?BV1KTCp0kwty7nVqGfAhxU5yL6JeNHS1blbu3jzHTJQbrB8qrUj1FELu0Wlp?=
 =?us-ascii?Q?BrjINTXcOWntgU2UYnTu3hDme+y49x93wqzsDNxehnBB2GK+sVEgjHKLfz/9?=
 =?us-ascii?Q?FQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5dc7a7bf-0bae-406f-0239-08dd2d4ae6d0
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5423.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2025 05:36:28.4468
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bzV0UrVsU/rJ1iQqDfelobdGr3pcjD8TkeduZiG/XwFCuo2Tx+1EsqfgR+++FIPEjMEJ19AfGWy0yYApWfPN8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6515
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   63676eefb7a026d04b51dcb7aaf54f358517a2ec
commit: 7941b83bceb374c7e81061e0ebb45cd45f3e3517 selftests: sched_ext: Add sched_ext as proper selftest target
date:   3 months ago
:::::: branch date: 14 hours ago
:::::: commit date: 3 months ago
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250104/202501042104.qwmnqKH5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202501042104.qwmnqKH5-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from hotplug.bpf.c:7:
   tools/sched_ext/include/scx/common.bpf.h:33:17: error: use of undeclared identifier 'SCX_DSQ_FLAG_BUILTIN'
      33 |         _Static_assert(SCX_DSQ_FLAG_BUILTIN,
         |                        ^
   tools/sched_ext/include/scx/common.bpf.h:44:49: warning: declaration of 'struct bpf_iter_scx_dsq' will not be visible outside of this function [-Wvisibility]
      44 | void scx_bpf_dispatch_from_dsq_set_slice(struct bpf_iter_scx_dsq *it__iter, u64 slice) __ksym __weak;
         |                                                 ^
   tools/sched_ext/include/scx/common.bpf.h:45:49: warning: declaration of 'struct bpf_iter_scx_dsq' will not be visible outside of this function [-Wvisibility]
      45 | void scx_bpf_dispatch_from_dsq_set_vtime(struct bpf_iter_scx_dsq *it__iter, u64 vtime) __ksym __weak;
         |                                                 ^
   tools/sched_ext/include/scx/common.bpf.h:46:39: warning: declaration of 'struct bpf_iter_scx_dsq' will not be visible outside of this function [-Wvisibility]
      46 | bool scx_bpf_dispatch_from_dsq(struct bpf_iter_scx_dsq *it__iter, struct task_struct *p, u64 dsq_id, u64 enq_flags) __ksym __weak;
         |                                       ^
   tools/sched_ext/include/scx/common.bpf.h:47:45: warning: declaration of 'struct bpf_iter_scx_dsq' will not be visible outside of this function [-Wvisibility]
      47 | bool scx_bpf_dispatch_vtime_from_dsq(struct bpf_iter_scx_dsq *it__iter, struct task_struct *p, u64 dsq_id, u64 enq_flags) __ksym __weak;
         |                                             ^
   tools/sched_ext/include/scx/common.bpf.h:52:33: warning: declaration of 'struct bpf_iter_scx_dsq' will not be visible outside of this function [-Wvisibility]
      52 | int bpf_iter_scx_dsq_new(struct bpf_iter_scx_dsq *it, u64 dsq_id, u64 flags) __ksym __weak;
         |                                 ^
   tools/sched_ext/include/scx/common.bpf.h:53:50: warning: declaration of 'struct bpf_iter_scx_dsq' will not be visible outside of this function [-Wvisibility]
      53 | struct task_struct *bpf_iter_scx_dsq_next(struct bpf_iter_scx_dsq *it) __ksym __weak;
         |                                                  ^
   tools/sched_ext/include/scx/common.bpf.h:54:38: warning: declaration of 'struct bpf_iter_scx_dsq' will not be visible outside of this function [-Wvisibility]
      54 | void bpf_iter_scx_dsq_destroy(struct bpf_iter_scx_dsq *it) __ksym __weak;
         |                                      ^
>> hotplug.bpf.c:15:42: warning: declaration of 'struct scx_exit_info' will not be visible outside of this function [-Wvisibility]
      15 | void BPF_STRUCT_OPS(hotplug_exit, struct scx_exit_info *ei)
         |                                          ^
>> hotplug.bpf.c:15:42: warning: declaration of 'struct scx_exit_info' will not be visible outside of this function [-Wvisibility]
   hotplug.bpf.c:15:6: error: conflicting types for '____hotplug_exit'
      15 | void BPF_STRUCT_OPS(hotplug_exit, struct scx_exit_info *ei)
         |      ^
   tools/sched_ext/include/scx/common.bpf.h:140:32: note: expanded from macro 'BPF_STRUCT_OPS'
     140 | SEC("struct_ops/"#name)                                                         \
         |                                                                                 ^
   tools/testing/selftests/sched_ext/build/include/bpf/bpf_tracing.h:683:48: note: expanded from macro '\
   BPF_PROG'
     683 | static __always_inline typeof(name(0))                                      \
         |                                                                             ^
   <scratch space>:42:1: note: expanded from here
      42 | ____hotplug_exit
         | ^
   hotplug.bpf.c:15:6: note: previous declaration is here
   tools/sched_ext/include/scx/common.bpf.h:140:32: note: expanded from macro 'BPF_STRUCT_OPS'
     140 | SEC("struct_ops/"#name)                                                         \
         |                                                                                 ^
   tools/testing/selftests/sched_ext/build/include/bpf/bpf_tracing.h:674:48: note: expanded from macro '\
   BPF_PROG'
     674 | static __always_inline typeof(name(0))                                      \
         |                                                                             ^
   <scratch space>:33:1: note: expanded from here
      33 | ____hotplug_exit
         | ^
   hotplug.bpf.c:17:2: error: incomplete definition of type 'struct scx_exit_info'
      17 |         UEI_RECORD(uei, ei);
         |         ^~~~~~~~~~~~~~~~~~~
   tools/sched_ext/include/scx/user_exit_info.h:42:40: note: expanded from macro 'UEI_RECORD'
      42 |                                   sizeof(__uei_name.reason), (__ei)->reason);   \
         |                                                              ~~~~~~^
   hotplug.bpf.c:15:42: note: forward declaration of 'struct scx_exit_info'
      15 | void BPF_STRUCT_OPS(hotplug_exit, struct scx_exit_info *ei)
         |                                          ^
   hotplug.bpf.c:17:2: error: incomplete definition of type 'struct scx_exit_info'
      17 |         UEI_RECORD(uei, ei);
         |         ^~~~~~~~~~~~~~~~~~~
   tools/sched_ext/include/scx/user_exit_info.h:44:37: note: expanded from macro 'UEI_RECORD'
      44 |                                   sizeof(__uei_name.msg), (__ei)->msg);         \
         |                                                           ~~~~~~^
   hotplug.bpf.c:15:42: note: forward declaration of 'struct scx_exit_info'
      15 | void BPF_STRUCT_OPS(hotplug_exit, struct scx_exit_info *ei)
         |                                          ^
   hotplug.bpf.c:17:2: error: incomplete definition of type 'struct scx_exit_info'
      17 |         UEI_RECORD(uei, ei);
         |         ^~~~~~~~~~~~~~~~~~~
   tools/sched_ext/include/scx/user_exit_info.h:46:36: note: expanded from macro 'UEI_RECORD'
      46 |                                   __uei_name##_dump_len, (__ei)->dump);         \
         |                                                          ~~~~~~^
   hotplug.bpf.c:15:42: note: forward declaration of 'struct scx_exit_info'
      15 | void BPF_STRUCT_OPS(hotplug_exit, struct scx_exit_info *ei)
         |                                          ^
   hotplug.bpf.c:17:2: error: incomplete definition of type 'struct scx_exit_info'
      17 |         UEI_RECORD(uei, ei);
         |         ^~~~~~~~~~~~~~~~~~~
   tools/sched_ext/include/scx/user_exit_info.h:47:34: note: expanded from macro 'UEI_RECORD'
      47 |         if (bpf_core_field_exists((__ei)->exit_code))                           \
         |             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
   tools/testing/selftests/sched_ext/build/include/bpf/bpf_core_read.h:188:49: note: expanded from macro 'bpf_core_field_exists'
     188 |         __builtin_preserve_field_info(___bpf_field_ref(field), BPF_FIELD_EXISTS)
         |                                       ~~~~~~~~~~~~~~~~~^~~~~~
   tools/testing/selftests/sched_ext/build/include/bpf/bpf_core_read.h:173:52: note: expanded from macro '___bpf_field_ref'
     173 |         ___bpf_apply(___bpf_field_ref, ___bpf_narg(args))(args)
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~
   tools/testing/selftests/sched_ext/build/include/bpf/bpf_core_read.h:166:35: note: expanded from macro '___bpf_field_ref1'
     166 | #define ___bpf_field_ref1(field)        (field)
         |                                          ^~~~~
   hotplug.bpf.c:15:42: note: forward declaration of 'struct scx_exit_info'
      15 | void BPF_STRUCT_OPS(hotplug_exit, struct scx_exit_info *ei)
         |                                          ^
   hotplug.bpf.c:17:2: error: incomplete definition of type 'struct scx_exit_info'
      17 |         UEI_RECORD(uei, ei);
         |         ^~~~~~~~~~~~~~~~~~~
   tools/sched_ext/include/scx/user_exit_info.h:48:32: note: expanded from macro 'UEI_RECORD'
      48 |                 __uei_name.exit_code = (__ei)->exit_code;                       \
         |                                        ~~~~~~^
   hotplug.bpf.c:15:42: note: forward declaration of 'struct scx_exit_info'
      15 | void BPF_STRUCT_OPS(hotplug_exit, struct scx_exit_info *ei)
         |                                          ^
   hotplug.bpf.c:17:2: error: incomplete definition of type 'struct scx_exit_info'
      17 |         UEI_RECORD(uei, ei);
         |         ^~~~~~~~~~~~~~~~~~~
   tools/sched_ext/include/scx/user_exit_info.h:51:15: note: expanded from macro 'UEI_RECORD'
      51 |                                     (__ei)->kind);                              \
         |                                     ~~~~~~^
   hotplug.bpf.c:15:42: note: forward declaration of 'struct scx_exit_info'
      15 | void BPF_STRUCT_OPS(hotplug_exit, struct scx_exit_info *ei)
         |                                          ^
   hotplug.bpf.c:28:13: error: use of undeclared identifier 'SCX_ECODE_ACT_RESTART'
      28 |         s64 code = SCX_ECODE_ACT_RESTART | HOTPLUG_EXIT_RSN;
         |                    ^
   hotplug.bpf.c:48:22: error: variable has incomplete type 'struct sched_ext_ops'
      48 | struct sched_ext_ops hotplug_cb_ops = {
         |                      ^
   hotplug.bpf.c:48:8: note: forward declaration of 'struct sched_ext_ops'
      48 | struct sched_ext_ops hotplug_cb_ops = {
         |        ^
   hotplug.bpf.c:57:22: error: variable has incomplete type 'struct sched_ext_ops'
      57 | struct sched_ext_ops hotplug_nocb_ops = {
         |                      ^
   hotplug.bpf.c:48:8: note: forward declaration of 'struct sched_ext_ops'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

