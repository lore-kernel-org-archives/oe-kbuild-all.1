Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5BFD1885AA
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Dec 2024 09:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734861291; cv=none; b=Teu9Z26ZorQZsVgmKlfXFXn+Iyw5Wf+MUQNzEZO9Cid8wxPYQMM6sYMfQ1hTchj5thpoTaviT8ViDBeW4b4loEWBf35Dv0WNYyQKyAHwcSY6ZnG/fhzMUXraVnkpI0v0DCWYYprMZsQ8tGmDI42sIpXpMB7tn8zkithR/Gwp/V8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734861291; c=relaxed/simple;
	bh=73kUblpvYgg7Rqm1l/jHkf26VL79zegLHpb1xDmSip8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VQtQTQqjW1e76n03TrmDGDftxhMLymC6z80GUTX1rsoPXxy8uQOd0sFr64FC0t8cPrigjk2lVJO5zimcazkzR6COqtZ3nSe8OV8B1A8GhpCavRPGHEHjJsid60hiCsv9diutPgSr2/Exr5fQjq+//1MXo2Jsq7G3T2nGToOVU5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UaaGFE+Z; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UaaGFE+Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734861290; x=1766397290;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=73kUblpvYgg7Rqm1l/jHkf26VL79zegLHpb1xDmSip8=;
  b=UaaGFE+ZbdW/Wj+zi87nqVdudKMRq1w5BNmWNcxvv8Y8alES8UDBlBf/
   8OsDNDLtQjIaF8epeIlAgCTYuol9Ft3FPqL/s9EDRrMytvILH4uIH057F
   7ucRMjrYHo7rIeayGrjIzlsuFJBSvtxfv6CEuxiOxApUJhRVKHDqI4wcm
   t3CLmfWqSoIaNoKWMXkjJYrV9e5Bn+I3OYhNl9AJ2DXHw4NlSTo1o+IY/
   mnkotqp1Dc2rbG6OqZMbBY9xhry+GsnodBT0+jl+0/s4StqnFKF9jXlGb
   QRexahfJfxDMw2Awl3Iyo7FZdG5gzKS6+KSphHiFWP9Z+OQPJCdDEjCAp
   A==;
X-CSE-ConnectionGUID: 4pExHL5nRHSAQtpRlxl08Q==
X-CSE-MsgGUID: FCOFlCAqRLCZB4w464lpGg==
X-IronPort-AV: E=McAfee;i="6700,10204,11293"; a="34631895"
X-IronPort-AV: E=Sophos;i="6.12,255,1728975600"; 
   d="scan'208";a="34631895"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2024 01:54:47 -0800
X-CSE-ConnectionGUID: QT1s680ORZuS20w8vEqW9A==
X-CSE-MsgGUID: tIS34pV8QumTBHTLPRPCQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="98782921"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 22 Dec 2024 01:54:47 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tPIfb-0002pL-2p;
	Sun, 22 Dec 2024 09:54:43 +0000
Date: Sun, 22 Dec 2024 17:53:59 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 6527/20534]
 arch/arm/kernel/machine_kexec.c:62:23: sparse: sparse: incorrect type in
 argument 1 (different address spaces)
Message-ID: <202412221713.ffVzVK5U-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   86179fae27728adcff4d241b6e81ff7dc92b4091
commit: 37b561d55936d0fcebd199d22180e595bb72b784 [6527/20534] kexec: drop dependency on ARCH_SUPPORTS_KEXEC from CRASH_DUMP
config: arm-randconfig-r131-20241222 (https://download.01.org/0day-ci/archive/20241222/202412221713.ffVzVK5U-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce: (https://download.01.org/0day-ci/archive/20241222/202412221713.ffVzVK5U-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412221713.ffVzVK5U-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/arm/kernel/machine_kexec.c:62:23: sparse: sparse: cast removes address space '__user' of expression
   arch/arm/kernel/machine_kexec.c:62:23: sparse: sparse: cast removes address space '__user' of expression
>> arch/arm/kernel/machine_kexec.c:62:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __user *ptr @@     got restricted __be32 [usertype] * @@
   arch/arm/kernel/machine_kexec.c:62:23: sparse:     expected void const volatile [noderef] __user *ptr
   arch/arm/kernel/machine_kexec.c:62:23: sparse:     got restricted __be32 [usertype] *
   arch/arm/kernel/machine_kexec.c:62:23: sparse: sparse: cast removes address space '__user' of expression
   arch/arm/kernel/machine_kexec.c:62:23: sparse: sparse: cast removes address space '__user' of expression
   arch/arm/kernel/machine_kexec.c:62:23: sparse: sparse: cast to restricted __be32
   arch/arm/kernel/machine_kexec.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/mm.h):
   include/linux/page-flags.h:242:46: sparse: sparse: self-comparison always evaluates to false

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
