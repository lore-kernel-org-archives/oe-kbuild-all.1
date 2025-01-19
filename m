Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 398CFEEB5
	for <oe-kbuild-all@lists.linux.dev>; Sun, 19 Jan 2025 02:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737252608; cv=fail; b=LnpRid1+c4ERrMMl3PAT7+KTdEKGGa193LPXF8jr4gkCEnZjZzErZsdwI+B9Brcuu9mW787kH8gCcZlOZEHxDdj7PxrKw15Dhfhu/xpFGW6h0g3Ap2JSDfWlLJOEIKWu5586/ea7+oFaSHUUmGIfwQrYDTz+eK6kc41XYnKYI5U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737252608; c=relaxed/simple;
	bh=cT6EJvpWbCAPpxDnuh3eC0K/j2nsvH8icl9mGAnnhlc=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=J3DF4homqitJLBkf9FLfmScreQLH3lDFVUQIEVs+SzUl6sA+A8AaPQZ9NJh4HXK3Xj5dm96BYqBTpk4VGAyWTQv8bCOcwCXtw9Dpwz5KieNOxbdga+4+vByLoTbLVl+MVh4HeVixsG7B8PUvtTbpcdwpJ+fniSAJ9WIgkdcQgAw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dVuVNFmk; arc=fail smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dVuVNFmk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737252606; x=1768788606;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=cT6EJvpWbCAPpxDnuh3eC0K/j2nsvH8icl9mGAnnhlc=;
  b=dVuVNFmktk93c5+t4MZ50CmHbHL1SSL32atPANkccOl9Xd9pmQ+ngSsv
   YMhtymaB7pTMHhWuTDAGqTZjG+rITbCe0wU/V/mb806x3riowvQYl+OQH
   /txyZ8m7I+FyHHD+fLevGlWGW36Kxo96eLujzUl8S77K6N83t0Z1MzIvt
   iXrdqSvCY1136m2yp6fQkWL8pNdx0ZlIk7QxRwsgUSVGBPPUg4WypBTHZ
   LaeDgjW8bfg0b76G7UT0alFr/FTSROwARzW8WcaTC3RU5eLfm3BvW606H
   w+rcTsz3gZrJ+ZNM/fw+TkfyVsoqM2i2bFaAEJng/lBUZSWuYgfwnyY8S
   w==;
X-CSE-ConnectionGUID: PPYUCst+RRankwRK7woi1g==
X-CSE-MsgGUID: cRkjT38dRMuFw9ldHazDBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11319"; a="36868510"
X-IronPort-AV: E=Sophos;i="6.13,216,1732608000"; 
   d="scan'208";a="36868510"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2025 18:10:05 -0800
X-CSE-ConnectionGUID: vMdWBPYLQ3KGpjnNCkVf/w==
X-CSE-MsgGUID: M3TqEKoqRFu4vnHC/Z93XA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="105994022"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 18 Jan 2025 18:10:05 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Sat, 18 Jan 2025 18:10:04 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Sat, 18 Jan 2025 18:10:04 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sat, 18 Jan 2025 18:10:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x1NIbVY2Qy3aAZ/U85dGAzywFE336ee8jjQn8m1vC58/wsXHPK3MW10A6opT2I4GDh2WSZA6j/H9kbfaP+p1nhGEXCuJOTFAd8H2rNkGvH6u2dsy2J4eX8XbZw9/XGkZUf+/BPjNqxI08PaS0pLPtE0VBZ4U2UCZPGXV88eiB8ktUIUXhzt6aZ6wMdI8A00MXmBmayyYaOr1zqISMrvNBq0m+Qd9kstn3gp6V4MOg8vHZtQ27yy7+pDi6NjB6b8mb2lkGiH+AtfULYbi0nNAvTWAypUGskBiyz05FKa1b2EJ3DTV9cXeuBk+OHZhQcP94K20eqUPnkolFYCvDAbAEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d4gohIQox8Bw4a60Knur3gaXobqg7yeXiboZHEiRLfo=;
 b=obIe3Hov1BcPfC31mVcRjbtFNWcoBDqZKeWLja8ol8oVOVFRPLC6JPX4OreSqHFQgdvWQlmyydmPeS9eMloTTOaWkjUQuHJK3X1bUmo0VAUGOi12cfn8X/GDRc6FzE6oIMysbnNofrxenxXnpW8wa3w044qlo0qllJJ4//WS6b+UaU7zQEqoBcSJbhAsTn/qZ3a39dZGQQHncxBsBUhUJd4SL55xi9EeX7cKwjQGTw8O6AXyffPuss+6MZjr7n1wYlp7P10cN17s/sttmXRv/gIK5fcgvBKzkdjaT9+qwGtLGbRKumgkRq5/3I7OUVbQxYtKggQSau6KU6vrq8AWHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5420.namprd11.prod.outlook.com (2603:10b6:408:101::6)
 by MN2PR11MB4743.namprd11.prod.outlook.com (2603:10b6:208:260::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.14; Sun, 19 Jan
 2025 02:10:00 +0000
Received: from BN9PR11MB5420.namprd11.prod.outlook.com
 ([fe80::7a2d:5b5d:f9ce:594f]) by BN9PR11MB5420.namprd11.prod.outlook.com
 ([fe80::7a2d:5b5d:f9ce:594f%2]) with mapi id 15.20.8356.017; Sun, 19 Jan 2025
 02:10:00 +0000
Date: Sun, 19 Jan 2025 10:09:46 +0800
From: Philip Li <philip.li@intel.com>
To: kernel test robot <lkp@intel.com>
CC: Daniel Borkmann <daniel@iogearbox.net>, <oe-kbuild-all@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, Paolo Abeni <pabeni@redhat.com>
Subject: Re: WARNING: modpost: suppressed 893 unresolved symbol warnings
 because there were too many)
Message-ID: <Z4xe6lHHBdIbyw5d@rli9-mobl>
References: <202501190925.XFbB7nGq-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <202501190925.XFbB7nGq-lkp@intel.com>
X-ClientProxiedBy: SG2PR04CA0171.apcprd04.prod.outlook.com (2603:1096:4::33)
 To BN9PR11MB5420.namprd11.prod.outlook.com (2603:10b6:408:101::6)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5420:EE_|MN2PR11MB4743:EE_
X-MS-Office365-Filtering-Correlation-Id: e2aa1ad6-f89e-4f69-da4e-08dd382e60e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?WdepVZb9aFWMoUTL1aoxvIa6ZiDolxWGE3PquXQFFUaxXJaL2n+Vx/jgFMP6?=
 =?us-ascii?Q?LVo3VmclMTB3s2uPHyUeTpQYcLI8X4uSLdFPVNLYGe2ZXt+gLlaff9U2CpBO?=
 =?us-ascii?Q?qNVCsQHPPetP003HKmZtkP7WtMpUzD8qxfnz6+QjtTDaXmjSBtftIxvC8z9n?=
 =?us-ascii?Q?38R6EjkjbAhVl9gIdNGCsYNmpU40G2q76+b7EZJQk2rSVP+TnDhBcHYGorz9?=
 =?us-ascii?Q?XV2HBPUiNRm+I4700LjrjDeJMFMDzKBa1YVLMQVuOYODfpny6kxdZvzHTous?=
 =?us-ascii?Q?xyAgs8+3iA2JY5o1NSvb8O1aB4u9jEDq/iDbPoRkhCvIlJkKR/eQ9zV+J7HP?=
 =?us-ascii?Q?ExIfnekB+jre5blBgcQ2gTGXDi07xv/Jt4EJitzeQy+0XyZACDeNigOeFPIL?=
 =?us-ascii?Q?cOpszutAD3SUwIEk+zCOn0+ASBI5bi1FcaGrO/fEPD2Wq1vzDLoyVaGitwh+?=
 =?us-ascii?Q?yDm59UZtPob2dKtXR0Gi+WJHDSobFUTvSC5/aj81sR35Z3lRs2+FjrJKAtdf?=
 =?us-ascii?Q?gIpxV9liy7LJ+93vlr9CyxNuzhXivDeezieTgajK0718Ut2hqPVNAbWlOZFI?=
 =?us-ascii?Q?ChMxZTRBeHzF8LYf7jazAtU5eSBgB6CWD2clsJzbeNULe7wZ/1R9lpFohEF8?=
 =?us-ascii?Q?jmV8+SEu+pRSKRiNGpHyiqkztxze6woz2AALr1IHUiaAqpZk7qy1jUH0Flbd?=
 =?us-ascii?Q?vU/ErQ3oR5rvtVjoIINVKCOp7SXs+B/beJdUO4PevuiiZY2DSWMR55wqxhEU?=
 =?us-ascii?Q?jAlNLQAyHddtMnZtaBb0fPZu47NeroUWS34PbDI2YbR7kIjGCIEZwVW6vEXf?=
 =?us-ascii?Q?xgAySU/DdUbIpNc3eUJY2IS0x0nShZVkkKUz5VukRTRzNa9FwITFx9SOzoxh?=
 =?us-ascii?Q?0vOQhA0Bbz0IxpfXo0/2zBRC3zJ9/2ekI79Nz8lPYZMw7fZTNlaZeG5Zeslv?=
 =?us-ascii?Q?6yy6MF1kr1Yv9urN0OSEiufmGBDcXcWbY1L8EaFt3zOIeVlJhr1tzbOTMrup?=
 =?us-ascii?Q?Fc0ymwoDv+cjVTpDvAtk/2Ol8BRhUEiJO2+VlFdY1g12oixLm78HHtEgZSoU?=
 =?us-ascii?Q?tqoTSo6OUhJMZYgeUgn8QO6M2eFX0qAs9+CVOKP0sNyx/vxKjuZWnop1DPMx?=
 =?us-ascii?Q?AYyRdLSOS+aCWgv4pQtCCx1GGXRowCQCVHt9rGBs5ajTWjMYV0CQZ8NzIBiX?=
 =?us-ascii?Q?D9gkR2XLfFb4tCzf/BUp7f0Lnh+3cOd8a/zmDyzQx7B+Pf9mm4sw2Rcv3G9S?=
 =?us-ascii?Q?tsBbWtlompoOPUXHUHQnEOfFROD5HrpkDk81VbuxBqIcO17Oda+X5RICEfAy?=
 =?us-ascii?Q?FozzAC6ycIIAtrVEzLcdiMjLdCTl2qEjt3ovOVV22Q5ZMw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5420.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?atfHyRTkNEBtsaerRppKJ4r3wiM8mDN3bQuGn4tic+RlmnAcVhlVYO7Gg6BX?=
 =?us-ascii?Q?OFjzKQYEdPczPeT2+j0Lw4ru3ij0pwND++ksVXP7x1sfKdF2VPcUeSatS718?=
 =?us-ascii?Q?f970wK6FX02zghVqrvK/LhjswfHL97q+cBnxE1ZoMRUbETgB9V5uLbIPMAal?=
 =?us-ascii?Q?G1dmQS/upY7sFTFGLh3/jIOoINq9vR/BAwN16pjIFgU7GDhB8LqR7yOD3aEB?=
 =?us-ascii?Q?uG88c80MH3ZWtJER7TRV8NeGb9WoUPDGpsuggCV4Wro7MVRDQ2Yje1lj6B5h?=
 =?us-ascii?Q?XoPCgDLJEDDrb2vSekpSQCe0z0F/ipklH6yHtUxjzbqN2iL389xv/xuYQaU5?=
 =?us-ascii?Q?4JVhdCr7chITJYcnk6+b2w7p/28s8LHgUpUeoQoAmchxpoiL7q5Nomvz4GfI?=
 =?us-ascii?Q?yXYOFsqnjlZtc9tESGLzIG+/tsRDvHDvFK7JPKZL77i0lf/Itzw3ifkQNbk8?=
 =?us-ascii?Q?CB6m5R7t16TCiC7iWrIQ7Zh4DV0zUNsZfHD8+ErQdrlkzvO/YwM+UWmJPGlj?=
 =?us-ascii?Q?ZOccCOzBpSkAdA3T2If6J8LGuprz1K5Rh7mj749/kYscMQksLMZazvU6F2ML?=
 =?us-ascii?Q?VP6uey9OhXEXyQgXTaANVDuPONl+AAUbcgK2AqPEMynrnOBYv9qVJrR9p2dm?=
 =?us-ascii?Q?Wsh+47seXWac3Ri+gqN2pmy8q8Wur+HXiL9kxief8kDMbVBz3h/aBYCMunBb?=
 =?us-ascii?Q?94PfNNQnUvmX464uBL8O5xiRyUBPD7mg5pjbL89+Hfo000+Kk3MQT6LiHUSj?=
 =?us-ascii?Q?k58uVqmYvHusLaTWyfRJkmCCMckgWVcb7mzw/zmvRksx2MPBgGr1ZgWjJipp?=
 =?us-ascii?Q?Y4Cd+Rvp9GmXAXpHyWoRIz0UJMJwOR2MKgxi127bjeKegNyh1XZVNJngLLev?=
 =?us-ascii?Q?PSDzVRxJRxoViivozFAvGVkteJTnq8hEjJSvs5+ytO7LRTsox7CXuloyT1vS?=
 =?us-ascii?Q?uo8CB/+LMz67UVmuGoI89etw4FQELFvwaq8NSP9NRcp5raMIHhBgh8Cke9LM?=
 =?us-ascii?Q?4XD7lEWTlkCd8VTEIwzSytts4hs5uwj/13upOFLRHfCq3d3rwgXYFf8MoV9C?=
 =?us-ascii?Q?LwyK6PMnWgDBpaDYuS9uuYMOr7upRUxvczww1Q4IV5q3Fg20vIvTQpxCj8Mq?=
 =?us-ascii?Q?G6LodpVMxfKTbm05VRX1tjuzKOPt6ZSxoSoYXqN6QaqOHgxNUG/aoK5uLS2a?=
 =?us-ascii?Q?1Ljs3Fad4lMee85uDjFrdWpDyWX86s/9Oo5wsqXX//YVqK65l2O6dO2fbUZX?=
 =?us-ascii?Q?SEGYFYL+szKPfhIhN/HBiG041Ql8/8SKt66KVrj9jVAAbuv3489LfmP9lfCt?=
 =?us-ascii?Q?AlBQxeEWnn777qJcZP36PzwQzGCNOoy5EiZc6p2/BNdsbQo5aQns+M3CtnI5?=
 =?us-ascii?Q?m7HLac1K/1FXreLZaFZ6DsuuZJq+3cRqKtIagiWfylFKofOEnA4k3kR/K0fe?=
 =?us-ascii?Q?5Ot+3wkwGYvh0fUwRSHd4IecXFSB4w2bxGdediFopnm1xNuWptLqgxU3jF+/?=
 =?us-ascii?Q?H7IFHtCBNHEBcQ0QEhb0pyoldP9Odq+Ph8d3y4TiEUojSIMWos1sm/xZifrL?=
 =?us-ascii?Q?mQWGdoL+cJsj3lzmWZyUvO2uImNMLVtyZJ3I39ec?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e2aa1ad6-f89e-4f69-da4e-08dd382e60e7
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5420.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2025 02:10:00.5130
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t9x8d793NvZjDfUeW/ni1EpdQBBP5nKKowsSGj5dgXEOQ6hT6maZBzQGcbn0/ln+/EdA5K4XwVZPBalnkEnTUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4743
X-OriginatorOrg: intel.com

On Sun, Jan 19, 2025 at 09:56:05AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   fda5e3f284002ea55dac1c98c1498d6dd684046e
> commit: 7b769adc2612b495d94a4b4537ffaa725861d763 Merge tag 'for-netdev' of https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next
> date:   6 months ago
> config: riscv-buildonly-randconfig-r006-20220918 (https://download.01.org/0day-ci/archive/20250119/202501190925.XFbB7nGq-lkp@intel.com/config)
> compiler: riscv32-linux-gcc (GCC) 12.4.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250119/202501190925.XFbB7nGq-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202501190925.XFbB7nGq-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>, old ones prefixed by <<):

Sorry, kindly ignore this report, this is not a valid warning.

> 
> WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_hexdump.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in lib/find_bit_benchmark.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in lib/cpumask_kunit.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_hash.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_ida.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_module.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_static_keys.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_static_key_base.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_printf.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_uuid.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_blackhole_dev.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_kprobes.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_ref_tracker.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in lib/atomic64_test.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in lib/checksum_kunit.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in lib/hashtable_test.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in lib/slub_kunit.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in lib/is_signed_type_kunit.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in lib/stackinit_kunit.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in lib/fortify_kunit.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in lib/siphash_kunit.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pinctrl/pinctrl-mcp23s08_i2c.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pinctrl/pinctrl-mcp23s08.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/clk-gate_test.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/clk-fractional-divider_test.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/regulator/da9121-regulator.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/regulator/tps6286x-regulator.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/tty/n_hdlc.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/tty/ttynull.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/iommu/iova.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/base/regmap/regmap-kunit.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/base/regmap/regmap-i2c.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/base/regmap/regmap-ram.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/base/regmap/regmap-raw-ram.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mfd/arizona.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mfd/rt4831.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mfd/qcom-pm8008.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/cdrom/cdrom.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/auxdisplay/hd44780_common.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/auxdisplay/line-display.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/input/matrix-keymap.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/input/vivaldi-fmap.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/input/tests/input_test.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mmc/core/pwrseq_sd8787.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-a4tech.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-apple.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-aureal.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-belkin.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-cherry.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-cypress.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-dr.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-emsff.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-elecom.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-ezkey.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-vivaldi-common.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-gyration.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-ite.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-keytouch.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-kye.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-lcpower.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-lenovo.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-mf.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-ortek.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-pl.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-petalynx.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-razer.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-redragon.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-saitek.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-semitek.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-sjoy.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-speedlink.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-steam.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-sunplus.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-gaff.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-topseed.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-twinhan.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-xinmo.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-zpff.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-zydacron.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-viewsonic.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/devfreq/governor_performance.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/counter/ftm-quaddec.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/vdpa/vdpa.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mtd/chips/cfi_util.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mtd/maps/map_funcs.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hwmon/corsair-cpro.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hwmon/mr75203.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/vhost/vringh.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/rpmsg/rpmsg_char.o
> ERROR: modpost: "strcat" [kernel/rcu/refscale.ko] undefined!
> ERROR: modpost: "__rwlock_init" [kernel/rcu/refscale.ko] undefined!
> ERROR: modpost: "single_open" [kernel/time/test_udelay.ko] undefined!
> ERROR: modpost: "ktime_get_ts64" [kernel/time/test_udelay.ko] undefined!
> ERROR: modpost: "__fat_fs_error" [fs/fat/msdos.ko] undefined!
> ERROR: modpost: "unregister_nls" [fs/nls/nls_cp737.ko] undefined!
> ERROR: modpost: "unregister_nls" [fs/nls/nls_cp775.ko] undefined!
> ERROR: modpost: "unregister_nls" [fs/nls/nls_cp855.ko] undefined!
> ERROR: modpost: "unregister_nls" [fs/nls/nls_cp864.ko] undefined!
> ERROR: modpost: "unregister_nls" [fs/nls/nls_cp866.ko] undefined!
> >> WARNING: modpost: suppressed 893 unresolved symbol warnings because there were too many)
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
> 
