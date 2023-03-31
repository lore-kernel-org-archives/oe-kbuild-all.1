Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 259A623D6
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 Mar 2023 10:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680258156; x=1711794156;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HiC2YI+ytqZTq5AjDuZW7+hcL9mmujfOhKE1/9Tlp2w=;
  b=XVsTBBheGVvpIeVR9FVd2Zd/ve4amAcgna075rCckuYiCOE6xZu22/cQ
   bH7Vk9U8wqmkMnL4rI8SdQKuK+MedlQQyq7vLXoeC3IJTjsPuFaElqfG5
   IQE1CvNAK/wMnkGlL4laLJl/EI1zsHEHpH1Ry3AJjH7m4I42gFaOh5jZA
   EB/bCbAnlcEOM4738HIeut4DCOkZKwxIFEqtKe6tFZoRpsGdzHWHbguWz
   MpUJv1CTL/KXXcjA3b4oH4mFLzxHWnvEHTRfPRA5zUaA7bOefHIg6epKu
   OajW9tN+0pu4ehVDo0PfPRUzEjfdWPgTuwEVAh+qPqJ1wPgec6AuOttGQ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="325382915"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; 
   d="scan'208";a="325382915"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2023 03:22:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="774310982"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; 
   d="scan'208";a="774310982"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 31 Mar 2023 03:22:32 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1piBtv-000LgO-1y;
	Fri, 31 Mar 2023 10:22:31 +0000
Date: Fri, 31 Mar 2023 18:21:47 +0800
From: kernel test robot <lkp@intel.com>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH] sched: Introduce mm_cid runqueue cache
Message-ID: <202303311804.TvW7o8Oz-lkp@intel.com>
References: <20230327195318.137094-1-mathieu.desnoyers@efficios.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230327195318.137094-1-mathieu.desnoyers@efficios.com>

Hi Mathieu,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on tip/sched/core]
[also build test WARNING on linus/master v6.3-rc4 next-20230331]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mathieu-Desnoyers/sched-Introduce-mm_cid-runqueue-cache/20230328-035418
patch link:    https://lore.kernel.org/r/20230327195318.137094-1-mathieu.desnoyers%40efficios.com
patch subject: [RFC PATCH] sched: Introduce mm_cid runqueue cache
config: loongarch-randconfig-s041-20230330 (https://download.01.org/0day-ci/archive/20230331/202303311804.TvW7o8Oz-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/intel-lab-lkp/linux/commit/1ed2ac17a591daac640ef7149cdc3c8e0870e474
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Mathieu-Desnoyers/sched-Introduce-mm_cid-runqueue-cache/20230328-035418
        git checkout 1ed2ac17a591daac640ef7149cdc3c8e0870e474
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=loongarch olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=loongarch SHELL=/bin/bash kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303311804.TvW7o8Oz-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/core.c:607:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/sched/core.c:607:9: sparse:     expected void *ptr
   kernel/sched/core.c:607:9: sparse:     got unsigned int [noderef] __percpu *
   kernel/sched/core.c:607:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/sched/core.c:607:9: sparse:     expected void *ptr
   kernel/sched/core.c:607:9: sparse:     got unsigned int [noderef] __percpu *
   kernel/sched/core.c:607:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/sched/core.c:607:9: sparse:     expected void *ptr
   kernel/sched/core.c:607:9: sparse:     got unsigned int [noderef] __percpu *
   kernel/sched/core.c:607:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/sched/core.c:607:9: sparse:     expected void *ptr
   kernel/sched/core.c:607:9: sparse:     got unsigned int [noderef] __percpu *
   kernel/sched/core.c:607:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/sched/core.c:607:9: sparse:     expected void *ptr
   kernel/sched/core.c:607:9: sparse:     got int [noderef] __percpu *
   kernel/sched/core.c:607:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/sched/core.c:607:9: sparse:     expected void *ptr
   kernel/sched/core.c:607:9: sparse:     got int [noderef] __percpu *
   kernel/sched/core.c:607:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/sched/core.c:607:9: sparse:     expected void *ptr
   kernel/sched/core.c:607:9: sparse:     got int [noderef] __percpu *
   kernel/sched/core.c:607:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/sched/core.c:607:9: sparse:     expected void *ptr
   kernel/sched/core.c:607:9: sparse:     got int [noderef] __percpu *
   kernel/sched/core.c:791:48: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:791:48: sparse:     expected struct task_struct *p
   kernel/sched/core.c:791:48: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:1038:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:1038:38: sparse:     expected struct task_struct *curr
   kernel/sched/core.c:1038:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:1096:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/core.c:1096:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/core.c:1096:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/core.c:2202:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:2202:33: sparse:     expected struct task_struct *p
   kernel/sched/core.c:2202:33: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:2202:68: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:2202:68: sparse:     expected struct task_struct *tsk
   kernel/sched/core.c:2202:68: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:3677:17: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/core.c:3677:17: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/core.c:3677:17: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/core.c:3886:28: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:3886:28: sparse:     expected struct task_struct const *p
   kernel/sched/core.c:3886:28: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:9408:43: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *push_task @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:9408:43: sparse:     expected struct task_struct *push_task
   kernel/sched/core.c:9408:43: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:5588:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:5588:38: sparse:     expected struct task_struct *curr
   kernel/sched/core.c:5588:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:5681:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:5681:14: sparse:     expected struct task_struct *curr
   kernel/sched/core.c:5681:14: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:6543:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *prev @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:6543:14: sparse:     expected struct task_struct *prev
   kernel/sched/core.c:6543:14: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:7069:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:7069:17: sparse:    struct task_struct *
   kernel/sched/core.c:7069:17: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/core.c:7285:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:7285:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/core.c:7285:22: sparse:    struct task_struct *
   kernel/sched/core.c:11426:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:11426:25: sparse:     expected struct task_struct *p
   kernel/sched/core.c:11426:25: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:547:6: sparse: sparse: context imbalance in 'raw_spin_rq_lock_nested' - wrong count at exit
   kernel/sched/core.c:580:23: sparse: sparse: context imbalance in 'raw_spin_rq_trylock' - wrong count at exit
   kernel/sched/core.c:596:6: sparse: sparse: context imbalance in 'raw_spin_rq_unlock' - unexpected unlock
   kernel/sched/core.c:634:36: sparse: sparse: context imbalance in '__task_rq_lock' - wrong count at exit
   kernel/sched/core.c:675:36: sparse: sparse: context imbalance in 'task_rq_lock' - wrong count at exit
   kernel/sched/core.c: note: in included file:
   kernel/sched/pelt.h:97:13: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/pelt.h:97:13: sparse:     expected struct task_struct const *p
   kernel/sched/pelt.h:97:13: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:791:11: sparse: sparse: dereference of noderef expression
   kernel/sched/core.c:2193:33: sparse: sparse: dereference of noderef expression
   kernel/sched/core.c:2194:19: sparse: sparse: dereference of noderef expression
   kernel/sched/core.c:2195:18: sparse: sparse: dereference of noderef expression
   kernel/sched/core.c: note: in included file:
   kernel/sched/sched.h:3318:30: sparse: sparse: dereference of noderef expression
>> kernel/sched/sched.h:3275:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/sched/sched.h:3275:9: sparse:     expected void *ptr
   kernel/sched/sched.h:3275:9: sparse:     got unsigned int [noderef] __percpu *
>> kernel/sched/sched.h:3275:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/sched/sched.h:3275:9: sparse:     expected void *ptr
   kernel/sched/sched.h:3275:9: sparse:     got unsigned int [noderef] __percpu *
>> kernel/sched/sched.h:3275:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/sched/sched.h:3275:9: sparse:     expected void *ptr
   kernel/sched/sched.h:3275:9: sparse:     got unsigned int [noderef] __percpu *
>> kernel/sched/sched.h:3275:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/sched/sched.h:3275:9: sparse:     expected void *ptr
   kernel/sched/sched.h:3275:9: sparse:     got unsigned int [noderef] __percpu *
>> kernel/sched/sched.h:3275:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/sched/sched.h:3275:9: sparse:     expected void *ptr
   kernel/sched/sched.h:3275:9: sparse:     got int [noderef] __percpu *
>> kernel/sched/sched.h:3275:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/sched/sched.h:3275:9: sparse:     expected void *ptr
   kernel/sched/sched.h:3275:9: sparse:     got int [noderef] __percpu *
>> kernel/sched/sched.h:3275:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/sched/sched.h:3275:9: sparse:     expected void *ptr
   kernel/sched/sched.h:3275:9: sparse:     got int [noderef] __percpu *
>> kernel/sched/sched.h:3275:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/sched/sched.h:3275:9: sparse:     expected void *ptr
   kernel/sched/sched.h:3275:9: sparse:     got int [noderef] __percpu *
   kernel/sched/sched.h:3318:30: sparse: sparse: dereference of noderef expression
>> kernel/sched/sched.h:3275:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/sched/sched.h:3275:9: sparse:     expected void *ptr
   kernel/sched/sched.h:3275:9: sparse:     got unsigned int [noderef] __percpu *
>> kernel/sched/sched.h:3275:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/sched/sched.h:3275:9: sparse:     expected void *ptr
   kernel/sched/sched.h:3275:9: sparse:     got unsigned int [noderef] __percpu *
>> kernel/sched/sched.h:3275:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/sched/sched.h:3275:9: sparse:     expected void *ptr
   kernel/sched/sched.h:3275:9: sparse:     got unsigned int [noderef] __percpu *
>> kernel/sched/sched.h:3275:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/sched/sched.h:3275:9: sparse:     expected void *ptr
   kernel/sched/sched.h:3275:9: sparse:     got unsigned int [noderef] __percpu *
>> kernel/sched/sched.h:3275:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/sched/sched.h:3275:9: sparse:     expected void *ptr
   kernel/sched/sched.h:3275:9: sparse:     got int [noderef] __percpu *
>> kernel/sched/sched.h:3275:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/sched/sched.h:3275:9: sparse:     expected void *ptr
   kernel/sched/sched.h:3275:9: sparse:     got int [noderef] __percpu *
>> kernel/sched/sched.h:3275:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/sched/sched.h:3275:9: sparse:     expected void *ptr
   kernel/sched/sched.h:3275:9: sparse:     got int [noderef] __percpu *
>> kernel/sched/sched.h:3275:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/sched/sched.h:3275:9: sparse:     expected void *ptr
   kernel/sched/sched.h:3275:9: sparse:     got int [noderef] __percpu *
   kernel/sched/sched.h:2089:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2089:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2089:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2251:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2251:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2251:9: sparse:    struct task_struct *
   kernel/sched/core.c:2168:38: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:2168:38: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/core.c:2168:38: sparse:    struct task_struct const *
   kernel/sched/sched.h:2089:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2089:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2089:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2251:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2251:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2251:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2251:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2251:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2251:9: sparse:    struct task_struct *
   kernel/sched/core.c: note: in included file (through arch/loongarch/include/asm/cpu-info.h, arch/loongarch/include/asm/processor.h, ...):
   arch/loongarch/include/asm/loongarch.h:221:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_w'
   arch/loongarch/include/asm/loongarch.h:221:9: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/loongarch.h:226:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_d'
   arch/loongarch/include/asm/loongarch.h:226:9: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/loongarch.h:226:9: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/loongarch.h:211:16: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_w'
   arch/loongarch/include/asm/loongarch.h:211:16: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/loongarch.h:221:9: sparse: sparse: cast from unknown type
   kernel/sched/core.c: note: in included file:
   kernel/sched/sched.h:2089:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2089:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2089:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2251:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2251:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2251:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2089:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2089:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2089:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2251:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2251:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2251:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2089:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2089:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2089:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2251:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2251:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2251:9: sparse:    struct task_struct *
   kernel/sched/core.c: note: in included file (through arch/loongarch/include/asm/cpu-info.h, arch/loongarch/include/asm/processor.h, ...):
   arch/loongarch/include/asm/loongarch.h:221:9: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/loongarch.h:226:9: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/loongarch.h:226:9: sparse: sparse: cast from unknown type
   kernel/sched/core.c: note: in included file:
   kernel/sched/sched.h:2089:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2089:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2089:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2251:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2251:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2251:9: sparse:    struct task_struct *

vim +3275 kernel/sched/sched.h

  3272	
  3273	static inline void mm_cid_put(struct mm_struct *mm, int cid)
  3274	{
> 3275		lockdep_assert_irqs_disabled();
  3276		if (cid < 0)
  3277			return;
  3278		raw_spin_lock(&mm->cid_lock);
  3279		__cpumask_clear_cpu(cid, mm_cidmask(mm));
  3280		raw_spin_unlock(&mm->cid_lock);
  3281	}
  3282	
  3283	static inline struct rq_cid_entry *rq_cid_cache_lookup(struct rq *rq, struct mm_struct *mm)
  3284	{
  3285		struct rq_cid_cache *cid_cache = &rq->cid_cache;
  3286		int i;
  3287	
  3288		for (i = 0; i < RQ_CID_CACHE_SIZE; i++) {
  3289			struct rq_cid_entry *entry = &cid_cache->entry[i];
  3290	
  3291			if (entry->mm == mm)
  3292				return entry;
  3293		}
  3294		return NULL;
  3295	}
  3296	
  3297	/* Removal from cache simply leaves an unused hole. */
  3298	static inline int rq_cid_cache_lookup_remove(struct rq *rq, struct mm_struct *mm)
  3299	{
  3300		struct rq_cid_entry *entry = rq_cid_cache_lookup(rq, mm);
  3301	
  3302		if (!entry)
  3303			return -1;
  3304		entry->mm = NULL;       /* Remove from cache */
  3305		return entry->mm_cid;
  3306	}
  3307	
  3308	static inline void rq_cid_cache_remove_mm_locked(struct rq *rq, struct mm_struct *mm, bool release_mm)
  3309	{
  3310		int cid;
  3311	
  3312		if (!mm)
  3313			return;
  3314		/*
  3315		 * Do not remove the cache entry for a runqueue that runs a task which
  3316		 * currently uses the target mm.
  3317		 */
> 3318		if (!release_mm && rq->curr->mm == mm)
  3319			return;
  3320		cid = rq_cid_cache_lookup_remove(rq, mm);
  3321		mm_cid_put(mm, cid);
  3322	}
  3323	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
