Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9A1233FF
	for <oe-kbuild-all@lists.linux.dev>; Sun, 19 Feb 2023 23:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676848552; x=1708384552;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/BtQxiV/F3qX0ikBKJujexRAWzdS2ywAORWvmI9DwQM=;
  b=cIzXHhmrABUayme41HqnApyQlmgpag592QzK/UkJYkwBTfJyAERWiJMT
   13YOHpI01HAOGvWe+mQr507QF2l4F4GQ/zKYzupzdOnPYa1V86WYsU72h
   XHEhcxUY3GkKLzw91z45xLEe4jo65H4QNzPc1vn+ILds9RGdS1AY/jynw
   M3NrKCEr89Iwz5IZ0CzFg9Hvq9yIOt8a37n3SQCH94mJTjDSIpdAPLZxy
   tPk402vUI9QX6FgRmFBIquF2mQHt2i48DrpqYAhlmnpUCzGBEhwpt1yvc
   7tPPi11rIfFGVknKsxrw+lr8ZyUNKMi+GPgWV13Vgizko5lGzcOEWNe7n
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10626"; a="316005510"
X-IronPort-AV: E=Sophos;i="5.97,311,1669104000"; 
   d="scan'208";a="316005510"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2023 15:15:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10626"; a="703531405"
X-IronPort-AV: E=Sophos;i="5.97,311,1669104000"; 
   d="scan'208";a="703531405"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 19 Feb 2023 15:15:50 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pTsuL-000DUP-1u;
	Sun, 19 Feb 2023 23:15:49 +0000
Date: Mon, 20 Feb 2023 07:15:45 +0800
From: kernel test robot <lkp@intel.com>
To: Luciano Coelho <luciano.coelho@intel.com>,
	Golan Ben Ami <golan.ben.ami@intel.com>,
	Michael Golant <michael.golant@intel.com>,
	Johannes Berg <johannes.berg@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: security/chromiumos/alt-syscall.c:333: undefined reference to
 `ksys_clock_adjtime'
Message-ID: <202302200737.JKECaRDr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Guenter,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/chromeos.git chromeos-5.10__release/core59-42
head:   e3fe4ac2447d89b8dca61663851e12d2f1247b56
commit: ba22664c32c4f332e28a0583221761f9e07eafb2 CHROMIUM: x86: Add alt-syscall support
date:   2 years, 2 months ago
config: x86_64-randconfig-a004-20230220 (https://download.01.org/0day-ci/archive/20230220/202302200737.JKECaRDr-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/chromeos.git/commit/?id=ba22664c32c4f332e28a0583221761f9e07eafb2
        git remote add iwlwifi-chromeos https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/chromeos.git
        git fetch --no-tags iwlwifi-chromeos chromeos-5.10__release/core59-42
        git checkout ba22664c32c4f332e28a0583221761f9e07eafb2
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302200737.JKECaRDr-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: warning: arch/x86/lib/retpoline.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: warning: arch/x86/lib/retpoline.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: warning: .tmp_vmlinux.kallsyms1 has a LOAD segment with RWX permissions
   ld: security/chromiumos/alt-syscall.o: in function `android_clock_adjtime':
>> security/chromiumos/alt-syscall.c:333: undefined reference to `ksys_clock_adjtime'
   ld: security/chromiumos/alt-syscall.o: in function `android_compat_clock_adjtime':
>> security/chromiumos/alt-syscall.c:391: undefined reference to `ksys_clock_adjtime32'


vim +333 security/chromiumos/alt-syscall.c

381b3c8dc00462 Guenter Roeck 2018-09-20  315  
381b3c8dc00462 Guenter Roeck 2018-09-20  316  static asmlinkage long android_clock_adjtime(struct pt_regs *regs)
381b3c8dc00462 Guenter Roeck 2018-09-20  317  {
381b3c8dc00462 Guenter Roeck 2018-09-20  318  	struct task_struct *task = current;
381b3c8dc00462 Guenter Roeck 2018-09-20  319  	struct __kernel_timex kbuf;
381b3c8dc00462 Guenter Roeck 2018-09-20  320  	unsigned long args[6];
381b3c8dc00462 Guenter Roeck 2018-09-20  321  	clockid_t which_clock;
381b3c8dc00462 Guenter Roeck 2018-09-20  322  	struct __kernel_timex __user *buf;
381b3c8dc00462 Guenter Roeck 2018-09-20  323  
381b3c8dc00462 Guenter Roeck 2018-09-20  324  	syscall_get_arguments(task, regs, args);
381b3c8dc00462 Guenter Roeck 2018-09-20  325  	which_clock = args[0];
381b3c8dc00462 Guenter Roeck 2018-09-20  326  	buf = (struct __kernel_timex __user *)args[1];
381b3c8dc00462 Guenter Roeck 2018-09-20  327  
381b3c8dc00462 Guenter Roeck 2018-09-20  328  	/* clock_adjtime() is allowed only for read. */
381b3c8dc00462 Guenter Roeck 2018-09-20  329  	if (copy_from_user(&kbuf, buf, sizeof(struct __kernel_timex)))
381b3c8dc00462 Guenter Roeck 2018-09-20  330  		return -EFAULT;
381b3c8dc00462 Guenter Roeck 2018-09-20  331  	if (kbuf.modes != 0)
381b3c8dc00462 Guenter Roeck 2018-09-20  332  		return -EPERM;
381b3c8dc00462 Guenter Roeck 2018-09-20 @333  	return ksys_clock_adjtime(which_clock, buf);
381b3c8dc00462 Guenter Roeck 2018-09-20  334  }
381b3c8dc00462 Guenter Roeck 2018-09-20  335  
381b3c8dc00462 Guenter Roeck 2018-09-20  336  static asmlinkage long android_getcpu(struct pt_regs *regs)
381b3c8dc00462 Guenter Roeck 2018-09-20  337  {
381b3c8dc00462 Guenter Roeck 2018-09-20  338  	struct task_struct *task = current;
381b3c8dc00462 Guenter Roeck 2018-09-20  339  	unsigned long args[6];
381b3c8dc00462 Guenter Roeck 2018-09-20  340  	unsigned __user *cpu;
381b3c8dc00462 Guenter Roeck 2018-09-20  341  	unsigned __user *node;
381b3c8dc00462 Guenter Roeck 2018-09-20  342  	struct getcpu_cache __user *tcache;
381b3c8dc00462 Guenter Roeck 2018-09-20  343  
381b3c8dc00462 Guenter Roeck 2018-09-20  344  	syscall_get_arguments(task, regs, args);
381b3c8dc00462 Guenter Roeck 2018-09-20  345  	cpu = (unsigned __user *)args[0];
381b3c8dc00462 Guenter Roeck 2018-09-20  346  	node = (unsigned __user *)args[1];
381b3c8dc00462 Guenter Roeck 2018-09-20  347  	tcache = (struct getcpu_cache __user *)args[2];
381b3c8dc00462 Guenter Roeck 2018-09-20  348  
381b3c8dc00462 Guenter Roeck 2018-09-20  349  	if (node || tcache)
381b3c8dc00462 Guenter Roeck 2018-09-20  350  		return -EPERM;
381b3c8dc00462 Guenter Roeck 2018-09-20  351  	return ksys_getcpu(cpu, node, tcache);
381b3c8dc00462 Guenter Roeck 2018-09-20  352  }
381b3c8dc00462 Guenter Roeck 2018-09-20  353  
381b3c8dc00462 Guenter Roeck 2018-09-20  354  #ifdef CONFIG_COMPAT
381b3c8dc00462 Guenter Roeck 2018-09-20  355  static asmlinkage long android_compat_adjtimex(struct pt_regs *regs)
381b3c8dc00462 Guenter Roeck 2018-09-20  356  {
381b3c8dc00462 Guenter Roeck 2018-09-20  357  	struct task_struct *task = current;
381b3c8dc00462 Guenter Roeck 2018-09-20  358  	struct old_timex32 kbuf;
381b3c8dc00462 Guenter Roeck 2018-09-20  359  	struct old_timex32 __user *buf;
381b3c8dc00462 Guenter Roeck 2018-09-20  360  	unsigned long args[6];
381b3c8dc00462 Guenter Roeck 2018-09-20  361  
381b3c8dc00462 Guenter Roeck 2018-09-20  362  	syscall_get_arguments(task, regs, args);
381b3c8dc00462 Guenter Roeck 2018-09-20  363  	buf = (struct old_timex32 __user *)args[0];
381b3c8dc00462 Guenter Roeck 2018-09-20  364  
381b3c8dc00462 Guenter Roeck 2018-09-20  365  	/* adjtimex() is allowed only for read. */
381b3c8dc00462 Guenter Roeck 2018-09-20  366  	if (copy_from_user(&kbuf, buf, sizeof(struct old_timex32)))
381b3c8dc00462 Guenter Roeck 2018-09-20  367  		return -EFAULT;
381b3c8dc00462 Guenter Roeck 2018-09-20  368  	if (kbuf.modes != 0)
381b3c8dc00462 Guenter Roeck 2018-09-20  369  		return -EPERM;
381b3c8dc00462 Guenter Roeck 2018-09-20  370  	return ksys_adjtimex_time32(buf);
381b3c8dc00462 Guenter Roeck 2018-09-20  371  }
381b3c8dc00462 Guenter Roeck 2018-09-20  372  
381b3c8dc00462 Guenter Roeck 2018-09-20  373  static asmlinkage long
381b3c8dc00462 Guenter Roeck 2018-09-20  374  android_compat_clock_adjtime(struct pt_regs *regs)
381b3c8dc00462 Guenter Roeck 2018-09-20  375  {
381b3c8dc00462 Guenter Roeck 2018-09-20  376  	struct task_struct *task = current;
381b3c8dc00462 Guenter Roeck 2018-09-20  377  	struct old_timex32 kbuf;
381b3c8dc00462 Guenter Roeck 2018-09-20  378  	unsigned long args[6];
381b3c8dc00462 Guenter Roeck 2018-09-20  379  	clockid_t which_clock;
381b3c8dc00462 Guenter Roeck 2018-09-20  380  	struct old_timex32 __user *buf;
381b3c8dc00462 Guenter Roeck 2018-09-20  381  
381b3c8dc00462 Guenter Roeck 2018-09-20  382  	syscall_get_arguments(task, regs, args);
381b3c8dc00462 Guenter Roeck 2018-09-20  383  	which_clock = args[0];
381b3c8dc00462 Guenter Roeck 2018-09-20  384  	buf = (struct old_timex32 __user *)args[1];
381b3c8dc00462 Guenter Roeck 2018-09-20  385  
381b3c8dc00462 Guenter Roeck 2018-09-20  386  	/* clock_adjtime() is allowed only for read. */
381b3c8dc00462 Guenter Roeck 2018-09-20  387  	if (copy_from_user(&kbuf, buf, sizeof(struct old_timex32)))
381b3c8dc00462 Guenter Roeck 2018-09-20  388  		return -EFAULT;
381b3c8dc00462 Guenter Roeck 2018-09-20  389  	if (kbuf.modes != 0)
381b3c8dc00462 Guenter Roeck 2018-09-20  390  		return -EPERM;
381b3c8dc00462 Guenter Roeck 2018-09-20 @391  	return ksys_clock_adjtime32(which_clock, buf);
381b3c8dc00462 Guenter Roeck 2018-09-20  392  }
381b3c8dc00462 Guenter Roeck 2018-09-20  393  #endif /* CONFIG_COMPAT */
381b3c8dc00462 Guenter Roeck 2018-09-20  394  

:::::: The code at line 333 was first introduced by commit
:::::: 381b3c8dc0046218c1524299ff29e8cf029fa7c2 CHROMIUM: create alt-syscall infrastructure

:::::: TO: Guenter Roeck <groeck@chromium.org>
:::::: CC: Guenter Roeck <groeck@chromium.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
