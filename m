Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59B201AAC9
	for <oe-kbuild-all@lists.linux.dev>; Fri, 30 May 2025 05:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748583766; cv=none; b=srfV6FG9qn/AxXnmYcSk4O24s1rzbl2zCaNVT8j3npBz5i5g+CCD4nkOfImXgs0QYu2jEzVeVnH7nAk0brdBXBz2QrLMe+qkwTIYdxwOxZ/mw9QDtlR2VPluVsByNVZTW0dJcDC0DCpjism0OCSopxVgilHQI71IkfOlAys0OqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748583766; c=relaxed/simple;
	bh=uuSlAjeT10jNrKiVHDJ/Az8DyDkWjgxSXQa5+YjjUnM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Pxxy5yQrUhtZy2WD5elHGfhvS/EaHbf44fzDS3HNQ0Miv+f4p3Na/5joAv7CD3fdqN5jnkxAqto/2g/IlAKzVDpA6E51TZhPcKhnW9EJ3m+9eX/cDFSYrIAEt5YkGQlWvm/1ioessDfgi6DKpX2t5ubIIzpJq05mFxDVBE6EHk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ShNVDkll; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ShNVDkll"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748583765; x=1780119765;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uuSlAjeT10jNrKiVHDJ/Az8DyDkWjgxSXQa5+YjjUnM=;
  b=ShNVDkllAzCDS21j4LwEQ57KvnPK7J+t1Uxngohg3tS83Z7dFAs0vAlB
   7uMuFpeZw39bzRb9njCifcSEmfTMuRkO/kmYWZ5z38Ul1rG1h6AEFfvDA
   cYpxq0IVCdihV8khcz+mTUflykhJYGQ558hEF1etQWh49LA/J6tVKX5+k
   6Y/K4CpXUVD8AQC+DrUB4Cj09id8nF6Q9Ewk+hKktqvgt7WCNh8j+F0di
   SaARIko/hQNk1fkZNbriL3E7rw/Cx+xQYXqFlbsO8kXXvORhbJv8PUPlw
   w1bgnIkmEE2xHycipmnTx3lvGlI9zEs9fyOEuRtn3UO6NhxHSZqqbScU8
   w==;
X-CSE-ConnectionGUID: 5BNwBG2/SnKJfwdlZwhZXA==
X-CSE-MsgGUID: 2Vgm9Ty3RTeoE8m5qNxqiw==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="50365167"
X-IronPort-AV: E=Sophos;i="6.16,195,1744095600"; 
   d="scan'208";a="50365167"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2025 22:42:42 -0700
X-CSE-ConnectionGUID: ROvUVIRdTpGuOX5UaQ0Iyg==
X-CSE-MsgGUID: L6WIZHeIRyKckPohM5dqYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,195,1744095600"; 
   d="scan'208";a="174666169"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 29 May 2025 22:42:40 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uKsVq-000XNV-01;
	Fri, 30 May 2025 05:42:38 +0000
Date: Fri, 30 May 2025 13:41:43 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Pu Lehui <pulehui@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2339/2339] kernel/sched/core.c:158:5: warning: no
 previous prototype for function 'sched_task_is_throttled'
Message-ID: <202505301346.VRD8YS7H-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   f528a77f54d3c07d0b7feb879d2ba15275a4b3ff
commit: b1415ae822e0f2c88266c3f6f8e2b962baa9a579 [2339/2339] interference: Exclude throttle time from rundelay
config: x86_64-buildonly-randconfig-005-20250530 (https://download.01.org/0day-ci/archive/20250530/202505301346.VRD8YS7H-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250530/202505301346.VRD8YS7H-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505301346.VRD8YS7H-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/sched/core.c:158:5: warning: no previous prototype for function 'sched_task_is_throttled' [-Wmissing-prototypes]
     158 | int sched_task_is_throttled(struct task_struct *p, int cpu)
         |     ^
   kernel/sched/core.c:158:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     158 | int sched_task_is_throttled(struct task_struct *p, int cpu)
         | ^
         | static 
   kernel/sched/core.c:6465:1: warning: unused function 'class_core_lock_lock_ptr' [-Wunused-function]
    6465 | DEFINE_LOCK_GUARD_1(core_lock, int,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    6466 |                     sched_core_lock(*_T->lock, &_T->flags),
         |                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    6467 |                     sched_core_unlock(*_T->lock, &_T->flags),
         |                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    6468 |                     unsigned long flags)
         |                     ~~~~~~~~~~~~~~~~~~~~
   include/linux/cleanup.h:229:49: note: expanded from macro 'DEFINE_LOCK_GUARD_1'
     229 | __DEFINE_CLASS_IS_CONDITIONAL(_name, false);                            \
         |                                                                         ^
     230 | __DEFINE_UNLOCK_GUARD(_name, _type, _unlock, __VA_ARGS__)               \
         | ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/cleanup.h:205:21: note: expanded from macro '\
   __DEFINE_UNLOCK_GUARD'
     205 | static inline void *class_##_name##_lock_ptr(class_##_name##_t *_T)     \
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~
   <scratch space>:236:1: note: expanded from here
     236 | class_core_lock_lock_ptr
         | ^~~~~~~~~~~~~~~~~~~~~~~~
   2 warnings generated.


vim +/sched_task_is_throttled +158 kernel/sched/core.c

   156	
   157	#if defined(CONFIG_SCHED_CORE) || defined(CONFIG_CGROUP_IFS)
 > 158	int sched_task_is_throttled(struct task_struct *p, int cpu)
   159	{
   160		if (p->sched_class->task_is_throttled)
   161			return p->sched_class->task_is_throttled(p, cpu);
   162	
   163		return 0;
   164	}
   165	#endif
   166	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
