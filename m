Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1C9E495D7
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Nov 2023 14:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TnNHH4Xs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701353707; x=1732889707;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3M69+PV2jP46rJp2Fj4poL9L83eFnrFqZEbm5yY8uTA=;
  b=TnNHH4XsO5vKm4q51YYW2DWwR3q0bkya43nsbmU+eE8vsSS3RhoY53Uo
   FLo4Gmde/Q7Ag/E3bnRXQSJ/B/4x5QXTOWifHpIFnpi9xPisaloMG5TgR
   DtbivP15O9XUM/Y7YwpohLyhn+YxIvQp22+ZH/74szi/TMWwBwzHKwZKs
   wpY1XE1hiFh/g9Oh5al8Uk06LRcgQjGjXDAMdj/DmJKx+uU0MwmYf8eiA
   NsU9HvuK5wpYItpZI2d/79n8Jof5GzjONNPZlOjlsY/8auLiMdnKxOHkh
   eOCRz3mqNI9U9qkhFCryjz4om1TiJx9k3mTW/KDYrdkcLTScE0johiOiP
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="208249"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="208249"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2023 06:15:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="803708140"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="803708140"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 30 Nov 2023 06:14:58 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r8hoe-00026I-25;
	Thu, 30 Nov 2023 14:14:56 +0000
Date: Thu, 30 Nov 2023 22:14:04 +0800
From: kernel test robot <lkp@intel.com>
To: Uros Bizjak <ubizjak@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	x86@kernel.org, Ingo Molnar <mingo@kernel.org>,
	Nadav Amit <namit@vmware.com>
Subject: [tip:x86/percpu 21/22] arch/x86/include/asm/current.h:46:24: sparse:
 sparse: dereference of noderef expression
Message-ID: <202311302257.tSFtZnly-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/percpu
head:   0548eb067ed664b93043e033295ca71e3e706245
commit: ed2f752e0e0a21d941ca0ee539ef3d4cd576bc5e [21/22] x86/percpu: Introduce const-qualified const_pcpu_hot to micro-optimize code generation
config: i386-randconfig-062-20231025 (https://download.01.org/0day-ci/archive/20231130/202311302257.tSFtZnly-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231130/202311302257.tSFtZnly-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311302257.tSFtZnly-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/x86/kernel/fpu/init.c: note: in included file (through arch/x86/include/asm/preempt.h, include/linux/preempt.h, include/linux/bottom_half.h, ...):
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
--
   arch/x86/kernel/fpu/regset.c: note: in included file (through include/linux/sched.h, include/linux/sched/task_stack.h):
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
--
   arch/x86/kernel/fpu/signal.c: note: in included file (through arch/x86/include/asm/nospec-branch.h, arch/x86/include/asm/paravirt_types.h, arch/x86/include/asm/ptrace.h, ...):
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
--
   arch/x86/kernel/fpu/core.c: note: in included file (through arch/x86/include/asm/preempt.h, include/linux/preempt.h, include/linux/bottom_half.h, ...):
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
   arch/x86/kernel/fpu/core.c:547:39: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   arch/x86/kernel/fpu/core.c:547:39: sparse:     expected struct spinlock [usertype] *lock
   arch/x86/kernel/fpu/core.c:547:39: sparse:     got struct spinlock [noderef] __rcu *
   arch/x86/kernel/fpu/core.c:551:41: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   arch/x86/kernel/fpu/core.c:551:41: sparse:     expected struct spinlock [usertype] *lock
   arch/x86/kernel/fpu/core.c:551:41: sparse:     got struct spinlock [noderef] __rcu *
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
--
   arch/x86/kernel/fpu/xstate.c: note: in included file (through arch/x86/include/asm/nospec-branch.h, arch/x86/include/asm/paravirt_types.h, arch/x86/include/asm/ptrace.h, ...):
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
   arch/x86/kernel/fpu/xstate.c: note: in included file (through arch/x86/include/asm/fpu/regset.h):
   include/linux/regset.h:28:28: sparse: sparse: self-comparison always evaluates to false
   arch/x86/kernel/fpu/xstate.c: note: in included file (through arch/x86/include/asm/nospec-branch.h, arch/x86/include/asm/paravirt_types.h, arch/x86/include/asm/ptrace.h, ...):
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression

vim +46 arch/x86/include/asm/current.h

    38	
    39	/* const-qualified alias to pcpu_hot, aliased by linker. */
    40	DECLARE_PER_CPU_ALIGNED(const struct pcpu_hot __percpu_seg_override,
    41				const_pcpu_hot);
    42	
    43	static __always_inline struct task_struct *get_current(void)
    44	{
    45		if (IS_ENABLED(CONFIG_USE_X86_SEG_SUPPORT))
  > 46			return const_pcpu_hot.current_task;
    47	
    48		return this_cpu_read_stable(pcpu_hot.current_task);
    49	}
    50	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
