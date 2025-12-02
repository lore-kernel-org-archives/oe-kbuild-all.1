Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 436C32BEC43
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Dec 2025 22:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764714541; cv=none; b=mvNP3rCob0Fo7C76t/O88Bsl9JCggX368UpOoaMrrgs0Mnml9JjkkPqOxvmySia9bGL3MyeLuZeFMmjavybEexm5/GnySAnkvjtbfICvhTRtu1T8mCeNhNsC3chtdEZCn4vq0AGkcT7xB+cz/iP2JQizT1CYJvDwcm+IXlTPk70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764714541; c=relaxed/simple;
	bh=yJ7tJGsxJWMkNylL259Xsne/heHNsWnMJk4u0zHi7Ew=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=R64uwkDVnUqAvR7cbfPsO0BikNxp6eUI+X+8iOdkwg01VwZ59mVpZ3397tsnRo4H/P1DIjDO/OWG4z091sTc81avd1CZlAqwU/6ryyslNBEcI85DPm8Plvn5VVbUNuAJ1GNpX7vnB+6q2cKvv9xIStfCuDUoSvSER8cR2ztvYpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NLvPWR2I; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NLvPWR2I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764714540; x=1796250540;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yJ7tJGsxJWMkNylL259Xsne/heHNsWnMJk4u0zHi7Ew=;
  b=NLvPWR2IV4xgELvHSUWKkXsLgOYn0xRt6cSwe07tBKnAc3iXqCcQcFZA
   fE49BBqr54+X7+OFKr+BogGr3zBa/zWrcOMrviW4xkoPNMrEUS8le3VRH
   nnWpW1UTg5BJeEe+OKeW5ZSGb0g5p8GZGhMZywPraQvqvyuUAzWgsQdWm
   QpQQBwTo0ktG1TLHU0nTFYo5M9hiQ5UhPBh+82gXost4MoCXFJ16x4qIn
   xjICz9pLXHzUo52kFG4/FkSI0goHNxqOxbiB8OqnssKkrVb8gAhiqAbvj
   gdBc9lLLRUgdq+GP+lJzfcAnznEjL0L+mgfNV0+I255sbHfXo5af0fNPd
   A==;
X-CSE-ConnectionGUID: 4EjEGKkFR3CD29bUxSDPTQ==
X-CSE-MsgGUID: DColrrwQTDKapeuewgDJbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="66641840"
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; 
   d="scan'208";a="66641840"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 14:28:56 -0800
X-CSE-ConnectionGUID: PLH3Yq/USxiGxaMGIUs47g==
X-CSE-MsgGUID: 1C5/TZXsSpKZoUf3DuxRGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; 
   d="scan'208";a="194743808"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 02 Dec 2025 14:28:54 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQYrb-00000000AGR-3ZZt;
	Tue, 02 Dec 2025 22:28:51 +0000
Date: Wed, 3 Dec 2025 06:28:31 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Liu Kai <liukai284@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3450/3450] include/linux/syscalls.h:954:54:
 warning: 'struct xsched_attr' declared inside parameter list will not be
 visible outside of this definition or declaration
Message-ID: <202512030635.76WFoVdZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   1121c5557ede2747d2d2afc41d1141f25a5dcd0a
commit: 832cfa264d7c521e75b1b9ecb763c1f67993ad0e [3450/3450] xsched: add xsched_{set,get}attr syscall
config: loongarch-randconfig-002-20251203 (https://download.01.org/0day-ci/archive/20251203/202512030635.76WFoVdZ-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251203/202512030635.76WFoVdZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512030635.76WFoVdZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from mm/filemap.c:25:
>> include/linux/syscalls.h:954:54: warning: 'struct xsched_attr' declared inside parameter list will not be visible outside of this definition or declaration
     954 | asmlinkage long sys_xsched_setattr(pid_t pid, struct xsched_attr __user *arg);
         |                                                      ^~~~~~~~~~~
   include/linux/syscalls.h:955:54: warning: 'struct xsched_attr' declared inside parameter list will not be visible outside of this definition or declaration
     955 | asmlinkage long sys_xsched_getattr(pid_t pid, struct xsched_attr __user *arg);
         |                                                      ^~~~~~~~~~~
   In file included from mm/filemap.c:55:
   mm/internal.h: In function 'shrinker_debugfs_name_alloc':
   mm/internal.h:1508:9: warning: function 'shrinker_debugfs_name_alloc' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
    1508 |         shrinker->name = kvasprintf_const(GFP_KERNEL, fmt, ap);
         |         ^~~~~~~~
--
   In file included from mm/mempolicy.c:107:
>> include/linux/syscalls.h:954:54: warning: 'struct xsched_attr' declared inside parameter list will not be visible outside of this definition or declaration
     954 | asmlinkage long sys_xsched_setattr(pid_t pid, struct xsched_attr __user *arg);
         |                                                      ^~~~~~~~~~~
   include/linux/syscalls.h:955:54: warning: 'struct xsched_attr' declared inside parameter list will not be visible outside of this definition or declaration
     955 | asmlinkage long sys_xsched_getattr(pid_t pid, struct xsched_attr __user *arg);
         |                                                      ^~~~~~~~~~~
   In file included from mm/mempolicy.c:119:
   mm/internal.h: In function 'shrinker_debugfs_name_alloc':
   mm/internal.h:1508:9: warning: function 'shrinker_debugfs_name_alloc' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
    1508 |         shrinker->name = kvasprintf_const(GFP_KERNEL, fmt, ap);
         |         ^~~~~~~~
   mm/mempolicy.c: In function 'migrate_area_to_node':
   mm/mempolicy.c:1143:32: warning: variable 'vma' set but not used [-Wunused-but-set-variable]
    1143 |         struct vm_area_struct *vma;
         |                                ^~~
--
   In file included from mm/msync.c:15:
>> include/linux/syscalls.h:954:54: warning: 'struct xsched_attr' declared inside parameter list will not be visible outside of this definition or declaration
     954 | asmlinkage long sys_xsched_setattr(pid_t pid, struct xsched_attr __user *arg);
         |                                                      ^~~~~~~~~~~
   include/linux/syscalls.h:955:54: warning: 'struct xsched_attr' declared inside parameter list will not be visible outside of this definition or declaration
     955 | asmlinkage long sys_xsched_getattr(pid_t pid, struct xsched_attr __user *arg);
         |                                                      ^~~~~~~~~~~
--
   In file included from mm/madvise.c:11:
>> include/linux/syscalls.h:954:54: warning: 'struct xsched_attr' declared inside parameter list will not be visible outside of this definition or declaration
     954 | asmlinkage long sys_xsched_setattr(pid_t pid, struct xsched_attr __user *arg);
         |                                                      ^~~~~~~~~~~
   include/linux/syscalls.h:955:54: warning: 'struct xsched_attr' declared inside parameter list will not be visible outside of this definition or declaration
     955 | asmlinkage long sys_xsched_getattr(pid_t pid, struct xsched_attr __user *arg);
         |                                                      ^~~~~~~~~~~
   In file included from mm/madvise.c:37:
   mm/internal.h: In function 'shrinker_debugfs_name_alloc':
   mm/internal.h:1508:9: warning: function 'shrinker_debugfs_name_alloc' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
    1508 |         shrinker->name = kvasprintf_const(GFP_KERNEL, fmt, ap);
         |         ^~~~~~~~
   mm/madvise.c: At top level:
   mm/madvise.c:285:6: warning: no previous prototype for 'force_swapin_vma' [-Wmissing-prototypes]
     285 | void force_swapin_vma(struct vm_area_struct *vma)
         |      ^~~~~~~~~~~~~~~~


vim +954 include/linux/syscalls.h

   953	
 > 954	asmlinkage long sys_xsched_setattr(pid_t pid, struct xsched_attr __user *arg);
   955	asmlinkage long sys_xsched_getattr(pid_t pid, struct xsched_attr __user *arg);
   956	/*
   957	 * Architecture-specific system calls
   958	 */
   959	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
