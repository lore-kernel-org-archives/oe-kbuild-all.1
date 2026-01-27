Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F8DB2E7BD9
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 Jan 2026 04:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769489847; cv=none; b=p/XBH0f/WbX6j+6aa15IMbiAW5EziP3Rx30M7cPpQV1+L/2EV2rRY8WwXh6WZhp59wovHgQaM1zrlr7Txtnw8m98TOwqgYKK92Olmc86Jvsvk40m/kL5xa2QDg4tMoTYhpMBlRVmARjjxcWCXyzDdjzUyngaYCjXWUL2nDr1rTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769489847; c=relaxed/simple;
	bh=ClRxzBvvOAJ67nshkP8czecXBaW0lxyBs7USIUXwsyY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UNdqIwaEjpCKDoL+54+Hmh/6EWZUi7awOgJfsjP1XyXtI1zFLyPM2Q2GH3Y8ovuTR55Y0BFmEiC2pZ0ie6cd0C7f5rdftxB4b9S3yPwSpkLe2xTVJrPYY6YXz+eNFo5AO5SLOrO8Rgr0skO8xQUmt2PI8RemNn5w0IF4T7RcP0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=liuQXtEZ; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="liuQXtEZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769489845; x=1801025845;
  h=date:from:to:cc:subject:message-id;
  bh=ClRxzBvvOAJ67nshkP8czecXBaW0lxyBs7USIUXwsyY=;
  b=liuQXtEZhbrGRzVx/wYK145sbVK6J7gxoN5Re3zvFJ1hj5rq235HqWYG
   1ezIBYNh6m1bKFhXPhqwXsEAd/FmW6VpY/mPL1Q1XY/6zivVClK//pIBt
   wgPKzm1qaYIUbKUviGhXR9QJW7TS6C9suR1KzPSbkCN7B62xO3pE5h5Oz
   4b5qn1SIHJ0GyCmrawsKvK2SqUpQSSM8rEMEvy3HZlK0bLwAbyAEFsIkD
   WX0wH0DmAe0FLZFeSLGjQgpAPr6YYeRXRHvBzwDJcjfFckSTzfcBLyDzX
   TrvcwJgdCK22eA3hT+ixA3sRzjQXjE7P9x8L+jDPlKuNqOXIyvzGOlB/k
   g==;
X-CSE-ConnectionGUID: MnDH36nRSgWlm4Vo2joc+Q==
X-CSE-MsgGUID: 7DChqkkYS7u/dOxjiooKmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="70646605"
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="70646605"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 20:56:55 -0800
X-CSE-ConnectionGUID: NqzAWBP2RfyIJONLPBBvVA==
X-CSE-MsgGUID: uFcj+ESiSAWmVmYKjpK2Fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="208232208"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 26 Jan 2026 20:56:53 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkb8E-00000000Y0U-2bPz;
	Tue, 27 Jan 2026 04:56:50 +0000
Date: Tue, 27 Jan 2026 12:56:27 +0800
From: kernel test robot <lkp@intel.com>
To: Paul Mackerras <paulus@ozlabs.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Madhavan Srinivasan <maddy@linux.ibm.com>
Subject: arch/powerpc/platforms/microwatt/smp.c:79:24: sparse:
 sparse: cast removes address space '__iomem' of expression
Message-ID: <202601271250.ASHv58o3-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fcb70a56f4d81450114034b2c61f48ce7444a0e2
commit: aca95fb6bb572a77f39d42d83ab72a965026577d powerpc/microwatt: Add SMP support
date:   11 months ago
config: powerpc64-randconfig-r123-20260126 (https://download.01.org/0day-ci/archive/20260127/202601271250.ASHv58o3-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260127/202601271250.ASHv58o3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601271250.ASHv58o3-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/powerpc/platforms/microwatt/smp.c:79:24: sparse: sparse: cast removes address space '__iomem' of expression
>> arch/powerpc/platforms/microwatt/smp.c:79:24: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __iomem *addr @@     got void * @@
   arch/powerpc/platforms/microwatt/smp.c:79:24: sparse:     expected void [noderef] __iomem *addr
   arch/powerpc/platforms/microwatt/smp.c:79:24: sparse:     got void *

vim +/__iomem +79 arch/powerpc/platforms/microwatt/smp.c

    42	
    43	void __init microwatt_init_smp(void)
    44	{
    45		volatile unsigned char __iomem *syscon;
    46		int ncpus;
    47		int timeout;
    48	
    49		syscon = early_ioremap(SYSCON_BASE, SYSCON_LENGTH);
    50		if (syscon == NULL) {
    51			pr_err("Failed to map SYSCON\n");
    52			return;
    53		}
    54		ncpus = (readl(syscon + SYSCON_CPU_CTRL) >> 8) & 0xff;
    55		if (ncpus < 2)
    56			goto out;
    57	
    58		smp_ops = &microwatt_smp_ops;
    59	
    60		/*
    61		 * Write two instructions at location 0:
    62		 * mfspr r3, PIR
    63		 * b __secondary_hold
    64		 */
    65		*(unsigned int *)KERNELBASE = PPC_RAW_MFSPR(3, SPRN_PIR);
    66		*(unsigned int *)(KERNELBASE+4) = PPC_RAW_BRANCH(&__secondary_hold - (char *)(KERNELBASE+4));
    67	
    68		/* enable the other CPUs, they start at location 0 */
    69		writel((1ul << ncpus) - 1, syscon + SYSCON_CPU_CTRL);
    70	
    71		timeout = 10000;
    72		while (!__secondary_hold_acknowledge) {
    73			if (--timeout == 0)
    74				break;
    75			barrier();
    76		}
    77	
    78	 out:
  > 79		early_iounmap((void *)syscon, SYSCON_LENGTH);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
