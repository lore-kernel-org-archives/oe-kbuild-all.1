Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 920B321745E
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Nov 2024 22:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731449962; cv=none; b=O7jDY/m9DZxMRPUHy+1DdfNcCRinvqRFGKFu3fHzHVJWUl94ZUkbpgnBXNsXtNFEhO+5IMtVaKqCTDiXpdk65zzBtz0HUdcka0HSbNwfVvlHpR1IVWc6PGpLxTV1TpeSnchsja7ZGcWLih/u4auodnzSq0skL9yfbBjK3DevN2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731449962; c=relaxed/simple;
	bh=HdJ9k0FB5z8DlUNb5womfVN9VPCvQsrMXWXwxjfRttc=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fri3V79sjTn1aUACzOUi3yAqTcRjrWHGNRDmGn53hFKnqxSggdWDVZTj15wm4Ty5x5g0ADDwnOrRChluf5SAfsogvpGRuIAEasQvTRT2d1KtoWi0e32qwcMuHp15kGQ1qZBV0HCLPqQzg0X9Oc4CTx6xu3W2o1S5i2fc7pZZDJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AZVfz7V0; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AZVfz7V0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731449960; x=1762985960;
  h=date:from:cc:subject:message-id:mime-version;
  bh=HdJ9k0FB5z8DlUNb5womfVN9VPCvQsrMXWXwxjfRttc=;
  b=AZVfz7V0uf2vdXoLVsws23GuM8J3WEvzQ2Iat191kIGvDXiyckQCtC0p
   FX2J71Fd0TO6XuYif/TZg2gqaOXJsULTYCNiRdnY8dvWxwTF/O8PMl6te
   5KOSJI5tQbywUenqDYkTnr1OwLX/ZQBnA1EIu5+YQOn7e7G9JcL7mSCDS
   liD26bZJhSz5vrmzRMj4dvDkScSrWA5NgaxHtiA84ptKBjniGAGXa9ThS
   PrWONsSHzA6gOYj4eWdt24rWshp0PXo1L/V7VI+hl8tp7Bt1eeL8tsvDs
   LZfW5sXtUgR7vSFTpD0p4EA/jIBrsUPq90NgdZwmJKaWHghFc2ibC0JKp
   A==;
X-CSE-ConnectionGUID: LcKHSSWqQSyUMrmGRuXItQ==
X-CSE-MsgGUID: MtXlDj7TTROuFPwbzqNOYA==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="31405531"
X-IronPort-AV: E=Sophos;i="6.12,149,1728975600"; 
   d="scan'208";a="31405531"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 14:19:19 -0800
X-CSE-ConnectionGUID: 977g/0CkTueLA5XHoOUkAA==
X-CSE-MsgGUID: YmNzmc4OQtSz5uKd3/u//A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,149,1728975600"; 
   d="scan'208";a="118608011"
Received: from lkp-server01.sh.intel.com (HELO bcfed0da017c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 12 Nov 2024 14:19:18 -0800
Received: from kbuild by bcfed0da017c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tAzEC-0001mb-0r
	for oe-kbuild-all@lists.linux.dev;
	Tue, 12 Nov 2024 22:19:16 +0000
Date: Wed, 13 Nov 2024 06:18:16 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:6.6/dovetail-xenomai 3837/13313]
 arch/x86/kernel/dumpstack.c:412:9: warning: format specifies type 'char *'
 but the argument has type 'int'
Message-ID: <202411130655.q66UaSkM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Philippe,

FYI, the error/warning still remains.

tree:   https://github.com/intel/linux-intel-lts.git 6.6/dovetail-xenomai
head:   8025dd14d72f1eee946ab67036c7a3a569861654
commit: 09c7bb5439e48682e81937413314d9cf3759d81e [3837/13313] x86: irq_pipeline: add IRQ pipeline core
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20241113/202411130655.q66UaSkM-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241113/202411130655.q66UaSkM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411130655.q66UaSkM-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/x86/kernel/dumpstack.c:5:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:2178:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> arch/x86/kernel/dumpstack.c:412:9: warning: format specifies type 'char *' but the argument has type 'int' [-Wformat]
     411 |                "%s: %04lx [#%d]%s%s%s%s%s%s\n", str, err & 0xffff, ++die_counter,
         |                                ~~
         |                                %d
     412 |                ++die_counter, pr,
         |                ^~~~~~~~~~~~~
   include/linux/printk.h:478:60: note: expanded from macro 'printk'
     478 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                     ~~~    ^~~~~~~~~~~
   include/linux/printk.h:450:19: note: expanded from macro 'printk_index_wrap'
     450 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ~~~~    ^~~~~~~~~~~
>> arch/x86/kernel/dumpstack.c:418:9: warning: data argument not used by format string [-Wformat-extra-args]
     410 |         printk(KERN_DEFAULT
         |         ~~~~~~~~~~~~~~~~~~~
     411 |                "%s: %04lx [#%d]%s%s%s%s%s%s\n", str, err & 0xffff, ++die_counter,
         |                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     412 |                ++die_counter, pr,
         |                ~~~~~~~~~~~~~~~~~~
     413 |                IS_ENABLED(CONFIG_SMP)     ? " SMP"             : "",
         |                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     414 |                debug_pagealloc_enabled()  ? " DEBUG_PAGEALLOC" : "",
         |                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     415 |                IS_ENABLED(CONFIG_KASAN)   ? " KASAN"           : "",
         |                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     416 |                IS_ENABLED(CONFIG_PAGE_TABLE_ISOLATION) ?
         |                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     417 |                (boot_cpu_has(X86_FEATURE_PTI) ? " PTI" : " NOPTI") : "",
         |                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     418 |                irqs_pipelined()           ? " IRQ_PIPELINE"    : "");
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/printk.h:478:60: note: expanded from macro 'printk'
     478 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
   include/linux/printk.h:450:19: note: expanded from macro 'printk_index_wrap'
     450 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ~~~~    ^
>> arch/x86/kernel/dumpstack.c:411:61: warning: multiple unsequenced modifications to 'die_counter' [-Wunsequenced]
     411 |                "%s: %04lx [#%d]%s%s%s%s%s%s\n", str, err & 0xffff, ++die_counter,
         |                                                                    ^
     412 |                ++die_counter, pr,
         |                ~~
   include/linux/printk.h:478:60: note: expanded from macro 'printk'
     478 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                            ^~~~~~~~~~~
   include/linux/printk.h:450:19: note: expanded from macro 'printk_index_wrap'
     450 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
   8 warnings generated.


vim +412 arch/x86/kernel/dumpstack.c

878719e831d9e07 Neil Horman      2008-10-23  396  
aa49f20462c90df Jann Horn        2019-12-19  397  static void __die_header(const char *str, struct pt_regs *regs, long err)
878719e831d9e07 Neil Horman      2008-10-23  398  {
cb376c26971ff54 Thomas Gleixner  2019-07-26  399  	const char *pr = "";
cb376c26971ff54 Thomas Gleixner  2019-07-26  400  
09c7bb5439e4868 Philippe Gerum   2019-04-24  401  	irq_pipeline_oops();
09c7bb5439e4868 Philippe Gerum   2019-04-24  402  
602bd705da334f2 Borislav Petkov  2018-04-17  403  	/* Save the regs of the first oops for the executive summary later. */
602bd705da334f2 Borislav Petkov  2018-04-17  404  	if (!die_counter)
602bd705da334f2 Borislav Petkov  2018-04-17  405  		exec_summary_regs = *regs;
602bd705da334f2 Borislav Petkov  2018-04-17  406  
cb376c26971ff54 Thomas Gleixner  2019-07-26  407  	if (IS_ENABLED(CONFIG_PREEMPTION))
cb376c26971ff54 Thomas Gleixner  2019-07-26  408  		pr = IS_ENABLED(CONFIG_PREEMPT_RT) ? " PREEMPT_RT" : " PREEMPT";
cb376c26971ff54 Thomas Gleixner  2019-07-26  409  
b0f4c4b32c8e3aa Prarit Bhargava  2012-01-26  410  	printk(KERN_DEFAULT
09c7bb5439e4868 Philippe Gerum   2019-04-24 @411  	       "%s: %04lx [#%d]%s%s%s%s%s%s\n", str, err & 0xffff, ++die_counter,
cb376c26971ff54 Thomas Gleixner  2019-07-26 @412  	       pr,
8fad7ec51e1b9e2 Rasmus Villemoes 2016-03-26  413  	       IS_ENABLED(CONFIG_SMP)     ? " SMP"             : "",
8fad7ec51e1b9e2 Rasmus Villemoes 2016-03-26  414  	       debug_pagealloc_enabled()  ? " DEBUG_PAGEALLOC" : "",
5f26d76c3fd67c4 Vlastimil Babka  2017-12-19  415  	       IS_ENABLED(CONFIG_KASAN)   ? " KASAN"           : "",
5f26d76c3fd67c4 Vlastimil Babka  2017-12-19  416  	       IS_ENABLED(CONFIG_PAGE_TABLE_ISOLATION) ?
09c7bb5439e4868 Philippe Gerum   2019-04-24  417  	       (boot_cpu_has(X86_FEATURE_PTI) ? " PTI" : " NOPTI") : "",
09c7bb5439e4868 Philippe Gerum   2019-04-24 @418  	       irqs_pipelined()           ? " IRQ_PIPELINE"    : "");
aa49f20462c90df Jann Horn        2019-12-19  419  }
aa49f20462c90df Jann Horn        2019-12-19  420  NOKPROBE_SYMBOL(__die_header);
8fad7ec51e1b9e2 Rasmus Villemoes 2016-03-26  421  

:::::: The code at line 412 was first introduced by commit
:::::: cb376c26971ff54f25980ec1f0ae2f06d6a69df0 x86/dumpstack: Indicate PREEMPT_RT in dumps

:::::: TO: Thomas Gleixner <tglx@linutronix.de>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
