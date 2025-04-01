Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA47D2AEFB
	for <oe-kbuild-all@lists.linux.dev>; Tue,  1 Apr 2025 04:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743482333; cv=fail; b=qWBT0XFh72FAaZLHTiLVxqD3YSvixs2f8wXI6DGg61BSwhnxFPdPsGqt1x+zqZD2h85qEEC0l4d4qhp0q5zhFI9pZz+FnV5Qcv5dqyYIGg8k7SdFyBVgQT+Y2XfaQB25lM1J2DHwYXoP6cxEbwG9e0lUIOV/pXI4sgv4t5TtxNQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743482333; c=relaxed/simple;
	bh=tkQmsoGeggq7moX3bUxw6IiMQikvlO4kt/IZ5ayZm9M=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=qAaM3TbZgxSEn2r+rV0IcggcEsIAetxftLq9sqUNeL/KRSQjVXTMI/phBzVQ1iKLPsF25LLgsw5YzsioqSHU35MApSiwkE8lRvbzZhrF7ktQ1JmDnCiiznlDORJoOhJrfqo8j7Hib4VoxUmuBZjaRmuBV0sinQI9K6Df+8MO7RI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZHA5RsHt; arc=fail smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZHA5RsHt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743482331; x=1775018331;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=tkQmsoGeggq7moX3bUxw6IiMQikvlO4kt/IZ5ayZm9M=;
  b=ZHA5RsHtzK7sHyOCuJA9GepXh18t6MuXZpO0xMyKOE/IFiQKuLN+gxzV
   qVcD3q3RfGxMcYi/oUX7ZDzf/bdkVy62PuYlNzhe4QW+SV3GLAet0Nl9Q
   5xaTDz4hS5pfBefVenUor4WsgvJaf6LCMVSWt5IIB/L7J7vFuZwQh2pm6
   U7DVdz4gZ+KZGQb4h/An9DeI3QQUUGE9ki8yJMgpld1M5djtjjvP63SCG
   eVoJTlgqztIlw9FguxhF5o/TKBKEzxoXkcD503FMRY1uu7yhEPcxcTWZc
   Ok9H+Ir5RDpioqCTpoBUvrXH99X2C43RcFGGxumGBe02kXqzeTNrR1rGA
   Q==;
X-CSE-ConnectionGUID: mTh6/atLRzaYRHc5gPGcqA==
X-CSE-MsgGUID: YLuSObJQQSSuuztY8Hp1yg==
X-IronPort-AV: E=McAfee;i="6700,10204,11390"; a="55782170"
X-IronPort-AV: E=Sophos;i="6.14,292,1736841600"; 
   d="scan'208";a="55782170"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2025 21:38:50 -0700
X-CSE-ConnectionGUID: Q0/tXJaET8K/XydoImMJcQ==
X-CSE-MsgGUID: bkr9MHp/RB6/zbjKY4ItBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,292,1736841600"; 
   d="scan'208";a="157185497"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 31 Mar 2025 21:38:50 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 31 Mar 2025 21:38:49 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 31 Mar 2025 21:38:49 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 31 Mar 2025 21:38:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hvuVorpixvOFld2Z48wjx+1BGzGs7ZaoDfQh5R8weSiaBE+h2NveMf7pa81B83AUqVNB8502gdw1PambySoNNjWkalpsanwNFLwTjJhcxjPCqPlfxZ7kBfu/vHqqATb4vF+eNAjR5/cjaghxtRcKqMAw5yaTJYeLMGpWUnfnU9ZFJDTudSaawLTgfd514IU6YIesaFZwBah5FKFUiEGGLXYWwmr5igHiF1lQuXSx4Mnb304oHOJWAmqystIJ4oGeeD61UsaDFsThxGYbBl2Qyq0j7t0YjZvuiDd64k9O7qPDiCDxg7r7U5pvoCd2UcMQyQBcXO30dJs2ddFy7w6Ljw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3+VTc4xvPIKM46KzNANFGll2bOFpkKPAAdh0RJsuq5w=;
 b=oLQ6312i/ZIK1DIT6WjJUULm5IFNKjDw+dvL1IA+lgA/Bz46TD0cw+If+2T02UhpdymhpXgK5vuU8R7Xb0DWy7qm1eOyO0pHGB9X4Mu2YfCb21iMh6l8VODENa5hjGvNnbb+w+ZbU0AFfqEtQL1nvWQccN0NK6L1b23ehpsIaQeLcQVaHkC0gS+2VJ4X82JITo2auVXjZbnbjffhEFExZ5/HDioWy41PZLlFkvSTIb6PBghjhLqJtWdb0gweAdwcn8EMrH0HZH5/i5S9nqeyZXigO/RvcTAlfI8gP1DsI+3Osowlf/wWoFY2WH74OzcO5cFotkrfbq6LmNJoXlJJJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5674.namprd11.prod.outlook.com (2603:10b6:510:ec::10)
 by MW4PR11MB7006.namprd11.prod.outlook.com (2603:10b6:303:22f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Tue, 1 Apr
 2025 04:38:46 +0000
Received: from PH0PR11MB5674.namprd11.prod.outlook.com
 ([fe80::77d3:dfb2:3bd:e02a]) by PH0PR11MB5674.namprd11.prod.outlook.com
 ([fe80::77d3:dfb2:3bd:e02a%5]) with mapi id 15.20.8534.043; Tue, 1 Apr 2025
 04:38:46 +0000
Date: Tue, 1 Apr 2025 12:38:37 +0800
From: Philip Li <philip.li@intel.com>
To: kernel test robot <lkp@intel.com>
CC: Guenter Roeck <linux@roeck-us.net>, <oe-kbuild-all@lists.linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>, Linux Memory Management List
	<linux-mm@kvack.org>, Alessandro Carminati <acarmina@redhat.com>
Subject: Re: [linux-next:master 12681/13861] drivers/i2c/i2c-core-base.o:
 warning: objtool: __i2c_transfer+0x120: stack state mismatch: reg1[24]=-1+0
 reg2[24]=-2-24
Message-ID: <Z+ttzRArSBMqfABz@rli9-mobl>
References: <202504011011.jyZ6NtXx-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <202504011011.jyZ6NtXx-lkp@intel.com>
X-ClientProxiedBy: SG2PR04CA0172.apcprd04.prod.outlook.com (2603:1096:4::34)
 To PH0PR11MB5674.namprd11.prod.outlook.com (2603:10b6:510:ec::10)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5674:EE_|MW4PR11MB7006:EE_
X-MS-Office365-Filtering-Correlation-Id: 6fa1c2b0-7028-4569-e426-08dd70d71694
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?nHNrzuE6MnhtmpvE8cqD9YdMu5wooRkdUutptEUmiPAX33N2LZDynBpNNCgB?=
 =?us-ascii?Q?G1cNyJc8NQtaUoyzY33y2zP0cB58ULUMHALKLtc25Qbp/bnS7iubWIf9Ngji?=
 =?us-ascii?Q?EFg0qIoiufGi3zIU569BKUQ8JHM4iBswfSmz9Yil4T0eu+vWQa9BSkNA5x1T?=
 =?us-ascii?Q?tKc+TPTvjxBEfntapwEgye78cp0J0vluySC79cmdt2oFeZ0z9uX3zKv3s+fC?=
 =?us-ascii?Q?zWrcbbx2NCPL9Kxv3a+vaKuWiR3f9t5BpzCUzJFc/WFM+kUCu97SOptkYQ1D?=
 =?us-ascii?Q?uk6B1EOvm/sxUILtGUJ20qNpmxtk1HqPls1IFy5C+/ktV6NOWGqN7IweUUsd?=
 =?us-ascii?Q?RkR8AF7kIP4gUvyQJe0duTyJyJqXtkouL8zqLAtaYqXMzXeVNnIuINMoi6So?=
 =?us-ascii?Q?qHh/8pIF0W2lxcOyVXAbLhlF3iSOkjTYTn1dfcB0LI7m5ue7pzNiRkq4mnyO?=
 =?us-ascii?Q?xwd2VqiGAoGjELVIGVnY8nZxWiU9YKpI6VC+gu5eGlSr84R60iirbllnTwgs?=
 =?us-ascii?Q?+S52ppO7n+RO+yEDib0gLa7Mia4+9rdEUBgYH3AwdPg3Sk65Z3J+tPc0P7gs?=
 =?us-ascii?Q?YBrdVSA1T+s//dMK8OzuM+CrfB1DGbSRmIwUZ+jIaSE503hKfmYZ2V1R+O+9?=
 =?us-ascii?Q?pUxI1ES491egNTo6n4Bd3Et1koCffVYWCLgAKEH0eq8ETHswTk/jQxFM+sqO?=
 =?us-ascii?Q?zFcxzXwNo/kdXkwRB/L5yWiT5SesWVeBLApAhMJXCOniK4oi7w69Zen55Wsb?=
 =?us-ascii?Q?vDN7JxHLEb2IWt3h916XklX73hoPBKI6hbtOX54UDMDtF3Snw2XL4AzBRi6u?=
 =?us-ascii?Q?JahrhylIU1QpJFTa4Kg9yic51KT9HtMX+bfuQlw6ZIYaTujLl6MA2Jh66I3V?=
 =?us-ascii?Q?4nTtD0VCZsVu89x9BAzZj1XD4YunhCOekOG2ZswKHyl3mHcSdp0mDaI7OLrn?=
 =?us-ascii?Q?PlPqJbrRrV448YoNmRZsn9dPnT4vaV/CAklveZCbm63guImE5dnXLoSyQm4r?=
 =?us-ascii?Q?hvEnc0/1kWSrbbrb/BtFvlKvC5pPBvLa0w+604YXXpGGFGmtFxpJ975MTMff?=
 =?us-ascii?Q?zW2buiwWhm1AAl2tbyueLkiYl55WFvhk1hCQ/x+I7LvWfYADMttOqRsd+Fda?=
 =?us-ascii?Q?9snDyswpTTgisrZfJiHAGR18wrI93piImpDTIsSfmQEXIhc3nuj6PPlaITTD?=
 =?us-ascii?Q?1ikL7v4B0pCjShHvSYV6sBR2a4eb35nSTy08OWe3Tfg3/ha4+PnDB+GVto0v?=
 =?us-ascii?Q?2pJF77BC3zEckwlUdUgP1JW0jVltatalpztCD6CDt9zh3YEo1pt4qYx9vk/f?=
 =?us-ascii?Q?+9UhMjsfmCzCoZsq7WnGtl6nKsGuXQwHQuc2pvWEH2Pq+w=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5674.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XObm+DeYA6QKnXNA9m3up/tN0PvLt//wQgSlxUuu3tyJzsj3z/snik7Eiuzz?=
 =?us-ascii?Q?fI8t648sq+XFtGYIyl/Is0S21AlVHHGl5plmL9I5v9JxLxJ3Quu1eSvsgaze?=
 =?us-ascii?Q?A18NsYNVUKF1wi2cph+qn0XT5PVSD0G/RbaXWmuLlhpNuEaTWwjjJa9nnN7F?=
 =?us-ascii?Q?eFWpNwH1OriUSmmfEx4I+AE12qogOx6sQT0DqUljgBZNGYJJ7pJ8uPSBEcSy?=
 =?us-ascii?Q?npac9QwPaEdjJx9Xty+Y0uw0t9uTzrsKXj0JY4hlSPrxw6qGDAPh1cs4IhdO?=
 =?us-ascii?Q?ffWcfyBj69kVVJvZNaEvp0iK1JSOMCZHHD5tNADSKL2cnvsNhzeNJPyEJ7AT?=
 =?us-ascii?Q?CWlzkXOn/XZo01gcgE6kiS7jpfNunieHagIa98BfJ6k2QekjE3iblVcFqjk7?=
 =?us-ascii?Q?woZNQphmI0Q6/r8u0GnXqiU8nxe2xIpQLNF6G08jK13VwZKfo4Z5nSCU/k+a?=
 =?us-ascii?Q?pwiDJVikiYtdr/vNr8sA0xw2KIrKkTDpoJnkhyv5wcu4+LMMOljVEfZk7YUn?=
 =?us-ascii?Q?ZZan12VF1ZEpXmrOQRoRk34AUj9/6KLlUqnmyoasNN6E+bd7AgpZUdIFUFC9?=
 =?us-ascii?Q?gpVUZo7jAKWmpqhBD7aqMUDFGUu2emVOsQP3wbWB9BE1ekL/J+CAM6Fz1cnz?=
 =?us-ascii?Q?6C2ypcjRHcuo4y0kfx0wawvhRUYYo68BQ2C/gdxdJmAtsY6dyZXT9N284+Yb?=
 =?us-ascii?Q?86aCe23h6A5dtOr+OXX2W4JR4QqYu0mLSsO87I7GkVWNDOIsNQnVSOIgx3pc?=
 =?us-ascii?Q?RKaovkv9e/NCci3V0+J4KQhIptfV9tG2RvcU9g6H+wpX1oHyQkAf1GqCNYad?=
 =?us-ascii?Q?5PmPn6JEvA4FWv8j74UYnzmdaAnlnEdtYsgQolUcOWOBxW8TZ0PbYYSLTGGn?=
 =?us-ascii?Q?A6nQItg62LR8/kC21qyHphZOlFTywQfxIicTBXNqk2s1jdTZGskgWL3rQxTo?=
 =?us-ascii?Q?zKa/TF+V1lOeP287flsoXjlE/Y64sKRR9/W2KQOtDqWusfzBySS9cYlzuHH/?=
 =?us-ascii?Q?iKzwMEHCe1a0lPhYbYYkWGrYjQQFnH1HH2p1bi4f8r/AzetN/pIxs012uSZ9?=
 =?us-ascii?Q?vSrXq8AZp1oA/mk1K2bIk64MqjUOX96HDoiZzI4w2fikfCDSBKxIID06+t0D?=
 =?us-ascii?Q?gPflPeC7x3mslTd1uaHZ8Hib2f3tOeR7QH3oZN72wZsn782vXnt/tzdGD8IK?=
 =?us-ascii?Q?OQjnWfSmAecOBbmDWG8nmqdACP9/JHXakmR99KzC6C9FGME6TKF16aZpNT9S?=
 =?us-ascii?Q?L/XuP4JUBk724/1l8SjQGJa+nL9NZW2vM/z459oZ6XHppIg7gfTeMjHV0HvN?=
 =?us-ascii?Q?eFy7ttTm2XbA8DmMcuL1FGqkYN/h5FStpIf17XzuSBPLRM2vxbTK6h6B/lXX?=
 =?us-ascii?Q?+RJ6jqUswq2lWbTt66n94wyw2m4QugYzm1dbbTVjRDy36lG2oXpDV27lIcq5?=
 =?us-ascii?Q?TKYO7Enh3Rz/gaTODE9nHUlu3aXKjeY94UtAvhZTWntyYx4eDbWsrvfbxUBG?=
 =?us-ascii?Q?TGETFu1wCQH1iRXs83o2xutBGfZ1RgkKCPJS6m+kae2ZkAc9cD27AO6zUNcs?=
 =?us-ascii?Q?55HDoZ0EsboW772veX4RBZBmKdiZcuD2jNZHlV5N?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fa1c2b0-7028-4569-e426-08dd70d71694
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5674.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2025 04:38:46.2312
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GDaiue7f51N21qJBp6Fv4wOLdQPPQi8LD4+ySp/+AtouNmAldHEj+NOozGOfCqaXXO1ktVrKkFU59VF/m/V8Bw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7006
X-OriginatorOrg: intel.com

On Tue, Apr 01, 2025 at 10:44:57AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   405e2241def89c88f008dcb899eb5b6d4be8b43c
> commit: 9016dad4dca4bbe61c48ffd5a273cad980caa0d1 [12681/13861] loongarch: add support for suppressing warning backtraces
> config: loongarch-randconfig-001-20250401 (https://download.01.org/0day-ci/archive/20250401/202504011011.jyZ6NtXx-lkp@intel.com/config)
> compiler: loongarch64-linux-gcc (GCC) 14.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250401/202504011011.jyZ6NtXx-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202504011011.jyZ6NtXx-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):

FYI: not sure whether this is a false positive due to wrong bisection, as
there's fix [1] for 'stack state mismatch' issue.

  arch/loongarch/kernel/traps.o: warning: objtool: show_stack+0xe0: stack state mismatch: reg1[22]=-1+0 reg2[22]=-2-160
  arch/loongarch/kernel/traps.o: warning: objtool: show_stack+0xe0: stack state mismatch: reg1[23]=-1+0 reg2[23]=-2-152

[1] https://lore.kernel.org/all/270cadd8040dda74db2307f23497bb68e65db98d.1743481539.git.jpoimboe@kernel.org/

> 
> >> drivers/i2c/i2c-core-base.o: warning: objtool: __i2c_transfer+0x120: stack state mismatch: reg1[24]=-1+0 reg2[24]=-2-24
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
> 
