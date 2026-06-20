Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1926F13DDAE
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Jun 2026 04:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781928698; cv=none; b=T3VVOeqrUOtOJOGTXlFvLVbrxhWPHsmVuTT+5RX2ZqLB44yV/yFTNoiSlbDQwiDFgEpK1UIXl+0pVu+DOD4/HBEaliKBjfuJUMml3Xxxmnajjy4jfuJy/N3UdSM7tr3pS+bcZDiKrTJHSE/Xu6M317q94ULWrwYp6Vr+MoNWIfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781928698; c=relaxed/simple;
	bh=ri4sFxAhnGXvg0HgT0TDkMvZkjjDFB3W15boVH9BrVk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lwcIj6ZJ05moNX4gwQk4efXkvesbV8yWVDqXBdbTJ/QHS97SZVjw6M3ZsyWy7I9YXXnplB8StR8QFIMuPqWGqZcdbNOWPS+kJNCHgkRLx+n1pET8Y7OZfC/w5ILCUOxVp8DYpKCE4/l+JRTuCqKM66aybHUH3WwKiydXRQ+0Btg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bsg00tjt; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bsg00tjt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781928695; x=1813464695;
  h=date:from:to:cc:subject:message-id;
  bh=ri4sFxAhnGXvg0HgT0TDkMvZkjjDFB3W15boVH9BrVk=;
  b=bsg00tjtcKF8nnB+0MSPcenTfJ1Q3VJYW+0zoVS7oJpczb08CvQSD/8G
   nY1RYBeNXVyBdpVXexGwmzRRnGFk4yrz0KS5UGep5/MWrjjdNaaCuqYgf
   hGwCHdB2vfsJ6JALJ9G/0IwMpdwkXZl03vgza1KIQZkYCrDxHd4dz9J9N
   yT1zxp3A08mQvJY5LSEXOU+pGa9OpljxCt+rDvqjRijpNSbTrGoG2U3cR
   Ar4dxphieHzCVLdOpQPvDNm4ybQns9J4tB6J8N4kccfhORaq8yrFIHyAS
   YbCjfeOznin1WttDaqnagSX1EGmH6GzQfccMcbco5cPWHmImZoP2jXqiL
   Q==;
X-CSE-ConnectionGUID: nZbsc6c5QOKvE48JfW96/A==
X-CSE-MsgGUID: AWYwDMe9QV2y38mr7GpOog==
X-IronPort-AV: E=McAfee;i="6800,10657,11822"; a="82794257"
X-IronPort-AV: E=Sophos;i="6.24,214,1774335600"; 
   d="scan'208";a="82794257"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2026 21:11:34 -0700
X-CSE-ConnectionGUID: 0XqNiLa+Sgm88HJhoU/qpQ==
X-CSE-MsgGUID: Z9zSGR9OTc20XEe77nI2gQ==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 19 Jun 2026 21:11:33 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wan3L-000000005iz-0eAB;
	Sat, 20 Jun 2026 04:11:31 +0000
Date: Sat, 20 Jun 2026 06:11:20 +0200
From: kernel test robot <lkp@intel.com>
To: Jing Wu <realwujing@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>,
 Qiliang Yuan <yuanql9@chinatelecom.cn>
Subject: kernel/irq/manage.c:2875:27: warning: excess elements in
 struct initializer
Message-ID: <202606200620.p26ogaZE-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Jing-Wu/sched-isolation-Replace-notifier-chain-with-explicit-callback-interface/20260618-111648
head:   1558ace3815ead46d20cb956f01d41f6c64fbf22
commit: a9dbca218958fa8af0150cd86394228406942c62 genirq: Add explicit housekeeping callback for managed IRQ migration
date:   2 days ago
config: i386-randconfig-2006-20250804 (https://download.01.org/0day-ci/archive/20260620/202606200620.p26ogaZE-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260620/202606200620.p26ogaZE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606200620.p26ogaZE-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/irq/manage.c:21:
   include/linux/sched/isolation.h:114:52: warning: 'struct housekeeping_cbs' declared inside parameter list will not be visible outside of this definition or declaration
     114 |                                             struct housekeeping_cbs *cbs) { return 0; }
         |                                                    ^~~~~~~~~~~~~~~~
   include/linux/sched/isolation.h:116:54: warning: 'struct housekeeping_cbs' declared inside parameter list will not be visible outside of this definition or declaration
     116 |                                               struct housekeeping_cbs *cbs) { return 0; }
         |                                                      ^~~~~~~~~~~~~~~~
   In file included from include/asm-generic/percpu.h:9,
                    from arch/x86/include/asm/percpu.h:598,
                    from arch/x86/include/asm/preempt.h:6,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/irq.h:14,
                    from kernel/irq/manage.c:11:
   kernel/irq/manage.c: In function 'irq_hk_apply':
   kernel/irq/manage.c:2850:61: error: '__tmp_mask' undeclared (first use in this function)
    2850 |                         struct cpumask *tmp = this_cpu_ptr(&__tmp_mask);
         |                                                             ^~~~~~~~~~
   include/linux/percpu-defs.h:221:54: note: in definition of macro '__verify_pcpu_ptr'
     221 |         const void __percpu *__vpp_verify = (typeof((ptr) + 0))NULL;    \
         |                                                      ^~~
   include/linux/percpu-defs.h:268:33: note: in expansion of macro 'per_cpu_ptr'
     268 | #define raw_cpu_ptr(ptr)        per_cpu_ptr(ptr, 0)
         |                                 ^~~~~~~~~~~
   include/linux/percpu-defs.h:269:33: note: in expansion of macro 'raw_cpu_ptr'
     269 | #define this_cpu_ptr(ptr)       raw_cpu_ptr(ptr)
         |                                 ^~~~~~~~~~~
   kernel/irq/manage.c:2850:47: note: in expansion of macro 'this_cpu_ptr'
    2850 |                         struct cpumask *tmp = this_cpu_ptr(&__tmp_mask);
         |                                               ^~~~~~~~~~~~
   kernel/irq/manage.c:2850:61: note: each undeclared identifier is reported only once for each function it appears in
    2850 |                         struct cpumask *tmp = this_cpu_ptr(&__tmp_mask);
         |                                                             ^~~~~~~~~~
   include/linux/percpu-defs.h:221:54: note: in definition of macro '__verify_pcpu_ptr'
     221 |         const void __percpu *__vpp_verify = (typeof((ptr) + 0))NULL;    \
         |                                                      ^~~
   include/linux/percpu-defs.h:268:33: note: in expansion of macro 'per_cpu_ptr'
     268 | #define raw_cpu_ptr(ptr)        per_cpu_ptr(ptr, 0)
         |                                 ^~~~~~~~~~~
   include/linux/percpu-defs.h:269:33: note: in expansion of macro 'raw_cpu_ptr'
     269 | #define this_cpu_ptr(ptr)       raw_cpu_ptr(ptr)
         |                                 ^~~~~~~~~~~
   kernel/irq/manage.c:2850:47: note: in expansion of macro 'this_cpu_ptr'
    2850 |                         struct cpumask *tmp = this_cpu_ptr(&__tmp_mask);
         |                                               ^~~~~~~~~~~~
   kernel/irq/manage.c: At top level:
   kernel/irq/manage.c:2874:15: error: variable 'irq_hk_cbs' has initializer but incomplete type
    2874 | static struct housekeeping_cbs irq_hk_cbs = {
         |               ^~~~~~~~~~~~~~~~
   kernel/irq/manage.c:2875:10: error: 'struct housekeeping_cbs' has no member named 'name'
    2875 |         .name           = "genirq/managed",
         |          ^~~~
>> kernel/irq/manage.c:2875:27: warning: excess elements in struct initializer
    2875 |         .name           = "genirq/managed",
         |                           ^~~~~~~~~~~~~~~~
   kernel/irq/manage.c:2875:27: note: (near initialization for 'irq_hk_cbs')
   kernel/irq/manage.c:2876:10: error: 'struct housekeeping_cbs' has no member named 'pre_validate'
    2876 |         .pre_validate   = irq_hk_validate,
         |          ^~~~~~~~~~~~
   kernel/irq/manage.c:2876:27: warning: excess elements in struct initializer
    2876 |         .pre_validate   = irq_hk_validate,
         |                           ^~~~~~~~~~~~~~~
   kernel/irq/manage.c:2876:27: note: (near initialization for 'irq_hk_cbs')
   kernel/irq/manage.c:2877:10: error: 'struct housekeeping_cbs' has no member named 'apply'
    2877 |         .apply          = irq_hk_apply,
         |          ^~~~~
   kernel/irq/manage.c:2877:27: warning: excess elements in struct initializer
    2877 |         .apply          = irq_hk_apply,
         |                           ^~~~~~~~~~~~
   kernel/irq/manage.c:2877:27: note: (near initialization for 'irq_hk_cbs')
   kernel/irq/manage.c: In function 'irq_hk_init':
   kernel/irq/manage.c:2884:62: error: passing argument 2 of 'housekeeping_register_cbs' from incompatible pointer type [-Wincompatible-pointer-types]
    2884 |         ret = housekeeping_register_cbs(HK_TYPE_MANAGED_IRQ, &irq_hk_cbs);
         |                                                              ^~~~~~~~~~~
         |                                                              |
         |                                                              struct housekeeping_cbs *
   include/linux/sched/isolation.h:114:70: note: expected 'struct housekeeping_cbs *' but argument is of type 'struct housekeeping_cbs *'
     114 |                                             struct housekeeping_cbs *cbs) { return 0; }
         |                                             ~~~~~~~~~~~~~~~~~~~~~~~~~^~~
   kernel/irq/manage.c: At top level:
   kernel/irq/manage.c:2874:32: error: storage size of 'irq_hk_cbs' isn't known
    2874 | static struct housekeeping_cbs irq_hk_cbs = {
         |                                ^~~~~~~~~~


vim +2875 kernel/irq/manage.c

  2873	
  2874	static struct housekeeping_cbs irq_hk_cbs = {
> 2875		.name		= "genirq/managed",
  2876		.pre_validate	= irq_hk_validate,
  2877		.apply		= irq_hk_apply,
  2878	};
  2879	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
