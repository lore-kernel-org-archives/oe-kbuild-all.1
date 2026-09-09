Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B6D23DBD60
	for <oe-kbuild-all@lists.linux.dev>; Wed,  9 Sep 2026 07:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788939910; cv=fail; b=G59Va0HyjVuZwfjlldP0qin3KNI3p8uDSJPJ42BrOT324Mgs+rysJ5qC2iQ+lKXrDeFY2fkqPB3EcdxMuoI6SK08MNs0Zq1RcUY/RjJerLOy6D8teNaISHzrfiB0i+8W4Hd6jcDjyl5tPvMN8SDaUZdywwGi6koTpMbMsojqtgw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788939910; c=relaxed/simple;
	bh=OMEkbVITF3PCLPprwUZkF7PhHHcKF1V6NjPOkh13lQU=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=e3AXTFAFDy6AWTBLiS0u7ilDdnnSYLJJtRovjLaXHhHI9sA5UkuFZTyJHp69QOtkUJ2QevQsZnWdb6Fi8VPNU9W+StWtA/gBfOKEQNzyR1T3gvt41CUXphdJkLl8k0AEu525A83m6B29WVuu/ote++bR0yX4fGQd18BsS/lDrw4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O9yfoNiT; arc=fail smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O9yfoNiT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788939907; x=1820475907;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=OMEkbVITF3PCLPprwUZkF7PhHHcKF1V6NjPOkh13lQU=;
  b=O9yfoNiTuOeIqKL1UQYM4cvCJEj/hd+K7MRqC1U3Lwea5cWqpRkTW4xe
   J5uwtw0WfeCXLSrnhHE+GXpTZZYR5MhgG5OcMaFFRRad3lkT/NKQn5GxA
   VYxZLQjYyw9UuzUWt/jCG5bzPTkcFO4wWYLcnNK7EUAeuqmqYJw4knfiK
   4FrSEx5fL2tLsR7Kob/bNvOVm7ukKcJTCAHotayTv8VX/IQi5AbLnJW6/
   aB9w8h8nQ2esug1wdRLMyafYVlA4oQhI12MYLTg8kLGv5a4gt8BdYk9Ym
   9hSuKu+ZX9ETjqQqTEi0U2utLxJcq7wgqWIQpuGxYOSyIZBn/X5DkOMHo
   A==;
X-CSE-ConnectionGUID: 4i2BsBI0TzumA/9sFDeQkA==
X-CSE-MsgGUID: yDrKVty+TCCAdt6Frx2TZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="88504534"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="88504534"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 00:45:06 -0700
X-CSE-ConnectionGUID: Y5iMF3vgRLmgIUyjnnLUEg==
X-CSE-MsgGUID: mw2VJDdbQGywTrzcETKfRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="267573113"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 00:45:07 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 9 Sep 2026 00:45:06 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 9 Sep 2026 00:45:06 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.62) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 9 Sep 2026 00:45:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WF0F3pZ77BLVM40b7/wtnHIfelg88SMEH3NxNO1REUzqkXT/D6Z9BaC60/aj7ox2TSMMudrIl8zJnCJg5I4uUqL5+BEwpnr3I1IX14SwdzZ82HKc/aYY6WPybEAy1m6gYl7JSp7rBuD1AbM6Nd5EBGskpEghB3O7BJiHa6qwj4Qum6AuIfrZ9x4bKl15aYxTWMemUD9L78mol2AieZK+CaVIQR0DuChWkJJTcHLqVbGq5FN8q7blF+qlRF5lY14lBVY0GhkZa8E2qtAop6k/saTeTnihXLG2SjXcLW7bUgPNy9Yk8DgUtv49ZAIp57yrSBX4CWqrfcfZk3Kaiw4fQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RSnpcgJ/6AulWjXe/Nnn7Mdfm8j4HBxxQBrpv3gm2wQ=;
 b=TvqOkZzrmRpjLxjHJ1mD8rXGHosCfEF8yxpU74qvkx7CgM+D1gxPGHS02C3Xtv479S4NC8dxONGsb3s1NHxyTmyeUKGc5YoqM+H0mfMOnfa8QAThHw6+mLcvbHUjcG9VhVItwO9uwaPG6Bhg//rjGK3Rk9NApou+Z68pdHb0DeVQXKmhLvpBuatuae/P9Mfk1lMXyoJT2Ox2gjkXv8jm+lmnFkBPF47HFyLX6mSKDr2i0QJWKQ0moni8zdrxEU8GtQuTBCLZD9xcebb56jKiTsWReOjgouhHlruEWkaKaKi6jLIIf1J+T/35P30dtq2nqLclsM38QhG4xj97wdk2Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH3PPF4E874A00C.namprd11.prod.outlook.com
 (2603:10b6:518:1::d1e) by PH0PR11MB5175.namprd11.prod.outlook.com
 (2603:10b6:510:3d::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.8; Wed, 9 Sep 2026
 07:45:03 +0000
Received: from PH3PPF4E874A00C.namprd11.prod.outlook.com
 ([fe80::1c3e:8202:fe9b:8ae]) by PH3PPF4E874A00C.namprd11.prod.outlook.com
 ([fe80::1c3e:8202:fe9b:8ae%6]) with mapi id 15.21.0382.014; Wed, 9 Sep 2026
 07:45:02 +0000
Date: Wed, 9 Sep 2026 15:44:55 +0800
From: Philip Li <philip.li@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
CC: kernel test robot <lkp@intel.com>, <oe-kbuild-all@lists.linux.dev>
Subject: Re: drivers/firmware/efi/libstub/vsprintf.c:511:5: warning: no
 previous prototype for function 'efi_snprintf'
Message-ID: <aqEOd9SJ8La6wcd8@rli9-mobl>
References: <202609090804.938npPl7-lkp@intel.com>
 <7b9400d4-ebf4-4757-81ce-9e52295cecf4@app.fastmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <7b9400d4-ebf4-4757-81ce-9e52295cecf4@app.fastmail.com>
X-ClientProxiedBy: TPYP295CA0039.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:7::10) To PH3PPF4E874A00C.namprd11.prod.outlook.com
 (2603:10b6:518:1::d1e)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH3PPF4E874A00C:EE_|PH0PR11MB5175:EE_
X-MS-Office365-Filtering-Correlation-Id: b1c2924c-7252-4e00-91d1-08df0e4641e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|10067099003|4143699003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: F80RLODNNHnatAgqUCWf8S6OJjdNGWJR9ouQvW2h3n3cJoQK6zaMdEExf7KmfAELYZiBrjsuX0yLFLGXpfDoXnm5Nj+Q+IzlC05I46cLstSVsmmGa66SrNZfVdzcFZYxnl1J4t1IGtpzHP570e/aBYuGIy2FoPhoSR8cA9ELODtDe/gkj3qZn0wF5d+SQDbubnGL2ZBznft+BiOEgVryNfLpcrbSP3btr/JcETe4aHbay3vl2KTDy3y7Vr/Gxss/iWjE/JEf+6uJv1yyjPh0b6AJGOFWCUzZ0EdY9iWb+qlI8evVLu459iyVipdUk7eNn41Zsabu+S4sr18PqjZ4QVwWc/Jm/2S0UKiGpt2YQIpCdHk7gimzThMB3L6iGUgjw8he3e96lCnMbde0n15R3rmIcePCE2jAZ56iIwqwyC/UwkhQk77dEfu5YUo5kOp9PTAmyli9fToHnouNVLvMKV/Re1sgvWPYPLJ2SLy9XAyb80eEmK5T/fslJvggv6+0zn5ObFh935I94ltaC/lqMP8slfJ0weg/CKR3OtT2FwsTt5j833vGHg5H++gJA8IbSlka2SKJcBd/7W+yUHS2cCBzD9GMXR8hVT0ksEBTAeJYdRMhw+ajmX0DgvuO++JC
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH3PPF4E874A00C.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(10067099003)(4143699003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9kr50eF2VUT0Dvr5XJOHwiEwS7m4xSJF+FcW6r4JvFxqTdwt/BlzCImrruV3?=
 =?us-ascii?Q?S8ixEfn41rZ0WFQzG6qH1cyGRbQjIyIbr/noDVyfjLhyUScxSBsoo9QmTVt0?=
 =?us-ascii?Q?jLBjMXh3A31zCIsSO00x1yEwNga4JvbT7XMTMTr4cBNj4vDtYkjBwzyPGaOK?=
 =?us-ascii?Q?szRuyd2o5CJ57jB1Se6kFqS2YipS9+hCLAXbCuhY2S9rsvYTONe3bns/cuv6?=
 =?us-ascii?Q?r2bMzatl9Rj93uxoTsSUZZGitHcSShVX4cttBtfySw3+5w++j8akHFCXh64K?=
 =?us-ascii?Q?XsiURSosKjkdRlKRwcF7jqXmOlAKLdoraNT8C+1WLR66mzxzyZTTf9kcRh1M?=
 =?us-ascii?Q?0wSNvQuiDJMH4Mk2h+rmxhkVnIIZfEVRxgY/lFIa0n3oL7j/m67fuU1XqgpD?=
 =?us-ascii?Q?YUJV//2Lnqv4nedu1LqXS2I0m5U0qmSChcWzZgUs4yusw8gxaUlQxI4wwfq3?=
 =?us-ascii?Q?g/nqkatZDzMApjmFcl7ZAqyjYTA9rXfqENujCZqe05c/KHSPiytnF+W44ive?=
 =?us-ascii?Q?yP92wHXovvNw56lsyDfdoHkXoHUm/aQUyYZivDyvTTaEMErSRpIOkr2+CFzP?=
 =?us-ascii?Q?0pv4A3V998H4k+AbcYemQirp/20SmQE+04UeWnCfpghqMJFdn7qQcNxA6BeZ?=
 =?us-ascii?Q?J5Q2e1Cw6dsCVOgvUirHwOPb7/vLtNuOHpDHvap58pRzfn15Symr4M2yTZRR?=
 =?us-ascii?Q?k3ZuNWZK9ab/0/K2y2zbpTmt66EETyEobYWJqvDTDol6VUNIViMW3/HTDNbZ?=
 =?us-ascii?Q?gbeQCXMaxVmTUTxuSZf3pGXfVJ/R0G3veblKYtILFsJuWKiuX99DuqtyLIm5?=
 =?us-ascii?Q?s8S5v13qbwQTChTpLGrN1hs/jxtH1ODQwNQfGNTKZPrKNhP1G8QpZwAghpnL?=
 =?us-ascii?Q?urmxo022WGsZqQjXv4uJF0EckH6lSTjDy6PXDjkfqMIJ7U+2A3oURT4kYYR/?=
 =?us-ascii?Q?UPOaW1NYvIAVx6S0Pr5F9lmlXUIUtHE6etMoTKLoUyqXPxA5uLHm7dgRbtWw?=
 =?us-ascii?Q?8l6yVxf/011TVxD66IsLlQ+YWF6jaxuwmzIh80EREEGzna+JJIICTX+qzCr6?=
 =?us-ascii?Q?ythdwAE9zIMLF947NTAYJBwGHAZQZzee0x8MDCt9RtLLuu3Mbn5PPQleFoZA?=
 =?us-ascii?Q?hvmLBlYeQcAkQewZEh/klvO+g1sFRmFUu2MqnxuvHyQRRC9qGOKQz+WvnvYh?=
 =?us-ascii?Q?2bZXyIB/Stm3navvUFM00Qa0ukx1OGbwUdx/GymtuvWsK+I5XtZZGWVsyJiP?=
 =?us-ascii?Q?Oen3HuZosq/vqI/rH1FfnlLPhvBQQzaAc95V9ttfymlT1d9HxfGD4b90gm/g?=
 =?us-ascii?Q?BQeA2bWKyatfz23x8741FKBiyeG+//iKH7YMW0XYrp/YvP5UHPuXP4v8cFo5?=
 =?us-ascii?Q?aSDVtdBOVnWRjwWnr7l/efJg9JZGNa5jLNELn83Mz4MM1vETH+9M899QAWlg?=
 =?us-ascii?Q?ci6toYKecIvouZbClIXo6xHzOp2tZzg5ZgBbhJrjI8sRL226md46tF76jFoA?=
 =?us-ascii?Q?SPWSalUKj4To5d2eje6mi6zaCrBxRHNKhrXkYwKE2xp61yNuL3Xa6JrihSpE?=
 =?us-ascii?Q?MtazHuqrDXe5hmjfAh+rHhB7SrjJY0pu2JkXlYEBWp61muzLP8pKPrfJz+UD?=
 =?us-ascii?Q?+XljlR0C5lfxVtetuaqzOKRw+cpEC8AyuXEiDUweg6ZjnPtYvVITvmqYIPGG?=
 =?us-ascii?Q?AGpEqfjIEZizA0w2qPlqxtFg5onnyou+UkWiqKb29mu6mec0IKC97N/q5OYk?=
 =?us-ascii?Q?6477LpcxoA=3D=3D?=
X-Exchange-RoutingPolicyChecked: unuNveON4c878N4TD4IpgMzBiVaYqRHjycg+ZaClXD1elt78luuVSDWuo1KYh+K++EhjQYVpyAsfw+cEqwV138VOlrtshDzEdLKCiFxYzqlN4g4r1VPFuKwLrVOkPwN93/bqTD6etmAcuj2K2Xc0BMNEbYCiE9Et6CphFa7Vz7IyZFnCD/c3gKK6pN+csLXlFAdmWbpjsj4G+yiRhAbCLk7cnKTRdoggVNVDjLtMI+FbcqYv9xft85IWhmCkayPxSNoD60eoo/W9x16tzzjlCcqQpQaz0rbo8ModIpLXz3bhgDQGxnoGnIRoo9Vry1RxCstWy+VWdb2VsvWndDEi5g==
X-MS-Exchange-CrossTenant-Network-Message-Id: b1c2924c-7252-4e00-91d1-08df0e4641e0
X-MS-Exchange-CrossTenant-AuthSource: PH3PPF4E874A00C.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 07:45:02.8538
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EQa4j5SHTBCuCRqTAsP6qK1rHp/KpTSPZ0ZmBeId0HDDN4q7Lcqi1kuOSpAUCoQlz3tvlFVtBsm/i7D6Tj6Nsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5175
X-OriginatorOrg: intel.com

On Wed, Sep 09, 2026 at 09:12:46AM +0200, Ard Biesheuvel wrote:
> Please stop spamming me with reports about code that appeared
> on one of my branches for a brief period, was apparently pulled
> into some intel LKP branch but was never submitted by me for any
> kind of review.

Sorry for the spam, I will configure the bot to avoid sending such
report.

> 
> Thanks.
> 
> 
> On Wed, 9 Sep 2026, at 09:00, kernel test robot wrote:
> > tree:   
> > https://github.com/intel-lab-lkp/linux/commits/Ard-Biesheuvel/x86-boot-Drop-pointless-re-implementation-of-panic/20260906-150819
> > head:   c551ec0edb0b057c415d5530905c288523a9bde8
> > commit: c551ec0edb0b057c415d5530905c288523a9bde8 efi/libstub: Add 
> > efi_snprintf() to construct wide strings
> > date:   3 days ago
> > config: loongarch-allyesconfig 
> > (https://download.01.org/0day-ci/archive/20260909/202609090804.938npPl7-lkp@intel.com/config)
> > compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project 
> > ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
> > reproduce (this is a W=1 build): 
> > (https://download.01.org/0day-ci/archive/20260909/202609090804.938npPl7-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new 
> > version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: 
> > https://lore.kernel.org/oe-kbuild-all/202609090804.938npPl7-lkp@intel.com/
> >
> > All warnings (new ones prefixed by >>):
> >
> >    drivers/firmware/efi/libstub/vsprintf.c:274:5: warning: no previous 
> > prototype for function 'efi_vsnprintf' [-Wmissing-prototypes]
> >      274 | int efi_vsnprintf(efi_char16_t *buf, size_t size, const char 
> > *fmt, va_list ap,
> >          |     ^
> >    drivers/firmware/efi/libstub/vsprintf.c:274:1: note: declare 
> > 'static' if the function is not intended to be used outside of this 
> > translation unit
> >      274 | int efi_vsnprintf(efi_char16_t *buf, size_t size, const char 
> > *fmt, va_list ap,
> >          | ^
> >          | static 
> >>> drivers/firmware/efi/libstub/vsprintf.c:511:5: warning: no previous prototype for function 'efi_snprintf' [-Wmissing-prototypes]
> >      511 | int efi_snprintf(efi_char16_t *buf, size_t size, const char 
> > *fmt, ...)
> >          |     ^
> >    drivers/firmware/efi/libstub/vsprintf.c:511:1: note: declare 
> > 'static' if the function is not intended to be used outside of this 
> > translation unit
> >      511 | int efi_snprintf(efi_char16_t *buf, size_t size, const char 
> > *fmt, ...)
> >          | ^
> >          | static 
> >    2 warnings generated.
> >
> >
> > vim +/efi_snprintf +511 drivers/firmware/efi/libstub/vsprintf.c
> >
> >    510	
> >  > 511	int efi_snprintf(efi_char16_t *buf, size_t size, const char *fmt, ...)
> >
> > --
> > 0-DAY CI Kernel Test Service
> > https://github.com/intel/lkp-tests/wiki
> 
