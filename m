Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8700A395
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 Jun 2023 04:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686804559; x=1718340559;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PGWSubTL7YKaUeM+fgBeZ+wj+AJhGNXLuSP69LKai3k=;
  b=TuCdgQRMDCOq7MbnFxRvcXLh+Rui+QRAmabyKVj4XQmfKG704j+Ejoxo
   pPtjrLkIYjVYxJRcH7jC+b4CwWrVtQ+X/dwcmxbaFFTIYKg+QnuG+l+z8
   l7AQekZtcT6opJG+mGqwCFdv5Xz9A19fanwfpX4Lf1ASH1WcL7QERXGhL
   v3vs3CpPidZSu1/Z5e0Urs8sK0a2Sg1F3Hj/oQRAGALuCWEGZJHjxu1Ee
   SYs9ByrTnByu0DUh5KriOL4n+kjksI1vUNzdodiWhnHadfE3/tVSoeDMX
   xc0Uc+L2XZAPVU4+fTJFz15m9mKInVTSLaFWQMV4CiFDjtPFFnUpPRWf6
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="356302370"
X-IronPort-AV: E=Sophos;i="6.00,243,1681196400"; 
   d="scan'208";a="356302370"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2023 21:49:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="782358766"
X-IronPort-AV: E=Sophos;i="6.00,243,1681196400"; 
   d="scan'208";a="782358766"
Received: from lkp-server02.sh.intel.com (HELO d59cacf64e9e) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 14 Jun 2023 21:49:17 -0700
Received: from kbuild by d59cacf64e9e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q9ev6-0001SC-2v;
	Thu, 15 Jun 2023 04:49:16 +0000
Date: Thu, 15 Jun 2023 12:48:33 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-chromeos-5.10-arcvm 1227/27671]
 include/trace/hooks/sched.h:15:1: sparse: sparse: incorrect type in
 assignment (different address spaces)
Message-ID: <202306151250.3AZi0Zh4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common mirror-chromeos-5.10-arcvm
head:   29f1d11141464083641ba665faa43811cb5b4f23
commit: a1fc1fba460be48dff2484b438888ede557930d4 [1227/27671] ANDROID: sched: add restrict vendor hook to modify task placement policy in EAS
config: x86_64-randconfig-s021-20230614 (https://download.01.org/0day-ci/archive/20230615/202306151250.3AZi0Zh4-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common mirror-chromeos-5.10-arcvm
        git checkout a1fc1fba460be48dff2484b438888ede557930d4
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306151250.3AZi0Zh4-lkp@intel.com/

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
