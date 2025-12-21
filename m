Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA4111CAA78
	for <oe-kbuild-all@lists.linux.dev>; Sun, 21 Dec 2025 16:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766333626; cv=fail; b=hN2stNIA1tJh0ZPoAtF8zlIeGwjkuJs+p9rMmV1NjVH+LkgwG/jvyUQmCS22+a4iYqeLmWrtnvrwZ8qvtM7obqXEUOZQs1ChNVJ97e8fB14qP7vrsmFhOrWSPhuOFolmIgmQjJKCJYKxEGci97F5I6y4uRVzv+j5U7x9zRg0p6I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766333626; c=relaxed/simple;
	bh=zGDaGTme+K2kPWt/9Uiu89iw6OYHPdAQT71AVNxVJ6w=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=Qd3+KCTofNKhQCk+sheq3c5gCypPeQKu9B0Nn68e/MrA/aSbaGBpmQBa206AOrCqXhdYZYXh64JmLNVs4B+lzNj0ugJEUkpZ0efNvkrMEPqt0NsDogGOwWE9Hq1pktH+D3ZNt4g7GS2A8GyrgKSrWKADu0L618jcHE65ARce9yU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MlKRSTbr; arc=fail smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MlKRSTbr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766333625; x=1797869625;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zGDaGTme+K2kPWt/9Uiu89iw6OYHPdAQT71AVNxVJ6w=;
  b=MlKRSTbrl9qHWzF561coMoGCIB+8jpvgyroYq3dw6JsBpD9FU6QIuENn
   pRxE46iIhYz6U3yoeRvF8H1uS+iQT5U6m3lUXs3NoEdxDj9PAmLTGbiBs
   Oh840g36IGHICW3jhxd7czjYFjPf1gb8RSNdGos8Lfzs2igkD8r4YYz9q
   EBEdFtt0pFjgHjXixX1bJzr86oNTzsGUftPdyetr8GzTC/V8btJ8nOaVi
   6JCdJHt6b8Rl6PucTC39/adsNmSvAa0/+pcisYTh01hNFyUSNH0wWw9EE
   VVaGKxRZQMZnjsycN9o69d6daT5qAs4OtO/G1WcixGeyfMOzF0Au1Co5/
   w==;
X-CSE-ConnectionGUID: mVFyHeLASj2hwPYnyylVTQ==
X-CSE-MsgGUID: QSKSEjFuR/q9pPG+L5pVNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="85626966"
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; 
   d="scan'208";a="85626966"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 08:13:44 -0800
X-CSE-ConnectionGUID: XyIgfqJeTSKx5INwUOH4zA==
X-CSE-MsgGUID: UZI3QJfDSRmuRweQc/EXBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; 
   d="scan'208";a="200206855"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 08:13:44 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sun, 21 Dec 2025 08:13:43 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Sun, 21 Dec 2025 08:13:43 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.35) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sun, 21 Dec 2025 08:13:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HWLYU/wHo6Lx6SOpvFsMMlN/9KlprRLnRLX7zZxszQQ2LK6yrQ1C4x3fMN+u2HIQxUPAiEEq5E2AUfOHcil457mQXIkaB9e1ZArEQEJ40L7orfpN5HvBjM4obp/GX5M9BuCRb1i6amsFeuTnwevXym+fiWq43qgyVh3+XfYsaTI+3qRpJOr5srnZLUBV7m0azH+aeZyDn7V/Q2uyQSLFrrhUsdNzG+aztoeVSC5cjnmdyYDpPXsKCCRWNpO2edB0TAR0qvpSfiFKuXgCLbBgoHHFv5uumvDmYohAFn3Y7FfPRrFmIo+BoCjtVBWEtw6TH8rohUcSV323tPQ6K3SvdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GvKQD8Bq6He9CqCDUXgtG72ZhtkR/qdhrb/6forhhbg=;
 b=uY1Q/8jWIwGZQ4FZO6PMqeP+7ZxQPMMP4ScAV3IPoN2zYafhudRpHea3njAGOhCBNJSY0ki/Fuapl9cix8+ZyJwY0PXq1o1rM90nK5fUmFkkLO4mid+3ln13lV5lnynQH0gH469RUyX1OvJin9D/GAvLiWWinaUiRp5PRBm6jNQHkp8C6mAVe9YlfU19CXhOb/HfYy0AN/xSXg91yRrF0eDkjoJur1iG1fTGKNKvuyo9me9nwSyXbeef+WUhsYgUc4YgcwSSDkEqzkNqIHJLY1IczRFKBeS48w067icCD/WzPvhEF2LthQgfu2rkbVrpN6bJ0PcJD3tUM5YzoHrTAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8468.namprd11.prod.outlook.com (2603:10b6:610:1ba::19)
 by DS0PR11MB7579.namprd11.prod.outlook.com (2603:10b6:8:14d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.10; Sun, 21 Dec
 2025 16:13:41 +0000
Received: from CH3PR11MB8468.namprd11.prod.outlook.com
 ([fe80::8188:d688:bbca:2394]) by CH3PR11MB8468.namprd11.prod.outlook.com
 ([fe80::8188:d688:bbca:2394%5]) with mapi id 15.20.9434.009; Sun, 21 Dec 2025
 16:13:41 +0000
Date: Mon, 22 Dec 2025 00:13:35 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [asahilinux:bits/000-devicetree 8/125] checkpatch:
 WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
Message-ID: <aUgcr2+eCKTyulX9@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0168.apcprd04.prod.outlook.com (2603:1096:4::30)
 To CH3PR11MB8468.namprd11.prod.outlook.com (2603:10b6:610:1ba::19)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8468:EE_|DS0PR11MB7579:EE_
X-MS-Office365-Filtering-Correlation-Id: 21ec8373-a80a-4190-2d56-08de40abe870
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?s+ygeFCbrDBVxs6FVmFXxU0dxsYXjin96MK2D+yWcaH2US1IQHliB8zzfx3M?=
 =?us-ascii?Q?a3CwvUflx3DQJVusU/UhdgfTtodz61xgZoRzPPgf06kzW/StbIO9UGsixfko?=
 =?us-ascii?Q?/wGmssOHhrS++tiaU2Imp60T+Ice39rfh2KgfCwraCP0lA2Re94FGxofmza2?=
 =?us-ascii?Q?Tj1lJrR9USVX3KUNh+/0IVYIMcEGs6j5AUBTgEYKvS1OOXGG1DrlSkR2P9+u?=
 =?us-ascii?Q?YWJeSocdIXPH4zEy99RIZDwGaBAGrLWnpfgJwBTmaKQfjtrSj7HJ1b5LGHDE?=
 =?us-ascii?Q?f7bzXzkk/B0Lw/RhGqH9XUCl6g62pUtZ7aL7d6bP7uLeFYGOryYS3AVG7iqO?=
 =?us-ascii?Q?/XHkage6MzukjbRKiHH3F1lcsHLF6YeLMSD2Tupm1ju9+A5UrA4+fxUzz0CP?=
 =?us-ascii?Q?6J1JrMjw+YsHLMOGM8K/QDR923iL3Vy0D5wQ8XBlX9ee3BTXEwm3qMO+vIuL?=
 =?us-ascii?Q?FhV0+RAHCG1jvbQKYUVssjZpl63eQM3J5RWfPvEMFXIJpsK6TVtbrI97XWAK?=
 =?us-ascii?Q?lwa1x1WjvbOP5d3mYVIJozGWNzoiW7ItqVUMAq4lexRMVvVSRFn/YvyBI4ua?=
 =?us-ascii?Q?VssCmzLceX4E+qEP+NehXl8YkLdl1tLYH017gqYf6VfAppiPaOZmNqHrUvgD?=
 =?us-ascii?Q?W1QBfzSVyxUdFchLCdFXj+XH31MdIN+ChBijJJJPa8bSV9z2ht3VG5Nq9Z06?=
 =?us-ascii?Q?uPSnYHlvTEeNOI7+hsjQCUAimj+1843WGKioGIDYDcSDyB+2ub2LbG8YO1xZ?=
 =?us-ascii?Q?vz6KEobnCwwXIEyF64DqFU+vF/NuPlximanlcQOXmtU5hjTleCaF7O8wnP3u?=
 =?us-ascii?Q?CRkB1dXxxMv+GafLF8aPZvLpCFMB+UfGpJ9cqhf3pY1fDnJtDvQC3xJHyKNO?=
 =?us-ascii?Q?9XOiDDrWEqjJeqwLr8clcQ000RQAA66is2azCBMMghWoTFMzyWqnjdQbRSfc?=
 =?us-ascii?Q?7zAzMNbW3VCuzhJW9v/teumgrHrMS0CWy7cMvW5HSyMgiHKHNM+LelBmz6mK?=
 =?us-ascii?Q?i5Lt3+BX+iPfSRI61jAAT8O/39YR4EBk+TEmCBh/LXl1t1pInjG2Dw0t3KzI?=
 =?us-ascii?Q?dCyC4ucBGUXCwhBGXBkTJlECE0+e/EOP+wGWmhF0fQPOY0vDsp24RYj4Jnca?=
 =?us-ascii?Q?4/XP87nu8cycITCGPIWL1tAoOFwOtcDhbSvzOQixNUlatkg19OcyJfQgKQrF?=
 =?us-ascii?Q?CYTwWC48lzNaGSG1Uy7zbLdjd+nERsqVP1jTTMVHIRaYPu3+Z9C691CD41Ld?=
 =?us-ascii?Q?l1tLUiS3WgtIgC6lGHlKKjiyZOIBiWbWx8Pl5HaFWqFkUaQ+x3PbXyK48X49?=
 =?us-ascii?Q?J+A22jjdeu55lehud1rNzUTKySXIXLQAZnOLtT71zn/QP12C67HE4QKXutUu?=
 =?us-ascii?Q?ohDS/38xOMQvKMWwEsqFl0E86eb8HLqV/ODxyQ2Cu1EknWEW/9mITDKxECWy?=
 =?us-ascii?Q?4mSjfSCyg6keYlSrC+Rtqu8FFoU0BmAmrlhy2CQLoWhLotUtqmLMmg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8468.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dOJ1RT1mEmFbyfQf/gZLIZ6PqbyHG9kl73eVyui49t8ZWadlwJFj+IbEuytU?=
 =?us-ascii?Q?64Jrbrh+m95yZn6w+p3sFbQsjAnDTIlkx+W37lLbG24udXSBHlpz2tX+U8D9?=
 =?us-ascii?Q?LzOjzfu8aU00V+wYkjl73Mf8wr+zzMT14mlWsZbn7oSzHwwz4LMw4igIgcI8?=
 =?us-ascii?Q?Q6mZaLXRyjMXeB9DgsL7OyJfxFenGILHQJ64lznRShG8rLAr2ibVmNwLlYqx?=
 =?us-ascii?Q?/LcK7tzwcvkIhCUWSlUmGkslbol2WbJtxtts//nlZxMLVRQrmr0GRDAxRdno?=
 =?us-ascii?Q?ywrRdsZ1ilsIkCJ2df2NiTgQMWUnXAXJivjNAcEyXRsj7ZGXIiGwMZoM0YpG?=
 =?us-ascii?Q?TY7lkt9rKaiBkixAJ0tSAHKUib3YMGYm7JrfUhin2k9UKw2N/05msLbgB9XX?=
 =?us-ascii?Q?piIZLmRb9rhRm8PLajJiiTK4DLvbYdbyZs1+L61aFV4GIWGDy7ozmUvPnLIY?=
 =?us-ascii?Q?/vXjqtnaxxVtMhMsffi4ofR772S15lJHGnVWxZgT0xHD8C2rlLkPMmkij8ZU?=
 =?us-ascii?Q?rQZDYXEDusHEcg8i4pklqMWvzjln0n5iYSENBMorbGpDw8VkZIJi/cuG8DS3?=
 =?us-ascii?Q?/btPK3r67+e21152zBqHJ39IXEV7L3r1lHp6uC92DfEzKZ5SLLhlwdAenX6L?=
 =?us-ascii?Q?S28XpmS2YIzcneQX8Yijmw1DSYLj6OkcXvo/ywXZMsetrQsGhIBeWsZjySKr?=
 =?us-ascii?Q?tLbLImOuJ/omX927Gh23c72KAnY7RoAwOqKgYCCrPLNNX3yN9TuAxj53NXlr?=
 =?us-ascii?Q?o1vL81AOhBLeGhGToKt232kkR3C1TYnZYqXXlKPoCzP76x5poTM5yvkhC4rw?=
 =?us-ascii?Q?FqlaId9L/vqcgGaLL1WvRYf+MXwNoocqnO9bf0TNBwJruJQUVrCDnMDCo7WD?=
 =?us-ascii?Q?xooq6+XHhTQ8U2UZx74g9JD/JOCAsJCp658x3rCgE7e4/d7kVqLWRvGsiq22?=
 =?us-ascii?Q?hTn/ud2YYQkzotChpV//NDGTxlPEAe/l9zFJXv8dE0w06udAIH43riqmhZcW?=
 =?us-ascii?Q?uWf5klZf8TtfIMc3VJOp39wAYYAVHfMBIaTcse1djfh+sLWM3bUq3UKnR3xZ?=
 =?us-ascii?Q?sIgN3gw8ifEDJol+ZasXrWcQEIGUTo6aWhBgB7/89ELwmWVoq5zScAY8Mt28?=
 =?us-ascii?Q?gVUZG2IoiuSWXSo9XaPSb6OnV+C6I83weDuDZPtrLat9Gw55MErM5aA9i1ZE?=
 =?us-ascii?Q?yJcSHML3WvwwmRWPGaUu6hYj2OUMIIzT6TRoKz75ya6/6A7KjWNpWoNafEGn?=
 =?us-ascii?Q?44aEt0AAvwW8S68NeKxvevSuC8TYvDko/oDtDOZVUV6gylLC6SY4+NgftpGL?=
 =?us-ascii?Q?uyP7ooje+zIieBwtqwNdYy4mdlIIWkQDV1Y6ApvO4KXIYvcylDy1KHHtOzqR?=
 =?us-ascii?Q?vYzkJi1RtMHYZ89yTJgaj0jMxRl8OPCt+la38/iHaBy9NCqGeUcrGTdHQ7LT?=
 =?us-ascii?Q?cpyeHbytkaLyT5BKRrP3wUDIPtTWtWjmFFgP432C7Mv1pOtN1YuydbxzYRXj?=
 =?us-ascii?Q?mQr/yaH7teh+mAcsVPprARIyXJDMwVO1EHovOq5MO8nhq8ulC1o23tCOmjJF?=
 =?us-ascii?Q?7UdSK5WtZbQWi1ga+diCBcKeFLOalIvf8hQrwV2cMcl4q1vYRR59LGsl1qMR?=
 =?us-ascii?Q?jFMDjc7FVrA9RW6Ch+tBYH55KQ9pqRfJBM4fwRRAgfqAsLbFMdjgQuviwPbV?=
 =?us-ascii?Q?MVfNvaFBDmTa/qkJCiEYcD67Z+6OUxgbAhFJeQmeKLZsr65L8CAbt3gP9E0Y?=
 =?us-ascii?Q?AEyhkYVk9Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 21ec8373-a80a-4190-2d56-08de40abe870
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8468.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2025 16:13:41.7239
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LFyVs33OWwqSLnzX2x7aUBv6GJNtXh2+1rOBj/o4PgVTg0llux2Q2pXk5eengUpdpVHSe78uWNbvgucn51VZqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7579
X-OriginatorOrg: intel.com

tree:   https://github.com/AsahiLinux/linux bits/000-devicetree
head:   4efff51e5abb86055ae7cd906a51f24d000b87fd
commit: 077730c0196bf784bbb0b7c8828608c2750b45ef [8/125] arm64: dts: apple: t602x: Add Apple Type-C PHY and dwc3
:::::: branch date: 3 hours ago
:::::: commit date: 3 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20251221/202512211750.Wn7FMvJo-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#538: FILE: arch/arm64/boot/dts/apple/t6022-j180d.dts:570:
+			/*
+			* DANGER ZONE: You can blow your speakers!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

