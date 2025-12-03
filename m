Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D0BF27732
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Dec 2025 04:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764736592; cv=fail; b=Faqwz+49z0uek9Mjf+B86C6Bzg8chogCeybyXIGJQLY40eBLIDUkKY75b7rjiGG2yjCgsikLwaGZmQg2dw5XVSQAZajlmK3INju5QQR09b0FcixOAgWi6/TdKBM4BcDQDzUX99iQItcl5u7gj3A0ZVVTWg88eyo8IJwiFUATeIk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764736592; c=relaxed/simple;
	bh=WFu2EWouKSqGulCtgkgMdKUoI62TdIzcBgkqJn8+H04=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=Om6wptKNPHdj4eFSaFhd2U13c9F/fsToRVuVGegRVOKAgK/WzHQYkNrFmIoZyNGAwrQR9fBQShTAw4Y5FOETxh9WEp77r82tPzO1C2z+jF0S4fSkFlMBQsmmVnAE/1F7mIzP+/LqOwHc2786MRF/NlVH3Hn/CJTWw0ObhX+QhN8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EumL0vQ1; arc=fail smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EumL0vQ1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764736591; x=1796272591;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WFu2EWouKSqGulCtgkgMdKUoI62TdIzcBgkqJn8+H04=;
  b=EumL0vQ1UZoydBo0WkEUbwXIu7jZGSTHyJeCZ5vonc9nqcdO1aNa/q3h
   Jkt4gDH1dlZHsiyCCg9unLEdPS7sFKVcvdsv0nV1teQCrRPTSdc23USxH
   pbGWmrX1dQtlEhW3qzVco4e5xZuQ3V5bmWMEmIpAVI1xh3svNqCLrZ+gq
   6Cd5FfsUeO9t14wSZNQRHqM6j5EeFItizLP4oh1zgWGoXv0dLFaD0fP6t
   VuxtvVwgkGPLkBSI3grDDSsJ2ZI3odtI1K0Bf6kC+yHstnqHSQaHSgPEX
   Aso/m8zgUj2dXMTB2j/M4Fa4TKOGFRWUd3iSDkfdu52JvEVtYsriN6Cgx
   A==;
X-CSE-ConnectionGUID: 4gUpLi/kTOita/aRNhhgKg==
X-CSE-MsgGUID: wl5yjfVERVuGHP/+KP65tA==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="66682253"
X-IronPort-AV: E=Sophos;i="6.20,245,1758610800"; 
   d="scan'208";a="66682253"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 20:36:30 -0800
X-CSE-ConnectionGUID: eIbNYceHT6aEhYdL+Zcivg==
X-CSE-MsgGUID: sRHJ5JbRTS6V6OBiKkxmxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,245,1758610800"; 
   d="scan'208";a="193851703"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 20:36:31 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 20:36:30 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 2 Dec 2025 20:36:30 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.4) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 20:36:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ddjx+o6wwunxOzUhgs5t+lOLZZz0TRGMjG3zSjPEaAyhC2wMme/jhTrgKQGQ9cUzNus8wTnUeQlYGfeqm6lKmwPH+trWaq3HqatfgEhH+Nt7m6/mkukbrfUhJNLaYDn8qu/0aEeO9LPz8mswDKAAhFZgLLOAaCb+GvO+JCDDmsrNA5ojz03Yz54w7H+RyM8RupSTbCvzI8B0kE726V3h5e+QOJcxYy6Kntq9eRniMKzZn6WjIMVxCwuVtN7Y9vpY6zbdzOFqqMSq+zLqappV9/erpOKboEoQQClQ0qqyS6OnD5w48RfpGhsAZIo/kPqY5Ljuq9rOQ5CWKzEbkAU/RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Et18Sx9Il4QTV6IZi1PE9dDMNhBBIYSs6Zf0WqXUNWs=;
 b=G2VLCchiqog55CAjzQ1KfnixfsjDsoEnpXz35sLSBdear82aCheHN7i/EcedxUqWaH5iHW825SRo+YpATwQpb8xgBa2g6L9RMCndSWCogOcmwUotJYIaAJrKfd2rdF4ysPqSXVA1StGSsUtvjiNjr2aX/bVI5TkJguMxRsingsJLNVbxb/z8J2uzYu7fnHTmOLyf7NJekWg9525CoiPiufyMUqxAKLkHAstEUE4F6/WyUHnJIX5fBHvL51Vl5QNWec0XKXC14pOxFdAwE7wQoGpvdB3drcc0syujQQO+CGbBAwYDeRfD3Zu5E+aafsoE5ny0OpC7fibUYHXRRC+imw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
 by SA1PR11MB8317.namprd11.prod.outlook.com (2603:10b6:806:38d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Wed, 3 Dec
 2025 04:36:25 +0000
Received: from MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9]) by MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9%5]) with mapi id 15.20.9366.012; Wed, 3 Dec 2025
 04:36:25 +0000
Date: Wed, 3 Dec 2025 12:36:16 +0800
From: kernel test robot <lkp@intel.com>
To: <cros-kernel-buildreports@googlegroups.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [android-common:android14-kiwi-6.1 36/36] dirty_log_test.c:775:2:
 error: call to undeclared function 'TEST_ASSERT_EQ'; ISO C99 and later do
 not support implicit function declarations
Message-ID: <aS++QIch3O0dUQWq@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0167.apcprd04.prod.outlook.com (2603:1096:4::29)
 To MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB5963:EE_|SA1PR11MB8317:EE_
X-MS-Office365-Filtering-Correlation-Id: 1fafd6d9-aabc-4794-84fd-08de32258491
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?wjNqps6edDT0mOKWiGhN/Sy9ocKydekFl0htOXGuBWFvuEjfdkVTO2BFQHaP?=
 =?us-ascii?Q?fp8vxAom5K5Pw4blRIk1rKQR9bpn2RsU47mUTa+X48xYg4LBNiKwPXvXJz1i?=
 =?us-ascii?Q?hz+oV/wF5Nc4KMnmstNWCQLdUyQnLBRhKpt9RACznXQIN4OPKVmlJ0hTVNSv?=
 =?us-ascii?Q?GMMULHeJp2JRsb5dhRKc0i/HAAGMTHjWlW0OhsoZGynmsAk+kD8/Ta1/KFHd?=
 =?us-ascii?Q?pM0dKTVkzuexxLUHWfbhXeWA1pLOt4J18u2CmwwtWdpbPI5TLzBBqwJtJGHS?=
 =?us-ascii?Q?er4qCy9GVb2VZkoCwx1JZdt5jEhY1BZf9ezXTbP4MfUAwZx9bKjUWkE8aUZv?=
 =?us-ascii?Q?mHhPR9ECY2y2OQvD+UV6ZHCiWPD1kG4368+1IbBaqZgsO2IWs/+ZCGsYN9lD?=
 =?us-ascii?Q?NgDfI98VLxOLY28NrGO7QgrgkRYvkrqeyL683zwmRscxxUm0OqrsKNrSW7wv?=
 =?us-ascii?Q?Rr+rZV/OscVy13uOFvCOpUmcCwx5lJJvcSC+M0+RYg6Rtm3tOFK1rEOM4F6Z?=
 =?us-ascii?Q?uriCnuTlig9qsVa1LxcOC6G+0B/tc55maXhfayZSDw0N7GvX3EFeAIjWgSWV?=
 =?us-ascii?Q?93RU1gPX0pjEZDCxTGmcW2LHoqjRj5uLCq6lx/H9ozkgooJU30JJA8+wWhFC?=
 =?us-ascii?Q?TA3zPUU0tazrPBvZQZZGyyt9ku2BcOFbuKecI7cFm07gAVRmCrrh+MDOIi6D?=
 =?us-ascii?Q?gr/nHJP0KXx82Km+XuI5yiMFpW9TRF5bi1ya4wEg2M1HFizdnz6crOJbHPIC?=
 =?us-ascii?Q?hDv9HyQ2XtI9/P+AwiUguxckOQoxzF/l6SwYjqfPTy1PKtuK4NKtDeDuhbp3?=
 =?us-ascii?Q?o1KAaUi7ezu/Zu1R7srKiHFJ1vNCKvIK9b8nBKKwz7ooGSjbyDPKSgKn8Q+g?=
 =?us-ascii?Q?BITZD2I8YDBo3b6+/Q20Dz56D3bMFf4ohpKOiAcSxlaRmYJoIcd/rLwhyCH7?=
 =?us-ascii?Q?pAu+ixGa6beIQn2wbD4lSLLyJ0tBZk5o04/tVrtcLKqr4ZQhIiIM5nyCtJbD?=
 =?us-ascii?Q?yc9IZMvG4iTDPnnL8KIVwSU2zVF2xQ5kajImNkEM2AHDPkrFlB7krLyZyemQ?=
 =?us-ascii?Q?G/lIOPjX5y93Zr5+kZADU6bUIVAA9ByTe4pQZsY2Wj47x0we/c7e3xjh/4LV?=
 =?us-ascii?Q?ATHYA55cme3ufBN9TzdajKC5htHVpQmlAiPRCI0Dszkg8x58K1BV7ngXmvTd?=
 =?us-ascii?Q?3jMgZnotYFhUuZ066jM/xw0HJbQBrRaooGA8J8DbyUbryWKJxnDxl+z7THWD?=
 =?us-ascii?Q?xECiENoI7Z2BkhQElx2B1/Kl/oG1h10/eAMOPYmBPl9kIZ33Pf1US4ibXE4D?=
 =?us-ascii?Q?mZNzTMALuIWTE+XNeuOt+aZZBn5PKQAflUm/CCPLkk+3A1nj0m5DOZjGizVj?=
 =?us-ascii?Q?+UFTfkIXNO1tUmbNKQMbDZJDQ20VxErW5e4g4mrimIFWt1XLpjYf3s6kF86S?=
 =?us-ascii?Q?MMnB0JVF+lhncvMbZq5JbzRxdFYi18RC0dRBZWzyeUk1TsK++G1pmw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB5963.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qOzCZDYVjsKoZ0epriAQL15ba57+ekTI7gn0660D319V3lgQIS6/AlCQlflI?=
 =?us-ascii?Q?Hy7t32DdZTbGYmSqKxOSv5zog2hG/APLlNIb+wCC8neYwZ2U0+n9rnaFq+iZ?=
 =?us-ascii?Q?nrToH8YjVwONz1YLVosKyDSGYK50ma49xWhJR24HIiBFSHAO92aTcnlAhbyo?=
 =?us-ascii?Q?W8HQ2tn/j3+f862oLMXQZpHZi/piugxNSgxdiX/FP8Y8wAW48sPwi/xvojLG?=
 =?us-ascii?Q?fQmGkt9WJhGlIidrTac6WaHD4GP9Fv7ISkiDR9i3MSPsij8SaaPg75ZGIv2g?=
 =?us-ascii?Q?zG/IgMug0CqQkO103OM3qiFuI0R95PNN+Zs8xMt2GJptXMyjziVihG+X2RZo?=
 =?us-ascii?Q?bDAgLEKMl7xV3sURJbq1z9iHXJ4I0OdXo344u0QgiRLsBr7ucA4s8yx5r0pP?=
 =?us-ascii?Q?v9iSxukMPqz3wNT4nHzTR92MxmFfl78qFphMJmZUFlrpnBUgM5IXObgI+x8y?=
 =?us-ascii?Q?j2OJCBQT7S76gEQa10w+lkujRXMeG5/i1Hpo2JrM67R/pGAkC9ek11MiX3pD?=
 =?us-ascii?Q?szPVV4Op/CiP5tJ7Zid/Z3cEoMzoHPFfAMUsGkxsnC/O6R1CNuPhl7/ok26e?=
 =?us-ascii?Q?RNNR/+683Hd0W1W1Hzdy2JxP15UC+9x3CBwPibQfxOGP0l0MMmE1whGB55nB?=
 =?us-ascii?Q?TpuptksYcUVzOTD6LZ/IbAWgg86gHE6ZyCyAMoroOvIZ2eGq0rT1x4OGjUML?=
 =?us-ascii?Q?p0YF2RnMb39b6ywo2OPMReBUPCEwUOBd3wWfPh3OKg1d81a/0MNC8hV0tPP8?=
 =?us-ascii?Q?J+2eiiMuVtpne61sZ7m6X0x6ygHrAjult1df8cdrcIR9fS/YNGLFzf7mtOXx?=
 =?us-ascii?Q?N6jcqVKugBdXHJ6ZySXqr31x8vazVh6G7Rut3cNrUQgHxD9OK1zfOiFnm7wX?=
 =?us-ascii?Q?noctYKYbMT9nw9u3MGvm2um2S5BvbHHktGLPO/pNQXkPM37ZZ1oy9nN7Shk1?=
 =?us-ascii?Q?m2GAdlu0+eF2x88kDcKgyU9Ij/uIQ0dUleaTQunKf+bUmSw+wEbF1OU7t0z2?=
 =?us-ascii?Q?riuhejt/Zv4vmk/7UPS+1Hv2VLoa+lTwuByjgziWKbGPwIbTPZ7vUt/3kOsf?=
 =?us-ascii?Q?P/X0M7ZN7XaaPDBOmmvG+ptLaL3O4WVPLMlbswEwKgN5bXePYHe2evMDzIsL?=
 =?us-ascii?Q?evopWp9r8kId2X7CpDL1srX92UiiKQNw6WWvFOT+5c+wuKXGiUN7p4rE8xT6?=
 =?us-ascii?Q?tC7710K3ehi3Hc/ewzl8fUN20j92Rc3MZd54dtcsag6fqJTqWf21HdF7uHf9?=
 =?us-ascii?Q?pjomD1sZmUR1PWDvQzDLFyoY45J0ZUNAXWPdt53UBdEIYdTzw/XnBttLKM/n?=
 =?us-ascii?Q?/HwAPVN9bMIZ6f1i/aCjp4EoVaYz/fKt8q9I1fCAO+stSL1tEcmgeXIHXEpu?=
 =?us-ascii?Q?dByAN7cNtoACfmAM/hLH/pytw3+0FTN2e4SyWvAatiESBWUQOjuY9YDKMKYR?=
 =?us-ascii?Q?jV6JwOQtEIAdCNwKCJGgzI2NfHZ0zb2d3ollSIRYd9s2TgruovrjejHKYfZK?=
 =?us-ascii?Q?Zrk/fqH2IHRW9XKNsYZyCE+gOTh6UONunLIvYzvP+wtphAidbztu65Y0HCcV?=
 =?us-ascii?Q?ay1PNYbpuGw8pPACm8+1OpwNBd5gbLPwij4PbOQ5pBZvWm5J1KpEzXtFf2sa?=
 =?us-ascii?Q?kQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fafd6d9-aabc-4794-84fd-08de32258491
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB5963.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 04:36:25.3569
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pdoiPI7JV3NcMd4NwV1VqzDYk87HiTri2pGrLTjmixPsULccjQjI2p/30kFz7wRxvRe42D1Pb+kXSRFfsGVGqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8317
X-OriginatorOrg: intel.com

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   81ab94df653806720116e45346cbfcbf5e63df44
commit: e5ed6c9225378b7ab6b0e305dd84da7c87219a1b [36/36] KVM: selftests: Fix a semaphore imbalance in the dirty ring logging test
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251202/202512021805.bdikTYnK-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 5dd2b06d60d3eb9b07c7513358ad8b04386f79bc)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251202/202512021805.bdikTYnK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512021805.bdikTYnK-lkp@intel.com/

All errors (new ones prefixed by >>):

>> dirty_log_test.c:775:2: error: call to undeclared function 'TEST_ASSERT_EQ'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     775 |         TEST_ASSERT_EQ(sem_val, 0);
         |         ^
   1 error generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

