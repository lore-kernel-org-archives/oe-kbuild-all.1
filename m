Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86541186291
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Jun 2024 11:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718622992; cv=fail; b=mxrwrL9jLAZJ7D0ju2WIEQLWrNqcp7jUg8iDKtW6qXuCXAGVqDVko+1aOuvKNlgbmtfRNc3FGcE07mjbmNdtomPrZOnyvXGSGUESezAZVpzuVDKy7bcgzNxYV2vAOTjDCDg9emQUYF3PGDiyoo3ru7pVrc/ypR9tnKDl19XMM5U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718622992; c=relaxed/simple;
	bh=inWhpWpRVEm8HdS9iwKvZeHxCbyCP9v5pglFFiDWVvY=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=XVR8mfF3iqFOn/pZxicOPLJODYcnhPhqebuXZ5phTJvT1+5PN6Gm9XXYwZWT44BlDNagxS9BjEmE/FzYUO6JA4IcFf7sA40K86scvtMyPjcVxSiZdrEgIrSQ7LrfU3oiZzv5r1zlhgpn3kFc4VwQsSEFMnBg/ujVUTzSlbmIQQ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N7d2pl78; arc=fail smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N7d2pl78"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718622990; x=1750158990;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=inWhpWpRVEm8HdS9iwKvZeHxCbyCP9v5pglFFiDWVvY=;
  b=N7d2pl7838eU8NXPo1fSDN+PdnE9ffI7KDwWxtfd1i1AUkgeOIEqdDkP
   jf/o1hg3sqcBcGBcYpm/BTbmLzdEuQ10hAUjW29K+YED9W7toGN4SeyFf
   rQLWQzcTIjFXTjH8QKpcMrEi1cXUaX6w5DAPLwNwwhFp9PQZPlz4mPHGx
   BvgKzmrsofmPGCr5Mae+BAId1nQoXKj8z3bJuv+VKmSp8hzw8oeHE4jZa
   r7/ZVyVptfXdb8Vvd5YTppRDN1YJ4oS4ePJeGdNZ3tLoZeiyNyCmk4Tjq
   ToWOAx1yfuaOpDUqEueAh2dE2L2HXcZe+A7OhKK8F1uVrna4rDMnr/AZc
   Q==;
X-CSE-ConnectionGUID: Ci9Tf37tQS2ncMK7U7QN6w==
X-CSE-MsgGUID: Inf3HbQiRjKtU3nq3Od2Gw==
X-IronPort-AV: E=McAfee;i="6700,10204,11105"; a="15214055"
X-IronPort-AV: E=Sophos;i="6.08,244,1712646000"; 
   d="scan'208";a="15214055"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2024 04:16:29 -0700
X-CSE-ConnectionGUID: soPtWQopSkqnlh7DthYWTg==
X-CSE-MsgGUID: 0UI3BbQjQm67Pgb9zxrw6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,244,1712646000"; 
   d="scan'208";a="46280245"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 17 Jun 2024 04:16:30 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 17 Jun 2024 04:16:29 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 17 Jun 2024 04:16:29 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 17 Jun 2024 04:16:29 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 17 Jun 2024 04:16:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M3nXYbxJsm1c0HQJHJRskGToSioQuUSvZ6/zV7usrzVZHSwqkvI808fLR0hcqo0AuxWvMWY77MIzt/F9brczLltWTFBU35vlvp6JuIK0IeQR3akie3cBLB2KGhYSlix1SSuPU4wCTpNjQFAvvNebobFEm74gkKUYxfZd+lm41HHzhQR4TvVu6zhi+PvrQ/M8rc1dJa5FH2fmID3RO/5FCbbOyVEfAW76ThMB4GjcWnchxY1cXQJ/G/1Ae0uOwtepLA0APfveiai/3N/w4kwm/O3rkQKL8LU5lX0kKJ6oqbT2KBT6DKN01hekl5YC/t2ItKLwaoi1yKROGiwgAqHFzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MpNFiWkPYeBmSF6dn3Wr9tCu+EkKTqQwpwxfyFi5YEQ=;
 b=YTCPFxdtOKBdOf78y8Jt6Fi57kbfdT8RhqozA1CCM1fXhcwUC9RRnqeL7pUGlU6f+kPKphF1YN6fnYwtc6YdN8FnwiOuAGvyNFQdVLPxdra/6NmLatzWKxQx23D7E5akeGsoT0yYTL5ushDKrGmERfDiLFc0bEe1VbuJ5/Wnb3b9k8czK/Omw4Q1JI54OE37ZVMPvnD/f1ZKsmMynAHY2vDSK1BkNaX7baVfWrC7MYb5TV6arf5m6AuIOcCvR5F9zHBj2dtCNq0t/dQ7UfofNZFp+xnctFo4OUi0VscB2a9Zy+oTfF3D+JJV2xNKSRt50YExuuBZZEQin5jjOXxOxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB6039.namprd11.prod.outlook.com (2603:10b6:8:76::6) by
 CY5PR11MB6366.namprd11.prod.outlook.com (2603:10b6:930:3a::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7677.31; Mon, 17 Jun 2024 11:16:26 +0000
Received: from DS7PR11MB6039.namprd11.prod.outlook.com
 ([fe80::3f0c:a44c:f6a2:d3a9]) by DS7PR11MB6039.namprd11.prod.outlook.com
 ([fe80::3f0c:a44c:f6a2:d3a9%3]) with mapi id 15.20.7677.030; Mon, 17 Jun 2024
 11:16:26 +0000
Date: Mon, 17 Jun 2024 19:16:20 +0800
From: kernel test robot <lkp@intel.com>
To: "Jason A. Donenfeld" <zx2c4@kernel.org>
CC: <oe-kbuild-all@lists.linux.dev>, <zx2c4@kernel.org>
Subject: [crng-random:vdso 6/7] vdso_test_getrandom.c:149:40: warning:
 omitting the parameter name in a function definition is a C23 extension
Message-ID: <ZnAbBADhRBMD59et@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0157.apcprd04.prod.outlook.com (2603:1096:4::19)
 To DS7PR11MB6039.namprd11.prod.outlook.com (2603:10b6:8:76::6)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB6039:EE_|CY5PR11MB6366:EE_
X-MS-Office365-Filtering-Correlation-Id: 29736b65-13b5-447c-ea65-08dc8ebeeda7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|366013|376011|1800799021;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?PPeokMHW/x0Yy2v4SEzPjtQMg5TV5q9ap0hdQyJaptRij8XcT9T9EElpLn0b?=
 =?us-ascii?Q?9xX5cCUajT841TpgxwiEZJXMpDWxVxMIiNRPXlEuvAwtCLWgEkvgdSR57qIF?=
 =?us-ascii?Q?rWZAv13W9uoicF+wMl24plIER2VMODTxViuGkOU9fqwgW5O8GZLrIgPssAji?=
 =?us-ascii?Q?fFCow8TUcku7Aiphrm9Rx/rEwPxKc65YMLPWwG5M1f3rDpyGQVwEASsVWVMX?=
 =?us-ascii?Q?1DydpKMBM8bQjggiGQToojRBpgWbYcNmCSpfikBxKkhseFOU7I+W7OGdtlTl?=
 =?us-ascii?Q?i1I04+7BEx5bcviYxkfM/lu6kxdrHe+mVUjfcMQo6EsM//9tEqtXrSpR2KoS?=
 =?us-ascii?Q?oZBuFl8Lc4+XyutOLbJFyxMg+t5dfD5v0zGoq2NFbD8Y5quobVYUrti4kK7c?=
 =?us-ascii?Q?GV2ay+Rs2M0eC/3+8CeGWKzXeUNkBEDazkMM2Qr6kgZIN7qEj9WyTlAol42Y?=
 =?us-ascii?Q?oP9xbxhJImXng1HoqVMEEI3I/siOSez2TNmcfCqJoecl3zD8zzULrGTYK/hs?=
 =?us-ascii?Q?QNN64s0ROHcRUQenYBDgcTe3t8H3BeWnngIG0ZEP7MFcY6ozYvqyoaza2ick?=
 =?us-ascii?Q?exISXiVkLLeYEL7DbB+YESAl20vfAgLzBKhDgbxi39BsU4QSrC69dW4/2VB0?=
 =?us-ascii?Q?jcVQBe32zzf9zbZFe4hJjS0l/8160T3MWdIs4+lG2GjvNcGXdJMakiWM87mn?=
 =?us-ascii?Q?TUSYGBCO7kb1R52gGxIqG6tU4wOkhV6uHv6F/G6XpWETGZNDQmiBAYHDYP83?=
 =?us-ascii?Q?6QD9kzZosDJukLS4slXaskYWYSIVJ5wJxRM62OH8Gn9xmcKtwYJROsc4EiuC?=
 =?us-ascii?Q?lLzKSglF9CGfLzE1DEmONCysV5xdY7mVmBmU2nkUnyYQgVWuuYyYmFDlCK+Y?=
 =?us-ascii?Q?acxygAHRfILmgYRFYhUgOBamkxTJsFaLu4ifqPn4pSdq2GIjaghd8b0hSi6/?=
 =?us-ascii?Q?MJDRYJd6pl2htatI9KY3i3CtTZNNDkGnApOF1PFjMuQnK8WL7zcVtYXjnwjt?=
 =?us-ascii?Q?Rn3vJdMFZOmmqV1TCpXOlDwLRbK8cN06AUyoCufvxBtJIAczhyZxH6cudC8E?=
 =?us-ascii?Q?hIar6KhRBYLF76Tl0gFqN8HplJZQ3HyReunWshJKcz9/Df0wBnuRGNfE6qre?=
 =?us-ascii?Q?6ZlyM696gfPgXU/lZLAdyNoj8hFSzMrqZpYGEx7U1owsdvEqwoQCb9oMWy7K?=
 =?us-ascii?Q?8Cai6REKhtlFyZxPtA79zSx0Lo9GrvrWkZ93r1apue6K67ZAAbNLiRdao5WD?=
 =?us-ascii?Q?avjWmFh5AmKlErIt6SJekZQI9BQGdpRzvH4PmRmaeQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR11MB6039.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(366013)(376011)(1800799021);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BOrnd7ec7qTVmN7dw+L3HOAi8MiSxJL3d2MZQT/dgPe6UnJ8Xh1YLm9XvfMO?=
 =?us-ascii?Q?aV3aNlmZUncIZ47WF4qenkMZeRelCzeVwDq53JXozuw8CnqHml7oBDmpoiJ1?=
 =?us-ascii?Q?ojzd7no5o+RjfvuQJoFgjsiZ1y+O3Itb0vwS7Vv7S/rjCi2uoVisxSzEUz4N?=
 =?us-ascii?Q?ikzujE5V3y18IBwEBDCmrawOCCLmp5PhDnVenD0abtyqzNjnMDW/bm/WGG5I?=
 =?us-ascii?Q?58ZV30WXyV0zeI5ldyH1DKtf0MDhLf6xw8ESbUdnUGuXvKeMEj3jmtClZKvN?=
 =?us-ascii?Q?3+fsrrgqvWhh3wTXZLJK0FXHj7ENBA2vByg1PZIxInV5BHo/F9Y9L7ybsp4S?=
 =?us-ascii?Q?krGGadlIt6eXGTxkUo1m9tMvGoQpnTAk0hceWBOAPe8STxQjIJt+Xqcdrfbc?=
 =?us-ascii?Q?voNwVgKRY1V3KWrBMRZZp7ElWsYKIzgwmrSGdbl8Io1gv1UeatqJH6w0R0zV?=
 =?us-ascii?Q?mvKVtLKJsBvW7KeV3uG1Fu0q7eSfDBM1FfE71NNa2FDKCB7mfHPnMDLLLaor?=
 =?us-ascii?Q?WVC55unFIw39Y6y6VbSgOQvc1cPduLn3oHPcxB1frUltGcK/k6iIF/wivSxA?=
 =?us-ascii?Q?HS3am8vZCoP8dx4bBYP8jnIrV692ksdjV4nWmv/KcfrVgoxdEr6YHckSWKlI?=
 =?us-ascii?Q?DykqLPGRdchzNnXrKf18a1YlfbQAW5S3H9V2Q9GV7dPXnvkaaRWF2DJYN1k9?=
 =?us-ascii?Q?Sx4Z9e0vq/cyF+fnTLe4LXPCRzAAZaF5j3JiGZxm4Q4wISY8yzHs/kWJOK1Y?=
 =?us-ascii?Q?h9ZVbxikkjUEL1huNoCDVXuWRzZ//I+mD2KHk7gklindY960FUa2Vp7O42lV?=
 =?us-ascii?Q?DL+DsdJPWsZjtcGGCxiH1e+WZRYGaBYcxT4A1UMcwr1CoRDaSfAS1u+46vJn?=
 =?us-ascii?Q?076UmuLMm3pUHjlCgJdqaqZVjAAPVxKurlDr8vGZNQvZDn4nsiAAHNhyEPig?=
 =?us-ascii?Q?Kc7UVa0IW2c7Qdep17OZWEmU2e4lFTjTCYZPP89+UQHxAwRVsYSUeiW52Bxx?=
 =?us-ascii?Q?6BXQMjsuiFzqV1swKU09sn0oU4R7Y06ieYenHS0j/JGC/R2+211lVQM5HLuC?=
 =?us-ascii?Q?f70YHZGfQXo3R8qH01nUX5sKnWdaMwndTHkqRo8dSVWdQv9ILDG7/4LEiDZY?=
 =?us-ascii?Q?65eCbNChqAs50J5Ch9IkI5BBMhUltgw7czSHhC9B1KDOZSfoNByqpPaIxasA?=
 =?us-ascii?Q?9P3ZqqCr7WFAktUA/eKIc2sBsJgb1Y04pTqoItlKV0I5MedzuWjRC3GuBaeJ?=
 =?us-ascii?Q?41mLKNjQmQrR+7RW3QgK+YA94CJ08hIniThxGzDbvZNxx4a7YDJUq4NeMJVf?=
 =?us-ascii?Q?dWzjqNMqcXym59YBbQWW0tkmKferVNkZbu09tjdGKDVYpCMk48dk7LKDNIx8?=
 =?us-ascii?Q?aOx8K31MhHCYMgUE8cC6+Nb0eKyoCqUZmP07H5PeClq+wvfTMBSqfw04FFYJ?=
 =?us-ascii?Q?uLjTDnA3tKEa45LL3WK/D8BJbXs/Lk7eVNvGlj2Rl/y6csHG8dxj7R0NIIXj?=
 =?us-ascii?Q?jNmwtwE7DBWjGL1Zf/2v+r2PjpA30VjJiZOoxBlitBA/FKcF7ej/Zlabf5nQ?=
 =?us-ascii?Q?sGuW59TGMZlosJC0K/nmx7QL0KthCNA8jhbHVQlfxT9gJGv+mIJEsLScNEe3?=
 =?us-ascii?Q?tg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 29736b65-13b5-447c-ea65-08dc8ebeeda7
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB6039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2024 11:16:26.8862
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6sIGNayqnWPsuK4XGkbAg9QpWYh5VAr+0fJ1eTUSQoZnDr4Rd+sRxtCGx6qZ0qWopkw8LQ2v5S6CHyPTP6z45Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6366
X-OriginatorOrg: intel.com

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/crng/random.git vdso
head:   a115b568173a8ac7b2c0ed4b3aacdefa89fa7d22
commit: 1a9e8743248fb63fc15a6168d458e322e320e02b [6/7] random: introduce generic vDSO getrandom() implementation
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240617/202406170938.rs6wG1Nd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202406170938.rs6wG1Nd-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vdso_test_getrandom.c:149:40: warning: omitting the parameter name in a function definition is a C23 extension [-Wc23-extensions]
     149 | static void *test_vdso_getrandom(void *)
         |                                        ^
   vdso_test_getrandom.c:159:40: warning: omitting the parameter name in a function definition is a C23 extension [-Wc23-extensions]
     159 | static void *test_libc_getrandom(void *)
         |                                        ^
   vdso_test_getrandom.c:169:43: warning: omitting the parameter name in a function definition is a C23 extension [-Wc23-extensions]
     169 | static void *test_syscall_getrandom(void *)
         |                                           ^
   3 warnings generated.
   parse_vdso.c:65:9: warning: using the result of an assignment as a condition without parentheses [-Wparentheses]
      65 |                 if (g = h & 0xf0000000)
         |                     ~~^~~~~~~~~~~~~~~~
   parse_vdso.c:65:9: note: place parentheses around the assignment to silence this warning
      65 |                 if (g = h & 0xf0000000)
         |                       ^               
         |                     (                 )
   parse_vdso.c:65:9: note: use '==' to turn this assignment into an equality comparison
      65 |                 if (g = h & 0xf0000000)
         |                       ^
         |                       ==
   parse_vdso.c:206:22: warning: passing 'const char *' to parameter of type 'const unsigned char *' converts between pointers to integer types where one is of the unique plain 'char' type and the other is not [-Wpointer-sign]
     206 |         ver_hash = elf_hash(version);
         |                             ^~~~~~~
   parse_vdso.c:59:52: note: passing argument to parameter 'name' here
      59 | static unsigned long elf_hash(const unsigned char *name)
         |                                                    ^
   parse_vdso.c:207:46: warning: passing 'const char *' to parameter of type 'const unsigned char *' converts between pointers to integer types where one is of the unique plain 'char' type and the other is not [-Wpointer-sign]
     207 |         ELF(Word) chain = vdso_info.bucket[elf_hash(name) % vdso_info.nbucket];
         |                                                     ^~~~
   parse_vdso.c:59:52: note: passing argument to parameter 'name' here
      59 | static unsigned long elf_hash(const unsigned char *name)
         |                                                    ^
   3 warnings generated.


vim +149 tools/testing/selftests/vDSO/vdso_test_getrandom.c

1a9e8743248fb6 Jason A. Donenfeld 2022-11-18  148  
1a9e8743248fb6 Jason A. Donenfeld 2022-11-18 @149  static void *test_vdso_getrandom(void *)
1a9e8743248fb6 Jason A. Donenfeld 2022-11-18  150  {
1a9e8743248fb6 Jason A. Donenfeld 2022-11-18  151  	for (size_t i = 0; i < TRIALS; ++i) {
1a9e8743248fb6 Jason A. Donenfeld 2022-11-18  152  		unsigned int val;
1a9e8743248fb6 Jason A. Donenfeld 2022-11-18  153  		ssize_t ret = vgetrandom(&val, sizeof(val), 0);
1a9e8743248fb6 Jason A. Donenfeld 2022-11-18  154  		assert(ret == sizeof(val));
1a9e8743248fb6 Jason A. Donenfeld 2022-11-18  155  	}
1a9e8743248fb6 Jason A. Donenfeld 2022-11-18  156  	return NULL;
1a9e8743248fb6 Jason A. Donenfeld 2022-11-18  157  }
1a9e8743248fb6 Jason A. Donenfeld 2022-11-18  158  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

