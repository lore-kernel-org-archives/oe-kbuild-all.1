Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F7D5481DD
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Dec 2025 02:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765332577; cv=none; b=UdfZT5o1R6hb8Z0eNLan3wkLJqjI0KHWrq0GcGZgdzPMZ4UObRi2qUncOn/LyeEdZ0XinKVlNY8+Ww2h1AmA2ANXHdxA9IItsP9EUgrCmBJmyNnNaHhfBTZSmPMDf5epWzFT9rISzPgn+X9Tv1Wm7O6m4ViexPRdIshluWUsnfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765332577; c=relaxed/simple;
	bh=RMNJfzkUIvJ/oCwME/h7JIgntR+PdH78HOREaUzGYmg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=I+tkCausIeGe8jVvWWHpMNM51gifeZoFxGnPqYet6eMV+lmWyfssa6OfptNyu6wTl8Qcx76QfsiNoAKY+IKUJ51dwD2psfGBQePn54Ks+wIwHllVKRFXq4YMMm0yN9mDUiQ7UnOkfHVuVAEuU5onMve4RN7MrcUH3MqjDVJ2v3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oGztYjOz; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oGztYjOz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765332575; x=1796868575;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RMNJfzkUIvJ/oCwME/h7JIgntR+PdH78HOREaUzGYmg=;
  b=oGztYjOzb5z52jClLRCG+yM39yDY3bdHqNtA9lEMP/KescjUueQdrzRB
   IUKFkG0hbE8q6AkcSWpH5pvnBxuuvtYemPiAcMnROeLCaxeRwcK5L3yiC
   qIm4RNHjMywbJcHcON6biEPOND9BcABdgrFN2jupvWN32ljTmmDuui6U/
   SZcUqho0qh44dCN+J9E02KxWDnxPdSQlDomnNOgF+QtrKv1e8MjlNeHvd
   bHXNctmEgVyvdCerbgm5lwbexbEAZSa9VfysWKhBbh2bgWqlGVQHCJ1gy
   4b1nUuUKPCms7VQr+Ks9yxa30zPmXJSNd+COh9BN9XBZ6zROGeNgh6iT3
   w==;
X-CSE-ConnectionGUID: f2UvlUp8SAml63GnH0qvpw==
X-CSE-MsgGUID: yA980rFdSPWhH98O0+WiLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="67469505"
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; 
   d="scan'208";a="67469505"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2025 18:09:34 -0800
X-CSE-ConnectionGUID: BqdSJuxHS1yBuIPGYIGqRA==
X-CSE-MsgGUID: cW6q0lQRTBmnTUxDnp/jNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; 
   d="scan'208";a="196287883"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 09 Dec 2025 18:09:33 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vT9dz-000000002YT-0TFl;
	Wed, 10 Dec 2025 02:09:31 +0000
Date: Wed, 10 Dec 2025 10:08:44 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Cheng Yu <serein.chengyu@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 3388/3388] kernel/sched/core.c:8279:18: error:
 member reference type 'struct mem_cgroup *' is a pointer; did you mean to
 use '->'?
Message-ID: <202512101034.mDWav7mE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   ea8b5fbcdf7f5ce2d966ae6aa4e95e2ebde6cb03
commit: b7772972a0a76efac27078392f3f706914fe2af7 [3388/3388] sched/core: Add cpu.steal_task in cgroup v1 cpu subsystem
config: x86_64-randconfig-r054-20251209 (https://download.01.org/0day-ci/archive/20251210/202512101034.mDWav7mE-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 6ec8c4351cfc1d0627d1633b02ea787bd29c77d8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251210/202512101034.mDWav7mE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512101034.mDWav7mE-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <built-in>:2:
   In file included from include/linux/compiler_types.h:69:
   include/linux/compiler-clang.h:34:9: warning: '__SANITIZE_ADDRESS__' macro redefined [-Wmacro-redefined]
      34 | #define __SANITIZE_ADDRESS__
         |         ^
   <built-in>:352:9: note: previous definition is here
     352 | #define __SANITIZE_ADDRESS__ 1
         |         ^
   kernel/sched/core.c:2750:6: warning: no previous prototype for function 'sched_set_stop_task' [-Wmissing-prototypes]
    2750 | void sched_set_stop_task(int cpu, struct task_struct *stop)
         |      ^
   kernel/sched/core.c:2750:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2750 | void sched_set_stop_task(int cpu, struct task_struct *stop)
         | ^
         | static 
   kernel/sched/core.c:8279:3: error: use of undeclared identifier 'root_task_group'; did you mean 'root_mem_cgroup'?
    8279 |                 root_task_group.steal_task = TG_STEAL_NO;
         |                 ^~~~~~~~~~~~~~~
         |                 root_mem_cgroup
   include/linux/memcontrol.h:461:27: note: 'root_mem_cgroup' declared here
     461 | extern struct mem_cgroup *root_mem_cgroup;
         |                           ^
>> kernel/sched/core.c:8279:18: error: member reference type 'struct mem_cgroup *' is a pointer; did you mean to use '->'?
    8279 |                 root_task_group.steal_task = TG_STEAL_NO;
         |                 ~~~~~~~~~~~~~~~^
         |                                ->
>> kernel/sched/core.c:8279:19: error: no member named 'steal_task' in 'struct mem_cgroup'
    8279 |                 root_task_group.steal_task = TG_STEAL_NO;
         |                 ~~~~~~~~~~~~~~~ ^
   kernel/sched/core.c:8279:32: error: use of undeclared identifier 'TG_STEAL_NO'
    8279 |                 root_task_group.steal_task = TG_STEAL_NO;
         |                                              ^~~~~~~~~~~
   2 warnings and 4 errors generated.


vim +8279 kernel/sched/core.c

  8253	
  8254		wait_bit_init();
  8255	
  8256	#ifdef CONFIG_FAIR_GROUP_SCHED
  8257		ptr += 2 * nr_cpu_ids * sizeof(void **);
  8258	#endif
  8259	#ifdef CONFIG_RT_GROUP_SCHED
  8260		ptr += 2 * nr_cpu_ids * sizeof(void **);
  8261	#endif
  8262		if (ptr) {
  8263			ptr = (unsigned long)kzalloc(ptr, GFP_NOWAIT);
  8264	
  8265	#ifdef CONFIG_FAIR_GROUP_SCHED
  8266			root_task_group.se = (struct sched_entity **)ptr;
  8267			ptr += nr_cpu_ids * sizeof(void **);
  8268	
  8269			root_task_group.cfs_rq = (struct cfs_rq **)ptr;
  8270			ptr += nr_cpu_ids * sizeof(void **);
  8271	
  8272			root_task_group.shares = ROOT_TASK_GROUP_LOAD;
  8273			init_cfs_bandwidth(&root_task_group.cfs_bandwidth);
  8274	#endif /* CONFIG_FAIR_GROUP_SCHED */
  8275	#ifdef CONFIG_QOS_SCHED_SMT_EXPELLER
  8276			root_task_group.smt_expell = TG_SMT_EXPELL;
  8277	#endif
  8278	#ifdef CONFIG_SCHED_STEAL
> 8279			root_task_group.steal_task = TG_STEAL_NO;
  8280	#endif
  8281	#ifdef CONFIG_RT_GROUP_SCHED
  8282			root_task_group.rt_se = (struct sched_rt_entity **)ptr;
  8283			ptr += nr_cpu_ids * sizeof(void **);
  8284	
  8285			root_task_group.rt_rq = (struct rt_rq **)ptr;
  8286			ptr += nr_cpu_ids * sizeof(void **);
  8287	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
