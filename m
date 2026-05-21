Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B0EB24A06A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 May 2026 07:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779349633; cv=none; b=RX1VnkQfgr89y2YGateurEY1xcJJksANUw2/qrn8ZkqB9Mh51dneszXu8hPBZjIBLEPIz8RGAXCD/jLU9sicI900z17yGGcRUXtFBnI0KoTrYT77gogCEZOHqd8ndN8Sb0+Ei4C5PXUJ5QDAhqxuSAIRuvXwgvSdTfyEPkMiFaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779349633; c=relaxed/simple;
	bh=4SD7EZs2/96r+McPAcmnH7gNOiZ71wIJDhu5/kAeXRE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ml8FIoyabw/jMcROGN/Mh04hbn/VnfemH9updEPA+iTuw8DaSVnnAPKMQWgubKK2BznhC2KSmEmBzBbQkQPvIjL+iChjk3fYguzIyqY7YCzmv62+q6FWxz7xQu3Ufy5MqfNNmL7Wj9+X1HAQTVTGyeKJCn/TJ1uVzhOpprPnNUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mPCwv0en; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mPCwv0en"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779349632; x=1810885632;
  h=date:from:to:cc:subject:message-id;
  bh=4SD7EZs2/96r+McPAcmnH7gNOiZ71wIJDhu5/kAeXRE=;
  b=mPCwv0enOhNwSNRXsFk4Wu521vu2V0eDsgWjTiowQZNZvsZC0Fe8vXmg
   wXncSzIjwNOv5am+molxkmwDYt3vIoRNA6l/2oTA4HUyK2BEnLNsWvhlf
   MFTJnKmbWkDIYhjqmzWvqcZTZnPCxEO1k+N15NV+o32YhbyhTs4/ikYtJ
   /85M7hMS/fdEJ9G7YNthJ0sa24LPY+k46XUUhOl1BNGm2+xWdndgFFshu
   elOhzitIVpOa2IFM1+/k+hVZhnpxl1ufFmc/FpssEOc6jZP7uX4hwTTM7
   o3YIjbMBXt0NCPUbrJg9/mTdEH7VDO5Ekowi+dQB6Zoa7OpdVy6aXsSjp
   w==;
X-CSE-ConnectionGUID: EoC1S8u3TeuyVgWlAUa7HA==
X-CSE-MsgGUID: bI2KZaUSTIuqnPCjKOf0Dw==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="79289948"
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; 
   d="scan'208";a="79289948"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 00:47:11 -0700
X-CSE-ConnectionGUID: Jt9pVO8rTBCaNgkqVzKOhw==
X-CSE-MsgGUID: xJOt/uRZS8+skiIFVO4MnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; 
   d="scan'208";a="244753059"
Received: from lkp-server02.sh.intel.com (HELO 30e86e9c1927) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 21 May 2026 00:47:11 -0700
Received: from kbuild by 30e86e9c1927 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPy7X-000000004bv-2AD9;
	Thu, 21 May 2026 07:47:07 +0000
Date: Thu, 21 May 2026 15:46:02 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Ehrhardt <christian.ehrhardt@codasip.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [scosu-sched:topic/mmap-cap-prot-wip/v6.18 524/1130]
 mm/vma.c:2982:25: error: 'ERESERVATION' undeclared
Message-ID: <202605211521.FgeYfkvf-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/scosu/linux-sched topic/mmap-cap-prot-wip/v6.18
head:   f69a5a9d9fee15edde28429e23a4c749a59937bd
commit: 134d750606527b5b0550a144e1d8012dc7ea0020 [524/1130] [CHERRY-PICK] fs/exec: Create a stack reservation in PCuABI
config: parisc-allnoconfig (https://download.01.org/0day-ci/archive/20260521/202605211521.FgeYfkvf-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260521/202605211521.FgeYfkvf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605211521.FgeYfkvf-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/bpfptr.h:6,
                    from include/linux/bpf.h:28,
                    from include/linux/security.h:35,
                    from include/linux/perf_event.h:53,
                    from mm/vma_internal.h:37,
                    from mm/vma.c:7:
   include/linux/compat.h:1119:9: warning: 'is_compat32_task' redefined
    1119 | #define is_compat32_task() (0)
         |         ^~~~~~~~~~~~~~~~
   In file included from include/linux/compat.h:22:
   arch/parisc/include/asm/compat.h:140:9: note: this is the location of the previous definition
     140 | #define is_compat32_task is_compat_task
         |         ^~~~~~~~~~~~~~~~
   mm/vma.c: In function 'acct_stack_growth':
>> mm/vma.c:2982:25: error: 'ERESERVATION' undeclared (first use in this function)
    2982 |                 return -ERESERVATION;
         |                         ^~~~~~~~~~~~
   mm/vma.c:2982:25: note: each undeclared identifier is reported only once for each function it appears in


vim +/ERESERVATION +2982 mm/vma.c

  2961	
  2962	/*
  2963	 * Verify that the stack growth is acceptable and
  2964	 * update accounting. This is shared with both the
  2965	 * grow-up and grow-down cases.
  2966	 */
  2967	static int acct_stack_growth(struct vm_area_struct *vma,
  2968				     unsigned long size, unsigned long grow)
  2969	{
  2970		struct mm_struct *mm = vma->vm_mm;
  2971		unsigned long new_start;
  2972	
  2973		/* address space limit tests */
  2974		if (!may_expand_vm(mm, vma->vm_flags, grow))
  2975			return -ENOMEM;
  2976	
  2977		/* Stack limit test */
  2978		if (size > rlimit(RLIMIT_STACK))
  2979			return -ENOMEM;
  2980	
  2981		if (reserv_is_supported(mm) && size > reserv_vma_reserv_len(vma))
> 2982			return -ERESERVATION;
  2983	
  2984		/* mlock limit tests */
  2985		if (!mlock_future_ok(mm, vma->vm_flags, grow << PAGE_SHIFT))
  2986			return -ENOMEM;
  2987	
  2988		/* Check to ensure the stack will not grow into a hugetlb-only region */
  2989		new_start = (vma->vm_flags & VM_GROWSUP) ? vma->vm_start :
  2990				vma->vm_end - size;
  2991		if (is_hugepage_only_range(vma->vm_mm, new_start, size))
  2992			return -EFAULT;
  2993	
  2994		/*
  2995		 * Overcommit..  This must be the final test, as it will
  2996		 * update security statistics.
  2997		 */
  2998		if (security_vm_enough_memory_mm(mm, grow))
  2999			return -ENOMEM;
  3000	
  3001		return 0;
  3002	}
  3003	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
