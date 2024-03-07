Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 510AA130AF1
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Mar 2024 17:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709832018; cv=none; b=KFC2rtKf5/LjdQLcDixRAusVJReNbeuMjTlR0a42dy+mCeZx2Z61EE+u7Wc3/Nk46nvdR/fsDLFMQftunOoelNnPzpQ3uok+zhu1v6RZW0CeTIjZKawKlWVdQcc3qHDQKiTjy4VUuM3U+86cZypb83AoT2kKH58qeasggoUL5Ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709832018; c=relaxed/simple;
	bh=T5ZJVWyjUYc9WXz44MnOKsB6Eib8IbqwLZ031CP4NGw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=a7/PGVv70qXnVTP6KbC9cfqvHPx50LQRL7bV57juqDNab+U9LFSVcGrewKPotqk3gi2eh4fKCsbT7S/pmnCplH6I2xrqAk6sIgB+W0BYTTGRmDr3GmS0HuWfHS7bKRQoiQ5TYX2bHQOA6oOA8nBUMH42lKxdjCg5Y3ZlIv0P5ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wkplf+6o; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wkplf+6o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709832016; x=1741368016;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=T5ZJVWyjUYc9WXz44MnOKsB6Eib8IbqwLZ031CP4NGw=;
  b=Wkplf+6oNN3ug8l7xUkErcmN73bMj2/wVvGBK83woMrpxr45bsL18dPP
   yL9Y35g89z6grIJZgj0YhlCGX9UMm+s+XiDoiiGTTve8MPMCkc2xN+3Tj
   aFMaZtaPFfxE0gPpUoaCTMwPKPHIcaezgy1PXHsNSuuY2b8pBAaCMTPA0
   7jK9v+bDDCMYF95+w3YJCbEre0X1a3AsOAm/+Jfs9f2osApk7kTOirjfP
   qnwqRcd20EgU36G+7hoThHoVX77y6+FhnuUzykTejXwqovZZ4Y6R1VFhZ
   6Oi5REfEjarzrkLPJfVhOAWz1mowFDrwwcUl1trki66JKa4P3LqCwzanI
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="4693787"
X-IronPort-AV: E=Sophos;i="6.07,212,1708416000"; 
   d="scan'208";a="4693787"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2024 09:20:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,107,1708416000"; 
   d="scan'208";a="14739679"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 07 Mar 2024 09:20:09 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1riHPa-0005RV-2T;
	Thu, 07 Mar 2024 17:20:06 +0000
Date: Fri, 8 Mar 2024 01:19:14 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/next 25735/27434] kernel/sched/psi.c:275:38:
 error: 'cpu_cgrp_subsys_on_dfl_key' undeclared; did you mean
 'cpuset_cgrp_subsys_on_dfl_key'?
Message-ID: <202403080147.tyzIb35X-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/next
head:   0e88d1c26496999d1b2e37f3393b602d28b03faf
commit: 0e5fb2bd883d16551ac628df69281b81094f53cd [25735/27434] emm: psi: support cgroup v1 psi accounting
config: arm64-randconfig-001-20240305 (https://download.01.org/0day-ci/archive/20240308/202403080147.tyzIb35X-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240308/202403080147.tyzIb35X-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403080147.tyzIb35X-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm64/include/asm/lse.h:13,
                    from arch/arm64/include/asm/cmpxchg.h:14,
                    from arch/arm64/include/asm/atomic.h:16,
                    from include/linux/atomic.h:7,
                    from include/asm-generic/bitops/atomic.h:5,
                    from arch/arm64/include/asm/bitops.h:26,
                    from include/linux/bitops.h:27,
                    from include/linux/kernel.h:12,
                    from include/linux/list.h:9,
                    from include/linux/timer.h:5,
                    from include/linux/workqueue.h:9,
                    from kernel/sched/../workqueue_internal.h:11,
                    from kernel/sched/psi.c:139:
   kernel/sched/psi.c: In function 'psi_use_legacy':
>> kernel/sched/psi.c:275:38: error: 'cpu_cgrp_subsys_on_dfl_key' undeclared (first use in this function); did you mean 'cpuset_cgrp_subsys_on_dfl_key'?
     275 |         return !cgroup_subsys_on_dfl(cpu_cgrp_subsys) &&
         |                                      ^~~~~~~~~~~~~~~
   include/linux/jump_label.h:457:50: note: in definition of macro 'static_branch_likely'
     457 |         if (__builtin_types_compatible_p(typeof(*x), struct static_key_true))   \
         |                                                  ^
   kernel/sched/psi.c:275:17: note: in expansion of macro 'cgroup_subsys_on_dfl'
     275 |         return !cgroup_subsys_on_dfl(cpu_cgrp_subsys) &&
         |                 ^~~~~~~~~~~~~~~~~~~~
   kernel/sched/psi.c:275:38: note: each undeclared identifier is reported only once for each function it appears in
     275 |         return !cgroup_subsys_on_dfl(cpu_cgrp_subsys) &&
         |                                      ^~~~~~~~~~~~~~~
   include/linux/jump_label.h:457:50: note: in definition of macro 'static_branch_likely'
     457 |         if (__builtin_types_compatible_p(typeof(*x), struct static_key_true))   \
         |                                                  ^
   kernel/sched/psi.c:275:17: note: in expansion of macro 'cgroup_subsys_on_dfl'
     275 |         return !cgroup_subsys_on_dfl(cpu_cgrp_subsys) &&
         |                 ^~~~~~~~~~~~~~~~~~~~
>> kernel/sched/psi.c:277:38: error: 'io_cgrp_subsys_on_dfl_key' undeclared (first use in this function); did you mean 'debug_cgrp_subsys_on_dfl_key'?
     277 |                !cgroup_subsys_on_dfl(io_cgrp_subsys);
         |                                      ^~~~~~~~~~~~~~
   include/linux/jump_label.h:457:50: note: in definition of macro 'static_branch_likely'
     457 |         if (__builtin_types_compatible_p(typeof(*x), struct static_key_true))   \
         |                                                  ^
   kernel/sched/psi.c:277:17: note: in expansion of macro 'cgroup_subsys_on_dfl'
     277 |                !cgroup_subsys_on_dfl(io_cgrp_subsys);
         |                 ^~~~~~~~~~~~~~~~~~~~
   kernel/sched/psi.c: In function 'psi_group_change_legacy':
>> kernel/sched/psi.c:911:54: error: 'io_cgrp_subsys' undeclared (first use in this function); did you mean 'debug_cgrp_subsys'?
     911 |                 group = cgroup_psi(task_cgroup(task, io_cgrp_subsys.id));
         |                                                      ^~~~~~~~~~~~~~
         |                                                      debug_cgrp_subsys
>> kernel/sched/psi.c:925:54: error: 'cpu_cgrp_subsys' undeclared (first use in this function); did you mean 'cpuset_cgrp_subsys'?
     925 |                 group = cgroup_psi(task_cgroup(task, cpu_cgrp_subsys.id));
         |                                                      ^~~~~~~~~~~~~~~
         |                                                      cpuset_cgrp_subsys


vim +275 kernel/sched/psi.c

   271	
   272	static inline bool psi_use_legacy(void)
   273	{
   274	#ifdef CONFIG_CGROUPS
 > 275		return !cgroup_subsys_on_dfl(cpu_cgrp_subsys) &&
   276		       !cgroup_subsys_on_dfl(memory_cgrp_subsys) &&
 > 277		       !cgroup_subsys_on_dfl(io_cgrp_subsys);
   278	#else
   279		return false;
   280	#endif
   281	}
   282	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
