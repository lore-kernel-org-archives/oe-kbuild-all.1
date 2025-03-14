Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4678422339
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Mar 2025 06:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741934994; cv=none; b=kyNklhxtnlwVE5WxTksMMrFZ7J18Wm+yzPSd4NidcEXwf1sBag1YRDqHMypdmv4g6Jn3qlLIU8Ou+AHina7lZ6umhC7JHP20FPNP/fbtQOwAcqMnpRLsN1ZOc1TOPS5FtJYzWn1SktKX8Oupqtmwo1UC1aBPToKanXI6iUfgIj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741934994; c=relaxed/simple;
	bh=JqkTWrpWOZlaPsq3wluVA8+erPvbuQ8rp87tgHOOj8g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=B7jhEAfe3YEgXFIJ3dOHhT0gVbF7VaysOaTKrsSqb0+deqDtny0z3IUZjvKOxwpeuS94WeX5wOW46OE0Xzk6Xe3megW6kYTx9cF6s5sLI3ppmB3hUqLbNiH3Zs7Vtc2LBzlNIpJI5QzLemqmuR5QLpaQS5mguM5H1rlhDRwrKD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xe1BVmfk; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xe1BVmfk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741934992; x=1773470992;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JqkTWrpWOZlaPsq3wluVA8+erPvbuQ8rp87tgHOOj8g=;
  b=Xe1BVmfkEB6j2Owm57Oy0ZjxgsoyxkjCvLofdpR7pLFXqTyZ44leW+SF
   pQHaVXWOyDxr1FTxyrpd1Aw5BgruHDm6fafT07xNXsaYMnxFfcqsugEAo
   f/2cccfWp6s/6UxSzuOnnq1oUCQ5pmPUSyTSyuI3epPuSJfsjoA3PgVrQ
   e1/45jeDnvKsMTHQSUklPLQT2KfSZVm+Le97DxBxnHRsdVXAdA51rqGnX
   mU8JZYg26HwgKW+fbj3t2KlEMAkk1RhOByQBAwcT/idtTwhu14C+NsFLE
   VkxUqH1gwnMAWaE/I+N9eFvzUEN5d56RiDi75JuNjD9GgrOufIGAwDshm
   Q==;
X-CSE-ConnectionGUID: W2kPDrKQTrKQ5cjndotz3A==
X-CSE-MsgGUID: dGDktLlXQcOKxv05qeey+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11372"; a="46975992"
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; 
   d="scan'208";a="46975992"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2025 23:49:52 -0700
X-CSE-ConnectionGUID: 6BJzNC1uQJm2+Tq8WwBmIA==
X-CSE-MsgGUID: pNLs35lwTQKwA7NiiOyiKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; 
   d="scan'208";a="158317846"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 13 Mar 2025 23:49:51 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tsyrc-000ABW-12;
	Fri, 14 Mar 2025 06:49:48 +0000
Date: Fri, 14 Mar 2025 14:48:58 +0800
From: kernel test robot <lkp@intel.com>
To: Paul Mackerras <paulus@ozlabs.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Madhavan Srinivasan <maddy@linux.ibm.com>
Subject: [linuxppc:next 55/61] arch/powerpc/platforms/microwatt/smp.c:79:24:
 sparse: sparse: cast removes address space '__iomem' of expression
Message-ID: <202503141407.ioF2BsGi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/linuxppc/linux next
head:   861efb8a48ee8b73ae4e8817509cd4e82fd52bc4
commit: aca95fb6bb572a77f39d42d83ab72a965026577d [55/61] powerpc/microwatt: Add SMP support
config: powerpc64-randconfig-r122-20250314 (https://download.01.org/0day-ci/archive/20250314/202503141407.ioF2BsGi-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250314/202503141407.ioF2BsGi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503141407.ioF2BsGi-lkp@intel.com/

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
