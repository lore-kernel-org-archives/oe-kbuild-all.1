Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 164CC111B0
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Feb 2024 09:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707901968; cv=none; b=XakDMCk3m6D8gIVacWcpmlXSUd+P/CoJHOtfL3s7GiVj8yayUp5ZEyl6J5XUpban3nC0uAwdha/MTMILwzFH3yleGNGIx2C0OfCrCHO6MGBVrXoC7rnGVrurZ/qu05faE7r2RntlEiEPGElhdPWjGAscSUbrNkqZhLjwKmPy0R8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707901968; c=relaxed/simple;
	bh=4+CYUHH9DDbdxmrFQ1W1yJxx/owcbMnR+surKdMyXbM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=vAjsk1Yjxxxt21LpjxpPQrl1riWrIkYPd83WOBwQbgYHxMgTWH+CLwYo3JldBLs8nEcaKkgKvcQi2fT5qj6Uj0Ik7klkKrGfxAIx5qz2sHtNZ6jpcdVzhM8uMQS9gO79hnJTOoU00EAu9iRCAVcgYTLtW5L4avcC/GV7amvUQfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Tv4l1oRd; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tv4l1oRd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707901966; x=1739437966;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4+CYUHH9DDbdxmrFQ1W1yJxx/owcbMnR+surKdMyXbM=;
  b=Tv4l1oRdc8Xdqo+wilvhiBdV6btV5TF3QsHiijauN+HttvyV8lTOiE93
   Q3hCzb+CtxldPwbMcGnuhTu/HjZkPMNQEMq1iX1SIwRgUg0D7vV/ZYLTo
   In7MSoyxFT2nFIWcARKfzIAq++/BV5Az7FJhqBIkixpUevEMPMnY71K8b
   hyHBoGDNtWiNdSQFAltlhwx8oYEzATQrQkHmmtbVlcNBVIRa1MOGOrboE
   rfORXZGL4JCdjLzzGP2yp7wYfcy6BWUFYAKlCwqxHdydkeTKbT8JjPjKf
   ZkHcH5hN/nFuP3D4yplWMTd+m9OAKrZlGz20qMyHHhHgWkwBAopHy43JG
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="2060240"
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; 
   d="scan'208";a="2060240"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2024 01:12:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; 
   d="scan'208";a="34199104"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 14 Feb 2024 01:12:43 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1raBJp-0008cC-0V;
	Wed, 14 Feb 2024 09:12:41 +0000
Date: Wed, 14 Feb 2024 17:12:08 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.15 16/38] kernel/sched/fair_eevdf.c:5716:6:
 warning: no previous prototype for function 'init_cfs_bandwidth'
Message-ID: <202402141622.BDdEH5HQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.15
head:   efd81cb7bd74278826232f0556137a71fb757350
commit: e865e3abb45cea830f107c69a227ed07b28c0b43 [16/38] CHROMIUM: sched/eevdf: Adding fair_eevdf.c
config: arm-defconfig (https://download.01.org/0day-ci/archive/20240214/202402141622.BDdEH5HQ-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240214/202402141622.BDdEH5HQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402141622.BDdEH5HQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/sched/fair_eevdf.c:845:28: warning: variable 'stats' set but not used [-Wunused-but-set-variable]
                   struct sched_statistics *stats;
                                            ^
   kernel/sched/fair_eevdf.c:912:27: warning: variable 'stats' set but not used [-Wunused-but-set-variable]
           struct sched_statistics *stats;
                                    ^
   kernel/sched/fair_eevdf.c:932:27: warning: variable 'stats' set but not used [-Wunused-but-set-variable]
           struct sched_statistics *stats;
                                    ^
   kernel/sched/fair_eevdf.c:976:27: warning: variable 'stats' set but not used [-Wunused-but-set-variable]
           struct sched_statistics *stats;
                                    ^
   kernel/sched/fair_eevdf.c:4732:28: warning: variable 'stats' set but not used [-Wunused-but-set-variable]
                   struct sched_statistics *stats;
                                            ^
>> kernel/sched/fair_eevdf.c:5716:6: warning: no previous prototype for function 'init_cfs_bandwidth' [-Wmissing-prototypes]
   void init_cfs_bandwidth(struct cfs_bandwidth *cfs_b) {}
        ^
   kernel/sched/fair_eevdf.c:5716:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void init_cfs_bandwidth(struct cfs_bandwidth *cfs_b) {}
   ^
   static 
>> kernel/sched/fair_eevdf.c:12213:6: warning: no previous prototype for function 'free_fair_sched_group' [-Wmissing-prototypes]
   void free_fair_sched_group(struct task_group *tg) { }
        ^
   kernel/sched/fair_eevdf.c:12213:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void free_fair_sched_group(struct task_group *tg) { }
   ^
   static 
>> kernel/sched/fair_eevdf.c:12215:5: warning: no previous prototype for function 'alloc_fair_sched_group' [-Wmissing-prototypes]
   int alloc_fair_sched_group(struct task_group *tg, struct task_group *parent)
       ^
   kernel/sched/fair_eevdf.c:12215:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int alloc_fair_sched_group(struct task_group *tg, struct task_group *parent)
   ^
   static 
>> kernel/sched/fair_eevdf.c:12220:6: warning: no previous prototype for function 'online_fair_sched_group' [-Wmissing-prototypes]
   void online_fair_sched_group(struct task_group *tg) { }
        ^
   kernel/sched/fair_eevdf.c:12220:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void online_fair_sched_group(struct task_group *tg) { }
   ^
   static 
>> kernel/sched/fair_eevdf.c:12222:6: warning: no previous prototype for function 'unregister_fair_sched_group' [-Wmissing-prototypes]
   void unregister_fair_sched_group(struct task_group *tg) { }
        ^
   kernel/sched/fair_eevdf.c:12222:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void unregister_fair_sched_group(struct task_group *tg) { }
   ^
   static 
   kernel/sched/fair_eevdf.c:477:20: warning: unused function 'list_del_leaf_cfs_rq' [-Wunused-function]
   static inline void list_del_leaf_cfs_rq(struct cfs_rq *cfs_rq)
                      ^
   kernel/sched/fair_eevdf.c:498:19: warning: unused function 'tg_is_idle' [-Wunused-function]
   static inline int tg_is_idle(struct task_group *tg)
                     ^
   kernel/sched/fair_eevdf.c:5697:20: warning: unused function 'sync_throttle' [-Wunused-function]
   static inline void sync_throttle(struct task_group *tg, int cpu) {}
                      ^
   kernel/sched/fair_eevdf.c:5722:37: warning: unused function 'tg_cfs_bandwidth' [-Wunused-function]
   static inline struct cfs_bandwidth *tg_cfs_bandwidth(struct task_group *tg)
                                       ^
   kernel/sched/fair_eevdf.c:5726:20: warning: unused function 'destroy_cfs_bandwidth' [-Wunused-function]
   static inline void destroy_cfs_bandwidth(struct cfs_bandwidth *cfs_b) {}
                      ^
   15 warnings generated.
--
>> kernel/sched/fair_eevdf.c:9095: warning: Function parameter or member 'sds' not described in 'update_sg_lb_stats'


vim +/init_cfs_bandwidth +5716 kernel/sched/fair_eevdf.c

  5715	
> 5716	void init_cfs_bandwidth(struct cfs_bandwidth *cfs_b) {}
  5717	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
