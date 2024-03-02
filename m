Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D554B10E3
	for <oe-kbuild-all@lists.linux.dev>; Sat,  2 Mar 2024 00:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709340735; cv=none; b=Rliyh4kpmBBWnUcDxFoIh6IQGUry8Wm+NZppFZOYp2gaCxjo6t0ahgtwCj3u7nS3phZ7F4fisv1BCXsOjqGDw90ZTDR/78b7Yj4xl/v4WubFnwTQQlp1sxtx50KaJSGCffSgXg4cvfuEb22gwmyo9OOCk1FFA/SWQ7LnHe0sGR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709340735; c=relaxed/simple;
	bh=O+/elImLO4b/UcP2+PmUEXpLmuVdYS/HP+Nu/hdQUsQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ImnTwC4chSKWoVOXhTsgQ88+ZYnDhRG9BZ6nwAd6nmSPKn4vNhyJiK4wQZdljy1QtMEoffVzqOaXxWRkx5Zd/oh6Jr1X3WN39s4C4KC4/Rm0+Lg9tFzjKgOJj97RUx8/5Fjg7Bo7A88fVf8U2c11S13t8E3ObiWrN8HvaTwHJNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=krSKErQ2; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="krSKErQ2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709340734; x=1740876734;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=O+/elImLO4b/UcP2+PmUEXpLmuVdYS/HP+Nu/hdQUsQ=;
  b=krSKErQ2Mf+fERNYAcg3UdA74deGZYHuVgwJ1oq43fXu69OsWRI9d4KV
   RzFCslV75w4zrVIJUJxWM+nI1vktVoVSuhEnW6m2RTBVRptWfDnqvyN3I
   1Kfbx9vN+5T1pOineVZsERMumUsEVeGovHlyQG5a1h1DZ+5bcenQ0i+A1
   flka+L+OatnQyMzBitMZhcT+q/VMy/GXY+2tW592B8jhcwBfjuqURgaWK
   E5h3nk93fsiU+kYwbxZwEOPu9O8tT95aRKC2gGMwoamYJKW3eJeAJTzbd
   SlOzMauVUJkdjqAqef8qLOu7LumBdpvtNw4ygSXsd+6tpNSR3RIIdLHVc
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11000"; a="4478502"
X-IronPort-AV: E=Sophos;i="6.06,197,1705392000"; 
   d="scan'208";a="4478502"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2024 16:52:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,197,1705392000"; 
   d="scan'208";a="12883186"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 01 Mar 2024 16:52:10 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rgDbk-000ECd-0H;
	Sat, 02 Mar 2024 00:52:08 +0000
Date: Sat, 2 Mar 2024 08:51:10 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 86/98] kernel/sched/psi.c:268:38: error:
 'io_cgrp_subsys_on_dfl_key' undeclared; did you mean
 'cpu_cgrp_subsys_on_dfl_key'?
Message-ID: <202403020803.2gRKvIgN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   a4b2dc2ffad1810ebe7a86710aa1e5cc312aa2a1
commit: 5ad399e959efe7243d5e3c8afc13d249c607746a [86/98] psi: support cgroup v1 psi accounting
config: arm64-randconfig-004-20240302 (https://download.01.org/0day-ci/archive/20240302/202403020803.2gRKvIgN-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240302/202403020803.2gRKvIgN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403020803.2gRKvIgN-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm64/include/asm/preempt.h:5,
                    from include/linux/preempt.h:79,
                    from include/linux/smp.h:110,
                    from include/linux/sched/clock.h:5,
                    from kernel/sched/build_utility.c:12:
   kernel/sched/psi.c: In function 'psi_use_legacy':
   kernel/sched/psi.c:267:38: error: 'memory_cgrp_subsys_on_dfl_key' undeclared (first use in this function); did you mean 'debug_cgrp_subsys_on_dfl_key'?
     267 |                !cgroup_subsys_on_dfl(memory_cgrp_subsys) &&
         |                                      ^~~~~~~~~~~~~~~~~~
   include/linux/jump_label.h:485:50: note: in definition of macro 'static_branch_likely'
     485 |         if (__builtin_types_compatible_p(typeof(*x), struct static_key_true))   \
         |                                                  ^
   kernel/sched/psi.c:267:17: note: in expansion of macro 'cgroup_subsys_on_dfl'
     267 |                !cgroup_subsys_on_dfl(memory_cgrp_subsys) &&
         |                 ^~~~~~~~~~~~~~~~~~~~
   kernel/sched/psi.c:267:38: note: each undeclared identifier is reported only once for each function it appears in
     267 |                !cgroup_subsys_on_dfl(memory_cgrp_subsys) &&
         |                                      ^~~~~~~~~~~~~~~~~~
   include/linux/jump_label.h:485:50: note: in definition of macro 'static_branch_likely'
     485 |         if (__builtin_types_compatible_p(typeof(*x), struct static_key_true))   \
         |                                                  ^
   kernel/sched/psi.c:267:17: note: in expansion of macro 'cgroup_subsys_on_dfl'
     267 |                !cgroup_subsys_on_dfl(memory_cgrp_subsys) &&
         |                 ^~~~~~~~~~~~~~~~~~~~
>> kernel/sched/psi.c:268:38: error: 'io_cgrp_subsys_on_dfl_key' undeclared (first use in this function); did you mean 'cpu_cgrp_subsys_on_dfl_key'?
     268 |                !cgroup_subsys_on_dfl(io_cgrp_subsys);
         |                                      ^~~~~~~~~~~~~~
   include/linux/jump_label.h:485:50: note: in definition of macro 'static_branch_likely'
     485 |         if (__builtin_types_compatible_p(typeof(*x), struct static_key_true))   \
         |                                                  ^
   kernel/sched/psi.c:268:17: note: in expansion of macro 'cgroup_subsys_on_dfl'
     268 |                !cgroup_subsys_on_dfl(io_cgrp_subsys);
         |                 ^~~~~~~~~~~~~~~~~~~~
   In file included from kernel/sched/build_utility.c:97:
   kernel/sched/psi.c: In function 'psi_group_change_legacy':
>> kernel/sched/psi.c:936:54: error: 'io_cgrp_subsys' undeclared (first use in this function); did you mean 'cpu_cgrp_subsys'?
     936 |                 group = cgroup_psi(task_cgroup(task, io_cgrp_subsys.id));
         |                                                      ^~~~~~~~~~~~~~
         |                                                      cpu_cgrp_subsys
   kernel/sched/psi.c:943:54: error: 'memory_cgrp_subsys' undeclared (first use in this function); did you mean 'debug_cgrp_subsys'?
     943 |                 group = cgroup_psi(task_cgroup(task, memory_cgrp_subsys.id));
         |                                                      ^~~~~~~~~~~~~~~~~~
         |                                                      debug_cgrp_subsys


vim +268 kernel/sched/psi.c

   262	
   263	static inline bool psi_use_legacy(void)
   264	{
   265	#ifdef CONFIG_CGROUPS
   266		return !cgroup_subsys_on_dfl(cpu_cgrp_subsys) &&
   267		       !cgroup_subsys_on_dfl(memory_cgrp_subsys) &&
 > 268		       !cgroup_subsys_on_dfl(io_cgrp_subsys);
   269	#else
   270		return false;
   271	#endif
   272	}
   273	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
