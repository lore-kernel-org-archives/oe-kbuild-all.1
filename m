Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C39462DF142
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Jan 2026 08:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769587408; cv=none; b=bpOO8xhEZ7TmX8Xopqp6wCbd0Il9RgERag74ScdimBj0PfzWh7B0S85+w1mJRypgzPaGL7fOfKh67Sgw5IPfm2d8JJFHIvcQ1TECY1CDLP14VeW0e9aYDFnnr0qVU61p8LcYDKM+IPiaeZBp8HdfTNaY6FTNsJHmqIWH5VPF1Ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769587408; c=relaxed/simple;
	bh=Uy+LZbqqgNYSVc6z7jdS49CnVZqP/MuK6HVND6Q5WVw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=X7aSBi3CHQWE4WcUNBp7orkhS9qf9jLXGwykAmICksztows46O6UgaxwosoxHrqFvhu12b00KvB+k0syTqnTe9p9GPsEB/gqThNTURBoS0QOe+OFw1167frHKvLOpWpd24DvRfoI63I5po/lv0f6nGVAT9Y4BN2rJtH+HuZpMHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G/o1cqjG; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G/o1cqjG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769587406; x=1801123406;
  h=date:from:to:cc:subject:message-id;
  bh=Uy+LZbqqgNYSVc6z7jdS49CnVZqP/MuK6HVND6Q5WVw=;
  b=G/o1cqjGwh6NPAzo9dOuEBXek476bWIo27UjpeZnlzxqg57VDu/wGJ1p
   Ne2hOGkgYQVknWrTg/2Y5iqsSZxlBqU0L+GAb3bptdltUfJHoXo4JzNkI
   bRz6etdYWsZXwvGmYuObEGYSARP3WO9vhCfDWL2YK+hvHKr1KrPQIXhDV
   ApkI5AOq+XErutyCQ0fyirxgaA/LL9/054KW72cuG32qTVuxqdJKU34OB
   rWrth6MZQCfFe9wTVDdg6gdxcwl7Fbh5q+KGCHvRK4rKf7c1r11iWlxqj
   C5aVNqPIKD1IXCOrgd7skPD9Hlbo9aLp5gumcHKpb+CglrlLynO1ru0PN
   g==;
X-CSE-ConnectionGUID: G4uy/DBsS7Kdf6cemRzxTA==
X-CSE-MsgGUID: P5tXjhohTPOd2L4uzl6Omg==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="88213538"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="88213538"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 00:03:25 -0800
X-CSE-ConnectionGUID: eP+7F9OXT9GBSpAy5mVXuA==
X-CSE-MsgGUID: Gudzl6egTwKrwmLPJmRlEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="208439753"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 28 Jan 2026 00:03:23 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vl0WH-00000000ZRQ-0sn0;
	Wed, 28 Jan 2026 08:03:21 +0000
Date: Wed, 28 Jan 2026 16:03:02 +0800
From: kernel test robot <lkp@intel.com>
To: Richard Kuo <rkuo@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev, Brian Cain <bcain@kernel.org>
Subject: [bcain:bcain/boot_qemu 27/38]
 arch/hexagon/platform/sm8150/v66_debug.c:10:15: sparse: sparse: symbol
 'clock_lval_dentry' was not declared. Should it be static?
Message-ID: <202601281517.Px3NWEjg-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bcain/linux.git bcain/boot_qemu
head:   6dd00eeb9163d38cdab8b12c40702a711f04a9ab
commit: c353b293a7e6804bc8910facd062430db3d47fc3 [27/38] hexagon: add SM8150 platform support
config: hexagon-randconfig-r112-20260128 (https://download.01.org/0day-ci/archive/20260128/202601281517.Px3NWEjg-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260128/202601281517.Px3NWEjg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601281517.Px3NWEjg-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/hexagon/platform/sm8150/v66_debug.c: note: in included file (through arch/hexagon/include/asm/timex.h, include/linux/timex.h, include/linux/time32.h, ...):
   arch/hexagon/include/asm/hexagon_vm.h:51:5: sparse: sparse: undefined preprocessor identifier '__HEXAGON_ARCH__'
>> arch/hexagon/platform/sm8150/v66_debug.c:10:15: sparse: sparse: symbol 'clock_lval_dentry' was not declared. Should it be static?
>> arch/hexagon/platform/sm8150/v66_debug.c:11:15: sparse: sparse: symbol 'clock_dump_dentry' was not declared. Should it be static?
>> arch/hexagon/platform/sm8150/v66_debug.c:13:6: sparse: sparse: symbol 'hexagon_pub_base' was not declared. Should it be static?
>> arch/hexagon/platform/sm8150/v66_debug.c:14:5: sparse: sparse: symbol 'clock_lval' was not declared. Should it be static?
>> arch/hexagon/platform/sm8150/v66_debug.c:17:15: sparse: sparse: symbol 'tcxo_lpj' was not declared. Should it be static?
>> arch/hexagon/platform/sm8150/v66_debug.c:96:21: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   arch/hexagon/platform/sm8150/v66_debug.c:96:21: sparse:     expected void const volatile [noderef] __iomem *addr
   arch/hexagon/platform/sm8150/v66_debug.c:96:21: sparse:     got void *
>> arch/hexagon/platform/sm8150/v66_debug.c:110:48: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   arch/hexagon/platform/sm8150/v66_debug.c:110:48: sparse:     expected void volatile [noderef] __iomem *addr
   arch/hexagon/platform/sm8150/v66_debug.c:110:48: sparse:     got void *
   arch/hexagon/platform/sm8150/v66_debug.c:111:50: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   arch/hexagon/platform/sm8150/v66_debug.c:111:50: sparse:     expected void volatile [noderef] __iomem *addr
   arch/hexagon/platform/sm8150/v66_debug.c:111:50: sparse:     got void *
   arch/hexagon/platform/sm8150/v66_debug.c:112:46: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   arch/hexagon/platform/sm8150/v66_debug.c:112:46: sparse:     expected void volatile [noderef] __iomem *addr
   arch/hexagon/platform/sm8150/v66_debug.c:112:46: sparse:     got void *
   arch/hexagon/platform/sm8150/v66_debug.c:113:48: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   arch/hexagon/platform/sm8150/v66_debug.c:113:48: sparse:     expected void volatile [noderef] __iomem *addr
   arch/hexagon/platform/sm8150/v66_debug.c:113:48: sparse:     got void *
   arch/hexagon/platform/sm8150/v66_debug.c:114:48: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   arch/hexagon/platform/sm8150/v66_debug.c:114:48: sparse:     expected void volatile [noderef] __iomem *addr
   arch/hexagon/platform/sm8150/v66_debug.c:114:48: sparse:     got void *
   arch/hexagon/platform/sm8150/v66_debug.c:116:22: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   arch/hexagon/platform/sm8150/v66_debug.c:116:22: sparse:     expected void volatile [noderef] __iomem *addr
   arch/hexagon/platform/sm8150/v66_debug.c:116:22: sparse:     got void *
   arch/hexagon/platform/sm8150/v66_debug.c:117:22: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   arch/hexagon/platform/sm8150/v66_debug.c:117:22: sparse:     expected void volatile [noderef] __iomem *addr
   arch/hexagon/platform/sm8150/v66_debug.c:117:22: sparse:     got void *
   arch/hexagon/platform/sm8150/v66_debug.c:119:21: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   arch/hexagon/platform/sm8150/v66_debug.c:119:21: sparse:     expected void const volatile [noderef] __iomem *addr
   arch/hexagon/platform/sm8150/v66_debug.c:119:21: sparse:     got void *
   arch/hexagon/platform/sm8150/v66_debug.c:121:21: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   arch/hexagon/platform/sm8150/v66_debug.c:121:21: sparse:     expected void volatile [noderef] __iomem *addr
   arch/hexagon/platform/sm8150/v66_debug.c:121:21: sparse:     got void *
   arch/hexagon/platform/sm8150/v66_debug.c:124:19: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   arch/hexagon/platform/sm8150/v66_debug.c:124:19: sparse:     expected void volatile [noderef] __iomem *addr
   arch/hexagon/platform/sm8150/v66_debug.c:124:19: sparse:     got void *
   arch/hexagon/platform/sm8150/v66_debug.c:127:21: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   arch/hexagon/platform/sm8150/v66_debug.c:127:21: sparse:     expected void const volatile [noderef] __iomem *addr
   arch/hexagon/platform/sm8150/v66_debug.c:127:21: sparse:     got void *
   arch/hexagon/platform/sm8150/v66_debug.c:129:21: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   arch/hexagon/platform/sm8150/v66_debug.c:129:21: sparse:     expected void volatile [noderef] __iomem *addr
   arch/hexagon/platform/sm8150/v66_debug.c:129:21: sparse:     got void *
   arch/hexagon/platform/sm8150/v66_debug.c:132:19: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   arch/hexagon/platform/sm8150/v66_debug.c:132:19: sparse:     expected void volatile [noderef] __iomem *addr
   arch/hexagon/platform/sm8150/v66_debug.c:132:19: sparse:     got void *
   arch/hexagon/platform/sm8150/v66_debug.c:136:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   arch/hexagon/platform/sm8150/v66_debug.c:136:29: sparse:     expected void const volatile [noderef] __iomem *addr
   arch/hexagon/platform/sm8150/v66_debug.c:136:29: sparse:     got void *
   arch/hexagon/platform/sm8150/v66_debug.c:149:21: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   arch/hexagon/platform/sm8150/v66_debug.c:149:21: sparse:     expected void const volatile [noderef] __iomem *addr
   arch/hexagon/platform/sm8150/v66_debug.c:149:21: sparse:     got void *
   arch/hexagon/platform/sm8150/v66_debug.c:151:21: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   arch/hexagon/platform/sm8150/v66_debug.c:151:21: sparse:     expected void volatile [noderef] __iomem *addr
   arch/hexagon/platform/sm8150/v66_debug.c:151:21: sparse:     got void *
   arch/hexagon/platform/sm8150/v66_debug.c:153:21: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   arch/hexagon/platform/sm8150/v66_debug.c:153:21: sparse:     expected void const volatile [noderef] __iomem *addr
   arch/hexagon/platform/sm8150/v66_debug.c:153:21: sparse:     got void *
   arch/hexagon/platform/sm8150/v66_debug.c:155:21: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   arch/hexagon/platform/sm8150/v66_debug.c:155:21: sparse:     expected void volatile [noderef] __iomem *addr
   arch/hexagon/platform/sm8150/v66_debug.c:155:21: sparse:     got void *
   arch/hexagon/platform/sm8150/v66_debug.c:158:23: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   arch/hexagon/platform/sm8150/v66_debug.c:158:23: sparse:     expected void volatile [noderef] __iomem *addr
   arch/hexagon/platform/sm8150/v66_debug.c:158:23: sparse:     got void *
   arch/hexagon/platform/sm8150/v66_debug.c:159:21: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   arch/hexagon/platform/sm8150/v66_debug.c:159:21: sparse:     expected void volatile [noderef] __iomem *addr
   arch/hexagon/platform/sm8150/v66_debug.c:159:21: sparse:     got void *
   arch/hexagon/platform/sm8150/v66_debug.c:163:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   arch/hexagon/platform/sm8150/v66_debug.c:163:29: sparse:     expected void const volatile [noderef] __iomem *addr
   arch/hexagon/platform/sm8150/v66_debug.c:163:29: sparse:     got void *
   arch/hexagon/platform/sm8150/v66_debug.c:184:19: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   arch/hexagon/platform/sm8150/v66_debug.c:184:19: sparse:     expected void const volatile [noderef] __iomem *addr
   arch/hexagon/platform/sm8150/v66_debug.c:184:19: sparse:     got void *
   arch/hexagon/platform/sm8150/v66_debug.c:190:19: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   arch/hexagon/platform/sm8150/v66_debug.c:190:19: sparse:     expected void const volatile [noderef] __iomem *addr
   arch/hexagon/platform/sm8150/v66_debug.c:190:19: sparse:     got void *
   arch/hexagon/platform/sm8150/v66_debug.c:196:19: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   arch/hexagon/platform/sm8150/v66_debug.c:196:19: sparse:     expected void const volatile [noderef] __iomem *addr
   arch/hexagon/platform/sm8150/v66_debug.c:196:19: sparse:     got void *
   arch/hexagon/platform/sm8150/v66_debug.c:203:22: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   arch/hexagon/platform/sm8150/v66_debug.c:203:22: sparse:     expected void volatile [noderef] __iomem *addr
   arch/hexagon/platform/sm8150/v66_debug.c:203:22: sparse:     got void *
   arch/hexagon/platform/sm8150/v66_debug.c:207:21: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   arch/hexagon/platform/sm8150/v66_debug.c:207:21: sparse:     expected void const volatile [noderef] __iomem *addr
   arch/hexagon/platform/sm8150/v66_debug.c:207:21: sparse:     got void *
   arch/hexagon/platform/sm8150/v66_debug.c:209:21: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   arch/hexagon/platform/sm8150/v66_debug.c:209:21: sparse:     expected void volatile [noderef] __iomem *addr
   arch/hexagon/platform/sm8150/v66_debug.c:209:21: sparse:     got void *
   arch/hexagon/platform/sm8150/v66_debug.c:214:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   arch/hexagon/platform/sm8150/v66_debug.c:214:29: sparse:     expected void const volatile [noderef] __iomem *addr
   arch/hexagon/platform/sm8150/v66_debug.c:214:29: sparse:     got void *
   arch/hexagon/platform/sm8150/v66_debug.c:225:21: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   arch/hexagon/platform/sm8150/v66_debug.c:225:21: sparse:     expected void const volatile [noderef] __iomem *addr
   arch/hexagon/platform/sm8150/v66_debug.c:225:21: sparse:     got void *
   arch/hexagon/platform/sm8150/v66_debug.c:227:21: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   arch/hexagon/platform/sm8150/v66_debug.c:227:21: sparse:     expected void volatile [noderef] __iomem *addr
   arch/hexagon/platform/sm8150/v66_debug.c:227:21: sparse:     got void *
   arch/hexagon/platform/sm8150/v66_debug.c:238:28: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   arch/hexagon/platform/sm8150/v66_debug.c:238:28: sparse:     expected void const volatile [noderef] __iomem *addr
   arch/hexagon/platform/sm8150/v66_debug.c:238:28: sparse:     got void *
   arch/hexagon/platform/sm8150/v66_debug.c:282:103: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   arch/hexagon/platform/sm8150/v66_debug.c:282:103: sparse:     expected void const volatile [noderef] __iomem *addr
   arch/hexagon/platform/sm8150/v66_debug.c:282:103: sparse:     got void *
>> arch/hexagon/platform/sm8150/v66_debug.c:312:26: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *[addressable] [toplevel] hexagon_pub_base @@     got void [noderef] __iomem * @@
   arch/hexagon/platform/sm8150/v66_debug.c:312:26: sparse:     expected void *[addressable] [toplevel] hexagon_pub_base
   arch/hexagon/platform/sm8150/v66_debug.c:312:26: sparse:     got void [noderef] __iomem *
>> arch/hexagon/platform/sm8150/v66_debug.c:334:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void *[addressable] [toplevel] hexagon_pub_base @@
   arch/hexagon/platform/sm8150/v66_debug.c:334:17: sparse:     expected void volatile [noderef] __iomem *addr
   arch/hexagon/platform/sm8150/v66_debug.c:334:17: sparse:     got void *[addressable] [toplevel] hexagon_pub_base

vim +/clock_lval_dentry +10 arch/hexagon/platform/sm8150/v66_debug.c

     9	
  > 10	struct dentry *clock_lval_dentry;
  > 11	struct dentry *clock_dump_dentry;
    12	
  > 13	void *hexagon_pub_base;
  > 14	u32 clock_lval;
    15	
    16	//  The original boot loops_per_jiffy is calculated while running at 19.2MHz.
  > 17	unsigned long tcxo_lpj;
    18	
    19	
    20	struct hexagon_ss_register {
    21		const char *name;
    22		u32 offset;
    23	};
    24	
    25	enum reg_index {
    26		PLL_MODE,
    27		PLL_L_VAL,
    28		PLL_CAL_L_VAL,
    29		PLL_USER_CTL,
    30		PLL_USER_CTL_U,
    31		PLL_CONFIG_CTL,
    32		PLL_CONFIG_CTL_U,
    33		PLL_TEST_CTL,
    34		PLL_TEST_CTL_U,
    35		PLL_STATUS,
    36		PLL_FREQ_CTL,
    37		PLL_OPMODE,
    38		PLL_STATE,
    39		PLL_DROOP,
    40		PLL_SPARE,
    41		PLL_SSC_DELTA_ALPHA,
    42		PLL_SSC_UPDATE_RATE,
    43		PLL_SSC_NUM_STEPS,
    44		PLL_RCG_UPDATE_STATUS,
    45		PLL_RCG_UPDATE_CFG,
    46		PLL_RCG_UPDATE_DLYCTL,
    47		PLL_RCG_UPDATE_CMD,
    48		CORE_CFG_RCGR,
    49		CORE_CMD_RCGR,
    50		_REG_COUNT
    51	};
    52	
    53	struct hexagon_ss_register registers[] = {
    54		{ .name = "PLL_MODE",			.offset = 0x200 },
    55		{ .name = "PLL_L_VAL",			.offset = 0x204 },
    56		{ .name = "PLL_CAL_L_VAL",		.offset = 0x208 },
    57		{ .name = "PLL_USER_CTL",		.offset = 0x20c },
    58		{ .name = "PLL_USER_CTL_U",		.offset = 0x210 },
    59		{ .name = "PLL_CONFIG_CTL",		.offset = 0x214 },
    60		{ .name = "PLL_CONFIG_CTL_U",		.offset = 0x218 },
    61		{ .name = "PLL_TEST_CTL",		.offset = 0x21c },
    62		{ .name = "PLL_TEST_CTL_U",		.offset = 0x220 },
    63		{ .name = "PLL_STATUS",			.offset = 0x224 },
    64		{ .name = "PLL_FREQ_CTL",		.offset = 0x228 },
    65		{ .name = "PLL_OPMODE",			.offset = 0x238 },
    66		{ .name = "PLL_STATE",			.offset = 0x23C },
    67		{ .name = "PLL_DROOP",			.offset = 0x234 },
    68		{ .name = "PLL_SPARE",			.offset = 0x23c },
    69		{ .name = "PLL_SSC_DELTA_ALPHA",	.offset = 0x240 },
    70		{ .name = "PLL_SSC_UPDATE_RATE",	.offset = 0x244 },
    71		{ .name = "PLL_SSC_NUM_STEPS",		.offset = 0x248 },
    72		{ .name = "PLL_RCG_UPDATE_STATUS",	.offset = 0x250 },
    73		{ .name = "PLL_RCG_UPDATE_CFG",		.offset = 0x254 },
    74		{ .name = "PLL_RCG_UPDATE_DLYCTL",	.offset = 0x258 },
    75		{ .name = "PLL_RCG_UPDATE_CMD",		.offset = 0x25c },
    76		{ .name = "CORE_CFG_RCGR",		.offset = 0x02c },
    77		{ .name = "CORE_CMD_RCGR",		.offset = 0x028 },
    78	};
    79	
    80	
    81	#define ADDR(REG) (hexagon_pub_base + registers[REG].offset)
    82	#define TIMEOUT 10
    83	
    84	static void init_fabia_pll(u32 Lval)
    85	{
    86	/* 
    87	 * XXX_SM: for real hardware this is a VITAL step as it allows the dsp to
    88	 * full speed.  This is not needed on QQVP.
    89	 * The original PLL is from Hana: TURING_QDSP6SS_PLL_MODE | 0x8300200
    90	 * Lemans: TURINGNSP_0_TURING_CORE0_CORE0_CM_PLL_LUCID_EVO | 0x26000000
    91	 * https://ipcatalog.qualcomm.com/swi/chip/434/version/11766/module/24917394#TURINGNSP_0_TURING_CORE0_PLL_MODE
    92	 */
    93		int i;
    94		u32 val;
    95	
  > 96		val = readl(ADDR(PLL_MODE));
    97		if ((val & (1 << 2)) != 0) {
    98			printk("yo dawg, PLL ain't in reset so I don't know what u thinkin\n");
    99			return;
   100		}
   101	
   102		//  To-do:  Other sanity check:  make sure the PLL really is in the OFF state, or maybe do a check-and-exit?
   103		//  To-do:  disable or check FSM mode?
   104	#define HAL_CLK_UPDATED_CONFIG_CTL_VAL    0x20485699
   105	#define HAL_CLK_UPDATED_CONFIG_CTL_U_VAL  0x00002067
   106	#define HAL_CLK_UPDATED_TEST_CTL_VAL      0x40000000
   107	#define HAL_CLK_UPDATED_TEST_CTL_U_VAL    0x0
   108	#define HAL_CLK_UPDATED_USER_CTL_U_VAL    0x4804
   109	
 > 110		writel(HAL_CLK_UPDATED_CONFIG_CTL_VAL, ADDR(PLL_CONFIG_CTL));
   111		writel(HAL_CLK_UPDATED_CONFIG_CTL_U_VAL, ADDR(PLL_CONFIG_CTL_U));
   112		writel(HAL_CLK_UPDATED_TEST_CTL_VAL, ADDR(PLL_TEST_CTL));
   113		writel(HAL_CLK_UPDATED_TEST_CTL_U_VAL, ADDR(PLL_TEST_CTL_U));
   114		writel(HAL_CLK_UPDATED_USER_CTL_U_VAL, ADDR(PLL_USER_CTL_U));
   115	
   116		writel(Lval, ADDR(PLL_L_VAL));
   117		writel(Lval, ADDR(PLL_CAL_L_VAL));
   118	
   119		val = readl(ADDR(PLL_MODE));
   120		val &= ~1;  //  clear the outctrl bit; turns off outputs
   121		writel(val, ADDR(PLL_MODE));
   122	
   123		//  set the opmode to standby
   124		writel(0, ADDR(PLL_OPMODE));
   125	
   126		//  resetn = 1
   127		val = readl(ADDR(PLL_MODE));
   128		val |= 1 << 2;  // "NO_RESET"
   129		writel(val, ADDR(PLL_MODE));
   130	
   131		//  "Command the PLL to begin running"
   132		writel(1, ADDR(PLL_OPMODE));  //  "RUN!!!!!!"
   133	
   134		i=0;
   135		while (i < TIMEOUT) {
   136			val = readl(ADDR(PLL_MODE));
   137			if (val >> 31) {
   138				break;
   139			}
   140			//msleep(1);
   141			i++;
   142		}
   143		if (i >= TIMEOUT) {
   144			printk("Timeout waiting for PLL lock detect; aborting\n");
   145			printk("***: Your target might be slow ***\n");
   146			return;
   147		}
   148	
   149		val = readl(ADDR(PLL_USER_CTL));
   150		val |= 1;  //  enable main output of PLL
   151		writel(val, ADDR(PLL_USER_CTL));
   152	
   153		val = readl(ADDR(PLL_MODE));
   154		val |= 1;  //  globally enable the outputs of the PLL
   155		writel(val, ADDR(PLL_MODE));
   156	
   157		//  Switch Hexagon over to use the PLL output
   158		writel(0x201, ADDR(CORE_CFG_RCGR));
   159		writel(0x1, ADDR(CORE_CMD_RCGR));
   160	
   161		i=0;
   162		while (i < TIMEOUT) {
   163			val = readl(ADDR(CORE_CMD_RCGR));
   164			if ((val & 1) == 0) {
   165				break;
   166			}
   167			//msleep(10);  // boy this cmd takes a long time
   168			i++;
   169		}
   170		if (i >= TIMEOUT) {
   171			printk("Timeout waiting for RCG CMD\n");
   172			return;
   173		}
   174	
   175		loops_per_jiffy = tcxo_lpj * Lval;
   176	}
   177	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
