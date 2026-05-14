Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B774385530
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 May 2026 14:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778767531; cv=fail; b=jpZtkTQ75evD2QeJuVgshRp0IFO1lFo30uP1lLSRAjdA7n53RBFgpxYGuDff/UlkMlpaNVAnw0rQDMk6NZ7YcVw4b2Pqsln38SgyVF40ypsmoicsoK/ZWoARz+ltRZrsjTqReB7rx4rZ7leJXjlox6Cz70g6ecLrMHZvXOEX4Zg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778767531; c=relaxed/simple;
	bh=uAVbcvnRmiVCrMAr7u61rLLXIlN+a6N8frBtDV6g1DQ=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=Joa/LgdGdzv/XugC6ue0wa/uqs2BtI69eDOuPUpnyCMON2Z/GUtpSP8I80rYHeoZNlDeGCtPdIFJ4sEwJBvT1casHs0rAV+Bts/p85+Ozr0/pVpUrwU/mrr86gIEAiINFV+COy0Ktdz9ic+bY2JNqaRtCyJ8R9gPNrfSnICSzx0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T8OcgH9p; arc=fail smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T8OcgH9p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778767528; x=1810303528;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uAVbcvnRmiVCrMAr7u61rLLXIlN+a6N8frBtDV6g1DQ=;
  b=T8OcgH9piu87HOxpGsCS6RxAnG5xf+ZzvXliYWNaVt6wv7kQSd0Kp0Tq
   5lbnYM4ugmPfdWCJi0y0YnMYlh2AiJLT09tOekoyaYTkFOscCFt9lgJQm
   mW/r5Pw91lvllZr2demnj0KZ+P1DcOfKOsP3AX4rn6X6iJK3tdmHwFgnS
   yDWD6+20KVuz26T5IioIrgSPaHBsurhvpxgMzeLA7PRFiiO4Q7C8wwS2W
   /jobzbwqmtudut+/xLV8YHYbMOwOJtlyC+pc52wD6yK0h+2K7CnfXQN9l
   V560tMrzQJ7IzACnbhNwIuIxMETOVD8a+v9c6J/Q3HPOWqFCSx73hi72j
   w==;
X-CSE-ConnectionGUID: /5DIvglvThq7s9EIlEuvrQ==
X-CSE-MsgGUID: HdRAMFLmTwKZyl6/7tnq0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="83559234"
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; 
   d="scan'208";a="83559234"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2026 07:05:27 -0700
X-CSE-ConnectionGUID: wRHzDickSt+sdOJWlsONeQ==
X-CSE-MsgGUID: 9P0lQmTDTHGADS2SN6wseQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; 
   d="scan'208";a="242389199"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2026 07:05:27 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 14 May 2026 07:05:27 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 14 May 2026 07:05:27 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.57) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 14 May 2026 07:05:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fh8EYQY8xhygAv0CAoR5mD2prsmiliPJwxPFF8GNbwVjzV288q5mXQB+5/zNtbdWS7MPdqTV+09AfDdhUpkPMkI/yDf6q5dLHHZTamSc5yrRtL398yH7MiiQGcL9nU2ilXnHrS8DETmHQknyOpvP0dt/NC+LrfA0gOt4E7XcAmXJFbet8oCzUpysTbYPpxMX45HA12QCqkOPh4bIMxyPZp9wQ2AaKtSplNoJnNTFHF3+PFr9Pp8mkPY0xCBPAj4Sam5UthXIyKVM1QU/JpkYUck/VF8dq08eE8//tXmzCCWGRdJW/n7VBPVh/MjJMwvxFZEAaaXm9ENDmUmniIMrxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y3TejrDz2D9Og4Ym0CaP4uYHTFj0UiWA/EZHObFT0+Y=;
 b=SWt8xV1GUQefoXZTqYrmJhn9SH6/a+ga47EdTAslXuLQXH/OIygvX+MNHbKaEDPjECmdoxSaNe22tixBL5eqWH+EFDWRnTQKbzKwt+2yfaJ4BAIJJlylZWwCIEbbPCTO2AKmgLrQgFhJHwa9pJdFLTsQzoWhjyFkQAwOQ97P2e7B9/K6Zw3w5afvyUPHG6GUNNWzVU6xY7N9ma0ycem/Am4BHs7pdeMXCRVj8Fjy0ogbKYS4T7CaKYIXIx0eKYrClHROkOpGVmWzSjEkxtNa1IMJ3CxU9/NlmIY3+Cymc8XxxwrxR2jqGWQQ9evmwW+nd2l6mGw2gT1voLxgWAykwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5428.namprd11.prod.outlook.com (2603:10b6:610:d3::19)
 by SN7PR11MB8027.namprd11.prod.outlook.com (2603:10b6:806:2de::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Thu, 14 May
 2026 14:05:18 +0000
Received: from CH0PR11MB5428.namprd11.prod.outlook.com
 ([fe80::b8c4:d29:c56:a2da]) by CH0PR11MB5428.namprd11.prod.outlook.com
 ([fe80::b8c4:d29:c56:a2da%4]) with mapi id 15.20.9913.009; Thu, 14 May 2026
 14:05:18 +0000
Date: Thu, 14 May 2026 22:05:07 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
CC: <oe-kbuild-all@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<x86@kernel.org>
Subject: [tip:objtool/urgent 6/8] fs/netfs/fscache_cookie.o: error: objtool:
 __fscache_relinquish_cookie+0xcc: can't find jump dest instruction at
 .text.__fscache_relinquish_cookie+0x264
Message-ID: <agXWk/O53/aBQtf/@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: KL1PR01CA0128.apcprd01.prod.exchangelabs.com
 (2603:1096:820:4::20) To CH0PR11MB5428.namprd11.prod.outlook.com
 (2603:10b6:610:d3::19)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5428:EE_|SN7PR11MB8027:EE_
X-MS-Office365-Filtering-Correlation-Id: caec5769-0e80-4eb5-27f8-08deb1c1d451
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|56012099003|18002099003|11063799003|3023799003;
X-Microsoft-Antispam-Message-Info: wcQDmJP6teZ2ZTwMUJelHEKqyZHkWNtQiCg+gjlgF6CPnuxXgOZOJSY2QM0tlDiORmMuctsQPWUcU/p+nGEDhbaBc1cxVN68uErpN8Btp62DmMWAzfwy5MJlzYG8zmuPh/7sGsFtkHHXUOUtvoPfbzo0xLZON9QlRSuYdT8vG0cpMeiosAapVttwRuqt/ZnslL47CH4pgAl8hZVri6l7Qguh1PGZHpKhA5CZ2lo0lz9IfF68SEUTGa75kP3BJB5HMx/rsbl+qQgkD4Ar7X4sl+jAuqhdrWs6TeK43SAXOGn4bjqiCTDDWiI12EPVhL01Rl4g+0uwoaUkmoq7eElIaura7BWm2I61Hs8Sb5ZMzkezE2zkIMaKEZ5Ta3ZTgtkiO22g45en/YWEYF6B2HDQobddhNBnKjPU4H2/1upwUCl0EfzkKTyka1nlvFgwwjBEGXMbuDMrqsYfwYkPUKxZ2orScpnNQSrB3gpbIdthMMwfAZgtyWTAV9Hu1hNg988rtr8dhTQ/YS1V06AKe/7b6p1MR9b8ygtqf6QO0bYa68gY0bcbhXmu51m7LA/5VL4+r6dXATzeMAHgCm4SW3B6FCQFCmVXMbM9muJ8OoAInzmfDrLDKpcr9+4evXWuc8KraY6p8RQSAsboR3D6kzQNPg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB5428.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(18002099003)(11063799003)(3023799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?G2BRqZKPFsx+sBgqxgu4ffiX++9AgfM5lB/qfevgZwgUmqrfHHjQKcHXqxZt?=
 =?us-ascii?Q?Z7Z1wqyq1/OwX5XPeVrsIINDGX8CDMFEjpJUKbfPrhmzZvqazTWR5b1AcSC8?=
 =?us-ascii?Q?9Y6FVDtlI21SENlBv3c0ldS5rYprK1FAeo96G/5MP5KxVatKUImwReAIu+Nh?=
 =?us-ascii?Q?D2JhwBiL5QhbYX1SaGE2pIPu2e/ctIzkq1Ujo4fRdMTf4VREfar8vI1jWRXR?=
 =?us-ascii?Q?IhzUVJFQkz6DCqvOi9MJSozvsH9CbqJOfbzuE4heBZLdaC9vsGvMCshEbt5u?=
 =?us-ascii?Q?22xelgOWOcMV9FcYC2Z6J7NP69LAQoJv07VBsvqtbwQ8cyRhFwDN7i0Kz+io?=
 =?us-ascii?Q?kIUANiiD9aoPg/eX7NZD7gJBBjT+CPyfFD2ll197JmZO2oFt+RsahuqBG3I+?=
 =?us-ascii?Q?g9wXVH/E7pqkKi9bCYsHYsplJMLBPy+ZvEapJFoJYdS0ivHi0N/Z2dTzFfHm?=
 =?us-ascii?Q?YNVXs9shkZQwVN8eZHAVAsjNNjCQim630/OAe5BRfHwE9nHQnTZ3bHZQq9/j?=
 =?us-ascii?Q?R66fxu5L08v+4vxbUjCF55HrtWAenlIdwrorLNe0PhiIjWEQN9DsyKwJJzOL?=
 =?us-ascii?Q?eXMuy+OUJYjMaOaxwpKQrYyid3cRbLkJyS4EdJxwhiGrCld6SM83LPk6HNgf?=
 =?us-ascii?Q?V1oVDmJWJvCBuQLRiXyxLxgFoPEyRjrgO3OsFwLnfl6srKiB83ff5bAiMO/a?=
 =?us-ascii?Q?y2piXhz6Jgds5yIj3KhfMX00IYfh4boBiLb8k+PXMV1erQ48gusZ4UdnCzHz?=
 =?us-ascii?Q?NvF89t6GbaH7bpZ6fa+QmuEUs+JB+TLmH8nafmL772irCN6QhtTkNX2t2CWj?=
 =?us-ascii?Q?f5mS2N2pwv4tj863ljruVHSmuofo+hR2zS7H0HJpukipuWZ93w8cloa0Wlqb?=
 =?us-ascii?Q?FF0EehfQL20GjcaxLiiRE+kKWMlRspX9vt0bR8utfkAEH72UhKhpV+OiFMGs?=
 =?us-ascii?Q?Izd9UcJ1eKMmSyN2i60chiJnA555t1cvdGIF3l04bAQpFSGBx9LhEzl+qxDR?=
 =?us-ascii?Q?/JT9awJptA637Tin51+zqkpBrmaVPtRzEqPw7hxiS5OjBbd/ieveoDnIkeNM?=
 =?us-ascii?Q?CvsXVUgOxKk4q+PCQl1wa41X+TWk2JMyGZgY/8elCLImRaIXHtCGoPTY2KrT?=
 =?us-ascii?Q?I0PPiH4z4xwHmdKyBBAxghvIqfCckLipg+b2NgotUvnv6DLlxkucq2BI2jwC?=
 =?us-ascii?Q?uOXxsuc5INRlZ7uRWllIiLM+v99Sx79EdK60mCUPq0+cSnksRAKW7ji+W3L5?=
 =?us-ascii?Q?mMTkMNgrv1skEltlQ3aA9U3LLvkF6lK0PmY+YS5Sw+p16TQgsIbhaDAVuwcG?=
 =?us-ascii?Q?GRg1rEZdP8MGXNxqHgKJgG388Y0UTMJY7CYGaf/zKxJqZsxHsClIhq49ZzYA?=
 =?us-ascii?Q?/YS/+98H5IRY1/DTdZ7gEn8/nYudEOx8szeaoQiJjOV9mnkQLS5IwH8uAEEu?=
 =?us-ascii?Q?KvbGTudTlvkxCpHu/u7pVDpO3IHONXB18+rfjcUojDXulpqF6sA0r/OxzCkR?=
 =?us-ascii?Q?ROm4pY6IzEM2i8XXXvxaCiGODMwU2iZIN3g3JfilsQCGYxTXSEETy46s0MYs?=
 =?us-ascii?Q?3Crjv+oPDQN6+rUOjSI5IZMhmZmmMqayBB7yibHfLXvwSBgo0eEvmXBNfg/7?=
 =?us-ascii?Q?vwvsz8rXmuPC5BhNBJEToCPrj6F9NtozkM8OAE4+hSrg7GrBvMYwRJ5c08fW?=
 =?us-ascii?Q?IQyPxifKVh/VPW+SnZ1tnyvX8BgwUigmarSnMyOecXoUaYDvFBNfGFsKGAc1?=
 =?us-ascii?Q?sGJTKw6rMg=3D=3D?=
X-Exchange-RoutingPolicyChecked: saco5wAQX5MPhECB14XthiiVye5Hb50D8Rmcuimda/5fpB0bqLAOpkXbxALut9qcw1mB31FdN+8+w7jie863SWoEZZXVUBc9difDimJRK4wO7PBZowMq/1P35H2Mgc7Z3Zh2za7g9Qm5uwjjTSUjNkkw4ykEyqQNORBxu/Opay28jZMWrR4ddqb04TBpUkfQv9MRMMDYAxfyyvrVLMOyLh00FLnLeNZvXDNG2hf06WnULys8R595QOodGwK52RHmEUkJWIy0riNu+tKovvivQ8lZ/uZD80opT+p9tqJdfPMoGw9n/x83DYnLQDLR3zdto2jqDrWr1tcVmT28HFtQAA==
X-MS-Exchange-CrossTenant-Network-Message-Id: caec5769-0e80-4eb5-27f8-08deb1c1d451
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5428.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2026 14:05:18.3741
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mbAIEUJCdRkCXZgakmwj/QsldsqRGFc5viTNVA0H3kYWBLtArzL3OX7WMatyGRpw1pGdxmqaBLu1/DXEna8TFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8027
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git objtool/urgent
head:   4e5019216402ad0b4a84cff457b662d26803f103
commit: 1fd1dc41724319406b0aff221a352a400b0ddfc5 [6/8] objtool: Fix ERROR_INSN() error message
config: powerpc-randconfig-r132-20260514 (https://download.01.org/0day-ci/archive/20260514/202605142048.AOA0RZaJ-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260514/202605142048.AOA0RZaJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605142048.AOA0RZaJ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/netfs/fscache_cookie.o: error: objtool: __fscache_relinquish_cookie+0xcc: can't find jump dest instruction at .text.__fscache_relinquish_cookie+0x264
--
>> fs/ceph/inode.o: error: objtool: ceph_fill_trace+0x2cc: can't find jump dest instruction at .text.ceph_fill_trace+0x1078

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

