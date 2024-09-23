Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B27415E86
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Sep 2024 23:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727133235; cv=none; b=AQmZhHcRfCfERq4GB+T3Uv6292iLL2djyVvGhf1hjpvWBzooVSXAbl2RQWa8deCsIInjhsvIlzTfmhqlTHXGiCGlsfVYi/4d3xHeTLqb3SsSdmXWU1ujOj+3NSx5+6Zo8I4xAfWtI92963lAdx2vW+ggSwGE4pMugv++MXND2Es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727133235; c=relaxed/simple;
	bh=o5kQ7ygSeOiY8EiT5fuiz2e6Sj7K2Z3qOeUSmYot60g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dgqfGc2L74JkWmIlxmJEusy44NuKD4EgDG0RAdI9EsC4rz2OnYFDcLr6WUkWs0130dppV217aw59wtwUX2VV4KyAfKZqIoZPVJc8fdQvkgsGSvFiVjHT9P/ezFbP5+SqCZBJn9+CI4QPxtwEDj6B+AaLGBMU1UmMkGplDwtTtb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j/+wAbES; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j/+wAbES"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727133233; x=1758669233;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=o5kQ7ygSeOiY8EiT5fuiz2e6Sj7K2Z3qOeUSmYot60g=;
  b=j/+wAbES9VSe8I3ElV1P97SfdjMREwA+ZYWYyScRgoDEPYyWDL1Idacz
   aKfNgDOyKwUgj1rZcRLLpJBRX9vnAGe/3YxdRw7LKOFUWOYgAgdqVPhMb
   sJHZfRrDQpfOXWUsicQbYWNIOWm5I0D4yrh+Bo3lGKSOQ+uFX/TfGfJgp
   lbzsjAm+0uZJq9ZsPLXKjmcmi2E4G0Uwyy2C3KJCK+wZcPn4+N4+UUjTX
   /9x+K0RUk71qhwvjMJ8gqzvqIfoPgUlwZxSBpIeX66V3jDC90NxDaWI46
   lCNNiIErH2RmayGrfusUjuOtstL3cVu3Ui4itl0YfPRks6LL1XGGC2XDW
   w==;
X-CSE-ConnectionGUID: Y2B57s+2SweUckdJDbspag==
X-CSE-MsgGUID: fN0gLO+4RYiy5/mjXWc80w==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="37480389"
X-IronPort-AV: E=Sophos;i="6.10,252,1719903600"; 
   d="scan'208";a="37480389"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2024 16:13:52 -0700
X-CSE-ConnectionGUID: C7mth036QFaPAAcJvTIoZQ==
X-CSE-MsgGUID: bgaf0r9BRmyA7NgiF99LGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,252,1719903600"; 
   d="scan'208";a="102055649"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 23 Sep 2024 16:13:48 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sssFW-000HgB-1F;
	Mon, 23 Sep 2024 23:13:46 +0000
Date: Tue, 24 Sep 2024 07:13:09 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/lts/5.4.119-20.0009.spr 724/2441]
 arch/x86/kernel/process_64.c:565:21: warning: unused variable 'next_fpu'
Message-ID: <202409240743.BTfO7jDF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009.spr
head:   63759dec7a1be60e43e98e4257de936b546e4656
commit: dbc859f83fd27348cbeab908585a7f8a646b9061 [724/2441] x86/fpu: Remove pointless argument from switch_fpu_finish()
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20240924/202409240743.BTfO7jDF-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240924/202409240743.BTfO7jDF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409240743.BTfO7jDF-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/x86/kernel/process_64.c: In function '__switch_to':
>> arch/x86/kernel/process_64.c:565:21: warning: unused variable 'next_fpu' [-Wunused-variable]
     565 |         struct fpu *next_fpu = &next->fpu;
         |                     ^~~~~~~~


vim +/next_fpu +565 arch/x86/kernel/process_64.c

513ad84bf60d96 arch/x86/kernel/process_64.c Ingo Molnar               2008-02-21  548  
^1da177e4c3f41 arch/x86_64/kernel/process.c Linus Torvalds            2005-04-16  549  /*
^1da177e4c3f41 arch/x86_64/kernel/process.c Linus Torvalds            2005-04-16  550   *	switch_to(x,y) should switch tasks from x to y.
^1da177e4c3f41 arch/x86_64/kernel/process.c Linus Torvalds            2005-04-16  551   *
^1da177e4c3f41 arch/x86_64/kernel/process.c Linus Torvalds            2005-04-16  552   * This could still be optimized:
^1da177e4c3f41 arch/x86_64/kernel/process.c Linus Torvalds            2005-04-16  553   * - fold all the options into a flag word and test it with a single test.
^1da177e4c3f41 arch/x86_64/kernel/process.c Linus Torvalds            2005-04-16  554   * - could test fs/gs bitsliced
099f318b8d9749 arch/x86_64/kernel/process.c Andi Kleen                2006-02-03  555   *
099f318b8d9749 arch/x86_64/kernel/process.c Andi Kleen                2006-02-03  556   * Kprobes not supported here. Set the probe on schedule instead.
8b96f011981896 arch/x86/kernel/process_64.c Frederic Weisbecker       2008-12-06  557   * Function graph tracer not supported too.
^1da177e4c3f41 arch/x86_64/kernel/process.c Linus Torvalds            2005-04-16  558   */
35ea7903b8a971 arch/x86/kernel/process_64.c Andi Kleen                2013-08-05  559  __visible __notrace_funcgraph struct task_struct *
a88cde13bae3ff arch/x86_64/kernel/process.c Andi Kleen                2005-11-05  560  __switch_to(struct task_struct *prev_p, struct task_struct *next_p)
^1da177e4c3f41 arch/x86_64/kernel/process.c Linus Torvalds            2005-04-16  561  {
87b935a0ef9a1d arch/x86/kernel/process_64.c Jeremy Fitzhardinge       2008-07-08  562  	struct thread_struct *prev = &prev_p->thread;
87b935a0ef9a1d arch/x86/kernel/process_64.c Jeremy Fitzhardinge       2008-07-08  563  	struct thread_struct *next = &next_p->thread;
d85fc9f855561e arch/x86/kernel/process_64.c Xinghui Li                2022-09-22  564  	struct fpu *prev_fpu = &prev->fpu;
d85fc9f855561e arch/x86/kernel/process_64.c Xinghui Li                2022-09-22 @565  	struct fpu *next_fpu = &next->fpu;
^1da177e4c3f41 arch/x86_64/kernel/process.c Linus Torvalds            2005-04-16  566  	int cpu = smp_processor_id();
e07e23e1fd3000 arch/x86_64/kernel/process.c Arjan van de Ven          2006-09-26  567  
1d3e53e8624a3e arch/x86/kernel/process_64.c Andy Lutomirski           2017-07-11  568  	WARN_ON_ONCE(IS_ENABLED(CONFIG_DEBUG_ENTRY) &&
1d3e53e8624a3e arch/x86/kernel/process_64.c Andy Lutomirski           2017-07-11  569  		     this_cpu_read(irq_count) != -1);
1d3e53e8624a3e arch/x86/kernel/process_64.c Andy Lutomirski           2017-07-11  570  
5f409e20b79456 arch/x86/kernel/process_64.c Rik van Riel              2019-04-03  571  	if (!test_thread_flag(TIF_NEED_FPU_LOAD))
d85fc9f855561e arch/x86/kernel/process_64.c Xinghui Li                2022-09-22  572  		switch_fpu_prepare(prev_fpu, cpu);
4903062b5485f0 arch/x86/kernel/process_64.c Linus Torvalds            2012-02-16  573  
478de5a9d691dd arch/x86/kernel/process_64.c Jeremy Fitzhardinge       2008-06-25  574  	/* We must save %fs and %gs before load_TLS() because
478de5a9d691dd arch/x86/kernel/process_64.c Jeremy Fitzhardinge       2008-06-25  575  	 * %fs and %gs may be cleared by load_TLS().
478de5a9d691dd arch/x86/kernel/process_64.c Jeremy Fitzhardinge       2008-06-25  576  	 *
478de5a9d691dd arch/x86/kernel/process_64.c Jeremy Fitzhardinge       2008-06-25  577  	 * (e.g. xen_load_tls())
478de5a9d691dd arch/x86/kernel/process_64.c Jeremy Fitzhardinge       2008-06-25  578  	 */
e137a4d8f4dd2e arch/x86/kernel/process_64.c Andy Lutomirski           2017-08-01  579  	save_fsgs(prev_p);
478de5a9d691dd arch/x86/kernel/process_64.c Jeremy Fitzhardinge       2008-06-25  580  
f647d7c155f069 arch/x86/kernel/process_64.c Andy Lutomirski           2014-12-08  581  	/*
f647d7c155f069 arch/x86/kernel/process_64.c Andy Lutomirski           2014-12-08  582  	 * Load TLS before restoring any segments so that segment loads
f647d7c155f069 arch/x86/kernel/process_64.c Andy Lutomirski           2014-12-08  583  	 * reference the correct GDT entries.
f647d7c155f069 arch/x86/kernel/process_64.c Andy Lutomirski           2014-12-08  584  	 */
^1da177e4c3f41 arch/x86_64/kernel/process.c Linus Torvalds            2005-04-16  585  	load_TLS(next, cpu);
^1da177e4c3f41 arch/x86_64/kernel/process.c Linus Torvalds            2005-04-16  586  
3fe0a63efd4437 arch/x86/kernel/process_64.c Jeremy Fitzhardinge       2008-06-25  587  	/*
f647d7c155f069 arch/x86/kernel/process_64.c Andy Lutomirski           2014-12-08  588  	 * Leave lazy mode, flushing any hypercalls made here.  This
f647d7c155f069 arch/x86/kernel/process_64.c Andy Lutomirski           2014-12-08  589  	 * must be done after loading TLS entries in the GDT but before
6dd677a044e606 arch/x86/kernel/process_64.c Sebastian Andrzej Siewior 2019-04-03  590  	 * loading segments that might reference them.
3fe0a63efd4437 arch/x86/kernel/process_64.c Jeremy Fitzhardinge       2008-06-25  591  	 */
224101ed69d3fb arch/x86/kernel/process_64.c Jeremy Fitzhardinge       2009-02-18  592  	arch_end_context_switch(next_p);
3fe0a63efd4437 arch/x86/kernel/process_64.c Jeremy Fitzhardinge       2008-06-25  593  
f647d7c155f069 arch/x86/kernel/process_64.c Andy Lutomirski           2014-12-08  594  	/* Switch DS and ES.
f647d7c155f069 arch/x86/kernel/process_64.c Andy Lutomirski           2014-12-08  595  	 *
f647d7c155f069 arch/x86/kernel/process_64.c Andy Lutomirski           2014-12-08  596  	 * Reading them only returns the selectors, but writing them (if
f647d7c155f069 arch/x86/kernel/process_64.c Andy Lutomirski           2014-12-08  597  	 * nonzero) loads the full descriptor from the GDT or LDT.  The
f647d7c155f069 arch/x86/kernel/process_64.c Andy Lutomirski           2014-12-08  598  	 * LDT for next is loaded in switch_mm, and the GDT is loaded
f647d7c155f069 arch/x86/kernel/process_64.c Andy Lutomirski           2014-12-08  599  	 * above.
f647d7c155f069 arch/x86/kernel/process_64.c Andy Lutomirski           2014-12-08  600  	 *
f647d7c155f069 arch/x86/kernel/process_64.c Andy Lutomirski           2014-12-08  601  	 * We therefore need to write new values to the segment
f647d7c155f069 arch/x86/kernel/process_64.c Andy Lutomirski           2014-12-08  602  	 * registers on every context switch unless both the new and old
f647d7c155f069 arch/x86/kernel/process_64.c Andy Lutomirski           2014-12-08  603  	 * values are zero.
f647d7c155f069 arch/x86/kernel/process_64.c Andy Lutomirski           2014-12-08  604  	 *
f647d7c155f069 arch/x86/kernel/process_64.c Andy Lutomirski           2014-12-08  605  	 * Note that we don't need to do anything for CS and SS, as
f647d7c155f069 arch/x86/kernel/process_64.c Andy Lutomirski           2014-12-08  606  	 * those are saved and restored as part of pt_regs.
f647d7c155f069 arch/x86/kernel/process_64.c Andy Lutomirski           2014-12-08  607  	 */
f647d7c155f069 arch/x86/kernel/process_64.c Andy Lutomirski           2014-12-08  608  	savesegment(es, prev->es);
f647d7c155f069 arch/x86/kernel/process_64.c Andy Lutomirski           2014-12-08  609  	if (unlikely(next->es | prev->es))
f647d7c155f069 arch/x86/kernel/process_64.c Andy Lutomirski           2014-12-08  610  		loadsegment(es, next->es);
f647d7c155f069 arch/x86/kernel/process_64.c Andy Lutomirski           2014-12-08  611  
f647d7c155f069 arch/x86/kernel/process_64.c Andy Lutomirski           2014-12-08  612  	savesegment(ds, prev->ds);
f647d7c155f069 arch/x86/kernel/process_64.c Andy Lutomirski           2014-12-08  613  	if (unlikely(next->ds | prev->ds))
f647d7c155f069 arch/x86/kernel/process_64.c Andy Lutomirski           2014-12-08  614  		loadsegment(ds, next->ds);
f647d7c155f069 arch/x86/kernel/process_64.c Andy Lutomirski           2014-12-08  615  
f4550b52e495e1 arch/x86/kernel/process_64.c Chang S. Bae              2018-09-18  616  	x86_fsgsbase_load(prev, next);
^1da177e4c3f41 arch/x86_64/kernel/process.c Linus Torvalds            2005-04-16  617  
8b8c9749f49cf7 arch/x86/kernel/process_64.c Chen Zhuo                 2021-11-01  618  	x86_pkru_load(prev, next);
8b8c9749f49cf7 arch/x86/kernel/process_64.c Chen Zhuo                 2021-11-01  619  
^1da177e4c3f41 arch/x86_64/kernel/process.c Linus Torvalds            2005-04-16  620  	/*
45948d7720e8bd arch/x86_64/kernel/process.c Jan Beulich               2006-03-25  621  	 * Switch the PDA and FPU contexts.
^1da177e4c3f41 arch/x86_64/kernel/process.c Linus Torvalds            2005-04-16  622  	 */
c6ae41e7d469f0 arch/x86/kernel/process_64.c Alex Shi                  2012-05-11  623  	this_cpu_write(current_task, next_p);
9aaefe7b59ae00 arch/x86/kernel/process_64.c Andy Lutomirski           2017-12-04  624  	this_cpu_write(cpu_current_top_of_stack, task_top_of_stack(next_p));
18bd057b1408cd arch/x86_64/kernel/process.c Andi Kleen                2006-04-20  625  
dbc859f83fd273 arch/x86/kernel/process_64.c Thomas Gleixner           2021-10-15  626  	switch_fpu_finish();
2722146eb78451 arch/x86/kernel/process_64.c Sebastian Andrzej Siewior 2019-04-03  627  
bd7dc5a6afac71 arch/x86/kernel/process_64.c Andy Lutomirski           2017-11-02  628  	/* Reload sp0. */
252e1a0526304f arch/x86/kernel/process_64.c Joerg Roedel              2018-07-18  629  	update_task_stack(next_p);
b27559a433bb60 arch/x86/kernel/process_64.c Andy Lutomirski           2015-03-06  630  
ff16701a29cba3 arch/x86/kernel/process_64.c Thomas Gleixner           2018-11-25  631  	switch_to_extra(prev_p, next_p);
^1da177e4c3f41 arch/x86_64/kernel/process.c Linus Torvalds            2005-04-16  632  

:::::: The code at line 565 was first introduced by commit
:::::: d85fc9f855561e22e2c6af706c640a16ffaba9ed Revert "x86/fpu: Correct pkru/xstate inconsistency"

:::::: TO: Xinghui Li <korantli@tencent.com>
:::::: CC: Jianping Liu <frankjpliu@tencent.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
