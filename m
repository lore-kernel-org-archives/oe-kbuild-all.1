Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAA42E573
	for <oe-kbuild-all@lists.linux.dev>; Mon, 12 Jan 2026 05:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768194553; cv=fail; b=AmhGmMn+iP9mlAlFYfijgnqD0uXDnkmPJgbTTO9tmqF6chWgfUTtWcg7f9YpUKtrlVpRGi6Qcq+g9CLudYnAuCiFalf5TEDVkgHEJOePx2q0eqxDn8Xk1fuHdkoWR1CQktxjYyMmF854WpUPt9hpX6Q+u1Sc17fGzZ1nWPBF51s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768194553; c=relaxed/simple;
	bh=4wDFuSTOiMAwMyhtyRIH6j3K2o+RyVy7T39Ch73BNug=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=byP/J8PlCq5kBVCDGPWbO1Sl2ccHUrL1oa9EuIFnItjE4OaBOkQ4Q5Dgk3MBSiq4z5VSIYIXRhNrpt6Hj+CNKoh69GuW6AVGV8Szmo/ggkD5HUoGsX8mUel18bFS2mIIWtWoIpY6HvKXlYMxTCAdRijbUFcHSJ1IE/d/fzD+Vf8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mpb/Ygnr; arc=fail smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mpb/Ygnr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768194552; x=1799730552;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4wDFuSTOiMAwMyhtyRIH6j3K2o+RyVy7T39Ch73BNug=;
  b=mpb/Ygnrofm+6KmTlIg4/SnQb8AF6nrN2ZRN5AJfoQ6ZjUITnYhiRD+l
   sEWFHbaPMgSHbForZT1JVpESwqqY6RbMdBFH+sPOj9nCWaf+DFVKJyA2W
   X/4dQkxpPyQ7a+8Elf+eihdUu3bV/NysV7FgdqGO//8X9L6DSru0zRTJM
   +m7uW3Hj+kvGGoCRFiifvKAgucEFGfXP2vnk4+W0DR/X/2qxF8NLYOotg
   JMkcqoAW5G18FFOgAgbD1Z1emmuOxJ35iTT/hhUF/49XL6TAVIOxinAPq
   j9G617P1MPWUa3L6NsAeoiM9bzxolBOtz9mFnEDHeP8UL60+SxRisqtKa
   A==;
X-CSE-ConnectionGUID: gwKtyGiGQWWVpI49Yacbuw==
X-CSE-MsgGUID: Pk5980doSPaUUQXLhLPt1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="69621289"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="69621289"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2026 21:09:11 -0800
X-CSE-ConnectionGUID: RB0Et3CzR8u5HsCuvjrPXw==
X-CSE-MsgGUID: mKdkPIQLQZG1iHgqzyd9Ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="208831835"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2026 21:09:11 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sun, 11 Jan 2026 21:09:10 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Sun, 11 Jan 2026 21:09:10 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.13) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sun, 11 Jan 2026 21:09:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q4M8HuRh+K1hZzp6v35QMnXCKW5msQg4qewH9hZ42gCwG3U0t35dPpkH34765XwomOmKYjL843jlMi0xsLb6UfJAGSQnfr+jfginxrDDzYO6vybLDlISOLZC3WfBbFdJl1w9b9K29sITu7vBg9cHJCzTrI0APm7EZRMW3lMJZzJ1T1bk/ImuzGWVwAgQLiy03tZx4jdqOR3XosY+0XVrRxdjH2WMGs0zkdG7NZTmMUakykGV56MwV70k6EcMdgblu6m1axudZTjBdxo9fyQseATkj0RE8F4i5spRF9Ga02WHiJicXB/LkkfxO7m3y+KCaRGwahqhzCdjz90YUp4OLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vyoB1qNaqyZUV5oYpsaLM/y/63fFKSl6TPJvtRIozQY=;
 b=jdzxbT6JtEb1RBqNvAXw0rDsSmVsOrmyafJiydJh9K4TLpQ2yl0xYO/3rf+goNssxtslAT308L9zcHJ2e2OxteAqxpLXXX6JMKAZCNDZ0IvAoUFCi3TGWBEgD2sXFlByjFy7cmwuRRlvRTJGT3YiOfDUzPEqCpQkESRlMJjJn4bUpbpB0q/UT/7T0uvpHjslR07HxZpWtIYBi73wLMsWDFvv0vrzhNTm6O45xomYyvChmjQ607cy4IRpKmSGUg9ei3RgFb2BSzdQVVCMtqwRAX2AdZrE2bOy3qfXnL0usqCJHBhBTLcWdtL6w0seFFL3E3WELv7nOngWzwTdaLiElQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8468.namprd11.prod.outlook.com (2603:10b6:610:1ba::19)
 by MW4PR11MB6838.namprd11.prod.outlook.com (2603:10b6:303:213::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 05:09:07 +0000
Received: from CH3PR11MB8468.namprd11.prod.outlook.com
 ([fe80::8188:d688:bbca:2394]) by CH3PR11MB8468.namprd11.prod.outlook.com
 ([fe80::8188:d688:bbca:2394%5]) with mapi id 15.20.9499.005; Mon, 12 Jan 2026
 05:09:06 +0000
Date: Mon, 12 Jan 2026 13:08:57 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [nolibc:for-next 22/25] nolibc-test.c:784:9: warning: 'readdir_r' is
 deprecated
Message-ID: <aWSB6RAABDyRS56l@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0159.apcprd04.prod.outlook.com (2603:1096:4::21)
 To CH3PR11MB8468.namprd11.prod.outlook.com (2603:10b6:610:1ba::19)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8468:EE_|MW4PR11MB6838:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a08d1a6-3005-4715-14af-08de5198b5df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Fw3xg+7M5Kq/6KBU+26StkOEg3MGLa3L1t/CdVfgp65Xds6IX3gO5wJTfhfm?=
 =?us-ascii?Q?B4lMxiqe2UUXTIIKCf9W/8e46ecM3H8ZJ3xL1j1UBI2zCszEqUrfLBHjBpmm?=
 =?us-ascii?Q?LvS8SXYhzaicocw6z6unwEn+J65STdZ7XwgBe38Eh0msS6rPO9K+LNL+FBDY?=
 =?us-ascii?Q?VnKt76eK37niRMBUqbOxuUF6QFdQ4cnePxB+btt5XRMfdQvaSNOvD4dOvwMW?=
 =?us-ascii?Q?jdp3JTY0xwblA58G1aqsjvhZiklnsCJvnqghext7D/VFPIiA/G0pOYLjKfD2?=
 =?us-ascii?Q?sQ+xSihrpxifJNCKaBGuw5weYomGE14vXaut5sQHgohGtTDniZzDt6YA66dU?=
 =?us-ascii?Q?SJE9Qzha569Btj/4Hg7ADd308vpFElaEb/va3d5QoK5F5JcWYfimFYPlJ+c+?=
 =?us-ascii?Q?ttM0qSiWlFmnmxh2qO5m0PKLUt22GCnf2NM0CFxsPaS4iHeGyWsryRnbLoT9?=
 =?us-ascii?Q?cGVWkbyPTsBA3nZTWaue40/GZH4QbABsaEStZhXuT64EE7bK7mYq9onm/x0P?=
 =?us-ascii?Q?XHphQdoXdmw/MdaoQXmLNYYJxbIfktXg+rj0bdWPlRCdN/pPow4M2HPcv/uo?=
 =?us-ascii?Q?6+fmEv3yeh+GVgVOXOmlRButwB0cZ8Aki4u09FakXAkLXugNmTRKxZ6OLg/M?=
 =?us-ascii?Q?Gh49E8TS2KdQAWLq6HVkXcXl3RPfLh9+PVzeDsVxOG3zBfc84UD76Wqwqwrf?=
 =?us-ascii?Q?9lhKdagPuQYjD7fHeyj7FHIPu2SPkvb0Ih94Ip79lMBp0NrLx7q+xQTKtAGn?=
 =?us-ascii?Q?q+0ko3nOKKoHdqABbaATKxRNdObHu1HFEqVRpUrU0c2TjGQtA/z73ulEQNme?=
 =?us-ascii?Q?H9femPbe8MyazYmug42tkt00O54eLv72dILSRT3HZahCw7+IxxpmfQ1b8S6V?=
 =?us-ascii?Q?h//4Y3f55pVMAbJNnHXQrmuXOpGLL1UMqvXiU1WlNRfnN86qCqKpmw38AGFu?=
 =?us-ascii?Q?ZapTJM6anJJFaPP+drGlDtg6KMDstUQc1KyhWXO2zFTfCORXRXuUlX+9JpcC?=
 =?us-ascii?Q?lT35RpMwV3BU6Fqs4+nVn9wYzKcrQkm7v8/2Sue5gTdBNuecWwhYTugLVONb?=
 =?us-ascii?Q?XcjykaJQxrwPjFt9nMlLrJnKr3RhipslP1IR/ESDFEcsvfCzRrepzy5G3EPh?=
 =?us-ascii?Q?hC6PpPW2E1zaaWQBcryPhR7s4LOBfmrwSrHPxz7QK6Sunuk1QFd9CEWQakO2?=
 =?us-ascii?Q?9sDLInAH7m1i4yknIV1EDroumoN6723IZ4Ya2LslA2DrgYJK9pxs0H1F7pBC?=
 =?us-ascii?Q?DG0IrGrZN4z7saXYmzxsR0ZlZ5aVil9ejgNrJiIA3U//NO4Np3sbt9p7QM85?=
 =?us-ascii?Q?5Nrcu8+dIsjsQBaBT5oExD0/hBk4+C57xYglQMjg+r2rcxOk4MqLUdjrEaoy?=
 =?us-ascii?Q?WEJW0tDIhahGqxU+P8tAPUmY35EWuKROnLkNjcNIRu8Usq3UTJyaGCnrL5fK?=
 =?us-ascii?Q?l6yayU48Lt2IHkMB7gjSlanzkOePoWYyxqHRkzsVkJWe/jGkAU++NA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8468.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CnLHZZLUvMoFUmk0KlggFBgMKpnhc/4qHJCXitHsWdsN7DLiNmKg2wTmxKZE?=
 =?us-ascii?Q?FxDFJ91qSMHSMIQeWQ0rC6jXsmMbID44DvV+YRAdu7M6i86FE+ob2bvc6p0A?=
 =?us-ascii?Q?uU1q/2/RCCrHj/nsVm/Ff/Bqmm/tsCz/vJwTFvFNJvke17veWCMFBAk4xlC6?=
 =?us-ascii?Q?8co94GTbaoV+h2dyu7Os25pKfxsaLH2FYcKTNBizGuuhi+X3GuVE2NrQ6hra?=
 =?us-ascii?Q?lNZ0VlNbkn4LSShx8K4gf/mIMPFRsz0a/ECo/obhIt22zvC8SQS26M/E5VTC?=
 =?us-ascii?Q?Li30xqgATfPUP891C/4PLGLMip/5DHWdP0w9bPpibl+ln/fdQBv/AGZw6ce8?=
 =?us-ascii?Q?FFRMd9XB9u6Mzjt85HKJUZeBOc39TJhK2ne0yED9NPvhGOH1nPEy8FO1XsFq?=
 =?us-ascii?Q?GbBhC+/zVYLo8why5kJdSYMA9dO48WmADqpIqW+uhRyGm2OqpJs03SCJYWs5?=
 =?us-ascii?Q?5VflgvxA8FBi1T0WdhotONzWmCc1v9oj+VUTGLFO1/hUD0jQMOdfUj9kIoiw?=
 =?us-ascii?Q?mr6CS5OuuCMefY1ROKXTq1lJj3aPoiOehUzbsbKoYXagV5c0fFEKbasmlvlh?=
 =?us-ascii?Q?7v5dMCJ5usHz0r2gshb3Wk8F1+Aq6cABRW6L4ei+VXmMkEF0Qo7viQqsDJa2?=
 =?us-ascii?Q?B3/kzdI4FMqcvn6ZSH4m8t8+oDNQTew00fVhIN4UHpryDAIzebRfvum6PM8f?=
 =?us-ascii?Q?Xx4CoBKdOyTh/OAhOMsITL/GsdVI307pdmq0P+ytphuMKBZ+Jpmgp8YMKkxS?=
 =?us-ascii?Q?tDIYzIuPeH1MowLPxfiJK08YNDB99qcMNABC3XCFdINJM+CeHukZrPQBge05?=
 =?us-ascii?Q?EXYfqAXan1jTFjTrn9C5zubV0bmjjlsnOgmqc0+yAqpqe/Vwrk8+wImIFS/o?=
 =?us-ascii?Q?imNHjQynXhBxp1jFjHTpRFJleOivQZnThJ+ke2fP+J2tbBiU9h+mJeN2lwSj?=
 =?us-ascii?Q?0ILgwhrtteohTu17Pl1RaATP4DKVACYvPkdk/072mwDiJBGdqDWyimSogUsK?=
 =?us-ascii?Q?uS9MsM+Of0dfOmpsmGfUsXasuuDuWZTBUpY3OTROlVvBbmZLiEwGbM8DIdlT?=
 =?us-ascii?Q?U1fNd3KeiqmGCE3TqXGaqYFRgDW4myIdHkSB9Lf8sb2uxhoXXJrtCnXXDUDO?=
 =?us-ascii?Q?xJBuFsaVTxkiadFZRL0g/Bg45buREqG8ND6N1dbQO0eC9aY1QFeWe9/1Yz1a?=
 =?us-ascii?Q?nm8OeovrsURcd3h5jrjCT6YOz0FrTBiw8a+7GIldYAHpTySFkricmPixSQPS?=
 =?us-ascii?Q?7nmV/5wt6rgPcwb2s6FEC76sSRVVSVrbW4F8l8+8TMOKlrrSnOO2uuYan6+b?=
 =?us-ascii?Q?R202fdg2QRWh0KvgSVbPtYQ/0W0n8jvUnJLVhO8+XO97dCc9mfmmWUVfNk/j?=
 =?us-ascii?Q?ghh8KOWe2qkZsC2YDkK3ZQV6XOPbnh4Yka0xjtqnBKP9EW3IzoOsaoJCIsWa?=
 =?us-ascii?Q?NfEbJlLWYxDNvs3yABEUgrwsIe6xIx/tLO62nT/RplHeA9FXOLS4azFGG3o5?=
 =?us-ascii?Q?z0NYvGAoQkpce64JS4tn+gSQQo7cHxdiHJj5CTnNNmGVMqCfS3uPwquErTz3?=
 =?us-ascii?Q?pyfK2g7VBQGrnqLXA4lnfORPOAmut8CHpoIl3ivvlVwJ0RmsREfsxM/n/ing?=
 =?us-ascii?Q?AvGGgQFR2BVuFZcDC7mYy2mof8xAj0yGMv8FAa8keLSmvU8K8/sVPlGO3HXv?=
 =?us-ascii?Q?mcBPLL0CEc4/ejph82pRF0Ra7V3x02+NFE6dqQ4btPNNv+C4LYlOmPk2diRg?=
 =?us-ascii?Q?uCQJzofcKw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a08d1a6-3005-4715-14af-08de5198b5df
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8468.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 05:09:06.4767
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N1luVGS63h+WJxbe5erggsabKJlFZKVL4+hBC8Hb/nDtOB2DzK0c9DVM3D+fxeqU0PmFMYLDRsCc26V12FGixw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6838
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/nolibc/linux-nolibc.git for-next
head:   a5f00be9b3b07d92c6689997403851a32e1874cc
commit: 6fe8360b16acbfb50c703f52568cad46759be2ed [22/25] selftests/nolibc: also test libc-test through regular selftest framework
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260112/202601120351.v9dJgXNm-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260112/202601120351.v9dJgXNm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601120351.v9dJgXNm-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> nolibc-test.c:784:9: warning: 'readdir_r' is deprecated [-Wdeprecated-declarations]
     784 |                 ret = readdir_r(dir, &dirent, &result);
         |                       ^
   /usr/include/dirent.h:188:28: note: 'readdir_r' has been explicitly marked deprecated here
     188 |      __nonnull ((1, 2, 3)) __attribute_deprecated__;
         |                            ^
   /usr/include/i386-linux-gnu/sys/cdefs.h:510:51: note: expanded from macro '__attribute_deprecated__'
     510 | # define __attribute_deprecated__ __attribute__ ((__deprecated__))
         |                                                   ^
>> nolibc-test.c:930:24: warning: self-comparison always evaluates to false [-Wtautological-compare]
     930 |         if (st.st_atim.tv_sec != st.st_atime || st.st_atim.tv_nsec > 1000000000)
         |                               ^
   nolibc-test.c:933:24: warning: self-comparison always evaluates to false [-Wtautological-compare]
     933 |         if (st.st_mtim.tv_sec != st.st_mtime || st.st_mtim.tv_nsec > 1000000000)
         |                               ^
   nolibc-test.c:936:24: warning: self-comparison always evaluates to false [-Wtautological-compare]
     936 |         if (st.st_ctim.tv_sec != st.st_ctime || st.st_ctim.tv_nsec > 1000000000)
         |                               ^
>> nolibc-test.c:1391:54: warning: null passed to a callee that requires a non-null argument [-Wnonnull]
    1391 |                 CASE_TEST(stat_fault);        EXPECT_SYSER(1, stat(NULL, &stat_buf), -1, EFAULT); break;
         |                                                                    ^~~~
   /opt/cross/clang-87f0227cb6/lib/clang/20/include/__stddef_null.h:26:14: note: expanded from macro 'NULL'
      26 | #define NULL ((void*)0)
         |              ^~~~~~~~~~
   nolibc-test.c:369:22: note: expanded from macro 'EXPECT_SYSER'
     369 |         EXPECT_SYSER2(cond, expr, expret, experr, 0)
         |                             ^~~~
   nolibc-test.c:366:70: note: expanded from macro 'EXPECT_SYSER2'
     366 |         do { if (!(cond)) result(llen, SKIPPED); else ret += expect_syserr2(expr, expret, experr1, experr2, llen); } while (0)
         |                                                                             ^~~~
   5 warnings generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

