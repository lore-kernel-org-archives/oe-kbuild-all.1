Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF7C5271828
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Feb 2025 08:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739350653; cv=none; b=dvo2sCYv5nkMsqOh0GT+dDWvMJVcuTghyz2W5C8m5aP7x23kounLcZGfk65NiQh+8qfrAthJWfb+hYxEPybeZo2hNtME7XUflvqqQOgg+K+vfGsB+sj4W+Vc3E4FQaMtbwj0OhQrP/svY3HJR+a2e7JBnyapXsgamJRXKnPIjO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739350653; c=relaxed/simple;
	bh=1b9qnNAPaXamkD9bX7IBorZ/CJOOzKYQ9fO9pN6MhRk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=o0uCSaTfmaidVx+SOTcED1kUcvSlCLzYX02P+OtNjgkKdzDQn3T7DrEkrToEMgHU0DqFlpPKfkCagH6w4aNOsJRT7tZwmHASCeMPkGhSNnZsY2zO/ARfgtMD6KfZM/g6eWwIEGFPZft7E5fYnY6nnawVouVDcZ7WwG4sh366Ifw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ms7XOTgt; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ms7XOTgt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739350651; x=1770886651;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1b9qnNAPaXamkD9bX7IBorZ/CJOOzKYQ9fO9pN6MhRk=;
  b=Ms7XOTgtHv5+4d6DSuv5BRRA5CB5jmV5UayBHWQiFjNeqrsP4PkkJ3RI
   yvIxTG6Afc+3ilXKhbFm7zEQozX4QLCBlv+5nY/RS/d40PS/vmYn6PcbF
   p0w6xmyhEnuz8/N6f2TXRFEvsvtkP+N/+qsaPF5zrJoLHVp8jQ5sW3R9l
   +gKp+XMg89x5mniB/UWBJShrC+Jpa0Z9scp7k/EmzoU4QbNHxKmfkI2XC
   v9HEbjSB9N64UYLfQ7+8FXC8cRQgKxXufHfzw11BB1nHjCjce5GKkaiFD
   t7YHkRzLB4RbSnNhruDvcgr1zvtVbX0/XkeHMJ1ZYmOSt1JNbrGATErWB
   Q==;
X-CSE-ConnectionGUID: FJZ+r8d2Sb2yhveqP0u8mQ==
X-CSE-MsgGUID: owLrxTwSTFyUrRir7Rn/fA==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="50630734"
X-IronPort-AV: E=Sophos;i="6.13,279,1732608000"; 
   d="scan'208";a="50630734"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2025 00:57:30 -0800
X-CSE-ConnectionGUID: zjeUIq1lQ6GGpirbu7r1WA==
X-CSE-MsgGUID: JFKHM9yIT8O4xRaMOihfWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,279,1732608000"; 
   d="scan'208";a="117778391"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 12 Feb 2025 00:57:29 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ti8Yg-0015PC-1O;
	Wed, 12 Feb 2025 08:57:26 +0000
Date: Wed, 12 Feb 2025 16:57:24 +0800
From: kernel test robot <lkp@intel.com>
To: elver@google.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [melver:cap-analysis 29/29] include/linux/irq.h:1226:1: warning:
 raw_spinlock 'gc->lock' is still held at the end of function
Message-ID: <202502121639.Ib6bcPCB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/melver/linux.git cap-analysis
head:   62e4de14389b44299be85eea5a580e6b497fdf43
commit: 62e4de14389b44299be85eea5a580e6b497fdf43 [29/29] DO-NOT-SEND: drivers: Assorted enablement and annotations
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20250212/202502121639.Ib6bcPCB-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250212/202502121639.Ib6bcPCB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502121639.Ib6bcPCB-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/xlnx/zynqmp_dpsub.c:13:
   In file included from include/linux/dma-mapping.h:5:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:181:
   In file included from arch/s390/include/asm/mmu_context.h:11:
   In file included from arch/s390/include/asm/pgalloc.h:18:
   In file included from include/linux/mm.h:2227:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/xlnx/zynqmp_dpsub.c:24:
   In file included from include/drm/drm_module.h:6:
   In file included from include/linux/pci.h:2099:
   In file included from arch/s390/include/asm/pci.h:7:
   In file included from include/linux/iommu.h:1506:
   In file included from include/linux/msi.h:24:
>> include/linux/irq.h:1226:1: warning: raw_spinlock 'gc->lock' is still held at the end of function [-Wthread-safety-analysis]
    1226 | }
         | ^
   include/linux/irq.h:1225:2: note: raw_spinlock acquired here
    1225 |         raw_spin_lock(&gc->lock);
         |         ^
   include/linux/spinlock.h:218:29: note: expanded from macro 'raw_spin_lock'
     218 | #define raw_spin_lock(lock)     _raw_spin_lock(lock)
         |                                 ^
   In file included from drivers/gpu/drm/xlnx/zynqmp_dpsub.c:24:
   In file included from include/drm/drm_module.h:6:
   In file included from include/linux/pci.h:2099:
   In file included from arch/s390/include/asm/pci.h:7:
   In file included from include/linux/iommu.h:1506:
   In file included from include/linux/msi.h:24:
>> include/linux/irq.h:1230:2: warning: releasing raw_spinlock 'gc->lock' that was not held [-Wthread-safety-analysis]
    1230 |         raw_spin_unlock(&gc->lock);
         |         ^
   include/linux/spinlock.h:277:32: note: expanded from macro 'raw_spin_unlock'
     277 | #define raw_spin_unlock(lock)           _raw_spin_unlock(lock)
         |                                         ^
   5 warnings generated.


vim +1226 include/linux/irq.h

7d8280624797bb Thomas Gleixner 2011-04-03  1221  
7d8280624797bb Thomas Gleixner 2011-04-03  1222  #ifdef CONFIG_SMP
7d8280624797bb Thomas Gleixner 2011-04-03  1223  static inline void irq_gc_lock(struct irq_chip_generic *gc)
7d8280624797bb Thomas Gleixner 2011-04-03  1224  {
7d8280624797bb Thomas Gleixner 2011-04-03  1225  	raw_spin_lock(&gc->lock);
7d8280624797bb Thomas Gleixner 2011-04-03 @1226  }
7d8280624797bb Thomas Gleixner 2011-04-03  1227  
7d8280624797bb Thomas Gleixner 2011-04-03  1228  static inline void irq_gc_unlock(struct irq_chip_generic *gc)
7d8280624797bb Thomas Gleixner 2011-04-03  1229  {
7d8280624797bb Thomas Gleixner 2011-04-03 @1230  	raw_spin_unlock(&gc->lock);
7d8280624797bb Thomas Gleixner 2011-04-03  1231  }
7d8280624797bb Thomas Gleixner 2011-04-03  1232  #else
7d8280624797bb Thomas Gleixner 2011-04-03  1233  static inline void irq_gc_lock(struct irq_chip_generic *gc) { }
7d8280624797bb Thomas Gleixner 2011-04-03  1234  static inline void irq_gc_unlock(struct irq_chip_generic *gc) { }
7d8280624797bb Thomas Gleixner 2011-04-03  1235  #endif
7d8280624797bb Thomas Gleixner 2011-04-03  1236  

:::::: The code at line 1226 was first introduced by commit
:::::: 7d8280624797bbe2f5170bd3c85c75a8c9c74242 genirq: Implement a generic interrupt chip

:::::: TO: Thomas Gleixner <tglx@linutronix.de>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
