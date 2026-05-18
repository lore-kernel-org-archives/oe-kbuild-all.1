Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 101972EA48F
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 May 2026 21:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779140152; cv=none; b=BB8cRupWGsbJyqPWABJlKQMpaoGi5+xXlonhuOQzF6o/1yVERGvnjuTnQvyIm35imPwh9HYCL+D/YaiS6d2aeTphEUH32hYVVextjbCPL9g4akVVtqdasc8wY/F8Zjo+mU4syrXF93qMwAyk4nU5HAIz2/YMHcYQXhvZLl6VlNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779140152; c=relaxed/simple;
	bh=xq7UzTOpyWLUb0mEL4MhQRr85TUCMTYlbzBc/RABUJc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=S/nwpQ4CPs23w2gapLIhSyGJQv6Jk77bwy4wjSkx7AQ44ukJyXmDQG3/Sddy/n1IgVd8PVJ9XI9Bk03j9N8YJlm4VcXuPutwphrnXFP4/5Fs7ldW/0n0PADvfj+LUidZYvD5VNOTAHG2ks+2qpA3WEFUqOWrsmCtoTANPPpcZs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bCQcVBsn; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bCQcVBsn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779140152; x=1810676152;
  h=date:from:to:cc:subject:message-id;
  bh=xq7UzTOpyWLUb0mEL4MhQRr85TUCMTYlbzBc/RABUJc=;
  b=bCQcVBsnzRP5uwkT/VZ7Onv6Zgy97e75iiPoGBWa1xXhcgajia5dV2G/
   yLnBsB9PSlJ4oIW53tIj0kEdX7tyKr6vinWnE9TfqY7p0mDak0uqR+t55
   A9PBEFHXLgwfPKxBbEmhqGLjHC6VGmogNSMm22mLValQID3yAcSaaaItt
   SRpEjChZLy3oOu1P7uFgGraYkidzqpItIsPVA2GtU8IAgClWUbQ7fuo3E
   1LxuFw5+nJ7E7UAvGayjAl1eWXQsbwt4UDXSz1zqxwVf/yFiv3fbvnYnI
   RkAI5cp/BB3wLYKCLHiY2C8GdoAVYlFpG+uI44giniwR+mNc62qDLwJFJ
   g==;
X-CSE-ConnectionGUID: r1hGRlWcSK6XAeggvrN7DA==
X-CSE-MsgGUID: amR6NfrMRQeBtu7eySf6Pw==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="79908481"
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; 
   d="scan'208";a="79908481"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 14:35:51 -0700
X-CSE-ConnectionGUID: 3cmGJONjR0W2cXXAhPZO3w==
X-CSE-MsgGUID: I9eMti8ARF6a/2JxF7GMFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; 
   d="scan'208";a="269907127"
Received: from lkp-server01.sh.intel.com (HELO d94e5e629b2d) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 18 May 2026 14:35:50 -0700
Received: from kbuild by d94e5e629b2d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wP5co-000000003Qq-4A7L;
	Mon, 18 May 2026 21:35:46 +0000
Date: Tue, 19 May 2026 05:35:16 +0800
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rppt:gfp-to-kmalloc/v0.1 234/238]
 arch/x86/xen/pmu.c:551:59: error: macro "per_cpu" requires 2 arguments, but
 only 1 given
Message-ID: <202605190541.n6GGQFuQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git gfp-to-kmalloc/v0.1
head:   cf8f69ff9142effba4d8d9a70a1a4f275044376c
commit: 04507bba0f5ca2d399ac98b495682a381b669c27 [234/238] x86/xen/msr: replace get_zeroed_page() with kzalloc()
config: x86_64-buildonly-randconfig-005-20260519 (https://download.01.org/0day-ci/archive/20260519/202605190541.n6GGQFuQ-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260519/202605190541.n6GGQFuQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605190541.n6GGQFuQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/xen/pmu.c: In function 'xen_pmu_finish':
>> arch/x86/xen/pmu.c:551:59: error: macro "per_cpu" requires 2 arguments, but only 1 given
     551 |         kfree((void *)(unsigned long)per_cpu(xenpmu_shared).xenpmu_data, 0);
         |                                                           ^
   In file included from include/asm-generic/percpu.h:9,
                    from arch/x86/include/asm/percpu.h:598,
                    from arch/x86/include/asm/preempt.h:6,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/slab.h:17,
                    from arch/x86/xen/pmu.c:3:
   include/linux/percpu-defs.h:273:9: note: macro "per_cpu" defined here
     273 | #define per_cpu(var, cpu)       (*per_cpu_ptr(&(var), cpu))
         |         ^~~~~~~
>> arch/x86/xen/pmu.c:551:38: error: 'per_cpu' undeclared (first use in this function)
     551 |         kfree((void *)(unsigned long)per_cpu(xenpmu_shared).xenpmu_data, 0);
         |                                      ^~~~~~~
   arch/x86/xen/pmu.c:551:38: note: each undeclared identifier is reported only once for each function it appears in
>> arch/x86/xen/pmu.c:551:9: error: too many arguments to function 'kfree'
     551 |         kfree((void *)(unsigned long)per_cpu(xenpmu_shared).xenpmu_data, 0);
         |         ^~~~~
   include/linux/slab.h:513:6: note: declared here
     513 | void kfree(const void *objp);
         |      ^~~~~


vim +/per_cpu +551 arch/x86/xen/pmu.c

   537	
   538	void xen_pmu_finish(int cpu)
   539	{
   540		struct xen_pmu_params xp;
   541	
   542		if (xen_hvm_domain())
   543			return;
   544	
   545		xp.vcpu = cpu;
   546		xp.version.maj = XENPMU_VER_MAJ;
   547		xp.version.min = XENPMU_VER_MIN;
   548	
   549		(void)HYPERVISOR_xenpmu_op(XENPMU_finish, &xp);
   550	
 > 551		kfree((void *)(unsigned long)per_cpu(xenpmu_shared).xenpmu_data, 0);

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
