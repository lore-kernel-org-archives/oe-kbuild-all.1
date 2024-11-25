Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A999C10F9
	for <oe-kbuild-all@lists.linux.dev>; Mon, 25 Nov 2024 01:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732498302; cv=none; b=HFcJm60LWqdeI6lmve9bnLlLT0L95oYKTw0fCtGwzKjDyux+j0j7l9RJ8RxQQfsLnJs0O/A0ya9r5APvI5yB46lc8fZVSPJBu2lhyUt1W2jMruYv36Drw4Hi2NP7bUE26eRT8X5mP2zf91rwONbePcmDWo9FYF8Xb+LcGeQV5wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732498302; c=relaxed/simple;
	bh=fweLJlEjfvknjAaFg7U0BGh1jeH22a0+GeVilRA2LWA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WVT0SSj77W7tplfgDlD9681b862YQP0Wve5i/7kv4jS2HHOcIK/k8qDvvmIauKzdK8UkJVmsgClUgMdNtTEDmnIKyomqgWYZWCwJB3vPwNsRHShKITpFn6j3VQn6veuoe6bCH7g2gcEctjTDLZq4KUHdwF5KgEZK7RAii0ufzLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N9bhuZr6; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N9bhuZr6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732498301; x=1764034301;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fweLJlEjfvknjAaFg7U0BGh1jeH22a0+GeVilRA2LWA=;
  b=N9bhuZr6cHZBeqiiCCulY4oFg3fhhyIm+2buCKjeyySFFZsYh1FEQRoT
   xbpIHfG5MZD9uBnysN+gXgLTMGpqJxHNfPHBbyG1zBVbF147RpWBxtaI3
   JTHoeay6VsXaFTXiwlpTncz+BDb1ES4/Zjx7nhGLQwLdOIdYNCN5NE8a9
   ADXHD4LAb3EIOdAnPeYXM3AMBPtk28aLBfIbvNRv3/VEfN6e3l0eRXagm
   I3QC0qlaeHXNjOHezKj60euYPw/RwK2TJXm4Le1vLZ0d3/xUIdoNmfivG
   uoXNIEhjFN0AscIMzvJ3FPWsqkxo2TXdGnGo/bkkjYjtLGzjOV2L+E8Je
   w==;
X-CSE-ConnectionGUID: Nnl7E+rJRmWhJ6OcmBm1/A==
X-CSE-MsgGUID: uHIj2HQhTPGkUPzClpZH6g==
X-IronPort-AV: E=McAfee;i="6700,10204,11266"; a="43201145"
X-IronPort-AV: E=Sophos;i="6.12,182,1728975600"; 
   d="scan'208";a="43201145"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2024 17:31:40 -0800
X-CSE-ConnectionGUID: c/XzzHM5SjuSuFd2gBc2ng==
X-CSE-MsgGUID: F1h1i6zuQxmUZb98iOL0dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,182,1728975600"; 
   d="scan'208";a="91082802"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 24 Nov 2024 17:31:39 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tFNwu-0005Kr-1V;
	Mon, 25 Nov 2024 01:31:36 +0000
Date: Mon, 25 Nov 2024 09:31:13 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:chromeos-6.6-f9d942cf7d57 260/1491]
 fs/proc/base.c:196:1: sparse: sparse: symbol
 'proc_mem_restrict_foll_force_all' was not declared. Should it be static?
Message-ID: <202411250921.AAdOBhmZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common chromeos-6.6-f9d942cf7d57
head:   ef2c757e09b49fa8c905e77b7c1e55ccf2be08ee
commit: 330b9811d1da0797d4502c311d4fa783db3b3771 [260/1491] FROMGIT: proc: restrict /proc/pid/mem
config: i386-randconfig-061-20241114 (https://download.01.org/0day-ci/archive/20241125/202411250921.AAdOBhmZ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241125/202411250921.AAdOBhmZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411250921.AAdOBhmZ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/proc/base.c:163:1: sparse: sparse: symbol 'proc_mem_restrict_open_read_all' was not declared. Should it be static?
   fs/proc/base.c:164:1: sparse: sparse: symbol 'proc_mem_restrict_open_read_ptracer' was not declared. Should it be static?
   fs/proc/base.c:174:1: sparse: sparse: symbol 'proc_mem_restrict_open_write_all' was not declared. Should it be static?
   fs/proc/base.c:175:1: sparse: sparse: symbol 'proc_mem_restrict_open_write_ptracer' was not declared. Should it be static?
   fs/proc/base.c:185:1: sparse: sparse: symbol 'proc_mem_restrict_write_all' was not declared. Should it be static?
   fs/proc/base.c:186:1: sparse: sparse: symbol 'proc_mem_restrict_write_ptracer' was not declared. Should it be static?
>> fs/proc/base.c:196:1: sparse: sparse: symbol 'proc_mem_restrict_foll_force_all' was not declared. Should it be static?
>> fs/proc/base.c:197:1: sparse: sparse: symbol 'proc_mem_restrict_foll_force_ptracer' was not declared. Should it be static?
   fs/proc/base.c:2474:25: sparse: sparse: cast to restricted fmode_t
   fs/proc/base.c:2531:42: sparse: sparse: cast from restricted fmode_t
   fs/proc/base.c:2631:48: sparse: sparse: cast from restricted fmode_t
   fs/proc/base.c: note: in included file (through include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs.h, ...):
   include/linux/sched/signal.h:757:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   include/linux/sched/signal.h:757:37: sparse:     expected struct spinlock [usertype] *lock
   include/linux/sched/signal.h:757:37: sparse:     got struct spinlock [noderef] __rcu *
   fs/proc/base.c:1313:36: sparse: sparse: context imbalance in '__set_oom_adj' - unexpected unlock

vim +/proc_mem_restrict_foll_force_all +196 fs/proc/base.c

   188	
   189	#if IS_ENABLED(CONFIG_PROC_MEM_RESTRICT_FOLL_FORCE_ALL)
   190	DEFINE_STATIC_KEY_TRUE_RO(proc_mem_restrict_foll_force_all);
   191	DEFINE_STATIC_KEY_FALSE_RO(proc_mem_restrict_foll_force_ptracer);
   192	#elif IS_ENABLED(CONFIG_PROC_MEM_RESTRICT_FOLL_FORCE_PTRACE)
   193	DEFINE_STATIC_KEY_FALSE_RO(proc_mem_restrict_foll_force_all);
   194	DEFINE_STATIC_KEY_TRUE_RO(proc_mem_restrict_foll_force_ptracer);
   195	#else
 > 196	DEFINE_STATIC_KEY_FALSE_RO(proc_mem_restrict_foll_force_all);
 > 197	DEFINE_STATIC_KEY_FALSE_RO(proc_mem_restrict_foll_force_ptracer);
   198	#endif
   199	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
