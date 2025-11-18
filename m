Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFEA31FBC8E
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Nov 2025 03:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763435596; cv=fail; b=EaGaSpyYQFVDRX3ViM7u21FHNFTov20Uvx0Bgf6PPq8/nawe4cPZL6io3uo7tkl/s/7iO8BdCRnw3i73xEW/zw5V7EejgBPKihoUZakbSmwfS6/Ros/pPH+TaN7/G+31+bkVlrHUT+GFli3l5PUNgtc26GTgcLhgRI1fABe3lXI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763435596; c=relaxed/simple;
	bh=EX+r+MCmdFC7Qc7cPGOvYnA87FQ+whyTdhwwgU7uzTs=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=spHtgztZWc3dmvUSyA2saOt7ee9jXOiCNUO/AFYri2RUpj6kvtoynVXs2EM3Jy6EfbD09w2rqqhE7wxZwcSSr2C7EN9NA0+sQPZc5IeXTXfaSyAZZvKsDunqXQs+yKltnHiVB8gUzvBMhEMXiIiRGd9BuiXXW4gu4IOddGAczJo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VknyR25l; arc=fail smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VknyR25l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763435595; x=1794971595;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EX+r+MCmdFC7Qc7cPGOvYnA87FQ+whyTdhwwgU7uzTs=;
  b=VknyR25lg+9xuT1qVyeLOJdXNbdLs4IATcL6ut/Y7/gTedylNhmQyU4T
   DCKU9qIgxRFQwqqexshiDXcefnZhEo/JFytRaqj1Fip9iH0gYB8YRQ8+q
   7Xe6PB8R3d0QxDW9LHil9zP/LOsLJF1BSH393yExfgWUBAjpYkvkR/I/h
   5VtJHyehblE2XsWik7J8GgR2MuPeLmMihb1cx7N9JhU31O3mSEeCFATuq
   i+/mIcUFThGOk4HVtbFqVrn05YTsiVV7l6YXZ1kwZhSIF4b8SRkbqI/Ri
   Df5cTx29KmYy3y2RPBRnAT4TiObgw7cBA4oxGjUZDysC00thNqetskPVj
   w==;
X-CSE-ConnectionGUID: LeTXAF5FQ8qrZFEGDnnOvA==
X-CSE-MsgGUID: fZGHnPAkRd6vRMvmp4uTPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="65384738"
X-IronPort-AV: E=Sophos;i="6.19,313,1754982000"; 
   d="scan'208";a="65384738"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2025 19:13:14 -0800
X-CSE-ConnectionGUID: Yrw+kP+0TGqiSqzvMEAMsw==
X-CSE-MsgGUID: XB8zg5UTSE2mN1cE/GFNhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,313,1754982000"; 
   d="scan'208";a="221535913"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2025 19:13:13 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 17 Nov 2025 19:13:13 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 17 Nov 2025 19:13:13 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.29) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 17 Nov 2025 19:13:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A6AYu5UH8j2LRHY/dJ0loM+7BCzB4MMVs03Z3MX0gTlT/+ahE/VIjUvM7hlD9iLtLMOt+FdQw4Vi/ggyNrzAmOaWcH3kFTGUgp/60AUX4Dq3L9zn+x6N9vQeYnXpyzVm6AbxjxPhgQ+NEbSrWRCtJYoks9AzTQc08gHIJmUmcA72kze/nawoTwvAjOALHEf7PqWumy06JXx3t4at61l+aHNV+GNduY0z2v3cKLynF2rfmWFP5cxWu95xu3i7gozShPxE468j7ZF55HATROqiwopZX2Pjyj+JPr8ezQXO5j6df3+yJbIxb6rqo/i2ZZMJNs7jdqPqAygQlnwmeH7vUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RgWtkbB5NLSlIKl/lOcQPenFTazfipyxSXaeOnOpR0A=;
 b=faAun+mBBf+wGI1U2dUDCSfMFuXfSpeq41Gp+doIAQEdd7tsQUrFxLlCrvS/hK5PvenOPhv8NIsnSeP7tI/hNpRN71W3II920+Kih8vS2Gv6kdHB1nWrTxh4yBN0p4Ss/XpE4aSwomaDK+MlofJPblCT39pMmX3SI6eYG2EwecDjRTF4YHf6d65SXca+QfpDga4PIRln3pE0OzopCupzRVTYIGXhgmHAHN38MtDKoNQkCeF7lMniU6dSapG8Y2wXQPcJTZCmArfxMba0lUkjCFFur+eOeuHcL/S7NK4Hc2Wv7Teb/HMkSarm8VqsOnwfvT9S5D/MLydVF0Qm60sk8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4165.namprd11.prod.outlook.com (2603:10b6:a03:18c::26)
 by IA4PR11MB9153.namprd11.prod.outlook.com (2603:10b6:208:56c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Tue, 18 Nov
 2025 03:13:11 +0000
Received: from BY5PR11MB4165.namprd11.prod.outlook.com
 ([fe80::3876:1eb1:8e84:84e7]) by BY5PR11MB4165.namprd11.prod.outlook.com
 ([fe80::3876:1eb1:8e84:84e7%6]) with mapi id 15.20.9320.018; Tue, 18 Nov 2025
 03:13:11 +0000
Date: Tue, 18 Nov 2025 11:13:01 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Hsu <d486250@gmail.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [bmc:aspeed/arm/dt 19/20] checkpatch:
 WARNING:FROM_SIGN_OFF_MISMATCH: From:/Signed-off-by: email address mismatch:
 'From: Daniel Hsu <d486250@gmail.com>' != 'Signed-off-by: Daniel Hsu
 <Daniel-Hsu@quantatw.com>'
Message-ID: <aRvkPfaWPFoOMfoU@rli9-mobl>
Content-Type: multipart/mixed; boundary="IyEc+lkFGfteoCoD"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0170.apcprd04.prod.outlook.com (2603:1096:4::32)
 To BY5PR11MB4165.namprd11.prod.outlook.com (2603:10b6:a03:18c::26)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4165:EE_|IA4PR11MB9153:EE_
X-MS-Office365-Filtering-Correlation-Id: 07d98831-3a45-4420-05d9-08de265067a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007|4013099003|4053099003;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?mlF5o0GiJBe+ofAvhZCKLLJNu9JEcQDTosjHX1uV40dpgw4t5S7q4gwY4xIm?=
 =?us-ascii?Q?itGWjKdHo6xQVTrsHWQepbMFByPljCz8F07HtLzZL2d5UkjxGgfHTwgLaOzz?=
 =?us-ascii?Q?1pKkr+dy5dA65ZZnjNvB2xvfn4RYP4et8y2QkQcwD9Rbu6WYawFUzMBup7xL?=
 =?us-ascii?Q?tDUm2fiWGv9aFx760YpJozv2DSeLGNe0D3FfxyRVdWll9Qw8A4IlJ631tFrf?=
 =?us-ascii?Q?0uz8nvecM5mIWytLr6Ucp3SLbDV3nXBde+5VWMMZZNPogy9eLjjqqPsZLZm1?=
 =?us-ascii?Q?WM2nsE3jmVgk1UB4SGgFB/lBbhAzwtn7NrgAxz3APYbwjR7dxOpgeNYhwdxG?=
 =?us-ascii?Q?4ZgFkgZyHIrt4XuE7FTAWhaGGpMfFLtKYQ/9ib8puW/mQCGUzBlr6qMs4iBp?=
 =?us-ascii?Q?h+oBkUVJefivedtdmCJKQ9q3zxbvH8tN6OeiKKZVn9gaI1R34sSP4leT1D0G?=
 =?us-ascii?Q?0PsUyGSsiEB2NxiOv63iZJef7Smj0iqcl6Rj+p5SIHbJ2UdEusa/rYBqEJFI?=
 =?us-ascii?Q?7R+8d5nM67b7w5nZ0g4CoXp0I2/seeQi1v/LdAv979btl8UmRC8CO24Xhqqh?=
 =?us-ascii?Q?fPsuICmDfB4TaaMs5hnrwZq6glUI39S5swYgmwfXylaGusZgEwtzqMDdcMzE?=
 =?us-ascii?Q?iHmc3s6rACriCbmBbB/ws4YL5avl4zZ03mXXyCwFEELjDXvD96M0L6k/qI2f?=
 =?us-ascii?Q?T2hVsY/wzN8aBOZLyvbeQdXMQ5Bu0S9XX4lvo/ocFfZ/s1ubZPqvMS68J+y9?=
 =?us-ascii?Q?3QOHDMVJEvT3j/1YQ/iMLC00oilJQ+65HMhGcXAd2WtrMjkm9eINCqbFVA4P?=
 =?us-ascii?Q?MBmgWDvo9ud29e45YHtgT2hT5CAKKH0QkTh5J433TOCJ8Hs47aUfrRxZ71hz?=
 =?us-ascii?Q?g34QX8kBV3CW8o10DbFInPQyOwaTxKhagqSDTjgQzdoZDIlmuykGUKTr+J12?=
 =?us-ascii?Q?vG5sIWfWAIt429MFGWfbwEvxNHRYrgrE/KiiXpbkIZOsriwRAuRkhN2ZyzKr?=
 =?us-ascii?Q?U7Lcus7HMZj2gi49J+I1dGjYbmOvpXTzlaU4nl1HZOuZAW/rytpKgT3wY/RT?=
 =?us-ascii?Q?mgmX02AfBCMJiVgXz3Le1CQKiMVYUnHmawcKr+wpOTv2hDTgO4Un95UbItTC?=
 =?us-ascii?Q?cPUuxa57mIz+ylAkxkjLdBLhNv4pNPlIqYgNeE164flFTYO4qIn+ILQEloOi?=
 =?us-ascii?Q?/nRcSoGPW/YcYCbzgtymt8O992HYTBeRPJum06C9JYbSqZwpF4jSQAiyQ9dV?=
 =?us-ascii?Q?ZsNuxa1dZVofwGuffh7DyUXP9PRiyO6PnZnsCWE31gDnYKde/IOtMDqOwGVb?=
 =?us-ascii?Q?feLgPfPpSiRL7LjxVLJJl+0FrZOqMcChaJBOisTUa9U4AIVlxLXgbwvHtNXx?=
 =?us-ascii?Q?4UdlMkdVowNjQ9RLd0YDwo0L6FdhJ3vZ+HGNzYInJW8mMC/qwJ5s1g6wlHf4?=
 =?us-ascii?Q?pwpmGxzxFARxcREnfL2+Ie6kaI4jGfrBenuDS0HFnuoKg5W0nuEtuw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4165.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007)(4013099003)(4053099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2t0xdMt8j3ltOcEFAZ3JFp7PHo8l0R7sEd1MsqQsBzPRb62DCaykB0uMdres?=
 =?us-ascii?Q?U3v7PFd/f54f9NBZLUWihCqv+LWTV5BiVbmi4VWvAR6Wx7qR1qsDFoRcV13J?=
 =?us-ascii?Q?AcX8b+ETZl4KpFuJ4mH/rTPN5n+xV+2jofN94uKbtz9GjEO9krocHz1VnN1/?=
 =?us-ascii?Q?ExVp/LJxJrdyi54qMORM0cftYmvk2tNCk1C+9vFCsj1bSmDRZ212y6R9RJz2?=
 =?us-ascii?Q?JhtKHshirYcYnT+W7o2i+b5yvINfMZwapB4znQgCI56RVG90aJjLJvmYAQsq?=
 =?us-ascii?Q?G+JxyCs9jk5b8QUvULd/H32sMBtuQDT3djt2GPlpixFcIiWqUm3LrUO4ZP4S?=
 =?us-ascii?Q?0l/Kaqwh2ukZa1mWBTlftD5PzPY1Ti9BLgBnmuKxtXwXMETzct9Da1PLTubh?=
 =?us-ascii?Q?Y40F3O55QOyeA9T02d5itz8i39aJatirR8PmJN6DEomb3wWv0Vh8emZj7RXL?=
 =?us-ascii?Q?TAMtzTeaU9hJHNXJXav+mzMWSRhYgPhSAXEBWsnAJSTVN9RG+Yimf08JXfXv?=
 =?us-ascii?Q?9t/qi9sgIwSpAysxiqsk3PFPi9xvW1/kUBQ8heaS7sQhZC663rfRml03OW9x?=
 =?us-ascii?Q?H8QiLI0aU1nEryYWVakf6aqEHs6FnhkdfW9CdxljcZl419oPHYJPDT2OtClT?=
 =?us-ascii?Q?/c6ysxNA79c9Gn5YqL8nXByco0/15BTEiURfViQ+fpLp8gtc5zHmOQRmGzHj?=
 =?us-ascii?Q?vUaRRdL9iF9cXqUAxavBfgI2YliSaYz45EQUApSueAwrDG5Nq/5h+dJ828ou?=
 =?us-ascii?Q?G885jMZf6dlGjoW2cQYr3yLiCsyWByLCNJ9ZIZ8atD1YdLrOaB5C3LLXuHl8?=
 =?us-ascii?Q?AL3kJvTH1qSSt8E7L6qZcNxmljSrcFf6AE1QtwAmHJjZYQX/DAVBJmofNgAo?=
 =?us-ascii?Q?tP1lkIf/WnsDUMfzWK8hDS3QaATOcsrI7NdAEIj+lPpbVE9YSidJ+Zr+EVHR?=
 =?us-ascii?Q?xjSpcHuezB4/nLybpMW7jfm0APzRDR/Znlv9ALVuGrXrEDWKlKd5QHselpwC?=
 =?us-ascii?Q?jm0It5QPOY7AAj5EMdMm+8gks4C5q/DH+/pGvdm4PnDoD6YLKVSJf14Tl2u7?=
 =?us-ascii?Q?z60MYIjWhieD1gcVUl/STXVjoEAk20vQGiWU8PJlSgwfKzZr4BnX9HUoV/gO?=
 =?us-ascii?Q?7MASyF8F3Uyrh5i0Vh8r6DBG/LEgCPcB+h77uGpDzDjwLu1tWl0vzvk1K3GM?=
 =?us-ascii?Q?u+RyDx15lMDDuwFuctHz7SvZUpEjeimu8/HikKe6+ENovibZL9KDXmuwii3H?=
 =?us-ascii?Q?jT9Em9oJcG6Kpv/s/P6sDt5Bzk0Wd+ROwba2fM7Qr8Sq/5dyXzH5ApLPlAjG?=
 =?us-ascii?Q?J3YTmEPhQ5DtB7x63iDZeSkogrUT7pyUA2Mf0TkwRaZsJ8khBAR9nbc/yFu2?=
 =?us-ascii?Q?8mEkLcU9zNAsEsqwa8RPzLomtC3INVtQdkRhNXg/wT/QQ3WuwN0W9SGjYqAt?=
 =?us-ascii?Q?i4W4vnxOv+Np1q570IYrTqQrtlmL1ikwL/6C4EuBqsgZIIYBXmIGZqaIuzb3?=
 =?us-ascii?Q?KHQ03FONAP91SXHxIctOm6cCTJcZVXysA8faT4Pe69kvm2nCMtrYnUr55B04?=
 =?us-ascii?Q?taNlt8JpL+39GKFKFS4NPJf4iBU6T9zsTPZOiiV5ygBTM0u4lEpUcDCL/VYf?=
 =?us-ascii?Q?Iw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 07d98831-3a45-4420-05d9-08de265067a5
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4165.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 03:13:11.2143
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y44QgwRp0mrugybUyI4Inh5X4y6+dufsV6pwt057uBNa0rpnvrIbNyhAK4wiyhgsmh7TOfugl7nSkEGPMx32JQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9153
X-OriginatorOrg: intel.com

--IyEc+lkFGfteoCoD
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bmc/linux.git aspeed/arm/dt
head:   f5f4511ccb747e01ed5364e9eec7be8b62020c4b
commit: 6f10733f7e2ad074a4d29dafd027f58e1cf7268d [19/20] ARM: dts: aspeed: harma: add fanboard presence sgpio
reproduce: (attached as reproduce)

# many are suggestions rather than must-fix

WARNING:FROM_SIGN_OFF_MISMATCH: From:/Signed-off-by: email address mismatch: 'From: Daniel Hsu <d486250@gmail.com>' != 'Signed-off-by: Daniel Hsu <Daniel-Hsu@quantatw.com>'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

--IyEc+lkFGfteoCoD
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: attachment; filename="reproduce"

reproduce:
        scripts/checkpatch.pl -q --strict --no-summary --show-types -g 6f10733f7e2ad074a4d29dafd027f58e1cf7268d

--IyEc+lkFGfteoCoD--
