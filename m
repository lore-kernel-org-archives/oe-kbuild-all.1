Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47FDF364
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Oct 2023 02:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696300937; x=1727836937;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Rx2PKlX7ACEu2xwfkvmC8E/XlGbBe7/M5BOLK9eJCYw=;
  b=jSpdoB0MNJGi6nVxzf4Yu5ad3NDg6vF+OLDgKphvSwwcrl69mUzXYVC/
   TfCXWeU9djxqtX6hHUPmOYoXSUGqzKt6PJxjbL0Dsk85GpVLC0UP/URzq
   XLBTgSQw4reYVnaVCC0er80SiV4mO8ZaMTowX3A/Y3uQic6wl3D+Ym/1Q
   XV4mz4ffE1b/wljp1hbU7Y3SKsRQtiDQbagJWx3flzMJg0jwpxqAGikYT
   jtOphC8OJak+BaYuToEk0VbciCSm3IadZuq054q5HJnBq3BP5cg5qdnS7
   RC9Vb/zKYjhVRkvzii5ivBCvRp1vnidGG9f7QyqlzrP5ta/7u/SzJXlYT
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="363053537"
X-IronPort-AV: E=Sophos;i="6.03,194,1694761200"; 
   d="scan'208";a="363053537"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2023 19:42:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="754243444"
X-IronPort-AV: E=Sophos;i="6.03,194,1694761200"; 
   d="scan'208";a="754243444"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 02 Oct 2023 19:42:14 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qnVMR-0006gS-32;
	Tue, 03 Oct 2023 02:42:11 +0000
Date: Tue, 3 Oct 2023 10:41:27 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gourry.memverge@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v2 2/4] mm/mempolicy: Implement set_mempolicy2 and
Message-ID: <202310031019.osWNzNQD-lkp@intel.com>
References: <20231003002156.740595-3-gregory.price@memverge.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231003002156.740595-3-gregory.price@memverge.com>

Hi Gregory,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Gregory-Price/mm-mempolicy-refactor-do_set_mempolicy-for-code-re-use/20231003-082354
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20231003002156.740595-3-gregory.price%40memverge.com
patch subject: [RFC PATCH v2 2/4] mm/mempolicy: Implement set_mempolicy2 and
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20231003/202310031019.osWNzNQD-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231003/202310031019.osWNzNQD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310031019.osWNzNQD-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/loongarch/include/uapi/asm/unistd.h:5,
                    from arch/loongarch/include/asm/unistd.h:9,
                    from arch/loongarch/include/asm/seccomp.h:6,
                    from include/linux/seccomp.h:22,
                    from include/linux/sched.h:22,
                    from arch/loongarch/kernel/asm-offsets.c:8:
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
   In file included from arch/loongarch/include/uapi/asm/unistd.h:5,
                    from arch/loongarch/include/asm/unistd.h:9,
                    from include/uapi/linux/unistd.h:8,
                    from include/asm-generic/seccomp.h:11,
                    from arch/loongarch/include/asm/seccomp.h:8:
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
   In file included from arch/loongarch/include/uapi/asm/unistd.h:5,
                    from arch/loongarch/include/asm/unistd.h:9,
                    from arch/loongarch/include/asm/vdso/gettimeofday.h:12,
                    from include/vdso/datapage.h:137,
                    from arch/loongarch/include/asm/vdso.h:12,
                    from arch/loongarch/include/asm/elf.h:13,
                    from include/linux/elf.h:6,
                    from include/linux/module.h:19,
                    from include/linux/device/driver.h:21,
                    from include/linux/device.h:32,
                    from include/linux/blk_types.h:11,
                    from include/linux/writeback.h:13,
                    from include/linux/memcontrol.h:22,
                    from include/linux/swap.h:9,
                    from include/linux/suspend.h:5,
                    from arch/loongarch/kernel/asm-offsets.c:11:
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
   arch/loongarch/kernel/asm-offsets.c:17:6: warning: no previous prototype for 'output_ptreg_defines' [-Wmissing-prototypes]
      17 | void output_ptreg_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/asm-offsets.c:64:6: warning: no previous prototype for 'output_task_defines' [-Wmissing-prototypes]
      64 | void output_task_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/asm-offsets.c:79:6: warning: no previous prototype for 'output_thread_info_defines' [-Wmissing-prototypes]
      79 | void output_thread_info_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/asm-offsets.c:95:6: warning: no previous prototype for 'output_thread_defines' [-Wmissing-prototypes]
      95 | void output_thread_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/asm-offsets.c:131:6: warning: no previous prototype for 'output_thread_fpu_defines' [-Wmissing-prototypes]
     131 | void output_thread_fpu_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/asm-offsets.c:172:6: warning: no previous prototype for 'output_thread_lbt_defines' [-Wmissing-prototypes]
     172 | void output_thread_lbt_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/asm-offsets.c:182:6: warning: no previous prototype for 'output_mm_defines' [-Wmissing-prototypes]
     182 | void output_mm_defines(void)
         |      ^~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/asm-offsets.c:214:6: warning: no previous prototype for 'output_sc_defines' [-Wmissing-prototypes]
     214 | void output_sc_defines(void)
         |      ^~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/asm-offsets.c:222:6: warning: no previous prototype for 'output_signal_defines' [-Wmissing-prototypes]
     222 | void output_signal_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/asm-offsets.c:260:6: warning: no previous prototype for 'output_smpboot_defines' [-Wmissing-prototypes]
     260 | void output_smpboot_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/asm-offsets.c:270:6: warning: no previous prototype for 'output_pbe_defines' [-Wmissing-prototypes]
     270 | void output_pbe_defines(void)
         |      ^~~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/asm-offsets.c:282:6: warning: no previous prototype for 'output_fgraph_ret_regs_defines' [-Wmissing-prototypes]
     282 | void output_fgraph_ret_regs_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from arch/loongarch/include/uapi/asm/unistd.h:5,
                    from arch/loongarch/include/asm/unistd.h:9,
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
   In file included from arch/loongarch/include/uapi/asm/unistd.h:5,
                    from arch/loongarch/include/asm/unistd.h:9,
                    from arch/loongarch/include/asm/seccomp.h:6,
                    from include/linux/seccomp.h:22,
                    from include/linux/sched.h:22,
                    from include/linux/mm.h:28,
                    from arch/loongarch/include/asm/vdso.h:10,
                    from arch/loongarch/vdso/vgetcpu.c:6:
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
   In file included from arch/loongarch/include/uapi/asm/unistd.h:5,
                    from arch/loongarch/include/asm/unistd.h:9,
                    from include/uapi/linux/unistd.h:8,
                    from include/asm-generic/seccomp.h:11,
                    from arch/loongarch/include/asm/seccomp.h:8:
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
   In file included from arch/loongarch/include/uapi/asm/unistd.h:5,
                    from arch/loongarch/include/asm/unistd.h:9,
                    from arch/loongarch/include/asm/vdso/gettimeofday.h:12,
                    from include/vdso/datapage.h:137,
                    from arch/loongarch/include/asm/vdso.h:12:
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
   In file included from arch/loongarch/include/uapi/asm/unistd.h:5,
                    from arch/loongarch/vdso/sigreturn.S:11:
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
   In file included from arch/loongarch/include/uapi/asm/unistd.h:5,
                    from arch/loongarch/include/asm/unistd.h:9,
                    from arch/loongarch/include/asm/seccomp.h:6,
                    from include/linux/seccomp.h:22,
                    from include/linux/sched.h:22,
                    from include/linux/sched/mm.h:7,
                    from include/linux/xarray.h:19,
                    from include/linux/list_lru.h:14,
                    from include/linux/fs.h:13,
                    from include/linux/dax.h:5,
                    from mm/filemap.c:15:
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
   In file included from arch/loongarch/include/uapi/asm/unistd.h:5,
                    from arch/loongarch/include/asm/unistd.h:9,
                    from include/uapi/linux/unistd.h:8,
                    from include/asm-generic/seccomp.h:11,
                    from arch/loongarch/include/asm/seccomp.h:8:
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
   In file included from arch/loongarch/include/uapi/asm/unistd.h:5,
                    from arch/loongarch/include/asm/unistd.h:9,
                    from arch/loongarch/include/asm/vdso/gettimeofday.h:12,
                    from include/vdso/datapage.h:137,
                    from arch/loongarch/include/asm/vdso.h:12,
                    from arch/loongarch/include/asm/elf.h:13,
                    from include/linux/elf.h:6,
                    from include/linux/module.h:19,
                    from include/linux/device/driver.h:21,
                    from include/linux/device.h:32,
                    from include/linux/blk_types.h:11,
                    from include/linux/writeback.h:13,
                    from include/linux/memcontrol.h:22,
                    from include/linux/swap.h:9,
                    from mm/filemap.c:23:
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
   In file included from mm/filemap.c:50:
   mm/internal.h: In function 'shrinker_debugfs_name_alloc':
   mm/internal.h:1223:9: warning: function 'shrinker_debugfs_name_alloc' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
    1223 |         shrinker->name = kvasprintf_const(GFP_KERNEL, fmt, ap);
         |         ^~~~~~~~
--
   In file included from arch/loongarch/include/uapi/asm/unistd.h:5,
                    from arch/loongarch/include/asm/unistd.h:9,
                    from arch/loongarch/include/asm/seccomp.h:6,
                    from include/linux/seccomp.h:22,
                    from include/linux/sched.h:22,
                    from include/linux/sched/mm.h:7,
                    from include/linux/xarray.h:19,
                    from include/linux/list_lru.h:14,
                    from include/linux/fs.h:13,
                    from mm/fadvise.c:13:
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
   In file included from arch/loongarch/include/uapi/asm/unistd.h:5,
                    from arch/loongarch/include/asm/unistd.h:9,
                    from include/uapi/linux/unistd.h:8,
                    from include/asm-generic/seccomp.h:11,
                    from arch/loongarch/include/asm/seccomp.h:8:
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
   In file included from arch/loongarch/include/uapi/asm/unistd.h:5,
                    from arch/loongarch/include/asm/unistd.h:9,
                    from arch/loongarch/include/asm/vdso/gettimeofday.h:12,
                    from include/vdso/datapage.h:137,
                    from arch/loongarch/include/asm/vdso.h:12,
                    from arch/loongarch/include/asm/elf.h:13,
                    from include/linux/elf.h:6,
                    from include/linux/module.h:19,
                    from include/linux/device/driver.h:21,
                    from include/linux/device.h:32,
                    from include/linux/backing-dev.h:15,
                    from mm/fadvise.c:16:
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
   In file included from mm/fadvise.c:19:
   include/linux/syscalls.h:816:43: warning: 'struct mempolicy_args' declared inside parameter list will not be visible outside of this definition or declaration
     816 | asmlinkage long sys_get_mempolicy2(struct mempolicy_args __user *args,
         |                                           ^~~~~~~~~~~~~~
   include/linux/syscalls.h:818:43: warning: 'struct mempolicy_args' declared inside parameter list will not be visible outside of this definition or declaration
     818 | asmlinkage long sys_set_mempolicy2(struct mempolicy_args __user *args,
         |                                           ^~~~~~~~~~~~~~
   In file included from arch/loongarch/include/uapi/asm/unistd.h:5,
                    from arch/loongarch/include/asm/unistd.h:9,
                    from mm/fadvise.c:22:
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
   In file included from mm/fadvise.c:24:
   mm/internal.h: In function 'shrinker_debugfs_name_alloc':
   mm/internal.h:1223:9: warning: function 'shrinker_debugfs_name_alloc' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
    1223 |         shrinker->name = kvasprintf_const(GFP_KERNEL, fmt, ap);
         |         ^~~~~~~~
..


vim +/__NR_set_mempolicy +828 include/uapi/asm-generic/unistd.h

   825	
   826	/* CONFIG_MMU only */
   827	#ifndef __ARCH_NOMMU
 > 828	#define __NR_set_mempolicy 454
   829	__SYSCALL(__NR_set_mempolicy2, sys_set_mempolicy2)
   830	#define __NR_set_mempolicy 455
   831	__SYSCALL(__NR_get_mempolicy2, sys_get_mempolicy2)
   832	#endif
   833	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
