Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 306832C027F
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 May 2026 08:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778227764; cv=none; b=rRn6U/crTU8190u+LvaWJtGXvNwT7ivaD3nWgL4sixBI/9oJjFSGNJAyS7fGJQ6987BqMeTROUAW1LUIzJbrAmDASPgpgtTFKqv6g5PlVYXgDItBd5wiUICHpEg5MF1Cg5Su6T2s82aqRqs2doCYE94M6rriDY+Q37lmoRzgOzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778227764; c=relaxed/simple;
	bh=6liX+uRsgrSH9ff7KVYihK6VTCHjdtDNu6cxcUZ7Tfk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gViW7Q6N+7QayX8ChAb6hv5Vl6IpepKEY3ui0XRnI1Y9B1Xo+PTQuMmGUQibCxFN4Lt6HQCy2kfRoBNtgbG0EX9nDFv6FXqWhzHfjcngT66v7ALEhYw1lXsFM5wzE7gVBnDpcx8ycxfgI0NqSTNmkzM5O7wVQt6QY4rXuF+Y/ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OidZgQFu; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OidZgQFu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778227763; x=1809763763;
  h=date:from:to:cc:subject:message-id;
  bh=6liX+uRsgrSH9ff7KVYihK6VTCHjdtDNu6cxcUZ7Tfk=;
  b=OidZgQFulPdIzb/GVDJhCy1+4z2BQoMdJ4uSWNXiINy2EiNbeiP9tN2V
   eUzrrmV4K3R4L8Yip53rw+bda5rEnb18ETim9kaXTLF9jNrwLKRIQ9UyB
   gTB8MtPma5fnSXA72yzz/LjmJf2XVCFNJFtGcvf4McBIwLRNuP1rY+iua
   4Xfogx0i8pYPZyPV970gxTVpjbw5UoF5PMFxOYPNE1bblYDC5/zs3YxCc
   L7PMnYCU1p7FLWeUemsdv+NZsnyIKzVByZZtBYBmqmQ1hMDdCAEMV92Uf
   +NSAxeVzg0XnCcKNpc8YRxfL7t9ExLiTcP3xl8AyfNgAwJSKhJKPGzWTi
   g==;
X-CSE-ConnectionGUID: NRzHVu2zTKuZM97eODlvRg==
X-CSE-MsgGUID: 1SaCtmmCT3a/4yH5rt4yCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="89500226"
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; 
   d="scan'208";a="89500226"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2026 01:09:19 -0700
X-CSE-ConnectionGUID: uqKDSRAnTwqZ3FD6Xxap5w==
X-CSE-MsgGUID: VFMCxRWARqGZxT6AXyT2Rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; 
   d="scan'208";a="236639804"
Received: from lkp-server01.sh.intel.com (HELO d6e19f2f5857) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 08 May 2026 01:09:16 -0700
Received: from kbuild by d6e19f2f5857 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wLGGk-000000000qT-3QT6;
	Fri, 08 May 2026 08:09:10 +0000
Date: Fri, 08 May 2026 16:08:15 +0800
From: kernel test robot <lkp@intel.com>
To: Tejun Heo <tj@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
 "Cheng-Yang Chou" <yphbchou0911@gmail.com>,
 Changwoo Min <changwoo@igalia.com>, Andrea Righi <arighi@nvidia.com>
Subject: [linux-next:master 1779/4176]
 include/linux/compiler_types.h:699:45: error: call to
 '__compiletime_assert_1479' declared with attribute error: BUILD_BUG_ON
 failed: sizeof(struct sched_ext_ops_cid) != offsetofend(struct sched_ext_ops,
 priv)
Message-ID: <202605081637.DbH4SZ1E-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   17c7841d09ee7d33557fd075562d9289b6018c90
commit: 7e655ed7b953d194265837978ca21bb17985d4aa [1779/4176] sched_ext: Add bpf_sched_ext_ops_cid struct_ops type
config: powerpc-randconfig-001-20260508 (https://download.01.org/0day-ci/archive/20260508/202605081637.DbH4SZ1E-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260508/202605081637.DbH4SZ1E-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605081637.DbH4SZ1E-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/build_policy.c:66:
   kernel/sched/ext.c: In function 'scx_vexit':
   kernel/sched/ext.c:6534:9: warning: function 'scx_vexit' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
    6534 |         vscnprintf(ei->msg, SCX_EXIT_MSG_LEN, fmt, args);
         |         ^~~~~~~~~~
   kernel/sched/ext.c: In function 'scx_alloc_and_add_sched':
   kernel/sched/ext.c:6778:1: warning: label 'err_free_lb_resched' defined but not used [-Wunused-label]
    6778 | err_free_lb_resched:
         | ^~~~~~~~~~~~~~~~~~~
   kernel/sched/ext.c: At top level:
   kernel/sched/ext.c:328:26: warning: 'scx_find_sub_sched' defined but not used [-Wunused-function]
     328 | static struct scx_sched *scx_find_sub_sched(u64 cgroup_id) { return NULL; }
         |                          ^~~~~~~~~~~~~~~~~~
   In file included from kernel/sched/build_policy.c:52:
   kernel/sched/rt.c:12:18: warning: 'max_rt_runtime' defined but not used [-Wunused-const-variable=]
      12 | static const u64 max_rt_runtime = MAX_BW;
         |                  ^~~~~~~~~~~~~~
   In file included from <command-line>:
   kernel/sched/ext.c: In function 'scx_init':
>> include/linux/compiler_types.h:699:45: error: call to '__compiletime_assert_1479' declared with attribute error: BUILD_BUG_ON failed: sizeof(struct sched_ext_ops_cid) != offsetofend(struct sched_ext_ops, priv)
     699 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:680:25: note: in definition of macro '__compiletime_assert'
     680 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:699:9: note: in expansion of macro '_compiletime_assert'
     699 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
      40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:51:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      51 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   kernel/sched/ext.c:10314:9: note: in expansion of macro 'BUILD_BUG_ON'
   10314 |         BUILD_BUG_ON(sizeof(struct sched_ext_ops_cid) !=
         |         ^~~~~~~~~~~~


vim +/__compiletime_assert_1479 +699 include/linux/compiler_types.h

eb5c2d4b45e3d2 Will Deacon 2020-07-21  685  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  686  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21  687  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  688  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  689  /**
eb5c2d4b45e3d2 Will Deacon 2020-07-21  690   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  691   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2 Will Deacon 2020-07-21  692   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  693   *
eb5c2d4b45e3d2 Will Deacon 2020-07-21  694   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  695   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  696   * compiler has support to do so.
eb5c2d4b45e3d2 Will Deacon 2020-07-21  697   */
eb5c2d4b45e3d2 Will Deacon 2020-07-21  698  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21 @699  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  700  

:::::: The code at line 699 was first introduced by commit
:::::: eb5c2d4b45e3d2d5d052ea6b8f1463976b1020d5 compiler.h: Move compiletime_assert() macros into compiler_types.h

:::::: TO: Will Deacon <will@kernel.org>
:::::: CC: Will Deacon <will@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
