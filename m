Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA6A0C2C4
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Jul 2023 19:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688673465; x=1720209465;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QdtygBWtrCtUv2J0MqQO7LNkByI74jmgGGgxmneUOVE=;
  b=FgLSy9jOPBwiArJuX9pC5NrMF5MLMw2iMnT8J/iB+NVXgxJopyoF9Ip6
   q3Jk9H/OZ1ybGjpZ0YXwnbhSOHzWyEypZ6ADTLhPKet8jfDZfJlioY2ZW
   /ZYk35kul9Djt9ASwvL3AjfKgLi2hpuV8D/cxr4UnCsazcRNc15KoxBzK
   Z+ynD8m+7g7hUG4PpUKGzmSX7JcJbng5ZnN69uJhuLZOxSMtee9L5En0K
   +BFSw2yrsuaoy2NVYfbKLHA9DSATMTcrQqxu5rZj7gqven1jOgvqmWo7j
   56cPvsDKzxJr9fYVGCX5FY9fz9UGAa8ABvpyNxZ4w0jyWW77/MmY0QxJ5
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="429759147"
X-IronPort-AV: E=Sophos;i="6.01,185,1684825200"; 
   d="scan'208";a="429759147"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2023 12:57:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="1050221676"
X-IronPort-AV: E=Sophos;i="6.01,185,1684825200"; 
   d="scan'208";a="1050221676"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 06 Jul 2023 12:57:42 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qHV6j-0001Xu-2n;
	Thu, 06 Jul 2023 19:57:41 +0000
Date: Fri, 7 Jul 2023 03:57:03 +0800
From: kernel test robot <lkp@intel.com>
To: Eric DeVolder <eric.devolder@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master 12991/13166]
 arch/s390/kernel/machine_kexec.c:192:18: error: invalid use of undefined
 type 'struct kimage'
Message-ID: <202307070320.eW5rfZ7Y-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Eric,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   c36ac601a98fb148147640bae219108ee81566f8
commit: 2d4f027c7ebbede209555e9ef93d4273818cacc9 [12991/13166] s390/kexec: refactor for kernel/Kconfig.kexec
config: s390-allnoconfig (https://download.01.org/0day-ci/archive/20230707/202307070320.eW5rfZ7Y-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230707/202307070320.eW5rfZ7Y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307070320.eW5rfZ7Y-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> arch/s390/kernel/machine_kexec.c:120:37: warning: 'struct kimage' declared inside parameter list will not be visible outside of this definition or declaration
     120 | static bool kdump_csum_valid(struct kimage *image)
         |                                     ^~~~~~
   arch/s390/kernel/machine_kexec.c:188:34: warning: 'struct kimage' declared inside parameter list will not be visible outside of this definition or declaration
     188 | int machine_kexec_prepare(struct kimage *image)
         |                                  ^~~~~~
>> arch/s390/kernel/machine_kexec.c:188:5: warning: no previous prototype for 'machine_kexec_prepare' [-Wmissing-prototypes]
     188 | int machine_kexec_prepare(struct kimage *image)
         |     ^~~~~~~~~~~~~~~~~~~~~
   arch/s390/kernel/machine_kexec.c: In function 'machine_kexec_prepare':
>> arch/s390/kernel/machine_kexec.c:192:18: error: invalid use of undefined type 'struct kimage'
     192 |         if (image->type == KEXEC_TYPE_CRASH)
         |                  ^~
>> arch/s390/kernel/machine_kexec.c:192:28: error: 'KEXEC_TYPE_CRASH' undeclared (first use in this function); did you mean 'KEXEC_ON_CRASH'?
     192 |         if (image->type == KEXEC_TYPE_CRASH)
         |                            ^~~~~~~~~~~~~~~~
         |                            KEXEC_ON_CRASH
   arch/s390/kernel/machine_kexec.c:192:28: note: each undeclared identifier is reported only once for each function it appears in
   arch/s390/kernel/machine_kexec.c:196:18: error: invalid use of undefined type 'struct kimage'
     196 |         if (image->type != KEXEC_TYPE_DEFAULT)
         |                  ^~
>> arch/s390/kernel/machine_kexec.c:196:28: error: 'KEXEC_TYPE_DEFAULT' undeclared (first use in this function); did you mean 'KEXEC_ARCH_DEFAULT'?
     196 |         if (image->type != KEXEC_TYPE_DEFAULT)
         |                            ^~~~~~~~~~~~~~~~~~
         |                            KEXEC_ARCH_DEFAULT
   In file included from arch/s390/include/asm/thread_info.h:31,
                    from include/linux/thread_info.h:60,
                    from arch/s390/include/asm/preempt.h:6,
                    from include/linux/preempt.h:78,
                    from arch/s390/include/asm/percpu.h:5,
                    from include/linux/irqflags.h:17,
                    from include/linux/rcupdate.h:26,
                    from include/linux/rculist.h:11,
                    from include/linux/pid.h:5,
                    from include/linux/sched.h:14,
                    from include/linux/ratelimit.h:6,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from arch/s390/kernel/machine_kexec.c:9:
   arch/s390/kernel/machine_kexec.c:200:48: error: invalid use of undefined type 'struct kimage'
     200 |         reboot_code_buffer = page_to_virt(image->control_code_page);
         |                                                ^~
   arch/s390/include/asm/page.h:188:58: note: in definition of macro '__va'
     188 | #define __va(x)                 ((void *)(unsigned long)(x))
         |                                                          ^
   arch/s390/include/asm/page.h:196:38: note: in expansion of macro 'pfn_to_phys'
     196 | #define pfn_to_virt(pfn)        __va(pfn_to_phys(pfn))
         |                                      ^~~~~~~~~~~
   arch/s390/include/asm/page.h:201:33: note: in expansion of macro 'pfn_to_virt'
     201 | #define page_to_virt(page)      pfn_to_virt(page_to_pfn(page))
         |                                 ^~~~~~~~~~~
   include/asm-generic/memory_model.h:64:21: note: in expansion of macro '__page_to_pfn'
      64 | #define page_to_pfn __page_to_pfn
         |                     ^~~~~~~~~~~~~
   arch/s390/kernel/machine_kexec.c:200:30: note: in expansion of macro 'page_to_virt'
     200 |         reboot_code_buffer = page_to_virt(image->control_code_page);
         |                              ^~~~~~~~~~~~
   arch/s390/kernel/machine_kexec.c: At top level:
   arch/s390/kernel/machine_kexec.c:207:35: warning: 'struct kimage' declared inside parameter list will not be visible outside of this definition or declaration
     207 | void machine_kexec_cleanup(struct kimage *image)
         |                                   ^~~~~~
>> arch/s390/kernel/machine_kexec.c:207:6: warning: no previous prototype for 'machine_kexec_cleanup' [-Wmissing-prototypes]
     207 | void machine_kexec_cleanup(struct kimage *image)
         |      ^~~~~~~~~~~~~~~~~~~~~
   arch/s390/kernel/machine_kexec.c: In function '__do_machine_kexec':
   arch/s390/kernel/machine_kexec.c:243:40: error: invalid use of undefined type 'struct kimage'
     243 |         data_mover = page_to_phys(image->control_code_page);
         |                                        ^~
   arch/s390/include/asm/page.h:191:35: note: in definition of macro 'pfn_to_phys'
     191 | #define pfn_to_phys(pfn)        ((pfn) << PAGE_SHIFT)
         |                                   ^~~
   include/asm-generic/memory_model.h:64:21: note: in expansion of macro '__page_to_pfn'
      64 | #define page_to_pfn __page_to_pfn
         |                     ^~~~~~~~~~~~~
   arch/s390/kernel/machine_kexec.c:243:22: note: in expansion of macro 'page_to_phys'
     243 |         data_mover = page_to_phys(image->control_code_page);
         |                      ^~~~~~~~~~~~
   arch/s390/kernel/machine_kexec.c:244:36: error: invalid use of undefined type 'struct kimage'
     244 |         entry = virt_to_phys(&image->head);
         |                                    ^~
   In file included from arch/s390/kernel/machine_kexec.c:27:
   arch/s390/kernel/machine_kexec.c:252:40: error: invalid use of undefined type 'struct kimage'
     252 |                    unsigned long, image->start,
         |                                        ^~
   arch/s390/include/asm/stacktrace.h:101:32: note: in definition of macro 'CALL_LARGS_2'
     101 |         long arg2 = (long)(t2)(a2)
         |                                ^~
   arch/s390/include/asm/stacktrace.h:216:9: note: in expansion of macro 'CALL_LARGS_3'
     216 |         CALL_LARGS_##nr(__VA_ARGS__);                                   \
         |         ^~~~~~~~~~~
   arch/s390/kernel/machine_kexec.c:250:9: note: in expansion of macro 'call_nodat'
     250 |         call_nodat(3, void, (relocate_kernel_t)data_mover,
         |         ^~~~~~~~~~
   In file included from include/linux/irqflags.h:15:
   arch/s390/kernel/machine_kexec.c:252:40: error: invalid use of undefined type 'struct kimage'
     252 |                    unsigned long, image->start,
         |                                        ^~
   include/linux/typecheck.h:11:16: note: in definition of macro 'typecheck'
      11 |         typeof(x) __dummy2; \
         |                ^
   arch/s390/include/asm/stacktrace.h:136:9: note: in expansion of macro 'CALL_TYPECHECK_2'
     136 |         CALL_TYPECHECK_2(__VA_ARGS__);                                  \
         |         ^~~~~~~~~~~~~~~~
   arch/s390/include/asm/stacktrace.h:219:9: note: in expansion of macro 'CALL_TYPECHECK_3'
     219 |         CALL_TYPECHECK_##nr(__VA_ARGS__);                               \
         |         ^~~~~~~~~~~~~~~
   arch/s390/kernel/machine_kexec.c:250:9: note: in expansion of macro 'call_nodat'
     250 |         call_nodat(3, void, (relocate_kernel_t)data_mover,
         |         ^~~~~~~~~~
>> include/linux/typecheck.h:12:25: warning: comparison of distinct pointer types lacks a cast
      12 |         (void)(&__dummy == &__dummy2); \
         |                         ^~
   arch/s390/include/asm/stacktrace.h:134:9: note: in expansion of macro 'typecheck'
     134 |         typecheck(t, a)
         |         ^~~~~~~~~
   arch/s390/include/asm/stacktrace.h:136:9: note: in expansion of macro 'CALL_TYPECHECK_2'
     136 |         CALL_TYPECHECK_2(__VA_ARGS__);                                  \
         |         ^~~~~~~~~~~~~~~~
   arch/s390/include/asm/stacktrace.h:219:9: note: in expansion of macro 'CALL_TYPECHECK_3'
     219 |         CALL_TYPECHECK_##nr(__VA_ARGS__);                               \
         |         ^~~~~~~~~~~~~~~
   arch/s390/kernel/machine_kexec.c:250:9: note: in expansion of macro 'call_nodat'
     250 |         call_nodat(3, void, (relocate_kernel_t)data_mover,
         |         ^~~~~~~~~~
   arch/s390/kernel/machine_kexec.c: At top level:
   arch/s390/kernel/machine_kexec.c:278:27: warning: 'struct kimage' declared inside parameter list will not be visible outside of this definition or declaration
     278 | void machine_kexec(struct kimage *image)
         |                           ^~~~~~
>> arch/s390/kernel/machine_kexec.c:278:6: warning: no previous prototype for 'machine_kexec' [-Wmissing-prototypes]
     278 | void machine_kexec(struct kimage *image)
         |      ^~~~~~~~~~~~~
   arch/s390/kernel/machine_kexec.c: In function 'machine_kexec':
   arch/s390/kernel/machine_kexec.c:280:18: error: invalid use of undefined type 'struct kimage'
     280 |         if (image->type == KEXEC_TYPE_CRASH && !kdump_csum_valid(image))
         |                  ^~
   arch/s390/kernel/machine_kexec.c:280:28: error: 'KEXEC_TYPE_CRASH' undeclared (first use in this function); did you mean 'KEXEC_ON_CRASH'?
     280 |         if (image->type == KEXEC_TYPE_CRASH && !kdump_csum_valid(image))
         |                            ^~~~~~~~~~~~~~~~
         |                            KEXEC_ON_CRASH
>> arch/s390/kernel/machine_kexec.c:280:66: error: passing argument 1 of 'kdump_csum_valid' from incompatible pointer type [-Werror=incompatible-pointer-types]
     280 |         if (image->type == KEXEC_TYPE_CRASH && !kdump_csum_valid(image))
         |                                                                  ^~~~~
         |                                                                  |
         |                                                                  struct kimage *
   arch/s390/kernel/machine_kexec.c:120:45: note: expected 'struct kimage *' but argument is of type 'struct kimage *'
     120 | static bool kdump_csum_valid(struct kimage *image)
         |                              ~~~~~~~~~~~~~~~^~~~~
   cc1: some warnings being treated as errors


vim +192 arch/s390/kernel/machine_kexec.c

2980ba6ae8ca55 Heiko Carstens      2019-06-10  116  
60a0c68df2632f Michael Holzheu     2011-10-30  117  /*
60a0c68df2632f Michael Holzheu     2011-10-30  118   * Check if kdump checksums are valid: We call purgatory with parameter "0"
60a0c68df2632f Michael Holzheu     2011-10-30  119   */
7c3eaaa3917d8b Philipp Rudo        2017-10-17 @120  static bool kdump_csum_valid(struct kimage *image)
60a0c68df2632f Michael Holzheu     2011-10-30  121  {
60a0c68df2632f Michael Holzheu     2011-10-30  122  #ifdef CONFIG_CRASH_DUMP
2d1b21eceaf076 Alexander Gordeev   2023-04-03  123  	purgatory_t purgatory = (purgatory_t)image->start;
60a0c68df2632f Michael Holzheu     2011-10-30  124  	int rc;
60a0c68df2632f Michael Holzheu     2011-10-30  125  
2d1b21eceaf076 Alexander Gordeev   2023-04-03  126  	rc = call_nodat(1, int, purgatory, int, 0);
7c3eaaa3917d8b Philipp Rudo        2017-10-17  127  	return rc == 0;
60a0c68df2632f Michael Holzheu     2011-10-30  128  #else
7c3eaaa3917d8b Philipp Rudo        2017-10-17  129  	return false;
60a0c68df2632f Michael Holzheu     2011-10-30  130  #endif
60a0c68df2632f Michael Holzheu     2011-10-30  131  }
60a0c68df2632f Michael Holzheu     2011-10-30  132  
7a0058ec78602d Xunlei Pang         2016-05-23  133  #ifdef CONFIG_CRASH_DUMP
7a0058ec78602d Xunlei Pang         2016-05-23  134  
2d0af2247906cf Heiko Carstens      2016-05-31  135  void crash_free_reserved_phys_range(unsigned long begin, unsigned long end)
2d0af2247906cf Heiko Carstens      2016-05-31  136  {
2d0af2247906cf Heiko Carstens      2016-05-31  137  	unsigned long addr, size;
2d0af2247906cf Heiko Carstens      2016-05-31  138  
2d0af2247906cf Heiko Carstens      2016-05-31  139  	for (addr = begin; addr < end; addr += PAGE_SIZE)
2d0af2247906cf Heiko Carstens      2016-05-31  140  		free_reserved_page(pfn_to_page(addr >> PAGE_SHIFT));
2d0af2247906cf Heiko Carstens      2016-05-31  141  	size = begin - crashk_res.start;
2d0af2247906cf Heiko Carstens      2016-05-31  142  	if (size)
2d0af2247906cf Heiko Carstens      2016-05-31  143  		os_info_crashkernel_add(crashk_res.start, size);
2d0af2247906cf Heiko Carstens      2016-05-31  144  	else
2d0af2247906cf Heiko Carstens      2016-05-31  145  		os_info_crashkernel_add(0, 0);
2d0af2247906cf Heiko Carstens      2016-05-31  146  }
2d0af2247906cf Heiko Carstens      2016-05-31  147  
4e042af463f806 Heiko Carstens      2016-05-31  148  static void crash_protect_pages(int protect)
dab7a7b1538fec Michael Holzheu     2011-10-30  149  {
4e042af463f806 Heiko Carstens      2016-05-31  150  	unsigned long size;
dab7a7b1538fec Michael Holzheu     2011-10-30  151  
4e042af463f806 Heiko Carstens      2016-05-31  152  	if (!crashk_res.end)
4e042af463f806 Heiko Carstens      2016-05-31  153  		return;
4e042af463f806 Heiko Carstens      2016-05-31  154  	size = resource_size(&crashk_res);
4e042af463f806 Heiko Carstens      2016-05-31  155  	if (protect)
4e042af463f806 Heiko Carstens      2016-05-31  156  		set_memory_ro(crashk_res.start, size >> PAGE_SHIFT);
a9fbf1a53836d4 Michael Holzheu     2012-05-18  157  	else
4e042af463f806 Heiko Carstens      2016-05-31  158  		set_memory_rw(crashk_res.start, size >> PAGE_SHIFT);
dab7a7b1538fec Michael Holzheu     2011-10-30  159  }
dab7a7b1538fec Michael Holzheu     2011-10-30  160  
7a0058ec78602d Xunlei Pang         2016-05-23  161  void arch_kexec_protect_crashkres(void)
dab7a7b1538fec Michael Holzheu     2011-10-30  162  {
4e042af463f806 Heiko Carstens      2016-05-31  163  	crash_protect_pages(1);
dab7a7b1538fec Michael Holzheu     2011-10-30  164  }
dab7a7b1538fec Michael Holzheu     2011-10-30  165  
7a0058ec78602d Xunlei Pang         2016-05-23  166  void arch_kexec_unprotect_crashkres(void)
dab7a7b1538fec Michael Holzheu     2011-10-30  167  {
4e042af463f806 Heiko Carstens      2016-05-31  168  	crash_protect_pages(0);
dab7a7b1538fec Michael Holzheu     2011-10-30  169  }
dab7a7b1538fec Michael Holzheu     2011-10-30  170  
7a0058ec78602d Xunlei Pang         2016-05-23  171  #endif
7a0058ec78602d Xunlei Pang         2016-05-23  172  
60a0c68df2632f Michael Holzheu     2011-10-30  173  /*
60a0c68df2632f Michael Holzheu     2011-10-30  174   * Give back memory to hypervisor before new kdump is loaded
60a0c68df2632f Michael Holzheu     2011-10-30  175   */
60a0c68df2632f Michael Holzheu     2011-10-30  176  static int machine_kexec_prepare_kdump(void)
60a0c68df2632f Michael Holzheu     2011-10-30  177  {
60a0c68df2632f Michael Holzheu     2011-10-30  178  #ifdef CONFIG_CRASH_DUMP
60a0c68df2632f Michael Holzheu     2011-10-30  179  	if (MACHINE_IS_VM)
60a0c68df2632f Michael Holzheu     2011-10-30  180  		diag10_range(PFN_DOWN(crashk_res.start),
60a0c68df2632f Michael Holzheu     2011-10-30  181  			     PFN_DOWN(crashk_res.end - crashk_res.start + 1));
60a0c68df2632f Michael Holzheu     2011-10-30  182  	return 0;
60a0c68df2632f Michael Holzheu     2011-10-30  183  #else
60a0c68df2632f Michael Holzheu     2011-10-30  184  	return -EINVAL;
60a0c68df2632f Michael Holzheu     2011-10-30  185  #endif
60a0c68df2632f Michael Holzheu     2011-10-30  186  }
60a0c68df2632f Michael Holzheu     2011-10-30  187  
c6b5b847a7cf11 Heiko Carstens      2006-12-04 @188  int machine_kexec_prepare(struct kimage *image)
cf13f0eaffa31b Heiko Carstens      2005-06-25  189  {
c6b5b847a7cf11 Heiko Carstens      2006-12-04  190  	void *reboot_code_buffer;
cf13f0eaffa31b Heiko Carstens      2005-06-25  191  
60a0c68df2632f Michael Holzheu     2011-10-30 @192  	if (image->type == KEXEC_TYPE_CRASH)
60a0c68df2632f Michael Holzheu     2011-10-30  193  		return machine_kexec_prepare_kdump();
60a0c68df2632f Michael Holzheu     2011-10-30  194  
cf13f0eaffa31b Heiko Carstens      2005-06-25  195  	/* We don't support anything but the default image type for now. */
cf13f0eaffa31b Heiko Carstens      2005-06-25 @196  	if (image->type != KEXEC_TYPE_DEFAULT)
cf13f0eaffa31b Heiko Carstens      2005-06-25  197  		return -EINVAL;
cf13f0eaffa31b Heiko Carstens      2005-06-25  198  
cf13f0eaffa31b Heiko Carstens      2005-06-25  199  	/* Get the destination where the assembler code should be copied to.*/
39218bcf941ab1 Alexander Gordeev   2023-04-03  200  	reboot_code_buffer = page_to_virt(image->control_code_page);
cf13f0eaffa31b Heiko Carstens      2005-06-25  201  
cf13f0eaffa31b Heiko Carstens      2005-06-25  202  	/* Then copy it */
c6b5b847a7cf11 Heiko Carstens      2006-12-04  203  	memcpy(reboot_code_buffer, relocate_kernel, relocate_kernel_len);
cf13f0eaffa31b Heiko Carstens      2005-06-25  204  	return 0;
cf13f0eaffa31b Heiko Carstens      2005-06-25  205  }
cf13f0eaffa31b Heiko Carstens      2005-06-25  206  
c6b5b847a7cf11 Heiko Carstens      2006-12-04 @207  void machine_kexec_cleanup(struct kimage *image)
cf13f0eaffa31b Heiko Carstens      2005-06-25  208  {
cf13f0eaffa31b Heiko Carstens      2005-06-25  209  }
cf13f0eaffa31b Heiko Carstens      2005-06-25  210  
60a0c68df2632f Michael Holzheu     2011-10-30  211  void arch_crash_save_vmcoreinfo(void)
60a0c68df2632f Michael Holzheu     2011-10-30  212  {
4df29d2b9024d6 Alexander Gordeev   2022-07-20  213  	struct lowcore *abs_lc;
4df29d2b9024d6 Alexander Gordeev   2022-07-20  214  
60a0c68df2632f Michael Holzheu     2011-10-30  215  	VMCOREINFO_SYMBOL(lowcore_ptr);
7fe7a18cddf35f Michael Holzheu     2011-12-27  216  	VMCOREINFO_SYMBOL(high_memory);
60a0c68df2632f Michael Holzheu     2011-10-30  217  	VMCOREINFO_LENGTH(lowcore_ptr, NR_CPUS);
c78d0c7484f0a8 Heiko Carstens      2021-08-04  218  	vmcoreinfo_append_str("SAMODE31=%lx\n", __samode31);
c78d0c7484f0a8 Heiko Carstens      2021-08-04  219  	vmcoreinfo_append_str("EAMODE31=%lx\n", __eamode31);
b2d24b97b2a969 Gerald Schaefer     2019-02-03  220  	vmcoreinfo_append_str("KERNELOFFSET=%lx\n", kaslr_offset());
2154e0b3282d00 Alexander Gordeev   2022-12-19  221  	abs_lc = get_abs_lowcore();
4df29d2b9024d6 Alexander Gordeev   2022-07-20  222  	abs_lc->vmcore_info = paddr_vmcoreinfo_note();
2154e0b3282d00 Alexander Gordeev   2022-12-19  223  	put_abs_lowcore(abs_lc);
60a0c68df2632f Michael Holzheu     2011-10-30  224  }
60a0c68df2632f Michael Holzheu     2011-10-30  225  
c6b5b847a7cf11 Heiko Carstens      2006-12-04  226  void machine_shutdown(void)
cf13f0eaffa31b Heiko Carstens      2005-06-25  227  {
cf13f0eaffa31b Heiko Carstens      2005-06-25  228  }
cf13f0eaffa31b Heiko Carstens      2005-06-25  229  
48a8ca03f8fd49 Heiko Carstens      2012-08-27  230  void machine_crash_shutdown(struct pt_regs *regs)
48a8ca03f8fd49 Heiko Carstens      2012-08-27  231  {
3b9678472bab86 Vasily Gorbik       2018-04-04  232  	set_os_info_reipl_block();
48a8ca03f8fd49 Heiko Carstens      2012-08-27  233  }
48a8ca03f8fd49 Heiko Carstens      2012-08-27  234  
60a0c68df2632f Michael Holzheu     2011-10-30  235  /*
60a0c68df2632f Michael Holzheu     2011-10-30  236   * Do normal kexec
60a0c68df2632f Michael Holzheu     2011-10-30  237   */
60a0c68df2632f Michael Holzheu     2011-10-30  238  static void __do_machine_kexec(void *data)
cf13f0eaffa31b Heiko Carstens      2005-06-25  239  {
39218bcf941ab1 Alexander Gordeev   2023-04-03  240  	unsigned long data_mover, entry, diag308_subcode;
2c2df118a64407 Heiko Carstens      2010-02-26  241  	struct kimage *image = data;
cf13f0eaffa31b Heiko Carstens      2005-06-25  242  
39218bcf941ab1 Alexander Gordeev   2023-04-03  243  	data_mover = page_to_phys(image->control_code_page);
39218bcf941ab1 Alexander Gordeev   2023-04-03  244  	entry = virt_to_phys(&image->head);
2ba24343bdb863 Alexander Egorenkov 2021-09-03  245  	diag308_subcode = DIAG308_CLEAR_RESET;
2ba24343bdb863 Alexander Egorenkov 2021-09-03  246  	if (sclp.has_iplcc)
2ba24343bdb863 Alexander Egorenkov 2021-09-03  247  		diag308_subcode |= DIAG308_FLAG_EI;
7a04d491edf476 Alexander Gordeev   2023-04-03  248  	s390_reset_system();
7a04d491edf476 Alexander Gordeev   2023-04-03  249  
82caf7aba107db Alexander Gordeev   2023-04-03  250  	call_nodat(3, void, (relocate_kernel_t)data_mover,
82caf7aba107db Alexander Gordeev   2023-04-03  251  		   unsigned long, entry,
82caf7aba107db Alexander Gordeev   2023-04-03  252  		   unsigned long, image->start,
82caf7aba107db Alexander Gordeev   2023-04-03  253  		   unsigned long, diag308_subcode);
1a36a39e225d35 Martin Schwidefsky  2015-10-29  254  
1a36a39e225d35 Martin Schwidefsky  2015-10-29  255  	/* Die if kexec returns */
98587c2d894c34 Martin Schwidefsky  2019-04-30  256  	disabled_wait();
cf13f0eaffa31b Heiko Carstens      2005-06-25  257  }
2c2df118a64407 Heiko Carstens      2010-02-26  258  
60a0c68df2632f Michael Holzheu     2011-10-30  259  /*
60a0c68df2632f Michael Holzheu     2011-10-30  260   * Reset system and call either kdump or normal kexec
60a0c68df2632f Michael Holzheu     2011-10-30  261   */
60a0c68df2632f Michael Holzheu     2011-10-30  262  static void __machine_kexec(void *data)
60a0c68df2632f Michael Holzheu     2011-10-30  263  {
60a0c68df2632f Michael Holzheu     2011-10-30  264  	pfault_fini();
3ab121ab186692 Michael Holzheu     2012-03-11  265  	tracing_off();
3ab121ab186692 Michael Holzheu     2012-03-11  266  	debug_locks_off();
10ad34bc76dfbc Martin Schwidefsky  2015-01-14  267  #ifdef CONFIG_CRASH_DUMP
1a36a39e225d35 Martin Schwidefsky  2015-10-29  268  	if (((struct kimage *) data)->type == KEXEC_TYPE_CRASH)
1a36a39e225d35 Martin Schwidefsky  2015-10-29  269  		__machine_kdump(data);
10ad34bc76dfbc Martin Schwidefsky  2015-01-14  270  #endif
1a36a39e225d35 Martin Schwidefsky  2015-10-29  271  	__do_machine_kexec(data);
60a0c68df2632f Michael Holzheu     2011-10-30  272  }
60a0c68df2632f Michael Holzheu     2011-10-30  273  
60a0c68df2632f Michael Holzheu     2011-10-30  274  /*
60a0c68df2632f Michael Holzheu     2011-10-30  275   * Do either kdump or normal kexec. In case of kdump we first ask
60a0c68df2632f Michael Holzheu     2011-10-30  276   * purgatory, if kdump checksums are valid.
60a0c68df2632f Michael Holzheu     2011-10-30  277   */
2c2df118a64407 Heiko Carstens      2010-02-26 @278  void machine_kexec(struct kimage *image)
2c2df118a64407 Heiko Carstens      2010-02-26  279  {
60a0c68df2632f Michael Holzheu     2011-10-30 @280  	if (image->type == KEXEC_TYPE_CRASH && !kdump_csum_valid(image))

:::::: The code at line 192 was first introduced by commit
:::::: 60a0c68df2632feaa4a986af084650d1165d89c5 [S390] kdump backend code

:::::: TO: Michael Holzheu <holzheu@linux.vnet.ibm.com>
:::::: CC: Martin Schwidefsky <schwidefsky@de.ibm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
