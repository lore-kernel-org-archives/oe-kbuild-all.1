Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA74D800
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Nov 2024 00:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731456275; cv=none; b=RUmXyGFP5oPRwxbCC0CvtM4BJNQ/wq3Jb5Tctk1m80Hx1hv44uctiNtSQDmksXCX99F2z0ump4cFIvAc7plFFSozgsyGV6xYHuigG/y139fvcM1JzJt5O6rrEtVIto7vcZo24LAjsjxJQfwjPhroqUErE0YnnUnaCR4PXogQWpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731456275; c=relaxed/simple;
	bh=hr+JvaAOUR0aQ8+EOdfaOLuL9l6O4mSj8NnemXWwii0=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=g/+qA7n6wwVISnXTXUM+/MDQCzHYhNS4jSDHy8hIslvaaHihgD+rFQXOm9UnSqif9lAXLAmbI0hjc3Q1QwBbN3BnfNWFdzDhP/K4+dDcqaa3unVILUh/DqOVQDEtjTtfXi5b+WstjyPeNiVi88KGGgUcUNGcxrIa4jFEXE0nA48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AGNRE7ZO; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AGNRE7ZO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731456274; x=1762992274;
  h=date:from:cc:subject:message-id:mime-version;
  bh=hr+JvaAOUR0aQ8+EOdfaOLuL9l6O4mSj8NnemXWwii0=;
  b=AGNRE7ZOOW5hQazzTanz/hUsWgHCUkFfy4YdukIUDWQRDhmbPJM3aTss
   iIF+Ej2bFukoQ9NiDSfz4TwCUCoZ4pgmo2ARkW3UJi33U6fmEq1Ng/fIH
   F+VLXkTcqoyNv/HOYJgrPYFo0nrLMDu9h+PLoc373dwZ/eqEBkcbdFPCN
   7SEliRnu4YIO/grV2iFDVzhrvULgWSNGeXHm4O6Z9Z1BHLe3hpearUe/h
   o/AXzq5nFLH6CUA1xOmXP6yNcPHWN4/vG3nEffCFOSwTXEP/+lKnO6sMp
   4PuJeRAzyi6fPTMLHjfntHhlvRmHAhv45xLcIOn+9rCtNRUD8GE3nKkLm
   A==;
X-CSE-ConnectionGUID: A0/u/S2bQLOOCSe3xZySnQ==
X-CSE-MsgGUID: 3yslzrkiQOezeMp6m1NszA==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="31426783"
X-IronPort-AV: E=Sophos;i="6.12,149,1728975600"; 
   d="scan'208";a="31426783"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 16:04:33 -0800
X-CSE-ConnectionGUID: fJ89JTK/TyaX8uH5t/Bwqw==
X-CSE-MsgGUID: FtxBfpIZSAuIfL50586aoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,149,1728975600"; 
   d="scan'208";a="87852626"
Received: from lkp-server01.sh.intel.com (HELO bcfed0da017c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 12 Nov 2024 16:04:32 -0800
Received: from kbuild by bcfed0da017c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tB0s1-0001qv-2x
	for oe-kbuild-all@lists.linux.dev;
	Wed, 13 Nov 2024 00:04:29 +0000
Date: Wed, 13 Nov 2024 08:03:32 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:6.6/dovetail-xenomai 3837/13313]
 arch/x86/kernel/dumpstack.c:412:16: warning: operation on 'die_counter' may
 be undefined
Message-ID: <202411130711.w9B78q3F-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 6.6/dovetail-xenomai
head:   8025dd14d72f1eee946ab67036c7a3a569861654
commit: 09c7bb5439e48682e81937413314d9cf3759d81e [3837/13313] x86: irq_pipeline: add IRQ pipeline core
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20241113/202411130711.w9B78q3F-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241113/202411130711.w9B78q3F-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411130711.w9B78q3F-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/kernel.h:30,
                    from include/linux/cpumask.h:10,
                    from include/linux/mm_types_task.h:14,
                    from include/linux/mm_types.h:5,
                    from include/linux/buildid.h:5,
                    from include/linux/kallsyms.h:10,
                    from arch/x86/kernel/dumpstack.c:5:
   arch/x86/kernel/dumpstack.c: In function '__die_header':
   include/linux/kern_levels.h:17:25: warning: format '%s' expects argument of type 'char *', but argument 5 has type 'int' [-Wformat=]
      17 | #define KERN_DEFAULT    ""              /* the default kernel loglevel */
         |                         ^~
   include/linux/printk.h:450:25: note: in definition of macro 'printk_index_wrap'
     450 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   arch/x86/kernel/dumpstack.c:410:9: note: in expansion of macro 'printk'
     410 |         printk(KERN_DEFAULT
         |         ^~~~~~
   arch/x86/kernel/dumpstack.c:410:16: note: in expansion of macro 'KERN_DEFAULT'
     410 |         printk(KERN_DEFAULT
         |                ^~~~~~~~~~~~
>> include/linux/kern_levels.h:17:25: warning: too many arguments for format [-Wformat-extra-args]
      17 | #define KERN_DEFAULT    ""              /* the default kernel loglevel */
         |                         ^~
   include/linux/printk.h:450:25: note: in definition of macro 'printk_index_wrap'
     450 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   arch/x86/kernel/dumpstack.c:410:9: note: in expansion of macro 'printk'
     410 |         printk(KERN_DEFAULT
         |         ^~~~~~
   arch/x86/kernel/dumpstack.c:410:16: note: in expansion of macro 'KERN_DEFAULT'
     410 |         printk(KERN_DEFAULT
         |                ^~~~~~~~~~~~
>> arch/x86/kernel/dumpstack.c:412:16: warning: operation on 'die_counter' may be undefined [-Wsequence-point]
     412 |                ++die_counter, pr,
         |                ^~~~~~~~~~~~~
   include/linux/printk.h:450:33: note: in definition of macro 'printk_index_wrap'
     450 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
   arch/x86/kernel/dumpstack.c:410:9: note: in expansion of macro 'printk'
     410 |         printk(KERN_DEFAULT
         |         ^~~~~~
--
>> arch/x86/kernel/apic/apic.c:2184: warning: Function parameter or member 'spurious_interrupt' not described in 'DEFINE_IDTENTRY_IRQ_PIPELINED'
>> arch/x86/kernel/apic/apic.c:2184: warning: expecting prototype for spurious_interrupt(). Prototype was for DEFINE_IDTENTRY_IRQ_PIPELINED() instead


vim +/die_counter +412 arch/x86/kernel/dumpstack.c

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
09c7bb5439e486 Philippe Gerum   2019-04-24  411  	       "%s: %04lx [#%d]%s%s%s%s%s%s\n", str, err & 0xffff, ++die_counter,
cb376c26971ff5 Thomas Gleixner  2019-07-26 @412  	       pr,
8fad7ec51e1b9e Rasmus Villemoes 2016-03-26  413  	       IS_ENABLED(CONFIG_SMP)     ? " SMP"             : "",
8fad7ec51e1b9e Rasmus Villemoes 2016-03-26  414  	       debug_pagealloc_enabled()  ? " DEBUG_PAGEALLOC" : "",
5f26d76c3fd67c Vlastimil Babka  2017-12-19  415  	       IS_ENABLED(CONFIG_KASAN)   ? " KASAN"           : "",
5f26d76c3fd67c Vlastimil Babka  2017-12-19  416  	       IS_ENABLED(CONFIG_PAGE_TABLE_ISOLATION) ?
09c7bb5439e486 Philippe Gerum   2019-04-24  417  	       (boot_cpu_has(X86_FEATURE_PTI) ? " PTI" : " NOPTI") : "",
09c7bb5439e486 Philippe Gerum   2019-04-24  418  	       irqs_pipelined()           ? " IRQ_PIPELINE"    : "");
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
