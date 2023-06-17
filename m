Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07A06A28
	for <oe-kbuild-all@lists.linux.dev>; Sat, 17 Jun 2023 03:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686973274; x=1718509274;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WZ9EtLy7D8ENDPoKMMXpOMSWtS2SCap5CII5lDAIgF4=;
  b=PLVC2KXwuQui473wydKQwTL6FHdeqgokHBVagjZq7aPWruWbTX3wmUOo
   /LxmkWIsJs4/L1lzQeb59axqFeDjztbvR2ZGjUVtBozA6ZGi2PaGsl3yB
   X+OnkHGYX3KPZjBqTbWwgKAtj16s9GAfvK+RsUMNFXeeiagrfBYIBachj
   vDtRmfHsGFSuHqKW8Wo3knM7gUcdF+cox/JsVdwNLmtctxaqaGU2tmf10
   vQUdjMOB9a2qYoX7H+IBP1R+R2Wk+4t7P6SQRV6VzWjNRan9xa0YylN9N
   5/p9qgSY/mUKlz6hALKoqrdE/hxPD+GeWosWU046st5/hNUPw+EgPaQHu
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10743"; a="445738427"
X-IronPort-AV: E=Sophos;i="6.00,249,1681196400"; 
   d="scan'208";a="445738427"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2023 20:41:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10743"; a="837236933"
X-IronPort-AV: E=Sophos;i="6.00,249,1681196400"; 
   d="scan'208";a="837236933"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 16 Jun 2023 20:41:11 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qAMoI-0002C3-2f;
	Sat, 17 Jun 2023 03:41:10 +0000
Date: Sat, 17 Jun 2023 11:40:54 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-chromeos-5.10-arcvm 1227/27674]
 include/trace/hooks/sched.h:15:1: sparse: sparse: incorrect type in
 assignment (different address spaces)
Message-ID: <202306171119.z5d1uLDX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common mirror-chromeos-5.10-arcvm
head:   31e1367ff78eb68e54a2025e9c6601e3fa6c6312
commit: a1fc1fba460be48dff2484b438888ede557930d4 [1227/27674] ANDROID: sched: add restrict vendor hook to modify task placement policy in EAS
config: x86_64-randconfig-s021-20230614 (https://download.01.org/0day-ci/archive/20230617/202306171119.z5d1uLDX-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230617/202306171119.z5d1uLDX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306171119.z5d1uLDX-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/fair.c:882:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_entity *se @@     got struct sched_entity [noderef] __rcu * @@
   kernel/sched/fair.c:882:34: sparse:     expected struct sched_entity *se
   kernel/sched/fair.c:882:34: sparse:     got struct sched_entity [noderef] __rcu *
   kernel/sched/fair.c:10541:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:10541:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:10541:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:4876:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:4876:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/fair.c:4876:22: sparse:    struct task_struct *
   kernel/sched/fair.c:5633:1: sparse: sparse: symbol '__pcpu_scope_load_balance_mask' was not declared. Should it be static?
   kernel/sched/fair.c:5634:1: sparse: sparse: symbol '__pcpu_scope_select_idle_mask' was not declared. Should it be static?
   kernel/sched/fair.c:6575:20: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:6575:20: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:6575:20: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:6731:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] tmp @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:6731:9: sparse:     expected struct sched_domain *[assigned] tmp
   kernel/sched/fair.c:6731:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:6930:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:6930:38: sparse:     expected struct task_struct *curr
   kernel/sched/fair.c:6930:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair.c:7181:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:7181:38: sparse:     expected struct task_struct *curr
   kernel/sched/fair.c:7181:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair.c:8139:40: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *child @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/fair.c:8139:40: sparse:     expected struct sched_domain *child
   kernel/sched/fair.c:8139:40: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/fair.c:8632:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:8632:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/fair.c:8632:22: sparse:    struct task_struct *
   kernel/sched/fair.c:9869:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:9869:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:9869:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:9529:44: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *sd_parent @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:9529:44: sparse:     expected struct sched_domain *sd_parent
   kernel/sched/fair.c:9529:44: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:9947:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:9947:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:9947:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:10742:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:10742:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/fair.c:10742:22: sparse:    struct task_struct *
   kernel/sched/fair.c:10875:30: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:10875:30: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/fair.c:10875:30: sparse:    struct task_struct *
   kernel/sched/fair.c:3890:30: sparse: sparse: cast to non-scalar
   kernel/sched/fair.c:3890:30: sparse: sparse: cast from non-scalar
   kernel/sched/fair.c:3890:30: sparse: sparse: cast to non-scalar
   kernel/sched/fair.c:3890:30: sparse: sparse: cast from non-scalar
   kernel/sched/fair.c:3890:30: sparse: sparse: cast to non-scalar
   kernel/sched/fair.c:3890:30: sparse: sparse: cast from non-scalar
   kernel/sched/fair.c:3890:30: sparse: sparse: cast to non-scalar
   kernel/sched/fair.c:3890:30: sparse: sparse: cast from non-scalar
   kernel/sched/fair.c:3890:30: sparse: sparse: cast to non-scalar
   kernel/sched/fair.c:3890:30: sparse: sparse: cast from non-scalar
   kernel/sched/fair.c:3890:30: sparse: sparse: cast to non-scalar
   kernel/sched/fair.c:3890:30: sparse: sparse: cast from non-scalar
   kernel/sched/fair.c: note: in included file:
>> include/trace/hooks/sched.h:15:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/sched.h:15:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/sched.h:15:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   kernel/sched/fair.c:5938:28: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/fair.c:5938:28: sparse:     expected struct sched_domain *sd
   kernel/sched/fair.c:5938:28: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/fair.c:5944:28: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/fair.c:5944:28: sparse:     expected struct sched_domain *sd
   kernel/sched/fair.c:5944:28: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/fair.c:5951:28: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/fair.c:5951:28: sparse:     expected struct sched_domain *sd
   kernel/sched/fair.c:5951:28: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/fair.c:5959:17: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] tmp @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:5959:17: sparse:     expected struct sched_domain *[assigned] tmp
   kernel/sched/fair.c:5959:17: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c: note: in included file:
   kernel/sched/sched.h:1805:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:1805:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:1805:9: sparse:    struct task_struct *

vim +15 include/trace/hooks/sched.h

  > 15	DECLARE_RESTRICTED_HOOK(android_rvh_select_task_rq_fair,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
