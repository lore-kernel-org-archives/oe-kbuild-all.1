Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 209A615855D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 10 Aug 2024 13:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723298246; cv=none; b=Fk3uMKO+zVbr9SdWdUOW4QSHVMfsrru54NjxwQotUTVreQnn0l/Z1/MHag+4N3hLVd3hVaycEpApPNKjt9azj5pqh27HJiKaV22skfu3KTWQBXpO0kbRa/CRaptipHRqvzYe4HOvnqTv84Hz9H5QsekZkcl76bpQFsW7QNz37jE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723298246; c=relaxed/simple;
	bh=+HfYHGqVoxqbuUbVMEKGf75m69T/eD0Ym0/6EcLHHHQ=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hptCQyqWtuOU/eRR4/X/A+llw0IeGJLYD07QTI1KBtscOOXgwuaUMt/KeNx09DKH1H2POwvdLg6XOkiGwOddkdunkiTXETH12WQ4Md1OiFi9caoh1SKI6hLNxWSf9w2jZdtF4Wl/fVAW2jBSKf53QEaM213wxXXwaZo4JKpX0FE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LKkx3KSp; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LKkx3KSp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723298245; x=1754834245;
  h=date:from:cc:subject:message-id:mime-version;
  bh=+HfYHGqVoxqbuUbVMEKGf75m69T/eD0Ym0/6EcLHHHQ=;
  b=LKkx3KSp/jl7PlZ9W8TG4lefk0B9zkQsPGl1EcXWR2afIl8RcjWXe+6J
   SqKKaqUBiOCssYgsw3DJJfCuxg8toILgxnsPFgbNeodxqp4PV4aLqibtu
   B35FdDDOBjHzYoh6nhF7LKW8Q1juHmtvG5FHYZSRh2BSpBAPR+asoOcua
   TA5DSq1ybVFh4P0WLncraZM1VhhFb8q0f5Orlf/lLmG/JRNLH1JGiPMDu
   KdeCSPjxBd6Vxv6eKN0QzDX7Ewvy1VCiL7Edmvcm01BCoqai7qIEhS2Lw
   47Z2YO/GO2YLc+MBANttQ5WBnFFEwcK+bNaA0QbR7/ecjrUS8JnZjYYyD
   w==;
X-CSE-ConnectionGUID: +UZuyShDTdquzDrMDvUESQ==
X-CSE-MsgGUID: wilM97NSR9KyyIWOqNOjFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11160"; a="25258306"
X-IronPort-AV: E=Sophos;i="6.09,279,1716274800"; 
   d="scan'208";a="25258306"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2024 06:57:24 -0700
X-CSE-ConnectionGUID: ZSifN+E4TZmJwV9ig5XfaQ==
X-CSE-MsgGUID: 4QVXVwWjSoGyW+MMZfuteQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,279,1716274800"; 
   d="scan'208";a="62226948"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 10 Aug 2024 06:57:22 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1scmau-0009zK-12
	for oe-kbuild-all@lists.linux.dev;
	Sat, 10 Aug 2024 13:57:20 +0000
Date: Sat, 10 Aug 2024 21:57:10 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:6.6/dovetail-xenomai 3720/9574]
 arch/x86/kernel/dumpstack.c:412:9: warning: format specifies type 'char *'
 but the argument has type 'int'
Message-ID: <202408102153.qPDRn0SD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 6.6/dovetail-xenomai
head:   c2530fc7095f682dd411b807a75445d3ff3b0d7c
commit: 09c7bb5439e48682e81937413314d9cf3759d81e [3720/9574] x86: irq_pipeline: add IRQ pipeline core
config: i386-buildonly-randconfig-002-20240810 (https://download.01.org/0day-ci/archive/20240810/202408102153.qPDRn0SD-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240810/202408102153.qPDRn0SD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408102153.qPDRn0SD-lkp@intel.com/

All warnings (new ones prefixed by >>):

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
   3 warnings generated.


vim +412 arch/x86/kernel/dumpstack.c

878719e831d9e0 Neil Horman      2008-10-23  396  
aa49f20462c90d Jann Horn        2019-12-19  397  static void __die_header(const char *str, struct pt_regs *regs, long err)
878719e831d9e0 Neil Horman      2008-10-23  398  {
cb376c26971ff5 Thomas Gleixner  2019-07-26  399  	const char *pr = "";
cb376c26971ff5 Thomas Gleixner  2019-07-26  400  
09c7bb5439e486 Philippe Gerum   2019-04-24  401  	irq_pipeline_oops();
09c7bb5439e486 Philippe Gerum   2019-04-24  402  
602bd705da334f Borislav Petkov  2018-04-17  403  	/* Save the regs of the first oops for the executive summary later. */
602bd705da334f Borislav Petkov  2018-04-17  404  	if (!die_counter)
602bd705da334f Borislav Petkov  2018-04-17  405  		exec_summary_regs = *regs;
602bd705da334f Borislav Petkov  2018-04-17  406  
cb376c26971ff5 Thomas Gleixner  2019-07-26  407  	if (IS_ENABLED(CONFIG_PREEMPTION))
cb376c26971ff5 Thomas Gleixner  2019-07-26  408  		pr = IS_ENABLED(CONFIG_PREEMPT_RT) ? " PREEMPT_RT" : " PREEMPT";
cb376c26971ff5 Thomas Gleixner  2019-07-26  409  
b0f4c4b32c8e3a Prarit Bhargava  2012-01-26  410  	printk(KERN_DEFAULT
09c7bb5439e486 Philippe Gerum   2019-04-24 @411  	       "%s: %04lx [#%d]%s%s%s%s%s%s\n", str, err & 0xffff, ++die_counter,
cb376c26971ff5 Thomas Gleixner  2019-07-26 @412  	       pr,
8fad7ec51e1b9e Rasmus Villemoes 2016-03-26  413  	       IS_ENABLED(CONFIG_SMP)     ? " SMP"             : "",
8fad7ec51e1b9e Rasmus Villemoes 2016-03-26  414  	       debug_pagealloc_enabled()  ? " DEBUG_PAGEALLOC" : "",
5f26d76c3fd67c Vlastimil Babka  2017-12-19  415  	       IS_ENABLED(CONFIG_KASAN)   ? " KASAN"           : "",
5f26d76c3fd67c Vlastimil Babka  2017-12-19  416  	       IS_ENABLED(CONFIG_PAGE_TABLE_ISOLATION) ?
09c7bb5439e486 Philippe Gerum   2019-04-24  417  	       (boot_cpu_has(X86_FEATURE_PTI) ? " PTI" : " NOPTI") : "",
09c7bb5439e486 Philippe Gerum   2019-04-24 @418  	       irqs_pipelined()           ? " IRQ_PIPELINE"    : "");
aa49f20462c90d Jann Horn        2019-12-19  419  }
aa49f20462c90d Jann Horn        2019-12-19  420  NOKPROBE_SYMBOL(__die_header);
8fad7ec51e1b9e Rasmus Villemoes 2016-03-26  421  

:::::: The code at line 412 was first introduced by commit
:::::: cb376c26971ff54f25980ec1f0ae2f06d6a69df0 x86/dumpstack: Indicate PREEMPT_RT in dumps

:::::: TO: Thomas Gleixner <tglx@linutronix.de>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
