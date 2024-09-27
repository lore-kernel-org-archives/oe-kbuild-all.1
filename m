Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8748CEC5
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Sep 2024 14:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727445680; cv=fail; b=RnHIee8a6iSpenElqJZwvrvpBd12rxN2zP1ufspEP7oJDKe0etVsqgRIzMJCoyk7IXzOJBHeNs9VfZERBNf3oNzE5/OGd7AYYyAFWNyYwDp2lg1lPy3syFT2HpUAUk8CXaIFSyo4l2FxxACT9aO/qP6+N6w+HHLtzRHWvnmP/YY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727445680; c=relaxed/simple;
	bh=4DtS1EWMZcs9yKh9FZK2UUCi3K/Jd07theDMiTbFbds=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=hvlz8jEWF8Zh6E5QgLBc+iueF47uoR9GOcLUk/KBRLNTodUQSzr+FOK1bI/pJFVzOefTzPEoG5kwGuZEPgeR63nPpWmf9FSXikk41IlR0kiIfRmRf/h+mYVWr2hO60g192ltrzDzwHLOvHPJa8N9CkhpjoGVPpZ97Bwgv4Yxmzk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FAjuaER9; arc=fail smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FAjuaER9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727445679; x=1758981679;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4DtS1EWMZcs9yKh9FZK2UUCi3K/Jd07theDMiTbFbds=;
  b=FAjuaER9QXngnXAJZdVH8ehQm6QJdY+vpvKOVZRAwTXwORJydSuKPK0Q
   Crt2tVZQJVm8uijzxpImdvSOLjhh0MHSq1nUf1fifM91vV0cpkplL/JLi
   Idk843K9n8CCG64YWpdiglNF7hSMbKnR5idFJt8GM0c2cOhAvo0PA8Y/g
   R26NuOgPPNa1g7ar4Rtxc8mSBPcfWWEvuENJqDkZfBdSJYvl8bcwtocNo
   zn2bdIBXOPxvk4SBZ0Vu6+eH5buNUDDXLsgT4V+AxN+y5KnPg3lF7mUyM
   NnzfUkfDJ3ODRDWOlVULU9TetczQx7qu6DDq1g3sZacsOgOk/Kt+pFIgx
   w==;
X-CSE-ConnectionGUID: AvDWRPkBQaqYH3vQ+jT95g==
X-CSE-MsgGUID: PKq54rKYTeOTrblhsz/kwQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="26763098"
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; 
   d="scan'208";a="26763098"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2024 07:01:18 -0700
X-CSE-ConnectionGUID: nT0PfTysTdi0WUu7qvV2pg==
X-CSE-MsgGUID: dv+tAcBNQJWnEMkIr5Op/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; 
   d="scan'208";a="77486792"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 27 Sep 2024 07:01:18 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 27 Sep 2024 07:01:17 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 27 Sep 2024 07:01:16 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 27 Sep 2024 07:01:16 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.45) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 27 Sep 2024 07:01:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BTKC0/ayq4/66GCDgkGTupEpXOshKI1idXNjmwfC1mafwUVN2u5ZzkCwC2OXRLW/NMhMiUakkOs2pZHVhlhIN1CJDMBEBRNvrBcxRHN/nst4sGM1Rw7U+VDDrw58LVmWJFnpxn+Cdm3u76y0XZ7BYvbJ+OUH3095l5Tr8sxg6SorGR+LjnccKTTL2icBDQZwkcHwEEBh417YeGn8YQ+gEvu9A21XkeZjznJE3yktPsyCMwywMwcOmEhRrKnIcVvcjvEaDJM33peoCXfxs+Hw866HoQ4BnCjpjsdRvnq44FzTU6KIklJZNjHfcD41T7gnozLEDmIG/OAjV3nURUrVwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jJVlsDF7uWkA7PvvYRspg+MVq5pl+CMWpYixeN11oSY=;
 b=t4tq/3O0TeIJ2Vzq547lEPAqzDEGVYV9DJYb4hxKd0fvwfgS8eitHFHnFz3bt2sOABHOy/VJ5yzhiqriZinqjK7hD/7hqJ7URK2rvyvx9Fo7PiGbPxirsc/DzAJ5C+QdfYjBVurFNVsOmNPiNXFUcsD4eOvbfkLq2n4zULda/AQ/jW4nZ5vpd1dHSqDffGjptpZagRpPclG7baJwgV/JMlG3XeRJS3e4zoXBs2mqk7g/kujKXPUuWmWAhivAaN61aBS/mliFpep452BBfw9r3rgnHogHLdYyeWe3io47Qm51MtliRenGrP3ozWm6capTbe11BI00Dh4aJEP+j4kmiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
 by PH7PR11MB7075.namprd11.prod.outlook.com (2603:10b6:510:20e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.32; Fri, 27 Sep
 2024 14:01:13 +0000
Received: from DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e]) by DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e%3]) with mapi id 15.20.7982.022; Fri, 27 Sep 2024
 14:01:13 +0000
Date: Fri, 27 Sep 2024 22:01:07 +0800
From: kernel test robot <lkp@intel.com>
To: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [cip:linux-4.19.y-cip-rt 124/30000] kernel/printk/printk.c:415:17:
 warning: function 'early_vprintk' might be a candidate for 'gnu_printf'
 format attribute
Message-ID: <Zva6o6KHv/mFQQ4V@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0169.apcprd04.prod.outlook.com (2603:1096:4::31)
 To DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5423:EE_|PH7PR11MB7075:EE_
X-MS-Office365-Filtering-Correlation-Id: 8478227b-3a49-4d35-5ae9-08dcdefcd8dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Ey44aHePf+Lv/8Q/SSx1JWyC+imDtEst8MAAu5IOMMsaAuDdjWqvgrUte+2y?=
 =?us-ascii?Q?wekxz9PxNTLetVVkU87menCDZv4tG5qQy9bmn4noWcbuv33gC5CYE6cocrVv?=
 =?us-ascii?Q?O/JXg3NkB25GlMygTwCX4S9TwWv/fJcTg6YzXdcAMHR3KI35tI0d9a5JcwYy?=
 =?us-ascii?Q?WPE/ruwQQgyW+4E6o7AB4WJZJVsyDhGa6BqO0jIz91YliwZfFRafFBvhvK8H?=
 =?us-ascii?Q?Z34kvXxhl1eO3vP/ZD5qjQUbg41hS4y8R2nE5NK+uWkJWiYv8fy0vbkPh4uo?=
 =?us-ascii?Q?s0cGC7Wifr/2PEoMkJAeNtn10+03Z/iUxR8JlLZyOM2LVwv8nMPReBu12b7C?=
 =?us-ascii?Q?dK7rXkOVqiPL9LN52/x+H+mOeUEAE5y1iiJYR3nT1m2txGhparr5PiKwWKZB?=
 =?us-ascii?Q?b22/6DvTkcLBHysL3/AeW98XcbckBU3ziRUurXmot67p4GtM21lXRJDJ6leJ?=
 =?us-ascii?Q?Ecbf1aShEmg1ntN67KmRJTXmt+Ocg04zWG3lElH+rch4OS/jPpT9G3CyZOWP?=
 =?us-ascii?Q?lVL47WBe7sq8qVvnN4EsA5GgI0ntcCTepXeRl5YeGX+fiI0TGu5S2VFuQ4/r?=
 =?us-ascii?Q?nklK/O+wrsZ63yzO1GfbCJO7KZFIKLVqiOFIAe8CC5A9Vv1lyXjgrBrb0RM7?=
 =?us-ascii?Q?+Jh8T7pH9o7wCyfyna+AypPip+t+tym8vfhuUDMYxz3iTlmR76sgf+wz2ZNB?=
 =?us-ascii?Q?EFw0Y8eQohi/dRSmBR0irLV3XwkCDgCQ712MnDvT9Tlkfna4OdLYj1TwwAt6?=
 =?us-ascii?Q?LF8PtVQ6w3WQl+vTJfMurRKnNtUELpRcPOmysZuk1zstTRkfan79cf9PrRVA?=
 =?us-ascii?Q?6rk2XN/B/qbh8nJjeSkNWJREbEud3k+e8fjg0gHJvDrddJmQKDtuvmsR0qer?=
 =?us-ascii?Q?yCfZMCiHgoC6jLg7FvyhsRujTL8tYTXg/uWgLZrEG7ZZQ6spxwK5I0RsF3gD?=
 =?us-ascii?Q?tPxBjEJAgsyDurjfIh9f8FfP4ghdPJytCuSw44KE5uaLYLVjEAPgVV2v45g1?=
 =?us-ascii?Q?d6A530KRXPDIO7RkNbhjKgZ7zLXLuqGXoFCZgswK51JIE+jWHGuw56Psw+3G?=
 =?us-ascii?Q?lcTSsD2rPcAUDmqZmJwbAsfp362VwRMaa2cm/fl/1cl9XW9FgMhVMPmMFcJ0?=
 =?us-ascii?Q?oOqh9sbMeLqGEhaUl7fzRLjljjs4Ax4gyQIQgjR9hoi3LR4UArelYXyM6X9Z?=
 =?us-ascii?Q?X1FGW6CTsaA65MKX/ZEAqxdnkb3dOoODO/XOz16iQJ5BswEGeUEleOMSEsLF?=
 =?us-ascii?Q?uS9CO2G+ZyUnPMC7/mYUIvIetYBcq2+cCnPVEPi5OKB0LF/B8YJOs06zrJu1?=
 =?us-ascii?Q?gcg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5423.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GGUOn6jzHnvqlTd3EsrYsQqgaO9/r03xiGJtN+yqknc0bwcbKyoIOS9WIKcg?=
 =?us-ascii?Q?iyUIlQcUfvvxhwPBsRWUtlTDyp1v+P0kcAynWdrxEZ3vdYdckGnv11iyzJP8?=
 =?us-ascii?Q?S4nevy8uBbXOsLcnSVW1oFfs3dd7vxdw6BrE8pzsRTCDhFid+HNnP3xU+i6g?=
 =?us-ascii?Q?53EjAOKADryYrFX/3TGNjHIKzcDInDL1ovWhp7DhXnmwZwytWZKRLpYn8Hs+?=
 =?us-ascii?Q?eU5kCDe67lqAadnbaXnvkzXU7T0J0ZaNe7tgh4eTlBAfR7P80h9WEDZBZZkh?=
 =?us-ascii?Q?FHaS047vz/k02McWRpIwPRv2Y3Hd8+hw5uwn0IUEhGTyseZlocy1dKqzPjnW?=
 =?us-ascii?Q?LRbqAlIoIGLP1eH9wpQ9qPiAf5yIz7krFxS5+cts4PL4bW+FqDP1P2lwRnck?=
 =?us-ascii?Q?nC1AIiCP3vaRwVetV/eibn4RPBeFs4YNah857l70q29TxP5kcm4EyAxfnrhJ?=
 =?us-ascii?Q?+0yGXwY9Rsm1j1c5ZkM6IXZ/vwUYW4GXDXS8VVI3HK+OUTwQqkVDaEVoo1sw?=
 =?us-ascii?Q?W0tcmJsrSa02Nra0ltW2uZboZko76iIRZ4zk8NF19rMJVHOjtnZZ3PvSltzQ?=
 =?us-ascii?Q?+FCM/jBxEjzq/e/riNCAWYjCDqYgOswUfh10rD5FNFECf2TVbIYjK0oVvO7A?=
 =?us-ascii?Q?p7v43MSrjZzLE17UFNQKzSkenrcEFHCBQoYFmLnLq+0NuBKrxUSN3I9Mf3NB?=
 =?us-ascii?Q?sCEys3a9wYfMrf6jP9THJlqrxFZl5zk72ryTgb2s1HDYvhqhcWjZ/BsneVgD?=
 =?us-ascii?Q?GwvQmniFWL8cjae5OiNrICnNEsmf0uFzq7F69PMy79UHpDOSYbu/QNhhlg0f?=
 =?us-ascii?Q?b69ePt8xjcXOh7H8BRlJ/p2vpIC1aODMXLHRYuDH+02jlGOmTUQeStqpnjx2?=
 =?us-ascii?Q?ORzBgc9y7IZPPBhh91txcWI7TR4lU75qKK3bQ8dhgjrN8HLZJYDJMzhEZpAS?=
 =?us-ascii?Q?fZ82QcRNWJXsCoEtMZ/y+HY7B6oVf5MOaNQ8SQw9vrnetdkZ51hlfnRpvPLU?=
 =?us-ascii?Q?N9/cJuIk7AXlNJG9ZndmI6O/bkW9+OkZ/dM405ql/kIAI2oKD0/zCigeyjwo?=
 =?us-ascii?Q?zMNgboiGL2mGQ9OEP1n1HPUM3w0UH5YDuJ0kfiMUqNw+FM+CrU5CxWL7uZOK?=
 =?us-ascii?Q?GKo9AUN8OugaH8Zsinm4DjIidIGYzMn81Bs7f397i9Pu0o1oTIwHuYcJeNYH?=
 =?us-ascii?Q?tjoVzMe7qwDyEjdarethNUsFYdqyH5mHgph+86eFCrbspZU6A30jiRbcbEKQ?=
 =?us-ascii?Q?bdRgd82WGZ2XTDWNM1tfZH1qah+y9YCK10bBnjv1GW+HhSMxzKg2CxeLw6vE?=
 =?us-ascii?Q?1qH0ap9THDpnKuwnwUMLsnKODSOOwPRpanZzO2Xzn7E7wFvWBRCj6B0XyGXS?=
 =?us-ascii?Q?46FoxPdPFJsfSYAiq4fgHaz8i7QvjNbDq3m4Gkj+/bZ+YfBHx8h1VWYeFYGY?=
 =?us-ascii?Q?MPGNlGJdWleKa/waSoZCNzuFcAAV/1YWkWNfiG+PPba/BDatXNx+6txL+AqA?=
 =?us-ascii?Q?kw8OdhnhXXgAR/FxiovT5unS6t1XskHAzrLz9bTNAycTOCpwSz7sCAwDCur2?=
 =?us-ascii?Q?pT1V/RGcMOwliP6lWsmzTivZzHk3vSBPbVBWr1zh?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8478227b-3a49-4d35-5ae9-08dcdefcd8dc
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5423.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2024 14:01:13.4132
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VPzHm09weq9KGVohFm2lWDYt0iWlUri96gWN6OHZxfTsV0VkaBb9qcaSQZ4xEifzvuJsVZh04lnK5CiEzESOvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7075
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-4.19.y-cip-rt
head:   f0b0dc3daffc9639872f52dc74ce62bd887d3088
commit: 14d0aafe24db413554d33f9ec8e3a69f5a488881 [124/30000] printk: Add a printk kill switch
:::::: branch date: 2 days ago
:::::: commit date: 6 years ago
config: powerpc-allnoconfig (https://download.01.org/0day-ci/archive/20240926/202409261500.4GoYJbab-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240926/202409261500.4GoYJbab-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202409261500.4GoYJbab-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/printk/printk.c:59:
   kernel/printk/internal.h:66:20: warning: no previous prototype for 'vprintk_func' [-Wmissing-prototypes]
      66 | __printf(1, 0) int vprintk_func(const char *fmt, va_list args) { return 0; }
         |                    ^~~~~~~~~~~~
   kernel/printk/printk.c:156:5: warning: no previous prototype for 'devkmsg_sysctl_set_loglvl' [-Wmissing-prototypes]
     156 | int devkmsg_sysctl_set_loglvl(struct ctl_table *table, int write,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/printk/printk.c: In function 'early_vprintk':
>> kernel/printk/printk.c:415:17: warning: function 'early_vprintk' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
     415 |                 int n = vscnprintf(buf, sizeof(buf), fmt, ap);
         |                 ^~~


vim +415 kernel/printk/printk.c

14d0aafe24db41 Ingo Molnar 2011-07-22  410  
14d0aafe24db41 Ingo Molnar 2011-07-22  411  static void early_vprintk(const char *fmt, va_list ap)
14d0aafe24db41 Ingo Molnar 2011-07-22  412  {
14d0aafe24db41 Ingo Molnar 2011-07-22  413  	if (early_console) {
14d0aafe24db41 Ingo Molnar 2011-07-22  414  		char buf[512];
14d0aafe24db41 Ingo Molnar 2011-07-22 @415  		int n = vscnprintf(buf, sizeof(buf), fmt, ap);
14d0aafe24db41 Ingo Molnar 2011-07-22  416  
14d0aafe24db41 Ingo Molnar 2011-07-22  417  		early_console->write(early_console, buf, n);
14d0aafe24db41 Ingo Molnar 2011-07-22  418  	}
14d0aafe24db41 Ingo Molnar 2011-07-22  419  }
14d0aafe24db41 Ingo Molnar 2011-07-22  420  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

