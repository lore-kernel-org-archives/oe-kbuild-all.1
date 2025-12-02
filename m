Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B56C1F461D
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Dec 2025 02:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764641030; cv=fail; b=H0dXPntf9p7HjEZwgci5SYxOB7NvwGL17Ok79/Kuj78fgjAvo3DfvhBt0Fd8M32Se4tSEVV6PMB0xlF2Drm1ednFyd/z0TzXNkNaOs4MEko+MWJjOt3rZbEIVWYkjkAXeo1dtxdV7iMXMWSaO8zbxK+pViFlEsteE+xwkI6MPxo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764641030; c=relaxed/simple;
	bh=LTbIPF4JVoEje5VVTFM07p1utAZLfMGPCOOo0felfuE=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=bP33lKnHOdKhdeECUu8sadLYedIbgjeP/4vqQg3szt74HfJHS6dn7dRln5U6OyQdXPgcKz4QJlKkfVnsq5N8v8lC9BzErDw2sh3f8fGsvoD8FCYTqF++4mHkAP88sf9UiaDdSiUD5xdBmoGPJ8xWg3GV7YuACGYW1lqIZhR60a8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=clswXkil; arc=fail smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="clswXkil"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764641028; x=1796177028;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LTbIPF4JVoEje5VVTFM07p1utAZLfMGPCOOo0felfuE=;
  b=clswXkilVtxuXepxC0iu65711VNloyxFA6NRP61iYb9YSq4UfOV2nOIv
   KQEHmyOCzm+IJXDHoV+m8G8FCmIvbb3ykpVHqKZxtkn7uyVMVQd5G2QIf
   jgawGu3GwufC8PsVXZmRp8Eg48k5AXrBuEyta8oZXT0t5y9Qx5fDKqLJi
   JYX9nCIeiTU52Nm5kh1GbNy/Ccrd0Wvaqs1RCHwopV63YLO2o7qc+dare
   hYuYlNr7aQAy1TJ9t32gEFXjumaAx9fteRAudYLlYlklREYurp5CmiCqa
   vuhURBc3K38sMebSbIOTreQ3UqRjs3pdtfCOTLk75phlU8c9nqsWPf1nU
   w==;
X-CSE-ConnectionGUID: M1BLjuJTTxmyMNvufdDksQ==
X-CSE-MsgGUID: pLO3BSkNR3W24prHssWDGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="65784120"
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; 
   d="scan'208";a="65784120"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2025 18:03:48 -0800
X-CSE-ConnectionGUID: uLdOJJfVTEK3JExevFBDRA==
X-CSE-MsgGUID: xgsnXKWwQ1me+D8HMBYcqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; 
   d="scan'208";a="224934786"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2025 18:03:48 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 18:03:47 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 1 Dec 2025 18:03:47 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.35) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 18:03:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D7zw7dcgyoEzjwPh2Sy+xzfn2/CCxEeLJWIMRQUg34nldClm0BaC/BY6uNs1a0ltrUHLJOIfi16Qbpk3Ns4rKm1TqXv1eaYpICazm1soan1KKFNRuhG5A1e8i1UehQuXLqkgPVlSe/34Q+TmNY6tTf+gHZloiGGE+dLa8L8QihKKrr82Xkzf3B+Nj02KszJ/1lxLcVtyrgO0aduieMSJLWpoWb3YiP2sqsDlRBevvGFlJozirMUs1OHXmFHftTed4qgi8iWx0CSsPgfuGtltG/4bdJx4n1/04u1lTafJdMFw9vtcDTmyB8oJPp9V9cdtC/TRKM0geWLvHVQV8GLi/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sn49XMuKrSMgxHO5Zar2xUvp85pqdQeS8hNpoKsMpeU=;
 b=eVm7GwJrFzkK7WMqDR6Fg/eHUNazQUktr+3wSFiQW8jNbkuq5pKU501LaTKsTzXmxqpxR6amkf2Mk9o43L1FX3VP6UCAcbvKIne2ZVBhFXT2bVEwRMaPU94s8k983OmjGRmR+sZUeqI93SFVzmgK71RnszETYJn8y0az692+RQIqrcayDuL0sZv94BJEwdb9Al2bNZyGCUtN+B9Ie8LLkPS5XIRny8PRK8y21Ak5c1LD0NP8SKrW4adpqW4W5hUYcO/pThXMpgebw6hyQfbwOv1aWYJ47U2TzswOQdGZH5Ak8Hd203nLFzDhKSSEDWIb4fRHv9W59fE7iq7EfuVWvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
 by SA2PR11MB5129.namprd11.prod.outlook.com (2603:10b6:806:11f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 02:03:45 +0000
Received: from MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9]) by MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9%5]) with mapi id 15.20.9366.012; Tue, 2 Dec 2025
 02:03:45 +0000
Date: Tue, 2 Dec 2025 10:03:36 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Novak <seimun018r@gmail.com>
CC: <oe-kbuild-all@lists.linux.dev>, 0day robot <lkp@intel.com>
Subject: ld.lld: error: undefined symbol: devm_clk_register
Message-ID: <aS5I+AvbSbDwrLJH@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0162.apcprd04.prod.outlook.com (2603:1096:4::24)
 To MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB5963:EE_|SA2PR11MB5129:EE_
X-MS-Office365-Filtering-Correlation-Id: ba12d13d-a856-4840-7533-08de31470673
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?WkkL7aCEGs8XbViBOkVhFsLfTo356YXu8tDFIWMbk3LTF4mLZcuO7rqiDuT9?=
 =?us-ascii?Q?e8QxMe69yaREr6kdbxHTQBB/lWEEa8YsxeD3u7Edq7sUDQtHsebzwifrW4gP?=
 =?us-ascii?Q?25e40BHctXXYzE8HtK4opyYckW6zGcnHg98UVTd777yK7U/CLT5vpFGhjSoe?=
 =?us-ascii?Q?yejcGaFaYw+m9//IiRyCcBQ7ln2BW+xjRd6Z1fPA5/2XD0z9KT64J3c2eJjW?=
 =?us-ascii?Q?kivaV5lvoMO83ozZRkvamDgBF4K8csOHUHax1qAW+rkYafTSQ4tM4Nk4//FC?=
 =?us-ascii?Q?A394hDbHWmzlGtx4Z3QU2rw2kgpXLvXblKqk10dUbnb5pGNkI+Q7mZNtDb6p?=
 =?us-ascii?Q?rWYzbeAJrZLw7mocg6pQnBY7LeoAcOM74TAr0U3LFx0LTwdLntdQRFvf+mHP?=
 =?us-ascii?Q?ZHVLhQz98pBMRNrCxMZvQEEmuxzoSNGaGwa5RTxlNb5T21GGLHunqa1BQynb?=
 =?us-ascii?Q?+zcUZ7k4QUNlZWlmnKRRxMGVcBIjDTGRjFjONoPovOd0FYZyJ0vsw3MsZs/W?=
 =?us-ascii?Q?F2MaJEhDd13FjW/BS8W0EMcJzW/AScDHvMVTC97vVcxWApE1B+0BXzcx7vCo?=
 =?us-ascii?Q?Djoqn62xn6R1A8kubexoij525uWd924AE9bCGYxO/JbVS6A06rVKvYIplebB?=
 =?us-ascii?Q?G67Z0XqHqlO4+7jcnVb1FEhAhhCTqH1LZMLiCehHaWiui8Qc6+CeP49I4ilx?=
 =?us-ascii?Q?v1QjZ+cynwa5MwEyaAdEA1Gy1sYEn5/rut7YT+yaxqQ2c5Rn4qc8Z509QxlC?=
 =?us-ascii?Q?IBRg64T8zI12escwDMEkNEW1TkQEWzDznR8ojHUb7upXryEGriCgkrZmbDVr?=
 =?us-ascii?Q?6LP5yIM/4S3Bz7ypqGOIlMsza47t2ALEQRBTQN8yd/P3WBsBKC8rQeaClRwG?=
 =?us-ascii?Q?q6zfLQSlfJ9t5brHvkH17f8a0GMGoWcmiLJqz2G2ub7Qyt/TSeWvYnmb+RRw?=
 =?us-ascii?Q?/8prnv7eT/xwFVERDolnEInJKtOu9Wxb/qtjRyMSk5SM3ZudA+zeeInzXolM?=
 =?us-ascii?Q?XxGPoDsyy9+kADkaWqd+Vl1lIVVH8GljOoK6kF/LHBEuNZ2TpQQmkgjdYWfO?=
 =?us-ascii?Q?4zQy28O0mz3KPNWm/dRhsFU66kNS0JtMxuOMMpaYaDWruVqGMHxpyG7SPIuJ?=
 =?us-ascii?Q?v8cwCyArNmNM7htSCsxNbXIziWFVEso0eyZrQ4fy1iPOa3Jett7NTLzU54hG?=
 =?us-ascii?Q?krbf4Z509LNoxrZbD3Cxbn4oPlnfgs1YYJYFny3XG8Z84DxYJdDVcmCapMKn?=
 =?us-ascii?Q?bhdwq5TxWozCbjNSBgc7C4rR78WnuqEv4tdJ9EWi1L8Ff73ZMsNm2AcR7tLf?=
 =?us-ascii?Q?dO2oWDSYMlwnsSt1nqovITzx7+xeRoPNH8tSW7wSA2uBk1dv6V2lOJcO5pQJ?=
 =?us-ascii?Q?rt/V5SeJcyLyeNxwsoZEOZ5YCPG547KduBfV//m/+Xbnu2RvkiQUgMMpoyK7?=
 =?us-ascii?Q?l62Zdq5rGfei+PGeUeHxo+zJQPvqOxibm0w7Hw9oVT4eCfwmZeF36A=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB5963.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qmTSq/R51xthr7j3XeyRrG7KLLebmJm5fjwumd0weWq78XCzBBLfYL8GiDMl?=
 =?us-ascii?Q?IBOUByhF7fxEhIV7U1nYGuTB3rLL8mnvaUeOpgqXkCz/poqHcPwHILs+bC8v?=
 =?us-ascii?Q?UNqMe7Ct+clrsZcGs9IznYzIlyAGHnr8A8m7e0gr/8n4G+ScXd3lI5+ZAYsC?=
 =?us-ascii?Q?cl/RQBFg7KQh+R7UvtIIwDYsQuNBxO/AJSpWhAR1pcewzYSHAZc9TtEdIW23?=
 =?us-ascii?Q?EUBsuoEPS2PuggUGaaOWJXZBTJtZW/qxsgYMbqveYQUV+haJDNzOLWoJrzTh?=
 =?us-ascii?Q?sAucAg/XlrWXD71s0iCwmfebGN++GhcAPvnoFdH244gihBaGO4raqgBVxOKi?=
 =?us-ascii?Q?2UR3L+MhXVO4KmIKYEzg3yoi2b7q58A0ZRyd4+FejaSwjAOA0tngoa2OQrgY?=
 =?us-ascii?Q?n1f1AL2c9Yjs5E7LeFYcF1ry1RLgTVsrYmuntbEk76vw1FFawQW+BguVhjl8?=
 =?us-ascii?Q?ZvuOSmJZ1RL6Z20Er71twlFxHb5D5R0IsBosahBHrEBXAS90mHfGletlFfYp?=
 =?us-ascii?Q?LMp5vAyom9I9ukFQASQwHKx9NIiH1dYRaPf6qMsgnOxmxEdIbYBdFybhp7rb?=
 =?us-ascii?Q?JPCiZ9ElD9vsysOTwVb5alXITciUnrfThonrrq61E2qRlI9yanU3nnePNxf9?=
 =?us-ascii?Q?zufwQrW0CxHOVjVjj52R3D7MSkqAL2D8A6WWwaFM8EN6vOwIsg1nUo9us+hv?=
 =?us-ascii?Q?gqZh2l32kFZbfU8VAzUqz/v+BWVx/PxjU16IW4VYuy2ZrLNrhNOgIvPluGuW?=
 =?us-ascii?Q?/rs1/3fe8YSZ5lAXMsUwqjLy7wF1WtBn0kDcdHzUEzk6HAOEl5yjD2U64vGm?=
 =?us-ascii?Q?eGTxqAfJGF2vDkQJ4D70ThIfZxLh+dENuIW9/T9IRtct6kzVx3mS8h6RYgc2?=
 =?us-ascii?Q?bH1EdZ1Khsn7KLJ+uJnouzvxQE8iNzuHuFiKfPZGnnxyLI+A6QufJSb4mSvW?=
 =?us-ascii?Q?fJ/tITk3B5xLI8MHgPYpQPpk73z+zNnL7nWvwO2rMMQyT4fFBx9hOmL1rZVk?=
 =?us-ascii?Q?/23YfDcw/zKk/zQEZg2E/TV4+vsX6xXBvb8iavtD+R0+PXpOm4xNZwGz3lWn?=
 =?us-ascii?Q?FJ1IQI6yMJQKdcIKJ9TBLdRu8OH8nErr1DwUyB5obLXgu4oj2nTEI3/ZV7bV?=
 =?us-ascii?Q?+augtOFEIvj27ys97+ded1olnetaDgGecb92ohhuckhK5pbmOmkdPMmVBgOm?=
 =?us-ascii?Q?grQ8/zxatusJXjr+WKQQKJydyPaH606sn7PoM6gSeVVphyk6wNbXeTKnk6Mx?=
 =?us-ascii?Q?mlNAweguaeRMUqwTQ24Gwnce8t53sVMHJ4Nr8G20GTPXa3YyGWP0dzVarVAe?=
 =?us-ascii?Q?BcOGf6ROv0opov+yCPtLnt6c+t5goZRrQWEUXO1VahD5q3ZO+On660Vbk4cv?=
 =?us-ascii?Q?regzVyUK5h2GVS6Kw1ZptXT2wAdj83ExWt+O4AAjCbgb2MGNlDbtMTg94trc?=
 =?us-ascii?Q?DHVlqk5oBPPepNjWpU6DPBCtiIeVt0b6gCioUnmY8i5cv9hm/AHw9mZn4vrO?=
 =?us-ascii?Q?vAc7ULRVK15VZim9zBFETEJuuq3LgA1JKZBoNWUShAaqGZ7TUuJ256QOpVOI?=
 =?us-ascii?Q?TGpU8TTvWivsTV2P3VYpeOjovMw1WRepc+Mg1Q9IFS2hwrH8QLxImSRduRuJ?=
 =?us-ascii?Q?jg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ba12d13d-a856-4840-7533-08de31470673
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB5963.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 02:03:45.5679
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZiY+kawQQShDzbEGu46rkEUYTeNve8QYTlCOGgLeMwSAkfgb4pOhreHMRZ/A2fUqq5PS1OxA5swVybCMl9h20Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5129
X-OriginatorOrg: intel.com

tree:   https://github.com/intel-lab-lkp/linux/commits/Peter-Novak/clk-hisilicon-fix-compile-testing/20251201-054942
head:   a5bd6f8973e4a0aa13b3e1d43790a85fe6bcefe6
commit: a5bd6f8973e4a0aa13b3e1d43790a85fe6bcefe6 clk: hisilicon: fix compile testing
date:   26 hours ago
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251202/202512020030.AsUoy1EK-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251202/202512020030.AsUoy1EK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512020030.AsUoy1EK-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: devm_clk_register
   >>> referenced by clk-hisi-phase.c:119 (drivers/clk/hisilicon/clk-hisi-phase.c:119)
   >>>               drivers/clk/hisilicon/clk-hisi-phase.o:(clk_register_hisi_phase) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: clk_register
   >>> referenced by clkgate-separated.c:109 (drivers/clk/hisilicon/clkgate-separated.c:109)
   >>>               drivers/clk/hisilicon/clkgate-separated.o:(hisi_register_clkgate_sep) in archive vmlinux.a
   >>> referenced by clkdivider-hi6220.c:149 (drivers/clk/hisilicon/clkdivider-hi6220.c:149)
   >>>               drivers/clk/hisilicon/clkdivider-hi6220.o:(hi6220_register_clkdiv) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: clk_register_mux_table
   >>> referenced by clk.c:160 (drivers/clk/hisilicon/clk.c:160)
   >>>               drivers/clk/hisilicon/clk.o:(hisi_clk_register_mux) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: clk_register_clkdev
   >>> referenced by clk.c:173 (drivers/clk/hisilicon/clk.c:173)
   >>>               drivers/clk/hisilicon/clk.o:(hisi_clk_register_mux) in archive vmlinux.a
   >>> referenced by clk.c:235 (drivers/clk/hisilicon/clk.c:235)
   >>>               drivers/clk/hisilicon/clk.o:(hisi_clk_register_divider) in archive vmlinux.a
   >>> referenced by clk.c:272 (drivers/clk/hisilicon/clk.c:272)
   >>>               drivers/clk/hisilicon/clk.o:(hisi_clk_register_gate) in archive vmlinux.a
   >>> referenced 2 more times
--
>> ld.lld: error: undefined symbol: clk_unregister_mux
   >>> referenced by clk.c:182 (drivers/clk/hisilicon/clk.c:182)
   >>>               drivers/clk/hisilicon/clk.o:(hisi_clk_register_mux) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: clk_register_divider_table
   >>> referenced by clk.c:220 (drivers/clk/hisilicon/clk.c:220)
   >>>               drivers/clk/hisilicon/clk.o:(hisi_clk_register_divider) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: clk_unregister_divider
   >>> referenced by clk.c:244 (drivers/clk/hisilicon/clk.c:244)
   >>>               drivers/clk/hisilicon/clk.o:(hisi_clk_register_divider) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: clk_register_gate
   >>> referenced by clk.c:258 (drivers/clk/hisilicon/clk.c:258)
   >>>               drivers/clk/hisilicon/clk.o:(hisi_clk_register_gate) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: clk_unregister_gate
   >>> referenced by clk.c:281 (drivers/clk/hisilicon/clk.c:281)
   >>>               drivers/clk/hisilicon/clk.o:(hisi_clk_register_gate) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: divider_round_rate_parent
   >>> referenced by clk-provider.h:1445 (./include/linux/clk-provider.h:1445)
   >>>               drivers/clk/hisilicon/clkdivider-hi6220.o:(hi6220_clkdiv_determine_rate) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: clk_register_fixed_rate
   >>> referenced by clk.c:98 (drivers/clk/hisilicon/clk.c:98)
   >>>               drivers/clk/hisilicon/clk.o:(hisi_clk_register_fixed_rate) in archive vmlinux.a
..

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

