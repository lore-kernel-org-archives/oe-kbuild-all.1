Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BE332110E
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Dec 2025 16:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764693937; cv=fail; b=PwK9WP4eku13g8CR+156K3QpC5miyHYnUlC8g2TiaHnG6wQoIkWN9J93Wkg63cKGO54rvXfe5NrtsWRVkfKKue5yZqil3emK+foQSKdsokH3kQAkhD9fUccDI8i9klnK8aoCfmQy4Y0Bq3zbNlwA7IhZ8QTkMDUfEOCPINrwgsM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764693937; c=relaxed/simple;
	bh=KshskixOlPSm6ketZWxUH2Okh9fxPuEIFSsGxwo/tuY=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=fftFd89Ojf7+i1Nb7k7bqh19gP5J1oPmp538Fmq9lYY45sLYnR+MSoOpr1SzKW5now0bHFmCWEu0EUBvKWklMYyBqeVcZfMPgeELVrMKG8tyUVOxhGZoqijZTHXF3iIjKVqCw14ybE+r4W4RDoUP9YAFZqZZp+oFIFFhb/k2ne8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NRf3y2zG; arc=fail smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NRf3y2zG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764693935; x=1796229935;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KshskixOlPSm6ketZWxUH2Okh9fxPuEIFSsGxwo/tuY=;
  b=NRf3y2zGtiywkcZ6CGXhBPctdPlrZRSVGkfiRXrCmkwC9l/MuRlPTo9O
   1RVkyaysYc8i/tNvB8EPUwBNEAwMgt4Ywvvbmvpy1smk7RAsIg9WIkuYP
   vzXfUjaKpKeADgBedotkbksdurLtN13LNME5GOpcD/dDuP/GO96PAwJ9N
   IvKDcRNpKk61BPKHdgCsolIuHV6zUgTZX9HCU4omY+zBDRA1EirwLKRiu
   M6MWHBYXCNbk6bEIWa+PYgzG9AVCDLkcMSjxkahW0/XSf05UeYLMkQSRA
   VsDDfXZxGc66GRAvMaIPM+2CEmp/Pjo3g20EgNS02MEVFJlzrGvq8KM9P
   A==;
X-CSE-ConnectionGUID: zZM47tBrTumOGSKgVev7vg==
X-CSE-MsgGUID: P7FnmSQXQKidWg5O+Adlgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="66386397"
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; 
   d="scan'208";a="66386397"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 08:45:35 -0800
X-CSE-ConnectionGUID: t2GW3wBiSMe02tpZRcerdQ==
X-CSE-MsgGUID: oG0EcKQZSS2EVzRwoRjqUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; 
   d="scan'208";a="193522556"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 08:45:35 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 08:45:34 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 2 Dec 2025 08:45:34 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.66) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 08:45:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rMabyIJxjU01R8+Fgw8h2iH+QpoesNG6qXITjOLhvgKkznKSYkUpgiR71NWhHv/XE5CXXqsSU3Fo8phgRprjWYSwFNUt+yv32PbSa2iPbL/LzJ5NuSOx4pYAQkOrdvuIDZ5J6NDYJOcohIj09V6hSU/utXIMgFtPUyVuw2SPpIZXtaHyLZfT7JUrBJimCGRzB+yem1+2rEhc8+N5fRtpodBToeOYyW/N8ZBHXhSXqP8tYRJRWJ5jlInKy/XBms2Lqv9sNF05aXAdbUCfWFxaNUiDuDRuoEQHdBaWGp49JFEzYMPzpdd0twxZZYj8he/aDjsS6OU+8YFRnTvJXgLFiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iVmboVKc6dk6uqYJZHEuNreb7/Rn89SDzZcj91Ev9DE=;
 b=HdAGTzYvnhqXQS/8T79bTg5j7Ts2VofM6qd2iONtIrKIUt/OvJUTr7rC2rGfR5w4Jmpy7zRrrm9mea4vCGPbHU/ZUjK44btLbd4VnW60xp/JXpPdALA3dNCIiDYAwS5/ylcowQ2vwERwqq+qTqeas/J5ploGXbdkqvXB+qbti7Bl99BwTGMOgbeip0Z77YqYxrxIqGflF6nDrtCCxarDR5ZEA2ugt7wkRDktclee+Jldh3xs+0UdeLDoW+xFq+cfnrnpyewQQ3wVw4VfCNQSMegJvIlHULfLACvMjoGcInlnLD7cXtxzJb5p+QTt6dPxQEJ+crUJaLxgPo95pRRQ4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
 by SA1PR11MB6808.namprd11.prod.outlook.com (2603:10b6:806:24f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 16:45:31 +0000
Received: from MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9]) by MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9%5]) with mapi id 15.20.9366.012; Tue, 2 Dec 2025
 16:45:31 +0000
Date: Wed, 3 Dec 2025 00:45:22 +0800
From: kernel test robot <lkp@intel.com>
To: <cros-kernel-buildreports@googlegroups.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [android-common:android14-kiwi-6.1 36/36]
 include/kvm_util_base.h:655:23: error: use of undeclared identifier
 'VM_MODE_DEFAULT'
Message-ID: <aS8XoqclE7+TJrHU@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0160.apcprd04.prod.outlook.com (2603:1096:4::22)
 To MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB5963:EE_|SA1PR11MB6808:EE_
X-MS-Office365-Filtering-Correlation-Id: 34ec289c-a1ea-49a0-9884-08de31c23461
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?UstkC9jqhy4FCG1fok4YFFxO5fsFzX3h93saJ/HeceyAGcKFB7x/SHUKit48?=
 =?us-ascii?Q?lrtYXQOtf6SNrm7fQq6EE+HwSIc3QrcVkvZI2utjX/XxdzV4YPI38uIfqRof?=
 =?us-ascii?Q?Pkx21Y+zENnFXaHcAGN6QiA/2HinlxTKQEoWXkG4Z2/fmnEljTNUsGpJ/JTG?=
 =?us-ascii?Q?o/wJnBhNILHN5V2pV/0UfLwwPMpIk/oqeXP6i1HlXog9T2BPyp/NrHd+YWSD?=
 =?us-ascii?Q?G4vo+Mq41ce1KM5IITxASccog7e1OoT3svdUedgJElb4z9gst+JgCZUKxhYN?=
 =?us-ascii?Q?Sr0Zc9FTWdeYnfoVEaRPDqGNJslX/lWeb9WElu4M7beGAfkBHbX2mX6LlzrP?=
 =?us-ascii?Q?+0IB9NSJWs5V21N/CBo6R3Poi3WgldrshPp4shN9QTqHhjwzodvVfspvysgF?=
 =?us-ascii?Q?cRTn9dsm8d2qGH1bna7nyWD/nOU69CKgQ7cg9hG+jbhhYkeqxLhoLRUSZwSS?=
 =?us-ascii?Q?UR0h+3syVdBhM9z29HSKQZQHENvVJKOk6UACh8lo+HtjSA/v9L2BqxVmwx04?=
 =?us-ascii?Q?8m/YhuIVtuAc7YwmQYwNxGK7C2n0cn29YlC65kVqtSRGN73P1tXtKsgFieJV?=
 =?us-ascii?Q?9pXQ92MEGi7rbi5dJqntvpzQdToWqufrTxeV9bi6n2+dYLd+jGkV9iZldd/+?=
 =?us-ascii?Q?UJbNoLDH9JbAFn3PvKhslEZ+7YVCAkF92ZrI+FuWr+87aWIW6WsKknAhQRPw?=
 =?us-ascii?Q?jPIxK49LpoaOwiYxXy78hawO3hLaj9PSxF6fDNKGp1afB2j2Eqcq9pDcHU2D?=
 =?us-ascii?Q?khbsZG3k1jn6KWGsPZ9/IY4QGUlLJtO+IwrLEjDFJkzqwTvEdlmpGJycfrpA?=
 =?us-ascii?Q?IWfpI7b1MITfJYVaLEhkzpn4rGav8AFnCzG9uQ+oeoI5e2hb4tbqFmExGp/T?=
 =?us-ascii?Q?HVNDJe/JtBbBFBxlvpV2bPYt3JY2osSm7r+z2mZOMz0l7cCGn+U2IhrGVfAP?=
 =?us-ascii?Q?0zerZ+SrkchEVUhgvD0NXCuwn0Q2M1fHLDqy438EqZ/vAZOCdNCBRdAFwg4d?=
 =?us-ascii?Q?ECjVVo0xqt65qBF2iSaJxBKTv5kEBmiXeB9sP1n0CVedbpD1MYxp89fFYygQ?=
 =?us-ascii?Q?z/4Y/6kjjP5RdkxXQAHUXfzFWUp4sXOOdIiz5y+h0WpzJUAVUnBEi/kmkG4P?=
 =?us-ascii?Q?IjjuyrOKqAFzOG5MZpRo0K1GLfzI0PpNqTglT4Na9CHTTeysIX8Ye5E1EDOh?=
 =?us-ascii?Q?xugkKJ5og58qjUlMlvBY/Q4qqp07byHq4A6KVV6TrwOZg9BhRisCwLNW0pT4?=
 =?us-ascii?Q?8P8EKya3u0BtEfYs/RQTsETjQaE0tGZsj5FVMrYYpLOmsYGgbye3ao8yUfOp?=
 =?us-ascii?Q?lmrnjGL2OSXPM9JzNPYviP953MxOcpr6QKDtZ+0jvkNaXUKXc3IaEi2N9VyF?=
 =?us-ascii?Q?gXueWqmc+4ZsmDpXW3uJ7ZcMcXgS3epCF/rPL2dEohmP2Qx7Cl4beEq0wg0t?=
 =?us-ascii?Q?oMJUIeu003R7bBrynjrE8jABDKp/in08Y058OXmaQrDG7hpR+ijAtQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB5963.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ovb4+QIb+c0mkg7tNLDaWBecO0hzI33+lePMq9ieeRp+fBCqwLFAfJVZ51ZV?=
 =?us-ascii?Q?iUXQng313wGLQ3KkVWKoto+gE+T5Ie74jAx9L8J1VDpaGvLa5d2UjtkQMcvW?=
 =?us-ascii?Q?lyUztfDwu1Qw884gLO81h+44LfYrLGXL8ps4eHZNMgeUJbPpaGcVEIeMPp4+?=
 =?us-ascii?Q?Kwgh69R3p5flOXXjEX1cp4B7MTL4Jop3eiCGmRJHlDny+qNeu+DhUEZ8yrBy?=
 =?us-ascii?Q?0mkJ57osWDlJDeXTv8qiLn/vIY4boUwo8+Ge0bTiG0KB0QDr9SInV4WeWbCR?=
 =?us-ascii?Q?O9CsJX2H8SHJYD1SquYPbWRoQmHDJl3/B8uJOKBKeYbMbBHFpdqsExHmE/Y2?=
 =?us-ascii?Q?pKfyuZzRe+Y3pGZw2ejvIYlgWwd+nujkuqZpm5Qh8duvqpxKyqGFHLT9lZZt?=
 =?us-ascii?Q?lCN/ms/jMjnAvoXEIpTDhpMB6IC76USXfIVXAluInyD0tUOeN7Y5cZXjEAcq?=
 =?us-ascii?Q?RG1Ey7u2jNPnnEFAQN3RierRvc4+H5dpIqgVeTyfbndSEDgFw3xhlaBWjbKr?=
 =?us-ascii?Q?bZ7Nq/EQPCSCANxcMySb0ZkikaqWEJeewjmhki8JyJRCOGyisZMV6m6twzZJ?=
 =?us-ascii?Q?8MMEL4Ue8bhcCE7kM1Tj2MRYZES0Qu7rjptDqJfyoekwQW0t2ZzDy/AVfMwt?=
 =?us-ascii?Q?wNDvWXHKvOyI4flNcW/23RxFIFfk4cgu9T8IzdySlzRTg4jTF1YRUCjTIup6?=
 =?us-ascii?Q?4cg8SSdxAHH6Y9hjLrYxrtgZOOAa4/QYmIl/zcxoZvDs2Bpzex3KRTD+lfxL?=
 =?us-ascii?Q?mf2aoM/stZvJvMoTze2BBUNr2fNm+fMhvJf2pXAN4OZ7kdY+pNvyGD3fJ6vJ?=
 =?us-ascii?Q?pM2c4MGJH/jJjticEltUrTAShKUfLMW4MPNeQRw+I2pkwZE0lPaVPNNJY2n7?=
 =?us-ascii?Q?gIjVYVjwD7J9VIVddYB5d9gbhFB+SEt9FPtWAhVNUifJw/PxoJ4EjtDiF5qZ?=
 =?us-ascii?Q?Q/WGUNhdrnLk0lw1VmudErHDMf/OZfgt3aoDbv2SQSNWaFGpTamkSCZOx3sU?=
 =?us-ascii?Q?LHD2X0+p+5m5Qx/meQwcbUMu0sdSCjNE6RdDNFFbjv6KnaUoxieeHIewVoCq?=
 =?us-ascii?Q?XmHH1VJ8gFvpJP1XH5rBxM0l5SLW0CyjztdBuQwbyCzPRyuGNGYousRNB2Iz?=
 =?us-ascii?Q?Q7DPfDS7P9IQRrxn7tJ6bc815oSgRbU5zHbXqDfauajcUtbtJWaW6v0qRLa6?=
 =?us-ascii?Q?t2O5jVThUQ6txP93D4E4aJHZMuY21kkAMWQ8KQgpTKXwnzGpBi2EPuDN4H5I?=
 =?us-ascii?Q?Uwv/IzZzWvkJwz7Di9NKsLzjYXQo/kqnDO5aw1y96Hk7y8ty6Krybqs2kp/R?=
 =?us-ascii?Q?Q4aeVtw3b5p/DxelqWo3588IExCyVTZoGJlM7rTqNPSq5KaCo+dgfNLV9nRG?=
 =?us-ascii?Q?zKtP+d6X10gRmbfmWWHuaTcTa3CSbKoMzWH8OMrrLQ0a4rD1fkFj7xD4Erf+?=
 =?us-ascii?Q?r+T+VsEcMbXZpzXmJmspGCjIOfbak0Ul6tCaP8FP3VL7ij7IA+hRXukTzHSh?=
 =?us-ascii?Q?B/D96PEuouw441VfTsYK/hkrl6unuEC3+OlxaXIHbpM6zMUC6stR5OWM4fVI?=
 =?us-ascii?Q?CETUynEenLADhhYOgbg8+X+/29+3edbf70dv2Rpl4TVYkg17WRLHzLKTRnGi?=
 =?us-ascii?Q?vQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 34ec289c-a1ea-49a0-9884-08de31c23461
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB5963.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 16:45:30.9895
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l7vByJnF74b/4HNfVdQV+ytcWMvBVCOPMP/ed2MZqWc3PNcj44vyV2h6d1WyOzLGTgoRfti9f3GX33Hxf5krYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6808
X-OriginatorOrg: intel.com

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   81ab94df653806720116e45346cbfcbf5e63df44
commit: 4d2ee43ac2a906833636db6d456370a567fa409c [36/36] selftests: fix LLVM build for i386 and x86_64
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251202/202512021059.pxUKdxNo-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251202/202512021059.pxUKdxNo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512021059.pxUKdxNo-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from lib/elf.c:8:
   include/test_util.h:136:37: warning: format specifies type 'unsigned long' but the argument has type 'uint64_t' (aka 'unsigned long long') [-Wformat]
     136 |                     "size not a power of 2: %lu", size);
         |                                             ~~~   ^~~~
         |                                             %llu
   include/test_util.h:54:50: note: expanded from macro 'TEST_ASSERT'
      54 |         test_assert((e), #e, __FILE__, __LINE__, fmt, ##__VA_ARGS__)
         |                                                  ~~~    ^~~~~~~~~~~
   In file included from lib/elf.c:13:
   In file included from include/kvm_util.h:10:
>> include/kvm_util_base.h:655:23: error: use of undeclared identifier 'VM_MODE_DEFAULT'
     655 |         return ____vm_create(VM_MODE_DEFAULT, 0);
         |                              ^
   include/kvm_util_base.h:660:21: error: use of undeclared identifier 'VM_MODE_DEFAULT'
     660 |         return __vm_create(VM_MODE_DEFAULT, nr_runnable_vcpus, 0);
         |                            ^
   include/kvm_util_base.h:671:32: error: use of undeclared identifier 'VM_MODE_DEFAULT'
     671 |         return __vm_create_with_vcpus(VM_MODE_DEFAULT, nr_vcpus, 0,
         |                                       ^
   lib/elf.c:81:29: warning: format specifies type 'ssize_t' (aka 'int') but the argument has type 'off_t' (aka 'long') [-Wformat]
      81 |                 "  rv: %zi expected: %i", offset_rv, 0);
         |                        ~~~                ^~~~~~~~~
         |                        %li
   include/test_util.h:54:50: note: expanded from macro 'TEST_ASSERT'
      54 |         test_assert((e), #e, __FILE__, __LINE__, fmt, ##__VA_ARGS__)
         |                                                  ~~~    ^~~~~~~~~~~
   lib/elf.c:170:8: warning: format specifies type 'unsigned long' but the argument has type 'vm_vaddr_t' (aka 'unsigned long long') [-Wformat]
     168 |                         "  seg_vstart: 0x%lx\n"
         |                                          ~~~
         |                                          %llx
     169 |                         "  vaddr: 0x%lx",
     170 |                         n1, seg_vstart, vaddr);
         |                             ^~~~~~~~~~
   include/test_util.h:54:50: note: expanded from macro 'TEST_ASSERT'
      54 |         test_assert((e), #e, __FILE__, __LINE__, fmt, ##__VA_ARGS__)
         |                                                  ~~~    ^~~~~~~~~~~
   lib/elf.c:170:20: warning: format specifies type 'unsigned long' but the argument has type 'vm_vaddr_t' (aka 'unsigned long long') [-Wformat]
     169 |                         "  vaddr: 0x%lx",
         |                                     ~~~
         |                                     %llx
     170 |                         n1, seg_vstart, vaddr);
         |                                         ^~~~~
   include/test_util.h:54:50: note: expanded from macro 'TEST_ASSERT'
      54 |         test_assert((e), #e, __FILE__, __LINE__, fmt, ##__VA_ARGS__)
         |                                                  ~~~    ^~~~~~~~~~~
   4 warnings and 3 errors generated.
--
   In file included from lib/guest_modes.c:5:
   In file included from include/guest_modes.h:5:
   In file included from include/kvm_util.h:10:
   In file included from include/kvm_util_base.h:10:
   include/test_util.h:136:37: warning: format specifies type 'unsigned long' but the argument has type 'uint64_t' (aka 'unsigned long long') [-Wformat]
     136 |                     "size not a power of 2: %lu", size);
         |                                             ~~~   ^~~~
         |                                             %llu
   include/test_util.h:54:50: note: expanded from macro 'TEST_ASSERT'
      54 |         test_assert((e), #e, __FILE__, __LINE__, fmt, ##__VA_ARGS__)
         |                                                  ~~~    ^~~~~~~~~~~
   In file included from lib/guest_modes.c:5:
   In file included from include/guest_modes.h:5:
   In file included from include/kvm_util.h:10:
>> include/kvm_util_base.h:655:23: error: use of undeclared identifier 'VM_MODE_DEFAULT'
     655 |         return ____vm_create(VM_MODE_DEFAULT, 0);
         |                              ^
   include/kvm_util_base.h:660:21: error: use of undeclared identifier 'VM_MODE_DEFAULT'
     660 |         return __vm_create(VM_MODE_DEFAULT, nr_runnable_vcpus, 0);
         |                            ^
   include/kvm_util_base.h:671:32: error: use of undeclared identifier 'VM_MODE_DEFAULT'
     671 |         return __vm_create_with_vcpus(VM_MODE_DEFAULT, nr_vcpus, 0,
         |                                       ^
>> lib/guest_modes.c:17:20: error: use of undeclared identifier 'VM_MODE_DEFAULT'
      17 |         guest_mode_append(VM_MODE_DEFAULT, true, true);
         |                           ^
   1 warning and 4 errors generated.
--
   In file included from lib/kvm_util.c:9:
   include/test_util.h:136:37: warning: format specifies type 'unsigned long' but the argument has type 'uint64_t' (aka 'unsigned long long') [-Wformat]
     136 |                     "size not a power of 2: %lu", size);
         |                                             ~~~   ^~~~
         |                                             %llu
   include/test_util.h:54:50: note: expanded from macro 'TEST_ASSERT'
      54 |         test_assert((e), #e, __FILE__, __LINE__, fmt, ##__VA_ARGS__)
         |                                                  ~~~    ^~~~~~~~~~~
   In file included from lib/kvm_util.c:10:
   In file included from include/kvm_util.h:10:
>> include/kvm_util_base.h:655:23: error: use of undeclared identifier 'VM_MODE_DEFAULT'
     655 |         return ____vm_create(VM_MODE_DEFAULT, 0);
         |                              ^
   include/kvm_util_base.h:660:21: error: use of undeclared identifier 'VM_MODE_DEFAULT'
     660 |         return __vm_create(VM_MODE_DEFAULT, nr_runnable_vcpus, 0);
         |                            ^
   include/kvm_util_base.h:671:32: error: use of undeclared identifier 'VM_MODE_DEFAULT'
     671 |         return __vm_create_with_vcpus(VM_MODE_DEFAULT, nr_vcpus, 0,
         |                                       ^
   In file included from lib/kvm_util.c:11:
   include/x86_64/processor.h:15:10: fatal error: 'asm/msr-index.h' file not found
      15 | #include <asm/msr-index.h>
         |          ^~~~~~~~~~~~~~~~~
   1 warning and 4 errors generated.
--
   In file included from lib/x86_64/ucall.c:7:
   In file included from include/kvm_util.h:10:
   In file included from include/kvm_util_base.h:10:
   include/test_util.h:136:37: warning: format specifies type 'unsigned long' but the argument has type 'uint64_t' (aka 'unsigned long long') [-Wformat]
     136 |                     "size not a power of 2: %lu", size);
         |                                             ~~~   ^~~~
         |                                             %llu
   include/test_util.h:54:50: note: expanded from macro 'TEST_ASSERT'
      54 |         test_assert((e), #e, __FILE__, __LINE__, fmt, ##__VA_ARGS__)
         |                                                  ~~~    ^~~~~~~~~~~
   In file included from lib/x86_64/ucall.c:7:
   In file included from include/kvm_util.h:10:
>> include/kvm_util_base.h:655:23: error: use of undeclared identifier 'VM_MODE_DEFAULT'
     655 |         return ____vm_create(VM_MODE_DEFAULT, 0);
         |                              ^
   include/kvm_util_base.h:660:21: error: use of undeclared identifier 'VM_MODE_DEFAULT'
     660 |         return __vm_create(VM_MODE_DEFAULT, nr_runnable_vcpus, 0);
         |                            ^
   include/kvm_util_base.h:671:32: error: use of undeclared identifier 'VM_MODE_DEFAULT'
     671 |         return __vm_create_with_vcpus(VM_MODE_DEFAULT, nr_vcpus, 0,
         |                                       ^
   1 warning and 3 errors generated.
--
>> lib/x86_64/vmx.c:8:10: fatal error: 'asm/msr-index.h' file not found
       8 | #include <asm/msr-index.h>
         |          ^~~~~~~~~~~~~~~~~
   1 error generated.
--
>> lib/x86_64/handlers.S:2:7: error: register %r15 is only available in 64-bit mode
    push %r15
         ^~~~
>> lib/x86_64/handlers.S:3:7: error: register %r14 is only available in 64-bit mode
    push %r14
         ^~~~
>> lib/x86_64/handlers.S:4:7: error: register %r13 is only available in 64-bit mode
    push %r13
         ^~~~
>> lib/x86_64/handlers.S:5:7: error: register %r12 is only available in 64-bit mode
    push %r12
         ^~~~
>> lib/x86_64/handlers.S:6:7: error: register %r11 is only available in 64-bit mode
    push %r11
         ^~~~
>> lib/x86_64/handlers.S:7:7: error: register %r10 is only available in 64-bit mode
    push %r10
         ^~~~
>> lib/x86_64/handlers.S:8:7: error: register %r9 is only available in 64-bit mode
    push %r9
         ^~~
>> lib/x86_64/handlers.S:9:7: error: register %r8 is only available in 64-bit mode
    push %r8
         ^~~
>> lib/x86_64/handlers.S:11:7: error: register %rdi is only available in 64-bit mode
    push %rdi
         ^~~~
>> lib/x86_64/handlers.S:12:7: error: register %rsi is only available in 64-bit mode
    push %rsi
         ^~~~
>> lib/x86_64/handlers.S:13:7: error: register %rbp is only available in 64-bit mode
    push %rbp
         ^~~~
>> lib/x86_64/handlers.S:14:7: error: register %rbx is only available in 64-bit mode
    push %rbx
         ^~~~
>> lib/x86_64/handlers.S:15:7: error: register %rdx is only available in 64-bit mode
    push %rdx
         ^~~~
>> lib/x86_64/handlers.S:16:7: error: register %rcx is only available in 64-bit mode
    push %rcx
         ^~~~
>> lib/x86_64/handlers.S:17:7: error: register %rax is only available in 64-bit mode
    push %rax
         ^~~~
>> lib/x86_64/handlers.S:18:6: error: register %rsp is only available in 64-bit mode
    mov %rsp, %rdi
        ^~~~
   lib/x86_64/handlers.S:22:6: error: register %rax is only available in 64-bit mode
    pop %rax
        ^~~~
   lib/x86_64/handlers.S:23:6: error: register %rcx is only available in 64-bit mode
    pop %rcx
        ^~~~
   lib/x86_64/handlers.S:24:6: error: register %rdx is only available in 64-bit mode
    pop %rdx
        ^~~~
   lib/x86_64/handlers.S:25:6: error: register %rbx is only available in 64-bit mode
    pop %rbx
        ^~~~
   lib/x86_64/handlers.S:26:6: error: register %rbp is only available in 64-bit mode
    pop %rbp
        ^~~~
   lib/x86_64/handlers.S:27:6: error: register %rsi is only available in 64-bit mode
    pop %rsi
        ^~~~
   lib/x86_64/handlers.S:28:6: error: register %rdi is only available in 64-bit mode
    pop %rdi
        ^~~~
   lib/x86_64/handlers.S:29:6: error: register %r8 is only available in 64-bit mode
    pop %r8
        ^~~
   lib/x86_64/handlers.S:30:6: error: register %r9 is only available in 64-bit mode
    pop %r9
        ^~~
   lib/x86_64/handlers.S:31:6: error: register %r10 is only available in 64-bit mode
    pop %r10
        ^~~~
   lib/x86_64/handlers.S:32:6: error: register %r11 is only available in 64-bit mode
    pop %r11
        ^~~~
   lib/x86_64/handlers.S:33:6: error: register %r12 is only available in 64-bit mode
    pop %r12
        ^~~~
   lib/x86_64/handlers.S:34:6: error: register %r13 is only available in 64-bit mode
    pop %r13
        ^~~~
   lib/x86_64/handlers.S:35:6: error: register %r14 is only available in 64-bit mode
    pop %r14
        ^~~~
   lib/x86_64/handlers.S:36:6: error: register %r15 is only available in 64-bit mode
    pop %r15
        ^~~~
   lib/x86_64/handlers.S:39:11: error: register %rsp is only available in 64-bit mode
    add $16, %rsp
             ^~~~
>> lib/x86_64/handlers.S:40:2: error: instruction requires: 64-bit mode
    iretq
    ^
>> <instantiation>:10:2: error: instruction requires: 64-bit mode
    pushq $0
    ^
   <instantiation>:2:2: note: while in macro instantiation
    .rept 7 - 0 + 1
    ^
   lib/x86_64/handlers.S:73:2: note: while in macro instantiation
    HANDLERS has_error=0 from=0 to=7
    ^
   <instantiation>:12:2: error: instruction requires: 64-bit mode
    pushq $vector
    ^
   <instantiation>:2:2: note: while in macro instantiation
    .rept 7 - 0 + 1
    ^
   lib/x86_64/handlers.S:73:2: note: while in macro instantiation
    HANDLERS has_error=0 from=0 to=7
    ^
   <instantiation>:24:2: error: instruction requires: 64-bit mode
    pushq $0
    ^
   <instantiation>:2:2: note: while in macro instantiation
    .rept 7 - 0 + 1
    ^
   lib/x86_64/handlers.S:73:2: note: while in macro instantiation
    HANDLERS has_error=0 from=0 to=7
    ^
   <instantiation>:26:2: error: instruction requires: 64-bit mode
    pushq $vector
    ^
   <instantiation>:2:2: note: while in macro instantiation
    .rept 7 - 0 + 1
    ^
   lib/x86_64/handlers.S:73:2: note: while in macro instantiation
    HANDLERS has_error=0 from=0 to=7
    ^
   <instantiation>:38:2: error: instruction requires: 64-bit mode
    pushq $0
    ^
   <instantiation>:2:2: note: while in macro instantiation
    .rept 7 - 0 + 1
    ^
   lib/x86_64/handlers.S:73:2: note: while in macro instantiation
    HANDLERS has_error=0 from=0 to=7
    ^
   <instantiation>:40:2: error: instruction requires: 64-bit mode
    pushq $vector
    ^
   <instantiation>:2:2: note: while in macro instantiation
    .rept 7 - 0 + 1
    ^
   lib/x86_64/handlers.S:73:2: note: while in macro instantiation
    HANDLERS has_error=0 from=0 to=7
    ^
   <instantiation>:52:2: error: instruction requires: 64-bit mode
    pushq $0
    ^
   <instantiation>:2:2: note: while in macro instantiation
    .rept 7 - 0 + 1
    ^
   lib/x86_64/handlers.S:73:2: note: while in macro instantiation
    HANDLERS has_error=0 from=0 to=7
    ^
   <instantiation>:54:2: error: instruction requires: 64-bit mode
    pushq $vector
    ^
   <instantiation>:2:2: note: while in macro instantiation
    .rept 7 - 0 + 1
    ^
   lib/x86_64/handlers.S:73:2: note: while in macro instantiation
    HANDLERS has_error=0 from=0 to=7
    ^
   <instantiation>:66:2: error: instruction requires: 64-bit mode
    pushq $0
    ^
   <instantiation>:2:2: note: while in macro instantiation
    .rept 7 - 0 + 1
    ^
   lib/x86_64/handlers.S:73:2: note: while in macro instantiation
    HANDLERS has_error=0 from=0 to=7
    ^
   <instantiation>:68:2: error: instruction requires: 64-bit mode
    pushq $vector
    ^
   <instantiation>:2:2: note: while in macro instantiation
    .rept 7 - 0 + 1
    ^
   lib/x86_64/handlers.S:73:2: note: while in macro instantiation
    HANDLERS has_error=0 from=0 to=7
    ^
   <instantiation>:80:2: error: instruction requires: 64-bit mode
    pushq $0
    ^
   <instantiation>:2:2: note: while in macro instantiation
    .rept 7 - 0 + 1
    ^
   lib/x86_64/handlers.S:73:2: note: while in macro instantiation
    HANDLERS has_error=0 from=0 to=7
    ^
   <instantiation>:82:2: error: instruction requires: 64-bit mode
    pushq $vector
    ^
   <instantiation>:2:2: note: while in macro instantiation
    .rept 7 - 0 + 1
    ^
   lib/x86_64/handlers.S:73:2: note: while in macro instantiation
    HANDLERS has_error=0 from=0 to=7
    ^
   <instantiation>:94:2: error: instruction requires: 64-bit mode
    pushq $0
    ^
   <instantiation>:2:2: note: while in macro instantiation
    .rept 7 - 0 + 1
    ^
   lib/x86_64/handlers.S:73:2: note: while in macro instantiation
    HANDLERS has_error=0 from=0 to=7
    ^
   <instantiation>:96:2: error: instruction requires: 64-bit mode
    pushq $vector
    ^
   <instantiation>:2:2: note: while in macro instantiation
    .rept 7 - 0 + 1
    ^
   lib/x86_64/handlers.S:73:2: note: while in macro instantiation
    HANDLERS has_error=0 from=0 to=7
    ^
   <instantiation>:108:2: error: instruction requires: 64-bit mode
    pushq $0
    ^
   <instantiation>:2:2: note: while in macro instantiation
    .rept 7 - 0 + 1
    ^
   lib/x86_64/handlers.S:73:2: note: while in macro instantiation
    HANDLERS has_error=0 from=0 to=7
    ^
   <instantiation>:110:2: error: instruction requires: 64-bit mode
    pushq $vector
    ^
   <instantiation>:2:2: note: while in macro instantiation
    .rept 7 - 0 + 1
    ^
   lib/x86_64/handlers.S:73:2: note: while in macro instantiation
    HANDLERS has_error=0 from=0 to=7
    ^
   <instantiation>:12:2: error: instruction requires: 64-bit mode
    pushq $vector
    ^
   <instantiation>:2:2: note: while in macro instantiation
    .rept 8 - 8 + 1
    ^
   lib/x86_64/handlers.S:74:2: note: while in macro instantiation
    HANDLERS has_error=1 from=8 to=8
    ^
>> <instantiation>:10:2: error: instruction requires: 64-bit mode
    pushq $0
    ^
   <instantiation>:2:2: note: while in macro instantiation
    .rept 9 - 9 + 1
    ^
   lib/x86_64/handlers.S:75:2: note: while in macro instantiation
    HANDLERS has_error=0 from=9 to=9
    ^
   <instantiation>:12:2: error: instruction requires: 64-bit mode
    pushq $vector
    ^
   <instantiation>:2:2: note: while in macro instantiation
    .rept 9 - 9 + 1
    ^
   lib/x86_64/handlers.S:75:2: note: while in macro instantiation
    HANDLERS has_error=0 from=9 to=9
    ^
   <instantiation>:12:2: error: instruction requires: 64-bit mode
    pushq $vector
    ^
   <instantiation>:2:2: note: while in macro instantiation
    .rept 14 - 10 + 1
    ^
   lib/x86_64/handlers.S:76:2: note: while in macro instantiation
    HANDLERS has_error=1 from=10 to=14
    ^
   <instantiation>:26:2: error: instruction requires: 64-bit mode
    pushq $vector
    ^
   <instantiation>:2:2: note: while in macro instantiation
    .rept 14 - 10 + 1
    ^
   lib/x86_64/handlers.S:76:2: note: while in macro instantiation
    HANDLERS has_error=1 from=10 to=14
    ^
   <instantiation>:40:2: error: instruction requires: 64-bit mode
    pushq $vector
    ^
   <instantiation>:2:2: note: while in macro instantiation
    .rept 14 - 10 + 1
    ^
   lib/x86_64/handlers.S:76:2: note: while in macro instantiation
    HANDLERS has_error=1 from=10 to=14
    ^
   <instantiation>:54:2: error: instruction requires: 64-bit mode
    pushq $vector
    ^
   <instantiation>:2:2: note: while in macro instantiation
    .rept 14 - 10 + 1
    ^
   lib/x86_64/handlers.S:76:2: note: while in macro instantiation
    HANDLERS has_error=1 from=10 to=14
    ^
   <instantiation>:68:2: error: instruction requires: 64-bit mode
    pushq $vector
    ^
   <instantiation>:2:2: note: while in macro instantiation
    .rept 14 - 10 + 1
    ^
   lib/x86_64/handlers.S:76:2: note: while in macro instantiation
    HANDLERS has_error=1 from=10 to=14
    ^
>> <instantiation>:10:2: error: instruction requires: 64-bit mode
    pushq $0
    ^
   <instantiation>:2:2: note: while in macro instantiation
    .rept 16 - 15 + 1
    ^
   lib/x86_64/handlers.S:77:2: note: while in macro instantiation
    HANDLERS has_error=0 from=15 to=16
    ^
   <instantiation>:12:2: error: instruction requires: 64-bit mode
    pushq $vector
    ^
   <instantiation>:2:2: note: while in macro instantiation
    .rept 16 - 15 + 1
    ^
   lib/x86_64/handlers.S:77:2: note: while in macro instantiation
    HANDLERS has_error=0 from=15 to=16
    ^
   <instantiation>:24:2: error: instruction requires: 64-bit mode
    pushq $0
    ^
   <instantiation>:2:2: note: while in macro instantiation
    .rept 16 - 15 + 1
    ^
   lib/x86_64/handlers.S:77:2: note: while in macro instantiation
    HANDLERS has_error=0 from=15 to=16
    ^
   <instantiation>:26:2: error: instruction requires: 64-bit mode
    pushq $vector
    ^
   <instantiation>:2:2: note: while in macro instantiation
    .rept 16 - 15 + 1
    ^
   lib/x86_64/handlers.S:77:2: note: while in macro instantiation
    HANDLERS has_error=0 from=15 to=16
    ^
   <instantiation>:12:2: error: instruction requires: 64-bit mode
    pushq $vector
    ^
   <instantiation>:2:2: note: while in macro instantiation
    .rept 17 - 17 + 1
    ^
   lib/x86_64/handlers.S:78:2: note: while in macro instantiation
    HANDLERS has_error=1 from=17 to=17
    ^
   <instantiation>:10:2: error: instruction requires: 64-bit mode
    pushq $0
    ^
   <instantiation>:2:2: note: while in macro instantiation
    .rept 255 - 18 + 1
    ^
   lib/x86_64/handlers.S:79:2: note: while in macro instantiation
    HANDLERS has_error=0 from=18 to=255
    ^
   <instantiation>:12:2: error: instruction requires: 64-bit mode
    pushq $vector
    ^
   <instantiation>:2:2: note: while in macro instantiation
    .rept 255 - 18 + 1
    ^
   lib/x86_64/handlers.S:79:2: note: while in macro instantiation
    HANDLERS has_error=0 from=18 to=255
    ^
   <instantiation>:24:2: error: instruction requires: 64-bit mode
    pushq $0
    ^
   <instantiation>:2:2: note: while in macro instantiation
    .rept 255 - 18 + 1
    ^
   lib/x86_64/handlers.S:79:2: note: while in macro instantiation
    HANDLERS has_error=0 from=18 to=255
    ^
   <instantiation>:26:2: error: instruction requires: 64-bit mode
    pushq $vector
    ^
   <instantiation>:2:2: note: while in macro instantiation
    .rept 255 - 18 + 1
    ^
   lib/x86_64/handlers.S:79:2: note: while in macro instantiation
    HANDLERS has_error=0 from=18 to=255
    ^
   <instantiation>:38:2: error: instruction requires: 64-bit mode
    pushq $0
    ^
   <instantiation>:2:2: note: while in macro instantiation
    .rept 255 - 18 + 1
    ^
   lib/x86_64/handlers.S:79:2: note: while in macro instantiation
    HANDLERS has_error=0 from=18 to=255
    ^
   <instantiation>:40:2: error: instruction requires: 64-bit mode
    pushq $vector
    ^
   <instantiation>:2:2: note: while in macro instantiation
    .rept 255 - 18 + 1
    ^
   lib/x86_64/handlers.S:79:2: note: while in macro instantiation
    HANDLERS has_error=0 from=18 to=255
    ^
   <instantiation>:52:2: error: instruction requires: 64-bit mode
    pushq $0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

