Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3E2B2500A1
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Feb 2025 15:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739029460; cv=none; b=s3MWVpwhhDN8g4ixzw1OHHIRr8jB/jgxGhzN43KLbFt2EysCkaP1XTJggGt+2TP9VmGvw9SaC+kWPVX3uAhU7Oc3o8JqSr/sEuJy12tZFcLD878PkO9RknDeik68B8ZXoqx7XaA+h6DgHd6ewASyreU1XxFV32LGcHvuB8/iFFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739029460; c=relaxed/simple;
	bh=ZYvZgKRdOqLHb6Gp+t0IQxWp/UjX54mdAGkjrUokLT4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AwM8Z4A3jko8Q7ZyjxppZ7Aj6HhYd8qL6T47nIfrWIBTZZ30HlieGPpiDym27VUbQLsk4ghjR3MeQfUPBkffdcL48AUXLdZmPVzouKDQ7/KMJzTmZoQxhkYbFj5uIsGKoCgBz5rccSpnyl8UkWZAUHp0UYGoIrjkfIVTac48ge0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cbq7z8cV; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cbq7z8cV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739029459; x=1770565459;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZYvZgKRdOqLHb6Gp+t0IQxWp/UjX54mdAGkjrUokLT4=;
  b=cbq7z8cVUcomV8RN8emd26LKASrPba2B4K3EAreEyHBNNDvVxVns7uRG
   YRFeNtdj6Cyuzzn8avYxUMwIhT0KIxCttdvqCxK3V4Vf0gx0C9QG0iUnl
   Q8msTOlK8wAigqZXsyEfIr9yq2yFeZLRthzjBuVln+M9HKusZGFOuHw6Y
   qsfhRY0Rp+rcNksDbQNX52piCPYKO35HTjTwNSFahNvydghhuahSFH700
   rHzXf3NVjBBDKBuq/lEb7yy9mR1RaSlR2PRJ7Z19k9oDPYnUytAN8DSvS
   7bjVzS6QMOL/Ry7KEYQ5CAYCHvJNyAV1G+RKVz11ebPX+rjVMf+HDp9tr
   w==;
X-CSE-ConnectionGUID: hJQMblVhTaikNe4hVE6etg==
X-CSE-MsgGUID: tQnPaYtlS1+zixy1ClV0pA==
X-IronPort-AV: E=McAfee;i="6700,10204,11339"; a="50285378"
X-IronPort-AV: E=Sophos;i="6.13,270,1732608000"; 
   d="scan'208";a="50285378"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2025 07:44:16 -0800
X-CSE-ConnectionGUID: vGmw9m2vSwSdLTc6ufezMg==
X-CSE-MsgGUID: PiEXl7kwRY+/WnfDYXlzoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="112682431"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 08 Feb 2025 07:44:15 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgn08-0010EC-2R;
	Sat, 08 Feb 2025 15:44:12 +0000
Date: Sat, 8 Feb 2025 23:43:30 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.13/invlpgb-v9 5/13] arch/x86/include/asm/invlpgb.h:30:49:
 error: invalid input size for constraint 'a'
Message-ID: <202502082340.MdGy6PqI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/zen-kernel/zen-kernel 6.13/invlpgb-v9
head:   df542b65e9753dea56b584fdca48cb8f8e3f74cd
commit: 83464118a5db5f7faeadcfac9a09205147c0c604 [5/13] x86/mm: add INVLPGB support code
config: i386-buildonly-randconfig-002-20250208 (https://download.01.org/0day-ci/archive/20250208/202502082340.MdGy6PqI-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250208/202502082340.MdGy6PqI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502082340.MdGy6PqI-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:9:
   In file included from include/linux/sched/task.h:13:
   In file included from include/linux/uaccess.h:12:
   In file included from arch/x86/include/asm/uaccess.h:17:
   In file included from arch/x86/include/asm/tlbflush.h:13:
>> arch/x86/include/asm/invlpgb.h:30:49: error: invalid input size for constraint 'a'
      30 |         asm volatile(".byte 0x0f, 0x01, 0xfe" : : "a" (rax), "c" (ecx), "d" (edx));
         |                                                        ^
   1 error generated.
   make[3]: *** [scripts/Makefile.build:102: arch/x86/kernel/asm-offsets.s] Error 1 shuffle=3934676415
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1263: prepare0] Error 2 shuffle=3934676415
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:251: __sub-make] Error 2 shuffle=3934676415
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:251: __sub-make] Error 2 shuffle=3934676415
   make: Target 'prepare' not remade because of errors.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for X86_BROADCAST_TLB_FLUSH
   Depends on [n]: CPU_SUP_AMD [=y] && 64BIT [=n]
   Selected by [y]:
   - CPU_SUP_AMD [=y]


vim +/a +30 arch/x86/include/asm/invlpgb.h

     8	
     9	/*
    10	 * INVLPGB does broadcast TLB invalidation across all the CPUs in the system.
    11	 *
    12	 * The INVLPGB instruction is weakly ordered, and a batch of invalidations can
    13	 * be done in a parallel fashion.
    14	 *
    15	 * TLBSYNC is used to ensure that pending INVLPGB invalidations initiated from
    16	 * this CPU have completed.
    17	 */
    18	static inline void __invlpgb(unsigned long asid, unsigned long pcid,
    19				     unsigned long addr, u16 extra_count,
    20				     bool pmd_stride, u8 flags)
    21	{
    22		u32 edx = (pcid << 16) | asid;
    23		u32 ecx = (pmd_stride << 31) | extra_count;
    24		u64 rax = addr | flags;
    25	
    26		/* The low bits in rax are for flags. Verify addr is clean. */
    27		VM_WARN_ON_ONCE(addr & ~PAGE_MASK);
    28	
    29		/* INVLPGB; supported in binutils >= 2.36. */
  > 30		asm volatile(".byte 0x0f, 0x01, 0xfe" : : "a" (rax), "c" (ecx), "d" (edx));
    31	}
    32	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
