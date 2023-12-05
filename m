Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14130CA5C
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Dec 2023 06:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QVcUtopH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701756883; x=1733292883;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=P22G+XUg1LKXwSJkfjvjAJBfa2ezNTRwllh14LyXsyQ=;
  b=QVcUtopHPE4B6x2IjW8bZAIoA0lau793uIPWX+aEo8HSzgGFiaYTjFSN
   vvqO/m33J1w7M/nlQvt7uQahOMKvrz9lmwPDnHklMeYzmqYCPsyutQd40
   Qm8sG5J2Pv9ZdUb8vWu1GCDc4NdyuJHn0Eb4t64+RopZ6cIZtwxvuEF7j
   ElpUPOLozHtdr6YVl/QLEdFQyWrpo5EmEkf77TcWlG0DuzfpsjG32WEiO
   4igFzY07jW/OK4zLBVoD5FhqkLOlAHFt8OiexYXBJx9zeb7jkr0/Qd4fl
   ZrhgUI7GixuRewO2QeBKxWD3DNJpu1eLqVSZ1m/byIvSKq7N5+7huKwX1
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="907964"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; 
   d="scan'208";a="907964"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2023 22:14:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="944144438"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; 
   d="scan'208";a="944144438"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 04 Dec 2023 22:14:40 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAOhZ-0008Px-1H;
	Tue, 05 Dec 2023 06:14:37 +0000
Date: Tue, 5 Dec 2023 14:13:44 +0800
From: kernel test robot <lkp@intel.com>
To: Ignat Korchagin <ignat@cloudflare.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master 3906/4597] arch/arm/kernel/machine_kexec.c:62:23:
 sparse: sparse: incorrect type in argument 1 (different address spaces)
Message-ID: <202312051419.DsbnPGym-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0f5f12ac05f36f117e793656c3f560625e927f1b
commit: 70a370fa006a78b291d86789af26acd047679861 [3906/4597] kexec: drop dependency on ARCH_SUPPORTS_KEXEC from CRASH_DUMP
config: arm-randconfig-r133-20231204 (https://download.01.org/0day-ci/archive/20231205/202312051419.DsbnPGym-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20231205/202312051419.DsbnPGym-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312051419.DsbnPGym-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/arm/kernel/machine_kexec.c:62:23: sparse: sparse: cast removes address space '__user' of expression
   arch/arm/kernel/machine_kexec.c:62:23: sparse: sparse: cast removes address space '__user' of expression
>> arch/arm/kernel/machine_kexec.c:62:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __user *ptr @@     got restricted __be32 [usertype] * @@
   arch/arm/kernel/machine_kexec.c:62:23: sparse:     expected void const volatile [noderef] __user *ptr
   arch/arm/kernel/machine_kexec.c:62:23: sparse:     got restricted __be32 [usertype] *
   arch/arm/kernel/machine_kexec.c:62:23: sparse: sparse: cast removes address space '__user' of expression
   arch/arm/kernel/machine_kexec.c:62:23: sparse: sparse: cast removes address space '__user' of expression
   arch/arm/kernel/machine_kexec.c:62:23: sparse: sparse: cast to restricted __be32

vim +62 arch/arm/kernel/machine_kexec.c

b23065313297e7 Per Fransson       2010-12-03  27  
c587e4a6a4d808 Richard Purdie     2007-02-06  28  /*
c587e4a6a4d808 Richard Purdie     2007-02-06  29   * Provide a dummy crash_notes definition while crash dump arrives to arm.
c587e4a6a4d808 Richard Purdie     2007-02-06  30   * This prevents breakage of crash_notes attribute in kernel/ksysfs.c.
c587e4a6a4d808 Richard Purdie     2007-02-06  31   */
c587e4a6a4d808 Richard Purdie     2007-02-06  32  
c587e4a6a4d808 Richard Purdie     2007-02-06  33  int machine_kexec_prepare(struct kimage *image)
c587e4a6a4d808 Richard Purdie     2007-02-06  34  {
4cabd1d9625c7d Matthew Leach      2012-09-21  35  	struct kexec_segment *current_segment;
4cabd1d9625c7d Matthew Leach      2012-09-21  36  	__be32 header;
4cabd1d9625c7d Matthew Leach      2012-09-21  37  	int i, err;
4cabd1d9625c7d Matthew Leach      2012-09-21  38  
0d70262a2d6088 Russell King       2017-07-19  39  	image->arch.kernel_r2 = image->start - KEXEC_ARM_ZIMAGE_OFFSET
0d70262a2d6088 Russell King       2017-07-19  40  				     + KEXEC_ARM_ATAGS_OFFSET;
0d70262a2d6088 Russell King       2017-07-19  41  
2103f6cba61a8b Stephen Warren     2013-08-02  42  	/*
2103f6cba61a8b Stephen Warren     2013-08-02  43  	 * Validate that if the current HW supports SMP, then the SW supports
2103f6cba61a8b Stephen Warren     2013-08-02  44  	 * and implements CPU hotplug for the current HW. If not, we won't be
2103f6cba61a8b Stephen Warren     2013-08-02  45  	 * able to kexec reliably, so fail the prepare operation.
2103f6cba61a8b Stephen Warren     2013-08-02  46  	 */
fee3fd4fd2ad13 Geert Uytterhoeven 2015-04-01  47  	if (num_possible_cpus() > 1 && platform_can_secondary_boot() &&
fee3fd4fd2ad13 Geert Uytterhoeven 2015-04-01  48  	    !platform_can_cpu_hotplug())
2103f6cba61a8b Stephen Warren     2013-08-02  49  		return -EINVAL;
2103f6cba61a8b Stephen Warren     2013-08-02  50  
4cabd1d9625c7d Matthew Leach      2012-09-21  51  	/*
4cabd1d9625c7d Matthew Leach      2012-09-21  52  	 * No segment at default ATAGs address. try to locate
4cabd1d9625c7d Matthew Leach      2012-09-21  53  	 * a dtb using magic.
4cabd1d9625c7d Matthew Leach      2012-09-21  54  	 */
4cabd1d9625c7d Matthew Leach      2012-09-21  55  	for (i = 0; i < image->nr_segments; i++) {
4cabd1d9625c7d Matthew Leach      2012-09-21  56  		current_segment = &image->segment[i];
4cabd1d9625c7d Matthew Leach      2012-09-21  57  
0719392a61a9db Russell King       2016-08-02  58  		if (!memblock_is_region_memory(idmap_to_phys(current_segment->mem),
2456f44dd7a9aa Aaro Koskinen      2012-10-16  59  					       current_segment->memsz))
c564df4db85aac Matthew Leach      2012-09-21  60  			return -EINVAL;
c564df4db85aac Matthew Leach      2012-09-21  61  
4cabd1d9625c7d Matthew Leach      2012-09-21 @62  		err = get_user(header, (__be32*)current_segment->buf);
4cabd1d9625c7d Matthew Leach      2012-09-21  63  		if (err)
4cabd1d9625c7d Matthew Leach      2012-09-21  64  			return err;
4cabd1d9625c7d Matthew Leach      2012-09-21  65  
0d70262a2d6088 Russell King       2017-07-19  66  		if (header == cpu_to_be32(OF_DT_HEADER))
0d70262a2d6088 Russell King       2017-07-19  67  			image->arch.kernel_r2 = current_segment->mem;
4cabd1d9625c7d Matthew Leach      2012-09-21  68  	}
c587e4a6a4d808 Richard Purdie     2007-02-06  69  	return 0;
c587e4a6a4d808 Richard Purdie     2007-02-06  70  }
c587e4a6a4d808 Richard Purdie     2007-02-06  71  

:::::: The code at line 62 was first introduced by commit
:::::: 4cabd1d9625c7d88acd143f4021fbef75394f154 ARM: 7539/1: kexec: scan for dtb magic in segments

:::::: TO: Matthew Leach <matthew.leach@arm.com>
:::::: CC: Russell King <rmk+kernel@arm.linux.org.uk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
