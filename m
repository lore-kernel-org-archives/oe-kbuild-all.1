Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD56A3BB47
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Mar 2024 09:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710928751; cv=none; b=tekAF0y4arPiO87/SYTLDyl/by5QH+hxNoLX3erWw3bQmx9ndDjVz7enrI+jY1r6nOo4a6mTTrYy80B+c+MjS32ODIzsPbXem93V7ovWs7arFfEPEFx1dygd7MP8VZnJdAU+kp9217IWENTy4wIEU8p74Tmbgnrp8J4PKPNlsM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710928751; c=relaxed/simple;
	bh=BuRyqNTRNbl93NJ5HmYY1jWTqfE8IE4qIe9z9HpkNS4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=evZqfo272BHNW4FVEDPoTugsx48Kq1LQ4Req6TaZRc5YnljssXS7aVRxM0dVAiQYhecoGyjCC5rI9mv/b8CKtjHGezP5fCMg1H6qEPFq7T7wAThVnM86++bWL1QeL/+wpy5n6UJRfRoq3WZczNL6G+Z7ZPLE+qKe2Uq1bFCiG/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bKnx5wGk; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bKnx5wGk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710928748; x=1742464748;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BuRyqNTRNbl93NJ5HmYY1jWTqfE8IE4qIe9z9HpkNS4=;
  b=bKnx5wGkyqJZ8QvZCtqtqK4r641A/iQFmzm/v/0gDuXjwrMqv5pZ2VoE
   VsTIMpC+sOFx5DaruP0h4dUAFenRofXDIXrlHGPr6kw3fMoNCf7HQC8wm
   0VDpDTABkS+jojiHWehNPMUbE6Xec2mo8dN0gden3z5F57wwv8wSkLjfS
   Rc3yyoscgxvhqtaxiN9lXBi+Djuol3CdtJjG7SeDjVU3RrUzRtA184MUy
   IVmErlbfk1df/332eOh3uBQuXpvSIl0CozIxbLnlEmdwDcNaWDWzi5BU0
   YxZU4r4c9QDqabYqnQBjn53q4OWwDsCdRofnU5CNWd8o+iH4C4dymx5g6
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11018"; a="5722855"
X-IronPort-AV: E=Sophos;i="6.07,139,1708416000"; 
   d="scan'208";a="5722855"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2024 02:59:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,139,1708416000"; 
   d="scan'208";a="37228954"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 20 Mar 2024 02:59:06 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rmsiu-000IW9-0U;
	Wed, 20 Mar 2024 09:59:04 +0000
Date: Wed, 20 Mar 2024 17:58:43 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 9348/9349]
 include/linux/percpu-rwsem.h:70:55: error: cast from pointer to integer of
 different size
Message-ID: <202403201755.ZD0GZ1Gh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   c4ad4a7c4dd02f6fbf7c072893907f7fffbb5b06
commit: 51c3760d93e2a3f2e64a65c5875c000180205a23 [9348/9349] ANDROID: vendor_hook: add hooks to protect locking-tsk in cpu scheduler
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20240320/202403201755.ZD0GZ1Gh-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240320/202403201755.ZD0GZ1Gh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403201755.ZD0GZ1Gh-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/fs.h:33,
                    from include/linux/huge_mm.h:8,
                    from include/linux/mm.h:1082,
                    from include/linux/mman.h:5,
                    from include/linux/page_size_compat.h:27,
                    from arch/x86/include/asm/elf.h:8,
                    from include/linux/elf.h:6,
                    from include/linux/module.h:19,
                    from lib/test_bitops.c:9:
   include/linux/percpu-rwsem.h: In function 'percpu_down_read':
>> include/linux/percpu-rwsem.h:70:55: error: cast from pointer to integer of different size [-Werror=pointer-to-int-cast]
      70 |         _trace_android_vh_record_pcpu_rwsem_starttime((u64)sem, jiffies);
         |                                                       ^
   include/linux/percpu-rwsem.h: In function 'percpu_down_read_trylock':
   include/linux/percpu-rwsem.h:97:63: error: cast from pointer to integer of different size [-Werror=pointer-to-int-cast]
      97 |                 _trace_android_vh_record_pcpu_rwsem_starttime((u64)sem, jiffies);
         |                                                               ^
   include/linux/percpu-rwsem.h: In function 'percpu_up_read':
   include/linux/percpu-rwsem.h:128:55: error: cast from pointer to integer of different size [-Werror=pointer-to-int-cast]
     128 |         _trace_android_vh_record_pcpu_rwsem_starttime((u64)sem, 0);
         |                                                       ^
   cc1: all warnings being treated as errors


vim +70 include/linux/percpu-rwsem.h

    49	
    50	static inline void percpu_down_read(struct percpu_rw_semaphore *sem)
    51	{
    52		might_sleep();
    53	
    54		rwsem_acquire_read(&sem->dep_map, 0, 0, _RET_IP_);
    55	
    56		preempt_disable();
    57		/*
    58		 * We are in an RCU-sched read-side critical section, so the writer
    59		 * cannot both change sem->state from readers_fast and start checking
    60		 * counters while we are here. So if we see !sem->state, we know that
    61		 * the writer won't be checking until we're past the preempt_enable()
    62		 * and that once the synchronize_rcu() is done, the writer will see
    63		 * anything we did within this RCU-sched read-size critical section.
    64		 */
    65		if (likely(rcu_sync_is_idle(&sem->rss)))
    66			this_cpu_inc(*sem->read_count);
    67		else
    68			__percpu_down_read(sem, false); /* Unconditional memory barrier */
    69	
  > 70		_trace_android_vh_record_pcpu_rwsem_starttime((u64)sem, jiffies);
    71		/*
    72		 * The preempt_enable() prevents the compiler from
    73		 * bleeding the critical section out.
    74		 */
    75		preempt_enable();
    76	}
    77	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
