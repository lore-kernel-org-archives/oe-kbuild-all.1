Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23CB42222A8
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 May 2025 03:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748490827; cv=fail; b=eJ7fy/clCiFGGZjODwojNBf2b8vIBgIgNl/GTuQlRI27NffYMqkuRVFEV2eK/oAbJWCZbH76TO6o7G/ex054pNGQy7ZE/P+j3SLBZ+7JTWKgORBNQB+bCyVZE1XbmPAmpOT+XkL441w2oP+Z1gGA+Ywcq5UbSBw/JVugkdAKQoU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748490827; c=relaxed/simple;
	bh=SH+/XdIdkCNAiQgWTGM8AtLurenb3Gp1x3PS1GfsHio=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=D7gCMtmU31LZCBPXnbfNYw2Xu2EVFFY6X3ET48qeLo9+NsKF6VncQXjDYAodokmwEfROAOzPnliO0zcDTiRlwCqGJB+AZpQFArOiXLbUui571KhBBSDW18ZUiTvUzUmN6Zd1z+x2nrcphIKzPZQaOhxrlf0AUh7JtuZ/lh5E2BM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e4MaY1VD; arc=fail smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e4MaY1VD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748490825; x=1780026825;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SH+/XdIdkCNAiQgWTGM8AtLurenb3Gp1x3PS1GfsHio=;
  b=e4MaY1VDj/svv3MU5ybVHvhKRhUBr+QqC8l5F2as6+GKGzjBdLc+3nXd
   gZwbeEXDW7hCQ1A2sMOEdjg+zB7tjwSv5K3MI33FasrVGTlsV6EmNa22p
   6abUyndyCysdmDhIQz+rEp1MhO0+Eft7MmeByaINmilZiOL2pXyv/dncM
   l6Ba4awBvud37MozcBIjO5Rke/j48iTiGISO2nNbvwNdV/y5U+FB3df2i
   O6mAwIvHGo4tBOKI/+TafzMnrlbKN5Z5eD5CAXe5WCGwuAWlutbYaXxev
   I9GGkKpaYnCVofcWwDKfzI1//qWNgZHj0smHJwAiPDp+ui96UjG5dV8GF
   w==;
X-CSE-ConnectionGUID: dU5glOJYTZ2/KA2Ovsap1g==
X-CSE-MsgGUID: qxVR54uMTeGSzL/Yfsia9A==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="75926662"
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; 
   d="scan'208";a="75926662"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2025 20:53:44 -0700
X-CSE-ConnectionGUID: e8zEDIQmQsSAqhS1Sg8v7g==
X-CSE-MsgGUID: a8ODHzPQTlSIuLzFGugB2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; 
   d="scan'208";a="148206911"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2025 20:53:44 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 28 May 2025 20:53:43 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 28 May 2025 20:53:43 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.60)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Wed, 28 May 2025 20:53:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FhyFD68cx2m1VBuD2dYpKLccD340RpDkQwlly5ZvDkEbu+oTkgeMNQxKQV3XV4y8SVLrXyPdL1TKwZCnmmx2y2tTiv3fntgi6zWvXo16K/Fhn/gwv3TKhzazFhojKNL+pvqJPcyIGN+VeTvIyruMKH9Q00X/GD7PNTC3tvVrijDkrLRmIeesmvTncatM9Ru7BTUKcqp3VzgC4oQSQN+BHM59TUICGZsMM5INF3GO+Lgy2bhHO2R/aRk2wAxCEYIxbw1nmjzWbo4azPLiqZ+JX23wD5f5igo5Rr8LULSD1+w92uJ2pl0+g+w45Ee1GTtVJvQ/nKU5g+c/IQjW2I7eZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PO9VtHbRhkf1y9bzDbX1HIwVtnS9rPInpL/UMBFDfe4=;
 b=X8nn0uehQ9NT6l07Df96o/FblIiVsUGokGuIBHLks/9ld7vpITuSFesJEgXPMPYh1Nw0Dnj6cYrDaraRTiP3ft8dQZNLSb0poIRne5jsqN69mvwocMWB5qSchYriR+TaICdCJonzKUwkj+U5vhPxQ5YlWrsXRxPxZR4j1TyBcJMLO4HKXIDpq1YZ9Hcx7wZCpguyhdoRLFJbCjQwKpnzOb83yVltLI3XaNSdXPmAauiMKht4DMV/q7/olTniuIAdK3AYY6J9dxYETTS7yKel1nOn3jVaXn0HpwJDPiOH7zyU1lWa+U5oP6MTfV78ho4ZK9phuCvt8KhuvLTGWIdrrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5674.namprd11.prod.outlook.com (2603:10b6:510:ec::10)
 by LV3PR11MB8726.namprd11.prod.outlook.com (2603:10b6:408:21a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.27; Thu, 29 May
 2025 03:53:41 +0000
Received: from PH0PR11MB5674.namprd11.prod.outlook.com
 ([fe80::77d3:dfb2:3bd:e02a]) by PH0PR11MB5674.namprd11.prod.outlook.com
 ([fe80::77d3:dfb2:3bd:e02a%4]) with mapi id 15.20.8769.029; Thu, 29 May 2025
 03:53:40 +0000
Date: Thu, 29 May 2025 11:53:33 +0800
From: kernel test robot <lkp@intel.com>
To: <aubrey.li@linux.intel.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [anolis-intel-cloud:devel-6.6 49/49] kernel/dma/phytium/pswiotlb.c:
 linux/ctype.h is included more than once.
Message-ID: <aDfaPTeQKP60rKEE@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0163.apcprd04.prod.outlook.com (2603:1096:4::25)
 To PH0PR11MB5674.namprd11.prod.outlook.com (2603:10b6:510:ec::10)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5674:EE_|LV3PR11MB8726:EE_
X-MS-Office365-Filtering-Correlation-Id: c75e3144-c5eb-4920-68b3-08dd9e646633
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3uPZbJbPsfdRgudrRoMqewRKuU2EjeVGXIkp+JxX/Bk3Z09Vn86XuSrOX5Eu?=
 =?us-ascii?Q?mwsUMemqWb9+PGlz0gHPc+TunhDy6zsUZfd00dFcD+eboFRweLoubIpsmD6J?=
 =?us-ascii?Q?iHHiCmLAQmbHp1fPaWfqGPdl3FJLdm8jDlgH5CMSW8cLQk1S95jcE2N5pySj?=
 =?us-ascii?Q?VgpB+Ab8V5Gz/CklgcIQrNbefnK9Ig/BsR1bm9j1tVu9al2NhchokoFDs+On?=
 =?us-ascii?Q?Fogsf63xDGixXK+kiumvodnxYFbzkXyu3BqDAku29Kv0ROmAbLJaqkNe8Iwm?=
 =?us-ascii?Q?XNmjF8kZKxYdu5D/I4C7XuUKaKUTf+l/gZ9IwDmHG1u86dAT9z9yZ6JrSA1o?=
 =?us-ascii?Q?/3AQ7zdIiBo/Y7wW4320yx4qP7Gm77RfSPPkepCTaB4VIuglKeYN94WAwkdG?=
 =?us-ascii?Q?vAv2eDsQqTjocEmQYUSifdMjXXyE8zuOzciKqcl9Jc1++hDsF0nMQTkyNhTw?=
 =?us-ascii?Q?ZUy+zV1fjALtVnwGoyNEN/FJK9R6hPDkm7O+xEbjoKYMRExgnbLZc7I0MA2r?=
 =?us-ascii?Q?0/EMl+8C9pkyc3huPlFu1UH92AThwkd6rrY+WVndZSvtz2YiyXE9NiNRbHHu?=
 =?us-ascii?Q?QlfEnJvV8SsPpsMLpMC6MLjjIUMuViDQTK5wHyF8uAtyGZcXguX7RiJG5FG+?=
 =?us-ascii?Q?5o0Nq8mNgju3Pn3iEorOVnXSFhCuI2NA+Tjx/eIrugZsYixbKLd/h5ex9Xat?=
 =?us-ascii?Q?id/25dRHM0YcOS5+9jHMnMPWYqNeoDUOcpt3k1uqug9O2rcsSrW4V5CQf0Vd?=
 =?us-ascii?Q?6hj81W0te2kMANM4uWCt1BuyKMzXeTzOMQGFKO1OmIcadKxxoeqFce7JAT0Y?=
 =?us-ascii?Q?msGSVLG2QApD5tAAHYMEYfBmJb9+xYEVOOuHjx/5S+keetXyp1mdtqKVmsrz?=
 =?us-ascii?Q?MsyP8YosJmNqintzxxkRzy/p/bXYCjsBlGEcFgMEI3137hKYF6GT5PVTl4aS?=
 =?us-ascii?Q?wALzeUiitxATXGvfN1dVSNA1GUMVqY/1/DxIzP3HU24KbQ4fNO4hZbAWwSAq?=
 =?us-ascii?Q?niHW1OJ8Z21+ztz5UAkoVACpf+6h2p5ANR8f+aoDaFpibClzhpLdyLaTxr7v?=
 =?us-ascii?Q?w9E+ESYLBCcoarlTHaEJKgURHsM1MYK7Nq0NdWW8ia71eKkUqPK4Sp3yt2be?=
 =?us-ascii?Q?BZL8JvNOey20T2N9ltWT3gWBydIN8Domqr037OnjFccSSFqj5iOu8NWfNS7h?=
 =?us-ascii?Q?4i5gr0dZn4i8PF7uWPF6/ywALukBKMC1IwwN2wURN8BwYmKr3kWGyWWGJ0xb?=
 =?us-ascii?Q?sdXGmHv8l/rjO47ZZoydkLAmI+YyNwaLx+iX2VXux6pnGFdt4Oxzo7CSRBgM?=
 =?us-ascii?Q?RaPSgj/lMisOM4XdAIPvmf5V4lnzu+UWlqBTfxnp9FnIrKdfWX6x5KOz1O72?=
 =?us-ascii?Q?kxFiQ35d/6Xao0kmzhR3eTr69XiY?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5674.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tTtocuFQGDTFVoWqV8w6bKtgFORvqXh/jsNUh4HZVtSqW8UaDb/aaexcQwjh?=
 =?us-ascii?Q?nbf6C2x0YDyhFh9Zwpoul8xA4WRLVZ259xTK4ptUinewmCmSwt3Pc37mr773?=
 =?us-ascii?Q?O2DQRN24AujkoBkQmo3fkAhw4WsnmjLNhgh7p8jQx3dpcKgez536U6NewrDk?=
 =?us-ascii?Q?OObeEh6gO5MIrcZVCtIa4RF56PgfNavw+XbhnSrURLWVvOFNiTbN6KZbuJDs?=
 =?us-ascii?Q?LKV45SjiofP35A4ZLLplSbyzN6KdbMRZNQwH2TeXNd+EC2pJWTOpbDe3MJ/A?=
 =?us-ascii?Q?MUp7H+kl2gbR3a/X5ap94v5INJFjeiCwSU0Eo4K8g1WZLVMYErWSwEXav2Yg?=
 =?us-ascii?Q?Ez8tEEQJ0p8A295y3Nh7hZ+CECF//8uUSHTgXUvl6iSCOVuK3kPxHaaBhw4K?=
 =?us-ascii?Q?rCclhXPp/BblI2ZJslb2Sy8XBD5Z3vopHbeW7iOVjy1Polg4X7UbAvsgjSYu?=
 =?us-ascii?Q?Cpz4BpAg+A4amktXQvQSIjhfbBGmGFTUDvvRDxIVH5rORXqoJ6ObKHM2ilc6?=
 =?us-ascii?Q?Yr9kAJbJaSiN+JexcJavKAL7QRZKTz96MTsmyIh317zc1FrrAoMlRHfCf4by?=
 =?us-ascii?Q?hoe8AW94xEWBDcLPSNY6p/EOxc90XJYlerYK3H/o7mo64zLUSCyY8Z59piof?=
 =?us-ascii?Q?Lk/2R9YFZqh/caH3KxwK5KdBUnDs7OGB3ePCnyqYGBXWWafN9cmEuAdjSYHl?=
 =?us-ascii?Q?A5s0Agq2kvanL7u3YMcVGexvNCa2yvZcJqD+OzElTucSD0RTkzNbT7sDcvN4?=
 =?us-ascii?Q?R8/AZodGOPV7CHc6V3uxi/5TrMapUyJyicuIifZjCrYSJrduZBrELiyObIfS?=
 =?us-ascii?Q?cd8eySzHxq1q+Mw14k/EiqPp9+eeftktdZzO/xiDH4MJZ+Z/gaGXVTZrhHyJ?=
 =?us-ascii?Q?QNDkx0Ve5wn4jyHFWwRpoeUH5KEZ1KKjIYXomPLullAhfpcKlRUQttaXT4Cu?=
 =?us-ascii?Q?M7y+Qp3bbz1kMBTZUtosEDP3+JVdscxOl1Hf8GJxcrkpQKOt65cH+5aYU95u?=
 =?us-ascii?Q?ispZCzF5wVw7H9aNIMPHE1zxaEAq/5TUJCR0qYW5vVZPTdVe39iW9eUsjJp6?=
 =?us-ascii?Q?Exy+O+WkLfhPGGzgLihjVH4GzkEC1j+bRZf0icdbdRa7X2LJjFGUCgZP7n4G?=
 =?us-ascii?Q?Ce8iHBFsXxnXEJ9arj7PJw5v4t3h21MyA6pyYI7lCWx1KWcQaqjOmuQDaY58?=
 =?us-ascii?Q?+/2/U3X+P6zTg1I8BX+xwqiaYj7MzyjsRZ+WAhZeP3PPu79IbnHtIMiyh228?=
 =?us-ascii?Q?IC8Kzr4mNZnoKxSU7mVrFZdSReaXQbyf1PyV2VinZQ4xVwBXonqJsvzi0OVi?=
 =?us-ascii?Q?4A/mMSd+tdWL7IbFHTPawraJ0UeCY1VP2oDfMtAN7ey96dohEhox1BgH9gZP?=
 =?us-ascii?Q?WIP5Ox1gLQAln/1DRjaYJuH9DoY9eoWhWCtyBIsdlhmp9EXiAqPwIySiE/0I?=
 =?us-ascii?Q?E6YTL+m+1fbAkZw8jIufPupUrq5DfI+lKzY75GKJAvAKmZgEH9VkpJLOI+ac?=
 =?us-ascii?Q?EFT7N+DcWI96i6o0rtuudydP21hLezIjBxIRMWuRvFLvZjscLo8GAlPfvfU5?=
 =?us-ascii?Q?1Gk3llnt9LSUPNAvTUOdoA+OqxBw64/NbjrADRiC0LIesfAmZ5uDRlVmLA20?=
 =?us-ascii?Q?Zg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c75e3144-c5eb-4920-68b3-08dd9e646633
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5674.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2025 03:53:40.8947
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: grFJyrTQXHair6PKpZqbCYByLIFCWw9zjm9GwumHxykcSXKnVg1dqSleXSqBejqLHHm3BKb8+Dsn9AzTEY3cjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8726
X-OriginatorOrg: intel.com

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   62cee0c43e18567eba021417ea42175a25b1132a
commit: 985517480ea330869ed27510db7af06a07cc8846 [49/49] anolis: phytium: pswiotlb: Add PSWIOTLB mechanism to improve DMA performance
:::::: branch date: 17 hours ago
:::::: commit date: 17 hours ago
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505291009.s6LU2LD4-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> kernel/dma/phytium/pswiotlb.c: linux/ctype.h is included more than once.
>> kernel/dma/phytium/pswiotlb.c: linux/io.h is included more than once.
>> kernel/dma/phytium/pswiotlb.c: linux/set_memory.h is included more than once.
>> kernel/dma/phytium/pswiotlb.c: linux/scatterlist.h is included more than once.
>> kernel/dma/phytium/pswiotlb.c: linux/gfp.h is included more than once.
>> kernel/dma/phytium/pswiotlb.c: linux/highmem.h is included more than once.
>> kernel/dma/phytium/pswiotlb.c: linux/debugfs.h is included more than once.
>> kernel/dma/phytium/pswiotlb.c: linux/pfn.h is included more than once.
--
>> kernel/dma/phytium/pswiotlb-iommu.c: linux/crash_dump.h is included more than once.

vim +11 kernel/dma/phytium/pswiotlb.c

     9	
    10	#include <linux/cache.h>
  > 11	#include <linux/ctype.h>
    12	#include <linux/debugfs.h>
    13	#include <linux/dma-direct.h>
    14	#include <linux/dma-map-ops.h>
    15	#include <linux/mm.h>
    16	#include <linux/export.h>
    17	#include <linux/gfp.h>
    18	#include <linux/highmem.h>
    19	#include <linux/io.h>
    20	#include <linux/iommu-helper.h>
    21	#include <linux/init.h>
    22	#include <linux/memblock.h>
    23	#include <linux/pfn.h>
    24	#include <linux/rculist.h>
    25	#include <linux/scatterlist.h>
    26	#include <linux/set_memory.h>
    27	#include <linux/spinlock.h>
    28	#include <linux/string.h>
    29	#include <linux/pswiotlb.h>
    30	#include <linux/pfn.h>
    31	#include <linux/types.h>
  > 32	#include <linux/ctype.h>
    33	#include <linux/highmem.h>
    34	#include <linux/gfp.h>
    35	#include <linux/scatterlist.h>
    36	#include <linux/mem_encrypt.h>
    37	#include <linux/set_memory.h>
    38	#ifdef CONFIG_DEBUG_FS
    39	#include <linux/debugfs.h>
    40	#endif
    41	#ifdef CONFIG_DMA_RESTRICTED_POOL
    42	#include <linux/io.h>
    43	#include <linux/of.h>
    44	#include <linux/of_fdt.h>
    45	#include <linux/of_reserved_mem.h>
    46	#include <linux/slab.h>
    47	#endif
    48	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

