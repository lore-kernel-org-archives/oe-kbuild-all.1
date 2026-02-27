Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FC80348862
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Feb 2026 04:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772167703; cv=fail; b=KytDpypY/1gwbIZfGb3Sk932bjahUG3Lf0Rnn1lruIYPQrZ6KhC5N/ujhQYNpEgBf3ZCC2hh+NuFbAWfBoCN2JTJmi2Z9A7DuEnNp0RUbiibwaC/fJjC8pRgYoFmmghDST41QytgMlluJZXbd3pZVqfNxc7u3KGoidWNwJNnY0U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772167703; c=relaxed/simple;
	bh=hxFM+KPm05ZNDjAWflpT/+/HptFiV5UmopcQ+n3hmQQ=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=d9X8eS4v5M1D+QIhF3zF9t7EohtfmP5eItTfqTBrjJYXPCH5/wUtnElbZm5EMiXdxOe1r8I98+af4QvKibQ4p+OqDnIDS2m+7DFI/JfuirfCxFxCqxCXtfVx0aZvxlucNI50FX0B7FyryxsuWMVzxfb4mikbGcJIO8xFDR8CkEc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N409sMd0; arc=fail smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N409sMd0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772167701; x=1803703701;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hxFM+KPm05ZNDjAWflpT/+/HptFiV5UmopcQ+n3hmQQ=;
  b=N409sMd08R5kuVDrnWpRjmBJAJSvt4K/dDLDYWNTI6ZVF1ekHgynco+y
   vPNmh+wyJicRIzYtd7xR6vYtThPdGpce29b0dbh8D9Ow4somGXBmo397Q
   TY7GGl3kG0dzixW2Yvqh7rcW/opyOK6ylj0mOIpcYuRn9ewdyRGYfhpHt
   RqlmNMqy6FznYSNXVx8xgCJFc1k8DYbRPHPW3RQMaPXGtnTQL0tlvFMNt
   KpFqNJYRnIiYXBTG1iaoXQvl4vHGcvZbiczmFp28IOVO7SFdo4d3+VnIs
   hC5UJAbCX5M0WevzxIaoiUe4AnkNsqRbF0qeaWXkhG+0MzqIGRSTA9kFS
   g==;
X-CSE-ConnectionGUID: KgoGEUD3S76chV+f0jcN+w==
X-CSE-MsgGUID: U5qb97uCR4iIcHyBemQaKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="77111917"
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; 
   d="scan'208";a="77111917"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2026 20:48:20 -0800
X-CSE-ConnectionGUID: oQWIZ/AASWiYSqcbXK9s6Q==
X-CSE-MsgGUID: WR+EnrAUQDW7WeQuxPEkww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; 
   d="scan'208";a="216692724"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2026 20:48:20 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 26 Feb 2026 20:48:19 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 26 Feb 2026 20:48:19 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.11) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 26 Feb 2026 20:48:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=be3TQhK0BAdgSM1PGuI3tuU0+R5M1cA7EOGZ7GPwjibE1QfuZrU+k1Jk1vlUL3PcGsIMsXe+hjbFyA/OIrtoJk4NUX2o48/SQrZ4/JI8I5lK8uv3hx9QOxFW53wl5ZMDMq+q1aUSrjnTygcoFngisp23TssBE367n6KyvryBlD6tUcRz5tt1mwXjA/2UXd6/ShrrC97Cus0+WnvxAhKkh+ZHqueqah/AsHVfmp6fQ3QwUZV6rDgQqFKvm5qp05FPzPz7TI+hFzJMOEXTjA9oWlDLc9xztWmEeJmnK/B+0WuD9S6Tz88um5rvMn5dVDwD+STLZCHNFw8v6bFYEgbFIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WWs37xHvCiILV1/j8vYTceO0sQgGti4tRWnq4jRU55o=;
 b=IGMeelinDTwkjcPjD1n7K+mZ0GtEPBO1hBRujHGQCAzmrcaRDIu4G/I6LOsN3Z+8P2zf0/1FlG0+7IBmxg2UIEi33ShSfmZKzd8R5nN2Kcd+oi2iwtg9AvddasyBQ4fN1JLq2kH2uk9e1Xa6agjnFy1DOo7DydQeWyFJnw1US2TNN4kSElMa1+vHM/E+SMQhk5MFZW4oINhnCznrIs8JEN2G90Fyi3a2jSmB/NLhdRpkmtQcmQ+9jM/hJZvZUEsGSiO3rOfHHIqtrKPXT6OxwZeYF5n28URdqggADeC7BZ2jtJR2V103NxS8AfoeQcYC6gKl20ElAVQlfYzehHCy2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8468.namprd11.prod.outlook.com (2603:10b6:610:1ba::19)
 by SA1PR11MB8376.namprd11.prod.outlook.com (2603:10b6:806:389::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Fri, 27 Feb
 2026 04:48:17 +0000
Received: from CH3PR11MB8468.namprd11.prod.outlook.com
 ([fe80::8188:d688:bbca:2394]) by CH3PR11MB8468.namprd11.prod.outlook.com
 ([fe80::8188:d688:bbca:2394%5]) with mapi id 15.20.9654.014; Fri, 27 Feb 2026
 04:48:17 +0000
Date: Fri, 27 Feb 2026 12:48:09 +0800
From: kernel test robot <lkp@intel.com>
To: Conghui <conghui.chen@intel.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [acrn:6.17/linux 4/8] checkpatch: WARNING:BLOCK_COMMENT_STYLE: Block
 comments should align the * on each line
Message-ID: <aaEiCVGFcZxIyDZC@rli9-mobl>
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
X-MS-TrafficTypeDiagnostic: CH3PR11MB8468:EE_|SA1PR11MB8376:EE_
X-MS-Office365-Filtering-Correlation-Id: 3704a024-3ec6-461e-034b-08de75bb6c47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: WQrqO/X2ZzADuq9jx4gisx5sHsGY9cgfIprROOwZ7VAK04oh5eB3G3T/0AADe7yCv3GpXT3p77G2M/B6gFAIREsNUGRS3AAtDpzKxIXePNEM55ukRN69dDQqOC5dGxiPXhZ1b+C9obbvPcvZODzEHspE9cV9UbeipNbMudDSuS70iIG1H2Lfg4fJZWH9d0bLnRyHEzqqewOex5ZoJGVP3Xb38JfmVBxWaA14ZaHqSvL1IjywCn4gUmYhpCfhzV3pfTREeUn8bDsvGpfG2tBoW+uYlm5vciP/oqYlgKu1u5kptxBzCqKulMEFijYfXOSZJ9ozkTWNVpyvdEemgHId79xZxWKTPoFGJo0ycY1Rarc8NOGV1rcmuBMH+01z7Z+xHmbawG7GhAgSfjsdape1QpVPXulFrM2Gy9IxWR/k9jPTGNxItGftVaqKfGgnTATKn7Tn0XpeNGm0/XRoXvGq5MDjtVyFcvPJGbfzP0t1+wHohBm1eH6rDzeG8BHvhdtJyEetxU8J1eeedj96Ut1tj1MAjzxns6ODOGSPkLcx/pSXY3YC3M2g1g9UbmGZmi9o2La78SFZcXQxIvbgF/rzr4KijqKpfDM4QjZBmjBTHdJ2q6B3XbpGjPntaxdTKj6+aYVAtaK1YUyfV4PoIQietQqyw6UFxhXqbtM2HZQ3tvgoeODslm3TFr0NWZnxvt+A
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8468.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?m0QaHh7uHsjM+CquWiDqMSh8wdsDYODVq9llYADEZ1SyJoaJihn/B/r7v/3Y?=
 =?us-ascii?Q?WSk5232OV0bGAv3kLddHo7VnvBAUJJycUtkHhlF2Vj+3ALyH5UG2oRkYo35b?=
 =?us-ascii?Q?fQJcio3qao/xpxAAcE+F6fbPuudoRxIVFobAeqpNPSTr9LEaQ/goowPhY3IB?=
 =?us-ascii?Q?GMtwH32jdxXJ+ZXXkm0eY7a66FPl2KWTqQoMZi32jKjt9WEodoGCGDap7S2I?=
 =?us-ascii?Q?HodymWUt0bvHWU7Af08qkGdzoM6px3HuoBnDZl+fLyUJ63sDigsZIE4170vL?=
 =?us-ascii?Q?A09+scOVo0SQGIQWtAc3pJble0/qLV7BkUpqnkDQQWPt7ph1RHPkAGzzEWTO?=
 =?us-ascii?Q?P4T6gLiK2hWpbosFj95n1EGHpvuyU5MBYQEpBC2NyiQhV442WPS8yTLS2tWV?=
 =?us-ascii?Q?VV3L+vni7yG1IuRTAXsWRN6ahstxF+0Bcr6elgOIKZpQabSE3JQ1ENp/VA/K?=
 =?us-ascii?Q?TmI+/tep1/B5IkonzFgEubSDjjoh/PXrt5WfMcMcZwrl3IzDOYvUtARC6wzq?=
 =?us-ascii?Q?aKDxPPOdyEfTXYTjk4U9fqliU1WT/mWBNRTCHcvtkZdqPPNdUwW8f0zSEo1a?=
 =?us-ascii?Q?MKcfM7V6At9HLF2vAaUFn/8UU6UstV+Py2oA8n8rRG8WNT7lCbMbNbhz5k2P?=
 =?us-ascii?Q?+e3efPtwqmE/vcOLiYfzUgygyFxc8RrjgASUHTqIwnKPqcRzTtNcwEaePCQm?=
 =?us-ascii?Q?4a2gSLC413cwyJ/orud8G2vruE/G0TA0Qb1qS3EvRP/A/Oji8XVZPxIGYh/5?=
 =?us-ascii?Q?HB04gikI4J4xyBagLI/eGrTn6XHU/MWc34XOruuj9G88etmmetfswbBKenCX?=
 =?us-ascii?Q?TK5Be9veWJ2E/IWhoBqR2QF6PgwDTMVnDX05d69GEXScCDlzBVW3PZgTNFC+?=
 =?us-ascii?Q?eGRUe/ZO7zwIHCD/hTCkavvljjnERUx5GjNP5gy9k3a2lj0sIa94WCitDEnc?=
 =?us-ascii?Q?HDK19gxWqybLxhhYRKxDqttGljueCPHX3QWGOJdOEZ1PNpvI1QfZrq3q/oXY?=
 =?us-ascii?Q?m5CNZpyZDnedmfVqFeE3kMUrfJy2Dml1E6pl9rpXlw3+v26To1cFwUZdBzre?=
 =?us-ascii?Q?Zy3aQEIkUdM5xmzjRRuCrfFbbJLtxDgAWRU0CARHEKeOEiKc5JD4M85iawTv?=
 =?us-ascii?Q?g9kOMFOGsEQQKzvJHT5wAj80s/cqX15rD17iWnZ/mWlKU71Cw8a1Q6vUnn+r?=
 =?us-ascii?Q?n18n4aCE3imnzdj3ny8CkDX5Euy0uvJ7T12FD36hs9tDQ8kzVnPrcMYlOQwY?=
 =?us-ascii?Q?QhFuaHW/rKc5XOwG68UVTz1o/zwK+B+B4eqAQ4mfZVhRgP8JNwYywR2dWD5O?=
 =?us-ascii?Q?ZQMN5M4ECK37xn8PgDACI4mdy9z7Noni+LRJOZvFsgLnEhf0r5YmXCceKuyJ?=
 =?us-ascii?Q?GBZhvj00ATp8Kq118/j06NQnsYuxXWjlQ1b/BzF0Jtww2oCa8E0O1f05fZj+?=
 =?us-ascii?Q?g+rZXdgFgNIlNQVEvVInmnNwVwZoJpebwLpATTVobkaqKuUAUmXT1qJtl4vH?=
 =?us-ascii?Q?pjGb2aDPCZGkA1qWuQD/Oxy5gb4q7khPs33Y9y6ZnRMomWWxrS8CBCQleShy?=
 =?us-ascii?Q?7ScTf1LH8fFFBfBTB/FbNOJqCTkeKxhlBhO0hdgvb72mAoZVMXJ13SzTaOCU?=
 =?us-ascii?Q?6zCGUT8yRG5vhwIt+jQNYlF0UpoA7BEGHiSeUPE3LX4rnvbaLZn34mrArZLV?=
 =?us-ascii?Q?2+JfeeSg3UDM+dAki1mYyLEA+HbF9ffuq52c2QCgQHZkJ5nZZLwa9zzFD5aT?=
 =?us-ascii?Q?CgVclY+hLA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3704a024-3ec6-461e-034b-08de75bb6c47
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8468.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 04:48:17.1349
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cHCNdUh6rDce7mbQsQNNaEjVE80z8ZV3SVq9zvS1CJ+O7j6hA12V7jElWvn7GyjHxD2+dDLWBXk7yD/a9ExriQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8376
X-OriginatorOrg: intel.com

tree:   https://github.com/projectacrn/acrn-kernel 6.17/linux
head:   eac6d3b7a20ffb9d3102dbdc152241a7184a63cd
commit: 293fd159f5b3709147ae3ef5a79d4994c19bae53 [4/8] virt: acrn: Introduce acrntrace
reproduce: (https://download.01.org/0day-ci/archive/20260227/202602270517.6O7Ql9pl-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#75: FILE: drivers/virt/acrn/hvtrace.c:2:
+/*
+*

WARNING:ONE_SEMICOLON: Statements terminations use 1 semicolon
#261: FILE: drivers/virt/acrn/hvtrace.c:188:
+	pcpu_num = total_cpus;;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

