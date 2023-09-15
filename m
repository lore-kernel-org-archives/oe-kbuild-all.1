Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14F7E2563
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 Sep 2023 04:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694751792; x=1726287792;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=P4SVk3DVmI6wcjP0ry4+pK3FoQaAXgMuAbKWxxoDfIE=;
  b=Hu1yzUH7aEy47zcDYm7d9rV0mZWt9FTcawHzVFIvJTJjbPowK18cNdtj
   tlqyrHy5mF8ml8LdFrewNSeAG7s48gQGhGkPAmzVGlXlm7h1BnxvLHXpS
   Uv17W6sfQ/FtOgRmMoE42pnaWXzwck/fMAteCTHrnAGAwUg0p0W7iIOSN
   X9TThj6785ZoFxcJRNErPdR30qgcxTLhZhfgDKjx8R3ayyIguVQxEL5oS
   pKihBx430yVt8l5X6Zk595EG+HslMNmgiJMx0BDWeetJPgWYxJrUs3nT0
   xCzaosr0CtwGoWyiEyJLSPbKUJS+tBZ7hfvyMR+v73fD/UFQlt9sQR1AW
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="358562437"
X-IronPort-AV: E=Sophos;i="6.02,148,1688454000"; 
   d="scan'208";a="358562437"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2023 21:23:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="888072770"
X-IronPort-AV: E=Sophos;i="6.02,148,1688454000"; 
   d="scan'208";a="888072770"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 14 Sep 2023 21:22:35 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qh0M5-0002QT-0e;
	Fri, 15 Sep 2023 04:22:59 +0000
Date: Fri, 15 Sep 2023 12:21:40 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gourry.memverge@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 2/3] mm/mempolicy: Implement set_mempolicy2 and
 get_mempolicy2 syscalls
Message-ID: <202309151235.LSaxc6ck-lkp@intel.com>
References: <20230914235457.482710-3-gregory.price@memverge.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230914235457.482710-3-gregory.price@memverge.com>

Hi Gregory,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Gregory-Price/mm-mempolicy-refactor-do_set_mempolicy-for-code-re-use/20230915-075649
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20230914235457.482710-3-gregory.price%40memverge.com
patch subject: [RFC PATCH 2/3] mm/mempolicy: Implement set_mempolicy2 and get_mempolicy2 syscalls
config: riscv-allnoconfig (https://download.01.org/0day-ci/archive/20230915/202309151235.LSaxc6ck-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230915/202309151235.LSaxc6ck-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309151235.LSaxc6ck-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from arch/riscv/include/uapi/asm/unistd.h:26,
                    from arch/riscv/include/asm/unistd.h:24,
                    from include/uapi/linux/unistd.h:8,
                    from include/linux/compat.h:20,
                    from arch/riscv/include/asm/elf.h:12,
                    from include/linux/elf.h:6,
                    from include/linux/module.h:19,
                    from include/linux/device/driver.h:21,
                    from include/linux/device.h:32,
                    from include/linux/blk_types.h:11,
                    from include/linux/writeback.h:13,
                    from include/linux/memcontrol.h:22,
                    from include/linux/swap.h:9,
                    from include/linux/suspend.h:5,
                    from arch/riscv/kernel/asm-offsets.c:12:
>> include/uapi/asm-generic/unistd.h:828: warning: "__NR_set_mempolicy" redefined
     828 | #define __NR_set_mempolicy 454
         | 
   include/uapi/asm-generic/unistd.h:603: note: this is the location of the previous definition
     603 | #define __NR_set_mempolicy 237
         | 
   include/uapi/asm-generic/unistd.h:830: warning: "__NR_set_mempolicy" redefined
     830 | #define __NR_set_mempolicy 455
         | 
   include/uapi/asm-generic/unistd.h:828: note: this is the location of the previous definition
     828 | #define __NR_set_mempolicy 454
         | 
--
   In file included from arch/riscv/include/uapi/asm/unistd.h:26,
                    from arch/riscv/include/asm/unistd.h:24,
                    from <stdin>:2:
>> include/uapi/asm-generic/unistd.h:828: warning: "__NR_set_mempolicy" redefined
     828 | #define __NR_set_mempolicy 454
         | 
   include/uapi/asm-generic/unistd.h:603: note: this is the location of the previous definition
     603 | #define __NR_set_mempolicy 237
         | 
   include/uapi/asm-generic/unistd.h:830: warning: "__NR_set_mempolicy" redefined
     830 | #define __NR_set_mempolicy 455
         | 
   include/uapi/asm-generic/unistd.h:828: note: this is the location of the previous definition
     828 | #define __NR_set_mempolicy 454
         | 
   <stdin>:1573:2: warning: #warning syscall set_mempolicy2 not implemented [-Wcpp]
   <stdin>:1576:2: warning: #warning syscall get_mempolicy2 not implemented [-Wcpp]
--
   In file included from arch/riscv/include/uapi/asm/unistd.h:26,
                    from arch/riscv/include/asm/unistd.h:24,
                    from include/uapi/linux/unistd.h:8,
                    from include/linux/compat.h:20,
                    from arch/riscv/include/asm/elf.h:12,
                    from include/linux/elf.h:6,
                    from include/linux/module.h:19,
                    from include/linux/device/driver.h:21,
                    from include/linux/device.h:32,
                    from include/linux/node.h:18,
                    from include/linux/cpu.h:17,
                    from arch/riscv/kernel/process.c:10:
>> include/uapi/asm-generic/unistd.h:828: warning: "__NR_set_mempolicy" redefined
     828 | #define __NR_set_mempolicy 454
         | 
   include/uapi/asm-generic/unistd.h:603: note: this is the location of the previous definition
     603 | #define __NR_set_mempolicy 237
         | 
   include/uapi/asm-generic/unistd.h:830: warning: "__NR_set_mempolicy" redefined
     830 | #define __NR_set_mempolicy 455
         | 
   include/uapi/asm-generic/unistd.h:828: note: this is the location of the previous definition
     828 | #define __NR_set_mempolicy 454
         | 
   In file included from arch/riscv/include/uapi/asm/unistd.h:26,
                    from arch/riscv/include/asm/unistd.h:24,
                    from arch/riscv/kernel/process.c:19:
   include/uapi/asm-generic/unistd.h:603: warning: "__NR_set_mempolicy" redefined
     603 | #define __NR_set_mempolicy 237
         | 
   include/uapi/asm-generic/unistd.h:830: note: this is the location of the previous definition
     830 | #define __NR_set_mempolicy 455
         | 
>> include/uapi/asm-generic/unistd.h:828: warning: "__NR_set_mempolicy" redefined
     828 | #define __NR_set_mempolicy 454
         | 
   include/uapi/asm-generic/unistd.h:603: note: this is the location of the previous definition
     603 | #define __NR_set_mempolicy 237
         | 
   include/uapi/asm-generic/unistd.h:830: warning: "__NR_set_mempolicy" redefined
     830 | #define __NR_set_mempolicy 455
         | 
   include/uapi/asm-generic/unistd.h:828: note: this is the location of the previous definition
     828 | #define __NR_set_mempolicy 454
         | 
--
   In file included from arch/riscv/include/uapi/asm/unistd.h:26,
                    from arch/riscv/include/asm/unistd.h:24,
                    from include/uapi/linux/unistd.h:8,
                    from include/linux/syscalls.h:86,
                    from arch/riscv/kernel/syscall_table.c:8:
>> include/uapi/asm-generic/unistd.h:828: warning: "__NR_set_mempolicy" redefined
     828 | #define __NR_set_mempolicy 454
         | 
   include/uapi/asm-generic/unistd.h:603: note: this is the location of the previous definition
     603 | #define __NR_set_mempolicy 237
         | 
   include/uapi/asm-generic/unistd.h:830: warning: "__NR_set_mempolicy" redefined
     830 | #define __NR_set_mempolicy 455
         | 
   include/uapi/asm-generic/unistd.h:828: note: this is the location of the previous definition
     828 | #define __NR_set_mempolicy 454
         | 
   In file included from arch/riscv/include/uapi/asm/unistd.h:26,
                    from arch/riscv/include/asm/unistd.h:24,
                    from arch/riscv/kernel/syscall_table.c:14:
   include/uapi/asm-generic/unistd.h:603: warning: "__NR_set_mempolicy" redefined
     603 | #define __NR_set_mempolicy 237
         | 
   include/uapi/asm-generic/unistd.h:830: note: this is the location of the previous definition
     830 | #define __NR_set_mempolicy 455
         | 
>> include/uapi/asm-generic/unistd.h:828: warning: "__NR_set_mempolicy" redefined
     828 | #define __NR_set_mempolicy 454
         | 
   include/uapi/asm-generic/unistd.h:603: note: this is the location of the previous definition
     603 | #define __NR_set_mempolicy 237
         | 
   include/uapi/asm-generic/unistd.h:830: warning: "__NR_set_mempolicy" redefined
     830 | #define __NR_set_mempolicy 455
         | 
   include/uapi/asm-generic/unistd.h:828: note: this is the location of the previous definition
     828 | #define __NR_set_mempolicy 454
         | 
   In file included from arch/riscv/include/uapi/asm/unistd.h:26,
                    from arch/riscv/include/asm/unistd.h:24,
                    from arch/riscv/kernel/syscall_table.c:21:
   include/uapi/asm-generic/unistd.h:603: warning: "__NR_set_mempolicy" redefined
     603 | #define __NR_set_mempolicy 237
         | 
   include/uapi/asm-generic/unistd.h:830: note: this is the location of the previous definition
     830 | #define __NR_set_mempolicy 455
         | 
>> include/uapi/asm-generic/unistd.h:828: warning: "__NR_set_mempolicy" redefined
     828 | #define __NR_set_mempolicy 454
         | 
   include/uapi/asm-generic/unistd.h:603: note: this is the location of the previous definition
     603 | #define __NR_set_mempolicy 237
         | 
>> include/uapi/asm-generic/unistd.h:829:11: error: '__NR_set_mempolicy2' undeclared here (not in a function); did you mean '__riscv_sys_get_mempolicy2'?
     829 | __SYSCALL(__NR_set_mempolicy2, sys_set_mempolicy2)
         |           ^~~~~~~~~~~~~~~~~~~
   arch/riscv/kernel/syscall_table.c:17:34: note: in definition of macro '__SYSCALL'
      17 | #define __SYSCALL(nr, call)     [nr] = __riscv_##call,
         |                                  ^~
>> include/uapi/asm-generic/unistd.h:829:11: error: array index in initializer not of integer type
     829 | __SYSCALL(__NR_set_mempolicy2, sys_set_mempolicy2)
         |           ^~~~~~~~~~~~~~~~~~~
   arch/riscv/kernel/syscall_table.c:17:34: note: in definition of macro '__SYSCALL'
      17 | #define __SYSCALL(nr, call)     [nr] = __riscv_##call,
         |                                  ^~
   include/uapi/asm-generic/unistd.h:829:11: note: (near initialization for 'sys_call_table')
     829 | __SYSCALL(__NR_set_mempolicy2, sys_set_mempolicy2)
         |           ^~~~~~~~~~~~~~~~~~~
   arch/riscv/kernel/syscall_table.c:17:34: note: in definition of macro '__SYSCALL'
      17 | #define __SYSCALL(nr, call)     [nr] = __riscv_##call,
         |                                  ^~
   include/uapi/asm-generic/unistd.h:830: warning: "__NR_set_mempolicy" redefined
     830 | #define __NR_set_mempolicy 455
         | 
   include/uapi/asm-generic/unistd.h:828: note: this is the location of the previous definition
     828 | #define __NR_set_mempolicy 454
         | 
>> include/uapi/asm-generic/unistd.h:831:11: error: '__NR_get_mempolicy2' undeclared here (not in a function); did you mean '__riscv_sys_get_mempolicy2'?
     831 | __SYSCALL(__NR_get_mempolicy2, sys_get_mempolicy2)
         |           ^~~~~~~~~~~~~~~~~~~
   arch/riscv/kernel/syscall_table.c:17:34: note: in definition of macro '__SYSCALL'
      17 | #define __SYSCALL(nr, call)     [nr] = __riscv_##call,
         |                                  ^~
   include/uapi/asm-generic/unistd.h:831:11: error: array index in initializer not of integer type
     831 | __SYSCALL(__NR_get_mempolicy2, sys_get_mempolicy2)
         |           ^~~~~~~~~~~~~~~~~~~
   arch/riscv/kernel/syscall_table.c:17:34: note: in definition of macro '__SYSCALL'
      17 | #define __SYSCALL(nr, call)     [nr] = __riscv_##call,
         |                                  ^~
   include/uapi/asm-generic/unistd.h:831:11: note: (near initialization for 'sys_call_table')
     831 | __SYSCALL(__NR_get_mempolicy2, sys_get_mempolicy2)
         |           ^~~~~~~~~~~~~~~~~~~
   arch/riscv/kernel/syscall_table.c:17:34: note: in definition of macro '__SYSCALL'
      17 | #define __SYSCALL(nr, call)     [nr] = __riscv_##call,
         |                                  ^~
--
   In file included from arch/riscv/include/uapi/asm/unistd.h:26,
                    from arch/riscv/include/asm/unistd.h:24,
                    from include/uapi/linux/unistd.h:8,
                    from include/linux/syscalls.h:86,
                    from arch/riscv/kernel/sys_riscv.c:8:
>> include/uapi/asm-generic/unistd.h:828: warning: "__NR_set_mempolicy" redefined
     828 | #define __NR_set_mempolicy 454
         | 
   include/uapi/asm-generic/unistd.h:603: note: this is the location of the previous definition
     603 | #define __NR_set_mempolicy 237
         | 
   include/uapi/asm-generic/unistd.h:830: warning: "__NR_set_mempolicy" redefined
     830 | #define __NR_set_mempolicy 455
         | 
   include/uapi/asm-generic/unistd.h:828: note: this is the location of the previous definition
     828 | #define __NR_set_mempolicy 454
         | 
   In file included from arch/riscv/include/uapi/asm/unistd.h:26,
                    from arch/riscv/include/asm/unistd.h:24,
                    from arch/riscv/kernel/sys_riscv.c:16:
   include/uapi/asm-generic/unistd.h:603: warning: "__NR_set_mempolicy" redefined
     603 | #define __NR_set_mempolicy 237
         | 
   include/uapi/asm-generic/unistd.h:830: note: this is the location of the previous definition
     830 | #define __NR_set_mempolicy 455
         | 
>> include/uapi/asm-generic/unistd.h:828: warning: "__NR_set_mempolicy" redefined
     828 | #define __NR_set_mempolicy 454
         | 
   include/uapi/asm-generic/unistd.h:603: note: this is the location of the previous definition
     603 | #define __NR_set_mempolicy 237
         | 
   include/uapi/asm-generic/unistd.h:830: warning: "__NR_set_mempolicy" redefined
     830 | #define __NR_set_mempolicy 455
         | 
   include/uapi/asm-generic/unistd.h:828: note: this is the location of the previous definition
     828 | #define __NR_set_mempolicy 454
         | 
   In file included from arch/riscv/include/uapi/asm/unistd.h:26,
                    from arch/riscv/include/asm/unistd.h:24,
                    from arch/riscv/include/asm/vdso/gettimeofday.h:8,
                    from include/vdso/datapage.h:137,
                    from arch/riscv/include/asm/vdso/vsyscall.h:8,
                    from include/vdso/vsyscall.h:7,
                    from arch/riscv/kernel/sys_riscv.c:18:
   include/uapi/asm-generic/unistd.h:603: warning: "__NR_set_mempolicy" redefined
     603 | #define __NR_set_mempolicy 237
         | 
   include/uapi/asm-generic/unistd.h:830: note: this is the location of the previous definition
     830 | #define __NR_set_mempolicy 455
         | 
>> include/uapi/asm-generic/unistd.h:828: warning: "__NR_set_mempolicy" redefined
     828 | #define __NR_set_mempolicy 454
         | 
   include/uapi/asm-generic/unistd.h:603: note: this is the location of the previous definition
     603 | #define __NR_set_mempolicy 237
         | 
   include/uapi/asm-generic/unistd.h:830: warning: "__NR_set_mempolicy" redefined
     830 | #define __NR_set_mempolicy 455
         | 
   include/uapi/asm-generic/unistd.h:828: note: this is the location of the previous definition
     828 | #define __NR_set_mempolicy 454
         | 
--
   In file included from arch/riscv/include/uapi/asm/unistd.h:26,
                    from arch/riscv/include/asm/unistd.h:24,
                    from include/uapi/linux/unistd.h:8,
                    from include/linux/compat.h:20,
                    from arch/riscv/include/asm/elf.h:12,
                    from include/linux/elf.h:6,
                    from include/linux/module.h:19,
                    from drivers/clk/clkdev.c:9:
>> include/uapi/asm-generic/unistd.h:828: warning: "__NR_set_mempolicy" redefined
     828 | #define __NR_set_mempolicy 454
         | 
   include/uapi/asm-generic/unistd.h:603: note: this is the location of the previous definition
     603 | #define __NR_set_mempolicy 237
         | 
   include/uapi/asm-generic/unistd.h:830: warning: "__NR_set_mempolicy" redefined
     830 | #define __NR_set_mempolicy 455
         | 
   include/uapi/asm-generic/unistd.h:828: note: this is the location of the previous definition
     828 | #define __NR_set_mempolicy 454
         | 
   drivers/clk/clkdev.c: In function 'vclkdev_alloc':
   drivers/clk/clkdev.c:173:17: warning: function 'vclkdev_alloc' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
     173 |                 vscnprintf(cla->dev_id, sizeof(cla->dev_id), dev_fmt, ap);
         |                 ^~~~~~~~~~
--
   In file included from arch/riscv/include/uapi/asm/unistd.h:26,
                    from arch/riscv/include/asm/unistd.h:24,
                    from include/uapi/linux/unistd.h:8,
                    from include/linux/compat.h:20,
                    from arch/riscv/include/asm/elf.h:12,
                    from include/linux/elf.h:6,
                    from include/linux/module.h:19,
                    from include/linux/device/driver.h:21,
                    from include/linux/device.h:32,
                    from include/linux/blk_types.h:11,
                    from include/linux/writeback.h:13,
                    from include/linux/memcontrol.h:22,
                    from include/linux/swap.h:9,
                    from include/linux/suspend.h:5,
                    from arch/riscv/kernel/asm-offsets.c:12:
>> include/uapi/asm-generic/unistd.h:828: warning: "__NR_set_mempolicy" redefined
     828 | #define __NR_set_mempolicy 454
         | 
   include/uapi/asm-generic/unistd.h:603: note: this is the location of the previous definition
     603 | #define __NR_set_mempolicy 237
         | 
   include/uapi/asm-generic/unistd.h:830: warning: "__NR_set_mempolicy" redefined
     830 | #define __NR_set_mempolicy 455
         | 
   include/uapi/asm-generic/unistd.h:828: note: this is the location of the previous definition
     828 | #define __NR_set_mempolicy 454
         | 
   In file included from arch/riscv/include/uapi/asm/unistd.h:26,
                    from arch/riscv/include/asm/unistd.h:24,
                    from <stdin>:2:
>> include/uapi/asm-generic/unistd.h:828: warning: "__NR_set_mempolicy" redefined
     828 | #define __NR_set_mempolicy 454
         | 
   include/uapi/asm-generic/unistd.h:603: note: this is the location of the previous definition
     603 | #define __NR_set_mempolicy 237
         | 
   include/uapi/asm-generic/unistd.h:830: warning: "__NR_set_mempolicy" redefined
     830 | #define __NR_set_mempolicy 455
         | 
   include/uapi/asm-generic/unistd.h:828: note: this is the location of the previous definition
     828 | #define __NR_set_mempolicy 454
         | 
   <stdin>:1573:2: warning: #warning syscall set_mempolicy2 not implemented [-Wcpp]
   <stdin>:1576:2: warning: #warning syscall get_mempolicy2 not implemented [-Wcpp]
   In file included from arch/riscv/include/uapi/asm/unistd.h:26,
                    from arch/riscv/include/asm/unistd.h:24,
                    from arch/riscv/kernel/vdso/rt_sigreturn.S:7:
>> include/uapi/asm-generic/unistd.h:828: warning: "__NR_set_mempolicy" redefined
     828 | #define __NR_set_mempolicy 454
         | 
   include/uapi/asm-generic/unistd.h:603: note: this is the location of the previous definition
     603 | #define __NR_set_mempolicy 237
         | 
   include/uapi/asm-generic/unistd.h:830: warning: "__NR_set_mempolicy" redefined
     830 | #define __NR_set_mempolicy 455
         | 
   include/uapi/asm-generic/unistd.h:828: note: this is the location of the previous definition
     828 | #define __NR_set_mempolicy 454
         | 
   In file included from arch/riscv/include/uapi/asm/unistd.h:26,
                    from arch/riscv/include/asm/unistd.h:24,
                    from arch/riscv/include/asm/vdso/gettimeofday.h:8,
                    from include/vdso/datapage.h:137,
                    from lib/vdso/gettimeofday.c:5,
                    from <command-line>:
>> include/uapi/asm-generic/unistd.h:828: warning: "__NR_set_mempolicy" redefined
     828 | #define __NR_set_mempolicy 454
         | 
   include/uapi/asm-generic/unistd.h:603: note: this is the location of the previous definition
     603 | #define __NR_set_mempolicy 237
         | 
   include/uapi/asm-generic/unistd.h:830: warning: "__NR_set_mempolicy" redefined
     830 | #define __NR_set_mempolicy 455
         | 
   include/uapi/asm-generic/unistd.h:828: note: this is the location of the previous definition
     828 | #define __NR_set_mempolicy 454
         | 
   In file included from arch/riscv/include/uapi/asm/unistd.h:26,
                    from arch/riscv/include/asm/unistd.h:24,
                    from arch/riscv/kernel/vdso/getcpu.S:7:
>> include/uapi/asm-generic/unistd.h:828: warning: "__NR_set_mempolicy" redefined
     828 | #define __NR_set_mempolicy 454
         | 
   include/uapi/asm-generic/unistd.h:603: note: this is the location of the previous definition
     603 | #define __NR_set_mempolicy 237
         | 
   include/uapi/asm-generic/unistd.h:830: warning: "__NR_set_mempolicy" redefined
     830 | #define __NR_set_mempolicy 455
         | 
   include/uapi/asm-generic/unistd.h:828: note: this is the location of the previous definition
     828 | #define __NR_set_mempolicy 454
         | 
   In file included from arch/riscv/include/uapi/asm/unistd.h:26,
                    from arch/riscv/include/asm/unistd.h:24,
                    from arch/riscv/kernel/vdso/flush_icache.S:7:
>> include/uapi/asm-generic/unistd.h:828: warning: "__NR_set_mempolicy" redefined
     828 | #define __NR_set_mempolicy 454
         | 
   include/uapi/asm-generic/unistd.h:603: note: this is the location of the previous definition
     603 | #define __NR_set_mempolicy 237
         | 
   include/uapi/asm-generic/unistd.h:830: warning: "__NR_set_mempolicy" redefined
     830 | #define __NR_set_mempolicy 455
         | 
   include/uapi/asm-generic/unistd.h:828: note: this is the location of the previous definition
     828 | #define __NR_set_mempolicy 454
         | 
   In file included from arch/riscv/include/uapi/asm/unistd.h:26,
                    from arch/riscv/include/asm/unistd.h:24,
                    from arch/riscv/include/asm/vdso/gettimeofday.h:8,
                    from include/vdso/datapage.h:137,
                    from arch/riscv/kernel/vdso/hwprobe.c:7:
>> include/uapi/asm-generic/unistd.h:828: warning: "__NR_set_mempolicy" redefined
     828 | #define __NR_set_mempolicy 454
         | 
   include/uapi/asm-generic/unistd.h:603: note: this is the location of the previous definition
     603 | #define __NR_set_mempolicy 237
         | 
   include/uapi/asm-generic/unistd.h:830: warning: "__NR_set_mempolicy" redefined
     830 | #define __NR_set_mempolicy 455
         | 
   include/uapi/asm-generic/unistd.h:828: note: this is the location of the previous definition
     828 | #define __NR_set_mempolicy 454
         | 
   In file included from arch/riscv/include/uapi/asm/unistd.h:26,
                    from arch/riscv/include/asm/unistd.h:24,
                    from arch/riscv/kernel/vdso/sys_hwprobe.S:5:
>> include/uapi/asm-generic/unistd.h:828: warning: "__NR_set_mempolicy" redefined
     828 | #define __NR_set_mempolicy 454
         | 
   include/uapi/asm-generic/unistd.h:603: note: this is the location of the previous definition
     603 | #define __NR_set_mempolicy 237
         | 
   include/uapi/asm-generic/unistd.h:830: warning: "__NR_set_mempolicy" redefined
     830 | #define __NR_set_mempolicy 455
         | 
   include/uapi/asm-generic/unistd.h:828: note: this is the location of the previous definition
     828 | #define __NR_set_mempolicy 454
         | 


vim +829 include/uapi/asm-generic/unistd.h

   825	
   826	/* CONFIG_MMU only */
   827	#ifndef __ARCH_NOMMU
 > 828	#define __NR_set_mempolicy 454
 > 829	__SYSCALL(__NR_set_mempolicy2, sys_set_mempolicy2)
   830	#define __NR_set_mempolicy 455
 > 831	__SYSCALL(__NR_get_mempolicy2, sys_get_mempolicy2)
   832	#endif
   833	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
