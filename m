Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D5F22BE059
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Dec 2025 12:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764763992; cv=fail; b=Syi/YFfhrQA1/ZHVuPphW0QovCBh1Wfy8wqNFJFScsuYG4Ee4t/NpxyQsid0VStCPwp8/Mds2Q65mnfCKfktB9WA9w3Y3KXwxbXRLxF6csuuL7kzKdr93wVxnNqiOulsgo6hpNQJIlZpHEMI/7KBbZcGLhvOIuHJqpxA2ZQEtqA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764763992; c=relaxed/simple;
	bh=Cv6OdL3r2aGKmDEn6BljNCq7zjjq/Iw50gTvP7Pij8A=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=S6N25sAucVksjuUKbFUy4FifH71Hjupsne/yL5poxZnWWHKkcoDi/iPzBCO4amjGk9PYcGx/k+v8nVa7SnMfeOdNuHUM8Y69W/kpcKNxilF9hXLqQD9PMgF8aZEH4rDqqPFJSrewkqwmsHqEUkgfOaSZBHdBuBRnWZwCYkN6Y50=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JDImLMMy; arc=fail smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JDImLMMy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764763991; x=1796299991;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Cv6OdL3r2aGKmDEn6BljNCq7zjjq/Iw50gTvP7Pij8A=;
  b=JDImLMMykMZ/dCKG5fIG8IoIpt/pyjA/AW5OsGvnAeViut9gYtBpg8Cg
   d3HJpsD752kdX4HNifYX+EBBUfLMHorpijC8U4SF2Cv7t3pKcJj1aWTWo
   v/G8PFN8qCzQfhAKym0c/zI++Vc9MJbD7DfycotXCJOtxabZ1DjIiuU/p
   mLcQLPkdzwfgmUN8FvMKBSUjNrDB8YnmXwBJ18jnYMVjAosiSeRw90lgS
   tldmIYW53f6zEigMxDL+UJ9R0jtl86o724WdJ5VYnjwm4wnl7frtFjWyS
   78E1KJLjoImU0JeVo2MzJj1Dqb8euZaH7dcLIx4Qwfs4GKXdC8bgnO7qE
   A==;
X-CSE-ConnectionGUID: 1b3yiC7gRAmt6EYPIaD4Pg==
X-CSE-MsgGUID: N/MGqlWyQnKIoTIQGWJdnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="66714890"
X-IronPort-AV: E=Sophos;i="6.20,245,1758610800"; 
   d="scan'208";a="66714890"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2025 04:13:10 -0800
X-CSE-ConnectionGUID: 2rFKGXQTRXyhL8y74cP1vg==
X-CSE-MsgGUID: hqrFrG+hSsqJdosx2TUdUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,245,1758610800"; 
   d="scan'208";a="199139526"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2025 04:13:10 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 3 Dec 2025 04:13:09 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 3 Dec 2025 04:13:09 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.56) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 3 Dec 2025 04:13:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v6HeeUIx+Ip02NX21rkNCiJx7+vpWlP7td39mBZt2fTDTPZ/1wILWm/fHTlae1/abdTsEmcLM6PNTiY3jFYafEYGIweEgNqDlgVELDTsk8dvqarXpUyZ1WFXdd6TLX9wIuq0nrtneG1UzuYSPDcm814t+DXB7tMXpD9NQWcNyniEi4SdohNr/aB5eN2SVTe9vtMDkZkBQuhJ+ayPBkyZNGyCcQvocJmmy8LD5SyIff5b7vedDcqXG8NYjoJL0kQ0i7aC7YVvyJjChcHkJjXjH+ZM2SK5y7Bnh5E3prLlZjwoLsjZdzr2Ibi4bn7dKsqeRl4A7UMdsviqan7OSwZZlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k1UwXMfp531u2zgNxscuzx+twvwQbQQINr7UEVGqrkU=;
 b=ltcv7CubqS6cazMGKYnobjmETTytvFrFOUXWMnDpgcZy4OQuecC5xYeOy3dYI17oet27i+fYXRj7ex+zZy4wTiNUFWywCmcEwkLcz9Zs4+E/X3jo9Okfe0J8O06YPyXj+NbKL0dT/t26ZfqdhE8wlM9roncoOFVzVOCWSrQlrMTRsEbAWUXsQGXvtIwcbDA9R/mGRLHFfSrxXQDIrn1Tluar6Oer6XDTj8xmzRynSNAgVTk8KdfqVJ3MR5o5ljZG+cnBWIKbXth46cHSfHbC4FLQY3jmCmI8I1Hf1YpQ+xGq/3LZr4tigeFrWXh+ZCspiezN9Ku/xsVeFBEJCsEejg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
 by SA2PR11MB4953.namprd11.prod.outlook.com (2603:10b6:806:117::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Wed, 3 Dec
 2025 12:13:06 +0000
Received: from MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9]) by MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9%5]) with mapi id 15.20.9366.012; Wed, 3 Dec 2025
 12:13:06 +0000
Date: Wed, 3 Dec 2025 20:12:58 +0800
From: kernel test robot <lkp@intel.com>
To: Amery Hung <ameryhung@gmail.com>
CC: <oe-kbuild-all@lists.linux.dev>, Tejun Heo <tj@kernel.org>
Subject: [tj-sched-ext:scx-sub-sched-prototype 49/99]
 kernel/bpf/bpf_struct_ops.c:1477:65: error: implicit declaration of function
 'bpf_rcu_lock_held'; did you mean 'rcu_read_lock_held'?
Message-ID: <aTApShhi/TblayHz@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0155.apcprd04.prod.outlook.com (2603:1096:4::17)
 To MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB5963:EE_|SA2PR11MB4953:EE_
X-MS-Office365-Filtering-Correlation-Id: 5fccd8d7-3538-4ed0-5cb7-08de326550fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?i6hu6TDFPCU5d+eLix47iQmBQuE8qsJZlM6nzj9KUCS2vZ2nAbmqDcT6DiZK?=
 =?us-ascii?Q?vzJwZWXdHPbHlGS35x5YDCBUxf7cuMg/Sr1MeWmYFZqIZEHhr5HbksndkNqw?=
 =?us-ascii?Q?jHhptiOKkkxCkJXYu6U3l+0gLuwTKEHVTOi5FZyizoJjcCIS4c0DQDX+5mvO?=
 =?us-ascii?Q?nz0biDnTvONQArJgJ+dZZstVdCP/oPB5vk6qElQyzUoi0/lbn3ogxGpXPOol?=
 =?us-ascii?Q?mbb/Zjf+4D/pHIeP+E4R9voIWigapd2FUTw4HYkXR4TSJrBeTj/JKy1PgMvg?=
 =?us-ascii?Q?TF67ESp0t+eZjxs2rsuH7508RgovGY92K5R2DUjEixGQl/F0ShgKunUvk8fY?=
 =?us-ascii?Q?VKQDmZ6tYYMQeJigU6Mfbl8fSWpRWhCgVtirtKuHG4pfmWjKg6A3/LDAHIp9?=
 =?us-ascii?Q?1CZbua1j+TAjMBdUhqsZUzRi8xGikuLBtIIUTmKcEPxUx6uGuNL4vdZfBy0E?=
 =?us-ascii?Q?G72NJ5dbJMl4XFM5BxVNMF4JGXyKZ8PI43xS/5wbPkBjse9HgPtJNK7gjzpW?=
 =?us-ascii?Q?QDvXnX5aGZbZHphs1CktxvAadzZp1e9nYaRv3nAvhj5F2zBVF8KfyZX7MrnC?=
 =?us-ascii?Q?73th/isIdaLvfb0YzX07qedNGgQyIBgFYwP5iQs5dq81kQPbfcZJQCr1dosB?=
 =?us-ascii?Q?RoqLa49kFv+i92sZVYoWpRK0i49AIm/s7j9jrTYbzFCHIuCjy3GhcFzCTueK?=
 =?us-ascii?Q?7wfaN9N09rwqbzFr29e/EwBCI08VsgBU5JZJlpJIZnZ39G0nih90iOsQPsUs?=
 =?us-ascii?Q?VE1db4IaFFXlqzzQhBMkugwTf4y3YSPMqKAi/2Fsz7SRQ7ZeFlLauLcwc3eN?=
 =?us-ascii?Q?n3Z/p9TphaQBDl8vX47aj6SuZ6VecSbFObM2Y2PHSUNQgcUu5aRu1ydZQ1YY?=
 =?us-ascii?Q?c47Ql2P0zOOJS7t92jBB5SNkqPiydtsmKWyjyMUQhVWz6ngIddHS3krYIsIT?=
 =?us-ascii?Q?K/fe1LBl0gsc85wFtGoQs0Ederx990PD3P2xJpOerUHTRMTxp5FwXe+5aQQe?=
 =?us-ascii?Q?MoQ5tuqkfK3hDJSZ6sBAoBleHtQBzqCKQfxF5GNXR5LdBWTjXKXfeYikUyab?=
 =?us-ascii?Q?iKQemNyCawJnWS1PvRg3vIHCy/4Yru2AtQ3DyYVfT+459H/bvyAXqDrkYChe?=
 =?us-ascii?Q?yocf/smlhl/rLiiElTX21cJqLhVyd9CjcAb+iG5OT63PexymD4ystdkciuCp?=
 =?us-ascii?Q?UAS+DtqtnzqqKP9zvrqxD8X/TtPmuykm5dql+DIm4fX44jgmjRD4Cd2GnA3Q?=
 =?us-ascii?Q?hxswd3Gwc94e3CaCApnX42PPdsgHFS405a4qx+IJKuLy+l7k1xq0rhxDgHOH?=
 =?us-ascii?Q?KHy2CXAhWx7WFmVo4vDIn0+QTftFTGyHrmK7x3Pmm8S3Wv7bKU4tMpCDvniO?=
 =?us-ascii?Q?eA0DyZ2HYlmC8Ob+tK6WjaXm0LCbGcrT99ef8uilx7lSSevDHykUwstSWIx6?=
 =?us-ascii?Q?9NzSUjhIhD44osu4gMgRwv6NBtBp3OzO3j6+R6s4kdaTP/AMJhwByQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB5963.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zy+CVwp2bqN4lfGLbNCReqVLdhr+Mbl1gPTgW9T4Ff0jKyJyY6qlkeXj4ND3?=
 =?us-ascii?Q?sASOU9cgxwJNuMZGEggbhZpGv4rYVE0iK2RKhqXvGV9UMkIW0jeM9dK5ynFr?=
 =?us-ascii?Q?EryqomviZ+zYuRqB53SNGCWfvXsY3sZyPV4oA8LOqulU8Gnjz01xhcmVVzU5?=
 =?us-ascii?Q?IbUQoCNmSSJ3LLaPJkgSiuhHtFGDd9i3zq9bw07I58E3iTVHstB6lOchd72C?=
 =?us-ascii?Q?hgkybJTu3q2QnShK9iKVyWlDRzdU+NrDl1qUke434iY4BHAhM/fPqzM0DF8M?=
 =?us-ascii?Q?aiR5TohzGxbb82kjo1pH+Hk3imbQtz+g3BtA6+4q6Fe2zQJTgojAxkXsDqxQ?=
 =?us-ascii?Q?NIL+7Th3D0Q25AtannWWiiS6CWwQ3F/uHa6QiLQKT3/OmauXh8dKOKlMfrYS?=
 =?us-ascii?Q?GX2ba0LsAk/yIwmxDnxArxbD5vp/TqeOkqF/HW8OOBbsb+MnVUumwaiJIE1a?=
 =?us-ascii?Q?B5lt1nPYHz8qf0iSK5bcr1HB62x33/3HklRJwoJJ5I/bKTfFKSmRFpoJQhBt?=
 =?us-ascii?Q?ybkt2GHKe5hn7JXNsK5mWXn2Wo1Xy6u204V4cC75scJBuddc6tPbbDVSEMta?=
 =?us-ascii?Q?ZxEYL2kYHpvvSr1y7kbn/dk1z/nrKoQxSECAT1rh1m9aunLhqvnriGZaaafl?=
 =?us-ascii?Q?hwfqC9pR3fZPsCLN3aDO9NmPJyJXTtFL1fkh/V/l9HSGbmpev+fOEZSExqca?=
 =?us-ascii?Q?7thDMF2JGT31/GqOz/oH2eX5KlPpIYzi6OYx9RXzt4Qv2hIz27Rh6vxJzczu?=
 =?us-ascii?Q?yXj388zUmjALK83G4GEFrgc6RwPhS5RapaRlkRiG+ngL2BhgvSe4mythNcxl?=
 =?us-ascii?Q?u2+1DX3A6r6mCWV/iHz184oSytMw9+EGacYWNEfwoqVq7UcnrqdWWj/z7R2G?=
 =?us-ascii?Q?bnTP8sH5R2x9BAuotfAOEqJPpVT5BnSLoAGqg6nq6VzT9BDPGIS2iNo7jvdJ?=
 =?us-ascii?Q?vfqN7nq7f2YHTklepqlzL4Eulhu6HxeuRwuSiT7ds+FIHPgeG2qc308R0kKO?=
 =?us-ascii?Q?9adthlKU5cztTbmoCq4SaAgmBV/zxoEuFgRpgOq7Gv+BzdVfDXWmRuUmRUw4?=
 =?us-ascii?Q?0RtaMzuYC0BE6IK5kJElHOafwqeheTRCAAxAK72NBewDTvvd80QITgp57X2s?=
 =?us-ascii?Q?mI65HX5UzLy2sdfeklmI6TNrJ5hYRl8QGjCC04OcbyQlpqUVTSrSGwvmdjNB?=
 =?us-ascii?Q?lXjxP4Lyi9J9Hbd4WrOkv5wCg0BJT4/t97hu6DnZwc0M03jj8+gBQbO3eqeQ?=
 =?us-ascii?Q?SZrvPqA2JDAqhreglCjR6dEjjxcOKmQVeFICPdpU3LAHb7jVAuaB0HTdk3q5?=
 =?us-ascii?Q?ftQiLxu5me4JRVMwIKyOLn2Wn4p7DVp7Y3GKQG47VdIrz9vMziDjK5IgE2O+?=
 =?us-ascii?Q?oR0hfBMNt7ubSLVKnXn+tKvQKZg3oq7jc/gbK8XDeI1guikCFyoyGIg3lZsm?=
 =?us-ascii?Q?F7dMAEGxucSsXIgLAmxdECria9shikio4XL62PVrhSU+i7wRQpMtHqtCrF+o?=
 =?us-ascii?Q?Sy3cDaKs1AmUJsOQIHzRZ4zPAUJCAkP9zB3BTUKt3i6aNj9ysKvbaU/cEFVV?=
 =?us-ascii?Q?3fFdzbjyd+m5vwpUwmDqPX1H17Pyp/YijJ7X8zLgGN0Tgsf1+QbGbBCnE5ZQ?=
 =?us-ascii?Q?Hw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fccd8d7-3538-4ed0-5cb7-08de326550fd
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB5963.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 12:13:06.8141
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IlGDMlSekS4SZiD0+vvO4/dtVXrFFvQeAqj9QuK75IBsePKa4KEJZVOb3hHHcB28FRB87O7r9uP+DwwEVmU0NA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4953
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tj/sched_ext.git scx-sub-sched-prototype
head:   93d5a72c3150d61036a2bbc86f63bdf9c17726f5
commit: 1bbeaff20b6bb44d9abc8d0a10b354f7bb7f8ec6 [49/99] bpf: Support associating BPF program with struct_ops
config: riscv-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251203/202512031625.HjO9aNHu-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251203/202512031625.HjO9aNHu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512031625.HjO9aNHu-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from ./include/linux/workqueue.h:17,
                    from ./include/linux/bpf.h:11,
                    from kernel/bpf/bpf_struct_ops.c:4:
   kernel/bpf/bpf_struct_ops.c: In function 'bpf_prog_get_assoc_struct_ops':
>> kernel/bpf/bpf_struct_ops.c:1477:65: error: implicit declaration of function 'bpf_rcu_lock_held'; did you mean 'rcu_read_lock_held'? [-Wimplicit-function-declaration]
    1477 |         st_ops_assoc = rcu_dereference_check(aux->st_ops_assoc, bpf_rcu_lock_held());
         |                                                                 ^~~~~~~~~~~~~~~~~
   ./include/linux/rcupdate.h:399:53: note: in definition of macro 'RCU_LOCKDEP_WARN'
     399 |                 if (debug_lockdep_rcu_enabled() && (c) &&               \
         |                                                     ^
   ./include/linux/rcupdate.h:680:9: note: in expansion of macro '__rcu_dereference_check'
     680 |         __rcu_dereference_check((p), __UNIQUE_ID(rcu), \
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/bpf_struct_ops.c:1477:24: note: in expansion of macro 'rcu_dereference_check'
    1477 |         st_ops_assoc = rcu_dereference_check(aux->st_ops_assoc, bpf_rcu_lock_held());
         |                        ^~~~~~~~~~~~~~~~~~~~~


vim +1477 kernel/bpf/bpf_struct_ops.c

1bbeaff20b6bb4 Amery Hung 2025-11-14  1462  
1bbeaff20b6bb4 Amery Hung 2025-11-14  1463  /*
1bbeaff20b6bb4 Amery Hung 2025-11-14  1464   * Get a reference to the struct_ops struct (i.e., kdata) associated with a
1bbeaff20b6bb4 Amery Hung 2025-11-14  1465   * program. Should only be called in BPF program context (e.g., in a kfunc).
1bbeaff20b6bb4 Amery Hung 2025-11-14  1466   *
1bbeaff20b6bb4 Amery Hung 2025-11-14  1467   * If the returned pointer is not NULL, it must points to a valid and
1bbeaff20b6bb4 Amery Hung 2025-11-14  1468   * initialized struct_ops. The struct_ops may or may not be attached.
1bbeaff20b6bb4 Amery Hung 2025-11-14  1469   * Kernel struct_ops implementers are responsible for tracking and checking
1bbeaff20b6bb4 Amery Hung 2025-11-14  1470   * the state of the struct_ops if the use case requires an attached struct_ops.
1bbeaff20b6bb4 Amery Hung 2025-11-14  1471   */
1bbeaff20b6bb4 Amery Hung 2025-11-14  1472  void *bpf_prog_get_assoc_struct_ops(const struct bpf_prog_aux *aux)
1bbeaff20b6bb4 Amery Hung 2025-11-14  1473  {
1bbeaff20b6bb4 Amery Hung 2025-11-14  1474  	struct bpf_struct_ops_map *st_map;
1bbeaff20b6bb4 Amery Hung 2025-11-14  1475  	struct bpf_map *st_ops_assoc;
1bbeaff20b6bb4 Amery Hung 2025-11-14  1476  
1bbeaff20b6bb4 Amery Hung 2025-11-14 @1477  	st_ops_assoc = rcu_dereference_check(aux->st_ops_assoc, bpf_rcu_lock_held());
1bbeaff20b6bb4 Amery Hung 2025-11-14  1478  	if (!st_ops_assoc || st_ops_assoc == BPF_PTR_POISON)
1bbeaff20b6bb4 Amery Hung 2025-11-14  1479  		return NULL;
1bbeaff20b6bb4 Amery Hung 2025-11-14  1480  
1bbeaff20b6bb4 Amery Hung 2025-11-14  1481  	st_map = (struct bpf_struct_ops_map *)st_ops_assoc;
1bbeaff20b6bb4 Amery Hung 2025-11-14  1482  	if (smp_load_acquire(&st_map->kvalue.common.state) == BPF_STRUCT_OPS_STATE_INIT)
1bbeaff20b6bb4 Amery Hung 2025-11-14  1483  		return NULL;
1bbeaff20b6bb4 Amery Hung 2025-11-14  1484  
1bbeaff20b6bb4 Amery Hung 2025-11-14  1485  	return &st_map->kvalue.data;
1bbeaff20b6bb4 Amery Hung 2025-11-14  1486  }
1bbeaff20b6bb4 Amery Hung 2025-11-14  1487  EXPORT_SYMBOL_GPL(bpf_prog_get_assoc_struct_ops);
1bbeaff20b6bb4 Amery Hung 2025-11-14  1488  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

