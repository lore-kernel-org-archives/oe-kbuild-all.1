Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 494BF360
	for <oe-kbuild-all@lists.linux.dev>; Sun, 28 May 2023 08:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685262902; x=1716798902;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kTAJY7J2FTUpix1Q8xcSoPwXfHV/MzhuD5j6iUGY6wA=;
  b=IEmaQiAEMb9fj3aGtEh8F6wY/qgp7REEPOZxIP7C0+GozE/WKW4mUwhH
   4qY1zsFEMYSFq8hSl1DWNXGPgEcFj6tF4Z6m6OG9oK/Bz7hb4GREbGAc9
   Jp1XkSxRX9Zh6QUjSvSL7TT/OY1TNjdXHaYJQV05M6JBSyI0N3LslI2Kq
   9AuRmAJ7ONwVjkHPf4aw1lthtOcEHn9gljjAAOPy7K+Cqa3pBfJK/2reA
   Fy6TlFvGM9nRhwPeFt+7N209J2t69oFqyf4Kz5oPXDk6nAqDNo11yemZz
   or9wGBDUQXQr49slMbNx8A99nSVn1U7gbn75txALc7WqngR/MLLBwWHPa
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10723"; a="357744493"
X-IronPort-AV: E=Sophos;i="6.00,198,1681196400"; 
   d="scan'208";a="357744493"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2023 01:35:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10723"; a="738761485"
X-IronPort-AV: E=Sophos;i="6.00,198,1681196400"; 
   d="scan'208";a="738761485"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 28 May 2023 01:35:00 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q3Brf-000KUy-21;
	Sun, 28 May 2023 08:34:59 +0000
Date: Sun, 28 May 2023 16:34:13 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:arcvm12-5.10 1255/27651]
 include/trace/hooks/sched.h:32:1: sparse: sparse: incorrect type in
 assignment (different address spaces)
Message-ID: <202305281621.nOwaAJUj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common arcvm12-5.10
head:   fb8d4193a852c7d62938aaf3a8c58bbc7888bb23
commit: 16330b35600f00c589cd1a621d132635aabc1816 [1255/27651] ANDROID: Add vendor hooks to the scheduler
config: i386-randconfig-s001-20230528 (https://download.01.org/0day-ci/archive/20230528/202305281621.nOwaAJUj-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common arcvm12-5.10
        git checkout 16330b35600f00c589cd1a621d132635aabc1816
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305281621.nOwaAJUj-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/core.c:515:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:515:38: sparse:     expected struct task_struct *curr
   kernel/sched/core.c:515:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:1439:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:1439:33: sparse:     expected struct task_struct *p
   kernel/sched/core.c:1439:33: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:1439:68: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:1439:68: sparse:     expected struct task_struct *tsk
   kernel/sched/core.c:1439:68: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:3684:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:3684:38: sparse:     expected struct task_struct *curr
   kernel/sched/core.c:3684:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:4119:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *prev @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:4119:14: sparse:     expected struct task_struct *prev
   kernel/sched/core.c:4119:14: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:4542:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:4542:17: sparse:    struct task_struct *
   kernel/sched/core.c:4542:17: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/core.c:4742:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:4742:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/core.c:4742:22: sparse:    struct task_struct *
   kernel/sched/core.c:8067:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:8067:25: sparse:     expected struct task_struct *p
   kernel/sched/core.c:8067:25: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c: note: in included file:
>> include/trace/hooks/sched.h:32:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/sched.h:32:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/sched.h:32:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/sched.h:36:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/sched.h:36:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/sched.h:36:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   kernel/sched/core.c:1422:33: sparse: sparse: dereference of noderef expression
   kernel/sched/core.c:1423:19: sparse: sparse: dereference of noderef expression
   kernel/sched/core.c:1426:40: sparse: sparse: dereference of noderef expression
   kernel/sched/core.c: note: in included file:
   kernel/sched/sched.h:1659:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:1659:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:1659:25: sparse:    struct task_struct *
   kernel/sched/sched.h:1805:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:1805:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:1805:9: sparse:    struct task_struct *
   kernel/sched/sched.h:1805:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:1805:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:1805:9: sparse:    struct task_struct *
   kernel/sched/sched.h:1659:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:1659:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:1659:25: sparse:    struct task_struct *
   kernel/sched/sched.h:1805:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:1805:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:1805:9: sparse:    struct task_struct *
   kernel/sched/sched.h:1811:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:1811:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:1811:9: sparse:    struct task_struct *
   kernel/sched/sched.h:1659:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:1659:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:1659:25: sparse:    struct task_struct *
   kernel/sched/sched.h:1805:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:1805:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:1805:9: sparse:    struct task_struct *
   kernel/sched/sched.h:1811:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:1811:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:1811:9: sparse:    struct task_struct *
   kernel/sched/sched.h:1659:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:1659:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:1659:25: sparse:    struct task_struct *
   kernel/sched/sched.h:1805:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:1805:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:1805:9: sparse:    struct task_struct *
   kernel/sched/sched.h:1811:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:1811:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:1811:9: sparse:    struct task_struct *
   kernel/sched/sched.h:1659:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:1659:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:1659:25: sparse:    struct task_struct *
   kernel/sched/sched.h:1659:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:1659:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:1659:25: sparse:    struct task_struct *
   kernel/sched/sched.h:1805:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:1805:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:1805:9: sparse:    struct task_struct *
   kernel/sched/sched.h:1811:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:1811:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:1811:9: sparse:    struct task_struct *

vim +32 include/trace/hooks/sched.h

  > 32	DECLARE_RESTRICTED_HOOK(android_rvh_enqueue_task,
    33		TP_PROTO(struct rq *rq, struct task_struct *p),
    34		TP_ARGS(rq, p), 1);
    35	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
