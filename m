Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 707C31C84BB
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Apr 2026 07:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775114688; cv=fail; b=Hiq4djB42x8huvIqtkQLwJXhrclmIk4KPp8dU/WK4p42WnL/bgn4uK0MakUpIdq4OejkDIhrmSvWy8l8QZqR5nKRf04gdv6B5mPLqwdXmuGSYtICNgeUdGvWVNTDFO+FgQO9JPBPgarg76lR0eFqmLtGIu8bpAaN1mSJyKq0jeM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775114688; c=relaxed/simple;
	bh=cyXEYuCdI1JT/ZerM73ttDEXOAiqxO2ePUguyNYdE3Q=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=pxkCM/xD3DU3J0H0QozkiM408GIyOdxj81MDMqpcJR2Cf+ANeepkIjKCWTVuZ5LTFH1VfWPrdM9ZNY+UcKsRaZbt9ps/Y7uFLP4VtMVYUoeiOcvdF+7qDs4uk+xFXb/cDQh7s9PQMZrzGuFX4AG81F3WNHyUj32YWa0p6GNLaoo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hCyFbxsz; arc=fail smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hCyFbxsz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775114688; x=1806650688;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cyXEYuCdI1JT/ZerM73ttDEXOAiqxO2ePUguyNYdE3Q=;
  b=hCyFbxszCZLE9nbNnTRkkXUgtQqg6PEECt3vC5kuG58oDA2JN/V04gkG
   wX2NTRMB/fHzR2wmqIUJ29DpaE4ezs0tbZ5GdEo9FKoRdHbqvWeMWtqPV
   XscWW2fpzbCfTqgKf+N2tUMAYQev+5RAHDXfhMhjpFbFSUy3NaFciO2mC
   yfy8aqDayUVYNYHhG1CGKy8JGa3dxuLvo61tafhqfwZaISXWfoH8Duns6
   C3NEVS1hFYBxClGzCy0nKa5/RSGbfU4UJV/Meohydw8vRIRealH5HST5u
   HhRSu4CcVLhUR+OF/ADMG6yP8isc7KXOYK2gwkWubkTyrMH/68HnTSJfu
   g==;
X-CSE-ConnectionGUID: L1cFMnybSjCHtpQ7mZgxQw==
X-CSE-MsgGUID: EaV7Z4+SRdO2RAwM15YUsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="93560044"
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; 
   d="scan'208";a="93560044"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 00:24:47 -0700
X-CSE-ConnectionGUID: sqdEyiWWSRqHkAB9T+04xA==
X-CSE-MsgGUID: UAR2WFeJSMC0WMwT660Nfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; 
   d="scan'208";a="223630831"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 00:24:46 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 2 Apr 2026 00:24:46 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 2 Apr 2026 00:24:46 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.0) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 2 Apr 2026 00:24:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i6S5NLVty+GkfwzXfXn3XMAEM6F1XUah7WvJsZzXq9jLJ8iAHjhvnyL3SdOxi9WdnvOulS9aBgQpK7TQUa+Q2qQIoqDvD6qhX7Qw9dy364PhPMvEtJHWE3czPtz1JEve6od8F6gSKn8JU6YPKdacI1SFqiSE6aSLgNuxn8g7w2DhBzPJqA/CXfApvFZPSZbxngwsmP/Zf9lF2DF9PM067wSPPJNDebsXsKHGNfeUoS3acwawKx/sSJ40/lupP9qd5KusVTomVkXMk/1LPL8boW9qhBV8yqAKj8Hi1JKedj6CaItWqlIRUV/YtSIrx7lbwSqxTLXyk/Bfx+/pwi6sdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vh1B5wTvo08rLrF8L4UjY9C2WaWtqUWIOriUI+FMIUE=;
 b=UR3gtulqBlPEjMRpTsPWWYijQPDLxCqG1e/pJNvMHyfdkuzLUJx0xFcx+ZaUNo3uIXtnIwIE/DVDAtaFXN5qa9RnwIdmcxa+isMXCSWeOm6R+spnBRywy45RLERnRGeJuD4OHlxEkPA9fg7bnIJEqc09Ffoz4LEu9HroS0qzW+WD0/dVn1lWIAHIJuzFBRBGmk8GZqzFpBLACL8guXwJEbmsYQ0RrcIJWXLex575Rj8FoPXIj4Gzw5wo/jDyXYYmKtYtDFrnN5bJMvQk+Q6ncfO00IZUbylFetZUI2Cnl0G9FinVZuxafqxKjl3nXBKbRHNEiI6EkbPf2tR3YfcDmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2808.namprd11.prod.outlook.com (2603:10b6:a02:c8::26)
 by MN2PR11MB4632.namprd11.prod.outlook.com (2603:10b6:208:24f::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.16; Thu, 2 Apr
 2026 07:24:38 +0000
Received: from BYAPR11MB2808.namprd11.prod.outlook.com
 ([fe80::defa:788:da96:2f9a]) by BYAPR11MB2808.namprd11.prod.outlook.com
 ([fe80::defa:788:da96:2f9a%4]) with mapi id 15.20.9769.016; Thu, 2 Apr 2026
 07:24:38 +0000
Date: Thu, 2 Apr 2026 15:24:28 +0800
From: kernel test robot <lkp@intel.com>
To: Lincheng Ku <Lincheng.Ku@amd.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [agd5f:drm-next-7.1 30/71] checkpatch: WARNING:BLOCK_COMMENT_STYLE:
 Block comments should align the * on each line
Message-ID: <ac4ZrGQP7lkmSdJR@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0155.apcprd04.prod.outlook.com (2603:1096:4::17)
 To DM6PR11MB2810.namprd11.prod.outlook.com (2603:10b6:5:ce::26)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2808:EE_|MN2PR11MB4632:EE_
X-MS-Office365-Filtering-Correlation-Id: 6756eb5e-7787-4de2-0697-08de9088e561
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: gPYfzU7Yr5iqa1SungTopM6zJe5RtBz9utMT90mpizyW6ZrWe3XbY5qMDAXVCxp/jih7NfMLsGT6gpAxFgWf3soJX9ztUB7QuWxdRUj2j7OGCCzRVD6bHoVqDUvrxKeQBO1JQ7V6Mf5PhmKOdunwx9XyPBFs2Y5uJ/8sYqu/0Dm5Fn7kdL8VCYfZpRFaRS5u5413UTlSzoi6nHfWsr7xWTHkmTbpgC1KguTtInmw41Hw+gZbOOllwfDzoEl2u8k2mr33AbKETb6tzP4Tyf24gXcGTSVFoX1VHJTD34X2vGb83wZX37rnkIsIjqffthq5zVQ067++BVgbewn4PXG01GEYe5xo2Gak5uM09Si5YPJzuo/pBU1j85/SJFSfCVPSXMgSd9SW2A0f2XIWCPubLHcV/4Z2vAfyb1iWpL382uIleommuOUILSE9Lrt2xmg+t9qNtDQs94FBOCPcahbMlDuZuLRRyGkrn2mvNpGEYXWbdPBwnyHBgeyjJmXGp+DE2r1EuuSqwQfF0Jf+uc5QWYv/4s3U6c4lnYb3hTPVj8z96rEVfA3gfvWcYm0aX34jQvSxcZixFboiIEvxtRYczue7iIEagnS7wR1k6KDJzADrFeD4yRSLQe4L1FIZvUR0XB9mFUud1tPfUZ1EbPLioAYq+Kg49+jGRSvJ954GEzoD8YYglRe0oCd+ALvhIunu
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB2808.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dcalV0jhYRc6mUyH91sWdiPADVbROQj1GxzTZFAYeecz5nyuIgEWT71Q0l/7?=
 =?us-ascii?Q?rEFF8/XcL+ajBY3mAgEPkOgJHoAeQ4EWe2CyvAWYu2jV1TWOrzNyd3fzb8k5?=
 =?us-ascii?Q?Qv1tNflkRcKW6P9/XYImpX5gy/4507htd4XxUaLSPLRMRV7Wgul4PKYVVXLA?=
 =?us-ascii?Q?dzACHH1TeDNqs6nixHOPUogZVE+zqPsXRZZ0Z3uELWLf0TOgt3DuN+DYIeIA?=
 =?us-ascii?Q?2JmUtFASfQBUgwSzGLJ6bIKm+3QESM4gVx5GvqN69J3bTbccBBmMUlADIbS2?=
 =?us-ascii?Q?yn9QWTWPBPXr/sRAR4A72liq+dQYR5GEDeKSStLG/MrJs7HY1XaamaJZamaQ?=
 =?us-ascii?Q?CEg8JtKeUuZrwVTzIu91pxKPi7JIgf2gdSCob47aKP1VHy54BxRlJq4W9pQT?=
 =?us-ascii?Q?slStR+UOFdnlCpbCX1EHV6jIBGYj7mwAbZK6W5pTgNaXPdMRdLF332B4E/iS?=
 =?us-ascii?Q?I1QxARtB/gStt0ut5oc3FsSWY5icQYlF8u+0abBoyXAbP5OGI7DZ7GrZ33zB?=
 =?us-ascii?Q?L8W2LH5qZz8LALNHurrArHLUpKyrvGdHKcOu72FktNKxfT9sMy+jZvc/VGaN?=
 =?us-ascii?Q?OGfzMSDX8Vpj+5Rh0z1rPrYDQepAvONQm54fJ6hOICxbQ7sw44yUe8AdmO7j?=
 =?us-ascii?Q?Sqf6Ah2onvcsuuLEH8sB3dV2X98PB1LjGf0L7tfip0Quv+L7EeEoQ9WLDFHO?=
 =?us-ascii?Q?IuFhQGEYrqMmdoHKlJFAEuHLUb8sYfPLGo+XZACITEw/KNq68SFByROYxpWj?=
 =?us-ascii?Q?H1C5/kalrgp2y4WakBEMrIO+leoRBROJb0NEv1TVC/z1rmWFZgNO3u0Wnne8?=
 =?us-ascii?Q?znnU5B7UcfnTBVnMQ06AgGG2ItAxBcHUym1150q2EwKnv1Q74quXv0H9zhuR?=
 =?us-ascii?Q?qufn/qOExbK974IKQFXV51aDFEMK+EoHixHeAqwX5URYAF0A0vagQIg3M5BK?=
 =?us-ascii?Q?+WADC84MN6znLqAnW+UcoTMnaRP30tbIrbSeB//my22NnwhchbDW22y8Mx7y?=
 =?us-ascii?Q?huTwiF4q2eVVijleAsIOoE6f170nGEZDznpNv67Bif7hzBsRzfo8LFBkASqb?=
 =?us-ascii?Q?IxVTnzMnCdZpbxBgucnal/ki5g/5dS0KXt7mNPi7KxV4uz839WxJgJOym9om?=
 =?us-ascii?Q?OPce8g+zvr3oKrQhrvJdzN6cwzNT5Ge+5xx4DVMU3X2KFMfYlPlQvW4H4JHa?=
 =?us-ascii?Q?OBYcJUqazEONvWrgcj8Kxzhp8raSaXWG/rZV/E1mAZNVdnpDbh2Yf7enB7z9?=
 =?us-ascii?Q?GcpfIEel3SmAPDaE+BzlJPSHfKNnZ6o7sJIXVMc4Ly9MtKbdz+N6iENIHSEN?=
 =?us-ascii?Q?BLUXEt5zGXuOQ2Rj2Vy8sZ58Q5zunmgJO33SHZE24RhbcS+DRBR0EsjU2xOB?=
 =?us-ascii?Q?S8oZ1TATgAhjZRa/gvpNqV9+JA07p290WCu5fn5XX0WJ7zUChveWc27usoEO?=
 =?us-ascii?Q?tA/UzjCCVKpvDRok5RMK8kqkAssTtXdBI5T9zW7tWomeeXSd5emyrPA2p0tu?=
 =?us-ascii?Q?ZdMskETqLgnWQVVhNTL78v7biN8P8UJCr25zfcrO8jUnWKqKdnCG+UziTTWm?=
 =?us-ascii?Q?OO42nY46XshKDUS1CKujfZRs2K2NbsOBUaiFLHtZAWKAeD/LGSqogEsdnvqy?=
 =?us-ascii?Q?vOzgXr3s36xQTgrbL01ETsXFCEtTbfC+RFVNO/Y954fkqOyCZPuPzy2n/Gyh?=
 =?us-ascii?Q?0siUHAExznsuuj4PoedFP39HQbCuKeEVLMZn42ifR6TyBNGKkkv3o0KQOAJM?=
 =?us-ascii?Q?tDi/jCi9YA=3D=3D?=
X-Exchange-RoutingPolicyChecked: MhJef36Q4Hi9DP6jAFHlDwL5/PnErUvKAsZZBM/23G0w+Rfb/M8MBJxgmWPtI1mxjYP28Z/+MD/JH8lkg0+EbrQF7OlMuF1UK0aqWnXoWPWQMbpK1C8HshiclXIUNcX3c9miEm0f1avqgfR5bvspIcaKe9UyC1hpl3GlanrK2AV0uhR0d5F2dQEtGlnn1dTYpojYSIuE2PTujsbNcgEGR3zXqc9Pmkigk9CBCWdf1Z4O9sW8ye6QhI2uwUO8FqmsZuF03cSdAGPtcEymRpk/zDcX0SwunIHO4NJWfeaAmByTZj98Y4y4og1sXTvcxXpTdkTBoJTHRLCNtLlCiIEP7w==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6756eb5e-7787-4de2-0697-08de9088e561
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2810.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2026 07:24:38.2084
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z+5kGdOqb+Hp37XqhXzhdBNJidSjkJedSQeL92kWrZWtUmMTV0YE2uNl8MK2L4zxOkqFAJEmpdNNRg1wQkcfFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4632
X-OriginatorOrg: intel.com

tree:   https://gitlab.freedesktop.org/agd5f/linux.git drm-next-7.1
head:   8b3e8fa6d7bdab292447a43f70532db437d5d4f5
commit: 096bff6706eb105954bb45f8e8f3e37f05d10d0e [30/71] drm/amd/dc: Add link output control for DPIA
reproduce: (https://download.01.org/0day-ci/archive/20260402/202604020307.bH6aKhuM-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#38: FILE: drivers/gpu/drm/amd/display/dc/link/hwss/link_hwss_dpia.c:149:
+	/* Ensure initialization order matches the declaration in link_hwss.h
+     * for strict compiler compliance and consistency across HWSS implementations

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

