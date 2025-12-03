Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F077C8F0
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Dec 2025 12:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764764278; cv=fail; b=gEMfEMasgTQHkaJH7StnjQZCXw+C39sY4VpIKOGS3J5mgQMRH+lxaTYTyrTlbZna3hsuaoxWouTmH168Yom6nFZgWVAsyjySbLn45zgxUzDIlV0pSlN5JWbQW5MqVPX4XG30axHYD1OepTAlAFaS7a84kD6mtMPRIeo5xKWpVoE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764764278; c=relaxed/simple;
	bh=gfiHET4OvbOC/i/QRBdHE7n7S/rb/2qjAIU5XGFw1rI=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=FYSfxZLOF/teg+8IUNgMtNQnHpxZo+NAwPAREk6nLP6wR1wv3tNWPSHUPu8Y4Fs+rvPaU0s4pNInxPju5kEIPVrXi9Tahn4xlSq0dY4KTmPB8HOFVy8uHyfJMjuJbzyE///2N9uzKKKwwyiX57EDr6nxaNxIwmLK/A3IG0LyyOo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XATQiI8W; arc=fail smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XATQiI8W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764764278; x=1796300278;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gfiHET4OvbOC/i/QRBdHE7n7S/rb/2qjAIU5XGFw1rI=;
  b=XATQiI8W2Qgv0xhz8wLKh88kTxwPoTgyD7m0UwUJF4uH4SCGEX65uYUo
   1fA7WcqKCJ7Eq2F9W6VbQpVeOUFvGybJlcjCfgJApaDP1awCFpcX+2stw
   AfYNAY2o2++JRXSNHQ40M7gzhSLyott0hJjDVZI1PwtSIa4JiI+T+kPG0
   81yRT+ghPTvbGxpkKxz1/bGkUW0MuuCFp/IN5+IMqsFD6XZha0VrO5TbL
   othtSVu4sfAj9erEy32KnqFKHhF12CbL1dHIVSchAlBF/hqrvB1EIla2/
   O7ePGqfa8eHsSAZGkU4HMnilevGE8OyGX4INjg+LUUt+RE4o9XtI37iw2
   Q==;
X-CSE-ConnectionGUID: G1jVJM/XRkmTBRoYrG23iQ==
X-CSE-MsgGUID: R2DyXIy1SiGobxi6HRHZ0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="66715201"
X-IronPort-AV: E=Sophos;i="6.20,245,1758610800"; 
   d="scan'208";a="66715201"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2025 04:16:01 -0800
X-CSE-ConnectionGUID: I31esGQdRgScaRKNzwMO3g==
X-CSE-MsgGUID: G32VLpFdSVulwHwwhal42g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,245,1758610800"; 
   d="scan'208";a="199140272"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2025 04:16:01 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 3 Dec 2025 04:16:00 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 3 Dec 2025 04:16:00 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.15)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 3 Dec 2025 04:16:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZLnQAtfyQJOu6wdVyNMitZAdXb2Jg1zCaX82GlhcswW0cPVzKhfvc+UA/cTKCiu+quVb9WAG61G0UqRcE2KpNjjF5xu2eh2n0hA7IdiHh/0TigCd27SYOHIHYa0lFegfkueKEA1Q4KDN9+GJPZmTvq8P0FAvKh2ZHdwnlfd6nIIkSqWhDUDj+Ih2E5etAaQplqPoveWOlbuRfAB42SdCR9lu0EAYM+2bWUVR7VLuleL4hMSuIYfvoTQvFJrx8FVFv1TfoWIhUGnCwx6kH4MeVwYglJVfrx0iMpGrGY+YnFdGZlKYHDR/nSxtQ1VCGuVOTIAaI/bYhOkCOtA0ksa9iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A0cvIe7gHBhjebYkdIYEQUfa8goLoYEjPEdx4OwMWSI=;
 b=TgehSQwf4lKDIneXWI0wZ2iAgB45KsVENpnkJ5e90aYLe8SYpKaiTcMWKU5hFD+Ua2RBpb0DxB1Rv2YTl+W29szkAHotElbnEW9bxZn7faqtU/zlyQcg/Jwe80c55gwGsz/hb86GzizHy9OfgCsndWYGaAhna67/oSDBOp+IgxFWIM+gB6PncF2uoWWgK382WUo/slnnn3S0AO02o/2gkgKtGqY7YC8xIr2qjrA3DQKtU0l/2cOuZ5zo/F/C26bmnBWSXDkxfVk+gS12ftluUYTxQd869+eU4kAJYmzMQ2X9CYeifh47jJ/Z0Dc0hwHh9kuBpteVN930inGHqzk6Qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
 by PH3PPFF8B8D6872.namprd11.prod.outlook.com (2603:10b6:518:1::d61) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Wed, 3 Dec
 2025 12:15:58 +0000
Received: from MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9]) by MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9%5]) with mapi id 15.20.9366.012; Wed, 3 Dec 2025
 12:15:58 +0000
Date: Wed, 3 Dec 2025 20:15:50 +0800
From: kernel test robot <lkp@intel.com>
To: <cros-kernel-buildreports@googlegroups.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [android-common:android14-kiwi-6.1 36/36] aarch64/vgic_init.c:9:10:
 fatal error: 'linux/bitfield.h' file not found
Message-ID: <aTAp9ohkxxfoKmfX@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0172.apcprd04.prod.outlook.com (2603:1096:4::34)
 To MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB5963:EE_|PH3PPFF8B8D6872:EE_
X-MS-Office365-Filtering-Correlation-Id: 011eb81a-c085-4312-9e3e-08de3265b743
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?q0jX/wKs4MvitB4KNd4QehTQltdfJHnrw4IhuECAmHpUo4tuq2RYA3qUSvLj?=
 =?us-ascii?Q?I0EBZQ5fvaD0gzzZ9Cwxp8J+D7wrsjOL4X6Pkskg2EeDKGslo7mLlgHHR8Vw?=
 =?us-ascii?Q?Q5QyKKoXcbBjv+saCkxdnERT2MGYJq8UamW3g2vvx8NpFmy2lEVk/QGDWkAF?=
 =?us-ascii?Q?nvmIf3M9vpftBBwARZaf8JiZBWWL0eEYqXnc00FE0WJ7AN1jDCSeJNl/SmTH?=
 =?us-ascii?Q?Vl3n/t+3cxjx3SP2ibCEHDv9PariDWouLr2o4iJ1r7jsoFTvm7orzH5nMNyA?=
 =?us-ascii?Q?/44C1f0M+b04y7KRGPnwqRDUrrYjN1QKIZSXt0JS1Ea4+MaQ4kxnC275hOO7?=
 =?us-ascii?Q?dysEK1cl/Gk3IQxG5mGl/xGe5FI35CLh6VRVErhigEI6nOobqAtLNt66rh9I?=
 =?us-ascii?Q?G0JVu+CPhUy1RbQ2yvCMLrG7C6eUvYFcarg+u9OyNFjj3RGiUHWeRi/FxZQK?=
 =?us-ascii?Q?OGGcvpkO2h0FglG/h7HrO/quokMjymsi4zQR6imMrFNRFlYqEpdxlfRr2JJD?=
 =?us-ascii?Q?lqpy2YK5PyWb3RVJzYhpl+t8dnft88Mt80xdYBmJ6RWH5AteNn1q+GsOFYXq?=
 =?us-ascii?Q?gtr/3NKg4VU6NF2m0+Jx8GoLWS4qcF2pw2+hawcFtQDGfgup/wm5No6od04d?=
 =?us-ascii?Q?66eFWBPGOSXR10PwjlLLwbWNp23Jbqdo0xjsY3womCAi3K4MDRvTxsyrqigk?=
 =?us-ascii?Q?32r4NtiE9VzbBXnQiMShLxUSC+yUTBMDs8At86xJAsgeuiC+hVyi8HhOkEr0?=
 =?us-ascii?Q?QSY0+V22dSo02PqvbbU15HCtlNvmNkgqsbKZEeakem2eFTw8fGWWsaRGPGuM?=
 =?us-ascii?Q?dcHKoH88dEjn18A+G6cY4WZzhoNy5qbjHmpaxu4ZF7WBuF7sXGcWzxISds9i?=
 =?us-ascii?Q?giwW9e70LZ758mkin9EztcFP93diNCzfi4KC+kbWWCb2fyWrFy9K7xKDwkZz?=
 =?us-ascii?Q?xFKO+ykv9qSDIhQlzluNkCMPqZvNuMyb8Ix1oz7YIweiRk0tmJ9UX5an/lBu?=
 =?us-ascii?Q?+jdoM606DcrPWVjlTrWs+ZauqN2kKwmLhKSYlovDzo8Gtwt3Fxv1i18v+oKc?=
 =?us-ascii?Q?cUYa9FKVcLgEDCnF9lyjHwynUzrNZXE4u2eec8CtawBcTNv/bq1kObNygsoH?=
 =?us-ascii?Q?d2+H6cIiQhA7JUlcN/F8UUs+49eNFiKfSTjjpD189nVrdb/oSXCX6tgcbNGr?=
 =?us-ascii?Q?45bIzGdpOutHBxIVq6cbvOY52dyTREBiLFGyOWgOYhvef7Mpr04lrGKR8GTS?=
 =?us-ascii?Q?LM0t5fs5ycvjBzkkjp6DEypyPQe/P8jo4v3DvaPuuf1jW2qE2Tr40+Eoh6UX?=
 =?us-ascii?Q?BYMOrI6DIEvMpN3iDwdPJQhDHQglm1Fvg9cfTauAoYwUUr980dIdy5XhXrtR?=
 =?us-ascii?Q?BuGjA9jvvlyqTwBSyVmI3YDClpv+Sxh6w9yvdgKrbFhiHY2RQoKjHVNGQXZW?=
 =?us-ascii?Q?PH+nFGbBFQbgBp0Ga+WFMAR9FzlqKfOqTcmmlqk9jhp+16DJlkGr0w=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB5963.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gf680nRXs1LUwMyhB+9aLvFg4eG6VW9ibiN5qvWHo1yChRo6TKMn3sRBGd29?=
 =?us-ascii?Q?wCtJAGO1qHwyLy0WV7PJHhbU1I5RVAt26LzR2B0ZAQTu6MSmunhO6+4jH8PX?=
 =?us-ascii?Q?02IqYGJGZmsbUnHoDUiZUlSkkjGTUSfdy48fXPY6GBPgEMNAcW5JW2SeUCMX?=
 =?us-ascii?Q?qZexCvEkmAJhXKE93LTDbr7gtBdIc1ccmEuX0UJNGwQKXd3xbEA9a+jPtUiR?=
 =?us-ascii?Q?b96lDro9ExE0tMQziM7G+ZKT+AvD1395YEPW3gYZgnHc5ohr1DSk9RSzqQHi?=
 =?us-ascii?Q?J9KbkXI+GysHTBwjOTX3wAPBvPgYHT2DctHmr1kT29zI4+XhhOURItRuHUin?=
 =?us-ascii?Q?+2hAfc8aoOrgpWbo/OLxJwCKWYFau74NYrnljKb25dYtw4/R6yXvl90+BlU4?=
 =?us-ascii?Q?yKIDgYnp8K8Q9OAvXMpXCmV6ZvZ51oQD/LpsebKobG9k/KAqs4A5g8JOZGr/?=
 =?us-ascii?Q?c9vv9ZS5+NSr2/5inTkuymzFptYo/VfIMuFKXYZBbLnZs/vgR5+qSbH57fWu?=
 =?us-ascii?Q?6SLH3r/qMzFOuJIYyO2IAJn8DIpxLGMybI7IVuchZSckGHIMXb6pg1LdYdQg?=
 =?us-ascii?Q?qePTuwt7slSdUtrJ0vA7L20DZttfuL0UZFUsdpZ60xYskmunViEK8rdB88yu?=
 =?us-ascii?Q?u7ERh45rH5s2f2xLHH5k2ls2KqScryXXXGLJMWKGg2n1c9tTUe3F8srL5RlI?=
 =?us-ascii?Q?dMeqlRLj9cmhmt4POQTrb6Mu3o5mFc/Y6VYjs7orZEkGwb+yFg6dqILO6ich?=
 =?us-ascii?Q?h+rNjF+uMvFjav3UQEbMtBzfUsqjS8UMvAythHplNUrFePI/MCVe/J17FZPR?=
 =?us-ascii?Q?wnG3naBDHInpnNQ410eKQbjATB6+9vcvrtgg2IOMbYP0zqsNzpCBw3w/PnGH?=
 =?us-ascii?Q?tVJIjVwwEPy01nTAJZEmeF7HxEk2k4JIvFCcdbs+f6kTZPZt/RBE0iShGJLx?=
 =?us-ascii?Q?UEbOocb+jnRIQ0Hz8HF8XLZMfNm93jqhBU1fSkGXwJijC1MCrKVykgEslCbx?=
 =?us-ascii?Q?zmYU12LQzAED0P1mr0qdBeJ8Ant0QFxcH/0x1XCCSDFfhE75f96tqdw0eDYP?=
 =?us-ascii?Q?EzfuPUXAh5jrZSODUcfqyW0IPL5yS5uomqzMXaPQXsUNA9JaJVY1CMOkt+wW?=
 =?us-ascii?Q?mKVisBom9NEI8nwcfERPYmwn8EYlHQbVmhoIX5K7qTZUlnALSyh6XYe+m06j?=
 =?us-ascii?Q?ghNOjiCsVNNf8bMmXTqbE+KUM5WSasz3H0mRX3KLqdpjOy8NOdibs+CXla0U?=
 =?us-ascii?Q?R1Nj9kEMmucA+hMkHRNOS2+F9PhQPAF1YrdjaxPt42lS3GXgPixrzdPcVNGX?=
 =?us-ascii?Q?iqwhsI8gOI01xBjsxPTKzxUmHZCRaHf1IYkQ6H2dGMdlnwoAON/CO4Wa5cLv?=
 =?us-ascii?Q?N09bVTjigzHNH+4hRLg7RUBwM9j2OufEbxi/3Dn1YUbL0OJ+3SR2QwsOqZqp?=
 =?us-ascii?Q?nlLpc/o5kpO7MQMITyM7XcVUteX+yvDzBKXPhAPVa0RM0eTpZvnTMyxKirxc?=
 =?us-ascii?Q?qtEjXyw6mCWVBGcn2Cp0zj4XcyiaKBhIZYs4LJXe/qyAks8BIZhsB7/zmbr3?=
 =?us-ascii?Q?OplgMUdAgNLG6ViF2tSABDKdIBUHufGD6EIpaxWUKjgEcdVmd4vDBCbgztIj?=
 =?us-ascii?Q?vw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 011eb81a-c085-4312-9e3e-08de3265b743
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB5963.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 12:15:58.1666
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w0Ubw4bGeFjQZVrb/P7XOiE8kdLnWsbIJXYM77MyJTnPEjpI5GzTYoBr/bDX/qZ7axJ54KQaznnUX8gMHLQpDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFF8B8D6872
X-OriginatorOrg: intel.com

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   81ab94df653806720116e45346cbfcbf5e63df44
commit: ce4e200f37db517831723e352e75df6156abf757 [36/36] KVM: selftests: Add test for uaccesses to non-existent vgic-v2 CPUIF
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251202/202512022330.ji8S0eIE-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 5dd2b06d60d3eb9b07c7513358ad8b04386f79bc)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251202/202512022330.ji8S0eIE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512022330.ji8S0eIE-lkp@intel.com/

All errors (new ones prefixed by >>):

>> aarch64/vgic_init.c:9:10: fatal error: 'linux/bitfield.h' file not found
       9 | #include <linux/bitfield.h>
         |          ^~~~~~~~~~~~~~~~~~
   1 error generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

