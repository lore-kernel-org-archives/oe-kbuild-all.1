Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D96E161
	for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Jul 2023 01:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689469511; x=1721005511;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6r5X+SeLW4JZUIWMCqg3WxdgjdTf12n7ObsJPbmyVco=;
  b=InZ+ndaWFrOSUN13xatasMYNHCpzovClKdxh64LAX9RwajhymUQJuFw7
   fAtbreeTjILS/Co9t6GI8lvmJExLQQmKJtBxB0wuRBaq2QXnaMQwx39E9
   aRfqjTiN6xJ3biGgSW7T1ivEY2v37+0QB6Rldyll2s7lEpOD+S/lNDspM
   wfFiZw8lmPuRmQUFAbZ3tnq/afck00CQkcYhH8Zl1zE6DMZCO9k8ktfig
   FvHzt27mwlfXjRf5Y13125ro6O4ftW9GqiO9wnjCA5byJ+RBxCg39OzjM
   xhGrt6Zv0Z4qYWkKvuZNOHrwGbo7YwijVE7bGeU88H+LQDjR2JAUcVU98
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10772"; a="368361160"
X-IronPort-AV: E=Sophos;i="6.01,209,1684825200"; 
   d="scan'208";a="368361160"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2023 18:05:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10772"; a="716731828"
X-IronPort-AV: E=Sophos;i="6.01,209,1684825200"; 
   d="scan'208";a="716731828"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 15 Jul 2023 18:05:08 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qKqCC-0008RJ-0U;
	Sun, 16 Jul 2023 01:05:08 +0000
Date: Sun, 16 Jul 2023 09:04:21 +0800
From: kernel test robot <lkp@intel.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: [arm:ktext-current 1/19] arch/arm64/kernel/kaslr.c:32:13: sparse:
 sparse: incompatible types in comparison expression (different type sizes):
Message-ID: <202307160813.mD1EBY9I-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.armlinux.org.uk/~rmk/linux-arm.git ktext-current
head:   49e3458967802a6981190b5a1fa9fd66dbf58f8c
commit: 631e7c45f5d4cf043cd236a921c341e3dd9f1909 [1/19] arm64: place kernel in its own L0 page table entry
config: arm64-randconfig-r083-20230716 (https://download.01.org/0day-ci/archive/20230716/202307160813.mD1EBY9I-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230716/202307160813.mD1EBY9I-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307160813.mD1EBY9I-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/fork.c:310:38: sparse: sparse: incompatible types in comparison expression (different type sizes):
>> kernel/fork.c:310:38: sparse:    unsigned int *
>> kernel/fork.c:310:38: sparse:    unsigned long *
   kernel/fork.c:1241:19: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct [noderef] __rcu *owner @@     got struct task_struct *p @@
   kernel/fork.c:1241:19: sparse:     expected struct task_struct [noderef] __rcu *owner
   kernel/fork.c:1241:19: sparse:     got struct task_struct *p
   kernel/fork.c:1473:22: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct file *[assigned] old_exe_file @@     got struct file [noderef] __rcu *[assigned] __ret @@
   kernel/fork.c:1473:22: sparse:     expected struct file *[assigned] old_exe_file
   kernel/fork.c:1473:22: sparse:     got struct file [noderef] __rcu *[assigned] __ret
   kernel/fork.c:1807:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct refcount_struct [usertype] *r @@     got struct refcount_struct [noderef] __rcu * @@
   kernel/fork.c:1807:38: sparse:     expected struct refcount_struct [usertype] *r
   kernel/fork.c:1807:38: sparse:     got struct refcount_struct [noderef] __rcu *
   kernel/fork.c:1816:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:1816:31: sparse:     expected struct spinlock [usertype] *lock
   kernel/fork.c:1816:31: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:1817:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const * @@     got struct k_sigaction [noderef] __rcu * @@
   kernel/fork.c:1817:9: sparse:     expected void const *
   kernel/fork.c:1817:9: sparse:     got struct k_sigaction [noderef] __rcu *
   kernel/fork.c:1818:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:1818:33: sparse:     expected struct spinlock [usertype] *lock
   kernel/fork.c:1818:33: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:2320:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:2320:31: sparse:     expected struct spinlock [usertype] *lock
   kernel/fork.c:2320:31: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:2324:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:2324:33: sparse:     expected struct spinlock [usertype] *lock
   kernel/fork.c:2324:33: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:2640:32: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct [noderef] __rcu *real_parent @@     got struct task_struct * @@
   kernel/fork.c:2640:32: sparse:     expected struct task_struct [noderef] __rcu *real_parent
   kernel/fork.c:2640:32: sparse:     got struct task_struct *
   kernel/fork.c:2649:27: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:2649:27: sparse:     expected struct spinlock [usertype] *lock
   kernel/fork.c:2649:27: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:2698:54: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct list_head *head @@     got struct list_head [noderef] __rcu * @@
   kernel/fork.c:2698:54: sparse:     expected struct list_head *head
   kernel/fork.c:2698:54: sparse:     got struct list_head [noderef] __rcu *
   kernel/fork.c:2720:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:2720:29: sparse:     expected struct spinlock [usertype] *lock
   kernel/fork.c:2720:29: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:2742:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:2742:29: sparse:     expected struct spinlock [usertype] *lock
   kernel/fork.c:2742:29: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:2769:28: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sighand_struct *sighand @@     got struct sighand_struct [noderef] __rcu *sighand @@
   kernel/fork.c:2769:28: sparse:     expected struct sighand_struct *sighand
   kernel/fork.c:2769:28: sparse:     got struct sighand_struct [noderef] __rcu *sighand
   kernel/fork.c:2798:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:2798:31: sparse:     expected struct spinlock [usertype] *lock
   kernel/fork.c:2798:31: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:2800:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:2800:33: sparse:     expected struct spinlock [usertype] *lock
   kernel/fork.c:2800:33: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:3241:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *[assigned] parent @@     got struct task_struct [noderef] __rcu *real_parent @@
   kernel/fork.c:3241:24: sparse:     expected struct task_struct *[assigned] parent
   kernel/fork.c:3241:24: sparse:     got struct task_struct [noderef] __rcu *real_parent
   kernel/fork.c:3329:43: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct refcount_struct const [usertype] *r @@     got struct refcount_struct [noderef] __rcu * @@
   kernel/fork.c:3329:43: sparse:     expected struct refcount_struct const [usertype] *r
   kernel/fork.c:3329:43: sparse:     got struct refcount_struct [noderef] __rcu *
   kernel/fork.c:2370:22: sparse: sparse: dereference of noderef expression
   kernel/fork.c: note: in included file (through include/linux/ftrace.h, include/linux/kprobes.h, include/linux/kgdb.h, ...):
   include/linux/ptrace.h:210:45: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *new_parent @@     got struct task_struct [noderef] __rcu *parent @@
   include/linux/ptrace.h:210:45: sparse:     expected struct task_struct *new_parent
   include/linux/ptrace.h:210:45: sparse:     got struct task_struct [noderef] __rcu *parent
   include/linux/ptrace.h:210:62: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected struct cred const *ptracer_cred @@     got struct cred const [noderef] __rcu *ptracer_cred @@
   include/linux/ptrace.h:210:62: sparse:     expected struct cred const *ptracer_cred
   include/linux/ptrace.h:210:62: sparse:     got struct cred const [noderef] __rcu *ptracer_cred
   kernel/fork.c:2696:59: sparse: sparse: dereference of noderef expression
   kernel/fork.c:2697:59: sparse: sparse: dereference of noderef expression
   kernel/fork.c:1233:23: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/fork.c:1233:23: sparse:    struct task_struct [noderef] __rcu *
   kernel/fork.c:1233:23: sparse:    struct task_struct *
--
>> kernel/kcov.c:190:15: sparse: sparse: incompatible types in comparison expression (different type sizes):
>> kernel/kcov.c:190:15: sparse:    unsigned int *
>> kernel/kcov.c:190:15: sparse:    unsigned long *
>> kernel/kcov.c:190:15: sparse: sparse: cast from unknown type
--
>> arch/arm64/kernel/kaslr.c:32:13: sparse: sparse: incompatible types in comparison expression (different type sizes):
>> arch/arm64/kernel/kaslr.c:32:13: sparse:    unsigned int *
>> arch/arm64/kernel/kaslr.c:32:13: sparse:    unsigned long *
>> arch/arm64/kernel/kaslr.c:32:13: sparse: sparse: cast from unknown type

vim +32 arch/arm64/kernel/kaslr.c

f80fb3a3d50843 Ard Biesheuvel 2016-01-26  13  
c031a4213c11a5 Ard Biesheuvel 2016-01-29 @14  u16 __initdata memstart_offset_seed;
f80fb3a3d50843 Ard Biesheuvel 2016-01-26  15  
6e13b6b923b35a Mark Rutland   2023-05-30  16  bool __ro_after_init __kaslr_is_enabled = false;
fc5a89f75d2aad Ard Biesheuvel 2022-06-24  17  
6e13b6b923b35a Mark Rutland   2023-05-30  18  void __init kaslr_init(void)
6e13b6b923b35a Mark Rutland   2023-05-30  19  {
0ddc312b7c7304 Marc Zyngier   2023-06-09  20  	if (cpuid_feature_extract_unsigned_field(arm64_sw_feature_override.val &
0ddc312b7c7304 Marc Zyngier   2023-06-09  21  						 arm64_sw_feature_override.mask,
0ddc312b7c7304 Marc Zyngier   2023-06-09  22  						 ARM64_SW_FEATURE_OVERRIDE_NOKASLR)) {
fc5a89f75d2aad Ard Biesheuvel 2022-06-24  23  		pr_info("KASLR disabled on command line\n");
6e13b6b923b35a Mark Rutland   2023-05-30  24  		return;
fc5a89f75d2aad Ard Biesheuvel 2022-06-24  25  	}
fc5a89f75d2aad Ard Biesheuvel 2022-06-24  26  
f80fb3a3d50843 Ard Biesheuvel 2016-01-26  27  	/*
6e13b6b923b35a Mark Rutland   2023-05-30  28  	 * The KASLR offset modulo MIN_KIMG_ALIGN is taken from the physical
6e13b6b923b35a Mark Rutland   2023-05-30  29  	 * placement of the image rather than from the seed, so a displacement
6e13b6b923b35a Mark Rutland   2023-05-30  30  	 * of less than MIN_KIMG_ALIGN means that no seed was provided.
f80fb3a3d50843 Ard Biesheuvel 2016-01-26  31  	 */
6e13b6b923b35a Mark Rutland   2023-05-30 @32  	if (kaslr_offset() < MIN_KIMG_ALIGN) {

:::::: The code at line 32 was first introduced by commit
:::::: 6e13b6b923b35a965d128a40ef0c5d9dd101e603 arm64: kaslr: split kaslr/module initialization

:::::: TO: Mark Rutland <mark.rutland@arm.com>
:::::: CC: Catalin Marinas <catalin.marinas@arm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
